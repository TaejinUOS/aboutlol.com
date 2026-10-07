import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";

import { getRecords, recordsConfigured, type RecordResult, type RecordRow } from "@/lib/recordStore";
import { allChampions } from "@/data/champions";
import { FavoritePlayers } from "../FavoritePlayers";
import { NextMatchups, RememberMatchups } from "../NextMatchups";
import { RecordSearch } from "../RecordSearch";
import styles from "../page.module.css";

export const metadata: Metadata = { title: "전적", description: "한국 서버 Riot ID로 최근 20경기의 전적을 확인하세요.", alternates: { canonical: "/records" } };
export const dynamic = "force-dynamic";

function dateLabel(timestamp: number | null) {
  if (timestamp === null) return "경기 일시 없음";
  return new Intl.DateTimeFormat("ko-KR", {
    timeZone: "Asia/Seoul",
    year: "numeric", month: "2-digit", day: "2-digit", hour: "2-digit", minute: "2-digit", hour12: false,
  }).format(timestamp);
}

function durationLabel(seconds: number | null) {
  if (seconds === null) return "—";
  return `${Math.floor(seconds / 60)}:${String(Math.floor(seconds % 60)).padStart(2, "0")}`;
}

function statusMessage(result: Exclude<RecordResult, { status: "ok" }>) {
  switch (result.status) {
    case "invalid": return "Riot ID를 게임 이름#태그 형식으로 입력해 주세요.";
    case "missing": return "해당 Riot ID를 찾지 못했습니다. 이름과 태그를 확인해 주세요.";
    case "rate-limited": return `Riot 조회 한도에 도달했습니다. 약 ${result.retrySeconds ?? 60}초 뒤 다시 검색해 주세요.`;
    case "not-configured": return "전적 검색을 준비 중입니다. 잠시 후 다시 이용해 주세요.";
    case "unavailable": {
      const message = "지금은 Riot 전적을 불러올 수 없습니다. 잠시 뒤 다시 시도해 주세요.";
      // 개발 중에는 만료된 키(403)와 Riot 장애를 구분할 수 있게 응답 코드를 붙인다.
      return process.env.NODE_ENV !== "production" && result.riotStatus ? `${message} (Riot 응답 ${result.riotStatus})` : message;
    }
  }
}

function MatchRow({ row, index }: { row: RecordRow; index: number }) {
  return (
    <li className={`${styles.match} ${row.win ? "" : styles.loss}`}>
      <div className={styles.matchLead}>
        <span className={`mono ${styles.matchIndex}`}>{String(index + 1).padStart(2, "0")}</span>
        <span className={`${styles.result} ${row.win ? styles.resultWin : styles.resultLoss}`}>{row.win ? "승리" : "패배"}</span>
        <span className={styles.queue}>{row.queue}</span>
      </div>
      <div className={styles.matchBody}>
        <div className={styles.champion}>
          {row.iconUrl && <Image src={row.iconUrl} alt="" width={64} height={64} className={styles.icon} />}
          <div>
            <p className={styles.championName}>{row.champion}</p>
            <p className={`mono ${styles.matchDate}`}>
              {row.endedAt !== null ? <time dateTime={new Date(row.endedAt).toISOString()}>{dateLabel(row.endedAt)}</time> : dateLabel(null)}
            </p>
          </div>
        </div>
        <dl className={styles.metrics}>
          <div className={styles.keyMetric}><dt>데스</dt><dd>{row.deaths}</dd></div>
          <div className={styles.keyMetric}><dt>분당 CS</dt><dd>{row.csPerMinute === null ? "—" : row.csPerMinute.toFixed(1)}</dd></div>
          <div><dt>킬 / 어시</dt><dd>{row.kills} / {row.assists}</dd></div>
          <div><dt>게임 시간 · 총 CS</dt><dd>{durationLabel(row.durationSeconds)} · {row.cs ?? "—"}</dd></div>
        </dl>
      </div>
      {row.matchupHref && <Link className={styles.matchupLink} href={row.matchupHref}>
        {row.opponent} 상대법 보기 <span aria-hidden="true">↗</span>
      </Link>}
    </li>
  );
}

export default async function RecordsPage({ searchParams }: {
  searchParams: Promise<{ riotId?: string | string[] }>;
}) {
  const params = await searchParams;
  const riotId = typeof params.riotId === "string" ? params.riotId.slice(0, 80) : "";
  const configured = await recordsConfigured();

  if (!riotId) {
    return (
      // 전적 첫 화면은 필트오버(위의 도시)로 칠한다. 자운으로 칠한 나머지 화면과 대비를 만든다 (DESIGN_ARCANE.md 6.7).
      <div className={`piltover ${styles.piltover}`}>
        {/* 스카이라인은 그림으로 칠한 배경이다. 아래로 지면색에 녹아들어 구분선 없이 이어진다. */}
        <div className={styles.skyline} aria-hidden="true" />
        {/* 서체·크기는 챔피언 첫 화면의 `어느 라인 가?`와 같다. */}
        <header className={`shell ${styles.homeHero}`}>
          <h1 className={`display ${styles.homeTitle}`}>지난 판 어땠어?</h1>
        </header>

        {/* 검색창은 상자 없이 배경 위 가운데에 둔다. */}
        <div className={`shell ${styles.searchStage}`}>
          <RecordSearch configured={configured} bare />
        </div>

        {/* 즐겨찾기와 패배한 상대는 상자 하나에 두 칸으로 묶는다. */}
        <div className="shell">
          <div className={styles.recordBoard}>
            <FavoritePlayers current={null} embedded />
            <NextMatchups
              embedded
              championIcons={Object.fromEntries(allChampions.map((champion) => [champion.slug, champion.iconUrl]))}
            />
          </div>
        </div>
      </div>
    );
  }

  const result = riotId ? await getRecords(riotId) : null;
  const rows = result?.status === "ok" ? result.rows : [];
  const recommendations = rows
    .filter((row): row is RecordRow & { matchupHref: string; opponent: string } => !row.win && Boolean(row.matchupHref && row.opponent))
    .filter((row, index, matches) => matches.findIndex((other) => other.opponent === row.opponent) === index)
    .slice(0, 4)
    .map(({ opponent, champion, matchupHref }) => ({ opponent, champion, matchupHref }));
  const csRows = rows.filter((row) => row.csPerMinute !== null);

  return (
    <div className={`shell ${styles.page}`}>
      {result?.status === "ok" && <RememberMatchups current={{ riotId: result.riotId, recommendations }} />}
      <div className={styles.hero}>
        <Link href="/records" className={styles.backLink}>← 전적 첫 화면으로</Link>
        <p className="section-index">MATCH ARCHIVE / KR</p>
        <h1 className={styles.title}>전적</h1>
        <p className={styles.intro}>최근 20경기의 기록을 확인합니다. 데스와 분당 CS를 비교하고, 경기별 상대법으로 이어집니다.</p>
      </div>
      <div className={styles.contentGrid}>
        <FavoritePlayers current={result?.status === "ok" ? { riotId: result.riotId, ...result.profile } : null} />
        <div className={styles.content}>
          <RecordSearch configured={configured} riotId={riotId} />
          {result && result.status !== "ok" && <p className={styles.feedback} role="status">{statusMessage(result)}</p>}
          {result?.status === "ok" && <section className={styles.results} aria-labelledby="record-results-heading">
            <div className={styles.sectionHeading}>
              <p className="mono">03 / RECENT MATCHES</p>
              <h2 id="record-results-heading">{result.riotId}</h2>
              <p className="mono">최근 {rows.length}경기</p>
            </div>
            {rows.length > 0 && <div className={styles.summary}>
              <p><span>평균 데스</span><strong>{(rows.reduce((sum, row) => sum + row.deaths, 0) / rows.length).toFixed(1)}</strong></p>
              <p><span>평균 분당 CS</span><strong>{csRows.length ? (csRows.reduce((sum, row) => sum + row.csPerMinute!, 0) / csRows.length).toFixed(1) : "—"}</strong></p>
              <small>조회된 최근 {rows.length}경기 기준</small>
            </div>}
            {result.incomplete && <p className={styles.feedback} role="status">일부 경기를 불러오지 못했습니다. 잠시 뒤 다시 검색해 주세요.</p>}
            {rows.length === 0 ? <p className={styles.empty}>표시할 최근 경기가 없습니다.</p> : (
              <ol className={styles.matchList}>{rows.map((row, index) => <MatchRow key={row.id} row={row} index={index} />)}</ol>
            )}
            <p className={styles.footnote}>분당 CS = (미니언 + 정글 몬스터 처치 수) ÷ 게임 시간(분). 경기 일시는 한국 시간입니다.</p>
          </section>}
        </div>
      </div>
    </div>
  );
}
