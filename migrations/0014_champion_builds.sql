-- 계정/PUUID/원본 경기 데이터는 저장하지 않는다. 경기 ID와 익명 관측값만 중복 제거에 쓴다.
CREATE TABLE build_matches (
  match_id TEXT PRIMARY KEY,
  patch TEXT NOT NULL,
  played_at INTEGER NOT NULL,
  collected_at TEXT NOT NULL
);
CREATE INDEX build_matches_window ON build_matches(patch, played_at);
CREATE TABLE build_observations (
  match_id TEXT NOT NULL REFERENCES build_matches(match_id) ON DELETE CASCADE,
  participant_id INTEGER NOT NULL,
  champion_id INTEGER NOT NULL,
  position TEXT NOT NULL CHECK(position IN ('top','jungle','mid','adc','support')),
  win INTEGER NOT NULL CHECK(win IN (0,1)),
  starter TEXT,
  boots TEXT,
  core TEXT,
  skills TEXT,
  PRIMARY KEY(match_id, participant_id)
);
CREATE INDEX build_observations_champion ON build_observations(champion_id, position);
CREATE TABLE build_items (
  patch TEXT NOT NULL,
  item_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  icon_url TEXT NOT NULL,
  PRIMARY KEY(patch, item_id)
);
-- 한 패치 수집을 성공적으로 완료한 시각. 실패/중단된 작업은 freshness를 갱신하지 않는다.
CREATE TABLE build_syncs (
  patch TEXT PRIMARY KEY,
  updated_at TEXT NOT NULL,
  source TEXT NOT NULL,
  matches INTEGER NOT NULL
);
