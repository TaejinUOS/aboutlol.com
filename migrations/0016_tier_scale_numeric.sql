-- 티어 등급을 S~F 7단계에서 S·1·2·3·4·5 6단계로 바꾼다 (2026-10-05).
-- 기존 배정은 S→S, A→1, B→2, C→3, D→4, E→5, F→5로 옮긴다. F는 5에 합친다.
-- SQLite는 CHECK 제약을 고칠 수 없으므로 표를 새로 만들어 옮긴다.
PRAGMA defer_foreign_keys = true;

CREATE TABLE tier_placements_next (
  position_slug TEXT NOT NULL CHECK (position_slug IN ('top', 'jungle', 'mid', 'adc', 'support')),
  champion_slug TEXT NOT NULL,
  tier TEXT NOT NULL CHECK (tier IN ('S', '1', '2', '3', '4', '5')),
  updated_at TEXT NOT NULL,
  updated_by TEXT REFERENCES users(id),
  PRIMARY KEY (position_slug, champion_slug),
  FOREIGN KEY (position_slug, champion_slug)
    REFERENCES champion_placements(position_slug, champion_slug)
    ON DELETE CASCADE
);

INSERT INTO tier_placements_next (position_slug, champion_slug, tier, updated_at, updated_by)
SELECT
  position_slug,
  champion_slug,
  CASE tier
    WHEN 'S' THEN 'S'
    WHEN 'A' THEN '1'
    WHEN 'B' THEN '2'
    WHEN 'C' THEN '3'
    WHEN 'D' THEN '4'
    ELSE '5'
  END,
  updated_at,
  updated_by
FROM tier_placements;

DROP TABLE tier_placements;
ALTER TABLE tier_placements_next RENAME TO tier_placements;

CREATE INDEX idx_tier_placements_position_tier
  ON tier_placements (position_slug, tier);
