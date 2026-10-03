"use client";

import Image from "next/image";
import Link from "next/link";
import { useEffect, useState } from "react";

import { ro } from "@/lib/josa";
import styles from "./page.module.css";

const STORAGE_KEY = "aboutlol.lastMatchups.v1";

export type MatchupSnapshot = {
  riotId: string;
  recommendations: { opponent: string; champion: string; matchupHref: string }[];
};

function readSnapshot(): MatchupSnapshot | null {
  try {
    const stored: unknown = JSON.parse(localStorage.getItem(STORAGE_KEY) ?? "null");
    if (typeof stored !== "object" || stored === null || !("riotId" in stored) ||
      typeof stored.riotId !== "string" || stored.riotId.length > 80 ||
      !("recommendations" in stored) || !Array.isArray(stored.recommendations)) return null;

    const recommendations = stored.recommendations.filter((item): item is MatchupSnapshot["recommendations"][number] =>
      typeof item === "object" && item !== null &&
      typeof item.opponent === "string" && item.opponent.length <= 40 &&
      typeof item.champion === "string" && item.champion.length <= 40 &&
      typeof item.matchupHref === "string" && /^\/matchup\/[a-z0-9]+\?tab=board&me=[a-z0-9]+$/.test(item.matchupHref)
    ).slice(0, 4);
    return { riotId: stored.riotId, recommendations };
  } catch {
    return null;
  }
}

/** 성공한 조회만 기억한다. 실패한 검색은 이전 상대법 목록을 지우지 않는다. */
export function RememberMatchups({ current }: { current: MatchupSnapshot }) {
  useEffect(() => {
    try { localStorage.setItem(STORAGE_KEY, JSON.stringify(current)); } catch { /* 저장할 수 없어도 전적은 표시한다. */ }
  }, [current]);
  return null;
}

export function NextMatchups({ championIcons }: { championIcons: Record<string, string> }) {
  const [snapshot, setSnapshot] = useState<MatchupSnapshot | null>(null);

  useEffect(() => {
    setSnapshot(readSnapshot());
  }, []);

  return (
    <section className={styles.recommendations} aria-labelledby="recommend-heading">
      <div className={styles.sectionHeading}>
        <p className="mono">03 / NEXT MATCHUP</p>
        <h2 id="recommend-heading">패배한 상대, 다음엔 다르게</h2>
      </div>
      {snapshot && <p className={styles.recommendSource}>최근 검색 · {snapshot.riotId}</p>}
      {snapshot && snapshot.recommendations.length > 0 ? (
        <ul className={styles.recommendList}>
          {snapshot.recommendations.map((item) => {
            const slug = item.matchupHref.split("?")[0].slice("/matchup/".length);
            const iconUrl = championIcons[slug];
            return <li key={item.opponent}>
              <Link href={item.matchupHref}>
                <span className={styles.recommendIcon}>
                  {iconUrl && <Image src={iconUrl} alt="" width={48} height={48} />}
                </span>
                <span className={styles.recommendChampion}>{item.opponent}</span>
                <span className={styles.recommendContext}>{item.champion}{ro(item.champion)} 상대했던 경기</span>
                <span className={styles.recommendArrow} aria-hidden="true">↗</span>
              </Link>
            </li>;
          })}
        </ul>
      ) : <p className={styles.recommendEmpty}>
        {snapshot
          ? "최근 검색의 패배 경기에서 같은 포지션의 상대 챔피언을 확인하지 못했습니다."
          : "전적을 검색하면 확인된 패배 상대의 상대법을 이 홈에 모아 둡니다."}
      </p>}
    </section>
  );
}
