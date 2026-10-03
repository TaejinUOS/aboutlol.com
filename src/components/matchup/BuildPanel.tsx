"use client";

import Image from "next/image";
import { BUILD_POSITIONS, MIN_BUILD_SAMPLE, type BuildGroup, type BuildView } from "@/lib/buildStats";
import type { ChampionView } from "./types";
import styles from "./BuildPanel.module.css";

const LABELS = {
  starter: { title: "시작 아이템", detail: "첫 90초 안에 구매한 아이템 조합. 장신구는 제외합니다." },
  boots: { title: "신발", detail: "처음 구매한 업그레이드 신발. 신발을 완성한 경기 안에서 집계합니다." },
  core: { title: "핵심 아이템", detail: "신발을 제외한 첫 3개 완성 아이템의 구매 순서. 3코어를 완성한 경기 안에서 집계합니다." },
  skills: { title: "스킬 빌드", detail: "레벨 1–9의 실제 스킬 습득 순서. 9번 이상 스킬을 배운 경기 안에서 집계합니다." },
};
const format = (number: number) => new Intl.NumberFormat("ko-KR").format(number);
const date = (value: number | string) => new Intl.DateTimeFormat("ko-KR", {
  timeZone: "Asia/Seoul", month: "numeric", day: "numeric", hour: "2-digit", minute: "2-digit", hour12: false,
}).format(new Date(value));
const percent = (value: number) => `${value.toFixed(1)}%`;

function BuildSection({ group, view, champion, index }: { group: BuildGroup; view: BuildView; champion: ChampionView; index: number }) {
  const label = LABELS[group.kind];
  return (
    <section className={styles.section} aria-labelledby={`build-${group.kind}`}>
      <header className={styles.sectionHeader}>
        <span className={`mono ${styles.index}`}>{String(index + 1).padStart(2, "0")}</span>
        <div><h3 id={`build-${group.kind}`}>{label.title}</h3><p>{label.detail}</p></div>
        <span className={`mono ${styles.eligible}`}>유효 {format(group.eligible)}판</span>
      </header>
      {group.rows.length ? (
        <ol className={styles.rows}>
          {group.rows.map((row) => {
            const values = JSON.parse(row.key) as number[];
            return (
              <li key={row.key} className={`${styles.row} ${row.recommended ? styles.recommended : ""}`}>
                <div className={styles.build}>
                  {row.recommended && <span className={`sticker sticker--acid ${styles.badge}`}>추천 · 최다 선택</span>}
                  {group.kind === "skills" ? (
                    <ol className={styles.skills} aria-label="레벨 1부터 9까지 습득 순서">
                      {values.map((slot, level) => {
                        const letter = ["", "Q", "W", "E", "R"][slot];
                        const spell = champion.spells.find((s) => s.slot === letter);
                        return <li key={level} title={`${level + 1}레벨: ${letter} ${spell?.name ?? ""}`}>
                          <span className={`mono ${styles.level}`}>{level + 1}</span>
                          <span className={`${styles.skill} ${letter === "R" ? styles.ultimate : ""}`}>{letter}</span>
                        </li>;
                      })}
                    </ol>
                  ) : (
                    <ol className={styles.items} aria-label={group.kind === "core" ? "코어 아이템 구매 순서" : "아이템 조합"}>
                      {values.map((id, itemIndex) => {
                        const item = view.items[id];
                        return <li key={`${id}-${itemIndex}`}>
                          {group.kind === "core" && itemIndex > 0 && <span className={styles.arrow} aria-hidden="true">→</span>}
                          <span className={styles.item}>
                            {item && <Image src={item.iconUrl} width={40} height={40} alt="" unoptimized />}
                            <span>{item?.name ?? `아이템 ${id}`}</span>
                          </span>
                        </li>;
                      })}
                    </ol>
                  )}
                </div>
                <dl className={styles.metrics}>
                  <div><dt>선택률</dt><dd className="mono">{percent(row.pickRate)}</dd></div>
                  <div><dt>승률</dt><dd className="mono">{percent(row.winRate)}</dd></div>
                  <div><dt>표본</dt><dd className="mono">{format(row.games)}판</dd></div>
                </dl>
                {row.games < MIN_BUILD_SAMPLE && <span className={styles.smallSample}>표본 부족 · 참고용</span>}
              </li>
            );
          })}
        </ol>
      ) : <p className={styles.emptySection}>아직 이 빌드를 집계할 수 있는 경기가 없습니다.</p>}
    </section>
  );
}

export function BuildPanel({ champion, view, onPositionChange }: {
  champion: ChampionView; view: BuildView; onPositionChange: (position: string) => void;
}) {
  return (
    <div className={styles.document}>
      <header className={styles.header}>
        <p className={`mono ${styles.kicker}`}>BUILD NOTES / RIOT MATCH DATA</p>
        <h2 className={`display ${styles.title}`}>{champion.name} 빌드</h2>
        <p className={styles.lead}>실제 경기의 구매 순서와 스킬 습득 기록으로 고르는 빌드.</p>
      </header>
      <div className={styles.filters} role="group" aria-label="빌드 포지션">
        {BUILD_POSITIONS.map((position) => <button key={position.slug} type="button"
          aria-pressed={position.slug === view.position}
          className={position.slug === view.position ? styles.positionCurrent : styles.position}
          onClick={() => onPositionChange(position.slug)}>{position.name}</button>)}
      </div>
      <p className={styles.scope}>KR · 다이아몬드 이상 · 솔로 랭크 · {view.patch ? `패치 ${view.patch}` : "수집 대기"} · 패치 전체 누적</p>
      {view.status !== "ok" ? (
        <div className={styles.empty} role="status">
          <span className="sticker sticker--acid">{view.status === "unavailable" ? "조회 지연" : "표본 대기"}</span>
          <h3>{view.status === "unavailable" ? "빌드 통계를 불러오지 못했습니다." : "이 포지션의 경기 표본이 아직 없습니다."}</h3>
          <p>{view.status === "unavailable" ? "잠시 후 다시 확인해 주세요." : "수집된 실제 경기가 쌓이면 시작 아이템, 신발, 3코어와 스킬 빌드를 표시합니다. 다른 포지션도 확인해 보세요."}</p>
        </div>
      ) : (
        <>
          <dl className={styles.summary}>
            <div><dt>챔피언 표본</dt><dd className="mono">{format(view.games)}판</dd></div>
            <div><dt>표본 승률</dt><dd className="mono">{percent(view.wins / view.games * 100)}</dd></div>
            <div><dt>집계 기간 · 한국 시간</dt><dd>{view.from && date(view.from)} – {view.to && date(view.to)}</dd></div>
          </dl>
          <p className={styles.note}>조합당 {MIN_BUILD_SAMPLE}판 이상 중 가장 많이 선택한 빌드를 추천합니다. 선택률은 각 항목의 유효 표본을 기준으로 하며, 승률은 해당 빌드를 사용한 경기의 결과입니다.</p>
          {view.groups.map((group, index) => <BuildSection key={group.kind} group={group} view={view} champion={champion} index={index} />)}
        </>
      )}
      <footer className={styles.method}>
        {view.updatedAt && <p>마지막 수집: {date(view.updatedAt)}{view.stale && " · 갱신 지연: 24시간 이상 지난 자료입니다."}</p>}
        <p>라이엇 API의 경기·타임라인을 ABOUTLOL이 집계합니다. 수집 시점에 최근 48시간 안에 KR 다이아몬드 이상 래더에서 확인한 계정의 빌드만 포함합니다. 티어는 래더 확인 시점 기준이며 경기 당시 티어를 복원한 값이 아닙니다. 패치 첫 경기부터 역탐색해 누적하며 수집은 진행 중입니다. 전체 경기의 전수 통계는 아닙니다.</p>
        <p>10분 미만 경기와 조기 항복은 제외합니다. 3코어 승률에는 장기 경기와 아이템 완성 여부의 영향이 있으므로 빌드 자체의 효과로 해석하지 마세요.</p>
      </footer>
    </div>
  );
}
