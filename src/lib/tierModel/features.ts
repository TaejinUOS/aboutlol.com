/**
 * 티어 점수 `y = w1·x1 + w2·x2 + … + b`의 x들.
 *
 * 지표는 두 종류다.
 * - **strength**: 챔피언이 얼마나 강한가. 티어 점수에 들어간다.
 * - **control**: 라이엇이 *언제* 손대는가. 직전에 너프했으면 한동안 기다리는 식의 행동 습관이다.
 *   학습에는 넣어 강함 가중치가 이 습관에 오염되지 않게 하고, 티어 점수에서는 뺀다.
 *   "방금 너프됐다"는 이유로 티어를 깎으면 강함이 아니라 패치 일정을 보여 주게 된다.
 *
 * 값은 원본 단위(raw)로 만들고, 표준화(평균 0·표준편차 1)는 모델이 학습 자료로 정한다.
 * 결측은 `null`이다. 0으로 채우지 않는다 — 표준화 뒤 평균(0점 기여)으로 다루는 것은 `score.ts`의 몫이다.
 */

export type FeatureRole = "strength" | "control";
export type FeatureSource = "soloq" | "pro" | "operator" | "patch-history" | "derived";

export type FeatureDef = {
  id: FeatureId;
  label: string;
  /** 화면·문서에 그대로 쓰는 한 줄 설명. 방향(높을수록 어떻게)을 함께 적는다. */
  description: string;
  role: FeatureRole;
  source: FeatureSource;
  /** 학습 자료가 부족할 때 쓰는 사전 가중치(표준화 단위). 근거는 docs/TIER_MODEL.md. */
  prior: number;
  /** 이용자가 토글로 끌 수 있는가 (PRD_TIER_LIST.md 6장). */
  toggleable: boolean;
};

export const FEATURE_IDS = [
  "winRate",
  "pickRate",
  "banRate",
  "eliteWinGap",
  "winTrend",
  "pickTrend",
  "flex",
  "mastery",
  "masteryWinDiscount",
  "proPresence",
  "proLowWinCover",
  "difficulty",
  "blindPick",
  "recentNerfs",
  "recentBuffs",
  "patchesSinceChange",
  "newChampion",
] as const;
export type FeatureId = (typeof FEATURE_IDS)[number];

export const FEATURES: readonly FeatureDef[] = [
  {
    id: "winRate",
    label: "승률",
    description: "포지션 승률(%p, 50% 기준). 판수가 적으면 50% 쪽으로 당겨 우연을 줄인다. 높을수록 강하다.",
    role: "strength", source: "soloq", prior: 1.0, toggleable: false,
  },
  {
    id: "pickRate",
    label: "픽률",
    description: "그 포지션 경기 중 이 챔피언을 고른 비율(로그). 많이 고를수록 체감 성능이 좋다는 신호다.",
    role: "strength", source: "soloq", prior: 0.3, toggleable: true,
  },
  {
    id: "banRate",
    label: "밴율",
    description: "경기당 밴 비율(로그). 상대하기 싫을 만큼 강하거나 짜증스럽다는 신호다.",
    role: "strength", source: "soloq", prior: 0.6, toggleable: true,
  },
  {
    id: "eliteWinGap",
    label: "고티어 승률 차이",
    description: "마스터+ 승률 − 다이아 승률(%p). 잘하는 사람이 할수록 세지는 챔피언이다.",
    role: "strength", source: "soloq", prior: 0.2, toggleable: true,
  },
  {
    id: "winTrend",
    label: "승률 추세",
    description: "직전 패치 대비 승률 변화(%p). 오르는 중이면 아직 다 드러나지 않은 힘이 있다.",
    role: "strength", source: "soloq", prior: 0.2, toggleable: true,
  },
  {
    id: "pickTrend",
    label: "픽률 추세",
    description: "직전 패치 대비 픽률 변화(로그 비). 갑자기 몰리면 새 빌드·메타가 생겼다는 뜻이다.",
    role: "strength", source: "soloq", prior: 0.15, toggleable: true,
  },
  {
    id: "flex",
    label: "포지션 유연성",
    description: "경기의 10% 이상을 차지하는 포지션 수. 여러 라인에 서는 챔피언은 밴픽 가치가 높다.",
    role: "strength", source: "soloq", prior: 0.1, toggleable: true,
  },
  {
    id: "mastery",
    label: "장인 의존도",
    description: "숙련자에게 성과가 몰리는 정도(운영 평가 0~1). 단독으로는 강함을 뜻하지 않는다.",
    role: "strength", source: "operator", prior: 0, toggleable: true,
  },
  {
    id: "masteryWinDiscount",
    label: "장인 보정",
    description: "승률 초과분 × 장인 의존도. 장인 챔피언의 높은 승률은 주력 유저가 만든 것이라 깎아 본다(음의 가중치).",
    role: "strength", source: "derived", prior: -0.5, toggleable: true,
  },
  {
    id: "proPresence",
    label: "대회 픽밴률",
    description: "같은 패치 주요 리그의 픽+밴 비율. 협동 플레이에서 강하다는 신호다.",
    role: "strength", source: "pro", prior: 0.5, toggleable: true,
  },
  {
    id: "proLowWinCover",
    label: "대회 보정",
    description: "승률 부족분 × 대회 픽밴률. 대회 챔피언은 솔로랭크 승률이 낮아도 약하다고 단정하지 않는다(양의 가중치).",
    role: "strength", source: "derived", prior: 0.4, toggleable: true,
  },
  {
    id: "difficulty",
    label: "조작 난이도",
    description: "운영 평가 0~1. 어려운 챔피언은 평균 승률이 낮게 나와도 성능이 낮다는 뜻이 아니다.",
    role: "strength", source: "operator", prior: 0.1, toggleable: true,
  },
  {
    id: "blindPick",
    label: "선픽 적합도",
    description: "운영 평가 0~1. 상대를 모르고 골라도 손해가 적은 챔피언이다.",
    role: "strength", source: "operator", prior: 0.15, toggleable: true,
  },
  {
    id: "recentNerfs",
    label: "최근 너프",
    description: "직전 3패치의 너프 수(가까울수록 큰 비중). 라이엇은 너프 직후 결과를 기다린다.",
    role: "control", source: "patch-history", prior: -0.3, toggleable: false,
  },
  {
    id: "recentBuffs",
    label: "최근 버프",
    description: "직전 3패치의 버프 수. 버프가 과했으면 곧바로 되돌린다.",
    role: "control", source: "patch-history", prior: 0.1, toggleable: false,
  },
  {
    id: "patchesSinceChange",
    label: "마지막 변경 후 패치 수",
    description: "로그(1+패치 수). 오래 손대지 않은 챔피언은 다시 손댈 가능성이 낮다.",
    role: "control", source: "patch-history", prior: 0, toggleable: false,
  },
  {
    id: "newChampion",
    label: "신규·리워크",
    description: "출시·리워크 후 4패치 이내면 1. 숙련도 곡선 때문에 초기 지표가 실제보다 낮다.",
    role: "control", source: "patch-history", prior: 0, toggleable: false,
  },
];

export const FEATURE_BY_ID = new Map(FEATURES.map((f) => [f.id, f]));

/** 한 챔피언·포지션·패치의 원본 입력. 없으면 null — 0과 구분한다. */
export type ChampionInput = {
  games: number;
  wins: number;
  /** 0~1 */
  pickRate: number | null;
  /** 0~1, 밴을 기록한 경기가 없으면 null */
  banRate: number | null;
  eliteWinRate: number | null;
  diamondWinRate: number | null;
  prevWinRate: number | null;
  prevPickRate: number | null;
  flexPositions: number | null;
  /** 0~1 운영 평가 */
  mastery: number | null;
  /** 0~1 */
  proPresence: number | null;
  difficulty: number | null;
  blindPick: number | null;
  recentNerfs: number;
  recentBuffs: number;
  patchesSinceChange: number | null;
  newChampion: boolean;
};

export type RawFeatures = Record<FeatureId, number | null>;

/** 승률 축소 강도: 가상의 50% 경기를 이만큼 더해 본다. */
export const WIN_SHRINK_GAMES = 200;
/** 이보다 적게 관측된 챔피언·포지션은 산출 불가다. */
export const MIN_GAMES = 100;

function logRate(rate: number | null, floor = 0.001): number | null {
  return rate === null ? null : Math.log(Math.max(rate, floor));
}

export function shrunkWinRate(wins: number, games: number): number {
  return (wins + 0.5 * WIN_SHRINK_GAMES) / (games + WIN_SHRINK_GAMES);
}

/** 원본 입력 → 원본 단위 지표. 상호작용 항(장인·대회 보정)도 여기서 만든다. */
export function rawFeatures(input: ChampionInput): RawFeatures {
  const winPp = (shrunkWinRate(input.wins, input.games) - 0.5) * 100;
  const prevPp = input.prevWinRate === null ? null : (input.prevWinRate - 0.5) * 100;
  return {
    winRate: winPp,
    pickRate: logRate(input.pickRate),
    banRate: logRate(input.banRate),
    eliteWinGap:
      input.eliteWinRate === null || input.diamondWinRate === null
        ? null
        : (input.eliteWinRate - input.diamondWinRate) * 100,
    winTrend: prevPp === null ? null : winPp - prevPp,
    pickTrend:
      input.pickRate === null || input.prevPickRate === null
        ? null
        : Math.log(Math.max(input.pickRate, 0.001) / Math.max(input.prevPickRate, 0.001)),
    flex: input.flexPositions,
    mastery: input.mastery,
    // 사용자 요구: 장인 챔피언은 승률이 높아도 너프(=티어 상승) 근거로 보지 않는다.
    masteryWinDiscount: input.mastery === null ? null : Math.max(0, winPp) * input.mastery,
    proPresence: input.proPresence,
    // 사용자 요구: 대회 챔피언은 승률이 낮아도 버프(=티어 하락) 근거로 보지 않는다.
    proLowWinCover: input.proPresence === null ? null : Math.max(0, -winPp) * input.proPresence,
    difficulty: input.difficulty,
    blindPick: input.blindPick,
    recentNerfs: input.recentNerfs,
    recentBuffs: input.recentBuffs,
    patchesSinceChange: input.patchesSinceChange === null ? null : Math.log1p(input.patchesSinceChange),
    newChampion: input.newChampion ? 1 : 0,
  };
}
