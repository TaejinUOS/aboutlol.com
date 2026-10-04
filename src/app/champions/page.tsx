import { Suspense } from "react";
import type { Metadata } from "next";

import { LaneSelectionScreen } from "@/components/lanes/LaneSelectionScreen";
import { PATCH } from "@/data/champions";
import { buildLaneData } from "@/data/lanes";
import { DEFAULT_POSITION_SLUG } from "@/data/taxonomy";
import { getTaxonomy } from "@/lib/taxonomyStore";
import { getAllTierPlacements } from "@/lib/tierStore";

/** 분류와 티어가 D1에 있으므로 운영자가 고친 배치가 바로 보여야 한다. */
export const dynamic = "force-dynamic";
export const metadata: Metadata = { title: "챔피언" };

export default async function ChampionsPage() {
  const [taxonomy, tiers] = await Promise.all([getTaxonomy(), getAllTierPlacements()]);
  const lanes = buildLaneData(taxonomy, tiers);

  return (
    // useSearchParams를 쓰는 화면이라 Suspense 경계가 필요하다.
    <Suspense fallback={<div style={{ minHeight: "60vh" }} />}>
      <LaneSelectionScreen lanes={lanes} defaultLane={DEFAULT_POSITION_SLUG} patch={PATCH} />
    </Suspense>
  );
}
