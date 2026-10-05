/**
 * 라인 선택 화면(`/`)이 쓰는 직렬화 가능한 데이터 뷰.
 *
 * 라인 대표 표지 5장이 곧 라인 선택이고, 표지를 고르면 그 라인 챔피언이 티어
 * 내림차순 목록으로 펼쳐진다 (DESIGN_ARCANE.md 6.2). 라인을 바꿀 때마다 서버를
 * 왕복하지 않도록 다섯 라인의 목록을 첫 응답에 모두 싣는다 — selection.ts와 같은 이유다.
 */

import type { TaxonomySnapshot } from "@/lib/taxonomyStore";

import { positions } from "./champions";

/** `tierStore.ts`의 TIERS와 같은 순서. 그 파일은 server-only라 여기서 가져올 수 없다. */
export const LANE_TIERS = ["S", "1", "2", "3", "4", "5"] as const;
export type LaneTier = (typeof LANE_TIERS)[number];

/** 운영자가 아직 등급을 매기지 않은 챔피언 묶음. 목록 맨 아래에 둔다. */
export const UNRANKED = "unranked" as const;

type LaneCover = {
  image: string;
  /** 가로 원본을 세로 포스터로 자를 때의 초점 (`object-position`). */
  focus: string;
  alt: string;
};

/** 다섯 표지 모두 자운 출신이다 — 초록 자운 배경과 세계관이 맞는다. */
const LANE_COVERS: Record<string, LaneCover> = {
  top: { image: "/images/Mundo.jpg", focus: "50% 22%", alt: "문도 박사" },
  jungle: { image: "/images/Warwick.jpg", focus: "66% 52%", alt: "워윅" },
  mid: { image: "/images/Viktor.jpg", focus: "47% 18%", alt: "빅토르" },
  adc: { image: "/images/Jinx.jpg", focus: "55% 14%", alt: "징크스" },
  support: { image: "/images/Renata.jpg", focus: "52% 18%", alt: "레나타 글라스크" },
};

/**
 * 이 라인에서의 승률·픽률·밴율 (0~1). 아직 공급원이 연결되지 않아 모두 null이고,
 * 화면은 null을 `—`로 그린다. 값을 임의로 채우지 않는다.
 */
export type LaneStats = {
  winRate: number | null;
  pickRate: number | null;
  banRate: number | null;
};

export type LaneChampion = {
  slug: string;
  name: string;
  iconUrl: string;
  stats: LaneStats;
};

export type TierGroup = {
  tier: LaneTier | typeof UNRANKED;
  champions: LaneChampion[];
};

export type LaneView = {
  slug: string;
  name: string;
  code: string;
  cover: LaneCover;
  groups: TierGroup[];
  championCount: number;
};

export function buildLaneData(
  taxonomy: TaxonomySnapshot,
  tiers: ReadonlyMap<string, LaneTier>,
): LaneView[] {
  return positions
    .filter((position) => position.active && LANE_COVERS[position.slug])
    .map((position) => {
      const byTier = new Map<TierGroup["tier"], LaneChampion[]>();
      const roster = taxonomy.championsInPosition(position.slug);

      for (const champion of roster) {
        const tier = tiers.get(`${position.slug}/${champion.slug}`) ?? UNRANKED;
        const list = byTier.get(tier) ?? [];
        list.push({
          slug: champion.slug,
          name: champion.name,
          iconUrl: champion.iconUrl,
          stats: { winRate: null, pickRate: null, banRate: null },
        });
        byTier.set(tier, list);
      }

      const order: TierGroup["tier"][] = [...LANE_TIERS, UNRANKED];
      const groups = order
        .filter((tier) => byTier.has(tier))
        .map((tier) => ({
          tier,
          champions: byTier.get(tier)!.sort((a, b) => a.name.localeCompare(b.name, "ko")),
        }));

      return {
        slug: position.slug,
        name: position.name,
        code: position.code,
        cover: LANE_COVERS[position.slug],
        groups,
        championCount: roster.length,
      };
    });
}
