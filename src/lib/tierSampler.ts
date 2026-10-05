/**
 * 티어 구간 표본 수집. 빌드 수집기(`buildCollector.ts`)가 같은 임대·요청 간격·429 상태 안에서 부른다.
 *
 * 세 단계를 한 번에 조금씩 진행한다 (호출 예산 `requests` 안에서).
 * 1. 래더: 구간의 디비전 하나에서 무작위 쪽을 열어 계정 몇 명을 뽑는다.
 * 2. 기록: 뽑힌 계정의 최근 솔로랭크 경기 ID를 대기열에 넣는다. 계정당 패치마다 상한이 있다.
 * 3. 경기: 대기열의 경기 정보만 받아(타임라인 없음) 열 명의 챔피언·포지션·승패와 밴을 저장한다.
 *
 * 경기의 구간은 그 경기를 찾게 한 계정의 구간이다. 열 명 각각의 티어를 조회하면 호출이 열 배가 된다.
 * 매칭이 비슷한 실력끼리 이뤄진다는 가정이며, 구간 경계 근처의 경기는 옆 구간이 섞인다 (TIER_MODEL.md).
 *
 * 기본 예산은 0이다. 켜지 않으면 아무 호출도 하지 않는다.
 */
// 수집 Worker 번들에서도 읽히도록 상대 경로로 가져온다.
import { APEX_TIERS, bracketOfTier } from "../data/brackets";
import { BUILD_POSITIONS, patchLine, type BuildMatch } from "./buildStats";

export type TierSampleOptions = {
  /** 이 단계가 쓸 수 있는 Riot 호출 수. 0이면 건너뛴다. */
  requests?: number;
  /** 래더 쪽 하나에서 뽑을 계정 수 */
  playersPerPage?: number;
  /** 계정 하나에서 패치마다 가져갈 최대 경기 수 — 장인 한 명이 표본을 덮지 않게 한다 */
  matchesPerPlayer?: number;
  /** 무작위 쪽 선택. 검사에서 고정값을 넣는다. */
  random?: () => number;
};

type Riot = <T>(host: "kr" | "asia", path: string) => Promise<T | null>;
type LadderEntry = { puuid?: string; tier?: string };
type Ladder = { scope: string; bracket: string; max_page: number };
type Player = { puuid: string; bracket: string; patch: string | null; taken: number };

const DAY = 86_400_000;
const RANK_AGE = 2 * DAY;
const POSITION = new Map<string, string>(BUILD_POSITIONS.map((p) => [p.riot, p.slug]));

export async function sampleTierMatches(
  DB: D1Database,
  riot: Riot,
  patch: string,
  options: TierSampleOptions = {},
): Promise<{ players: number; queued: number; matches: number; requests: number }> {
  const budget = options.requests ?? 0;
  const perPage = options.playersPerPage ?? 3;
  const perPlayer = options.matchesPerPlayer ?? 5;
  const random = options.random ?? Math.random;
  const result = { players: 0, queued: 0, matches: 0, requests: 0 };
  if (budget <= 0) return result;
  const now = Date.now();
  const call = async <T>(host: "kr" | "asia", path: string) => {
    result.requests++;
    return riot<T>(host, path);
  };
  const left = () => budget - result.requests;

  await DB.batch([
    DB.prepare("DELETE FROM tier_sample_players WHERE checked_at<?").bind(now - 30 * DAY),
    DB.prepare("DELETE FROM tier_sample_queue WHERE patch<>?").bind(patch),
  ]);

  // 1. 래더 — 예산의 일부만. 계정이 충분히 쌓여 있으면 경기 쪽에 예산을 쓴다.
  const due = (await DB.prepare("SELECT COUNT(*) AS n FROM tier_sample_players WHERE next_at<=? AND checked_at>=?")
    .bind(now, now - RANK_AGE).first<{ n: number }>())!.n;
  if (due < 20 && left() > 0) {
    const ladder = await DB.prepare("SELECT scope,bracket,max_page FROM tier_sample_ladder WHERE next_at<=? ORDER BY next_at,scope LIMIT 1")
      .bind(now).first<Ladder>();
    if (ladder) {
      const apex = (APEX_TIERS as readonly string[]).includes(ladder.scope);
      const page = apex ? 1 : 1 + Math.floor(random() * ladder.max_page);
      const data = await call<LadderEntry[] | { entries: LadderEntry[]; tier?: string }>("kr", apex
        ? `/lol/league/v4/${ladder.scope.toLowerCase()}leagues/by-queue/RANKED_SOLO_5x5`
        : `/lol/league/v4/entries/RANKED_SOLO_5x5/${ladder.scope}?page=${page}`);
      const entries = (Array.isArray(data) ? data : data?.entries ?? []).filter((e) => e.puuid);
      // 빈 쪽이면 상한을 그 아래로 줄이고, 상한 쪽까지 차 있으면 넓힌다. 쪽수를 몰라도 고르게 뽑게 된다.
      const maxPage = apex ? 1 : !entries.length ? Math.max(1, page - 1) : page >= ladder.max_page ? ladder.max_page * 2 : ladder.max_page;
      const tier = ladder.scope.split("/")[0];
      const picked = [...entries].map((e) => [random(), e] as const).sort((a, b) => a[0] - b[0]).slice(0, perPage).map(([, e]) => e);
      const bracket = bracketOfTier(tier) ?? ladder.bracket;
      await DB.batch([
        DB.prepare("UPDATE tier_sample_ladder SET max_page=?,next_at=? WHERE scope=?")
          .bind(maxPage, now + (apex ? 10 * 60_000 : 60_000), ladder.scope),
        ...picked.map((e) => DB.prepare(`INSERT INTO tier_sample_players(puuid,tier,bracket,checked_at) VALUES(?,?,?,?)
          ON CONFLICT(puuid) DO UPDATE SET tier=excluded.tier,bracket=excluded.bracket,checked_at=excluded.checked_at`)
          .bind(e.puuid!, tier, bracket, now)),
      ]);
      result.players += picked.length;
    }
  }

  // 2. 기록 — 한 계정에서 패치마다 최대 perPlayer 경기.
  const players = (await DB.prepare(`SELECT puuid,bracket,patch,taken FROM tier_sample_players
    WHERE next_at<=? AND checked_at>=? ORDER BY next_at,puuid LIMIT 3`).bind(now, now - RANK_AGE).all<Player>()).results;
  for (const player of players) {
    if (left() <= 1) break;
    const taken = player.patch === patch ? player.taken : 0;
    if (taken >= perPlayer) {
      await DB.prepare("UPDATE tier_sample_players SET next_at=? WHERE puuid=?").bind(now + DAY, player.puuid).run();
      continue;
    }
    const params = new URLSearchParams({ queue: "420", type: "ranked", start: "0", count: String(perPlayer - taken),
      startTime: String(Math.floor((now - 14 * DAY) / 1000)) });
    const ids = (await call<string[]>("asia", `/lol/match/v5/matches/by-puuid/${encodeURIComponent(player.puuid)}/ids?${params}`)) ?? [];
    const valid = [...new Set(ids.filter((id) => /^KR_\d+$/.test(id)))];
    await DB.batch([
      ...valid.map((id) => DB.prepare("INSERT OR IGNORE INTO tier_sample_queue(patch,match_id,bracket,queued_at) VALUES(?,?,?,?)")
        .bind(patch, id, player.bracket, now)),
      DB.prepare("UPDATE tier_sample_players SET patch=?,taken=?,next_at=? WHERE puuid=?")
        .bind(patch, taken + valid.length, now + DAY, player.puuid),
    ]);
    result.queued += valid.length;
  }

  // 3. 경기 — 남은 예산 전부.
  const queued = (await DB.prepare("SELECT match_id,bracket FROM tier_sample_queue WHERE patch=? AND status='pending' ORDER BY queued_at,match_id LIMIT ?")
    .bind(patch, Math.max(0, left())).all<{ match_id: string; bracket: string }>()).results;
  for (const { match_id: id, bracket } of queued) {
    if (left() <= 0) break;
    const done = DB.prepare("UPDATE tier_sample_queue SET status='done' WHERE patch=? AND match_id=?").bind(patch, id);
    const seen = await DB.prepare("SELECT 1 FROM tier_sample_matches WHERE match_id=?").bind(id).first();
    if (seen) { await done.run(); continue; }
    const match = await call<BuildMatch>("asia", `/lol/match/v5/matches/${id}`);
    // 빌드 수집과 같은 기준: 솔로랭크·협곡·10분 이상·조기 항복 제외·같은 패치.
    if (!match || match.metadata.matchId !== id || patchLine(match.info.gameVersion) !== patch ||
        match.info.queueId !== 420 || match.info.mapId !== 11 || match.info.gameDuration < 600 ||
        match.info.participants.some((p) => p.gameEndedInEarlySurrender)) { await done.run(); continue; }
    const participants = match.info.participants
      .map((p) => ({ ...p, position: POSITION.get(p.teamPosition) }))
      .filter((p): p is typeof p & { position: string } => Boolean(p.position));
    // 포지션을 모르는 참가자가 있으면 픽률 분모가 어긋난다. 경기를 통째로 뺀다.
    if (participants.length !== 10) { await done.run(); continue; }
    const bans = [...new Set((match.info.teams ?? []).flatMap((t) => t.bans ?? []).map((b) => b.championId).filter((c) => c > 0))];
    await DB.batch([
      DB.prepare("INSERT INTO tier_sample_matches(match_id,patch,bracket,played_at,collected_at) VALUES(?,?,?,?,?)")
        .bind(id, patch, bracket, match.info.gameStartTimestamp, new Date().toISOString()),
      ...participants.map((p) => DB.prepare(`INSERT INTO tier_sample_participants(match_id,participant_id,champion_id,position,win)
        VALUES(?,?,?,?,?)`).bind(id, p.participantId, p.championId, p.position, p.win ? 1 : 0)),
      ...bans.map((c) => DB.prepare("INSERT INTO tier_sample_bans(match_id,champion_id) VALUES(?,?)").bind(id, c)),
      done,
    ]);
    result.matches++;
  }
  return result;
}

/** 운영 확인용. 계정 식별자를 내보내지 않는다. */
export async function getTierSampleStatus(DB: D1Database, patch: string) {
  const [players, matches, queue] = await Promise.all([
    DB.prepare("SELECT bracket,COUNT(*) AS players FROM tier_sample_players GROUP BY bracket ORDER BY bracket").all(),
    DB.prepare("SELECT bracket,COUNT(*) AS matches FROM tier_sample_matches WHERE patch=? GROUP BY bracket ORDER BY bracket").bind(patch).all(),
    DB.prepare("SELECT status,COUNT(*) AS n FROM tier_sample_queue WHERE patch=? GROUP BY status").bind(patch).all(),
  ]);
  return { players: players.results, matches: matches.results, queue: queue.results };
}
