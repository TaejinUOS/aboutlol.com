-- 티어표에서 바로 열고 공동 편집할 수 있는 일반 위키 문서 두 장.
-- 특정 챔피언의 등급이나 근거를 꾸며 넣지 않고, 문서의 용도만 기록한다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, role, created_at)
VALUES ('system-tier-docs', 'system', 'tier-docs', 'ABOUTLOL 운영', 'admin', '2026-09-25T00:00:00Z');

INSERT INTO wiki_docs (
  id, kind, champion_slug, title, title_key, doc_status, general, revision,
  patch, edit_policy, created_at, updated_at, updated_by
)
SELECT
  'doc-tier-basis', 'article', NULL, '티어표 작성 근거', '티어표작성근거', 'published',
  'ABOUTLOL 티어표의 평가 기준과 등급 변경 이유를 기록하는 문서입니다. 티어표는 탑·정글·미드·원딜·서폿별로 나뉘며, 운영자가 챔피언을 S~F 등급에 배정합니다.' || char(10) || char(10) ||
  '## 평가 근거' || char(10) || char(10) ||
  '등급을 배정하거나 변경할 때 적용 패치, 참고 자료와 판단 이유를 이곳에 남겨 주세요.',
  1, '16.17.1', 'guarded', '2026-09-25T00:00:00Z', '2026-09-25T00:00:00Z', 'system-tier-docs'
WHERE NOT EXISTS (
  SELECT 1 FROM wiki_docs WHERE kind = 'article' AND title_key = '티어표작성근거'
);

INSERT INTO wiki_edits (
  id, doc_id, me_slug, base_revision, body, summary, status, author,
  created_at, accepted_via, revision
)
SELECT
  'edit-tier-basis-seed', 'doc-tier-basis', NULL, 0, general,
  '티어표 근거 문서 개설', 'accepted', 'system-tier-docs',
  '2026-09-25T00:00:00Z', 'admin', 1
FROM wiki_docs WHERE id = 'doc-tier-basis';

INSERT INTO wiki_docs (
  id, kind, champion_slug, title, title_key, doc_status, general, revision,
  patch, edit_policy, created_at, updated_at, updated_by
)
SELECT
  'doc-tier-suggestions', 'article', NULL, '티어표 건의', '티어표건의', 'published',
  '티어표에 대한 의견을 함께 모으는 문서입니다. 챔피언의 포지션과 제안 등급, 판단 이유를 적어 주세요. 다른 사람의 건의에는 내용을 지우는 대신 이어서 의견을 더할 수 있습니다.' || char(10) || char(10) ||
  '## 건의' || char(10) || char(10),
  1, '16.17.1', 'guarded', '2026-09-25T00:00:00Z', '2026-09-25T00:00:00Z', 'system-tier-docs'
WHERE NOT EXISTS (
  SELECT 1 FROM wiki_docs WHERE kind = 'article' AND title_key = '티어표건의'
);

INSERT INTO wiki_edits (
  id, doc_id, me_slug, base_revision, body, summary, status, author,
  created_at, accepted_via, revision
)
SELECT
  'edit-tier-suggestions-seed', 'doc-tier-suggestions', NULL, 0, general,
  '티어표 건의 문서 개설', 'accepted', 'system-tier-docs',
  '2026-09-25T00:00:00Z', 'admin', 1
FROM wiki_docs WHERE id = 'doc-tier-suggestions';
