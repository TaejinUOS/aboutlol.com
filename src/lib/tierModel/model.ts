/**
 * 패치노트 역추적으로 가중치를 학습한다.
 *
 * 정답: 스냅숏(패치 N의 지표) 다음에 라이엇이 내린 판단 — 버프(0) / 손대지 않음·조정(1) / 너프(2).
 * 모델: 순서형 로지스틱 회귀(cumulative logit).
 *
 *   s = Σ wᵢ·zᵢ                 (zᵢ = 표준화한 지표)
 *   P(버프)        = σ(θ₁ − s)
 *   P(버프 또는 유지) = σ(θ₂ − s)
 *
 * 티어 점수는 y = s + b, b = −(θ₁ + θ₂)/2 이다. y = 0이 "버프 경계와 너프 경계의 한가운데",
 * y ≥ (θ₂ − θ₁)/2 이면 라이엇이 너프할 만큼 강하다는 뜻이다. 그래서 등급 경계가 임의의
 * 숫자가 아니라 라이엇의 실제 판단 경계에 묶인다 (`score.ts`).
 *
 * 정규화는 사전 가중치 쪽으로 당긴다(0이 아니라). 라벨이 적은 동안에는 근거 있는 사전값을
 * 유지하고, 자료가 쌓일수록 자료가 이긴다. 자료가 전혀 없는 지표(z가 전부 0)는 사전값 그대로다.
 */
import { FEATURES, FEATURE_IDS, type FeatureId, type RawFeatures } from "./features";

export type Label = 0 | 1 | 2;
export const LABEL_NAMES = ["버프", "유지", "너프"] as const;

export type TrainingRow = {
  patch: string;
  champion: string;
  position: string;
  raw: RawFeatures;
  label: Label;
};

export type FeatureParams = {
  weight: number;
  mean: number;
  sd: number;
  /** 학습 자료에 값이 있던 행 수. 0이면 가중치는 사전값 그대로다. */
  observed: number;
};

export type TierModel = {
  version: string;
  trainedAt: string;
  /** prior-only: 학습 자료가 없어 사전 가중치만 쓴다. 공개 점수로 쓰지 않는다. */
  status: "prior-only" | "trained";
  features: Record<FeatureId, FeatureParams>;
  thresholds: { buffNone: number; noneNerf: number };
  bias: number;
  training: { rows: number; patches: string[]; labels: Record<(typeof LABEL_NAMES)[number], number>; lambda: number };
  metrics: EvaluationReport | null;
};

const sigmoid = (x: number) => (x >= 0 ? 1 / (1 + Math.exp(-x)) : Math.exp(x) / (1 + Math.exp(x)));

// ---------------------------------------------------------------- 표준화

function standardize(rows: TrainingRow[]): Record<FeatureId, Omit<FeatureParams, "weight">> {
  const out = {} as Record<FeatureId, Omit<FeatureParams, "weight">>;
  for (const id of FEATURE_IDS) {
    const values = rows.map((r) => r.raw[id]).filter((v): v is number => v !== null && Number.isFinite(v));
    const mean = values.length ? values.reduce((a, b) => a + b, 0) / values.length : 0;
    const variance = values.length > 1 ? values.reduce((a, v) => a + (v - mean) ** 2, 0) / (values.length - 1) : 0;
    const sd = Math.sqrt(variance);
    out[id] = sd > 1e-9 ? { mean, sd, observed: values.length } : { mean: 0, sd: 1, observed: 0 };
  }
  return out;
}

export function zValue(raw: number | null, params: Pick<FeatureParams, "mean" | "sd" | "observed">): number {
  if (raw === null || !Number.isFinite(raw) || params.observed === 0) return 0;
  return (raw - params.mean) / params.sd;
}

// ---------------------------------------------------------------- 학습

export type TrainOptions = {
  /** 사전 가중치로 당기는 강도. 클수록 사전값을 믿는다. */
  lambda?: number;
  iterations?: number;
  learningRate?: number;
  /** 학습에서 뺄 지표 (비교 실험용). 가중치 0으로 고정한다. */
  disabled?: ReadonlySet<FeatureId>;
  version?: string;
};

export function train(rows: TrainingRow[], options: TrainOptions = {}): TierModel {
  const lambda = options.lambda ?? 2;
  const iterations = options.iterations ?? 2500;
  const lr = options.learningRate ?? 0.05;
  const disabled = options.disabled ?? new Set<FeatureId>();
  const stats = standardize(rows);
  const d = FEATURE_IDS.length;
  const prior = FEATURE_IDS.map((id) => (disabled.has(id) ? 0 : FEATURES.find((f) => f.id === id)!.prior));
  const Z = rows.map((r) => FEATURE_IDS.map((id) => (disabled.has(id) ? 0 : zValue(r.raw[id], stats[id]))));

  // 시작점: 사전 가중치, 경계는 라벨 비율에서.
  const w = [...prior];
  const n = rows.length;
  const count = [0, 0, 0];
  rows.forEach((r) => count[r.label]++);
  const logit = (p: number) => Math.log(p / (1 - p));
  const clamp = (p: number) => Math.min(0.99, Math.max(0.01, p));
  let t1 = logit(clamp((count[0] + 1) / (n + 3)));
  let delta = Math.log(Math.max(0.1, logit(clamp((count[0] + count[1] + 2) / (n + 3))) - t1));

  // Adam
  const params = d + 2;
  const m = new Array(params).fill(0);
  const v = new Array(params).fill(0);
  const b1 = 0.9, b2 = 0.999, eps = 1e-8;

  for (let it = 1; it <= iterations && n > 0; it++) {
    const grad = new Array(params).fill(0);
    const t2 = t1 + Math.exp(delta);
    for (let i = 0; i < n; i++) {
      const z = Z[i];
      let s = 0;
      for (let j = 0; j < d; j++) s += w[j] * z[j];
      const a = t1 - s, b = t2 - s;
      const sa = sigmoid(a), sb = sigmoid(b);
      let dA = 0, dB = 0; // ∂(−log p)/∂a, ∂(−log p)/∂b
      const y = rows[i].label;
      if (y === 0) dA = -(1 - sa);
      else if (y === 2) dB = sb;
      else {
        const D = Math.max(sb - sa, 1e-12);
        dB = -(sb * (1 - sb)) / D;
        dA = (sa * (1 - sa)) / D;
      }
      const dS = -(dA + dB);
      for (let j = 0; j < d; j++) grad[j] += dS * z[j];
      grad[d] += dA + dB;
      grad[d + 1] += dB * Math.exp(delta);
    }
    for (let j = 0; j < d; j++) grad[j] = grad[j] / n + (lambda / n) * (w[j] - prior[j]);
    grad[d] /= n;
    grad[d + 1] /= n;
    const values = [...w, t1, delta];
    for (let k = 0; k < params; k++) {
      if (k < d && disabled.has(FEATURE_IDS[k])) continue;
      m[k] = b1 * m[k] + (1 - b1) * grad[k];
      v[k] = b2 * v[k] + (1 - b2) * grad[k] ** 2;
      const mh = m[k] / (1 - b1 ** it), vh = v[k] / (1 - b2 ** it);
      values[k] -= (lr * mh) / (Math.sqrt(vh) + eps);
    }
    for (let j = 0; j < d; j++) w[j] = values[j];
    t1 = values[d];
    delta = values[d + 1];
  }

  const t2 = t1 + Math.exp(delta);
  const features = {} as Record<FeatureId, FeatureParams>;
  FEATURE_IDS.forEach((id, j) => (features[id] = { weight: w[j], ...stats[id] }));
  return {
    version: options.version ?? "dev",
    trainedAt: new Date().toISOString(),
    status: n > 0 ? "trained" : "prior-only",
    features,
    thresholds: { buffNone: t1, noneNerf: t2 },
    bias: -(t1 + t2) / 2,
    training: {
      rows: n,
      patches: [...new Set(rows.map((r) => r.patch))],
      labels: { 버프: count[0], 유지: count[1], 너프: count[2] },
      lambda,
    },
    metrics: null,
  };
}

/** 학습할 자료가 하나도 없을 때의 모델. 경계는 대략 "패치당 5%가 버프, 5%가 너프"로 둔다. */
export function priorModel(version = "prior"): TierModel {
  const model = train([], { version });
  const t = Math.log(0.05 / 0.95);
  return { ...model, thresholds: { buffNone: t, noneNerf: -t }, bias: 0 };
}

/** s = Σ w·z — 학습 공간의 선형 점수. 통제 지표까지 모두 넣는다. */
export function linearScore(model: TierModel, raw: RawFeatures): number {
  return FEATURE_IDS.reduce((sum, id) => sum + model.features[id].weight * zValue(raw[id], model.features[id]), 0);
}

export function probabilities(model: TierModel, raw: RawFeatures): [number, number, number] {
  const s = linearScore(model, raw);
  const p0 = sigmoid(model.thresholds.buffNone - s);
  const p01 = sigmoid(model.thresholds.noneNerf - s);
  return [p0, p01 - p0, 1 - p01];
}

// ---------------------------------------------------------------- 평가

export type EvaluationReport = {
  /** 앞 패치로 학습하고 다음 패치를 맞힌 횟수 */
  folds: number;
  rows: number;
  logLoss: number;
  /** 라벨 비율만 아는 모델의 로그 손실. 이보다 낮아야 의미가 있다. */
  baselineLogLoss: number;
  /** 너프된 챔피언이 아닌 챔피언보다 점수가 높을 확률 */
  aucNerf: number;
  /** 버프된 챔피언이 아닌 챔피언보다 점수가 낮을 확률 */
  aucBuff: number;
  /** 패치마다 너프 수 k만큼 상위 k를 골랐을 때 실제 너프 비율 */
  precisionAtKNerf: number;
  precisionAtKBuff: number;
};

export function auc(scores: number[], positive: boolean[]): number {
  const pairs = scores.map((s, i) => [s, positive[i]] as const).sort((a, b) => a[0] - b[0]);
  let rankSum = 0, pos = 0;
  for (let i = 0; i < pairs.length; ) {
    let j = i;
    while (j < pairs.length && pairs[j][0] === pairs[i][0]) j++;
    const avgRank = (i + 1 + j) / 2;
    for (let k = i; k < j; k++) if (pairs[k][1]) { rankSum += avgRank; pos++; }
    i = j;
  }
  const neg = pairs.length - pos;
  if (!pos || !neg) return NaN;
  return (rankSum - (pos * (pos + 1)) / 2) / (pos * neg);
}

/**
 * 시간 순 검증: 패치 i를 맞힐 때는 i보다 앞선 패치만 학습한다. 미래를 보고 과거를 맞히지 않는다.
 * `minTrainPatches`보다 앞 패치가 적은 구간은 건너뛴다.
 */
export function evaluate(rows: TrainingRow[], patchOrder: readonly string[], options: TrainOptions & { minTrainPatches?: number } = {}): EvaluationReport | null {
  const minTrain = options.minTrainPatches ?? 4;
  const present = patchOrder.filter((p) => rows.some((r) => r.patch === p));
  const scored: { s: number; p: [number, number, number]; row: TrainingRow }[] = [];
  let folds = 0;
  for (let i = minTrain; i < present.length; i++) {
    const before = new Set(present.slice(0, i));
    const trainRows = rows.filter((r) => before.has(r.patch));
    const testRows = rows.filter((r) => r.patch === present[i]);
    const model = train(trainRows, { ...options, iterations: options.iterations ?? 1200 });
    for (const row of testRows) scored.push({ s: linearScore(model, row.raw), p: probabilities(model, row.raw), row });
    folds++;
  }
  if (!scored.length) return null;

  const eps = 1e-9;
  const logLoss = -scored.reduce((a, x) => a + Math.log(Math.max(x.p[x.row.label], eps)), 0) / scored.length;
  // 기준선: 학습 구간의 라벨 비율(여기서는 전체 비율로 근사 — 기준선에 유리하다).
  const freq = [0, 1, 2].map((k) => scored.filter((x) => x.row.label === k).length / scored.length);
  const baselineLogLoss = -scored.reduce((a, x) => a + Math.log(Math.max(freq[x.row.label], eps)), 0) / scored.length;

  const precision = (label: Label, sign: 1 | -1) => {
    let hit = 0, total = 0;
    for (const patch of new Set(scored.map((x) => x.row.patch))) {
      const group = scored.filter((x) => x.row.patch === patch);
      const k = group.filter((x) => x.row.label === label).length;
      if (!k) continue;
      const top = [...group].sort((a, b) => sign * (b.s - a.s)).slice(0, k);
      hit += top.filter((x) => x.row.label === label).length;
      total += k;
    }
    return total ? hit / total : NaN;
  };

  return {
    folds,
    rows: scored.length,
    logLoss,
    baselineLogLoss,
    aucNerf: auc(scored.map((x) => x.s), scored.map((x) => x.row.label === 2)),
    aucBuff: auc(scored.map((x) => -x.s), scored.map((x) => x.row.label === 0)),
    precisionAtKNerf: precision(2, 1),
    precisionAtKBuff: precision(0, -1),
  };
}
