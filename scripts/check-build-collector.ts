/** 외부 API만 검증 응답으로 바꾸고 실제 격리 D1에서 pagination/재시작/집계를 확인한다. */
import assert from "node:assert/strict";
import { mkdtemp, readFile, writeFile } from "node:fs/promises";
import { resolve } from "node:path";
import { getPlatformProxy, unstable_splitSqlQuery } from "wrangler";
import { collectBuilds, getCollectorStatus } from "../src/lib/buildCollector";

async function main() {
  const folder = await mkdtemp(resolve(".wrangler/collector-check-"));
  const configPath = resolve(folder, "wrangler.jsonc");
  await writeFile(configPath, JSON.stringify({ name: "collector-check", compatibility_date: "2026-08-31",
    d1_databases: [{ binding: "DB", database_name: "isolated-build-check", database_id: "00000000-0000-0000-0000-000000000015" }] }));
  const proxy = await getPlatformProxy<{ DB: D1Database }>({ configPath, remoteBindings: false, persist: { path: resolve(folder, "state") } });
  const DB = proxy.env.DB;
  try {
    for (const migration of ["0014_champion_builds.sql", "0015_build_collector.sql"]) {
      await DB.batch(unstable_splitSqlQuery(await readFile(resolve("migrations", migration), "utf8")).map((s) => DB.prepare(s)));
    }
    const calls: string[] = [];
    let current = "16.19.1", rateLimit = false, failTimeline = false, largeLadder = false;
    const item = (name: string, gold: number) => ({ name, image: { full: "1056.png" }, tags: [], maps: { "11": true }, gold: { total: gold, purchasable: true } });
    const json = (value: unknown) => new Response(JSON.stringify(value), { headers: { "Content-Type": "application/json" } });
    const fetcher = (async (input: string | URL | Request) => {
      const url = new URL(typeof input === "string" ? input : input instanceof URL ? input.href : input.url);
      calls.push(url.pathname + url.search);
      if (url.host === "ddragon.leagueoflegends.com") return url.pathname.endsWith("versions.json") ? json([current]) :
        json({ data: { 1056: item("도란", 400), 401: item("코어1", 3000), 402: item("코어2", 3000), 403: item("코어3", 3000) } });
      if (rateLimit) { rateLimit = false; return new Response(null, { status: 429, headers: { "Retry-After": "120" } }); }
      if (url.pathname.includes("/league/")) {
        if (largeLadder && url.pathname.includes("masterleagues")) return json({ entries: Array.from({ length: 1000 }, (_, i) => ({ puuid: `LARGE_${String(i).padStart(4, "0")}` })) });
        const entries = [{ puuid: "CHECK_DIAMOND", rank: "I" }];
        return url.pathname.includes("/entries/") ? json(url.searchParams.get("page") === "1" ? entries : []) : json({ entries });
      }
      if (url.pathname.endsWith("/ids")) {
        if (url.searchParams.has("startTime")) return json(["KR_104", "KR_1"]);
        return json(url.searchParams.get("start") === "0" ? Array.from({ length: 100 }, (_, i) => `KR_${i + 1}`) : ["KR_101", "KR_102", "KR_103"]);
      }
      const id = url.pathname.split("/")[5];
      if (url.pathname.endsWith("/timeline")) {
        if (failTimeline) { failTimeline = false; return new Response(null, { status: 503 }); }
        return json({ metadata: { matchId: id }, info: { frames: [{ events: [1056, 401, 402, 403].map((itemId, i) =>
          ({ type: "ITEM_PURCHASED", participantId: 1, itemId, timestamp: i * 100_000 })) }] } });
      }
      return json({ metadata: { matchId: id }, info: { queueId: 420, mapId: 11, gameVersion: id === "KR_102" ? "16.18.1" : current,
        gameDuration: 1800, gameStartTimestamp: Date.now() - 20 * 86_400_000, participants: [
          { puuid: "CHECK_DIAMOND", participantId: 1, championId: 103, teamPosition: "MIDDLE", win: true },
          { puuid: "CHECK_UNVERIFIED", participantId: 2, championId: 99, teamPosition: "UTILITY", win: false },
        ] } });
    }) as typeof fetch;
    const run = (players = 1, matches = 5, requests = 1000) => collectBuilds(DB, "CHECK_KEY", {
      fetcher, sleep: async () => {}, players, matches, requests, durationMs: 600_000,
    });
    await run();
    assert.equal((await DB.prepare("SELECT history_offset FROM build_player_cursors").first<{ history_offset: number }>())!.history_offset, 100);
    assert.equal((await DB.prepare("SELECT COUNT(*) AS n FROM build_matches").first<{ n: number }>())!.n, 5);
    assert.equal((await DB.prepare("SELECT COUNT(*) AS n FROM build_observations").first<{ n: number }>())!.n, 5, "검증되지 않은 참가자는 다이아+ 표본에 포함하지 않는다");
    await DB.prepare("UPDATE build_player_cursors SET next_at=0").run();
    await run(1, 200);
    assert.ok(calls.some((c) => c.includes("start=100")), "다음 history 페이지를 재시작 후 이어 읽는다");
    assert.equal((await DB.prepare("SELECT backfilled FROM build_player_cursors").first<{ backfilled: number }>())!.backfilled, 1);
    assert.equal((await DB.prepare("SELECT COUNT(*) AS n FROM build_matches").first<{ n: number }>())!.n, 102, "이전 패치는 제외, 14일 이전 현 패치 경기는 유지");
    const time = (await DB.prepare("SELECT updated_at FROM build_syncs").first<{ updated_at: string }>())!.updated_at;
    await run(0, 200);
    assert.equal((await DB.prepare("SELECT updated_at FROM build_syncs").first<{ updated_at: string }>())!.updated_at, time, "변경 없을 때 자료 갱신 시각 유지");
    await DB.prepare("UPDATE build_player_cursors SET next_at=0").run();
    await run(1, 200);
    assert.ok(calls.some((c) => c.includes("startTime=")), "backfill 완료 후 watermark로 새 경기 조회");
    assert.equal((await DB.prepare("SELECT COUNT(*) AS n FROM build_matches").first<{ n: number }>())!.n, 103, "중복 경기 재조회는 중복 집계하지 않는다");
    for (let i = 0; i < 8; i++) await run(0, 0);
    for (const tier of ["DIAMOND/I", "DIAMOND/II", "DIAMOND/III", "DIAMOND/IV", "masterleagues", "grandmasterleagues", "challengerleagues"]) {
      assert.ok(calls.some((c) => c.includes(tier)), `래더 전체 구간 ${tier}`);
    }
    await DB.prepare("UPDATE build_ladder_cursors SET next_at=0").run();
    rateLimit = true;
    assert.equal((await run(0, 0)).status, "rate-limit");
    assert.ok((await DB.prepare("SELECT blocked_kr FROM build_collector_state").first<{ blocked_kr: number }>())!.blocked_kr > Date.now(), "429 대기를 다음 실행에 보존");
    await DB.prepare("UPDATE build_collector_state SET blocked_kr=0").run();
    await DB.prepare("INSERT INTO build_match_queue(patch,match_id,queued_at) VALUES('16.19','KR_105',0)").run();
    failTimeline = true;
    await assert.rejects(run(0, 1), /Riot API 503/);
    assert.equal((await DB.prepare("SELECT status FROM build_match_queue WHERE match_id='KR_105'").first<{ status: string }>())!.status, "pending", "중단된 경기 유지");
    await run(0, 1);
    assert.equal((await DB.prepare("SELECT status FROM build_match_queue WHERE match_id='KR_105'").first<{ status: string }>())!.status, "done");
    await DB.prepare("UPDATE build_collector_state SET lease_until=?").bind(Date.now() + 60_000).run();
    assert.equal((await run()).status, "locked", "Cron과 수동 작업 동시 실행 방지");
    await DB.prepare("UPDATE build_collector_state SET lease_until=0").run();
    current = "16.20.1";
    await run(0, 0);
    assert.equal((await getCollectorStatus(DB)).state?.patch, "16.20");
    assert.equal((await DB.prepare("SELECT COUNT(*) AS n FROM build_player_cursors WHERE patch='16.19'").first<{ n: number }>())!.n, 0);
    assert.equal((await DB.prepare("SELECT backfilled FROM build_player_cursors WHERE patch='16.20'").first<{ backfilled: number }>())!.backfilled, 0, "패치 변경 시 backfill 새로 시작");
    const stats = JSON.stringify(await getCollectorStatus(DB));
    assert.ok(!stats.includes("CHECK_DIAMOND"), "상태 명령은 PUUID를 노출하지 않는다");
    largeLadder = true;
    await DB.prepare("UPDATE build_ladder_cursors SET next_at=?").bind(Date.now() + 86_400_000).run();
    await DB.prepare("UPDATE build_ladder_cursors SET next_at=0 WHERE scope='MASTER'").run();
    for (let i = 0; i < 3; i++) {
      await run(0, 0);
      const cursor = (await DB.prepare("SELECT entry_offset FROM build_ladder_cursors WHERE scope='MASTER'").first<{ entry_offset: number }>())!;
      assert.equal(cursor.entry_offset, i < 2 ? (i + 1) * 400 : 0, "대규모 apex 래더를 여러 Cron에 나누어 처리");
      await DB.prepare("UPDATE build_ladder_cursors SET next_at=0 WHERE scope='MASTER'").run();
    }
    assert.equal((await DB.prepare("SELECT COUNT(*) AS n FROM build_players WHERE puuid LIKE 'LARGE_%'").first<{ n: number }>())!.n, 1000);
    console.log("PASS: 다이아+ 7구간·history pagination·중단 재개·전 패치 제외·14일 초과 누적·티어 확인·중복 제거·429·동시 임대·패치 전환");
  } finally { await proxy.dispose(); }
}
main().catch((error) => { console.error(error); process.exitCode = 1; });
