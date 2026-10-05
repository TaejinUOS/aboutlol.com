/** 티어 구간 표본 점검. Riot 응답만 가짜로 바꾸고 격리 D1에서 실제 SQL을 돌린다. */
import assert from "node:assert/strict";
import { mkdtemp, readFile, writeFile } from "node:fs/promises";
import { resolve } from "node:path";
import { getPlatformProxy, unstable_splitSqlQuery } from "wrangler";

import { sampleTierMatches } from "../src/lib/tierSampler";

const PATCH = "16.19";
const POS = ["TOP", "JUNGLE", "MIDDLE", "BOTTOM", "UTILITY"];

async function main() {
  const folder = await mkdtemp(resolve(".wrangler/tier-sampler-check-"));
  const configPath = resolve(folder, "wrangler.jsonc");
  await writeFile(configPath, JSON.stringify({ name: "tier-sampler-check", compatibility_date: "2026-08-31",
    d1_databases: [{ binding: "DB", database_name: "isolated-tier-check", database_id: "00000000-0000-0000-0000-000000000017" }] }));
  const proxy = await getPlatformProxy<{ DB: D1Database }>({ configPath, remoteBindings: false, persist: { path: resolve(folder, "state") } });
  const DB = proxy.env.DB;
  try {
    const sql = await readFile(resolve("migrations", "0017_tier_model_inputs.sql"), "utf8");
    await DB.batch(unstable_splitSqlQuery(sql).map((s) => DB.prepare(s)));

    const calls: string[] = [];
    const match = (id: string, overrides: { version?: string; noPosition?: boolean } = {}) => ({
      metadata: { matchId: id },
      info: {
        queueId: 420, mapId: 11, gameVersion: overrides.version ?? "16.19.1", gameDuration: 1800, gameStartTimestamp: Date.now(),
        participants: Array.from({ length: 10 }, (_, i) => ({
          participantId: i + 1, championId: 100 + i, puuid: `P${i}`, win: i < 5,
          teamPosition: overrides.noPosition && i === 9 ? "" : POS[i % 5],
        })),
        teams: [{ bans: [{ championId: 238 }, { championId: -1 }] }, { bans: [{ championId: 238 }, { championId: 157 }] }],
      },
    });
    const riot = async <T,>(_host: "kr" | "asia", path: string): Promise<T | null> => {
      calls.push(path);
      if (path.includes("/entries/")) {
        // GOLD/I 같은 디비전 쪽. 6쪽까지만 있다고 가정한다.
        const page = Number(new URL(`https://x${path}`).searchParams.get("page"));
        return (page <= 6 ? Array.from({ length: 10 }, (_, i) => ({ puuid: `GOLD_${page}_${i}` })) : []) as T;
      }
      if (path.includes("leagues/by-queue")) return { entries: [{ puuid: "APEX_1" }, { puuid: "APEX_2" }] } as T;
      if (path.includes("/by-puuid/")) return ["KR_1", "KR_2", "KR_3", "KR_OLD", "KR_NOPOS", "NA_9"] as T;
      const id = path.split("/").pop()!;
      if (id === "KR_OLD") return match(id, { version: "16.18.1" }) as T;
      if (id === "KR_NOPOS") return match(id, { noPosition: true }) as T;
      return match(id) as T;
    };
    let seed = 1;
    const random = () => (seed = (seed * 16807) % 2147483647) / 2147483647;

    // 예산 0이면 아무것도 하지 않는다.
    const off = await sampleTierMatches(DB, riot, PATCH, { requests: 0 });
    assert.equal(off.requests, 0);
    assert.equal(calls.length, 0, "기본값은 꺼짐 — 호출하지 않는다");

    // 래더 → 기록 → 경기 한 바퀴
    await DB.prepare("UPDATE tier_sample_ladder SET next_at = CASE WHEN scope='GOLD/I' THEN 0 ELSE 9e15 END").run();
    await DB.prepare("UPDATE tier_sample_ladder SET max_page=3 WHERE scope='GOLD/I'").run();
    const first = await sampleTierMatches(DB, riot, PATCH, { requests: 30, playersPerPage: 2, matchesPerPlayer: 6, random });
    assert.ok(first.requests <= 30, "자기 예산을 넘지 않는다");
    const players = (await DB.prepare("SELECT tier,bracket FROM tier_sample_players").all<{ tier: string; bracket: string }>()).results;
    assert.equal(players.length, 2);
    assert.ok(players.every((p) => p.tier === "GOLD" && p.bracket === "gold-platinum"), "티어를 구간으로 묶는다");

    const matches = (await DB.prepare("SELECT match_id,bracket FROM tier_sample_matches ORDER BY match_id").all<{ match_id: string; bracket: string }>()).results;
    assert.deepEqual(matches.map((m) => m.match_id), ["KR_1", "KR_2", "KR_3"], "다른 패치·포지션 누락·타 지역 경기는 뺀다");
    assert.ok(matches.every((m) => m.bracket === "gold-platinum"));
    assert.equal((await DB.prepare("SELECT COUNT(*) AS n FROM tier_sample_participants").first<{ n: number }>())!.n, 30, "경기당 열 명 모두");
    assert.equal((await DB.prepare("SELECT COUNT(*) AS n FROM tier_sample_bans").first<{ n: number }>())!.n, 6, "경기당 밴 2종 — 빈 밴과 중복 제외");
    assert.ok(!calls.some((c) => c.includes("/timeline")), "티어 표본은 타임라인을 받지 않는다");

    // 같은 경기를 두 번 받지 않는다 (두 계정이 같은 경기를 찾아도)
    const fetchedOnce = calls.filter((c) => c.endsWith("/KR_1")).length;
    assert.equal(fetchedOnce, 1);

    // 계정당 패치 상한
    const taken = (await DB.prepare("SELECT MAX(taken) AS n FROM tier_sample_players").first<{ n: number }>())!.n;
    assert.ok(taken <= 6, "계정당 경기 상한");

    // 빈 쪽을 만나면 max_page를 줄이고, 꽉 찬 상한 쪽이면 늘린다
    await DB.prepare("UPDATE tier_sample_ladder SET max_page=40, next_at=0 WHERE scope='GOLD/I'").run();
    await DB.prepare("UPDATE tier_sample_players SET next_at=9e15").run();
    await sampleTierMatches(DB, riot, PATCH, { requests: 1, random: () => 0.5 }); // 21쪽 → 비어 있음
    assert.equal((await DB.prepare("SELECT max_page FROM tier_sample_ladder WHERE scope='GOLD/I'").first<{ max_page: number }>())!.max_page, 20);
    await DB.prepare("UPDATE tier_sample_ladder SET max_page=6, next_at=0 WHERE scope='GOLD/I'").run();
    await sampleTierMatches(DB, riot, PATCH, { requests: 1, random: () => 0.99 }); // 6쪽 → 차 있음
    assert.equal((await DB.prepare("SELECT max_page FROM tier_sample_ladder WHERE scope='GOLD/I'").first<{ max_page: number }>())!.max_page, 12);

    // 마스터 이상은 리그 전체를 받는다
    await DB.prepare("UPDATE tier_sample_ladder SET next_at = CASE WHEN scope='MASTER' THEN 0 ELSE 9e15 END").run();
    await sampleTierMatches(DB, riot, PATCH, { requests: 1, random });
    assert.ok(calls.some((c) => c.includes("masterleagues/by-queue")));
    assert.equal((await DB.prepare("SELECT bracket FROM tier_sample_players WHERE puuid LIKE 'APEX_%' LIMIT 1").first<{ bracket: string }>())!.bracket, "master-plus");

    console.log("PASS: 티어 표본 기본 꺼짐·구간 묶기·열 명 기록·밴·패치/포지션/지역 제외·중복·계정 상한·쪽수 추정·마스터+");
  } finally {
    await proxy.dispose();
  }
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
