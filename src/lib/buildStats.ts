/** Riot 타임라인 → 익명 빌드 관측값. 수집기와 화면이 공유하는 순수 집계 규칙. */
export const BUILD_POSITIONS = [
  { slug: "top", name: "탑", riot: "TOP" },
  { slug: "jungle", name: "정글", riot: "JUNGLE" },
  { slug: "mid", name: "미드", riot: "MIDDLE" },
  { slug: "adc", name: "원딜", riot: "BOTTOM" },
  { slug: "support", name: "서폿", riot: "UTILITY" },
] as const;
export type BuildPosition = (typeof BUILD_POSITIONS)[number]["slug"];
export const BUILD_KINDS = ["starter", "boots", "core", "skills"] as const;
export type BuildKind = (typeof BUILD_KINDS)[number];
export const MIN_BUILD_SAMPLE = 30;
export type ItemData = {
  name: string; image: { full: string }; tags: string[];
  gold: { total: number; purchasable: boolean };
  maps: Record<string, boolean>; into?: string[]; inStore?: boolean;
};
export type ItemCatalog = Record<string, ItemData>;
export type BuildEvent = {
  type: string; timestamp: number; participantId?: number;
  itemId?: number; beforeId?: number; afterId?: number; skillSlot?: number;
};
export type BuildMatch = {
  metadata: { matchId: string };
  info: {
    queueId: number; mapId: number; gameVersion: string; gameDuration: number;
    gameStartTimestamp: number; gameEndTimestamp?: number;
    participants: { participantId: number; championId: number; teamPosition: string; puuid?: string;
      win: boolean; gameEndedInEarlySurrender?: boolean }[];
  };
};
export type BuildTimeline = {
  metadata: { matchId: string };
  info: { frames: { events: BuildEvent[] }[] };
};
export type BuildObservation = {
  participantId: number; championId: number; position: BuildPosition; win: number;
  starter: string | null; boots: string | null; core: string | null; skills: string | null;
};
export type BuildRow = {
  key: string; games: number; wins: number; pickRate: number; winRate: number;
  recommended: boolean;
};
export type BuildGroup = { kind: BuildKind; eligible: number; rows: BuildRow[] };
export type BuildItem = { id: number; name: string; iconUrl: string };
export type BuildView = {
  status: "ok" | "empty" | "unavailable";
  patch: string | null; position: BuildPosition;
  positions: { slug: BuildPosition; games: number }[];
  games: number; wins: number; from: number | null; to: number | null;
  updatedAt: string | null; stale: boolean; groups: BuildGroup[];
  items: Record<string, BuildItem>;
};

export function patchLine(version: string) {
  return /^\d+\.\d+(?:\.|$)/.test(version) ? version.split(".").slice(0, 2).join(".") : null;
}

function available(item: ItemData | undefined): item is ItemData {
  return Boolean(item?.maps?.["11"] && item.gold.purchasable && item.inStore !== false);
}

/** 합성 가능한 값비싼 상위 구매품이 없으면 완성 코어. 자동 변신품은 구매품으로 세지 않는다. */
export function isCoreItem(id: number, catalog: ItemCatalog): boolean {
  const item = catalog[id];
  if (!available(item) || item.gold.total < 2000 || item.tags.includes("Boots")) return false;
  const visited = new Set<string>();
  const queue = [...(item.into ?? [])];
  while (queue.length) {
    const next = queue.pop()!;
    if (visited.has(next)) continue;
    visited.add(next);
    const upgrade = catalog[next];
    if (available(upgrade) && upgrade.gold.total >= 2000) return false;
    queue.push(...(upgrade?.into ?? []));
  }
  return true;
}

/** 최종 인벤토리가 아닌, 취소되지 않은 실제 구매의 시간 순서를 사용한다. */
export function extractBuilds(match: BuildMatch, timeline: BuildTimeline, catalog: ItemCatalog): BuildObservation[] {
  if (match.metadata.matchId !== timeline.metadata.matchId) throw new Error("경기와 타임라인 ID 불일치");
  if (match.info.queueId !== 420 || match.info.mapId !== 11 || match.info.gameDuration < 600 ||
      match.info.participants.some((p) => p.gameEndedInEarlySurrender)) return [];
  const events = timeline.info.frames.flatMap((frame) => frame.events)
    .sort((a, b) => a.timestamp - b.timestamp);
  return match.info.participants.flatMap((player) => {
    const position = BUILD_POSITIONS.find((p) => p.riot === player.teamPosition)?.slug;
    if (!position) return [];
    const purchases: { id: number; time: number; cancelled: boolean; sold?: boolean }[] = [];
    const skills: number[] = [];
    for (const event of events) {
      if (event.participantId !== player.participantId) continue;
      if (event.type === "ITEM_PURCHASED" && event.itemId) {
        purchases.push({ id: event.itemId, time: event.timestamp, cancelled: false });
      } else if ((event.type === "ITEM_UNDO" && event.beforeId) ||
                 (event.type === "ITEM_SOLD" && event.timestamp <= 90_000)) {
        const id = event.type === "ITEM_UNDO" ? event.beforeId : event.itemId;
        const last = purchases.findLast((p) => p.id === id && !p.cancelled);
        if (last) { last.cancelled = true; last.sold = event.type === "ITEM_SOLD"; }
      } else if (event.type === "ITEM_UNDO" && !event.beforeId && event.afterId) {
        const restored = purchases.findLast((p) => p.id === event.afterId && p.sold);
        if (restored) { restored.cancelled = false; restored.sold = false; }
      } else if (event.type === "SKILL_LEVEL_UP" && event.skillSlot && event.skillSlot >= 1 && event.skillSlot <= 4) {
        skills.push(event.skillSlot);
      }
    }
    const bought = purchases.filter((p) => !p.cancelled);
    const starter = bought.filter((p) => p.time <= 90_000 && available(catalog[p.id]) && catalog[p.id].gold.total > 0)
      .map((p) => p.id).sort((a, b) => a - b);
    const boots = bought.find((p) => available(catalog[p.id]) && catalog[p.id].tags.includes("Boots") && catalog[p.id].gold.total > 300);
    const core = [...new Set(bought.filter((p) => isCoreItem(p.id, catalog)).map((p) => p.id))].slice(0, 3);
    return [{
      participantId: player.participantId, championId: player.championId, position, win: player.win ? 1 : 0,
      starter: starter.length ? JSON.stringify(starter) : null,
      boots: boots ? JSON.stringify([boots.id]) : null,
      core: core.length === 3 ? JSON.stringify(core) : null,
      skills: skills.length >= 9 ? JSON.stringify(skills.slice(0, 9)) : null,
    }];
  });
}

/** 추천은 30판 이상인 조합 중 선택률 1위. 승률만으로 작은 표본을 과대평가하지 않는다. */
export function rankBuilds(kind: BuildKind, counts: { key: string; games: number; wins: number }[]): BuildGroup {
  const eligible = counts.reduce((sum, row) => sum + row.games, 0);
  const sorted = [...counts].sort((a, b) => b.games - a.games || a.key.localeCompare(b.key));
  const recommendation = sorted.find((row) => row.games >= MIN_BUILD_SAMPLE)?.key;
  return { kind, eligible, rows: sorted.slice(0, 5).map((row) => ({ ...row,
    pickRate: eligible ? row.games / eligible * 100 : 0,
    winRate: row.games ? row.wins / row.games * 100 : 0,
    recommended: row.key === recommendation,
  })) };
}
