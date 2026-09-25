-- 포지션별 수동 티어 배정. 근거 설명은 별도 일반 위키 문서
-- 「티어표 작성 근거」에서 공동 편집한다.
-- 값이 없는 챔피언은 순위 미배정이며, 임의의 등급으로 채우지 않는다.
CREATE TABLE tier_placements (
  position_slug TEXT NOT NULL CHECK (position_slug IN ('top', 'jungle', 'mid', 'adc', 'support')),
  champion_slug TEXT NOT NULL,
  tier TEXT NOT NULL CHECK (tier IN ('S', 'A', 'B', 'C', 'D', 'E', 'F')),
  updated_at TEXT NOT NULL,
  updated_by TEXT REFERENCES users(id),
  PRIMARY KEY (position_slug, champion_slug),
  FOREIGN KEY (position_slug, champion_slug)
    REFERENCES champion_placements(position_slug, champion_slug)
    ON DELETE CASCADE
);

CREATE INDEX idx_tier_placements_position_tier
  ON tier_placements (position_slug, tier);
