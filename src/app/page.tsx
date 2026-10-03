import type { Metadata } from "next";
import { redirect } from "next/navigation";

import { recordsConfigured } from "@/lib/recordStore";
import { allChampions } from "@/data/champions";

import { FavoritePlayers } from "./FavoritePlayers";
import { NextMatchups } from "./NextMatchups";
import { RecordSearch } from "./RecordSearch";
import styles from "./page.module.css";

export const metadata: Metadata = {
  title: { absolute: "AboutLol" },
  description: "Riot ID로 최근 20경기를 살펴보고, 패배한 상대 챔피언의 ABOUTLOL 위키 상대법을 찾아보세요.",
};
export const dynamic = "force-dynamic";

export default async function HomePage({ searchParams }: {
  searchParams: Promise<{ riotId?: string | string[] }>;
}) {
  const params = await searchParams;
  // 기존 홈 검색 주소도 독립 전적 페이지로 이어 준다.
  if (typeof params.riotId === "string" && params.riotId) {
    redirect(`/records?${new URLSearchParams({ riotId: params.riotId.slice(0, 80) })}`);
  }
  const configured = await recordsConfigured();

  return (
    <div className={`shell ${styles.page}`}>
      <div className={styles.hero}>
        <p className="section-index">01 / ABOUTLOL HOME</p>
        <h1 className={styles.title} aria-label="홈">HOME</h1>
        <p className={styles.intro}>지난 판의 기록에서 다음 상대법으로. 최근 20경기의 데스와 분당 CS를 읽고, 어려웠던 상대를 다시 봅니다.</p>
        <span className={`sticker sticker--acid ${styles.heroSticker}`}>MATCH ARCHIVE / KR</span>
      </div>

      <div className={styles.contentGrid}>
        <FavoritePlayers current={null} />

        <div className={styles.content}>
          <RecordSearch configured={configured} />
          <NextMatchups championIcons={Object.fromEntries(allChampions.map((champion) => [champion.slug, champion.iconUrl]))} />
        </div>
      </div>
    </div>
  );
}
