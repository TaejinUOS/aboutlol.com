"use client";

import Link from "next/link";
import { usePathname, useSearchParams } from "next/navigation";
import { useCallback } from "react";

import { PortalCylinder, useFlatLayout } from "@/components/wiki/PortalCylinder";
import { UNRANKED, type LaneView } from "@/data/lanes";
import { buildQuery } from "@/lib/url";

import styles from "./LaneSelectionScreen.module.css";

type Props = {
  lanes: LaneView[];
  defaultLane: string;
  patch: string;
};

/**
 * 라인 표지를 원통형 회전 진열로 거는지 (2026-10-05 시험). 끄면 예전처럼 한 줄 표지다.
 * 모바일 폭에서는 이 값과 상관없이 한 줄 표지를 쓴다 — 표지 다섯이 세로로 쌓이면
 * 아래 티어 목록이 한참 밀려나기 때문이다.
 */
const LANE_CYLINDER = true;

/** 비율 한 칸. 값이 없으면 지어내지 않고 `—`로 둔다. */
function Stat({ label, value }: { label: string; value: number | null }) {
  return (
    <span className={`mono ${styles.stat} ${value === null ? styles.statEmpty : ""}`}>
      <span className="sr-only">{label} </span>
      {value === null ? "—" : `${(value * 100).toFixed(1)}%`}
      {value === null && <span className="sr-only">자료 없음</span>}
    </span>
  );
}

/** 낙서는 장식이다. 정보는 HTML 텍스트가 맡고, 이미지는 접근성 트리에서 뺀다. */
function Doodle({ name, className }: { name: string; className: string }) {
  return <img className={className} src={`/images/arcane/doodle-${name}.webp`} alt="" aria-hidden="true" />;
}

export function LaneSelectionScreen({ lanes, defaultLane, patch }: Props) {
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
      /*
       * 다섯 라인의 목록을 이미 다 받아 두었으므로 서버에 다시 묻지 않고 주소만 바꾼다.
       * 원통을 빠르게 돌려도 앞선 요청의 응답이 늦게 와 정면을 되돌리는 일이 없다.
       */
      window.history.replaceState(
        null,
        "",
        `${pathname}${buildQuery(searchParams.toString(), { position: slug, category: null, q: null })}`,
      );
    },
    [laneSlug, pathname, searchParams],
  );

  const flat = useFlatLayout();
  const cylinder = LANE_CYLINDER && !flat;

  const renderLane = (item: LaneView) => {
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
            draggable={false}
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
        {!cylinder && item.slug === monkeyLane && <Doodle name="monkey" className={styles.monkey} />}
      </button>
    );
  };

  return (
    <div className={`${styles.screen} ${cylinder ? styles.screenCylinder : ""}`}>
      {/* 자운 원경과 연기 띠. 그림으로 칠한 배경이라 정보를 담지 않는다. */}
      <div className={styles.backdrop} aria-hidden="true" />

      <div className={`shell ${styles.inner}`}>
        <header className={styles.masthead}>
          <h1 className={`display ${styles.headline}`}>어느 라인 가?</h1>
          <p className={`mono ${styles.meta}`}>
            {lane.code} / PATCH {patch} / TIER
          </p>
        </header>

        {cylinder ? (
          <PortalCylinder
            className={styles.cylinder}
            items={lanes}
            getKey={(item) => item.slug}
            getLabel={(item) => item.name}
            activeKey={laneSlug}
            label="라인 선택"
            itemNoun="라인"
            // 티어 목록을 첫 화면 안으로 끌어올리려고 버튼 줄은 뺀다. 옆 표지를 누르거나 끌어서 돌린다.
            controls={false}
            // 돌려서 정면에 온 라인이 곧 선택한 라인이다.
            onFrontChange={selectLane}
            renderFace={(item) => renderLane(item)}
          />
        ) : (
          <nav className={styles.lanes} aria-label="라인 선택">
            {lanes.map((item) => renderLane(item))}
          </nav>
        )}

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
            <>
              {/*
                열 제목. 목록이 여러 열로 흐르므로 열마다 하나씩 두고, 보이는 열 수만큼만
                드러낸다. 각 줄의 수치는 자기 이름을 소리로 따로 갖는다.
              */}
              <div className={styles.listHeads} aria-hidden="true">
                {[0, 1].map((column) => (
                  <div key={column} className={`mono ${styles.listHead}`}>
                    <span>티어 · 챔피언</span>
                    <span>승률</span>
                    <span>픽률</span>
                    <span>밴율</span>
                  </div>
                ))}
              </div>
              {/*
                목록만 따로 스크롤한다. 두 열일 때는 왼쪽 열을 위에서 아래로 다 채운 뒤
                오른쪽 열로 넘어가도록 줄 수(--rows)를 넘긴다.
              */}
              <ol
                className={styles.list}
                key={lane.slug}
                style={{ ["--rows" as string]: Math.ceil(lane.championCount / 2) }}
                tabIndex={0}
                aria-label={`${lane.name} 챔피언 목록`}
              >
                {lane.groups.flatMap((group) =>
                  group.champions.map((champion) => {
                    const unranked = group.tier === UNRANKED;
                    return (
                      <li key={champion.slug}>
                        <Link className={styles.row} href={`/matchup/${champion.slug}?buildPosition=${lane.slug}`}>
                          <img className={styles.icon} src={champion.iconUrl} alt="" width={48} height={48} loading="lazy" />
                          <span
                            className={`display ${styles.badge} ${group.tier === "S" ? styles.badgeTop : ""} ${
                              unranked ? styles.badgeUnranked : ""
                            }`}
                          >
                            {unranked ? "–" : group.tier}
                            <span className="sr-only">{unranked ? " 미배정" : " 티어"}</span>
                          </span>
                          <span className={styles.name} title={champion.name}>{champion.name}</span>
                          <Stat label="승률" value={champion.stats.winRate} />
                          <Stat label="픽률" value={champion.stats.pickRate} />
                          <Stat label="밴율" value={champion.stats.banRate} />
                        </Link>
                      </li>
                    );
                  }),
                )}
              </ol>
            </>
          )}
          <p className={styles.footnote}>
            등급은 운영자가 배정합니다. 미배정 챔피언은 맨 아래에 이름순으로 둡니다. 승률·픽률·밴율은 준비 중입니다.
          </p>
        </section>
      </div>
    </div>
  );
}
