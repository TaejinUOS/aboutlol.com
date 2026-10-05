-- 티어 구간 표본과 공개 티어 점수 (docs/TIER_MODEL.md).
-- 빌드 수집(다이아+, 0014·0015)과 따로 둔다. 빌드는 타임라인이 필요하지만 티어 지표는 경기 정보
-- 하나로 충분하고, 한 경기의 열 명을 모두 쓸 수 있어 호출당 표본이 열 배다.
-- 구간 slug는 src/data/brackets.ts와 같아야 한다.

-- 구간마다 래더에서 무작위로 뽑은 계정. PUUID는 서버 전용이며 30일 지나면 지운다.
CREATE TABLE tier_sample_players (
  puuid TEXT PRIMARY KEY,
  tier TEXT NOT NULL,
  bracket TEXT NOT NULL CHECK (bracket IN ('iron-silver','gold-platinum','emerald','diamond','master-plus')),
  checked_at INTEGER NOT NULL,
  -- 한 사람 편중을 막는 상한용: 이 패치에서 이 계정으로 가져간 경기 수
  patch TEXT,
  taken INTEGER NOT NULL DEFAULT 0,
  next_at INTEGER NOT NULL DEFAULT 0
);
CREATE INDEX tier_sample_players_due ON tier_sample_players(next_at, checked_at);

-- 래더 위치. 디비전마다 쪽수를 모르므로 max_page를 넓히고 좁히며 무작위 쪽을 고른다.
CREATE TABLE tier_sample_ladder (
  scope TEXT PRIMARY KEY,
  bracket TEXT NOT NULL,
  max_page INTEGER NOT NULL DEFAULT 50,
  next_at INTEGER NOT NULL DEFAULT 0
);
INSERT INTO tier_sample_ladder(scope, bracket) VALUES
  ('IRON/I','iron-silver'),('IRON/II','iron-silver'),('IRON/III','iron-silver'),('IRON/IV','iron-silver'),
  ('BRONZE/I','iron-silver'),('BRONZE/II','iron-silver'),('BRONZE/III','iron-silver'),('BRONZE/IV','iron-silver'),
  ('SILVER/I','iron-silver'),('SILVER/II','iron-silver'),('SILVER/III','iron-silver'),('SILVER/IV','iron-silver'),
  ('GOLD/I','gold-platinum'),('GOLD/II','gold-platinum'),('GOLD/III','gold-platinum'),('GOLD/IV','gold-platinum'),
  ('PLATINUM/I','gold-platinum'),('PLATINUM/II','gold-platinum'),('PLATINUM/III','gold-platinum'),('PLATINUM/IV','gold-platinum'),
  ('EMERALD/I','emerald'),('EMERALD/II','emerald'),('EMERALD/III','emerald'),('EMERALD/IV','emerald'),
  ('DIAMOND/I','diamond'),('DIAMOND/II','diamond'),('DIAMOND/III','diamond'),('DIAMOND/IV','diamond'),
  ('MASTER','master-plus'),('GRANDMASTER','master-plus'),('CHALLENGER','master-plus');

CREATE TABLE tier_sample_queue (
  patch TEXT NOT NULL,
  match_id TEXT NOT NULL,
  bracket TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','done')),
  queued_at INTEGER NOT NULL,
  PRIMARY KEY (patch, match_id)
);
CREATE INDEX tier_sample_queue_pending ON tier_sample_queue(patch, status, queued_at);

-- 경기의 구간 = 그 경기를 찾게 한 계정의 구간. 매칭은 비슷한 실력끼리 하므로 열 명 모두를 그 구간으로 본다.
CREATE TABLE tier_sample_matches (
  match_id TEXT PRIMARY KEY,
  patch TEXT NOT NULL,
  bracket TEXT NOT NULL,
  played_at INTEGER NOT NULL,
  collected_at TEXT NOT NULL
);
CREATE INDEX tier_sample_matches_patch ON tier_sample_matches(patch, bracket);

CREATE TABLE tier_sample_participants (
  match_id TEXT NOT NULL REFERENCES tier_sample_matches(match_id) ON DELETE CASCADE,
  participant_id INTEGER NOT NULL,
  champion_id INTEGER NOT NULL,
  position TEXT NOT NULL CHECK (position IN ('top','jungle','mid','adc','support')),
  win INTEGER NOT NULL CHECK (win IN (0,1)),
  PRIMARY KEY (match_id, participant_id)
);
CREATE INDEX tier_sample_participants_champion ON tier_sample_participants(champion_id, position);

CREATE TABLE tier_sample_bans (
  match_id TEXT NOT NULL REFERENCES tier_sample_matches(match_id) ON DELETE CASCADE,
  champion_id INTEGER NOT NULL,
  PRIMARY KEY (match_id, champion_id)
);

-- 공개 티어 점수. `npm run tier:publish`가 통째로 바꿔 넣는다. 행이 없으면 화면은 "준비 중"이다.
-- 점수·등급이 NULL이면 표본 부족(산출 불가)이다 — 임의의 등급을 넣지 않는다.
CREATE TABLE tier_scores (
  bracket TEXT NOT NULL CHECK (bracket IN ('iron-silver','gold-platinum','emerald','diamond','master-plus')),
  position_slug TEXT NOT NULL CHECK (position_slug IN ('top','jungle','mid','adc','support')),
  champion_slug TEXT NOT NULL,
  patch TEXT NOT NULL,
  model_version TEXT NOT NULL,
  score REAL,
  tier TEXT CHECK (tier IS NULL OR tier IN ('S','1','2','3','4','5')),
  games INTEGER NOT NULL,
  wins INTEGER NOT NULL,
  pick_rate REAL,
  ban_rate REAL,
  computed_at TEXT NOT NULL,
  PRIMARY KEY (bracket, position_slug, champion_slug)
);
