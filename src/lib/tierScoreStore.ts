/** 공개 티어 점수(`tier_scores`) 읽기. 쓰기는 `npm run tier:publish`만 한다. */
import "server-only";

import { getCloudflareContext } from "@opennextjs/cloudflare";

import type { BracketScore } from "@/data/lanes";

type Row = {
  bracket: string; position_slug: string; champion_slug: string; patch: string; model_version: string;
  score: number | null; tier: string | null; games: number; wins: number; pick_rate: number | null; ban_rate: number | null;
};

/**
 * 모든 구간·포지션의 점수를 한 번에 읽는다. 라인·구간을 바꿀 때마다 서버를 왕복하지 않도록
 * 첫 응답에 싣는다 (`lanes.ts`와 같은 이유). 표가 아직 없으면(0017 미적용) 빈 목록 — 화면은 "준비 중"이다.
 */
export async function getTierScores(): Promise<BracketScore[]> {
  const { env } = await getCloudflareContext({ async: true });
  try {
    const rows = await env.DB.prepare(
      `SELECT bracket, position_slug, champion_slug, patch, model_version, score, tier, games, wins, pick_rate, ban_rate
       FROM tier_scores`,
    ).all<Row>();
    return (rows.results ?? []).map((r) => ({
      bracket: r.bracket,
      position: r.position_slug,
      champion: r.champion_slug,
      patch: r.patch,
      modelVersion: r.model_version,
      score: r.score,
      tier: r.tier,
      games: r.games,
      wins: r.wins,
      pickRate: r.pick_rate,
      banRate: r.ban_rate,
    }));
  } catch (error) {
    if (error instanceof Error && /no such table/i.test(error.message)) return [];
    throw error;
  }
}
