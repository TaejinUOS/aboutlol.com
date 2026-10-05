/**
 * 디자인 확인용 가짜 티어·통계. 개발 서버에서 `/?preview=1`일 때만 쓴다 (`src/app/page.tsx`).
 *
 * 값은 챔피언·라인 이름으로 정해지는 의사난수라 새로고침해도 같다. 실제 자료가 아니므로
 * 운영 빌드에서는 절대 부르지 않는다.
 */

import { LANE_TIERS, type LaneChampion, type LaneTier, type LaneView } from "./lanes";

/** 문자열에서 0~1 사이의 고정된 값을 만든다 (FNV-1a). */
function unit(seed: string): number {
  let hash = 0x811c9dc5;
  for (let i = 0; i < seed.length; i += 1) {
    hash ^= seed.charCodeAt(i);
    hash = Math.imul(hash, 0x01000193);
  }
  return (hash >>> 0) / 0xffffffff;
}

/** 티어 분포: S 8% · 1 17% · 2 25% · 3 25% · 4 15% · 5 10%. */
const TIER_CUTS: [LaneTier, number][] = [
  ["S", 0.08],
  ["1", 0.25],
  ["2", 0.5],
  ["3", 0.75],
  ["4", 0.9],
  ["5", 1],
];

function tierFor(key: string): LaneTier {
  const roll = unit(`${key}:tier`);
  return TIER_CUTS.find(([, cut]) => roll <= cut)![0];
}

export function withPreviewData(lanes: LaneView[]): LaneView[] {
  return lanes.map((lane) => {
    const byTier = new Map<LaneTier, LaneChampion[]>();
    for (const champion of lane.groups.flatMap((group) => group.champions)) {
      const key = `${lane.slug}/${champion.slug}`;
      const tier = tierFor(key);
      // 높은 티어일수록 승률·픽률이 조금 높게 나오도록 기울인다.
      const lift = (LANE_TIERS.length - 1 - LANE_TIERS.indexOf(tier)) / (LANE_TIERS.length - 1);
      const list = byTier.get(tier) ?? [];
      list.push({
        ...champion,
        stats: {
          winRate: 0.46 + unit(`${key}:win`) * 0.04 + lift * 0.04,
          pickRate: 0.004 + unit(`${key}:pick`) * 0.06 + lift * 0.08,
          banRate: unit(`${key}:ban`) ** 2 * (0.05 + lift * 0.3),
        },
      });
      byTier.set(tier, list);
    }
    return {
      ...lane,
      groups: LANE_TIERS.filter((tier) => byTier.has(tier)).map((tier) => ({
        tier,
        // 실제 목록(`buildLaneData`)과 같이 같은 티어 안에서는 이름순이다.
        champions: byTier.get(tier)!.sort((a, b) => a.name.localeCompare(b.name, "ko")),
      })),
    };
  });
}
