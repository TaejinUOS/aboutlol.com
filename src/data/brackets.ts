/**
 * 티어 구간 다섯 개. 수집·지표 스냅숏·티어 점수·화면이 모두 이 정의를 쓴다.
 *
 * 라이엇 밸런스 프레임워크는 일반·상위·최상위 솔로랭크와 대회를 나눠 본다. 다섯 구간은 그 생각을
 * 빌린 ABOUTLOL의 구분이며 라이엇 공식 구간이 아니다 (docs/TIER_MODEL.md "티어 구간").
 * 구간이 많을수록 구간마다 필요한 표본이 곱해지므로 열 개 티어를 다섯으로 묶었다.
 *
 * 클라이언트에서도 import한다. 서버 전용 모듈을 끌어오지 않는다.
 */

export const RIOT_TIERS = [
  "IRON", "BRONZE", "SILVER", "GOLD", "PLATINUM", "EMERALD", "DIAMOND", "MASTER", "GRANDMASTER", "CHALLENGER",
] as const;
export type RiotTier = (typeof RIOT_TIERS)[number];

export type Bracket = {
  slug: BracketSlug;
  name: string;
  /** 좁은 자리용 짧은 이름 */
  short: string;
  tiers: readonly RiotTier[];
};

export const BRACKET_SLUGS = ["iron-silver", "gold-platinum", "emerald", "diamond", "master-plus"] as const;
export type BracketSlug = (typeof BRACKET_SLUGS)[number];

export const BRACKETS: readonly Bracket[] = [
  { slug: "iron-silver", name: "아이언 ~ 실버", short: "아이언~실버", tiers: ["IRON", "BRONZE", "SILVER"] },
  { slug: "gold-platinum", name: "골드 ~ 플래티넘", short: "골드~플래", tiers: ["GOLD", "PLATINUM"] },
  { slug: "emerald", name: "에메랄드", short: "에메랄드", tiers: ["EMERALD"] },
  { slug: "diamond", name: "다이아몬드", short: "다이아", tiers: ["DIAMOND"] },
  { slug: "master-plus", name: "마스터 이상", short: "마스터+", tiers: ["MASTER", "GRANDMASTER", "CHALLENGER"] },
];

/** 다섯 구간을 합친 자료. 모델 학습은 라이엇 판단과 가장 가까운 이 자료로 한다. */
export const ALL_BRACKETS = "all" as const;

/** 마스터 이상은 디비전이 없고 리그 전체를 한 번에 받는다. */
export const APEX_TIERS: readonly RiotTier[] = ["MASTER", "GRANDMASTER", "CHALLENGER"];
export const DIVISIONS = ["I", "II", "III", "IV"] as const;

const BY_TIER = new Map<string, BracketSlug>(BRACKETS.flatMap((b) => b.tiers.map((t) => [t, b.slug] as const)));

export function bracketOfTier(tier: string): BracketSlug | undefined {
  return BY_TIER.get(tier.toUpperCase());
}

export function getBracket(slug: string | null | undefined): Bracket | undefined {
  return BRACKETS.find((b) => b.slug === slug);
}
