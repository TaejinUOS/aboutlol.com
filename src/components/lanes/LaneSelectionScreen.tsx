"use client";

import Link from "next/link";
import { usePathname, useRouter, useSearchParams } from "next/navigation";
import { useCallback } from "react";

import { UNRANKED, type LaneView } from "@/data/lanes";
import { buildQuery } from "@/lib/url";

import styles from "./LaneSelectionScreen.module.css";

type Props = {
  lanes: LaneView[];
  defaultLane: string;
  patch: string;
};

/** 낙서는 장식이다. 정보는 HTML 텍스트가 맡고, 이미지는 접근성 트리에서 뺀다. */
function Doodle({ name, className }: { name: string; className: string }) {
  return <img className={className} src={`/images/arcane/doodle-${name}.webp`} alt="" aria-hidden="true" />;
}

export function LaneSelectionScreen({ lanes, defaultLane, patch }: Props) {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();

  const requested = searchParams.get("position");
  const laneSlug = lanes.some((lane) => lane.slug === requested) ? requested! : defaultLane;
  const lane = lanes.find((item) => item.slug === laneSlug) ?? lanes[0];
  /* 원숭이 낙서는 선택한 표지(왕관·폭발 자리)와 겹치지 않게 맨 오른쪽 비선택 표지에 붙인다. */
  const monkeyLane = [...lanes].reverse().find((item) => item.slug !== laneSlug)?.slug;

  const selectLane = useCallback(
    (slug: string) => {
      if (slug === laneSlug) return;
      router.replace(`${pathname}${buildQuery(searchParams.toString(), { position: slug, category: null, q: null })}`, {
        scroll: false,
      });
    },
    [laneSlug, pathname, router, searchParams],
  );

  return (
    <div className={styles.screen}>
      {/* 자운 원경과 연기 띠. 그림으로 칠한 배경이라 정보를 담지 않는다. */}
      <div className={styles.backdrop} aria-hidden="true" />

      <div className={`shell ${styles.inner}`}>
        <header className={styles.masthead}>
          <h1 className={`display ${styles.headline}`}>
            누굴 상대해
            <span className={styles.question}>
              ?
              <Doodle name="circle" className={styles.questionCircle} />
            </span>
          </h1>
          <p className={`mono ${styles.meta}`}>
            {lane.code} / PATCH {patch} / TIER
          </p>
        </header>

        <nav className={styles.lanes} aria-label="라인 선택">
          {lanes.map((item) => {
            const current = item.slug === laneSlug;
            return (
              <button
                key={item.slug}
                type="button"
                className={`${styles.lane} ${current ? styles.laneCurrent : ""}`}
                aria-pressed={current}
                aria-controls="lane-tier-list"
                onClick={() => selectLane(item.slug)}
              >
                {current && (
                  <svg className={styles.burst} viewBox="0 0 200 200" aria-hidden="true">
                    <polygon
                      className={styles.burstPink}
                      points="100,0 118,62 182,18 140,78 200,96 138,116 190,176 120,138 104,200 88,140 22,186 62,118 0,104 60,84 12,26 82,62"
                    />
                    <polygon
                      className={styles.burstLime}
                      points="100,22 114,72 164,40 132,86 178,100 130,112 168,158 116,128 102,176 90,130 40,164 72,112 24,100 70,88 34,44 86,74"
                    />
                  </svg>
                )}

                <span className={styles.poster}>
                  <img
                    className={styles.posterImage}
                    src={item.cover.image}
                    alt=""
                    style={{ objectPosition: item.cover.focus }}
                    loading="eager"
                    decoding="async"
                  />
                </span>

                <span className={`display ${styles.laneName}`}>
                  {item.name}
                  <span className="sr-only"> — 대표 표지 {item.cover.alt}, 챔피언 {item.championCount}명</span>
                </span>

                {current && (
                  <>
                    <Doodle name="crown" className={styles.crown} />
                    {/* 끝이 둥근 굵은 방울. 줄기보다 끝을 부풀려 물감이 맺힌 모양을 만든다. */}
                    <svg className={styles.drips} viewBox="0 0 120 80" aria-hidden="true">
                      <path d="M0 0h120v8c-6 3-10 2-14 6v22a9 9 0 1 1-12 0V16c-8-3-14 3-22 1v34a10 10 0 1 1-13 0V18c-8-2-12 2-20 0v12a9 9 0 1 1-12 0V12C18 9 10 12 0 8z" />
                    </svg>
                  </>
                )}
                {item.slug === monkeyLane && <Doodle name="monkey" className={styles.monkey} />}
              </button>
            );
          })}
        </nav>

        <section id="lane-tier-list" className={styles.board} aria-labelledby="lane-tier-heading">
          <Doodle name="arrow" className={styles.arrow} />
          <div className={styles.boardHead}>
            <h2 id="lane-tier-heading" className={`display ${styles.boardTitle}`}>
              {lane.name} · 티어순
            </h2>
            <p className={styles.boardNote}>높은 티어부터 · {lane.championCount}명</p>
          </div>

          {lane.groups.length === 0 ? (
            <p className={styles.empty}>이 라인에 배정된 챔피언이 아직 없습니다.</p>
          ) : (
            <ol className={styles.groups} key={lane.slug}>
              {lane.groups.map((group, index) => {
                const unranked = group.tier === UNRANKED;
                return (
                  <li key={group.tier} className={styles.group}>
                    <h3
                      className={`display ${styles.tier} ${index === 0 && !unranked ? styles.tierTop : ""} ${
                        unranked ? styles.tierUnranked : ""
                      }`}
                    >
                      {unranked ? "미배정" : group.tier}
                      {!unranked && <span className="sr-only">티어</span>}
                    </h3>
                    <ul className={styles.rows}>
                      {group.champions.map((champion) => (
                        <li key={champion.slug}>
                          <Link className={styles.row} href={`/matchup/${champion.slug}?buildPosition=${lane.slug}`}>
                            <img className={styles.icon} src={champion.iconUrl} alt="" width={48} height={48} loading="lazy" />
                            <span className={styles.name}>{champion.name}</span>
                            {champion.category && <span className={styles.category}>{champion.category}</span>}
                          </Link>
                        </li>
                      ))}
                    </ul>
                  </li>
                );
              })}
            </ol>
          )}
          <p className={styles.footnote}>등급은 운영자가 배정합니다. 미배정 챔피언은 맨 아래에 이름순으로 둡니다.</p>
        </section>
      </div>
    </div>
  );
}
