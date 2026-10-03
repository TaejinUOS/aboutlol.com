import "server-only";
import { getCloudflareContext } from "@opennextjs/cloudflare";
import { BUILD_KINDS, BUILD_POSITIONS, BUILD_WINDOW_DAYS, rankBuilds, type BuildPosition, type BuildView } from "./buildStats";

/** 페이지에서는 Riot API를 호출하지 않는다. 수집된 익명 통계만 D1에서 집계한다. */
export async function getBuildView(championId: number, requestedPosition?: string, fallbackPosition?: string): Promise<BuildView> {
  const fallback = BUILD_POSITIONS.find((p) => p.slug === requestedPosition)?.slug ??
    BUILD_POSITIONS.find((p) => p.slug === fallbackPosition)?.slug ?? "mid";
  const empty: BuildView = { status: "empty", patch: null, position: fallback, positions: [],
    games: 0, wins: 0, from: null, to: null, updatedAt: null, stale: false, groups: [], items: {} };
  try {
    const { env } = await getCloudflareContext({ async: true });
    const DB = env.DB;
    const sync = await DB.prepare(`SELECT patch, updated_at, source FROM build_syncs
      ORDER BY CAST(substr(patch,1,instr(patch,'.')-1) AS INTEGER) DESC,
      CAST(substr(patch,instr(patch,'.')+1) AS INTEGER) DESC LIMIT 1`)
      .first<{ patch: string; updated_at: string; source: string }>();
    if (!sync) return empty;
    const since = Date.now() - BUILD_WINDOW_DAYS * 86400_000;
    const positions = (await DB.prepare(`SELECT o.position AS slug, COUNT(*) AS games
      FROM build_observations o JOIN build_matches m ON m.match_id=o.match_id
      WHERE o.champion_id=? AND m.patch=? AND m.played_at>=? GROUP BY o.position ORDER BY games DESC, o.position`)
      .bind(championId, sync.patch, since).all<{ slug: BuildPosition; games: number }>()).results;
    // 명시한 포지션은 빈 표본이어도 유지한다. 최초에는 분류, 그 자리에 표본이 없으면 최다 관측 포지션.
    const position = requestedPosition && BUILD_POSITIONS.some((p) => p.slug === requestedPosition) ? fallback :
      positions.some((p) => p.slug === fallback) ? fallback : positions[0]?.slug ?? fallback;
    const filter = "FROM build_observations o JOIN build_matches m ON m.match_id=o.match_id WHERE o.champion_id=? AND o.position=? AND m.patch=? AND m.played_at>=?";
    const bind = [championId, position, sync.patch, since];
    const [summary, ...groups] = await Promise.all([
      DB.prepare(`SELECT COUNT(*) AS games, COALESCE(SUM(o.win),0) AS wins, MIN(m.played_at) AS start, MAX(m.played_at) AS end ${filter}`)
        .bind(...bind).first<{ games: number; wins: number; start: number | null; end: number | null }>(),
      ...BUILD_KINDS.map(async (kind) => {
        const counts = (await DB.prepare(`SELECT o.${kind} AS key, COUNT(*) AS games, SUM(o.win) AS wins ${filter} AND o.${kind} IS NOT NULL GROUP BY o.${kind}`)
          .bind(...bind).all<{ key: string; games: number; wins: number }>()).results;
        return rankBuilds(kind, counts);
      }),
    ]);
    const itemIds = [...new Set(groups.filter((g) => g.kind !== "skills").flatMap((g) => g.rows.flatMap((r) => JSON.parse(r.key) as number[])))];
    const items: BuildView["items"] = {};
    if (itemIds.length) {
      const rows = (await DB.prepare(`SELECT item_id AS id, name, icon_url AS iconUrl FROM build_items WHERE patch=? AND item_id IN (${itemIds.map(() => "?").join(",")})`)
        .bind(sync.patch, ...itemIds).all<{ id: number; name: string; iconUrl: string }>()).results;
      for (const item of rows) items[item.id] = item;
    }
    return { ...empty, status: summary?.games ? "ok" : "empty", patch: sync.patch, position, positions,
      games: summary?.games ?? 0, wins: summary?.wins ?? 0, from: summary?.start ?? null, to: summary?.end ?? null,
      updatedAt: sync.updated_at, stale: Date.now() - Date.parse(sync.updated_at) > 86400_000, groups, items };
  } catch (error) {
    // 이 신규 기능의 스키마 미적용/DB 장애가 위키 열람까지 막지 않도록 한다.
    console.error("빌드 통계 조회 실패", error instanceof Error ? error.message : "D1 error");
    return { ...empty, status: "unavailable" };
  }
}
