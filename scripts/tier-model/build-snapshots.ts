/**
 * 티어 구간 표본(D1)을 패치 × 구간별 지표 스냅숏으로 묶는다.
 *
 *   npm run tier:snapshots
 *
 * 로컬 D1만 읽는다. 운영 자료로 만들려면 먼저 `npm run db:pull`로 운영 D1을 받는다.
 * 결과: data/tier-model/snapshots/<패치>/<구간>.json (+ all.json) — 계정 식별자 없이 집계값만 담는다.
 *
 * `all`은 다섯 구간 표본의 단순 합이다. 실제 이용자 분포로 가중한 값이 아니다 — 수집기가 구간을
 * 고르게 돌기 때문에 하위 구간이 인구보다 적게 들어간다. 모델 학습용이며 화면에는 쓰지 않는다.
 */
import { mkdirSync, rmSync, writeFileSync } from "node:fs";
import path from "node:path";
import { getPlatformProxy } from "wrangler";

import catalog from "../../src/data/generated/champions.json";
import { ALL_BRACKETS, BRACKETS } from "../../src/data/brackets";
import type { Snapshot, SnapshotRow } from "../../src/lib/tierModel/dataset";

const ROOT = path.resolve(__dirname, "../..");
const OUT = path.join(ROOT, "data/tier-model/snapshots");
/** 포지션 유연성: 챔피언 경기의 이 비율 이상을 차지하는 포지션을 센다. */
const FLEX_SHARE = 0.1;
/** 고티어 승률 차이를 낼 최소 표본 (양쪽 모두) */
const ELITE_MIN = 30;

const slugByKey = new Map(catalog.champions.map((c) => [Number(c.key), c.slug]));

type Count = { bracket: string; champion_id: number; position: string; games: number; wins: number };

function snapshotRows(counts: Count[], matches: number, bans: Map<number, number>,
  elite: Map<string, { elite: number | null; diamond: number | null }>): SnapshotRow[] {
  const positionTotals = new Map<string, number>();
  const championTotals = new Map<number, number>();
  for (const r of counts) {
    positionTotals.set(r.position, (positionTotals.get(r.position) ?? 0) + r.games);
    championTotals.set(r.champion_id, (championTotals.get(r.champion_id) ?? 0) + r.games);
  }
  const flex = new Map<number, number>();
  for (const r of counts) {
    if (r.games / championTotals.get(r.champion_id)! >= FLEX_SHARE) flex.set(r.champion_id, (flex.get(r.champion_id) ?? 0) + 1);
  }
  return counts.flatMap((r) => {
    const champion = slugByKey.get(r.champion_id);
    if (!champion) return [];
    const gap = elite.get(`${r.champion_id}/${r.position}`);
    return [{
      champion,
      position: r.position,
      games: r.games,
      wins: r.wins,
      pickRate: r.games / positionTotals.get(r.position)!,
      banRate: matches ? (bans.get(r.champion_id) ?? 0) / matches : null,
      eliteWinRate: gap?.elite ?? null,
      diamondWinRate: gap?.diamond ?? null,
      flexPositions: flex.get(r.champion_id) ?? 0,
    }];
  }).sort((a, b) => a.champion.localeCompare(b.champion) || a.position.localeCompare(b.position));
}

function merge(counts: Count[]): Count[] {
  const map = new Map<string, Count>();
  for (const r of counts) {
    const key = `${r.champion_id}/${r.position}`;
    const prev = map.get(key);
    map.set(key, prev ? { ...prev, games: prev.games + r.games, wins: prev.wins + r.wins } : { ...r, bracket: ALL_BRACKETS });
  }
  return [...map.values()];
}

async function main() {
  const proxy = await getPlatformProxy<CloudflareEnv>({ remoteBindings: false });
  const DB = proxy.env.DB;
  try {
    const patches = (await DB.prepare(
      "SELECT patch, bracket, COUNT(*) AS matches FROM tier_sample_matches GROUP BY patch, bracket",
    ).all<{ patch: string; bracket: string; matches: number }>()).results;
    if (!patches.length) {
      console.log("티어 구간 표본이 없습니다. `npm run builds:sync -- --tier-requests 40`으로 먼저 수집하세요.");
      return;
    }

    for (const patch of [...new Set(patches.map((p) => p.patch))].sort()) {
      const counts = (await DB.prepare(`
        SELECT m.bracket, p.champion_id, p.position, COUNT(*) AS games, SUM(p.win) AS wins
        FROM tier_sample_participants p JOIN tier_sample_matches m ON m.match_id = p.match_id
        WHERE m.patch = ? GROUP BY m.bracket, p.champion_id, p.position`).bind(patch).all<Count>()).results;
      const banRows = (await DB.prepare(`
        SELECT m.bracket, b.champion_id, COUNT(*) AS n
        FROM tier_sample_bans b JOIN tier_sample_matches m ON m.match_id = b.match_id
        WHERE m.patch = ? GROUP BY m.bracket, b.champion_id`).bind(patch).all<{ bracket: string; champion_id: number; n: number }>()).results;
      const matchesBy = new Map(patches.filter((p) => p.patch === patch).map((p) => [p.bracket, p.matches]));

      // 고티어 승률 차이는 챔피언의 성질로 보고 모든 구간에 같은 값을 쓴다 (마스터+ − 다이아).
      const elite = new Map<string, { elite: number | null; diamond: number | null }>();
      for (const r of counts.filter((c) => c.bracket === "master-plus")) {
        const d = counts.find((c) => c.bracket === "diamond" && c.champion_id === r.champion_id && c.position === r.position);
        if (d && r.games >= ELITE_MIN && d.games >= ELITE_MIN) {
          elite.set(`${r.champion_id}/${r.position}`, { elite: r.wins / r.games, diamond: d.wins / d.games });
        }
      }

      const dir = path.join(OUT, patch);
      rmSync(dir, { recursive: true, force: true });
      mkdirSync(dir, { recursive: true });
      const write = (bracket: string, rows: SnapshotRow[], matches: number) => {
        const snapshot: Snapshot = { line: patch, bracket, source: "KR solo / 티어 구간 표본", matches, rows };
        writeFileSync(path.join(dir, `${bracket}.json`), `${JSON.stringify(snapshot, null, 1)}\n`);
        console.log(`${patch} ${bracket.padEnd(14)} 경기 ${String(matches).padStart(6)}  챔피언·포지션 ${rows.length}`);
      };

      for (const bracket of BRACKETS) {
        const matches = matchesBy.get(bracket.slug) ?? 0;
        if (!matches) continue;
        const bans = new Map(banRows.filter((b) => b.bracket === bracket.slug).map((b) => [b.champion_id, b.n]));
        write(bracket.slug, snapshotRows(counts.filter((c) => c.bracket === bracket.slug), matches, bans, elite), matches);
      }
      const total = [...matchesBy.values()].reduce((a, b) => a + b, 0);
      const allBans = new Map<number, number>();
      for (const b of banRows) allBans.set(b.champion_id, (allBans.get(b.champion_id) ?? 0) + b.n);
      write(ALL_BRACKETS, snapshotRows(merge(counts), total, allBans, elite), total);
    }
  } finally {
    await proxy.dispose();
  }
}

main().catch((error) => {
  console.error(error instanceof Error && error.message.includes("no such table") ? "로컬 D1에 0017을 먼저 적용하세요: npx wrangler d1 migrations apply DB --local" : error);
  process.exit(1);
});
