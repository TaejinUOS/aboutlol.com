import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";

import { DEFAULT_POSITION_SLUG, getPosition, positions } from "@/data/taxonomy";
import { getViewer } from "@/lib/authGuard";
import { getTierEntries, TIERS } from "@/lib/tierStore";
import { articleHref, titleKey } from "@/lib/wikiTitle";
import { getArticleView } from "@/lib/wikiStore";

import styles from "./page.module.css";

export const metadata: Metadata = {
  title: "티어표",
  description: "포지션별 챔피언 티어표와 작성 근거를 함께 확인하세요.",
};
export const dynamic = "force-dynamic";

const BASIS_TITLE = "티어표 작성 근거";

export default async function TierListPage({ searchParams }: {
  searchParams: Promise<{ position?: string | string[] }>;
}) {
  const { position: requested } = await searchParams;
  const positionSlug = typeof requested === "string" && getPosition(requested)
    ? requested : DEFAULT_POSITION_SLUG;
  const position = getPosition(positionSlug)!;
  const [article, entries, viewer] = await Promise.all([
    getArticleView(titleKey(BASIS_TITLE)),
    getTierEntries(positionSlug),
    getViewer(),
  ]);
  const hasBasis = article?.status === "published";
  const basisHref = articleHref(BASIS_TITLE);

  return (
    <div className={`shell ${styles.page}`}>
      <h1 className="sr-only">티어표</h1>

      <section className={styles.basis} aria-labelledby="basis-heading">
        <div className={styles.basisText}>
          <p className="mono">WIKI / RANKING GUIDE</p>
          <h2 id="basis-heading">{BASIS_TITLE}</h2>
          <p>{hasBasis ? "등급 기준과 변경 이유를 위키 문서에서 확인하세요." : "작성 근거 문서를 준비 중입니다."}</p>
        </div>
        <Link className={`btn btn--acid ${styles.basisLink}`} href={basisHref}>
          {hasBasis ? "근거 문서 보기" : "근거 문서 작성"} <span aria-hidden="true">↗</span>
        </Link>
      </section>

      <section className={styles.board} aria-labelledby="tier-board-heading">
        <div className={styles.boardHeading}>
          <h2 id="tier-board-heading">포지션별 티어표</h2>
          {viewer?.role === "admin" && <Link href={`/admin/tier-list?position=${positionSlug}`} className={styles.adminLink}>티어 배정 관리 ↗</Link>}
        </div>

        <nav className={styles.positions} aria-label="티어표 포지션">
          {positions.filter((item) => item.active).map((item) => (
            <Link key={item.slug} href={`/tier-list?position=${item.slug}`}
              className={`${styles.position} ${item.slug === positionSlug ? styles.selected : ""}`}
              aria-current={item.slug === positionSlug ? "page" : undefined}>
              {item.name}
            </Link>
          ))}
        </nav>

        <div className={styles.tierRows}>
          {TIERS.map((tier) => {
            const champions = entries.filter((entry) => entry.tier === tier);
            return <div className={styles.tierRow} key={tier}>
              <h3 className={`${styles.grade} ${styles[`grade${tier}`]}`}>{tier}<span className="sr-only">등급</span></h3>
              <div className={styles.champions} aria-label={`${position.name} ${tier}등급 챔피언`}>
                {champions.length ? champions.map(({ champion }) => (
                  <Link href={`/matchup/${champion.slug}`} key={champion.slug}
                    className={styles.champion} aria-label={`${champion.name} 위키로 이동`} title={champion.name}>
                    <Image src={champion.iconUrl} alt="" width={72} height={72} />
                    <span>{champion.name}</span>
                  </Link>
                )) : <span className={styles.noChampions}>배정된 챔피언 없음</span>}
              </div>
            </div>;
          })}
        </div>
        <p className={styles.footnote}>운영자가 등급을 배정한 챔피언만 표시합니다. 아이콘을 누르면 해당 챔피언 위키로 이동합니다.</p>
      </section>
    </div>
  );
}
