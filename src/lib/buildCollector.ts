/** Node 수동 수집과 Cloudflare Cron이 공유하는 지속 가능한 수집기. 서버에서만 import한다. */
import { extractBuilds, patchLine, type BuildMatch, type BuildTimeline, type ItemCatalog } from "./buildStats";
import { sampleTierMatches, type TierSampleOptions } from "./tierSampler";

export const BUILD_COHORT = "diamond-plus";
export const BUILD_SOURCE = "KR solo / verified Diamond+ ladder players / full patch";
const DAY = 86_400_000;
const RANK_AGE = 2 * DAY;
type LadderEntry = { puuid?: string; tier?: string; rank?: string };
type Cursor = { puuid: string; history_start: number; history_end: number;
  history_offset: number; watermark: number; backfilled: number };
type State = { patch: string | null; version: string | null; blocked_kr: number; blocked_asia: number };
export type CollectorOptions = { requests?: number; players?: number; matches?: number;
  version?: string; durationMs?: number; fetcher?: typeof fetch; sleep?: (ms: number) => Promise<void>;
  /** 티어 구간 표본 (`tierSampler.ts`). 기본 예산 0 — 켜지 않으면 호출하지 않는다. */
  tierSample?: TierSampleOptions };
class PauseCollection extends Error {}
export function comparePatch(a: string, b: string) {
  const [ay, ap] = a.split(".").map(Number), [by, bp] = b.split(".").map(Number);
  return ay - by || ap - bp;
}

export async function collectBuilds(DB: D1Database, key: string, options: CollectorOptions = {}) {
  const started = Date.now(), owner = crypto.randomUUID();
  const duration = options.durationMs ?? 75_000;
  const until = started + duration;
  // Cron의 최대 실행 시간(15분)보다 긴 임대. 강제 종료 시 다음 실행이 만료 후 이어받는다.
  const lease = await DB.prepare(`UPDATE build_collector_state SET lease_owner=?,lease_until=?
    WHERE id=1 AND lease_until<?`).bind(owner, Math.max(until + 60_000, started + 16 * 60_000), started).run();
  const result: { status: string; patch: string; discovered: number; players: number; inspected: number;
    matches: number; requests: number; tierSample?: Awaited<ReturnType<typeof sampleTierMatches>> } =
    { status: "ok", patch: "", discovered: 0, players: 0, inspected: 0, matches: 0, requests: 0 };
  if (!lease.meta.changes) return { ...result, status: "locked" };
  const fetcher = options.fetcher ?? fetch;
  const sleep = options.sleep ?? ((ms) => new Promise<void>((resolve) => setTimeout(resolve, ms)));
  const maxRequests = options.requests ?? 36;
  let lastRequest = 0;
  let state: State;
  async function riot<T>(host: "kr" | "asia", path: string): Promise<T | null> {
    if (result.requests >= maxRequests || Date.now() + 16_000 > until) throw new PauseCollection("budget");
    const blocked = host === "kr" ? state.blocked_kr : state.blocked_asia;
    if (blocked > Date.now()) throw new PauseCollection("rate-limit");
    await sleep(Math.max(0, lastRequest + 1300 - Date.now()));
    lastRequest = Date.now(); result.requests++;
    const response = await fetcher(`https://${host}.api.riotgames.com${path}`, {
      headers: { "X-Riot-Token": key }, signal: AbortSignal.timeout(15_000),
    });
    let blockedUntil = 0;
    for (const prefix of ["X-App", "X-Method"]) {
      const counts = response.headers.get(`${prefix}-Rate-Limit-Count`)?.split(",") ?? [];
      for (const limit of response.headers.get(`${prefix}-Rate-Limit`)?.split(",") ?? []) {
        const [max, seconds] = limit.split(":").map(Number);
        const count = counts.map((c) => c.split(":").map(Number)).find(([, window]) => window === seconds)?.[0] ?? 0;
        if (Number.isFinite(max) && Number.isFinite(seconds) && count >= max - 1) blockedUntil = Math.max(blockedUntil, Date.now() + seconds * 1000);
      }
    }
    if (response.status === 429) {
      const retry = Number(response.headers.get("Retry-After"));
      blockedUntil = Math.max(blockedUntil, Date.now() + (retry > 0 && Number.isFinite(retry) ? retry : 120) * 1000);
    }
    if (blockedUntil) {
      const column = host === "kr" ? "blocked_kr" : "blocked_asia";
      await DB.prepare(`UPDATE build_collector_state SET ${column}=? WHERE id=1 AND lease_owner=?`).bind(blockedUntil, owner).run();
      if (host === "kr") state.blocked_kr = blockedUntil; else state.blocked_asia = blockedUntil;
    }
    if (!response.ok) {
      await response.body?.cancel();
      if (response.status === 429) throw new PauseCollection("rate-limit");
      if (response.status === 404) return null;
      throw new Error(`Riot API ${response.status}${[401, 403].includes(response.status) ? ": 키 만료/권한 확인 필요" : ""}`);
    }
    return await response.json() as T;
  }
  async function staticJson<T>(url: string): Promise<T> {
    const response = await fetcher(url, { signal: AbortSignal.timeout(15_000) });
    if (!response.ok) throw new Error(`Data Dragon ${response.status}`);
    return await response.json() as T;
  }
  try {
    state = (await DB.prepare("SELECT patch,version,blocked_kr,blocked_asia FROM build_collector_state WHERE id=1").first<State>())!;
    const version = options.version ?? (await staticJson<string[]>("https://ddragon.leagueoflegends.com/api/versions.json"))[0];
    const patch = patchLine(version);
    if (!patch) throw new Error("Data Dragon 패치 버전 오류");
    if (state.patch && comparePatch(patch, state.patch) < 0) throw new Error("활성 수집 패치보다 이전 패치로 되돌릴 수 없습니다.");
    result.patch = patch;
    // 새 패치가 감지되면 모든 계정에 별도 cursor가 생긴다. 이전 패치와 섞이지 않는다.
    await DB.prepare("UPDATE build_collector_state SET patch=?,checked_at=?,last_error=NULL WHERE id=1 AND lease_owner=?")
      .bind(patch, started, owner).run();
    const catalog = (await staticJson<{ data: ItemCatalog }>(`https://ddragon.leagueoflegends.com/cdn/${version}/data/ko_KR/item.json`)).data;
    if (state.version !== version) {
      const entries = Object.entries(catalog);
      for (let i = 0; i < entries.length; i += 50) await DB.batch(entries.slice(i, i + 50).map(([id, item]) =>
        DB.prepare("INSERT OR REPLACE INTO build_items(patch,item_id,name,icon_url) VALUES(?,?,?,?)")
          .bind(patch, Number(id), item.name, `https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${item.image.full}`)));
      await DB.prepare("UPDATE build_collector_state SET version=? WHERE id=1 AND lease_owner=?").bind(version, owner).run();
    }
    // 요청 예산 소진으로 일찍 반환하는 묶음에서도 보존 기간과 이전 패치 cursor 정리를 실행한다.
    await DB.batch([
      DB.prepare("DELETE FROM build_players WHERE rank_checked_at<?").bind(started - 30 * DAY),
      DB.prepare("DELETE FROM build_player_cursors WHERE patch<>?").bind(patch),
      DB.prepare("DELETE FROM build_match_queue WHERE patch<>?").bind(patch),
    ]);
    // 티어 구간 표본을 먼저 진행한다. 자기 예산만 쓰고 남은 예산은 아래 빌드 수집이 쓴다.
    if (options.tierSample?.requests) result.tierSample = await sampleTierMatches(DB, riot, patch, options.tierSample);
    // 일곱 구간을 공정하게 순환하며 다이아몬드 각 division의 마지막 페이지까지 탐색한다.
    const ladder = await DB.prepare("SELECT scope,page,entry_offset FROM build_ladder_cursors WHERE next_at<=? ORDER BY next_at,scope LIMIT 1")
      .bind(started).first<{ scope: string; page: number; entry_offset: number }>();
    if (ladder && state.blocked_kr <= Date.now()) {
      const path = ladder.scope.startsWith("DIAMOND/") ?
        `/lol/league/v4/entries/RANKED_SOLO_5x5/${ladder.scope}?page=${ladder.page}` :
        `/lol/league/v4/${ladder.scope.toLowerCase()}leagues/by-queue/RANKED_SOLO_5x5`;
      const data = await riot<LadderEntry[] | { entries: LadderEntry[] }>("kr", path);
      if (!data) throw new Error("래더 API 404");
      const entries = Array.isArray(data) ? data : data.entries;
      const ranked = entries.filter((e) => e.puuid).sort((a, b) => a.puuid!.localeCompare(b.puuid!));
      if (entries.length && !ranked.length) throw new Error("래더 PUUID가 없습니다. Riot 스키마/권한 확인 필요");
      // 마스터처럼 한 응답에 수천 계정이 담기는 구간도 한 Cron의 DB/CPU 예산 안에서 이어 처리한다.
      const players = ranked.slice(ladder.entry_offset, ladder.entry_offset + 400);
      for (let i = 0; i < players.length; i += 50) await DB.batch(players.slice(i, i + 50).flatMap((entry) => [
        DB.prepare(`INSERT INTO build_players(puuid,tier,rank,rank_checked_at) VALUES(?,?,?,?)
          ON CONFLICT(puuid) DO UPDATE SET tier=excluded.tier,rank=excluded.rank,rank_checked_at=excluded.rank_checked_at`)
          .bind(entry.puuid!, ladder.scope.split("/")[0], entry.rank ?? ladder.scope.split("/")[1] ?? "I", started),
        DB.prepare("INSERT OR IGNORE INTO build_player_cursors(patch,puuid) VALUES(?,?)").bind(patch, entry.puuid!),
      ]));
      result.discovered = players.length;
      const entryOffset = ladder.entry_offset + players.length;
      const remaining = entryOffset < ranked.length;
      const more = ladder.scope.startsWith("DIAMOND/") && entries.length > 0;
      await DB.prepare("UPDATE build_ladder_cursors SET page=?,entry_offset=?,next_at=? WHERE scope=?")
        .bind(remaining ? ladder.page : more ? ladder.page + 1 : 1, remaining ? entryOffset : 0,
          started + (remaining || more ? 60_000 : 6 * 3600_000), ladder.scope).run();
    }
    // 이미 알려진 계정도 패치 전환 시 새 backfill을 시작한다.
    await DB.prepare(`INSERT OR IGNORE INTO build_player_cursors(patch,puuid)
      SELECT ?,puuid FROM build_players WHERE rank_checked_at>=?`).bind(patch, started - RANK_AGE).run();
    const pending = (await DB.prepare("SELECT COUNT(*) AS n FROM build_match_queue WHERE patch=? AND status='pending'").bind(patch).first<{ n: number }>())!.n;
    const cursors = pending < 20_000 ? (await DB.prepare(`SELECT c.* FROM build_player_cursors c JOIN build_players p ON p.puuid=c.puuid
      WHERE c.patch=? AND c.next_at<=? AND p.rank_checked_at>=? ORDER BY c.next_at,c.puuid LIMIT ?`)
      .bind(patch, started, started - RANK_AGE, options.players ?? 6).all<Cursor>()).results : [];
    for (const cursor of cursors) {
      // count=100 다음 페이지를 DB에 저장한다. 최초 조회에는 날짜 하한을 두지 않아 패치 첫 경기까지 역탐색한다.
      const end = cursor.history_end || Math.floor(started / 1000);
      const start = cursor.history_end ? cursor.history_start : cursor.watermark;
      const params = new URLSearchParams({ queue: "420", type: "ranked", count: "100", start: String(cursor.history_offset), endTime: String(end) });
      if (start) params.set("startTime", String(start));
      const ids = await riot<string[]>("asia", `/lol/match/v5/matches/by-puuid/${encodeURIComponent(cursor.puuid)}/ids?${params}`);
      if (ids === null) {
        await DB.prepare("UPDATE build_player_cursors SET next_at=? WHERE patch=? AND puuid=?").bind(started + DAY, patch, cursor.puuid).run(); continue;
      }
      let valid = [...new Set(ids.filter((id) => /^KR_\d+$/.test(id)))];
      // 페이지 끝의 버전으로 패치 경계를 판정한다. 100경기 넘게 플레이한 유저도 과거 페이지를 이어 읽는다.
      let boundary = ids.length < 100;
      if (!cursor.backfilled && valid.length) {
        const tail = await riot<BuildMatch>("asia", `/lol/match/v5/matches/${valid[valid.length - 1]}`);
        const tailPatch = tail && patchLine(tail.info.gameVersion);
        if (tailPatch && comparePatch(tailPatch, patch) < 0) {
          boundary = true;
          const head = valid.length === 1 ? tail : await riot<BuildMatch>("asia", `/lol/match/v5/matches/${valid[0]}`);
          const headPatch = head && patchLine(head.info.gameVersion);
          // 비활성 계정의 이전 패치 100개를 전부 검사하는 낭비를 피한다.
          if (headPatch && comparePatch(headPatch, patch) < 0) valid = [];
        }
      }
      for (let i = 0; i < valid.length; i += 50) await DB.batch(valid.slice(i, i + 50).map((id) =>
        DB.prepare(`INSERT INTO build_match_queue(patch,match_id,queued_at) VALUES(?,?,?) ON CONFLICT(patch,match_id)
          DO UPDATE SET status='pending',queued_at=excluded.queued_at WHERE build_match_queue.status='done'`)
          .bind(patch, id, started)));
      await DB.prepare(`UPDATE build_player_cursors SET history_start=?,history_end=?,history_offset=?,watermark=?,
        backfilled=?,next_at=? WHERE patch=? AND puuid=?`).bind(
        boundary ? 0 : start, boundary ? 0 : end, boundary ? 0 : cursor.history_offset + 100,
        boundary ? Math.max(0, end - 3600) : cursor.watermark,
        boundary ? 1 : cursor.backfilled, started + (boundary ? 3600_000 : 60_000), patch, cursor.puuid).run();
      result.players++;
    }
    const queued = (await DB.prepare("SELECT match_id FROM build_match_queue WHERE patch=? AND status='pending' ORDER BY queued_at,match_id DESC LIMIT ?")
      .bind(patch, options.matches ?? 12).all<{ match_id: string }>()).results;
    for (const { match_id: id } of queued) {
      const done = DB.prepare("UPDATE build_match_queue SET status='done',checked_at=? WHERE patch=? AND match_id=?").bind(Date.now(), patch, id);
      const match = await riot<BuildMatch>("asia", `/lol/match/v5/matches/${id}`);
      result.inspected++;
      if (!match || patchLine(match.info.gameVersion) !== patch || match.metadata.matchId !== id ||
          match.info.queueId !== 420 || match.info.mapId !== 11 || match.info.gameDuration < 600 ||
          match.info.participants.some((p) => p.gameEndedInEarlySurrender)) { await done.run(); continue; }
      // 확인된 다이아+ 계정만 관측한다. 경기 당시 과거 티어를 복원한 것으로 표시하지 않는다.
      const puuids = match.info.participants.map((p) => p.puuid).filter((p): p is string => Boolean(p));
      const qualified = puuids.length ? (await DB.prepare(`SELECT puuid FROM build_players WHERE rank_checked_at>=?
        AND tier IN ('DIAMOND','MASTER','GRANDMASTER','CHALLENGER') AND puuid IN (${puuids.map(() => "?").join(",")})`)
        .bind(started - RANK_AGE, ...puuids).all<{ puuid: string }>()).results : [];
      const allowed = new Set(qualified.map((p) => p.puuid));
      const participants = new Set(match.info.participants.filter((p) => p.puuid && allowed.has(p.puuid)).map((p) => p.participantId));
      if (!participants.size) { await done.run(); continue; }
      const existing = (await DB.prepare(`SELECT o.participant_id FROM build_observations o JOIN build_matches m ON m.match_id=o.match_id
        WHERE o.match_id=? AND m.cohort=?`).bind(id, BUILD_COHORT).all<{ participant_id: number }>()).results;
      if ([...participants].every((p) => existing.some((o) => o.participant_id === p))) { await done.run(); continue; }
      const timeline = await riot<BuildTimeline>("asia", `/lol/match/v5/matches/${id}/timeline`);
      if (!timeline) { await done.run(); continue; }
      const observations = extractBuilds(match, timeline, catalog).filter((o) => participants.has(o.participantId));
      if (!observations.length) { await done.run(); continue; }
      const now = new Date().toISOString();
      await DB.batch([
        DB.prepare(`DELETE FROM build_observations WHERE match_id=? AND EXISTS
          (SELECT 1 FROM build_matches WHERE match_id=? AND cohort<>?)`).bind(id, id, BUILD_COHORT),
        DB.prepare(`INSERT INTO build_matches(match_id,patch,played_at,collected_at,cohort) VALUES(?,?,?,?,?)
          ON CONFLICT(match_id) DO UPDATE SET cohort=excluded.cohort`).bind(id, patch, match.info.gameStartTimestamp, now, BUILD_COHORT),
        ...observations.map((o) => DB.prepare(`INSERT OR IGNORE INTO build_observations
          (match_id,participant_id,champion_id,position,win,starter,boots,core,skills) VALUES(?,?,?,?,?,?,?,?,?)`)
          .bind(id, o.participantId, o.championId, o.position, o.win, o.starter, o.boots, o.core, o.skills)),
        DB.prepare(`INSERT INTO build_syncs(patch,updated_at,source,matches)
          SELECT ?,?,?,COUNT(*) FROM build_matches WHERE patch=? AND cohort=?
          ON CONFLICT(patch) DO UPDATE SET updated_at=excluded.updated_at,source=excluded.source,matches=excluded.matches`)
          .bind(patch, now, BUILD_SOURCE, patch, BUILD_COHORT), done,
      ]);
      result.matches++;
    }
    return result;
  } catch (error) {
    if (error instanceof PauseCollection) return { ...result, status: error.message };
    // URL/응답 원문/계정/키를 로그와 상태에 저장하지 않는다.
    const message = error instanceof Error && /^(Riot API|Data Dragon|래더|활성 수집)/.test(error.message) ? error.message : "수집 오류: 다음 실행에서 재시도";
    await DB.prepare("UPDATE build_collector_state SET last_error=? WHERE id=1 AND lease_owner=?").bind(message, owner).run();
    throw new Error(message);
  } finally {
    await DB.prepare("UPDATE build_collector_state SET lease_owner=NULL,lease_until=0 WHERE id=1 AND lease_owner=?").bind(owner).run();
  }
}

/** 운영 확인용 집계. 계정 식별자를 출력하지 않는다. */
export async function getCollectorStatus(DB: D1Database) {
  const state = await DB.prepare("SELECT patch,version,checked_at,last_error,lease_until,blocked_kr,blocked_asia FROM build_collector_state WHERE id=1")
    .first<State & { checked_at: number; last_error: string | null }>();
  const patch = state?.patch ?? "";
  const [ranks, histories, queue, matches] = await Promise.all([
    DB.prepare("SELECT tier,rank,COUNT(*) AS players FROM build_players WHERE rank_checked_at>=? GROUP BY tier,rank ORDER BY tier,rank")
      .bind(Date.now() - RANK_AGE).all(),
    DB.prepare("SELECT backfilled,COUNT(*) AS players FROM build_player_cursors WHERE patch=? GROUP BY backfilled").bind(patch).all(),
    DB.prepare("SELECT status,COUNT(*) AS matches FROM build_match_queue WHERE patch=? GROUP BY status").bind(patch).all(),
    DB.prepare(`SELECT COUNT(DISTINCT m.match_id) AS matches,COUNT(o.participant_id) AS observations,MIN(m.played_at) AS earliest_match
      FROM build_matches m LEFT JOIN build_observations o ON o.match_id=m.match_id WHERE m.patch=? AND m.cohort=?`).bind(patch, BUILD_COHORT).first(),
  ]);
  return { state, ranks: ranks.results, histories: histories.results, queue: queue.results, sample: matches };
}
