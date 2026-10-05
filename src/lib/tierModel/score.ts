/**
 * 티어 점수 y = Σ wᵢ·zᵢ + b 와 등급.
 *
 * PRD_TIER_LIST.md 3.1의 계약을 따른다.
 * - 강함(strength) 지표만 점수에 들어간다. 통제(control) 지표는 학습에만 쓴다 (`features.ts`).
 * - 이용자가 끈 지표와 자료가 없는 지표는 기여 0(= 표준화 평균)이고, 상태로 이유를 구분한다.
 * - 승률을 계산할 판수가 모자라면 점수와 등급은 null이다. 임의의 0점을 만들지 않는다.
 * - 같은 입력·같은 모델이면 같은 결과다 (난수·시각을 쓰지 않는다).
 */
import { FEATURES, MIN_GAMES, type FeatureId, type RawFeatures } from "./features";
import { zValue, type TierModel } from "./model";

/** lanes.ts의 LANE_TIERS와 같은 순서. */
export const SCORE_TIERS = ["S", "1", "2", "3", "4", "5"] as const;
export type ScoreTier = (typeof SCORE_TIERS)[number];

export type FactorStatus = "적용" | "사용자가 제외" | "데이터 부족" | "해당 없음";

export type Factor = {
  id: FeatureId;
  raw: number | null;
  z: number;
  weight: number;
  /** weight × z. 점수에 실제로 더해진 값. */
  contribution: number;
  status: FactorStatus;
};

export type ChampionScore = {
  score: number | null;
  tier: ScoreTier | null;
  factors: Factor[];
  /** 적용된 강함 지표의 |가중치| 합 / 전체 강함 지표의 |가중치| 합. 정확도가 아니다. */
  coverage: number;
  reason: "ok" | "표본 부족";
};

/**
 * 등급 경계. 너프 경계(+h) 이상이 S, 버프 경계(−h) 이하가 5,
 * 그 사이를 넷으로 고르게 나눠 1~4로 둔다. h = (θ₂ − θ₁)/2.
 */
export function tierCuts(model: TierModel): number[] {
  const h = (model.thresholds.noneNerf - model.thresholds.buffNone) / 2;
  // 내림차순: [S 하한, 1 하한, 2 하한, 3 하한, 4 하한]
  return [h, h / 2, 0, -h / 2, -h];
}

export function tierOf(score: number, model: TierModel): ScoreTier {
  const cuts = tierCuts(model);
  const index = cuts.findIndex((cut) => score >= cut);
  return SCORE_TIERS[index === -1 ? SCORE_TIERS.length - 1 : index];
}

export function calculateChampionScore(
  raw: RawFeatures,
  games: number,
  model: TierModel,
  excluded: ReadonlySet<FeatureId> = new Set(),
): ChampionScore {
  let score = model.bias;
  let applied = 0;
  let total = 0;
  const factors: Factor[] = FEATURES.map((feature) => {
    const params = model.features[feature.id];
    const value = raw[feature.id];
    const z = zValue(value, params);
    let status: FactorStatus = "적용";
    if (feature.role === "control") status = "해당 없음";
    else if (excluded.has(feature.id) && feature.toggleable) status = "사용자가 제외";
    else if (value === null || params.observed === 0) status = "데이터 부족";

    if (feature.role === "strength") total += Math.abs(params.weight);
    const contribution = status === "적용" ? params.weight * z : 0;
    if (status === "적용") {
      applied += Math.abs(params.weight);
      score += contribution;
    }
    return { id: feature.id, raw: value, z, weight: params.weight, contribution, status };
  });

  const coverage = total > 0 ? applied / total : 0;
  if (games < MIN_GAMES || raw.winRate === null) {
    return { score: null, tier: null, factors, coverage, reason: "표본 부족" };
  }
  return { score, tier: tierOf(score, model), factors, coverage, reason: "ok" };
}
