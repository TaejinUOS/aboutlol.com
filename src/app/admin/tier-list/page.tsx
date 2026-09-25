import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";

import { DEFAULT_POSITION_SLUG, getPosition, positions } from "@/data/taxonomy";
import { setTierAction } from "@/lib/actions/tierActions";
import { requirePageAdmin } from "@/lib/authGuard";
import { getTaxonomy } from "@/lib/taxonomyStore";
import { getTierAssignments, TIERS } from "@/lib/tierStore";
import { articleHref } from "@/lib/wikiTitle";

import styles from "./page.module.css";

export const metadata: Metadata = { title: "티어 배정 관리", robots: { index: false, follow: false } };
export const dynamic = "force-dynamic";

export default async function AdminTierListPage({ searchParams }: {
  searchParams: Promise<{ position?: string; done?: string; error?: string }>;
}) {
  await requirePageAdmin();
  const { position: requested, done, error } = await searchParams;
  const positionSlug = getPosition(requested ?? "") ? requested! : DEFAULT_POSITION_SLUG;
  const position = getPosition(positionSlug)!;
  const [taxonomy, assigned] = await Promise.all([
    getTaxonomy(), getTierAssignments(positionSlug),
  ]);
  const champions = taxonomy.championsInPosition(positionSlug);

  return (
    <div className={`shell ${styles.page}`}>
      <p className="section-index">관리자 / TIER EDITOR</p>
      <h1 className={styles.title}>티어 배정</h1>
      <p className={styles.lead}>챔피언의 포지션별 등급을 선택하고 저장합니다. 공개 티어표에는 저장한 배정만 나타납니다.</p>
      <p className={styles.lead}>배정 기준과 변경 이유는 <Link href={articleHref("티어표 작성 근거")}>티어표 작성 근거 문서 ↗</Link>에 기록해 주세요.</p>

      <nav className={styles.positions} aria-label="관리할 포지션">
        {positions.filter((item) => item.active).map((item) => (
          <Link key={item.slug} href={`/admin/tier-list?position=${item.slug}`}
            className={item.slug === positionSlug ? styles.selected : ""}
            aria-current={item.slug === positionSlug ? "page" : undefined}>{item.name}</Link>
        ))}
      </nav>

      {done && <p className={styles.feedback} role="status">티어 배정을 저장했습니다.</p>}
      {error && <p className={styles.feedback} role="alert">현재 포지션에 있는 활성 챔피언과 S~F 등급을 선택해 주세요.</p>}

      <div className={styles.listHeading}>
        <h2>{position.name} 챔피언</h2>
        <Link href={`/tier-list?position=${positionSlug}`}>공개 티어표 보기 ↗</Link>
      </div>
      {champions.length === 0 && <p>이 포지션에 배정된 챔피언이 없습니다.</p>}
      <ul className={styles.list}>
        {champions.map((champion) => (
          <li key={champion.slug}>
            <form action={setTierAction} className={styles.row}>
              <input type="hidden" name="positionSlug" value={positionSlug} />
              <input type="hidden" name="championSlug" value={champion.slug} />
              <Image src={champion.iconUrl} alt="" width={48} height={48} />
              <span className={styles.name}>{champion.name}</span>
              <label>
                <span className="sr-only">{champion.name} 티어</span>
                <select name="tier" defaultValue={assigned.get(champion.slug) ?? ""}>
                  <option value="">미배정</option>
                  {TIERS.map((tier) => <option key={tier} value={tier}>{tier}</option>)}
                </select>
              </label>
              <button className="btn btn--acid" type="submit">저장</button>
            </form>
          </li>
        ))}
      </ul>
    </div>
  );
}
