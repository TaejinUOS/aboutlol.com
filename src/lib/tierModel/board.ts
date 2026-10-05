/**
 * 구간별 스냅숏 + 하나의 학습된 모델 → 공개 티어 보드 행.
 *
 * 가중치는 다섯 구간을 합친 자료로 한 번만 학습하고(`dataset.ts`), 여기서 각 구간의 지표를 넣어
 * 구간별 점수를 낸다. 같은 챔피언이 실버에서는 S, 마스터+에서는 3일 수 있다.
 */
import { championInput, type DatasetInputs, type Snapshot } from "./dataset";
import { rawFeatures } from "./features";
import type { TierModel } from "./model";
import { calculateChampionScore, type ScoreTier } from "./score";

export type BoardRow = {
  bracket: string;
  position: string;
  champion: string;
  games: number;
  wins: number;
  pickRate: number | null;
  banRate: number | null;
  score: number | null;
  tier: ScoreTier | null;
};

export function scoreSnapshot(
  snapshot: Snapshot,
  previous: Snapshot | undefined,
  inputs: Omit<DatasetInputs, "snapshots">,
  model: TierModel,
): BoardRow[] {
  return snapshot.rows.map((row) => {
    const prev = previous?.rows.find((r) => r.champion === row.champion && r.position === row.position);
    const raw = rawFeatures(championInput(row, snapshot.line, prev, inputs));
    const result = calculateChampionScore(raw, row.games, model);
    return {
      bracket: snapshot.bracket,
      position: row.position,
      champion: row.champion,
      games: row.games,
      wins: row.wins,
      pickRate: row.pickRate,
      banRate: row.banRate,
      score: result.score,
      tier: result.tier,
    };
  });
}

/**
 * 공개해도 되는 모델인가 (PRD_TIER_LIST.md 11장, TIER_MODEL.md 6장).
 * 시간 순 검증에서 기준선보다 낫고, 너프·버프 순위가 무작위보다 분명히 나아야 한다.
 */
export const MIN_PUBLISH_AUC = 0.6;

export function publishGate(model: TierModel | null): { ok: true } | { ok: false; reason: string } {
  if (!model) return { ok: false, reason: "모델 파일이 없습니다 — npm run tier:train" };
  if (model.status !== "trained") return { ok: false, reason: "사전 가중치만 있는 모델입니다 (학습 행 0)" };
  const m = model.metrics;
  if (!m) return { ok: false, reason: "시간 순 검증 결과가 없습니다 (앞선 패치 4개 이상 필요)" };
  if (!(m.logLoss < m.baselineLogLoss)) return { ok: false, reason: `로그 손실 ${m.logLoss.toFixed(4)}이 기준선 ${m.baselineLogLoss.toFixed(4)}보다 낫지 않습니다` };
  if (!(m.aucNerf >= MIN_PUBLISH_AUC && m.aucBuff >= MIN_PUBLISH_AUC)) {
    return { ok: false, reason: `AUC 너프 ${m.aucNerf.toFixed(3)} / 버프 ${m.aucBuff.toFixed(3)} — ${MIN_PUBLISH_AUC} 미만` };
  }
  return { ok: true };
}
