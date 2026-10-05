/**
 * 티어 모델 점검. 실제 자료가 아니라 **정답 가중치를 아는 합성 자료**로 학습기를 검사한다.
 * 합성 자료는 이 스크립트 안에서만 쓰고 파일로 남기지 않는다 (제품 데이터가 아니다).
 *
 *   npx tsx scripts/check-tier-model.ts
 */
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";

import { publishGate, scoreSnapshot } from "../src/lib/tierModel/board";
import { historyFor, labelFor, type PatchChange } from "../src/lib/tierModel/dataset";
import { FEATURE_IDS, rawFeatures, type ChampionInput, type FeatureId } from "../src/lib/tierModel/features";
import { auc, evaluate, linearScore, priorModel, train, type Label, type TrainingRow } from "../src/lib/tierModel/model";
import { classifyChange, lineDirection } from "../src/lib/tierModel/patchNotes";
import { PATCHES } from "../src/lib/tierModel/patches";
import { calculateChampionScore, tierOf } from "../src/lib/tierModel/score";

// ---------------------------------------------------------------- 패치노트 판정
assert.equal(lineDirection("Cooldown: 20 / 18 / 16 ⇒ 18 / 16 / 14"), 1, "재사용 대기시간 감소는 버프");
assert.equal(lineDirection("Mana Cost: 50 ⇒ 60"), -1, "마나 소모 증가는 너프");
assert.equal(lineDirection("Damage: 60 / 90 (+50% AP) ⇒ 70 / 100 (+50% AP)"), 1);
assert.equal(lineDirection("Cooldown Refund: 1 ⇒ 2"), 1, "환급은 클수록 좋다");
assert.equal(lineDirection("First hit Damage : 35-75 ⇒ 35-55"), -1, "레벨 구간의 -는 음수가 아니다");
assert.equal(
  classifyChange({ ddragonId: "X", section: "champions", context: "X is too strong, so we're toning him down.", lines: ["Damage: 80 ⇒ 70"] }).direction,
  "nerf",
);
assert.equal(
  classifyChange({ ddragonId: "X", section: "champions", context: "X is struggling.", lines: ["Damage: 70 ⇒ 80"] }).direction,
  "buff",
);

// ---------------------------------------------------------------- 시간 맞추기
const line = (name: string) => PATCHES.find((p) => p.name === name)!.line;
const changes: PatchChange[] = [
  { patch: "26.10", line: line("26.10"), section: "champions", champion: "ahri", direction: "nerf" },
  { patch: "26.10", line: line("26.10"), section: "mid-patch", champion: "ahri", direction: "buff" },
  { patch: "26.11", line: line("26.11"), section: "champions", champion: "ahri", direction: "nerf" },
];
// 26.10 스냅숏의 라벨 = 26.10 도중의 패치 중간(버프) + 26.11 본문(너프) → 엇갈려 유지
assert.equal(labelFor(changes, "ahri", line("26.10")), 1);
// 26.9 스냅숏의 라벨 = 26.10 본문 너프
assert.equal(labelFor(changes, "ahri", line("26.9")), 2);
// 26.10 스냅숏의 입력에는 26.10 본문 너프만 있고, 같은 패치 중간 버프(라벨)는 없다
const h = historyFor(changes, "ahri", line("26.10"));
assert.equal(h.recentNerfs, 1);
assert.equal(h.recentBuffs, 0, "라벨에 쓰는 변경이 입력으로 새면 안 된다");
// 시즌 시작 패치는 라벨에서 뺀다
assert.equal(labelFor(changes, "ahri", line("25.24")), null);
// 다음 패치노트가 아직 없으면 라벨이 없다
assert.equal(labelFor(changes, "ahri", PATCHES[PATCHES.length - 1].line), null);

// ---------------------------------------------------------------- 합성 자료로 학습기 검사
let seed = 42;
const rand = () => (seed = (seed * 16807) % 2147483647) / 2147483647;
const gauss = () => Math.sqrt(-2 * Math.log(rand() + 1e-12)) * Math.cos(2 * Math.PI * rand());

function synthInput(): ChampionInput {
  const games = 300 + Math.floor(rand() * 3000);
  const wr = 0.5 + gauss() * 0.02;
  return {
    games, wins: Math.round(games * wr),
    pickRate: Math.exp(-4 + gauss()), banRate: Math.exp(-4 + gauss()),
    eliteWinRate: null, diamondWinRate: null, prevWinRate: wr - gauss() * 0.01, prevPickRate: null,
    flexPositions: 1 + Math.floor(rand() * 2),
    mastery: rand() < 0.2 ? 0.7 + rand() * 0.3 : rand() * 0.3,
    proPresence: rand() < 0.15 ? 0.3 + rand() * 0.6 : rand() * 0.1,
    difficulty: rand(), blindPick: rand(),
    recentNerfs: rand() < 0.1 ? 1 : 0, recentBuffs: rand() < 0.1 ? 1 : 0,
    patchesSinceChange: Math.floor(rand() * 10), newChampion: rand() < 0.02,
  };
}

// 정답 세계: 라이엇은 승률·밴율·대회를 보고, 장인 승률은 깎아 보고, 직전 너프 뒤엔 기다린다.
const TRUE: Partial<Record<FeatureId, number>> = {
  winRate: 1.4, banRate: 0.8, proPresence: 0.7, masteryWinDiscount: -0.8, proLowWinCover: 0.6, recentNerfs: -0.6,
};
const synthRows: TrainingRow[] = [];
const synthPatches = Array.from({ length: 24 }, (_, i) => `syn.${i}`);
// 표준화를 위해 먼저 원본을 모은다.
const pool = synthPatches.flatMap((patch) => Array.from({ length: 150 }, () => ({ patch, raw: rawFeatures(synthInput()) })));
const moments = Object.fromEntries(
  FEATURE_IDS.map((id) => {
    const v = pool.map((p) => p.raw[id]).filter((x): x is number => x !== null);
    const m = v.reduce((a, b) => a + b, 0) / v.length;
    const sd = Math.sqrt(v.reduce((a, x) => a + (x - m) ** 2, 0) / (v.length - 1)) || 1;
    return [id, { m, sd }];
  }),
) as Record<FeatureId, { m: number; sd: number }>;
for (const { patch, raw } of pool) {
  const s = (Object.entries(TRUE) as [FeatureId, number][]).reduce(
    (a, [id, w]) => a + w * (((raw[id] ?? moments[id].m) - moments[id].m) / moments[id].sd), 0,
  ) + gauss() * 0.5;
  const label: Label = s > 2.6 ? 2 : s < -2.6 ? 0 : 1; // 패치당 몇 명만 손댄다
  synthRows.push({ patch, champion: `c${synthRows.length}`, position: "mid", raw, label });
}
const counts = [0, 1, 2].map((k) => synthRows.filter((r) => r.label === k).length);
assert.ok(counts[0] > 50 && counts[2] > 50, `합성 라벨 분포가 너무 치우침: ${counts}`);

const model = train(synthRows, { lambda: 2, iterations: 2000 });
for (const [id, w] of Object.entries(TRUE) as [FeatureId, number][]) {
  assert.equal(Math.sign(model.features[id].weight), Math.sign(w), `${id} 가중치 부호를 복원하지 못함: ${model.features[id].weight}`);
}
const scores = synthRows.map((r) => linearScore(model, r.raw));
assert.ok(auc(scores, synthRows.map((r) => r.label === 2)) > 0.9, "너프 AUC가 낮다");
assert.ok(auc(scores.map((s) => -s), synthRows.map((r) => r.label === 0)) > 0.9, "버프 AUC가 낮다");

const report = evaluate(synthRows, synthPatches, { lambda: 2, iterations: 600, minTrainPatches: 18 })!;
assert.ok(report.logLoss < report.baselineLogLoss, "검증 로그 손실이 기준선보다 나쁘다");
assert.ok(report.aucNerf > 0.85 && report.aucBuff > 0.85, `검증 AUC ${report.aucNerf} / ${report.aucBuff}`);

// ---------------------------------------------------------------- 점수 계약
const sample = synthRows[0].raw;
const a = calculateChampionScore(sample, 1000, model);
const b = calculateChampionScore(sample, 1000, model);
assert.deepEqual(a, b, "같은 입력은 같은 결과");
assert.ok(a.score !== null && a.tier !== null);
// 통제 지표는 점수에 들어가지 않는다
for (const f of a.factors.filter((x) => ["recentNerfs", "recentBuffs", "patchesSinceChange", "newChampion"].includes(x.id))) {
  assert.equal(f.status, "해당 없음");
  assert.equal(f.contribution, 0);
}
// 토글로 끈 지표는 기여 0, 끌 수 없는 승률은 꺼지지 않는다
const off = calculateChampionScore(sample, 1000, model, new Set<FeatureId>(["banRate", "winRate"]));
assert.equal(off.factors.find((f) => f.id === "banRate")!.status, "사용자가 제외");
assert.equal(off.factors.find((f) => f.id === "winRate")!.status, "적용");
// 표본이 적으면 점수를 만들지 않는다
const few = calculateChampionScore(sample, 20, model);
assert.equal(few.score, null);
assert.equal(few.tier, null);
// 결측은 0이 아니라 '데이터 부족'
const missing = calculateChampionScore({ ...sample, proPresence: null, proLowWinCover: null }, 1000, model);
assert.equal(missing.factors.find((f) => f.id === "proPresence")!.status, "데이터 부족");
// 등급 경계는 겹치지 않고 모든 점수를 분류한다
for (const s of [-99, -1, 0, 1, 99]) assert.ok(tierOf(s, model));
assert.equal(tierOf(99, model), "S");
assert.equal(tierOf(-99, model), "5");

// ---------------------------------------------------------------- 공개 기준과 구간 채점
const prior = priorModel();
assert.equal(prior.status, "prior-only");
assert.equal(publishGate(prior).ok, false, "사전 가중치만 있는 모델은 공개하지 않는다");
assert.equal(publishGate({ ...model, metrics: null }).ok, false, "검증 결과 없이 공개하지 않는다");
assert.equal(publishGate({ ...model, metrics: report }).ok, true);
assert.equal(publishGate({ ...model, metrics: { ...report, aucNerf: 0.52 } }).ok, false, "무작위에 가까우면 공개하지 않는다");
const board = scoreSnapshot(
  { line: line("26.10"), bracket: "emerald", source: "check", matches: 1000, rows: [
    { champion: "ahri", position: "mid", games: 900, wins: 500, pickRate: 0.08, banRate: 0.05, eliteWinRate: null, diamondWinRate: null, flexPositions: 1 },
    { champion: "zoe", position: "mid", games: 40, wins: 30, pickRate: 0.004, banRate: 0.01, eliteWinRate: null, diamondWinRate: null, flexPositions: 1 },
  ] },
  undefined, { changes, operator: {}, pro: {}, releases: {} }, model,
);
assert.ok(board[0].tier !== null && board[0].bracket === "emerald");
assert.equal(board[1].tier, null, "표본이 적으면 구간 보드에서도 등급을 주지 않는다");
const labels = JSON.parse(readFileSync("data/tier-model/patch-changes.json", "utf8")) as { direction: string; method: string }[];
assert.ok(labels.length > 500, "패치노트 라벨이 너무 적다");
assert.ok(!labels.some((l) => l.method === "review"), "검토되지 않은 라벨이 남아 있다 — label-overrides.json");

console.log("tier model ok", {
  synthetic: { rows: synthRows.length, labels: counts, aucNerf: report.aucNerf.toFixed(3), aucBuff: report.aucBuff.toFixed(3) },
  weights: Object.fromEntries(Object.keys(TRUE).map((id) => [id, model.features[id as FeatureId].weight.toFixed(2)])),
  patchLabels: labels.length,
});
