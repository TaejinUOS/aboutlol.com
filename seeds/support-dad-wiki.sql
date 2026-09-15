-- scripts/seed-support-dad-wiki.ts가 생성. 서폿 Dad 일반 위키 10개와 공통 상대법 8개.
-- 기존 공유 문서와 사용자 편집은 덮어쓰지 않으며 같은 SQL을 다시 실행해도 이력이 늘지 않는다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)
VALUES ('user-system', 'system', 'seed', '깨남.COM', NULL, 'admin', '2026-09-15T10:35:00.000Z');

-- 블리츠크랭크 챔피언 위키 (892자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-dad-champion-blitzcrank-20260915', 'article', '블리츠크랭크', '블리츠크랭크', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 미니언이 비는 순간 `Q`를 준비한다 · `W` 종료 뒤 둔화까지 계산한다 · `R`로 보호막과 반격을 함께 끊는다

[[분류:서폿]] [[분류:Dad]]

## 로켓 손은 빈 공간보다 다음 이동을 겨눈다

**`로켓 손(Q)`은 처음 맞은 적을 블리츠크랭크 앞으로 끌어온다.**[* [블리츠크랭크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=7)] 미니언 하나가 쓰러지는 순간이나 상대가 막타 동작에 멈추는 순간을 기다린다. 멀리서 무작정 던지기보다 수풀과 벽을 이용해 출발점을 숨기고, 빗나갔을 때 빠질 경로를 남긴다.

## 폭주의 가속과 감속을 한 묶음으로 본다

**`폭주(W)`는 이동·공격 속도를 크게 올리지만 효과가 끝나면 블리츠크랭크가 잠시 느려진다.** 걸어서 압박해 상대의 옆 이동을 막은 뒤 가까운 거리에서 `Q`를 사용한다. 잡지 못했다면 끝까지 쫓지 말고 종료 후 둔화가 안전한 위치에서 시작되도록 물러난다.

## 강철 주먹을 당기기 전 준비한다

**`강철 주먹(E)`은 다음 기본 공격으로 대상을 공중에 띄운다.** `Q`가 맞은 뒤 누르느라 시간을 쓰지 않도록 먼저 활성화하고, 끌려온 적이 행동하기 전에 공격한다. 아군을 지킬 때는 진입한 적에게 `E`를 사용하고 `Q`로 더 멀리 떼어내는 순서도 고려한다.

## 정전기장은 보호막을 본 뒤 폭발시킨다

**`정전기장(R)`을 사용하면 주변 적의 보호막을 제거하고 피해와 침묵을 주며, 준비된 동안 기본 공격 대상에 지연 번개를 남긴다.** 보호막이 생기기 전에 성급히 쓰지 말고 상대가 생존 기술을 사용한 직후 제거한다. 끌어온 적의 이동기와 반격 기술을 잠시 막는 용도로도 잇는다.', 1, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-dad-champion-blitzcrank-20260915' OR (kind = 'article' AND title_key = '블리츠크랭크'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-champion-blitzcrank-20260915', id, NULL, 0, general, '서폿 Dad 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-dad-champion-blitzcrank-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 미니언이 비는 순간 `Q`를 준비한다 · `W` 종료 뒤 둔화까지 계산한다 · `R`로 보호막과 반격을 함께 끊는다

[[분류:서폿]] [[분류:Dad]]

## 로켓 손은 빈 공간보다 다음 이동을 겨눈다

**`로켓 손(Q)`은 처음 맞은 적을 블리츠크랭크 앞으로 끌어온다.**[* [블리츠크랭크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=7)] 미니언 하나가 쓰러지는 순간이나 상대가 막타 동작에 멈추는 순간을 기다린다. 멀리서 무작정 던지기보다 수풀과 벽을 이용해 출발점을 숨기고, 빗나갔을 때 빠질 경로를 남긴다.

## 폭주의 가속과 감속을 한 묶음으로 본다

**`폭주(W)`는 이동·공격 속도를 크게 올리지만 효과가 끝나면 블리츠크랭크가 잠시 느려진다.** 걸어서 압박해 상대의 옆 이동을 막은 뒤 가까운 거리에서 `Q`를 사용한다. 잡지 못했다면 끝까지 쫓지 말고 종료 후 둔화가 안전한 위치에서 시작되도록 물러난다.

## 강철 주먹을 당기기 전 준비한다

**`강철 주먹(E)`은 다음 기본 공격으로 대상을 공중에 띄운다.** `Q`가 맞은 뒤 누르느라 시간을 쓰지 않도록 먼저 활성화하고, 끌려온 적이 행동하기 전에 공격한다. 아군을 지킬 때는 진입한 적에게 `E`를 사용하고 `Q`로 더 멀리 떼어내는 순서도 고려한다.

## 정전기장은 보호막을 본 뒤 폭발시킨다

**`정전기장(R)`을 사용하면 주변 적의 보호막을 제거하고 피해와 침묵을 주며, 준비된 동안 기본 공격 대상에 지연 번개를 남긴다.** 보호막이 생기기 전에 성급히 쓰지 말고 상대가 생존 기술을 사용한 직후 제거한다. 끌어온 적의 이동기와 반격 기술을 잠시 막는 용도로도 잇는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-champion-blitzcrank-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-blitzcrank-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-dad-champion-blitzcrank-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-blitzcrank-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-blitzcrank-20260915', NULL, '분류:dad', '분류:Dad' FROM wiki_docs WHERE id = 'doc-support-dad-champion-blitzcrank-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-blitzcrank-20260915' AND target_key = '분류:dad');

-- 쓰레쉬 챔피언 위키 (872자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-dad-champion-thresh-20260915', 'article', '쓰레쉬', '쓰레쉬', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — `Q` 적중 뒤 이동 여부를 고른다 · 랜턴으로 아군의 경로를 바꾼다 · `E` 방향으로 진입과 이탈을 조절한다

[[분류:서폿]] [[분류:Dad]]

## 사형 선고의 두 번째 사용을 서두르지 않는다

**`사형 선고(Q)`는 적을 여러 번 당기고 다시 사용하면 쓰레쉬가 대상에게 이동한다.**[* [쓰레쉬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=110)] 맞혔다고 항상 들어가지 말고 아군 거리와 상대 뒤의 인원을 확인한다. 안전하면 마지막 당김 뒤 진입해 제어 시간을 늘리고, 위험하면 그 자리에서 아군이 공격할 시간을 번다.

## 어둠의 통로로 먼 아군을 교전에 넣는다

**`어둠의 통로(W)`는 근처 아군에게 보호막을 주고 클릭한 아군을 쓰레쉬 쪽으로 이동시킨다.** 정글러가 오는 길에 미리 던져 시야 밖에서 합류시키거나 위험한 아군의 퇴로에 둔다. 적이 랜턴 위를 가로막을 수 있으므로 클릭할 공간까지 생각한다.

## 사슬 채찍의 방향을 목적에 맞춘다

**`사슬 채찍(E)`은 휘두른 방향으로 적을 밀며, 기본 지속 효과는 기다린 다음 공격을 강화한다.** 도망가는 적은 아군 쪽으로 당기고, 들어온 적은 바깥으로 밀어낸다. 강화 공격은 안전한 챔피언 견제에 사용하되 한 대를 위해 상대 제어 범위로 깊이 걷지 않는다.

## 영혼 감옥의 벽을 퇴로에 세운다

**`영혼 감옥(R)`의 벽을 처음 통과한 적은 큰 피해와 강한 둔화를 받는다.** `Q`로 진입한 직후 적의 뒤쪽을 막거나 아군에게 뛰어든 적 주위에 펼친다. 중앙에 적을 두는 것만으로 끝내지 말고 `E`로 벽 쪽에 밀어 실제로 통과하게 만든다.', 1, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-dad-champion-thresh-20260915' OR (kind = 'article' AND title_key = '쓰레쉬'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-champion-thresh-20260915', id, NULL, 0, general, '서폿 Dad 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-dad-champion-thresh-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — `Q` 적중 뒤 이동 여부를 고른다 · 랜턴으로 아군의 경로를 바꾼다 · `E` 방향으로 진입과 이탈을 조절한다

[[분류:서폿]] [[분류:Dad]]

## 사형 선고의 두 번째 사용을 서두르지 않는다

**`사형 선고(Q)`는 적을 여러 번 당기고 다시 사용하면 쓰레쉬가 대상에게 이동한다.**[* [쓰레쉬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=110)] 맞혔다고 항상 들어가지 말고 아군 거리와 상대 뒤의 인원을 확인한다. 안전하면 마지막 당김 뒤 진입해 제어 시간을 늘리고, 위험하면 그 자리에서 아군이 공격할 시간을 번다.

## 어둠의 통로로 먼 아군을 교전에 넣는다

**`어둠의 통로(W)`는 근처 아군에게 보호막을 주고 클릭한 아군을 쓰레쉬 쪽으로 이동시킨다.** 정글러가 오는 길에 미리 던져 시야 밖에서 합류시키거나 위험한 아군의 퇴로에 둔다. 적이 랜턴 위를 가로막을 수 있으므로 클릭할 공간까지 생각한다.

## 사슬 채찍의 방향을 목적에 맞춘다

**`사슬 채찍(E)`은 휘두른 방향으로 적을 밀며, 기본 지속 효과는 기다린 다음 공격을 강화한다.** 도망가는 적은 아군 쪽으로 당기고, 들어온 적은 바깥으로 밀어낸다. 강화 공격은 안전한 챔피언 견제에 사용하되 한 대를 위해 상대 제어 범위로 깊이 걷지 않는다.

## 영혼 감옥의 벽을 퇴로에 세운다

**`영혼 감옥(R)`의 벽을 처음 통과한 적은 큰 피해와 강한 둔화를 받는다.** `Q`로 진입한 직후 적의 뒤쪽을 막거나 아군에게 뛰어든 적 주위에 펼친다. 중앙에 적을 두는 것만으로 끝내지 말고 `E`로 벽 쪽에 밀어 실제로 통과하게 만든다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-champion-thresh-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-thresh-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-dad-champion-thresh-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-thresh-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-thresh-20260915', NULL, '분류:dad', '분류:Dad' FROM wiki_docs WHERE id = 'doc-support-dad-champion-thresh-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-thresh-20260915' AND target_key = '분류:dad');

-- 레오나 챔피언 위키 (853자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-dad-champion-leona-20260915', 'article', '레오나', '레오나', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 아군이 햇빛 표식을 터뜨리게 한다 · `E`가 마지막으로 맞힌 챔피언에게 간다 · `W`를 켜고 진입한다

[[분류:서폿]] [[분류:Dad]]

## 햇빛 표식을 기술마다 나눠 남긴다

**레오나의 공격 스킬은 햇빛을 남기고 아군 챔피언이 공격하면 추가 피해가 발생한다.**[* [레오나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=77)] `E`, `Q`, `W` 폭발을 한순간에 겹치기보다 아군 공격 사이에 나눠 사용해 표식이 낭비되지 않게 한다. 아군이 닿을 거리가 아니라면 혼자 오래 싸우지 않는다.

## 천공의 검은 마지막 챔피언을 선택한다

**`천공의 검(E)`은 일직선의 적을 지나 마지막으로 맞힌 챔피언을 잠시 묶고 그쪽으로 레오나를 이동시킨다.** 미니언은 통과하므로 웨이브 너머에서 진입할 수 있다. 두 챔피언이 겹쳤다면 뒤의 대상에게 갈 수 있음을 계산하고 퇴로가 없는 위치에는 던지지 않는다.

## 일식의 방어 시간을 먼저 켠다

**`일식(W)`은 피해 감소와 방어 능력을 높이고 종료 시 주변 적을 맞히면 방어 시간이 연장된다.** 진입한 뒤가 아니라 `E`를 사용하기 전에 켜 착지 순간의 집중 공격을 버틴다. 폭발을 맞히기 위해 무리하게 붙기보다 아군을 가로막는 위치를 유지한다.

## 흑점 폭발 중심을 후속 기술로 고정한다

**`흑점 폭발(R)`은 범위 중앙의 적을 기절시키고 외곽의 적을 둔화한다.** 멀리서 단독으로 맞히기보다 상대가 막타를 치거나 좁은 길을 지날 때 중앙을 겨냥한다. 둔화만 들어가도 `E`를 잇기 쉬우므로 완벽한 중앙만 기다리지 않는다.', 1, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-dad-champion-leona-20260915' OR (kind = 'article' AND title_key = '레오나'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-champion-leona-20260915', id, NULL, 0, general, '서폿 Dad 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-dad-champion-leona-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 아군이 햇빛 표식을 터뜨리게 한다 · `E`가 마지막으로 맞힌 챔피언에게 간다 · `W`를 켜고 진입한다

[[분류:서폿]] [[분류:Dad]]

## 햇빛 표식을 기술마다 나눠 남긴다

**레오나의 공격 스킬은 햇빛을 남기고 아군 챔피언이 공격하면 추가 피해가 발생한다.**[* [레오나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=77)] `E`, `Q`, `W` 폭발을 한순간에 겹치기보다 아군 공격 사이에 나눠 사용해 표식이 낭비되지 않게 한다. 아군이 닿을 거리가 아니라면 혼자 오래 싸우지 않는다.

## 천공의 검은 마지막 챔피언을 선택한다

**`천공의 검(E)`은 일직선의 적을 지나 마지막으로 맞힌 챔피언을 잠시 묶고 그쪽으로 레오나를 이동시킨다.** 미니언은 통과하므로 웨이브 너머에서 진입할 수 있다. 두 챔피언이 겹쳤다면 뒤의 대상에게 갈 수 있음을 계산하고 퇴로가 없는 위치에는 던지지 않는다.

## 일식의 방어 시간을 먼저 켠다

**`일식(W)`은 피해 감소와 방어 능력을 높이고 종료 시 주변 적을 맞히면 방어 시간이 연장된다.** 진입한 뒤가 아니라 `E`를 사용하기 전에 켜 착지 순간의 집중 공격을 버틴다. 폭발을 맞히기 위해 무리하게 붙기보다 아군을 가로막는 위치를 유지한다.

## 흑점 폭발 중심을 후속 기술로 고정한다

**`흑점 폭발(R)`은 범위 중앙의 적을 기절시키고 외곽의 적을 둔화한다.** 멀리서 단독으로 맞히기보다 상대가 막타를 치거나 좁은 길을 지날 때 중앙을 겨냥한다. 둔화만 들어가도 `E`를 잇기 쉬우므로 완벽한 중앙만 기다리지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-champion-leona-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-leona-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-dad-champion-leona-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-leona-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-leona-20260915', NULL, '분류:dad', '분류:Dad' FROM wiki_docs WHERE id = 'doc-support-dad-champion-leona-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-leona-20260915' AND target_key = '분류:dad');

-- 알리스타 챔피언 위키 (865자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-dad-champion-alistar-20260915', 'article', '알리스타', '알리스타', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — `W` 이동 중 `Q`로 밀치기를 띄우기로 바꾼다 · `E` 다섯 중첩 뒤 공격한다 · `R`로 제어를 풀고 버틴다

[[분류:서폿]] [[분류:Dad]]

## 박치기와 분쇄의 목적을 구분한다

**`박치기(W)`로 돌진하는 중 `분쇄(Q)`를 사용하면 적을 멀리 보내지 않고 도착 지점에서 띄울 수 있다.**[* [알리스타 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=2)] 잡을 때는 두 기술을 연결하고, 지킬 때는 `W`만 사용해 진입한 적을 아군에게서 떼어낸다. 항상 같은 조합을 쓰지 않는다.

## 분쇄를 먼저 쓴 뒤 퇴로를 만든다

**`분쇄(Q)`는 알리스타 주변의 적을 모두 공중에 띄운다.** 여러 적이 붙었거나 이동기로 들어온 순간 즉시 사용하고, 남은 `W`로 핵심 적을 아군 쪽에 보내거나 위험한 적을 밀어낸다. 두 기술을 모두 썼다면 다음 제어 전까지 앞에 오래 머물지 않는다.

## 짓밟기 중첩이 찬 기본 공격을 놓치지 않는다

**`짓밟기(E)`가 적 챔피언에게 반복 피해를 주면 중첩이 쌓이고, 최대 중첩 뒤 다음 챔피언 기본 공격이 기절시킨다.** 유닛 충돌을 무시하는 동안 대상 옆을 유지하되 공격 준비 표시가 뜨기 전에 때리지 않는다. 퇴로 쪽으로 걸으며 기절 위치를 조정한다.

## 꺾을 수 없는 의지는 제어 뒤에 사용한다

**`꺾을 수 없는 의지(R)`은 알리스타에게 걸린 방해 효과를 제거하고 받는 물리·마법 피해를 크게 줄인다.** 진입 직전에 미리 사용하기보다 상대가 핵심 제어를 건 직후 풀어낸다. 지속시간 동안 아군 앞을 막고, 끝나기 전에는 안전한 쪽으로 돌아온다.', 1, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-dad-champion-alistar-20260915' OR (kind = 'article' AND title_key = '알리스타'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-champion-alistar-20260915', id, NULL, 0, general, '서폿 Dad 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-dad-champion-alistar-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — `W` 이동 중 `Q`로 밀치기를 띄우기로 바꾼다 · `E` 다섯 중첩 뒤 공격한다 · `R`로 제어를 풀고 버틴다

[[분류:서폿]] [[분류:Dad]]

## 박치기와 분쇄의 목적을 구분한다

**`박치기(W)`로 돌진하는 중 `분쇄(Q)`를 사용하면 적을 멀리 보내지 않고 도착 지점에서 띄울 수 있다.**[* [알리스타 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=2)] 잡을 때는 두 기술을 연결하고, 지킬 때는 `W`만 사용해 진입한 적을 아군에게서 떼어낸다. 항상 같은 조합을 쓰지 않는다.

## 분쇄를 먼저 쓴 뒤 퇴로를 만든다

**`분쇄(Q)`는 알리스타 주변의 적을 모두 공중에 띄운다.** 여러 적이 붙었거나 이동기로 들어온 순간 즉시 사용하고, 남은 `W`로 핵심 적을 아군 쪽에 보내거나 위험한 적을 밀어낸다. 두 기술을 모두 썼다면 다음 제어 전까지 앞에 오래 머물지 않는다.

## 짓밟기 중첩이 찬 기본 공격을 놓치지 않는다

**`짓밟기(E)`가 적 챔피언에게 반복 피해를 주면 중첩이 쌓이고, 최대 중첩 뒤 다음 챔피언 기본 공격이 기절시킨다.** 유닛 충돌을 무시하는 동안 대상 옆을 유지하되 공격 준비 표시가 뜨기 전에 때리지 않는다. 퇴로 쪽으로 걸으며 기절 위치를 조정한다.

## 꺾을 수 없는 의지는 제어 뒤에 사용한다

**`꺾을 수 없는 의지(R)`은 알리스타에게 걸린 방해 효과를 제거하고 받는 물리·마법 피해를 크게 줄인다.** 진입 직전에 미리 사용하기보다 상대가 핵심 제어를 건 직후 풀어낸다. 지속시간 동안 아군 앞을 막고, 끝나기 전에는 안전한 쪽으로 돌아온다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-champion-alistar-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-alistar-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-dad-champion-alistar-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-alistar-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-alistar-20260915', NULL, '분류:dad', '분류:Dad' FROM wiki_docs WHERE id = 'doc-support-dad-champion-alistar-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-alistar-20260915' AND target_key = '분류:dad');

-- 노틸러스 챔피언 위키 (842자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-dad-champion-nautilus-20260915', 'article', '노틸러스', '노틸러스', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 대상마다 강화 기본 공격을 나눠 묶는다 · `Q`를 벽 이동에도 쓴다 · `R` 경로에 여러 적을 둔다

[[분류:서폿]] [[분류:Dad]]

## 강력한 일격을 여러 대상에게 분배한다

**노틸러스의 기본 공격은 대상을 이동 불가로 만들지만 같은 대상에게는 잠시 다시 발동하지 않는다.**[* [노틸러스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=93)] 한 명만 계속 치기보다 가까운 적에게 한 번씩 나눠 제어한다. 핵심 대상에게 표식이 다시 준비되는 시간을 보고 다음 공격을 잇는다.

## 닻줄 견인의 두 도착점을 계산한다

**`닻줄 견인(Q)`은 적을 맞히면 서로를 당기고, 지형을 맞히면 노틸러스가 벽 쪽으로 이동하며 소모 일부를 돌려받는다.** 진입 각이 아니면 벽에 사용해 합류하거나 탈출한다. 적 뒤 지형에 걸릴 수 있으므로 투사체 폭과 최종 위치를 함께 본다.

## 타이탄의 분노를 공격 전에 켠다

**`타이탄의 분노(W)`은 보호막을 만들고 유지되는 동안 기본 공격에 주변 지속 피해를 더한다.** 피해를 모두 받은 뒤가 아니라 진입 직전에 사용해 보호막과 강화 공격을 함께 살린다. 보호막이 깨지면 공격 효과도 잃으므로 무리하게 적진 안에 서 있지 않는다.

## 폭뢰의 추적 경로로 진형을 가른다

**`폭뢰(R)`는 지정한 챔피언을 추적하며 경로 위 적을 띄우고, 도착한 대상을 다시 띄우고 기절시킨다.** 가장 먼 후방 대상을 지정해 앞에 선 적까지 경로에 넣는다. 도착 시간에 맞춰 `Q`와 기본 공격을 준비하고 아군이 공격할 거리를 유지한다.', 1, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-dad-champion-nautilus-20260915' OR (kind = 'article' AND title_key = '노틸러스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-champion-nautilus-20260915', id, NULL, 0, general, '서폿 Dad 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-dad-champion-nautilus-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 대상마다 강화 기본 공격을 나눠 묶는다 · `Q`를 벽 이동에도 쓴다 · `R` 경로에 여러 적을 둔다

[[분류:서폿]] [[분류:Dad]]

## 강력한 일격을 여러 대상에게 분배한다

**노틸러스의 기본 공격은 대상을 이동 불가로 만들지만 같은 대상에게는 잠시 다시 발동하지 않는다.**[* [노틸러스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=93)] 한 명만 계속 치기보다 가까운 적에게 한 번씩 나눠 제어한다. 핵심 대상에게 표식이 다시 준비되는 시간을 보고 다음 공격을 잇는다.

## 닻줄 견인의 두 도착점을 계산한다

**`닻줄 견인(Q)`은 적을 맞히면 서로를 당기고, 지형을 맞히면 노틸러스가 벽 쪽으로 이동하며 소모 일부를 돌려받는다.** 진입 각이 아니면 벽에 사용해 합류하거나 탈출한다. 적 뒤 지형에 걸릴 수 있으므로 투사체 폭과 최종 위치를 함께 본다.

## 타이탄의 분노를 공격 전에 켠다

**`타이탄의 분노(W)`은 보호막을 만들고 유지되는 동안 기본 공격에 주변 지속 피해를 더한다.** 피해를 모두 받은 뒤가 아니라 진입 직전에 사용해 보호막과 강화 공격을 함께 살린다. 보호막이 깨지면 공격 효과도 잃으므로 무리하게 적진 안에 서 있지 않는다.

## 폭뢰의 추적 경로로 진형을 가른다

**`폭뢰(R)`는 지정한 챔피언을 추적하며 경로 위 적을 띄우고, 도착한 대상을 다시 띄우고 기절시킨다.** 가장 먼 후방 대상을 지정해 앞에 선 적까지 경로에 넣는다. 도착 시간에 맞춰 `Q`와 기본 공격을 준비하고 아군이 공격할 거리를 유지한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-champion-nautilus-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-nautilus-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-dad-champion-nautilus-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-nautilus-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-nautilus-20260915', NULL, '분류:dad', '분류:Dad' FROM wiki_docs WHERE id = 'doc-support-dad-champion-nautilus-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-nautilus-20260915' AND target_key = '분류:dad');

-- 라칸 챔피언 위키 (832자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-dad-champion-rakan-20260915', 'article', '라칸', '라칸', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — `W` 진입 뒤 `E`로 돌아온다 · 깃털 회복을 아군에게 닿아 앞당긴다 · `R` 첫 접촉 가속을 이어 간다

[[분류:서폿]] [[분류:Dad]]

## 화려한 등장 뒤 돌아올 아군을 정한다

**`화려한 등장(W)`은 목표 지점으로 도약한 뒤 주변 적을 공중에 띄운다.**[* [라칸 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=135)] 진입 전에 `전쟁무도(E)`로 돌아올 아군의 위치와 사거리를 확인한다. 적의 이동기가 빠졌거나 다른 제어가 먼저 들어간 뒤 착지 지점을 맞춘다.

## 빛나는 깃털의 회복을 즉시 전달한다

**`빛나는 깃털(Q)`이 챔피언이나 에픽 몬스터에 맞으면 잠시 뒤 주변 아군을 회복하고, 라칸이 아군에게 닿으면 바로 발동한다.** 적중 후 뒤로 걷기만 하지 말고 `E`로 다친 아군에게 이동해 회복 시점을 앞당긴다.

## 전쟁무도의 두 번째 도약을 남긴다

**`전쟁무도(E)`는 아군에게 도약해 보호막을 주고 짧은 시간 안에 한 번 더 사용할 수 있다.** 한 대상에게 연속으로 쓰기보다 진입한 아군을 보호한 뒤 후방 아군에게 돌아오는 경로로 나눈다. 두 번째 사용 가능 시간을 넘기지 않도록 교전 속도를 맞춘다.

## 매혹의 질주 첫 접촉으로 다음 대상을 잇는다

**`매혹의 질주(R)` 중 적에게 닿으면 매혹시키고, 처음 챔피언에게 닿을 때 이동 속도가 크게 오른다.** 가장 가까운 적을 첫 발판으로 삼아 후방까지 빠르게 연결한다. 진입 전에 `E`나 `W`의 탈출 경로를 남기고 같은 적에게 오래 머물지 않는다.', 1, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-dad-champion-rakan-20260915' OR (kind = 'article' AND title_key = '라칸'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-champion-rakan-20260915', id, NULL, 0, general, '서폿 Dad 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-dad-champion-rakan-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — `W` 진입 뒤 `E`로 돌아온다 · 깃털 회복을 아군에게 닿아 앞당긴다 · `R` 첫 접촉 가속을 이어 간다

[[분류:서폿]] [[분류:Dad]]

## 화려한 등장 뒤 돌아올 아군을 정한다

**`화려한 등장(W)`은 목표 지점으로 도약한 뒤 주변 적을 공중에 띄운다.**[* [라칸 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=135)] 진입 전에 `전쟁무도(E)`로 돌아올 아군의 위치와 사거리를 확인한다. 적의 이동기가 빠졌거나 다른 제어가 먼저 들어간 뒤 착지 지점을 맞춘다.

## 빛나는 깃털의 회복을 즉시 전달한다

**`빛나는 깃털(Q)`이 챔피언이나 에픽 몬스터에 맞으면 잠시 뒤 주변 아군을 회복하고, 라칸이 아군에게 닿으면 바로 발동한다.** 적중 후 뒤로 걷기만 하지 말고 `E`로 다친 아군에게 이동해 회복 시점을 앞당긴다.

## 전쟁무도의 두 번째 도약을 남긴다

**`전쟁무도(E)`는 아군에게 도약해 보호막을 주고 짧은 시간 안에 한 번 더 사용할 수 있다.** 한 대상에게 연속으로 쓰기보다 진입한 아군을 보호한 뒤 후방 아군에게 돌아오는 경로로 나눈다. 두 번째 사용 가능 시간을 넘기지 않도록 교전 속도를 맞춘다.

## 매혹의 질주 첫 접촉으로 다음 대상을 잇는다

**`매혹의 질주(R)` 중 적에게 닿으면 매혹시키고, 처음 챔피언에게 닿을 때 이동 속도가 크게 오른다.** 가장 가까운 적을 첫 발판으로 삼아 후방까지 빠르게 연결한다. 진입 전에 `E`나 `W`의 탈출 경로를 남기고 같은 적에게 오래 머물지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-champion-rakan-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-rakan-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-dad-champion-rakan-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-rakan-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-rakan-20260915', NULL, '분류:dad', '분류:Dad' FROM wiki_docs WHERE id = 'doc-support-dad-champion-rakan-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-rakan-20260915' AND target_key = '분류:dad');

-- 브라움 챔피언 위키 (858자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-dad-champion-braum-20260915', 'article', '브라움', '브라움', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 뇌진탕 표식을 아군 공격으로 완성한다 · `W`로 보호할 대상 앞에 선다 · `E` 방향을 핵심 투사체에 맞춘다

[[분류:서폿]] [[분류:Dad]]

## 뇌진탕 펀치의 첫 중첩을 먼저 묻힌다

**브라움의 기본 공격과 `동상(Q)`은 뇌진탕 중첩을 시작하고, 이후 아군의 기본 공격도 중첩을 쌓아 기절시킨다.**[* [브라움 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=119)] 여러 적에게 첫 표식을 나눠 묻히기보다 아군이 바로 공격할 한 명을 정한다. 기절 뒤 같은 대상의 재발동 공백에는 다른 적을 표시한다.

## 내가 지킨다로 아군 앞에 착지한다

**`내가 지킨다(W)`는 아군 챔피언이나 미니언에게 도약하고 브라움과 대상의 방어 능력을 높인다.** 도망치는 아군에게 사용해 적과 아군 사이를 막거나 전진한 미니언을 발판으로 `Q` 각을 만든다. 돌아올 아군이 없으면 깊은 발판에는 뛰지 않는다.

## 불굴은 가장 중요한 방향 하나를 막는다

**`불굴(E)`은 지정 방향의 첫 공격 피해를 없애고 이후 피해를 줄이며 날아오는 투사체를 대신 맞아 파괴한다.** 모든 적을 향하려고 계속 돌기보다 강한 투사체가 오는 방향을 유지한다. 아군이 방패 뒤에 있도록 함께 이동하고 측면 공격은 위치로 피한다.

## 빙하 균열로 진입과 퇴로를 동시에 가른다

**`빙하 균열(R)`은 가까운 적과 전방 직선의 적을 띄우고 바닥에 둔화 지대를 남긴다.** 아군에게 들어온 적을 즉시 끊거나 좁은 길을 길게 가로질러 추격을 늦춘다. 첫 대상의 공중 제어가 더 길 수 있으므로 핵심 챔피언을 선두에 둔다.', 1, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-dad-champion-braum-20260915' OR (kind = 'article' AND title_key = '브라움'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-champion-braum-20260915', id, NULL, 0, general, '서폿 Dad 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-dad-champion-braum-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 뇌진탕 표식을 아군 공격으로 완성한다 · `W`로 보호할 대상 앞에 선다 · `E` 방향을 핵심 투사체에 맞춘다

[[분류:서폿]] [[분류:Dad]]

## 뇌진탕 펀치의 첫 중첩을 먼저 묻힌다

**브라움의 기본 공격과 `동상(Q)`은 뇌진탕 중첩을 시작하고, 이후 아군의 기본 공격도 중첩을 쌓아 기절시킨다.**[* [브라움 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=119)] 여러 적에게 첫 표식을 나눠 묻히기보다 아군이 바로 공격할 한 명을 정한다. 기절 뒤 같은 대상의 재발동 공백에는 다른 적을 표시한다.

## 내가 지킨다로 아군 앞에 착지한다

**`내가 지킨다(W)`는 아군 챔피언이나 미니언에게 도약하고 브라움과 대상의 방어 능력을 높인다.** 도망치는 아군에게 사용해 적과 아군 사이를 막거나 전진한 미니언을 발판으로 `Q` 각을 만든다. 돌아올 아군이 없으면 깊은 발판에는 뛰지 않는다.

## 불굴은 가장 중요한 방향 하나를 막는다

**`불굴(E)`은 지정 방향의 첫 공격 피해를 없애고 이후 피해를 줄이며 날아오는 투사체를 대신 맞아 파괴한다.** 모든 적을 향하려고 계속 돌기보다 강한 투사체가 오는 방향을 유지한다. 아군이 방패 뒤에 있도록 함께 이동하고 측면 공격은 위치로 피한다.

## 빙하 균열로 진입과 퇴로를 동시에 가른다

**`빙하 균열(R)`은 가까운 적과 전방 직선의 적을 띄우고 바닥에 둔화 지대를 남긴다.** 아군에게 들어온 적을 즉시 끊거나 좁은 길을 길게 가로질러 추격을 늦춘다. 첫 대상의 공중 제어가 더 길 수 있으므로 핵심 챔피언을 선두에 둔다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-champion-braum-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-braum-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-dad-champion-braum-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-braum-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-braum-20260915', NULL, '분류:dad', '분류:Dad' FROM wiki_docs WHERE id = 'doc-support-dad-champion-braum-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-braum-20260915' AND target_key = '분류:dad');

-- 렐 챔피언 위키 (834자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-dad-champion-rell-20260915', 'article', '렐', '렐', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 공격과 스킬로 저항력을 훔친다 · 두 `W` 형태의 진입을 번갈아 쓴다 · `R`로 적을 모은 뒤 제어한다

[[분류:서폿]] [[분류:Dad]]

## 갑옷 파쇄를 여러 적에게 묻힌다

**렐의 기본 공격과 스킬은 적의 방어력과 마법 저항력을 훔쳐 렐을 단단하게 하고 대상을 약하게 만든다.**[* [렐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=153)] 교전 초반 여러 적을 스쳐 중첩을 확보한 뒤 아군이 공격할 핵심 대상에 집중한다. 진입 전에 한 번 공격할 수 있다면 저항력 차이를 먼저 만든다.

## 파열의 일격을 보호막과 제어에 맞춘다

**`파열의 일격(Q)`은 직선의 적을 공격하며 보호막을 파괴하고 첫 대상을 기절시킨다.** 보호막이 생긴 직후 사용해 효율을 높이고, 아군의 후속 기술이 닿을 대상을 첫 위치에 둔다. 다수 관통 피해만 노리다 기절 대상을 놓치지 않는다.

## 철마술의 두 형태로 교전 속도를 바꾼다

**탑승 상태의 `철마술: 붕괴(W)`는 뛰어내리며 적을 띄우고 보호막을 얻지만 느려지고, 보행 상태에서 다시 타면 빨라지며 다음 공격으로 적을 띄운다.** 첫 진입이 빗나가면 오래 추격하지 말고 보호막으로 버틴 뒤 재탑승 공격을 준비한다.

## 자기 폭풍으로 후속 제어 범위를 만든다

**`자기 폭풍(R)`은 주변 적을 렐 쪽으로 당긴 뒤 계속 끌어모은다.** `W` 착지 직후 사용해 흩어지려는 적을 모으고 `Q`나 아군 광역 기술을 잇는다. 끌어당김만으로 모든 이동을 막지는 못하므로 적 이동기가 빠진 시점을 고른다.', 1, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-dad-champion-rell-20260915' OR (kind = 'article' AND title_key = '렐'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-champion-rell-20260915', id, NULL, 0, general, '서폿 Dad 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-dad-champion-rell-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 공격과 스킬로 저항력을 훔친다 · 두 `W` 형태의 진입을 번갈아 쓴다 · `R`로 적을 모은 뒤 제어한다

[[분류:서폿]] [[분류:Dad]]

## 갑옷 파쇄를 여러 적에게 묻힌다

**렐의 기본 공격과 스킬은 적의 방어력과 마법 저항력을 훔쳐 렐을 단단하게 하고 대상을 약하게 만든다.**[* [렐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=153)] 교전 초반 여러 적을 스쳐 중첩을 확보한 뒤 아군이 공격할 핵심 대상에 집중한다. 진입 전에 한 번 공격할 수 있다면 저항력 차이를 먼저 만든다.

## 파열의 일격을 보호막과 제어에 맞춘다

**`파열의 일격(Q)`은 직선의 적을 공격하며 보호막을 파괴하고 첫 대상을 기절시킨다.** 보호막이 생긴 직후 사용해 효율을 높이고, 아군의 후속 기술이 닿을 대상을 첫 위치에 둔다. 다수 관통 피해만 노리다 기절 대상을 놓치지 않는다.

## 철마술의 두 형태로 교전 속도를 바꾼다

**탑승 상태의 `철마술: 붕괴(W)`는 뛰어내리며 적을 띄우고 보호막을 얻지만 느려지고, 보행 상태에서 다시 타면 빨라지며 다음 공격으로 적을 띄운다.** 첫 진입이 빗나가면 오래 추격하지 말고 보호막으로 버틴 뒤 재탑승 공격을 준비한다.

## 자기 폭풍으로 후속 제어 범위를 만든다

**`자기 폭풍(R)`은 주변 적을 렐 쪽으로 당긴 뒤 계속 끌어모은다.** `W` 착지 직후 사용해 흩어지려는 적을 모으고 `Q`나 아군 광역 기술을 잇는다. 끌어당김만으로 모든 이동을 막지는 못하므로 적 이동기가 빠진 시점을 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-champion-rell-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-rell-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-dad-champion-rell-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-rell-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-rell-20260915', NULL, '분류:dad', '분류:Dad' FROM wiki_docs WHERE id = 'doc-support-dad-champion-rell-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-rell-20260915' AND target_key = '분류:dad');

-- 파이크 챔피언 위키 (842자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-dad-champion-pyke-20260915', 'article', '파이크', '파이크', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 시야에서 사라져 회색 체력을 회복한다 · `Q` 짧은 찌르기와 긴 끌기를 구분한다 · `E` 유령의 귀환선을 맞춘다

[[분류:서폿]] [[분류:Dad]]

## 가라앉은 자들의 축복으로 교전을 나눈다

**파이크는 적에게 보이지 않으면 챔피언에게 받은 피해 일부를 빠르게 회복한다.**[* [파이크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=141)] 한 번의 긴 교환을 고집하지 말고 수풀과 벽 뒤로 빠져 회색 체력을 돌린 뒤 다시 접근한다. 시야가 지워지지 않았다면 회복을 기다리며 같은 자리에 머물지 않는다.

## 뼈 작살의 두 사용법을 거리로 고른다

**`뼈 작살(Q)`은 짧게 누르면 가까운 적을 찌르고, 충전하면 처음 맞은 적을 파이크 앞으로 끌어당긴다.** 가까운 교전에서는 충전 동작으로 시간을 주지 말고 즉시 둔화시키며, 수풀에서 시작할 때는 긴 작살로 아군 쪽에 대상을 데려온다.

## 망자의 물살은 도착점보다 귀환선을 본다

**`망자의 물살(E)`은 파이크가 돌진한 뒤 출발점의 유령이 돌아와 경로의 챔피언을 기절시킨다.** 적을 지나쳐 돌진하거나 `Q`로 유령 경로 안에 끌어온다. 탈출에 사용했다면 유령이 추격자를 가르도록 직선 방향을 정한다.

## 깊은 바다의 처형은 표식이 생긴 적부터 친다

**`깊은 바다의 처형(R)`은 체력이 기준 아래인 적을 처형하고 성공하면 다시 사용할 수 있다.** 표식이 보인 적의 이동기와 보호 수단을 확인하고 X 중심을 맞춘다. 첫 사용이 빗나가면 연쇄 기회가 사라지므로 여러 명보다 확실한 한 명을 고른다.', 1, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-dad-champion-pyke-20260915' OR (kind = 'article' AND title_key = '파이크'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-champion-pyke-20260915', id, NULL, 0, general, '서폿 Dad 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-dad-champion-pyke-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 시야에서 사라져 회색 체력을 회복한다 · `Q` 짧은 찌르기와 긴 끌기를 구분한다 · `E` 유령의 귀환선을 맞춘다

[[분류:서폿]] [[분류:Dad]]

## 가라앉은 자들의 축복으로 교전을 나눈다

**파이크는 적에게 보이지 않으면 챔피언에게 받은 피해 일부를 빠르게 회복한다.**[* [파이크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=141)] 한 번의 긴 교환을 고집하지 말고 수풀과 벽 뒤로 빠져 회색 체력을 돌린 뒤 다시 접근한다. 시야가 지워지지 않았다면 회복을 기다리며 같은 자리에 머물지 않는다.

## 뼈 작살의 두 사용법을 거리로 고른다

**`뼈 작살(Q)`은 짧게 누르면 가까운 적을 찌르고, 충전하면 처음 맞은 적을 파이크 앞으로 끌어당긴다.** 가까운 교전에서는 충전 동작으로 시간을 주지 말고 즉시 둔화시키며, 수풀에서 시작할 때는 긴 작살로 아군 쪽에 대상을 데려온다.

## 망자의 물살은 도착점보다 귀환선을 본다

**`망자의 물살(E)`은 파이크가 돌진한 뒤 출발점의 유령이 돌아와 경로의 챔피언을 기절시킨다.** 적을 지나쳐 돌진하거나 `Q`로 유령 경로 안에 끌어온다. 탈출에 사용했다면 유령이 추격자를 가르도록 직선 방향을 정한다.

## 깊은 바다의 처형은 표식이 생긴 적부터 친다

**`깊은 바다의 처형(R)`은 체력이 기준 아래인 적을 처형하고 성공하면 다시 사용할 수 있다.** 표식이 보인 적의 이동기와 보호 수단을 확인하고 X 중심을 맞춘다. 첫 사용이 빗나가면 연쇄 기회가 사라지므로 여러 명보다 확실한 한 명을 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-champion-pyke-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-pyke-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-dad-champion-pyke-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-pyke-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-pyke-20260915', NULL, '분류:dad', '분류:Dad' FROM wiki_docs WHERE id = 'doc-support-dad-champion-pyke-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-pyke-20260915' AND target_key = '분류:dad');

-- 레나타 글라스크 챔피언 위키 (865자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-dad-champion-renata-20260915', 'article', '레나타 글라스크', '레나타글라스크', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 표식을 아군 공격으로 터뜨린다 · `W` 대상이 처치에 관여할 시간을 만든다 · `R`을 좁은 길에 흘려보낸다

[[분류:서폿]] [[분류:Dad]]

## 영향력 표식을 아군과 교대로 공격한다

**레나타의 기본 공격은 한 대상에게 표식을 남기고 아군의 다음 공격이 이를 소모해 추가 피해를 준다.**[* [레나타 글라스크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=159)] 혼자 연속 공격하기보다 아군 공격 사이에 한 번씩 쳐 표식을 계속 새긴다. 교전 전에 같은 대상을 함께 볼 수 있도록 위치를 맞춘다.

## 악수로 던질 두 번째 대상을 찾는다

**`악수(Q)`는 처음 맞은 적을 속박하고 다시 사용하면 지정 방향으로 던지며, 챔피언과 충돌시키면 추가 제어가 생긴다.** 한 명을 잡는 데서 끝내지 말고 뒤의 적이나 아군 쪽 위치를 선택한다. 위험한 진입자는 바깥으로 던져 보호 기술로도 사용한다.

## 긴급 구제의 남은 시간을 처치 관여로 잇는다

**`긴급 구제(W)`는 아군의 공격·이동 속도를 높이고 죽음을 잠시 늦추며, 대상이 처치에 관여하면 살아남을 수 있게 한다.** 체력이 낮아진 뒤만 쓰지 말고 공격을 시작할 핵심 아군에게 미리 건다. 부식이 시작되면 가장 가까운 처치 대상을 함께 집중한다.

## 적대적 인수는 적의 공격력을 되돌린다

**`적대적 인수(R)`에 맞은 적은 광란 상태가 되어 가까운 유닛, 특히 자기 아군을 우선 공격한다.** 공격 속도가 빠른 적이 서로 모인 좁은 길을 겨냥한다. 파도가 느리므로 시야 밖이나 다른 제어 뒤에 사용하고 아군이 경로를 가로막지 않게 한다.', 1, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-dad-champion-renata-20260915' OR (kind = 'article' AND title_key = '레나타글라스크'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-champion-renata-20260915', id, NULL, 0, general, '서폿 Dad 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-dad-champion-renata-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 표식을 아군 공격으로 터뜨린다 · `W` 대상이 처치에 관여할 시간을 만든다 · `R`을 좁은 길에 흘려보낸다

[[분류:서폿]] [[분류:Dad]]

## 영향력 표식을 아군과 교대로 공격한다

**레나타의 기본 공격은 한 대상에게 표식을 남기고 아군의 다음 공격이 이를 소모해 추가 피해를 준다.**[* [레나타 글라스크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=159)] 혼자 연속 공격하기보다 아군 공격 사이에 한 번씩 쳐 표식을 계속 새긴다. 교전 전에 같은 대상을 함께 볼 수 있도록 위치를 맞춘다.

## 악수로 던질 두 번째 대상을 찾는다

**`악수(Q)`는 처음 맞은 적을 속박하고 다시 사용하면 지정 방향으로 던지며, 챔피언과 충돌시키면 추가 제어가 생긴다.** 한 명을 잡는 데서 끝내지 말고 뒤의 적이나 아군 쪽 위치를 선택한다. 위험한 진입자는 바깥으로 던져 보호 기술로도 사용한다.

## 긴급 구제의 남은 시간을 처치 관여로 잇는다

**`긴급 구제(W)`는 아군의 공격·이동 속도를 높이고 죽음을 잠시 늦추며, 대상이 처치에 관여하면 살아남을 수 있게 한다.** 체력이 낮아진 뒤만 쓰지 말고 공격을 시작할 핵심 아군에게 미리 건다. 부식이 시작되면 가장 가까운 처치 대상을 함께 집중한다.

## 적대적 인수는 적의 공격력을 되돌린다

**`적대적 인수(R)`에 맞은 적은 광란 상태가 되어 가까운 유닛, 특히 자기 아군을 우선 공격한다.** 공격 속도가 빠른 적이 서로 모인 좁은 길을 겨냥한다. 파도가 느리므로 시야 밖이나 다른 제어 뒤에 사용하고 아군이 경로를 가로막지 않게 한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-champion-renata-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-renata-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-dad-champion-renata-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-renata-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-dad-champion-renata-20260915', NULL, '분류:dad', '분류:Dad' FROM wiki_docs WHERE id = 'doc-support-dad-champion-renata-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-dad-champion-renata-20260915' AND target_key = '분류:dad');

-- thresh 상대법 (781자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-thresh', 'matchup', NULL, NULL, 'published', 'thresh', '', 0, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — `Q` 출발 동작에서 옆으로 움직인다 · 랜턴 뒤의 합류를 의심한다 · `E`가 밀 방향과 반대로 선다

## 사형 선고를 피한 뒤 공백을 사용한다
**`사형 선고(Q)`는 처음 맞은 적을 당기고 다시 사용하면 쓰레쉬가 날아온다.**[* [쓰레쉬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=110)] 팔을 돌리는 동작이 보이면 미니언 뒤에만 숨지 말고 옆으로 움직인다. 빗나간 뒤에는 먼 거리 제어가 줄어드므로 그때 웨이브와 시야를 압박한다.

## 어둠의 통로 끝에서 새 적이 나타날 수 있다
**`어둠의 통로(W)`를 클릭한 아군은 쓰레쉬에게 빠르게 이동한다.** 랜턴이 시야 밖으로 던져지면 혼자 있는 쓰레쉬라고 판단하지 않는다. 랜턴 위에 설 수 있는 상황이라도 적의 공격 범위에 깊이 들어가 클릭을 막으려 하지 않는다.

## 사슬 채찍의 방향을 정면에서 주지 않는다
**`사슬 채찍(E)`은 쓰레쉬가 휘두른 방향으로 적을 밀거나 당긴다.** 쓰레쉬와 아군을 한 직선에 두면 뒤로 밀려도 적 쪽에 남는다. 대각선으로 서서 한 번의 채찍이 원하는 방향을 만들지 못하게 하고 강화 기본 공격도 기다린다.

## 영혼 감옥의 첫 벽을 건너지 않는다
**`영혼 감옥(R)`의 첫 벽을 통과하면 큰 피해와 강한 둔화를 받는다.** 벽 너머로 바로 도망치기보다 내부에서 빈 방향을 찾거나 이동기를 아낀다. 쓰레쉬가 `E`로 벽에 밀 수 있으므로 본체와 벽 사이에 서지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:35:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-thresh' AND kind = 'matchup' AND champion_slug = 'thresh'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-thresh');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-matchup-thresh-20260915', id, NULL, 0, general, '서폿 Dad 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-thresh' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — `Q` 출발 동작에서 옆으로 움직인다 · 랜턴 뒤의 합류를 의심한다 · `E`가 밀 방향과 반대로 선다

## 사형 선고를 피한 뒤 공백을 사용한다
**`사형 선고(Q)`는 처음 맞은 적을 당기고 다시 사용하면 쓰레쉬가 날아온다.**[* [쓰레쉬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=110)] 팔을 돌리는 동작이 보이면 미니언 뒤에만 숨지 말고 옆으로 움직인다. 빗나간 뒤에는 먼 거리 제어가 줄어드므로 그때 웨이브와 시야를 압박한다.

## 어둠의 통로 끝에서 새 적이 나타날 수 있다
**`어둠의 통로(W)`를 클릭한 아군은 쓰레쉬에게 빠르게 이동한다.** 랜턴이 시야 밖으로 던져지면 혼자 있는 쓰레쉬라고 판단하지 않는다. 랜턴 위에 설 수 있는 상황이라도 적의 공격 범위에 깊이 들어가 클릭을 막으려 하지 않는다.

## 사슬 채찍의 방향을 정면에서 주지 않는다
**`사슬 채찍(E)`은 쓰레쉬가 휘두른 방향으로 적을 밀거나 당긴다.** 쓰레쉬와 아군을 한 직선에 두면 뒤로 밀려도 적 쪽에 남는다. 대각선으로 서서 한 번의 채찍이 원하는 방향을 만들지 못하게 하고 강화 기본 공격도 기다린다.

## 영혼 감옥의 첫 벽을 건너지 않는다
**`영혼 감옥(R)`의 첫 벽을 통과하면 큰 피해와 강한 둔화를 받는다.** 벽 너머로 바로 도망치기보다 내부에서 빈 방향을 찾거나 이동기를 아낀다. 쓰레쉬가 `E`로 벽에 밀 수 있으므로 본체와 벽 사이에 서지 않는다.'
AND updated_at = '2026-09-15T10:35:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-matchup-thresh-20260915');

-- leona 상대법 (744자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-leona', 'matchup', NULL, NULL, 'published', 'leona', '', 0, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 미니언을 관통하는 `E`를 옆으로 피한다 · `W`가 끝난 뒤 공격한다 · `R` 중심에서 먼저 나온다

## 천공의 검은 미니언 뒤에서도 맞는다
**`천공의 검(E)`은 유닛을 관통하고 마지막으로 맞힌 챔피언에게 레오나가 이동한다.**[* [레오나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=77)] 미니언 뒤를 안전지대로 여기지 말고 레오나와 대각선으로 선다. 빗나간 뒤에는 직접 붙을 수단이 줄어드므로 짧게 되받아친다.

## 햇빛 표식 뒤 아군 공격을 피한다
**레오나의 공격 스킬은 햇빛을 남기고 다른 적 챔피언의 공격이 추가 피해를 터뜨린다.** 표식이 생기면 레오나만 보지 말고 원거리 딜러의 다음 공격 사거리에서 빠진다. 연속 표식이 이어지기 전에 거리를 벌린다.

## 일식의 방어 시간이 끝날 때까지 기다린다
**`일식(W)`은 레오나의 피해 감소와 방어 능력을 높이고 주변 적을 맞히면 지속시간이 연장된다.** 빛나는 방패가 켜진 동안 주요 피해를 몰지 않는다. 폭발 범위 밖으로 빠져 연장을 막고 효과가 끝난 뒤 본체를 공격한다.

## 흑점 폭발의 중앙을 비운다
**`흑점 폭발(R)`은 중앙의 적을 기절시키고 외곽의 적을 둔화한다.** 원형 표시가 생기면 가장 짧은 방향으로 중앙부터 벗어난다. 아군과 붙어 한 번에 맞지 말고, 둔화만 걸렸어도 이어지는 `E`를 피할 공간을 남긴다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:35:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-leona' AND kind = 'matchup' AND champion_slug = 'leona'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-leona');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-matchup-leona-20260915', id, NULL, 0, general, '서폿 Dad 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-leona' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 미니언을 관통하는 `E`를 옆으로 피한다 · `W`가 끝난 뒤 공격한다 · `R` 중심에서 먼저 나온다

## 천공의 검은 미니언 뒤에서도 맞는다
**`천공의 검(E)`은 유닛을 관통하고 마지막으로 맞힌 챔피언에게 레오나가 이동한다.**[* [레오나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=77)] 미니언 뒤를 안전지대로 여기지 말고 레오나와 대각선으로 선다. 빗나간 뒤에는 직접 붙을 수단이 줄어드므로 짧게 되받아친다.

## 햇빛 표식 뒤 아군 공격을 피한다
**레오나의 공격 스킬은 햇빛을 남기고 다른 적 챔피언의 공격이 추가 피해를 터뜨린다.** 표식이 생기면 레오나만 보지 말고 원거리 딜러의 다음 공격 사거리에서 빠진다. 연속 표식이 이어지기 전에 거리를 벌린다.

## 일식의 방어 시간이 끝날 때까지 기다린다
**`일식(W)`은 레오나의 피해 감소와 방어 능력을 높이고 주변 적을 맞히면 지속시간이 연장된다.** 빛나는 방패가 켜진 동안 주요 피해를 몰지 않는다. 폭발 범위 밖으로 빠져 연장을 막고 효과가 끝난 뒤 본체를 공격한다.

## 흑점 폭발의 중앙을 비운다
**`흑점 폭발(R)`은 중앙의 적을 기절시키고 외곽의 적을 둔화한다.** 원형 표시가 생기면 가장 짧은 방향으로 중앙부터 벗어난다. 아군과 붙어 한 번에 맞지 말고, 둔화만 걸렸어도 이어지는 `E`를 피할 공간을 남긴다.'
AND updated_at = '2026-09-15T10:35:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-matchup-leona-20260915');

-- alistar 상대법 (777자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-alistar', 'matchup', NULL, NULL, 'published', 'alistar', '', 0, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — `W-Q` 거리 밖을 지킨다 · 벽과 적 진영 쪽으로 밀릴 자리를 피한다 · `R` 중에는 다른 대상을 친다

## 박치기와 분쇄가 닿는 선을 넘지 않는다
**알리스타는 `박치기(W)`로 다가오는 중 `분쇄(Q)`를 이어 밀어내지 않고 띄울 수 있다.**[* [알리스타 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=2)] 두 기술이 모두 준비됐을 때 혼자 사거리 안 막타를 먹지 않는다. 조합이 빗나간 뒤에는 제어 공백이 길어져 반격할 기회가 열린다.

## 박치기로 날아갈 방향을 뒤에서 확인한다
**`박치기(W)`는 대상을 알리스타 반대쪽으로 멀리 밀어낸다.** 내 뒤가 적 포탑이나 적 아군이면 정면으로 접근하지 않는다. 아군에게서 떼어내려는 움직임에도 쓰이므로 추격할 때 알리스타와 핵심 대상 사이에 서지 않는다.

## 짓밟기 다섯 중첩 전에 거리를 벌린다
**`짓밟기(E)`가 챔피언에게 반복해서 닿으면 다음 기본 공격이 기절한다.** 알리스타 주변의 효과와 중첩 표시를 보고 준비되기 전에 빠진다. 유닛을 통과해 따라올 수 있으므로 미니언 사이를 맴돌기보다 실제 거리를 만든다.

## 꺾을 수 없는 의지에 화력을 낭비하지 않는다
**`꺾을 수 없는 의지(R)`은 방해 효과를 제거하고 받는 물리·마법 피해를 크게 줄인다.** 발동 직후 주요 공격을 계속 쓰지 말고 뒤의 적을 노리거나 지속시간을 흘린다. 끝나기 직전 알리스타의 퇴로를 막아 다시 압박한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:35:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-alistar' AND kind = 'matchup' AND champion_slug = 'alistar'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-alistar');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-matchup-alistar-20260915', id, NULL, 0, general, '서폿 Dad 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-alistar' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — `W-Q` 거리 밖을 지킨다 · 벽과 적 진영 쪽으로 밀릴 자리를 피한다 · `R` 중에는 다른 대상을 친다

## 박치기와 분쇄가 닿는 선을 넘지 않는다
**알리스타는 `박치기(W)`로 다가오는 중 `분쇄(Q)`를 이어 밀어내지 않고 띄울 수 있다.**[* [알리스타 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=2)] 두 기술이 모두 준비됐을 때 혼자 사거리 안 막타를 먹지 않는다. 조합이 빗나간 뒤에는 제어 공백이 길어져 반격할 기회가 열린다.

## 박치기로 날아갈 방향을 뒤에서 확인한다
**`박치기(W)`는 대상을 알리스타 반대쪽으로 멀리 밀어낸다.** 내 뒤가 적 포탑이나 적 아군이면 정면으로 접근하지 않는다. 아군에게서 떼어내려는 움직임에도 쓰이므로 추격할 때 알리스타와 핵심 대상 사이에 서지 않는다.

## 짓밟기 다섯 중첩 전에 거리를 벌린다
**`짓밟기(E)`가 챔피언에게 반복해서 닿으면 다음 기본 공격이 기절한다.** 알리스타 주변의 효과와 중첩 표시를 보고 준비되기 전에 빠진다. 유닛을 통과해 따라올 수 있으므로 미니언 사이를 맴돌기보다 실제 거리를 만든다.

## 꺾을 수 없는 의지에 화력을 낭비하지 않는다
**`꺾을 수 없는 의지(R)`은 방해 효과를 제거하고 받는 물리·마법 피해를 크게 줄인다.** 발동 직후 주요 공격을 계속 쓰지 말고 뒤의 적을 노리거나 지속시간을 흘린다. 끝나기 직전 알리스타의 퇴로를 막아 다시 압박한다.'
AND updated_at = '2026-09-15T10:35:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-matchup-alistar-20260915');

-- rakan 상대법 (765자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-rakan', 'matchup', NULL, NULL, 'published', 'rakan', '', 0, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — `W` 착지 원에서 나온다 · 라칸이 돌아갈 아군 위치를 본다 · `R` 첫 접촉을 내주지 않는다

## 화려한 등장의 착지 지점을 옆으로 피한다
**`화려한 등장(W)`은 목표 지점에 도약한 뒤 잠시 후 주변 적을 띄운다.**[* [라칸 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=135)] 라칸 본체에서 멀어지는 방향만 고집하지 말고 원의 가까운 가장자리로 나온다. 빗나간 뒤 돌아갈 아군이 멀다면 본체를 짧게 압박한다.

## 전쟁무도의 발판까지 포함해 거리를 잰다
**`전쟁무도(E)`는 아군에게 도약해 보호막을 주고 한 번 더 사용할 수 있다.** 라칸과 직접 거리가 멀어도 앞선 아군을 발판으로 갑자기 접근할 수 있다. 적 아군의 위치를 함께 보고 두 번째 도약이 끝난 뒤 추격한다.

## 빛나는 깃털 적중 뒤 회복을 막는다
**`빛나는 깃털(Q)`이 챔피언에 맞으면 라칸과 주변 아군을 회복할 수 있다.** 투사체를 미니언으로 막고, 맞았다면 라칸이 아군에게 닿아 회복을 앞당길 수 있음을 계산한다. 작은 교환을 길게 끌어 회복할 시간을 주지 않는다.

## 매혹의 질주에서 서로 다른 방향으로 흩어진다
**`매혹의 질주(R)` 중 라칸에게 닿으면 매혹되고 첫 챔피언 접촉 뒤 라칸이 더 빨라진다.** 선두가 쉽게 닿아 주면 후방까지 연쇄된다. 아군과 거리를 두고 첫 진입 경로에서 벗어나며, 라칸의 복귀 아군 쪽을 함께 압박한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:35:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-rakan' AND kind = 'matchup' AND champion_slug = 'rakan'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-rakan');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-matchup-rakan-20260915', id, NULL, 0, general, '서폿 Dad 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-rakan' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — `W` 착지 원에서 나온다 · 라칸이 돌아갈 아군 위치를 본다 · `R` 첫 접촉을 내주지 않는다

## 화려한 등장의 착지 지점을 옆으로 피한다
**`화려한 등장(W)`은 목표 지점에 도약한 뒤 잠시 후 주변 적을 띄운다.**[* [라칸 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=135)] 라칸 본체에서 멀어지는 방향만 고집하지 말고 원의 가까운 가장자리로 나온다. 빗나간 뒤 돌아갈 아군이 멀다면 본체를 짧게 압박한다.

## 전쟁무도의 발판까지 포함해 거리를 잰다
**`전쟁무도(E)`는 아군에게 도약해 보호막을 주고 한 번 더 사용할 수 있다.** 라칸과 직접 거리가 멀어도 앞선 아군을 발판으로 갑자기 접근할 수 있다. 적 아군의 위치를 함께 보고 두 번째 도약이 끝난 뒤 추격한다.

## 빛나는 깃털 적중 뒤 회복을 막는다
**`빛나는 깃털(Q)`이 챔피언에 맞으면 라칸과 주변 아군을 회복할 수 있다.** 투사체를 미니언으로 막고, 맞았다면 라칸이 아군에게 닿아 회복을 앞당길 수 있음을 계산한다. 작은 교환을 길게 끌어 회복할 시간을 주지 않는다.

## 매혹의 질주에서 서로 다른 방향으로 흩어진다
**`매혹의 질주(R)` 중 라칸에게 닿으면 매혹되고 첫 챔피언 접촉 뒤 라칸이 더 빨라진다.** 선두가 쉽게 닿아 주면 후방까지 연쇄된다. 아군과 거리를 두고 첫 진입 경로에서 벗어나며, 라칸의 복귀 아군 쪽을 함께 압박한다.'
AND updated_at = '2026-09-15T10:35:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-matchup-rakan-20260915');

-- braum 상대법 (765자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-braum', 'matchup', NULL, NULL, 'published', 'braum', '', 0, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 뇌진탕 중첩이 쌓이면 거리를 끊는다 · `E` 방패에 핵심 투사체를 쓰지 않는다 · `R` 직선과 옆으로 움직인다

## 뇌진탕 펀치 네 번째 공격을 허용하지 않는다
**브라움의 기본 공격이나 `동상(Q)`이 첫 중첩을 남기면 적 아군의 기본 공격도 중첩을 쌓아 기절시킨다.**[* [브라움 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=119)] 표식이 생긴 순간 짧은 교환을 끝내고 사거리 밖으로 빠진다. 같은 대상에게 다시 발동하지 못하는 시간에만 앞으로 나간다.

## 내가 지킨다의 아군 발판을 본다
**`내가 지킨다(W)`는 브라움이 아군 챔피언이나 미니언에게 도약하게 한다.** 멀리 있는 브라움만 보고 방심하지 말고 전진한 미니언과 적 아군 주변을 경계한다. 도약 뒤 방어 능력이 오른 대상에게 피해를 몰지 않는다.

## 불굴의 방향을 바꾸게 만든다
**`불굴(E)`은 지정 방향 첫 공격의 피해를 없애고 이후 피해를 줄이며 투사체를 파괴한다.** 핵심 기술을 정면 방패에 쓰지 말고 측면으로 이동하거나 지속시간을 기다린다. 여러 방향에서 압박해 브라움이 모두 가로막지 못하게 한다.

## 빙하 균열을 뒤로만 피하지 않는다
**`빙하 균열(R)`은 전방 직선의 적을 띄우고 둔화 지대를 남긴다.** 같은 선을 따라 도망치면 계속 느려지므로 옆으로 벗어난다. 첫 번째 챔피언이 더 오래 뜰 수 있어 아군 앞에 대신 서려 하지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:35:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-braum' AND kind = 'matchup' AND champion_slug = 'braum'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-braum');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-matchup-braum-20260915', id, NULL, 0, general, '서폿 Dad 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-braum' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 뇌진탕 중첩이 쌓이면 거리를 끊는다 · `E` 방패에 핵심 투사체를 쓰지 않는다 · `R` 직선과 옆으로 움직인다

## 뇌진탕 펀치 네 번째 공격을 허용하지 않는다
**브라움의 기본 공격이나 `동상(Q)`이 첫 중첩을 남기면 적 아군의 기본 공격도 중첩을 쌓아 기절시킨다.**[* [브라움 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=119)] 표식이 생긴 순간 짧은 교환을 끝내고 사거리 밖으로 빠진다. 같은 대상에게 다시 발동하지 못하는 시간에만 앞으로 나간다.

## 내가 지킨다의 아군 발판을 본다
**`내가 지킨다(W)`는 브라움이 아군 챔피언이나 미니언에게 도약하게 한다.** 멀리 있는 브라움만 보고 방심하지 말고 전진한 미니언과 적 아군 주변을 경계한다. 도약 뒤 방어 능력이 오른 대상에게 피해를 몰지 않는다.

## 불굴의 방향을 바꾸게 만든다
**`불굴(E)`은 지정 방향 첫 공격의 피해를 없애고 이후 피해를 줄이며 투사체를 파괴한다.** 핵심 기술을 정면 방패에 쓰지 말고 측면으로 이동하거나 지속시간을 기다린다. 여러 방향에서 압박해 브라움이 모두 가로막지 못하게 한다.

## 빙하 균열을 뒤로만 피하지 않는다
**`빙하 균열(R)`은 전방 직선의 적을 띄우고 둔화 지대를 남긴다.** 같은 선을 따라 도망치면 계속 느려지므로 옆으로 벗어난다. 첫 번째 챔피언이 더 오래 뜰 수 있어 아군 앞에 대신 서려 하지 않는다.'
AND updated_at = '2026-09-15T10:35:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-matchup-braum-20260915');

-- rell 상대법 (768자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-rell', 'matchup', NULL, NULL, 'published', 'rell', '', 0, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 탑승 `W` 착지 원을 피한다 · 보호막은 `Q` 앞에서 믿지 않는다 · 보행 상태의 재탑승 공격을 기다린다

## 철마술 붕괴의 착지에서 옆으로 나온다
**탑승 상태의 `철마술: 붕괴(W)`는 렐이 뛰어내리며 주변 적을 띄우고 자신에게 보호막을 준다.**[* [렐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=153)] 전진만 하거나 뒤로만 피하지 말고 착지 원의 옆 가장자리로 움직인다. 빗나간 렐은 느린 보행 상태가 되므로 그때 거리를 유지하며 압박한다.

## 파열의 일격 앞에서는 보호막이 안전하지 않다
**`파열의 일격(Q)`은 보호막을 파괴하고 첫 대상에게 기절을 준다.** 보호막이 생겼다고 렐 정면에 오래 서지 않는다. 투사체 선에서 옆으로 빠지고 `Q`가 다른 대상에게 사용된 뒤에 보호 효과를 믿고 교환한다.

## 재탑승 뒤 첫 기본 공격을 피한다
**보행 상태에서 다시 철마에 오르면 렐이 빨라지고 다음 기본 공격으로 적을 띄운다.** 렐이 탑승하는 순간 가까운 막타를 양보해 공격 사거리를 주지 않는다. 강화 공격이 다른 대상에 빠진 뒤 접근한다.

## 자기 폭풍에서 아군과 같은 방향으로 빠지지 않는다
**`자기 폭풍(R)`은 주변 적을 렐 쪽으로 당기고 잠시 계속 끌어모은다.** 이동기를 사용해 범위 밖으로 나가되 아군과 포개지지 않는다. 렐 중심에 모이면 후속 광역 제어를 함께 맞으므로 서로 다른 가장자리로 흩어진다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:35:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-rell' AND kind = 'matchup' AND champion_slug = 'rell'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-rell');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-matchup-rell-20260915', id, NULL, 0, general, '서폿 Dad 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-rell' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 탑승 `W` 착지 원을 피한다 · 보호막은 `Q` 앞에서 믿지 않는다 · 보행 상태의 재탑승 공격을 기다린다

## 철마술 붕괴의 착지에서 옆으로 나온다
**탑승 상태의 `철마술: 붕괴(W)`는 렐이 뛰어내리며 주변 적을 띄우고 자신에게 보호막을 준다.**[* [렐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=153)] 전진만 하거나 뒤로만 피하지 말고 착지 원의 옆 가장자리로 움직인다. 빗나간 렐은 느린 보행 상태가 되므로 그때 거리를 유지하며 압박한다.

## 파열의 일격 앞에서는 보호막이 안전하지 않다
**`파열의 일격(Q)`은 보호막을 파괴하고 첫 대상에게 기절을 준다.** 보호막이 생겼다고 렐 정면에 오래 서지 않는다. 투사체 선에서 옆으로 빠지고 `Q`가 다른 대상에게 사용된 뒤에 보호 효과를 믿고 교환한다.

## 재탑승 뒤 첫 기본 공격을 피한다
**보행 상태에서 다시 철마에 오르면 렐이 빨라지고 다음 기본 공격으로 적을 띄운다.** 렐이 탑승하는 순간 가까운 막타를 양보해 공격 사거리를 주지 않는다. 강화 공격이 다른 대상에 빠진 뒤 접근한다.

## 자기 폭풍에서 아군과 같은 방향으로 빠지지 않는다
**`자기 폭풍(R)`은 주변 적을 렐 쪽으로 당기고 잠시 계속 끌어모은다.** 이동기를 사용해 범위 밖으로 나가되 아군과 포개지지 않는다. 렐 중심에 모이면 후속 광역 제어를 함께 맞으므로 서로 다른 가장자리로 흩어진다.'
AND updated_at = '2026-09-15T10:35:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-matchup-rell-20260915');

-- pyke 상대법 (780자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-pyke', 'matchup', NULL, NULL, 'published', 'pyke', '', 0, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 충전하는 `Q`는 미니언으로 막는다 · 시야 밖 회복을 허용하지 않는다 · `R` 처형선에서 즉시 벗어난다

## 뼈 작살의 충전 동작에 옆으로 움직인다
**`뼈 작살(Q)`은 짧게 쓰면 가까운 적을 찌르고 길게 충전하면 처음 맞은 적을 끌어당긴다.**[* [파이크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=141)] 파이크가 몸을 낮추면 미니언 뒤로 이동하되 같은 선에 고정되지 않는다. 빗나간 뒤에는 먼 거리에서 교전을 열기 어려워진다.

## 유령 잠수의 표시가 보이면 서로 붙는다
**`유령 잠수(W)`은 파이크를 위장시키고 빠르게 이동하게 하지만 적 챔피언이 가까우면 감지된다.** 혼자 수풀을 확인하지 말고 아군과 함께 범위를 겹친다. 파이크가 시야에서 사라지면 회색 체력도 회복하므로 추적할 수 없다면 교전을 초기화한다.

## 망자의 물살은 파이크가 아니라 유령을 피한다
**`망자의 물살(E)`은 파이크가 돌진한 뒤 출발점의 유령이 본체로 돌아오며 경로의 챔피언을 기절시킨다.** 파이크만 따라가지 말고 뒤에서 오는 선의 옆으로 빠진다. 돌진 끝과 출발점 사이에 서지 않는다.

## 깊은 바다의 처형 X에서 체력을 회복한다
**`깊은 바다의 처형(R)`은 기준 아래 체력의 적을 처형하고 성공하면 다시 사용할 수 있다.** 체력 표시와 바닥의 X가 보이면 즉시 범위 밖으로 이동하거나 처형선 위로 회복한다. 첫 처형을 막으면 연속 사용도 끊을 수 있다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:35:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-pyke' AND kind = 'matchup' AND champion_slug = 'pyke'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-pyke');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-matchup-pyke-20260915', id, NULL, 0, general, '서폿 Dad 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-pyke' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 충전하는 `Q`는 미니언으로 막는다 · 시야 밖 회복을 허용하지 않는다 · `R` 처형선에서 즉시 벗어난다

## 뼈 작살의 충전 동작에 옆으로 움직인다
**`뼈 작살(Q)`은 짧게 쓰면 가까운 적을 찌르고 길게 충전하면 처음 맞은 적을 끌어당긴다.**[* [파이크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=141)] 파이크가 몸을 낮추면 미니언 뒤로 이동하되 같은 선에 고정되지 않는다. 빗나간 뒤에는 먼 거리에서 교전을 열기 어려워진다.

## 유령 잠수의 표시가 보이면 서로 붙는다
**`유령 잠수(W)`은 파이크를 위장시키고 빠르게 이동하게 하지만 적 챔피언이 가까우면 감지된다.** 혼자 수풀을 확인하지 말고 아군과 함께 범위를 겹친다. 파이크가 시야에서 사라지면 회색 체력도 회복하므로 추적할 수 없다면 교전을 초기화한다.

## 망자의 물살은 파이크가 아니라 유령을 피한다
**`망자의 물살(E)`은 파이크가 돌진한 뒤 출발점의 유령이 본체로 돌아오며 경로의 챔피언을 기절시킨다.** 파이크만 따라가지 말고 뒤에서 오는 선의 옆으로 빠진다. 돌진 끝과 출발점 사이에 서지 않는다.

## 깊은 바다의 처형 X에서 체력을 회복한다
**`깊은 바다의 처형(R)`은 기준 아래 체력의 적을 처형하고 성공하면 다시 사용할 수 있다.** 체력 표시와 바닥의 X가 보이면 즉시 범위 밖으로 이동하거나 처형선 위로 회복한다. 첫 처형을 막으면 연속 사용도 끊을 수 있다.'
AND updated_at = '2026-09-15T10:35:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-matchup-pyke-20260915');

-- renata 상대법 (801자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-renata', 'matchup', NULL, NULL, 'published', 'renata', '', 0, '16.17.1', 'guarded', '2026-09-15T10:35:00.000Z', '2026-09-15T10:35:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — `Q`에 잡힌 아군과 떨어진다 · `W` 대상은 부식이 끝날 때까지 확인한다 · `R` 파도에서 옆으로 나온다

## 악수로 던질 충돌 대상을 주지 않는다
**`악수(Q)`는 처음 맞은 적을 속박한 뒤 원하는 방향으로 던지고, 챔피언과 충돌하면 추가 제어를 준다.**[* [레나타 글라스크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=159)] 잡힌 아군 바로 뒤나 옆에 붙지 말고 던질 방향을 비운다. 투사체가 빗나간 뒤에는 레나타의 직접 제어가 크게 줄어든다.

## 긴급 구제 대상의 처치 관여를 막는다
**`긴급 구제(W)`를 받은 아군은 죽음이 잠시 늦춰지고 그동안 처치에 관여하면 살아남을 수 있다.** 체력이 사라졌다고 시선을 돌리지 말고 부식이 끝날 때까지 거리를 유지한다. 반대로 위험한 아군을 내주면 되살아날 수 있으므로 함께 빠진다.

## 충성 고객 우대의 두 경로를 피한다
**`충성 고객 우대(E)`는 아군에게 보호막을 주면서 경로의 적에게 피해와 둔화를 준다.** 레나타와 적 아군 사이 직선에 서면 한 번에 두 효과를 허용한다. 옆으로 이동해 보호와 견제가 겹치지 않게 하고 보호막이 끝난 뒤 공격한다.

## 적대적 인수 앞에서 아군과 흩어진다
**`적대적 인수(R)`에 맞으면 광란 상태로 가까운 유닛, 특히 자기 아군을 기본 공격한다.** 파도가 느리므로 뒤로만 달리지 말고 옆 가장자리로 벗어난다. 공격 속도가 빠른 아군과 겹치지 않고, 맞았다면 서로의 공격 거리부터 끊는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:35:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-renata' AND kind = 'matchup' AND champion_slug = 'renata'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-renata');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-dad-matchup-renata-20260915', id, NULL, 0, general, '서폿 Dad 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:35:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-renata' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — `Q`에 잡힌 아군과 떨어진다 · `W` 대상은 부식이 끝날 때까지 확인한다 · `R` 파도에서 옆으로 나온다

## 악수로 던질 충돌 대상을 주지 않는다
**`악수(Q)`는 처음 맞은 적을 속박한 뒤 원하는 방향으로 던지고, 챔피언과 충돌하면 추가 제어를 준다.**[* [레나타 글라스크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=159)] 잡힌 아군 바로 뒤나 옆에 붙지 말고 던질 방향을 비운다. 투사체가 빗나간 뒤에는 레나타의 직접 제어가 크게 줄어든다.

## 긴급 구제 대상의 처치 관여를 막는다
**`긴급 구제(W)`를 받은 아군은 죽음이 잠시 늦춰지고 그동안 처치에 관여하면 살아남을 수 있다.** 체력이 사라졌다고 시선을 돌리지 말고 부식이 끝날 때까지 거리를 유지한다. 반대로 위험한 아군을 내주면 되살아날 수 있으므로 함께 빠진다.

## 충성 고객 우대의 두 경로를 피한다
**`충성 고객 우대(E)`는 아군에게 보호막을 주면서 경로의 적에게 피해와 둔화를 준다.** 레나타와 적 아군 사이 직선에 서면 한 번에 두 효과를 허용한다. 옆으로 이동해 보호와 견제가 겹치지 않게 하고 보호막이 끝난 뒤 공격한다.

## 적대적 인수 앞에서 아군과 흩어진다
**`적대적 인수(R)`에 맞으면 광란 상태로 가까운 유닛, 특히 자기 아군을 기본 공격한다.** 파도가 느리므로 뒤로만 달리지 말고 옆 가장자리로 벗어난다. 공격 속도가 빠른 아군과 겹치지 않고, 맞았다면 서로의 공격 거리부터 끊는다.'
AND updated_at = '2026-09-15T10:35:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-dad-matchup-renata-20260915');
