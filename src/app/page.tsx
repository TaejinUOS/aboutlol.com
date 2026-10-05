import { Suspense } from "react";
import type { Metadata } from "next";
import { redirect } from "next/navigation";

import { LaneSelectionScreen } from "@/components/lanes/LaneSelectionScreen";
import { PATCH } from "@/data/champions";
import { buildBracketBoards, buildLaneData } from "@/data/lanes";
import { withPreviewData } from "@/data/lanePreview";
import { DEFAULT_POSITION_SLUG } from "@/data/taxonomy";
import { getTaxonomy } from "@/lib/taxonomyStore";
import { getTierScores } from "@/lib/tierScoreStore";
import { getAllTierPlacements } from "@/lib/tierStore";

/** 분류와 티어가 D1에 있으므로 운영자가 고친 배치가 바로 보여야 한다. */
export const dynamic = "force-dynamic";
export const metadata: Metadata = {
  title: { absolute: "AboutLol" },
  description: "라인과 챔피언을 고르고, 상대 챔피언별 ABOUTLOL 위키 상대법을 찾아보세요.",
};

/** 사이트의 첫 화면은 챔피언(라인 선택) 화면이다. 전적은 `/records`로 옮겼다. */
export default async function HomePage({ searchParams }: {
  searchParams: Promise<{ riotId?: string | string[]; preview?: string | string[] }>;
}) {
  const params = await searchParams;
  // 예전 홈 전적 검색 주소도 전적 페이지로 이어 준다.
  if (typeof params.riotId === "string" && params.riotId) {
    redirect(`/records?${new URLSearchParams({ riotId: params.riotId.slice(0, 80) })}`);
  }
  const [taxonomy, tiers, scores] = await Promise.all([getTaxonomy(), getAllTierPlacements(), getTierScores()]);
  const real = buildLaneData(taxonomy, tiers);
  // 티어 구간별 모델 점수. 공개된 점수가 없는 구간은 화면에서 "준비 중"이다.
  const boards = buildBracketBoards(taxonomy, scores);
  // 디자인 확인용 가짜 티어·통계. 개발 서버에서만 켜지고 운영 빌드에서는 무시한다.
  const preview = process.env.NODE_ENV === "development" && params.preview === "1";
  const lanes = preview ? withPreviewData(real) : real;

  return (
    // useSearchParams를 쓰는 화면이라 Suspense 경계가 필요하다.
    <Suspense fallback={<div style={{ minHeight: "60vh" }} />}>
      <LaneSelectionScreen lanes={lanes} boards={boards} defaultLane={DEFAULT_POSITION_SLUG} patch={PATCH} />
    </Suspense>
  );
}
