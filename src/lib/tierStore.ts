/** 포지션별 티어 배정. 등급은 운영자가 D1에 저장하고, 문서 본문은 위키가 맡는다. */
import "server-only";

import { getCloudflareContext } from "@opennextjs/cloudflare";

import { getChampionBySlug } from "@/data/champions";
import { getPosition } from "@/data/taxonomy";
import type { Champion } from "@/data/types";
import { getTaxonomy } from "@/lib/taxonomyStore";

export const TIERS = ["S", "A", "B", "C", "D", "E", "F"] as const;
export type Tier = (typeof TIERS)[number];

type TierRow = { champion_slug: string; tier: Tier };
export type TierEntry = { champion: Champion; tier: Tier };

async function db() {
  const { env } = await getCloudflareContext({ async: true });
  return env.DB;
}

/** 공개 보드에는 현재 해당 포지션에 배정되고 활성화된 챔피언만 싣는다. */
export async function getTierEntries(positionSlug: string): Promise<TierEntry[]> {
  if (!getPosition(positionSlug)) return [];
  const [taxonomy, DB] = await Promise.all([getTaxonomy(), db()]);
  const rows = await DB.prepare(
    `SELECT champion_slug, tier FROM tier_placements WHERE position_slug = ?1`,
  ).bind(positionSlug).all<TierRow>();
  return (rows.results ?? [])
    .filter((row) => taxonomy.categoryOf(positionSlug, row.champion_slug))
    .map((row) => ({ champion: getChampionBySlug(row.champion_slug), tier: row.tier }))
    .filter((entry): entry is TierEntry => Boolean(entry.champion) && TIERS.includes(entry.tier))
    .sort((a, b) => a.champion.name.localeCompare(b.champion.name, "ko"));
}

/** 관리자에게는 현재 배정 여부와 관계없이 저장된 값을 보여 준다. */
export async function getTierAssignments(positionSlug: string): Promise<Map<string, Tier>> {
  const DB = await db();
  const rows = await DB.prepare(
    `SELECT champion_slug, tier FROM tier_placements WHERE position_slug = ?1`,
  ).bind(positionSlug).all<TierRow>();
  return new Map((rows.results ?? []).map((row) => [row.champion_slug, row.tier]));
}

export async function setTier(
  positionSlug: string,
  championSlug: string,
  tier: Tier | null,
  editorId: string,
): Promise<{ ok: true } | { ok: false; error: "invalid" }> {
  if (!getPosition(positionSlug) || !getChampionBySlug(championSlug) ||
      (tier !== null && !TIERS.includes(tier))) return { ok: false, error: "invalid" };

  const taxonomy = await getTaxonomy();
  if (!taxonomy.categoryOf(positionSlug, championSlug)) return { ok: false, error: "invalid" };

  const DB = await db();
  if (tier === null) {
    await DB.prepare(
      `DELETE FROM tier_placements WHERE position_slug = ?1 AND champion_slug = ?2`,
    ).bind(positionSlug, championSlug).run();
  } else {
    await DB.prepare(
      `INSERT INTO tier_placements (position_slug, champion_slug, tier, updated_at, updated_by)
       VALUES (?1, ?2, ?3, ?4, ?5)
       ON CONFLICT(position_slug, champion_slug) DO UPDATE SET
         tier = excluded.tier, updated_at = excluded.updated_at, updated_by = excluded.updated_by`,
    ).bind(positionSlug, championSlug, tier, new Date().toISOString(), editorId).run();
  }
  return { ok: true };
}
