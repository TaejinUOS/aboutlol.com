/**
 * 패치노트 역추적 라벨로 티어 가중치를 학습하고 평가한다.
 *
 *   npx tsx scripts/tier-model/train.ts
 *   npx tsx scripts/tier-model/train.ts --lambda 5      # 사전 가중치를 더 믿는다
 *
 * 입력: data/tier-model/{patch-changes,operator-metrics,pro-presence,releases}.json,
 *       snapshots/<패치>/all.json (다섯 구간 합계 — 구간별 파일은 학습에 쓰지 않는다)
 * 출력: src/data/generated/tier-model.json
 *
 * 학습 행이 없으면 사전 가중치만 담은 모델(status: prior-only)을 쓴다. 이 모델은 산식 확인용이며
 * 공개 티어로 쓰지 않는다 (PRD_TIER_LIST.md 11장: 실제 근거 데이터가 준비된 뒤 공개).
 */
import { writeFileSync } from "node:fs";
import path from "node:path";

import { buildTrainingRows } from "../../src/lib/tierModel/dataset";
import { FEATURES } from "../../src/lib/tierModel/features";
import { evaluate, LABEL_NAMES, priorModel, train, type TierModel } from "../../src/lib/tierModel/model";
import { PATCHES } from "../../src/lib/tierModel/patches";
import { tierCuts } from "../../src/lib/tierModel/score";

import { loadInputs, MODEL_FILE as OUT, ROOT } from "./io";

function arg(name: string): number | undefined {
  const i = process.argv.indexOf(name);
  return i === -1 ? undefined : Number(process.argv[i + 1]);
}

function main() {
  const lambda = arg("--lambda") ?? 2;
  const inputs = loadInputs();
  const snapshots = inputs.snapshots;

  const rows = buildTrainingRows(inputs);
  const version = `tier-${new Date().toISOString().slice(0, 10)}-${rows.length}r`;
  const lines = new Set(snapshots.filter((s) => s.bracket === "all").map((s) => s.line));
  console.log(`라벨 ${inputs.changes.length}건 / 스냅숏 ${lines.size}개 패치 / 학습 행 ${rows.length}`);

  let model: TierModel;
  if (!rows.length) {
    model = priorModel(version);
    console.log("\n학습 행이 없습니다 — 패치 스냅숏(승률·밴율 등)이 라벨이 있는 패치에 하나도 없습니다.");
    console.log("사전 가중치만 담은 모델을 씁니다 (status: prior-only). 공개 티어로 쓰지 마세요.");
  } else {
    const order = PATCHES.map((p) => p.line);
    const report = evaluate(rows, order, { lambda });
    model = { ...train(rows, { lambda, version }), metrics: report };
    const counts = model.training.labels;
    console.log(`라벨 분포: ${LABEL_NAMES.map((n) => `${n} ${counts[n]}`).join(", ")}`);
    if (report) {
      console.log(`\n시간 순 검증 (${report.folds}개 패치, ${report.rows}행)`);
      console.log(`  로그 손실 ${report.logLoss.toFixed(4)} (기준선 ${report.baselineLogLoss.toFixed(4)} — 낮을수록 좋음)`);
      console.log(`  AUC 너프 ${report.aucNerf.toFixed(3)} / 버프 ${report.aucBuff.toFixed(3)} (0.5 = 무작위)`);
      console.log(`  Precision@k 너프 ${report.precisionAtKNerf.toFixed(3)} / 버프 ${report.precisionAtKBuff.toFixed(3)}`);
    } else {
      console.log("\n검증할 만큼 패치가 많지 않습니다 (앞선 패치 4개 이상 필요). 가중치는 참고만 하세요.");
    }
  }

  console.log("\n지표                    역할      가중치   사전값   관측 행");
  for (const f of FEATURES) {
    const p = model.features[f.id];
    console.log(
      `${f.label.padEnd(14, "　")} ${f.role.padEnd(8)} ${p.weight.toFixed(3).padStart(7)} ${f.prior.toFixed(2).padStart(7)} ${String(p.observed).padStart(7)}`,
    );
  }
  const cuts = tierCuts(model);
  console.log(`\nb = ${model.bias.toFixed(3)}, 등급 경계(S/1/2/3/4 하한) = ${cuts.map((c) => c.toFixed(2)).join(" / ")}`);

  writeFileSync(OUT, `${JSON.stringify(model, null, 1)}\n`);
  console.log(`\n→ ${path.relative(ROOT, OUT)} (${model.status})`);
}

main();
