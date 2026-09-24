import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";

import { getRecords, recordsConfigured, type RecordResult, type RecordRow } from "@/lib/recordStore";

import styles from "./page.module.css";

export const metadata: Metadata = {
  title: "전적",
  description: "한국 서버 Riot ID로 최근 20경기의 승패, KDA, 경기 시간과 분당 CS를 확인하세요.",
};
export const dynamic = "force-dynamic";

function dateLabel(timestamp: number | null) {
  if (timestamp === null) return "경기 일시 없음";
  return new Intl.DateTimeFormat("ko-KR", {
    timeZone: "Asia/Seoul",
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
    hour12: false,
  }).format(timestamp);
}

function durationLabel(seconds: number | null) {
  if (seconds === null) return "—";
  const minutes = Math.floor(seconds / 60);
  return `${minutes}:${String(Math.floor(seconds % 60)).padStart(2, "0")}`;
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
        <span className={`${styles.result} ${row.win ? styles.resultWin : styles.resultLoss}`}>
          {row.win ? "승리" : "패배"}
        </span>
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
          <div><dt>KDA</dt><dd>{row.kills} / {row.deaths} / {row.assists}</dd></div>
          <div><dt>게임 시간</dt><dd>{durationLabel(row.durationSeconds)}</dd></div>
          <div><dt>CS</dt><dd>{row.cs ?? "—"}</dd></div>
          <div><dt>분당 CS</dt><dd>{row.csPerMinute === null ? "—" : row.csPerMinute.toFixed(1)}</dd></div>
        </dl>
      </div>

      {row.matchupHref && (
        <Link className={styles.matchupLink} href={row.matchupHref}>
          {row.opponent} 상대법 보기 <span aria-hidden="true">↗</span>
        </Link>
      )}
    </li>
  );
}

export default async function RecordsPage({
  searchParams,
}: {
  searchParams: Promise<{ riotId?: string | string[] }>;
}) {
  const params = await searchParams;
  const riotId = typeof params.riotId === "string" ? params.riotId.slice(0, 80) : "";
  const configured = await recordsConfigured();
  const result = riotId ? await getRecords(riotId) : null;

  return (
    <main className={`shell ${styles.page}`}>
      <div className={styles.hero}>
        <p className="section-index">03 / 전적 기록실</p>
        <h1 className={`display ${styles.title}`}>전적</h1>
        <p className={styles.intro}>한 판의 기록에서 다음 상대법으로. 한국 서버의 최근 20경기를 확인하세요.</p>
        <span className={`sticker sticker--acid ${styles.heroSticker}`}>MATCH ARCHIVE / KR</span>
      </div>

      <section className={`on-paper ${styles.searchPanel}`} aria-labelledby="record-search-heading">
        <div className={styles.searchHeading}>
          <p className="mono">01 / PLAYER LOOKUP</p>
          <h2 id="record-search-heading">누구의 전적을 볼까?</h2>
        </div>
        <form action="/records" method="get" className={styles.form}>
          <label htmlFor="riot-id">Riot ID</label>
          <div className={styles.inputRow}>
            <input
              id="riot-id"
              name="riotId"
              type="text"
              placeholder="게임 이름#태그"
              autoComplete="off"
              maxLength={80}
              required
              defaultValue={riotId}
              aria-describedby="riot-id-hint"
              disabled={!configured}
            />
            <button type="submit" className="btn btn--acid" disabled={!configured}>전적 찾기</button>
          </div>
          <p id="riot-id-hint" className={styles.hint}>게임 내 Riot ID를 #까지 포함해 입력해 주세요. 한국 서버 전적만 조회합니다.</p>
        </form>
        {!configured && <p className={styles.notice} role="status">전적 검색을 준비 중입니다. 잠시 후 다시 이용해 주세요.</p>}
      </section>

      {result && result.status !== "ok" && (
        <p className={styles.feedback} role="status">{statusMessage(result)}</p>
      )}

      {result?.status === "ok" && (
        <section className={styles.results} aria-labelledby="record-results-heading">
          <div className={styles.resultsHeading}>
            <div>
              <p className="mono">02 / RECENT MATCHES</p>
              <h2 id="record-results-heading">{result.riotId}</h2>
            </div>
            <p className="mono">최근 {result.rows.length}경기</p>
          </div>
          {result.incomplete && <p className={styles.feedback} role="status">일부 경기를 불러오지 못했습니다. 잠시 뒤 다시 검색해 주세요.</p>}
          {result.rows.length === 0 ? (
            <p className={styles.empty}>표시할 최근 경기가 없습니다.</p>
          ) : (
            <ol className={styles.matchList}>
              {result.rows.map((row, index) => <MatchRow key={row.id} row={row} index={index} />)}
            </ol>
          )}
          <p className={styles.footnote}>분당 CS = (미니언 + 정글 몬스터 처치 수) ÷ 게임 시간(분). 경기 일시는 한국 시간입니다.</p>
        </section>
      )}
    </main>
  );
}
