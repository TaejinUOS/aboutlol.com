/** 한국 서버 전적 조회. Riot 키와 원본 응답은 서버 밖으로 보내지 않는다. */
import "server-only";

import { getCloudflareContext } from "@opennextjs/cloudflare";

import { PATCH, allChampions } from "@/data/champions";

const RIOT_HOST = "https://asia.api.riotgames.com";
const KR_HOST = "https://kr.api.riotgames.com";
const MATCH_COUNT = 20;
const cache = new Map<string, { expires: number; value: unknown }>();
const pending = new Map<string, Promise<unknown>>();
let blockedUntil = 0;

type RiotAccount = { puuid: string; gameName: string; tagLine: string };
type RiotSummoner = { profileIconId?: number; summonerLevel?: number };
type RiotParticipant = {
  puuid: string;
  championId: number;
  championName: string;
  teamId: number;
  teamPosition?: string;
  win: boolean;
  kills: number;
  deaths: number;
  assists: number;
  totalMinionsKilled: number;
  neutralMinionsKilled: number;
};
type RiotMatch = {
  metadata: { matchId: string };
  info: {
    queueId: number;
    gameStartTimestamp?: number;
    gameEndTimestamp?: number;
    gameCreation?: number;
    gameDuration: number;
    participants: RiotParticipant[];
  };
};

export type RecordRow = {
  id: string;
  queue: string;
  endedAt: number | null;
  durationSeconds: number | null;
  win: boolean;
  champion: string;
  championSlug: string | null;
  iconUrl: string | null;
  opponent: string | null;
  matchupHref: string | null;
  kills: number;
  deaths: number;
  assists: number;
  cs: number | null;
  csPerMinute: number | null;
};

export type RecordResult =
  | { status: "ok"; riotId: string; rows: RecordRow[]; incomplete: boolean; profile: { iconUrl: string | null; level: number | null } }
  | { status: "invalid" | "missing" | "unavailable" | "rate-limited" | "not-configured"; retrySeconds?: number };

class RiotError extends Error {
  constructor(
    public readonly status: number,
    public readonly retrySeconds = 0,
  ) {
    super(`Riot API: ${status}`);
  }
}

async function apiKey() {
  const { env } = await getCloudflareContext({ async: true });
  return (env as typeof env & { RIOT_API_KEY?: string }).RIOT_API_KEY?.trim();
}

export async function recordsConfigured() {
  return Boolean(await apiKey());
}

/** Worker 인스턴스 안에서 만료 데이터와 동시 조회를 공유한다. */
async function cached<T>(key: string, ttlMs: number, load: () => Promise<T>): Promise<T> {
  const hit = cache.get(key);
  if (hit && hit.expires > Date.now()) return hit.value as T;
  const running = pending.get(key);
  if (running) return running as Promise<T>;

  const task = load()
    .then((value) => {
      if (cache.size >= 500) cache.delete(cache.keys().next().value as string);
      cache.set(key, { expires: Date.now() + ttlMs, value });
      return value;
    })
    .finally(() => pending.delete(key));
  pending.set(key, task);
  return task;
}

async function riotGet<T>(path: string, key: string, host = RIOT_HOST): Promise<T> {
  if (Date.now() < blockedUntil) {
    throw new RiotError(429, Math.ceil((blockedUntil - Date.now()) / 1000));
  }

  let response: Response;
  try {
    response = await fetch(`${host}${path}`, {
      headers: { "X-Riot-Token": key },
      cache: "no-store",
      signal: AbortSignal.timeout(8000),
    });
  } catch {
    throw new RiotError(503);
  }

  if (response.status === 429) {
    const seconds = Number(response.headers.get("Retry-After"));
    const retrySeconds = Number.isFinite(seconds) && seconds > 0 ? Math.ceil(seconds) : 60;
    blockedUntil = Date.now() + retrySeconds * 1000;
    throw new RiotError(429, retrySeconds);
  }
  if (!response.ok) throw new RiotError(response.status);
  try {
    return (await response.json()) as T;
  } catch {
    throw new RiotError(502);
  }
}

function queueName(id: number) {
  switch (id) {
    case 420: return "솔로 랭크";
    case 440: return "자유 랭크";
    case 450: return "칼바람 나락";
    case 400: return "일반 교차 선택";
    case 430: return "일반 게임";
    case 490: return "빠른 대전";
    case 1700: return "아레나";
    default: return `게임 모드 ${id}`;
  }
}

function toRow(match: RiotMatch, puuid: string): RecordRow | null {
  // Riot 정책상 옵트인 없는 사용자 지정 게임 전적은 공개하지 않는다.
  if (match.info.queueId === 0) return null;
  const player = match.info.participants.find((participant) => participant.puuid === puuid);
  if (!player) return null;

  const champion = allChampions.find((item) => Number(item.key) === player.championId);
  const opponent = player.teamPosition
    ? match.info.participants.find((item) =>
        item.teamId !== player.teamId && item.teamPosition === player.teamPosition)
    : undefined;
  const opponentChampion = opponent
    ? allChampions.find((item) => Number(item.key) === opponent.championId)
    : undefined;
  const duration = match.info.gameDuration;
  const durationSeconds = Number.isFinite(duration) && duration > 0 ? duration : null;
  const minions = player.totalMinionsKilled;
  const monsters = player.neutralMinionsKilled;
  const cs = Number.isFinite(minions) && Number.isFinite(monsters) ? minions + monsters : null;
  const timestamp = match.info.gameEndTimestamp ?? match.info.gameStartTimestamp ?? match.info.gameCreation;

  return {
    id: match.metadata.matchId,
    queue: queueName(match.info.queueId),
    endedAt: timestamp && Number.isFinite(timestamp) ? timestamp : null,
    durationSeconds,
    win: player.win,
    champion: champion?.name ?? player.championName,
    championSlug: champion?.slug ?? null,
    iconUrl: champion?.iconUrl ?? null,
    opponent: opponentChampion?.name ?? null,
    matchupHref: opponentChampion && champion
      ? `/matchup/${opponentChampion.slug}?tab=board&me=${champion.slug}`
      : null,
    kills: player.kills,
    deaths: player.deaths,
    assists: player.assists,
    cs,
    csPerMinute: cs !== null && durationSeconds !== null ? cs / (durationSeconds / 60) : null,
  };
}

function parseRiotId(input: string) {
  const parts = input.trim().split("#");
  if (parts.length !== 2) return null;
  const [gameName, tagLine] = parts.map((part) => part.trim());
  const nameLength = Array.from(gameName).length;
  const tagLength = Array.from(tagLine).length;
  if (nameLength < 3 || nameLength > 16 || tagLength < 3 || tagLength > 5) return null;
  return { gameName, tagLine };
}

export async function getRecords(input: string): Promise<RecordResult> {
  const parsed = parseRiotId(input);
  if (!parsed) return { status: "invalid" };
  const key = await apiKey();
  if (!key) return { status: "not-configured" };

  try {
    const accountPath = `/riot/account/v1/accounts/by-riot-id/${encodeURIComponent(parsed.gameName)}/${encodeURIComponent(parsed.tagLine)}`;
    const account = await cached(accountPath, 30 * 60_000, () => riotGet<RiotAccount>(accountPath, key));
    const idsPath = `/lol/match/v5/matches/by-puuid/${encodeURIComponent(account.puuid)}/ids?start=0&count=100`;
    const fetchedIds = await cached(idsPath, 2 * 60_000, async () => {
      try {
        return await riotGet<string[]>(idsPath, key);
      } catch (error) {
        if (error instanceof RiotError && error.status === 404) return [];
        throw error;
      }
    });
    const ids = fetchedIds.filter((id) => id.startsWith("KR_")).slice(0, MATCH_COUNT);

    const rows: RecordRow[] = [];
    let incomplete = false;
    // 순서를 유지하면서 한 번에 세 경기만 요청한다.
    for (let start = 0; start < ids.length; start += 3) {
      const group = ids.slice(start, start + 3);
      const results = await Promise.allSettled(group.map((id) => {
        const path = `/lol/match/v5/matches/${encodeURIComponent(id)}`;
        return cached(path, 24 * 60 * 60_000, () => riotGet<RiotMatch>(path, key));
      }));
      for (const result of results) {
        if (result.status === "fulfilled") {
          const row = toRow(result.value, account.puuid);
          if (row) rows.push(row);
        } else if (result.reason instanceof RiotError && result.reason.status === 429) {
          throw result.reason;
        } else {
          incomplete = true;
        }
      }
    }

    const summonerPath = `/lol/summoner/v4/summoners/by-puuid/${encodeURIComponent(account.puuid)}`;
    const summoner = await cached(`kr:${summonerPath}`, 30 * 60_000, () =>
      riotGet<RiotSummoner>(summonerPath, key, KR_HOST)
    ).catch(() => null);
    const iconId = summoner?.profileIconId;

    return {
      status: "ok",
      riotId: `${account.gameName}#${account.tagLine}`,
      rows,
      incomplete,
      profile: {
        iconUrl: typeof iconId === "number" && Number.isInteger(iconId) && iconId >= 0
          ? `https://ddragon.leagueoflegends.com/cdn/${PATCH}/img/profileicon/${iconId}.png`
          : null,
        level: typeof summoner?.summonerLevel === "number" ? summoner.summonerLevel : null,
      },
    };
  } catch (error) {
    if (error instanceof RiotError) {
      if (error.status === 404) return { status: "missing" };
      if (error.status === 429) return { status: "rate-limited", retrySeconds: error.retrySeconds };
    }
    return { status: "unavailable" };
  }
}
