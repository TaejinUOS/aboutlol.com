import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";

import { getRecords, recordsConfigured, type RecordResult, type RecordRow } from "@/lib/recordStore";
import { ro } from "@/lib/josa";

import { FavoritePlayers } from "./FavoritePlayers";
import styles from "./page.module.css";

export const metadata: Metadata = {
  title: "홈",
  description: "Riot ID로 최근 20경기를 살펴보고, 패배한 상대 챔피언의 ABOUTLOL 위키 상대법을 찾아보세요.",
};
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
    case "unavailable": return "지금은 Riot 전적을 불러올 수 없습니다. 잠시 뒤 다시 시도해 주세요.";
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

export default async function HomePage({ searchParams }: {
  searchParams: Promise<{ riotId?: string | string[] }>;
}) {
  const params = await searchParams;
  const riotId = typeof params.riotId === "string" ? params.riotId.slice(0, 80) : "";
  const configured = await recordsConfigured();
  const result = riotId ? await getRecords(riotId) : null;
  const rows = result?.status === "ok" ? result.rows : [];
  const recommendations = rows
    .filter((row) => !row.win && row.matchupHref && row.opponent)
    .filter((row, index, matches) => matches.findIndex((other) => other.opponent === row.opponent) === index)
    .slice(0, 4);
  const csRows = rows.filter((row) => row.csPerMinute !== null);

  return (
    <div className={`shell ${styles.page}`}>
      <div className={styles.hero}>
        <p className="section-index">01 / ABOUTLOL HOME</p>
        <h1 className={styles.title} aria-label="홈">HOME</h1>
        <p className={styles.intro}>지난 판의 기록에서 다음 상대법으로. 최근 20경기의 데스와 분당 CS를 읽고, 어려웠던 상대를 다시 봅니다.</p>
        <span className={`sticker sticker--acid ${styles.heroSticker}`}>MATCH ARCHIVE / KR</span>
      </div>

      <div className={styles.contentGrid}>
        <FavoritePlayers current={result?.status === "ok" ? { riotId: result.riotId, ...result.profile } : null} />

        <div className={styles.content}>
          <section className={`on-paper ${styles.searchPanel}`} aria-labelledby="record-search-heading">
            <div className={styles.searchHeading}>
              <p className="mono">02 / PLAYER LOOKUP</p>
              <h2 id="record-search-heading">누구의 전적을 볼까?</h2>
            </div>
            <form action="/" method="get" className={styles.form}>
              <label htmlFor="riot-id">Riot ID</label>
              <div className={styles.inputRow}>
                <input id="riot-id" name="riotId" type="text" placeholder="게임 이름#태그" autoComplete="off"
                  maxLength={80} required defaultValue={riotId} aria-describedby="riot-id-hint" disabled={!configured} />
                <button type="submit" className="btn btn--acid" disabled={!configured}>전적 찾기</button>
              </div>
              <p id="riot-id-hint" className={styles.hint}>게임 내 Riot ID를 #까지 포함해 입력해 주세요. 한국 서버 전적만 조회합니다.</p>
            </form>
            {!configured && <p className={styles.notice} role="status">전적 검색을 준비 중입니다. 잠시 후 다시 이용해 주세요.</p>}
          </section>

          {result && result.status !== "ok" && <p className={styles.feedback} role="status">{statusMessage(result)}</p>}

          <section className={styles.recommendations} aria-labelledby="recommend-heading">
            <div className={styles.sectionHeading}>
              <p className="mono">03 / NEXT MATCHUP</p>
              <h2 id="recommend-heading">패배한 상대, 다음엔 다르게</h2>
            </div>
            {recommendations.length > 0 ? (
              <ul className={styles.recommendList}>
                {recommendations.map((row) => <li key={row.opponent}>
                  <Link href={row.matchupHref!}>
                    <span className={styles.recommendChampion}>{row.opponent}</span>
                    <span className={styles.recommendContext}>{row.champion}{ro(row.champion)} 상대했던 경기</span>
                    <span className={styles.recommendArrow} aria-hidden="true">↗</span>
                  </Link>
                </li>)}
              </ul>
            ) : <p className={styles.recommendEmpty}>
              {result?.status === "ok"
                ? "최근 패배 경기에서 같은 포지션의 상대 챔피언을 확인하지 못했습니다."
                : "전적을 검색하면 최근 패배 경기의 상대 챔피언 문서를 이곳에서 추천합니다."}
            </p>}
          </section>

          {result?.status === "ok" && <section className={styles.results} aria-labelledby="record-results-heading">
            <div className={styles.sectionHeading}>
              <p className="mono">04 / RECENT MATCHES</p>
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
