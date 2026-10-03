import styles from "./page.module.css";

export function RecordSearch({ configured, riotId = "" }: { configured: boolean; riotId?: string }) {
  return (
    <section className={`on-paper ${styles.searchPanel}`} aria-labelledby="record-search-heading">
      <div className={styles.searchHeading}>
        <p className="mono">02 / PLAYER LOOKUP</p>
        <h2 id="record-search-heading">누구의 전적을 볼까?</h2>
      </div>
      <form action="/records" method="get" className={styles.form}>
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
  );
}
