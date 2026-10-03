-- 수집 운영 상태는 서버 전용이다. 계정 PUUID를 화면/공개 API에 노출하지 않는다.
ALTER TABLE build_matches ADD COLUMN cohort TEXT NOT NULL DEFAULT 'legacy';
CREATE INDEX build_matches_cohort ON build_matches(patch, cohort, played_at);
CREATE TABLE build_collector_state (
  id INTEGER PRIMARY KEY CHECK(id=1),
  patch TEXT, version TEXT,
  lease_owner TEXT, lease_until INTEGER NOT NULL DEFAULT 0,
  blocked_kr INTEGER NOT NULL DEFAULT 0, blocked_asia INTEGER NOT NULL DEFAULT 0,
  checked_at INTEGER, last_error TEXT
);
INSERT INTO build_collector_state(id) VALUES(1);
CREATE TABLE build_ladder_cursors (
  scope TEXT PRIMARY KEY, page INTEGER NOT NULL DEFAULT 1, entry_offset INTEGER NOT NULL DEFAULT 0,
  next_at INTEGER NOT NULL DEFAULT 0
);
INSERT INTO build_ladder_cursors(scope) VALUES
  ('DIAMOND/I'),('DIAMOND/II'),('DIAMOND/III'),('DIAMOND/IV'),
  ('MASTER'),('GRANDMASTER'),('CHALLENGER');
CREATE TABLE build_players (
  puuid TEXT PRIMARY KEY, tier TEXT NOT NULL, rank TEXT,
  rank_checked_at INTEGER NOT NULL
);
CREATE INDEX build_players_rank_age ON build_players(rank_checked_at);
CREATE TABLE build_player_cursors (
  patch TEXT NOT NULL, puuid TEXT NOT NULL REFERENCES build_players(puuid) ON DELETE CASCADE,
  history_start INTEGER NOT NULL DEFAULT 0, history_end INTEGER NOT NULL DEFAULT 0,
  history_offset INTEGER NOT NULL DEFAULT 0, watermark INTEGER NOT NULL DEFAULT 0,
  backfilled INTEGER NOT NULL DEFAULT 0, next_at INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY(patch, puuid)
);
CREATE INDEX build_player_cursors_due ON build_player_cursors(patch, next_at);
CREATE TABLE build_match_queue (
  patch TEXT NOT NULL, match_id TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK(status IN ('pending','done')),
  queued_at INTEGER NOT NULL, checked_at INTEGER,
  PRIMARY KEY(patch, match_id)
);
CREATE INDEX build_match_queue_pending ON build_match_queue(patch, status, queued_at);
