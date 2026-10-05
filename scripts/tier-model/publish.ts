/**
 * 최신 패치의 구간별 스냅숏을 학습된 모델로 채점해 `tier_scores`에 통째로 넣는다.
 *
 *   npm run tier:publish                     # 로컬 D1 (검증을 통과한 모델만)
 *   npm run tier:publish -- --remote         # 운영 D1 (검증을 통과한 모델만)
 *   npm run tier:publish -- --unvalidated    # 로컬 화면 확인용. 검증 전 모델도 넣는다 (운영에는 불가)
 *   npm run tier:publish -- --clear [--remote]  # 공개 점수를 모두 내린다
 *
 * 화면은 이 표에 행이 있는 구간만 보여 주고, 없으면 "준비 중"이다.
 */
import { mkdirSync, writeFileSync } from "node:fs";
import path from "node:path";
import { getPlatformProxy } from "wrangler";

import { BRACKET_SLUGS } from "../../src/data/brackets";
import { publishGate, scoreSnapshot, type BoardRow } from "../../src/lib/tierModel/board";
import { previousSnapshot } from "../../src/lib/tierModel/dataset";
import { comparePatch } from "../../src/lib/buildCollector";

import { loadInputs, loadModel, ROOT } from "./io";

async function main() {
  const remote = process.argv.includes("--remote");
  const unvalidated = process.argv.includes("--unvalidated");
  const clear = process.argv.includes("--clear");
  if (remote && unvalidated) throw new Error("검증 전 모델은 운영에 공개할 수 없습니다.");

  const rows: BoardRow[] = [];
  let modelVersion = "";
  let patch = "";
  if (!clear) {
    const model = loadModel();
    const gate = publishGate(model);
    if (!gate.ok && !unvalidated) throw new Error(`공개 보류: ${gate.reason}`);
    if (!gate.ok) console.warn(`! 검증 전 모델로 로컬에만 넣습니다: ${gate.reason}`);
    const inputs = loadInputs();
    const bracketSnapshots = inputs.snapshots.filter((s) => (BRACKET_SLUGS as readonly string[]).includes(s.bracket));
    patch = bracketSnapshots.map((s) => s.line).sort(comparePatch).at(-1) ?? "";
    if (!patch) throw new Error("구간 스냅숏이 없습니다 — npm run tier:snapshots");
    for (const snapshot of bracketSnapshots.filter((s) => s.line === patch)) {
      rows.push(...scoreSnapshot(snapshot, previousSnapshot(inputs.snapshots, snapshot), inputs, model!));
    }
    modelVersion = model!.version + (gate.ok ? "" : "-unvalidated");
  }

  let configPath: string | undefined;
  if (remote) {
    const store = path.join(ROOT, ".wrangler/tier-publish");
    mkdirSync(store, { recursive: true });
    configPath = path.join(store, "remote.jsonc");
    writeFileSync(configPath, JSON.stringify({ name: "tier-publish-remote", compatibility_date: "2026-08-31",
      d1_databases: [{ binding: "DB", database_name: "kkaenam-gg", database_id: "9df1655b-da71-4d23-ba2f-6c2b6981e632", remote: true }] }));
  }
  const proxy = await getPlatformProxy<CloudflareEnv>({ configPath, remoteBindings: remote });
  const DB = proxy.env.DB;
  try {
    const now = new Date().toISOString();
    const inserts = rows.map((r) => DB.prepare(`INSERT OR REPLACE INTO tier_scores
      (bracket,position_slug,champion_slug,patch,model_version,score,tier,games,wins,pick_rate,ban_rate,computed_at)
      VALUES(?,?,?,?,?,?,?,?,?,?,?,?)`).bind(r.bracket, r.position, r.champion, patch, modelVersion,
      r.score, r.tier, r.games, r.wins, r.pickRate, r.banRate, now));
    // 한 batch가 너무 커지지 않게 나눠 넣고, 다 넣은 뒤에 이번에 쓰지 않은 행을 지운다.
    // 넣는 도중 실패하면 이전 보드가 그대로 남는다(일부 행만 새 값).
    for (let i = 0; i < inserts.length; i += 100) await DB.batch(inserts.slice(i, i + 100));
    await DB.prepare("DELETE FROM tier_scores WHERE computed_at<>?").bind(now).run();
    if (clear) console.log(`공개 티어 점수를 모두 내렸습니다 (${remote ? "운영" : "로컬"}).`);
    else {
      const tiered = rows.filter((r) => r.tier).length;
      console.log(`${patch} · ${modelVersion} → ${remote ? "운영" : "로컬"} tier_scores ${rows.length}행 (등급 ${tiered}, 표본 부족 ${rows.length - tiered})`);
    }
  } finally {
    await proxy.dispose();
  }
}

main().catch((error) => {
  console.error(error instanceof Error ? error.message : error);
  process.exit(1);
});
