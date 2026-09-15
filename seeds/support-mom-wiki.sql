-- scripts/seed-support-mom-wiki.ts가 생성. 서폿 Mom 일반 위키 8개와 공통 상대법 8개.
-- 세라핀·카르마 공유 문서와 사용자 편집은 덮어쓰지 않으며 같은 SQL을 다시 실행해도 이력이 늘지 않는다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)
VALUES ('user-system', 'system', 'seed', '깨남.COM', NULL, 'admin', '2026-09-15T10:10:00.000Z');

-- 룰루 챔피언 위키 (889자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-mom-champion-lulu-20260915', 'article', '룰루', '룰루', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 픽스 위치로 `Q` 각을 넓힌다 · `W`를 강화와 무력화 중 하나로 고른다 · `R`의 즉시 띄우기를 살린다

[[분류:서폿]] [[분류:Mom]]

## 픽스가 있는 두 지점에서 창을 쏜다

**`반짝반짝 창(Q)`은 룰루와 픽스가 각각 화살을 발사하므로 픽스가 붙은 대상에 따라 각도가 달라진다.**[* [룰루 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=95)] `도와줘, 픽스!(E)`를 아군이나 적에게 먼저 사용해 미니언 옆으로 새 발사점을 만들고, 두 화살 중 하나가 상대의 퇴로를 가르게 한다.

## 변덕쟁이의 대상을 교전 전에 정한다

**`변덕쟁이(W)`는 아군에게 공격·이동 속도를 주지만 적에게 쓰면 기본 공격과 스킬을 막는 변이 효과가 된다.** 아군이 자유롭게 공격할 상황이면 강화로, 상대 돌진 챔피언이 핵심 기술을 쓰려 한다면 무력화로 남긴다. 작은 견제에 사용해 결정적인 진입을 막을 수단을 잃지 않는다.

## 도와줘, 픽스의 양면을 활용한다

**`도와줘, 픽스!(E)`는 아군에게 보호막을 주고 픽스를 붙이거나, 적에게 피해를 주고 위치를 드러낸다.** 아군 보호가 우선이면 피해 욕심을 버리고 먼저 보호막을 건다. 은신이나 수풀 진입을 추적해야 할 때는 적에게 붙여 시야를 유지하고 `Q`의 발사점으로 삼는다.

## 급성장은 체력이 낮아진 뒤만 쓰는 기술이 아니다

**`급성장(R)`은 아군의 체력을 늘리는 동시에 주변 적을 즉시 공중으로 띄우고 이후 둔화시킨다.** 체력 회복처럼 마지막까지 기다리기보다 상대가 붙는 순간 사용해 공격 흐름을 끊는다. 여러 적 사이로 들어간 아군에게 쓰면 생존과 광역 제어를 함께 만든다.', 1, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-mom-champion-lulu-20260915' OR (kind = 'article' AND title_key = '룰루'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-champion-lulu-20260915', id, NULL, 0, general, '서폿 Mom 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-mom-champion-lulu-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 픽스 위치로 `Q` 각을 넓힌다 · `W`를 강화와 무력화 중 하나로 고른다 · `R`의 즉시 띄우기를 살린다

[[분류:서폿]] [[분류:Mom]]

## 픽스가 있는 두 지점에서 창을 쏜다

**`반짝반짝 창(Q)`은 룰루와 픽스가 각각 화살을 발사하므로 픽스가 붙은 대상에 따라 각도가 달라진다.**[* [룰루 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=95)] `도와줘, 픽스!(E)`를 아군이나 적에게 먼저 사용해 미니언 옆으로 새 발사점을 만들고, 두 화살 중 하나가 상대의 퇴로를 가르게 한다.

## 변덕쟁이의 대상을 교전 전에 정한다

**`변덕쟁이(W)`는 아군에게 공격·이동 속도를 주지만 적에게 쓰면 기본 공격과 스킬을 막는 변이 효과가 된다.** 아군이 자유롭게 공격할 상황이면 강화로, 상대 돌진 챔피언이 핵심 기술을 쓰려 한다면 무력화로 남긴다. 작은 견제에 사용해 결정적인 진입을 막을 수단을 잃지 않는다.

## 도와줘, 픽스의 양면을 활용한다

**`도와줘, 픽스!(E)`는 아군에게 보호막을 주고 픽스를 붙이거나, 적에게 피해를 주고 위치를 드러낸다.** 아군 보호가 우선이면 피해 욕심을 버리고 먼저 보호막을 건다. 은신이나 수풀 진입을 추적해야 할 때는 적에게 붙여 시야를 유지하고 `Q`의 발사점으로 삼는다.

## 급성장은 체력이 낮아진 뒤만 쓰는 기술이 아니다

**`급성장(R)`은 아군의 체력을 늘리는 동시에 주변 적을 즉시 공중으로 띄우고 이후 둔화시킨다.** 체력 회복처럼 마지막까지 기다리기보다 상대가 붙는 순간 사용해 공격 흐름을 끊는다. 여러 적 사이로 들어간 아군에게 쓰면 생존과 광역 제어를 함께 만든다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-champion-lulu-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-lulu-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-mom-champion-lulu-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-lulu-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-lulu-20260915', NULL, '분류:mom', '분류:Mom' FROM wiki_docs WHERE id = 'doc-support-mom-champion-lulu-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-lulu-20260915' AND target_key = '분류:mom');

-- 소라카 챔피언 위키 (872자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-mom-champion-soraka-20260915', 'article', '소라카', '소라카', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — `Q` 적중으로 체력을 돌려받는다 · 회복 전에 내 체력을 확인한다 · `E`로 돌진 뒤 자리를 봉쇄한다

[[분류:서폿]] [[분류:Mom]]

## 별부름 적중 뒤에 치유한다

**`별부름(Q)`이 챔피언에게 맞으면 소라카가 회복하고 이동 속도를 얻으며, 이 효과는 `은하의 마력(W)`으로 아군에게 전해진다.**[* [소라카 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=60)] 먼저 `Q`를 맞힌 뒤 회복하면 내 체력 소모를 보완하고 아군도 지속 회복시킬 수 있다. 적이 막타를 치는 순간의 발밑을 겨냥한다.

## 은하의 마력은 내 체력도 자원으로 쓴다

**`은하의 마력(W)`은 소라카의 체력을 일부 소모해 아군을 회복한다.** 아군 체력만 보고 연속 사용하면 소라카가 먼저 공격 대상이 된다. `Q` 적중과 안전한 후방 위치를 확보한 뒤 사용하고, 두 아군이 동시에 다쳤다면 먼저 위협받는 쪽을 살린다.

## 별의 균형으로 기술을 쓸 자리를 지운다

**`별의 균형(E)`은 범위 안 적을 침묵시키고 끝까지 남은 적을 속박한다.** 적 발밑에 단독으로 깔기보다 돌진이 끝나는 자리, 아군 제어가 이어지는 자리, 좁은 퇴로에 둔다. 채널링 기술을 끊어야 할 때는 속박을 기다리지 말고 즉시 침묵 용도로 사용한다.

## 기원은 화면 밖 교전까지 읽는다

**`기원(R)`은 거리와 관계없이 모든 아군 챔피언을 즉시 회복한다.** 내 라인만 보지 말고 전투 알림과 아군 체력 표시를 확인한다. 여러 명이 동시에 피해를 받는 순간에 사용하되, 이미 안전하게 빠진 한 명만을 위해 쓰기보다 다음 피해가 들어오기 직전을 고른다.', 1, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-mom-champion-soraka-20260915' OR (kind = 'article' AND title_key = '소라카'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-champion-soraka-20260915', id, NULL, 0, general, '서폿 Mom 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-mom-champion-soraka-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — `Q` 적중으로 체력을 돌려받는다 · 회복 전에 내 체력을 확인한다 · `E`로 돌진 뒤 자리를 봉쇄한다

[[분류:서폿]] [[분류:Mom]]

## 별부름 적중 뒤에 치유한다

**`별부름(Q)`이 챔피언에게 맞으면 소라카가 회복하고 이동 속도를 얻으며, 이 효과는 `은하의 마력(W)`으로 아군에게 전해진다.**[* [소라카 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=60)] 먼저 `Q`를 맞힌 뒤 회복하면 내 체력 소모를 보완하고 아군도 지속 회복시킬 수 있다. 적이 막타를 치는 순간의 발밑을 겨냥한다.

## 은하의 마력은 내 체력도 자원으로 쓴다

**`은하의 마력(W)`은 소라카의 체력을 일부 소모해 아군을 회복한다.** 아군 체력만 보고 연속 사용하면 소라카가 먼저 공격 대상이 된다. `Q` 적중과 안전한 후방 위치를 확보한 뒤 사용하고, 두 아군이 동시에 다쳤다면 먼저 위협받는 쪽을 살린다.

## 별의 균형으로 기술을 쓸 자리를 지운다

**`별의 균형(E)`은 범위 안 적을 침묵시키고 끝까지 남은 적을 속박한다.** 적 발밑에 단독으로 깔기보다 돌진이 끝나는 자리, 아군 제어가 이어지는 자리, 좁은 퇴로에 둔다. 채널링 기술을 끊어야 할 때는 속박을 기다리지 말고 즉시 침묵 용도로 사용한다.

## 기원은 화면 밖 교전까지 읽는다

**`기원(R)`은 거리와 관계없이 모든 아군 챔피언을 즉시 회복한다.** 내 라인만 보지 말고 전투 알림과 아군 체력 표시를 확인한다. 여러 명이 동시에 피해를 받는 순간에 사용하되, 이미 안전하게 빠진 한 명만을 위해 쓰기보다 다음 피해가 들어오기 직전을 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-champion-soraka-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-soraka-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-mom-champion-soraka-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-soraka-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-soraka-20260915', NULL, '분류:mom', '분류:Mom' FROM wiki_docs WHERE id = 'doc-support-mom-champion-soraka-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-soraka-20260915' AND target_key = '분류:mom');

-- 나미 챔피언 위키 (872자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-mom-champion-nami-20260915', 'article', '나미', '나미', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — `Q`는 이동이 제한된 뒤에 던진다 · `W`가 세 번 튈 배치를 만든다 · `E`를 스킬 적중에도 연결한다

[[분류:서폿]] [[분류:Mom]]

## 물의 감옥은 다음 위치에 놓는다

**`물의 감옥(Q)`은 도착까지 시간이 걸리지만 맞은 적을 기절시키므로, 현재 발밑보다 이동할 곳을 노린다.**[* [나미 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=108)] 아군의 둔화나 제어 뒤에 이어 쓰고, 단독으로 열 때는 벽과 미니언 사이처럼 선택지가 적은 곳에 던진다. 빗나가면 한동안 진입을 막기 어려워 거리를 둔다.

## 밀물 썰물의 첫 대상을 배치로 고른다

**`밀물 썰물(W)`은 아군과 적을 번갈아 최대 세 대상에게 튕기며 회복과 피해를 준다.** 교전 전에 아군과 적 사이 간격을 확인해 세 번 이어질 첫 대상을 선택한다. 아군에게 먼저 써도 적에게 닿고 다시 아군으로 돌아올 수 있으므로 직접 앞으로 나갈 필요가 없다.

## 파도 소환사의 축복을 적중 직전에 건다

**`파도 소환사의 축복(E)`은 아군의 기본 공격과 스킬에 추가 피해와 둔화를 싣는다.** 미리 걸어 지속시간을 흘리기보다 아군 투사체가 날아가거나 연속 공격이 시작될 때 사용한다. 첫 둔화가 들어가면 `Q`의 도착 지점을 맞히기 쉬워진다.

## 해일 뒤에 모든 기술을 잇는다

**`해일(R)`은 넓은 경로의 적을 띄우고 둔화하며, 맞은 아군은 나미의 이동 속도 증가 효과를 더 크게 받는다.** 먼 거리에서 교전을 열거나 좁은 길의 퇴로를 닫는다. 해일이 닿은 직후 `Q`를 착지 지점에 두고, 빠르게 전진하는 아군에게 `E`를 연결한다.', 1, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-mom-champion-nami-20260915' OR (kind = 'article' AND title_key = '나미'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-champion-nami-20260915', id, NULL, 0, general, '서폿 Mom 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-mom-champion-nami-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — `Q`는 이동이 제한된 뒤에 던진다 · `W`가 세 번 튈 배치를 만든다 · `E`를 스킬 적중에도 연결한다

[[분류:서폿]] [[분류:Mom]]

## 물의 감옥은 다음 위치에 놓는다

**`물의 감옥(Q)`은 도착까지 시간이 걸리지만 맞은 적을 기절시키므로, 현재 발밑보다 이동할 곳을 노린다.**[* [나미 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=108)] 아군의 둔화나 제어 뒤에 이어 쓰고, 단독으로 열 때는 벽과 미니언 사이처럼 선택지가 적은 곳에 던진다. 빗나가면 한동안 진입을 막기 어려워 거리를 둔다.

## 밀물 썰물의 첫 대상을 배치로 고른다

**`밀물 썰물(W)`은 아군과 적을 번갈아 최대 세 대상에게 튕기며 회복과 피해를 준다.** 교전 전에 아군과 적 사이 간격을 확인해 세 번 이어질 첫 대상을 선택한다. 아군에게 먼저 써도 적에게 닿고 다시 아군으로 돌아올 수 있으므로 직접 앞으로 나갈 필요가 없다.

## 파도 소환사의 축복을 적중 직전에 건다

**`파도 소환사의 축복(E)`은 아군의 기본 공격과 스킬에 추가 피해와 둔화를 싣는다.** 미리 걸어 지속시간을 흘리기보다 아군 투사체가 날아가거나 연속 공격이 시작될 때 사용한다. 첫 둔화가 들어가면 `Q`의 도착 지점을 맞히기 쉬워진다.

## 해일 뒤에 모든 기술을 잇는다

**`해일(R)`은 넓은 경로의 적을 띄우고 둔화하며, 맞은 아군은 나미의 이동 속도 증가 효과를 더 크게 받는다.** 먼 거리에서 교전을 열거나 좁은 길의 퇴로를 닫는다. 해일이 닿은 직후 `Q`를 착지 지점에 두고, 빠르게 전진하는 아군에게 `E`를 연결한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-champion-nami-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-nami-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-mom-champion-nami-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-nami-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-nami-20260915', NULL, '분류:mom', '분류:Mom' FROM wiki_docs WHERE id = 'doc-support-mom-champion-nami-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-nami-20260915' AND target_key = '분류:mom');

-- 잔나 챔피언 위키 (868자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-mom-champion-janna-20260915', 'article', '잔나', '잔나', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — `Q`를 시야 밖에서 충전한다 · 이동 방해로 `E` 재사용 시간을 돌려받는다 · `R`의 밀치기 방향을 고른다

[[분류:서폿]] [[분류:Mom]]

## 울부짖는 돌풍의 출발점을 숨긴다

**`울부짖는 돌풍(Q)`은 오래 충전할수록 더 멀리 나아가고 더 오래 띄우며, 다시 사용하면 즉시 출발한다.**[* [잔나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=23)] 수풀이나 벽 뒤에서 진행 방향을 숨겨 상대의 막타 동선에 보낸다. 적이 갑자기 진입하면 충전을 고집하지 말고 즉시 발사해 흐름을 끊는다.

## 서풍은 따라잡기보다 간격 유지에 쓴다

**`서풍(W)`은 잔나의 이동을 돕고 적에게 사용하면 피해와 둔화를 준다.** 짧게 견제하러 갈 때는 아군 쪽으로 돌아올 길을 남긴다. 돌진한 적에게 둔화를 걸어 아군이 빠질 시간을 만들고, 사용 뒤 줄어드는 기동성을 생각해 깊이 추격하지 않는다.

## 폭풍의 눈을 피해 직전에 건다

**`폭풍의 눈(E)`은 아군 챔피언이나 포탑에 보호막과 공격력을 주며, 적의 이동을 방해하면 재사용 대기시간 일부를 돌려받는다.** 피해를 받은 뒤가 아니라 상대 공격 동작이 시작될 때 사용한다. `Q`나 `W`를 맞힌 뒤 다시 보호할 수 있도록 제어와 보호의 순서를 잇는다.

## 계절풍으로 적을 살려 보내지 않는다

**`계절풍(R)`은 주변 적을 즉시 밀어내고 정신 집중 동안 아군을 회복한다.** 무조건 뒤로 미는 기술이 아니므로 적이 날아갈 방향을 본다. 아군에게서 떼어내거나 벽 쪽으로 보내 퇴로를 막고, 급한 위험이 끝났을 때만 제자리에 남아 회복을 끝까지 유지한다.', 1, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-mom-champion-janna-20260915' OR (kind = 'article' AND title_key = '잔나'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-champion-janna-20260915', id, NULL, 0, general, '서폿 Mom 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-mom-champion-janna-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — `Q`를 시야 밖에서 충전한다 · 이동 방해로 `E` 재사용 시간을 돌려받는다 · `R`의 밀치기 방향을 고른다

[[분류:서폿]] [[분류:Mom]]

## 울부짖는 돌풍의 출발점을 숨긴다

**`울부짖는 돌풍(Q)`은 오래 충전할수록 더 멀리 나아가고 더 오래 띄우며, 다시 사용하면 즉시 출발한다.**[* [잔나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=23)] 수풀이나 벽 뒤에서 진행 방향을 숨겨 상대의 막타 동선에 보낸다. 적이 갑자기 진입하면 충전을 고집하지 말고 즉시 발사해 흐름을 끊는다.

## 서풍은 따라잡기보다 간격 유지에 쓴다

**`서풍(W)`은 잔나의 이동을 돕고 적에게 사용하면 피해와 둔화를 준다.** 짧게 견제하러 갈 때는 아군 쪽으로 돌아올 길을 남긴다. 돌진한 적에게 둔화를 걸어 아군이 빠질 시간을 만들고, 사용 뒤 줄어드는 기동성을 생각해 깊이 추격하지 않는다.

## 폭풍의 눈을 피해 직전에 건다

**`폭풍의 눈(E)`은 아군 챔피언이나 포탑에 보호막과 공격력을 주며, 적의 이동을 방해하면 재사용 대기시간 일부를 돌려받는다.** 피해를 받은 뒤가 아니라 상대 공격 동작이 시작될 때 사용한다. `Q`나 `W`를 맞힌 뒤 다시 보호할 수 있도록 제어와 보호의 순서를 잇는다.

## 계절풍으로 적을 살려 보내지 않는다

**`계절풍(R)`은 주변 적을 즉시 밀어내고 정신 집중 동안 아군을 회복한다.** 무조건 뒤로 미는 기술이 아니므로 적이 날아갈 방향을 본다. 아군에게서 떼어내거나 벽 쪽으로 보내 퇴로를 막고, 급한 위험이 끝났을 때만 제자리에 남아 회복을 끝까지 유지한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-champion-janna-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-janna-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-mom-champion-janna-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-janna-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-janna-20260915', NULL, '분류:mom', '분류:Mom' FROM wiki_docs WHERE id = 'doc-support-mom-champion-janna-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-janna-20260915' AND target_key = '분류:mom');

-- 유미 챔피언 위키 (880자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-mom-champion-yuumi-20260915', 'article', '유미', '유미', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 단짝에게 붙어 추가 효과를 살린다 · 안전할 때 내려와 회복 조건을 만든다 · `R` 중에도 위치를 조정한다

[[분류:서폿]] [[분류:Mom]]

## 단짝을 중심으로 기술 효율을 높인다

**유미가 붙은 아군이 적과 미니언을 처치하면 우정이 쌓이고, 가장 깊은 아군은 단짝이 되어 유미 기술의 추가 효과를 받는다.**[* [유미 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=144)] 교전마다 무작정 가장 가까운 아군을 옮겨 다니기보다 단짝의 공격 사거리와 진입 시점에 맞춰 지원한다.

## 안전한 순간에는 직접 적중시킨다

**유미가 기본 공격이나 스킬로 챔피언을 맞히면 자신을 회복하고, 곧 밀착하면 아군도 회복시킬 수 있다.** 상대 제어 기술과 돌진이 빠졌을 때만 잠깐 내려와 적중시키고 즉시 돌아간다. 위험 기술이 남아 있을 때 회복 한 번을 위해 몸을 드러내지 않는다.

## 사르르탄과 슈우우웅을 공격 박자에 맞춘다

**밀착 중 `사르르탄(Q)`은 궤도를 조절할 수 있고 오래 날아간 뒤 적중하면 더 강한 둔화를 준다.** 미니언 사이를 돌아 후퇴 경로에 맞힌다. `슈우우웅(E)`은 붙은 아군에게 보호막과 이동·공격 속도를 주므로 피해 뒤가 아니라 진입하거나 공격을 시작하는 순간 사용한다.

## 대단원은 움직이며 여러 아군을 스친다

**`대단원(R)`은 여러 파동으로 적에게 피해를 주고 아군을 회복하며, 시전 중에도 움직이거나 밀착 대상을 바꿀 수 있다.** 한 방향에 고정하지 말고 다친 아군과 도망가는 적이 함께 들어오도록 위치를 조절한다. 단짝에게 붙으면 방향을 다룰 수 있으므로 교전 중심의 이동을 미리 읽는다.', 1, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-mom-champion-yuumi-20260915' OR (kind = 'article' AND title_key = '유미'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-champion-yuumi-20260915', id, NULL, 0, general, '서폿 Mom 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-mom-champion-yuumi-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 단짝에게 붙어 추가 효과를 살린다 · 안전할 때 내려와 회복 조건을 만든다 · `R` 중에도 위치를 조정한다

[[분류:서폿]] [[분류:Mom]]

## 단짝을 중심으로 기술 효율을 높인다

**유미가 붙은 아군이 적과 미니언을 처치하면 우정이 쌓이고, 가장 깊은 아군은 단짝이 되어 유미 기술의 추가 효과를 받는다.**[* [유미 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=144)] 교전마다 무작정 가장 가까운 아군을 옮겨 다니기보다 단짝의 공격 사거리와 진입 시점에 맞춰 지원한다.

## 안전한 순간에는 직접 적중시킨다

**유미가 기본 공격이나 스킬로 챔피언을 맞히면 자신을 회복하고, 곧 밀착하면 아군도 회복시킬 수 있다.** 상대 제어 기술과 돌진이 빠졌을 때만 잠깐 내려와 적중시키고 즉시 돌아간다. 위험 기술이 남아 있을 때 회복 한 번을 위해 몸을 드러내지 않는다.

## 사르르탄과 슈우우웅을 공격 박자에 맞춘다

**밀착 중 `사르르탄(Q)`은 궤도를 조절할 수 있고 오래 날아간 뒤 적중하면 더 강한 둔화를 준다.** 미니언 사이를 돌아 후퇴 경로에 맞힌다. `슈우우웅(E)`은 붙은 아군에게 보호막과 이동·공격 속도를 주므로 피해 뒤가 아니라 진입하거나 공격을 시작하는 순간 사용한다.

## 대단원은 움직이며 여러 아군을 스친다

**`대단원(R)`은 여러 파동으로 적에게 피해를 주고 아군을 회복하며, 시전 중에도 움직이거나 밀착 대상을 바꿀 수 있다.** 한 방향에 고정하지 말고 다친 아군과 도망가는 적이 함께 들어오도록 위치를 조절한다. 단짝에게 붙으면 방향을 다룰 수 있으므로 교전 중심의 이동을 미리 읽는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-champion-yuumi-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-yuumi-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-mom-champion-yuumi-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-yuumi-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-yuumi-20260915', NULL, '분류:mom', '분류:Mom' FROM wiki_docs WHERE id = 'doc-support-mom-champion-yuumi-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-yuumi-20260915' AND target_key = '분류:mom');

-- 밀리오 챔피언 위키 (870자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-mom-champion-milio-20260915', 'article', '밀리오', '밀리오', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 아군에게 기술을 묻혀 다음 공격을 강화한다 · `Q`로 돌진을 밀어낸다 · `R`은 제어 적중 직후 사용한다

[[분류:서폿]] [[분류:Mom]]

## 타오르는 힘을 공격 직전에 건다

**밀리오의 기술에 닿은 아군은 다음 기본 공격이나 스킬에 추가 피해를 싣는다.**[* [밀리오 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=163)] 보호막과 회복만 보고 연속 사용하지 말고 아군의 공격 동작 직전에 효과를 준다. 여러 아군에게 차례로 기술을 닿게 하면 교전 전체의 압박을 높일 수 있다.

## 초특급 불꽃 킥을 생존용으로 남긴다

**`초특급 불꽃 킥(Q)`은 처음 맞은 적을 밀어낸 뒤 떨어져 주변에 피해와 둔화를 준다.** 돌진 챔피언이 접근하는 순간 맞혀 진입을 끊고, 뒤의 적까지 폭발에 걸치게 한다. 라인 견제에 먼저 쓰면 다음 돌진을 막을 수 없으므로 상대 핵심 기술을 확인한다.

## 아늑한 모닥불과 포옹을 나눠 쓴다

**`아늑한 모닥불(W)`은 아군을 따라가며 회복과 공격 사거리를 주고, `따스한 포옹(E)`은 두 번 충전되는 보호막과 이동 속도를 준다.** 긴 교전에는 `W`, 순간 피해나 추격에는 `E`를 배분한다. 두 충전을 한 번에 쓰기보다 다음 피해까지 간격을 둔다.

## 생명의 온기는 맞기 전에 누르지 않는다

**`생명의 온기(R)`은 주변 아군을 회복하고 방해 및 이동 불가 효과를 제거하지만 공중에 뜬 상태는 해제하지 못한다.** 적 제어의 시작 동작만 보고 미리 쓰지 말고 실제 효과가 들어온 직후 사용한다. 밀리오 자신이 먼저 제어되면 쓸 수 없으므로 아군 뒤와 측면에 선다.', 1, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-mom-champion-milio-20260915' OR (kind = 'article' AND title_key = '밀리오'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-champion-milio-20260915', id, NULL, 0, general, '서폿 Mom 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-mom-champion-milio-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 아군에게 기술을 묻혀 다음 공격을 강화한다 · `Q`로 돌진을 밀어낸다 · `R`은 제어 적중 직후 사용한다

[[분류:서폿]] [[분류:Mom]]

## 타오르는 힘을 공격 직전에 건다

**밀리오의 기술에 닿은 아군은 다음 기본 공격이나 스킬에 추가 피해를 싣는다.**[* [밀리오 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=163)] 보호막과 회복만 보고 연속 사용하지 말고 아군의 공격 동작 직전에 효과를 준다. 여러 아군에게 차례로 기술을 닿게 하면 교전 전체의 압박을 높일 수 있다.

## 초특급 불꽃 킥을 생존용으로 남긴다

**`초특급 불꽃 킥(Q)`은 처음 맞은 적을 밀어낸 뒤 떨어져 주변에 피해와 둔화를 준다.** 돌진 챔피언이 접근하는 순간 맞혀 진입을 끊고, 뒤의 적까지 폭발에 걸치게 한다. 라인 견제에 먼저 쓰면 다음 돌진을 막을 수 없으므로 상대 핵심 기술을 확인한다.

## 아늑한 모닥불과 포옹을 나눠 쓴다

**`아늑한 모닥불(W)`은 아군을 따라가며 회복과 공격 사거리를 주고, `따스한 포옹(E)`은 두 번 충전되는 보호막과 이동 속도를 준다.** 긴 교전에는 `W`, 순간 피해나 추격에는 `E`를 배분한다. 두 충전을 한 번에 쓰기보다 다음 피해까지 간격을 둔다.

## 생명의 온기는 맞기 전에 누르지 않는다

**`생명의 온기(R)`은 주변 아군을 회복하고 방해 및 이동 불가 효과를 제거하지만 공중에 뜬 상태는 해제하지 못한다.** 적 제어의 시작 동작만 보고 미리 쓰지 말고 실제 효과가 들어온 직후 사용한다. 밀리오 자신이 먼저 제어되면 쓸 수 없으므로 아군 뒤와 측면에 선다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-champion-milio-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-milio-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-mom-champion-milio-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-milio-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-milio-20260915', NULL, '분류:mom', '분류:Mom' FROM wiki_docs WHERE id = 'doc-support-mom-champion-milio-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-milio-20260915' AND target_key = '분류:mom');

-- 소나 챔피언 위키 (865자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-mom-champion-sona-20260915', 'article', '소나', '소나', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 세 번째 기본 스킬 뒤 파워 코드를 고른다 · 오라가 아군을 스치게 움직인다 · `R`은 반격을 끊는다

[[분류:서폿]] [[분류:Mom]]

## 파워 코드의 마지막 곡을 선택한다

**소나는 기본 스킬을 세 번 사용하면 다음 기본 공격이 강화되고 마지막으로 연주한 곡에 따라 추가 효과가 달라진다.**[* [소나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=59)] 피해가 필요하면 `Q`, 적의 화력을 낮추려면 `W`, 추격을 막으려면 `E`를 마지막에 사용한다. 준비된 공격을 아무 대상에게 소모하지 않는다.

## 용맹의 찬가를 안전한 거리에서 연주한다

**`용맹의 찬가(Q)`는 가까운 두 적을 공격하고 오라에 닿은 아군의 다음 공격을 강화한다.** 적 챔피언이 사거리 안에 들어오는 순간 사용하되 기본 공격 한 번을 위해 깊이 걷지 않는다. 공격하려는 아군이 오라를 스치도록 옆에서 함께 전진한다.

## 회복과 이동 오라는 여러 명에게 묻힌다

**`인내의 아리아(W)`는 소나와 다친 아군을 회복하고 오라로 보호막을 주며, `기민함의 노래(E)`는 이동 속도를 높인다.** 사용 직후 아군 사이를 지나 오라를 전달한다. 한 사람 곁에만 머물지 말고 피해를 받을 순서와 퇴로 방향을 따라 짧게 위치를 바꾼다.

## 크레센도는 적의 핵심 동작에 맞춘다

**`크레센도(R)`는 넓은 직선의 적을 기절시킨다.** 최대 인원만 노리기보다 아군에게 뛰어든 적이나 강한 정신 집중을 시작한 적을 즉시 멈춘다. 먼저 교전을 열 때는 아군이 닿을 거리인지 확인하고, 좁은 입구에서 적이 나란히 서는 순간을 기다린다.', 1, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-mom-champion-sona-20260915' OR (kind = 'article' AND title_key = '소나'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-champion-sona-20260915', id, NULL, 0, general, '서폿 Mom 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-mom-champion-sona-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 세 번째 기본 스킬 뒤 파워 코드를 고른다 · 오라가 아군을 스치게 움직인다 · `R`은 반격을 끊는다

[[분류:서폿]] [[분류:Mom]]

## 파워 코드의 마지막 곡을 선택한다

**소나는 기본 스킬을 세 번 사용하면 다음 기본 공격이 강화되고 마지막으로 연주한 곡에 따라 추가 효과가 달라진다.**[* [소나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=59)] 피해가 필요하면 `Q`, 적의 화력을 낮추려면 `W`, 추격을 막으려면 `E`를 마지막에 사용한다. 준비된 공격을 아무 대상에게 소모하지 않는다.

## 용맹의 찬가를 안전한 거리에서 연주한다

**`용맹의 찬가(Q)`는 가까운 두 적을 공격하고 오라에 닿은 아군의 다음 공격을 강화한다.** 적 챔피언이 사거리 안에 들어오는 순간 사용하되 기본 공격 한 번을 위해 깊이 걷지 않는다. 공격하려는 아군이 오라를 스치도록 옆에서 함께 전진한다.

## 회복과 이동 오라는 여러 명에게 묻힌다

**`인내의 아리아(W)`는 소나와 다친 아군을 회복하고 오라로 보호막을 주며, `기민함의 노래(E)`는 이동 속도를 높인다.** 사용 직후 아군 사이를 지나 오라를 전달한다. 한 사람 곁에만 머물지 말고 피해를 받을 순서와 퇴로 방향을 따라 짧게 위치를 바꾼다.

## 크레센도는 적의 핵심 동작에 맞춘다

**`크레센도(R)`는 넓은 직선의 적을 기절시킨다.** 최대 인원만 노리기보다 아군에게 뛰어든 적이나 강한 정신 집중을 시작한 적을 즉시 멈춘다. 먼저 교전을 열 때는 아군이 닿을 거리인지 확인하고, 좁은 입구에서 적이 나란히 서는 순간을 기다린다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-champion-sona-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-sona-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-mom-champion-sona-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-sona-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-sona-20260915', NULL, '분류:mom', '분류:Mom' FROM wiki_docs WHERE id = 'doc-support-mom-champion-sona-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-sona-20260915' AND target_key = '분류:mom');

-- 타릭 챔피언 위키 (852자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-mom-champion-taric-20260915', 'article', '타릭', '타릭', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 기본 공격으로 기술을 다시 준비한다 · 연결된 아군과 `E` 각을 겹친다 · `R`의 지연 시간을 먼저 계산한다

[[분류:서폿]] [[분류:Mom]]

## 담대함의 강화 공격을 끝까지 사용한다

**타릭은 스킬 사용 뒤 다음 기본 공격들이 빨라지고 추가 피해를 주며 기본 스킬의 재사용 시간을 줄인다.**[* [타릭 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=62)] 한 번만 치고 물러나기보다 안전한 대상에 두 공격을 이어 회복과 기절을 다시 준비한다. 챔피언이 위험하면 가까운 미니언을 활용한다.

## 수호의 고리로 두 위치에서 시전한다

**`수호의 고리(W)`로 연결된 아군에게 보호막을 주고, 타릭의 기본 스킬은 그 아군 위치에서도 함께 발동한다.** 진입하는 아군과 연결해 멀리서 `황홀한 강타(E)`를 만들거나, 후방이 위험하면 연결 대상을 바꿔 보호 범위를 옮긴다.

## 황홀한 강타의 두 선을 교차시킨다

**`황홀한 강타(E)`는 잠시 뒤 타릭과 연결된 아군 앞에서 동시에 폭발해 적을 기절시킨다.** 두 사람이 같은 방향만 보지 말고 서로 다른 각도로 움직여 피할 길을 줄인다. 상대 돌진이 예상되면 먼저 쓰지 않고 착지 지점을 향해 선을 맞춘다.

## 우주의 광휘는 피해보다 먼저 시작한다

**`우주의 광휘(R)`는 시전 후 지연 시간이 지난 뒤 타릭과 연결된 아군 주변을 무적으로 만든다.** 체력이 낮아진 다음 누르면 발동 전에 쓰러질 수 있다. 상대의 광역 진입이나 목표물 교전 시작을 보고 미리 사용하고, 발동 순간 아군이 범위 안에 모이도록 신호를 맞춘다.', 1, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-mom-champion-taric-20260915' OR (kind = 'article' AND title_key = '타릭'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-champion-taric-20260915', id, NULL, 0, general, '서폿 Mom 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-mom-champion-taric-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 기본 공격으로 기술을 다시 준비한다 · 연결된 아군과 `E` 각을 겹친다 · `R`의 지연 시간을 먼저 계산한다

[[분류:서폿]] [[분류:Mom]]

## 담대함의 강화 공격을 끝까지 사용한다

**타릭은 스킬 사용 뒤 다음 기본 공격들이 빨라지고 추가 피해를 주며 기본 스킬의 재사용 시간을 줄인다.**[* [타릭 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=62)] 한 번만 치고 물러나기보다 안전한 대상에 두 공격을 이어 회복과 기절을 다시 준비한다. 챔피언이 위험하면 가까운 미니언을 활용한다.

## 수호의 고리로 두 위치에서 시전한다

**`수호의 고리(W)`로 연결된 아군에게 보호막을 주고, 타릭의 기본 스킬은 그 아군 위치에서도 함께 발동한다.** 진입하는 아군과 연결해 멀리서 `황홀한 강타(E)`를 만들거나, 후방이 위험하면 연결 대상을 바꿔 보호 범위를 옮긴다.

## 황홀한 강타의 두 선을 교차시킨다

**`황홀한 강타(E)`는 잠시 뒤 타릭과 연결된 아군 앞에서 동시에 폭발해 적을 기절시킨다.** 두 사람이 같은 방향만 보지 말고 서로 다른 각도로 움직여 피할 길을 줄인다. 상대 돌진이 예상되면 먼저 쓰지 않고 착지 지점을 향해 선을 맞춘다.

## 우주의 광휘는 피해보다 먼저 시작한다

**`우주의 광휘(R)`는 시전 후 지연 시간이 지난 뒤 타릭과 연결된 아군 주변을 무적으로 만든다.** 체력이 낮아진 다음 누르면 발동 전에 쓰러질 수 있다. 상대의 광역 진입이나 목표물 교전 시작을 보고 미리 사용하고, 발동 순간 아군이 범위 안에 모이도록 신호를 맞춘다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-champion-taric-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-taric-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-mom-champion-taric-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-taric-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-mom-champion-taric-20260915', NULL, '분류:mom', '분류:Mom' FROM wiki_docs WHERE id = 'doc-support-mom-champion-taric-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-mom-champion-taric-20260915' AND target_key = '분류:mom');

-- lulu 상대법 (762자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-lulu', 'matchup', NULL, NULL, 'published', 'lulu', '', 0, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 픽스가 붙은 위치에서도 `Q`가 나온다 · `W`가 빠진 뒤 진입한다 · `R`의 즉시 띄우기를 계산한다

## 픽스의 위치를 함께 본다
**`반짝반짝 창(Q)`은 룰루와 픽스 두 위치에서 발사된다.**[* [룰루 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=95)] 룰루 정면만 피하지 말고 `E`가 붙은 아군이나 내 뒤쪽의 대상도 확인한다. 두 화살이 겹치는 선에서 벗어나면 둔화 뒤 추가 견제를 줄일 수 있다.

## 변덕쟁이를 먼저 빼지 못하면 진입하지 않는다
**`변덕쟁이(W)`를 적에게 쓰면 기본 공격과 스킬을 사용할 수 없는 모습으로 변한다.** 이동기를 먼저 쓰면 도착 직후 무력화된다. 짧은 압박으로 `W`를 쓰게 하거나 다른 아군에게 강화로 사용한 것을 확인한 뒤 교전을 연다.

## 보호막과 위치 노출을 구분한다
**`도와줘, 픽스!(E)`는 아군에게 보호막을 주고 적에게는 피해와 위치 노출을 준다.** 보호막 대상에게 주요 피해를 몰지 말고 지속시간을 기다린다. 적에게 픽스가 붙었다면 수풀로 숨으려 하지 말고 안전 거리까지 완전히 빠진다.

## 급성장 대상에게서 떨어진다
**`급성장(R)`은 대상의 체력을 늘리고 주변 적을 즉시 띄운 뒤 둔화한다.** 체력이 낮은 적을 마무리하려고 여러 명이 붙으면 한 번에 끊긴다. 룰루가 궁극기를 남겼다면 서로 다른 방향에서 압박하고 발동 뒤 늘어난 체력을 다시 계산한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:10:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-lulu' AND kind = 'matchup' AND champion_slug = 'lulu'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-lulu');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-matchup-lulu-20260915', id, NULL, 0, general, '서폿 Mom 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-lulu' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 픽스가 붙은 위치에서도 `Q`가 나온다 · `W`가 빠진 뒤 진입한다 · `R`의 즉시 띄우기를 계산한다

## 픽스의 위치를 함께 본다
**`반짝반짝 창(Q)`은 룰루와 픽스 두 위치에서 발사된다.**[* [룰루 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=95)] 룰루 정면만 피하지 말고 `E`가 붙은 아군이나 내 뒤쪽의 대상도 확인한다. 두 화살이 겹치는 선에서 벗어나면 둔화 뒤 추가 견제를 줄일 수 있다.

## 변덕쟁이를 먼저 빼지 못하면 진입하지 않는다
**`변덕쟁이(W)`를 적에게 쓰면 기본 공격과 스킬을 사용할 수 없는 모습으로 변한다.** 이동기를 먼저 쓰면 도착 직후 무력화된다. 짧은 압박으로 `W`를 쓰게 하거나 다른 아군에게 강화로 사용한 것을 확인한 뒤 교전을 연다.

## 보호막과 위치 노출을 구분한다
**`도와줘, 픽스!(E)`는 아군에게 보호막을 주고 적에게는 피해와 위치 노출을 준다.** 보호막 대상에게 주요 피해를 몰지 말고 지속시간을 기다린다. 적에게 픽스가 붙었다면 수풀로 숨으려 하지 말고 안전 거리까지 완전히 빠진다.

## 급성장 대상에게서 떨어진다
**`급성장(R)`은 대상의 체력을 늘리고 주변 적을 즉시 띄운 뒤 둔화한다.** 체력이 낮은 적을 마무리하려고 여러 명이 붙으면 한 번에 끊긴다. 룰루가 궁극기를 남겼다면 서로 다른 방향에서 압박하고 발동 뒤 늘어난 체력을 다시 계산한다.'
AND updated_at = '2026-09-15T10:10:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-matchup-lulu-20260915');

-- soraka 상대법 (766자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-soraka', 'matchup', NULL, NULL, 'published', 'soraka', '', 0, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — `Q` 적중을 허용해 회복 자원을 주지 않는다 · 소라카 본체를 먼저 압박한다 · `E` 침묵 구역에서 나온다

## 별부름을 옆으로 피한다
**`별부름(Q)`이 챔피언에게 맞으면 소라카가 체력을 회복하고 이동 속도를 얻으며 아군에게 회복 효과를 전달할 수 있다.**[* [소라카 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=60)] 원형 표시에서 가장 가까운 옆으로 빠지고, 막타 동작이 겹치지 않게 위치를 계속 바꾼다.

## 회복받는 아군보다 소라카의 체력을 본다
**`은하의 마력(W)`은 소라카 자신의 체력을 소모한다.** 보호받는 한 명만 계속 공격하면 소라카가 뒤에서 교환을 되돌린다. 소라카에게 접근할 길이 열리면 본체를 압박해 연속 회복을 어렵게 하고, 둘이 떨어졌을 때 교전을 건다.

## 별의 균형 안에서는 기술을 누르지 않는다
**`별의 균형(E)` 범위 안에서는 침묵당하고, 끝까지 남으면 속박된다.** 즉시 가장자리로 걸어 나온 뒤 이동기를 사용한다. 정신 집중이나 연속 기술을 시작하기 전에 소라카가 `E`를 남겼는지 확인한다.

## 기원을 포함해 마무리 피해를 계산한다
**`기원(R)`은 거리와 관계없이 소라카와 모든 아군을 회복한다.** 다른 라인에 소라카가 보여도 낮은 체력의 적이 갑자기 회복할 수 있다. 한 번의 공격만 더 맞히면 된다고 깊이 추격하지 말고, 궁극기가 빠진 뒤 다음 교전의 마무리선을 잡는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:10:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-soraka' AND kind = 'matchup' AND champion_slug = 'soraka'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-soraka');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-matchup-soraka-20260915', id, NULL, 0, general, '서폿 Mom 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-soraka' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — `Q` 적중을 허용해 회복 자원을 주지 않는다 · 소라카 본체를 먼저 압박한다 · `E` 침묵 구역에서 나온다

## 별부름을 옆으로 피한다
**`별부름(Q)`이 챔피언에게 맞으면 소라카가 체력을 회복하고 이동 속도를 얻으며 아군에게 회복 효과를 전달할 수 있다.**[* [소라카 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=60)] 원형 표시에서 가장 가까운 옆으로 빠지고, 막타 동작이 겹치지 않게 위치를 계속 바꾼다.

## 회복받는 아군보다 소라카의 체력을 본다
**`은하의 마력(W)`은 소라카 자신의 체력을 소모한다.** 보호받는 한 명만 계속 공격하면 소라카가 뒤에서 교환을 되돌린다. 소라카에게 접근할 길이 열리면 본체를 압박해 연속 회복을 어렵게 하고, 둘이 떨어졌을 때 교전을 건다.

## 별의 균형 안에서는 기술을 누르지 않는다
**`별의 균형(E)` 범위 안에서는 침묵당하고, 끝까지 남으면 속박된다.** 즉시 가장자리로 걸어 나온 뒤 이동기를 사용한다. 정신 집중이나 연속 기술을 시작하기 전에 소라카가 `E`를 남겼는지 확인한다.

## 기원을 포함해 마무리 피해를 계산한다
**`기원(R)`은 거리와 관계없이 소라카와 모든 아군을 회복한다.** 다른 라인에 소라카가 보여도 낮은 체력의 적이 갑자기 회복할 수 있다. 한 번의 공격만 더 맞히면 된다고 깊이 추격하지 말고, 궁극기가 빠진 뒤 다음 교전의 마무리선을 잡는다.'
AND updated_at = '2026-09-15T10:10:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-matchup-soraka-20260915');

-- nami 상대법 (755자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-nami', 'matchup', NULL, NULL, 'published', 'nami', '', 0, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — `Q` 착지 표시에서 옆으로 나온다 · `W`가 세 번 튈 간격을 주지 않는다 · `E`가 묻은 공격을 기다린다

## 물의 감옥은 현재 위치보다 퇴로에 떨어진다
**`물의 감옥(Q)`은 도착이 느리지만 맞으면 기절한다.**[* [나미 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=108)] 다른 둔화에 걸린 뒤 같은 방향으로 계속 빠지지 말고 옆으로 꺾는다. 나미가 가까이 걸어오면 물방울을 던질 각이므로 막타보다 이동 공간을 먼저 확보한다.

## 밀물 썰물이 튈 대상을 줄인다
**`밀물 썰물(W)`은 아군과 적을 번갈아 최대 세 번 맞힌다.** 나미의 아군과 내 아군 사이에 포개지지 않아 피해와 회복이 동시에 이어지는 배치를 막는다. 첫 파동이 누구에게 사용됐는지 보고 다음 대상에서 거리를 벌린다.

## 파도 소환사의 축복 지속시간을 흘린다
**`파도 소환사의 축복(E)`은 아군의 다음 기본 공격과 스킬에 추가 피해와 둔화를 준다.** 강화 표시가 생기면 바로 맞교환하지 말고 뒤로 물러나 사용 횟수나 시간을 소모시킨다. 첫 둔화를 맞으면 이어지는 `Q`부터 피한다.

## 해일과 같은 방향으로 달리지 않는다
**`해일(R)`은 넓은 파도로 적을 띄우고 오래 둔화한다.** 뒤로만 도망치면 파도 안에 머무는 시간이 길어진다. 가까운 옆 가장자리로 벗어나고, 좁은 입구에서는 나미 정면에 아군과 나란히 서지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:10:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-nami' AND kind = 'matchup' AND champion_slug = 'nami'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-nami');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-matchup-nami-20260915', id, NULL, 0, general, '서폿 Mom 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-nami' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — `Q` 착지 표시에서 옆으로 나온다 · `W`가 세 번 튈 간격을 주지 않는다 · `E`가 묻은 공격을 기다린다

## 물의 감옥은 현재 위치보다 퇴로에 떨어진다
**`물의 감옥(Q)`은 도착이 느리지만 맞으면 기절한다.**[* [나미 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=108)] 다른 둔화에 걸린 뒤 같은 방향으로 계속 빠지지 말고 옆으로 꺾는다. 나미가 가까이 걸어오면 물방울을 던질 각이므로 막타보다 이동 공간을 먼저 확보한다.

## 밀물 썰물이 튈 대상을 줄인다
**`밀물 썰물(W)`은 아군과 적을 번갈아 최대 세 번 맞힌다.** 나미의 아군과 내 아군 사이에 포개지지 않아 피해와 회복이 동시에 이어지는 배치를 막는다. 첫 파동이 누구에게 사용됐는지 보고 다음 대상에서 거리를 벌린다.

## 파도 소환사의 축복 지속시간을 흘린다
**`파도 소환사의 축복(E)`은 아군의 다음 기본 공격과 스킬에 추가 피해와 둔화를 준다.** 강화 표시가 생기면 바로 맞교환하지 말고 뒤로 물러나 사용 횟수나 시간을 소모시킨다. 첫 둔화를 맞으면 이어지는 `Q`부터 피한다.

## 해일과 같은 방향으로 달리지 않는다
**`해일(R)`은 넓은 파도로 적을 띄우고 오래 둔화한다.** 뒤로만 도망치면 파도 안에 머무는 시간이 길어진다. 가까운 옆 가장자리로 벗어나고, 좁은 입구에서는 나미 정면에 아군과 나란히 서지 않는다.'
AND updated_at = '2026-09-15T10:10:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-matchup-nami-20260915');

-- janna 상대법 (778자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-janna', 'matchup', NULL, NULL, 'published', 'janna', '', 0, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 시야 밖에서 충전한 `Q`를 의심한다 · 보호막이 끝난 뒤 교환한다 · `R`의 밀치기 방향을 피한다

## 울부짖는 돌풍의 출발점을 찾는다
**`울부짖는 돌풍(Q)`은 충전할수록 더 멀리 날아가고 오래 띄운다.**[* [잔나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=23)] 잔나가 수풀에 들어갔다면 보이지 않는 직선에 서지 않고 미니언 옆을 오간다. 회오리 방향이 보이면 뒤가 아니라 옆으로 움직여 경로를 벗어난다.

## 서풍을 쓴 잔나의 기동성을 압박한다
**`서풍(W)`은 적을 둔화하고 잔나의 이동을 돕는 지속 효과를 사용 중에는 잃게 만든다.** 맞은 직후 무리하게 따라가지 말고 둔화가 끝난 뒤 거리를 좁힌다. 잔나가 견제에 `W`를 썼다면 다음 돌진을 늦출 수단 하나가 빠진 상태다.

## 폭풍의 눈 위에 모든 피해를 쓰지 않는다
**`폭풍의 눈(E)`은 아군이나 포탑에 보호막과 공격력을 준다.** 보호막 대상과 정면 교환하기보다 지속시간을 기다리거나 다른 대상을 친다. 잔나가 `Q`나 `W`로 이동을 방해하면 보호막이 더 빨리 돌아올 수 있어 짧게 교환을 끝낸다.

## 계절풍 뒤로 밀릴 자리를 확인한다
**`계절풍(R)`은 주변 적을 밀어내고 정신 집중 동안 아군을 회복한다.** 잔나 뒤가 포탑이나 적 진영이면 정면으로 깊이 들어가지 않는다. 밀려난 뒤 다시 무작정 접근하지 말고, 끊을 수 있는 원거리 제어가 있다면 회복 채널을 멈춘다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:10:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-janna' AND kind = 'matchup' AND champion_slug = 'janna'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-janna');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-matchup-janna-20260915', id, NULL, 0, general, '서폿 Mom 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-janna' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 시야 밖에서 충전한 `Q`를 의심한다 · 보호막이 끝난 뒤 교환한다 · `R`의 밀치기 방향을 피한다

## 울부짖는 돌풍의 출발점을 찾는다
**`울부짖는 돌풍(Q)`은 충전할수록 더 멀리 날아가고 오래 띄운다.**[* [잔나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=23)] 잔나가 수풀에 들어갔다면 보이지 않는 직선에 서지 않고 미니언 옆을 오간다. 회오리 방향이 보이면 뒤가 아니라 옆으로 움직여 경로를 벗어난다.

## 서풍을 쓴 잔나의 기동성을 압박한다
**`서풍(W)`은 적을 둔화하고 잔나의 이동을 돕는 지속 효과를 사용 중에는 잃게 만든다.** 맞은 직후 무리하게 따라가지 말고 둔화가 끝난 뒤 거리를 좁힌다. 잔나가 견제에 `W`를 썼다면 다음 돌진을 늦출 수단 하나가 빠진 상태다.

## 폭풍의 눈 위에 모든 피해를 쓰지 않는다
**`폭풍의 눈(E)`은 아군이나 포탑에 보호막과 공격력을 준다.** 보호막 대상과 정면 교환하기보다 지속시간을 기다리거나 다른 대상을 친다. 잔나가 `Q`나 `W`로 이동을 방해하면 보호막이 더 빨리 돌아올 수 있어 짧게 교환을 끝낸다.

## 계절풍 뒤로 밀릴 자리를 확인한다
**`계절풍(R)`은 주변 적을 밀어내고 정신 집중 동안 아군을 회복한다.** 잔나 뒤가 포탑이나 적 진영이면 정면으로 깊이 들어가지 않는다. 밀려난 뒤 다시 무작정 접근하지 말고, 끊을 수 있는 원거리 제어가 있다면 회복 채널을 멈춘다.'
AND updated_at = '2026-09-15T10:10:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-matchup-janna-20260915');

-- yuumi 상대법 (782자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-yuumi', 'matchup', NULL, NULL, 'published', 'yuumi', '', 0, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 유미가 내려오는 순간 제어한다 · 조종되는 `Q`는 미니언과 급회전으로 끊는다 · 붙은 아군을 혼자 추격하지 않는다

## 유미가 몸을 드러낼 때 이동 불가 효과를 건다
**유미는 직접 챔피언을 맞히면 회복 효과를 만들 수 있지만, 이동 불가 효과를 받으면 `W` 밀착이 잠시 막힌다.**[* [유미 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=144)] 내려와 기본 공격하려는 순간 제어 기술을 사용하고, 다시 붙기 전에 피해를 집중한다.

## 사르르탄의 조종 시간을 꺾는다
**밀착 중 `사르르탄(Q)`은 잠시 방향을 조절하고 오래 날아간 뒤 맞으면 더 강한 둔화를 준다.** 미니언 뒤를 오가며 투사체 경로를 막고, 속도가 붙는 순간 반대 방향으로 짧게 꺾는다. 열린 공간에서 긴 곡선을 따라 도망치지 않는다.

## 슈우우웅 보호막이 끝난 뒤 공격한다
**`슈우우웅(E)`은 붙은 아군에게 보호막과 이동·공격 속도를 준다.** 강화 표시가 켜진 동안 모든 피해를 쓰지 말고 잠깐 거리를 둔다. 효과가 끝나면 유미 본체를 직접 노릴 수 없더라도 보호받던 아군의 빈틈을 친다.

## 대단원 파동이 아군 전체를 가르지 않게 한다
**`대단원(R)`은 여러 파동으로 적을 공격하고 아군을 회복하며 시전 중에도 유미가 움직일 수 있다.** 한 방향으로 모여 도망치지 말고 좌우로 갈라진다. 붙은 아군 하나를 끝까지 추격하면 파동 회복을 모두 허용하므로 범위에서 먼저 벗어난다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:10:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-yuumi' AND kind = 'matchup' AND champion_slug = 'yuumi'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-yuumi');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-matchup-yuumi-20260915', id, NULL, 0, general, '서폿 Mom 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-yuumi' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 유미가 내려오는 순간 제어한다 · 조종되는 `Q`는 미니언과 급회전으로 끊는다 · 붙은 아군을 혼자 추격하지 않는다

## 유미가 몸을 드러낼 때 이동 불가 효과를 건다
**유미는 직접 챔피언을 맞히면 회복 효과를 만들 수 있지만, 이동 불가 효과를 받으면 `W` 밀착이 잠시 막힌다.**[* [유미 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=144)] 내려와 기본 공격하려는 순간 제어 기술을 사용하고, 다시 붙기 전에 피해를 집중한다.

## 사르르탄의 조종 시간을 꺾는다
**밀착 중 `사르르탄(Q)`은 잠시 방향을 조절하고 오래 날아간 뒤 맞으면 더 강한 둔화를 준다.** 미니언 뒤를 오가며 투사체 경로를 막고, 속도가 붙는 순간 반대 방향으로 짧게 꺾는다. 열린 공간에서 긴 곡선을 따라 도망치지 않는다.

## 슈우우웅 보호막이 끝난 뒤 공격한다
**`슈우우웅(E)`은 붙은 아군에게 보호막과 이동·공격 속도를 준다.** 강화 표시가 켜진 동안 모든 피해를 쓰지 말고 잠깐 거리를 둔다. 효과가 끝나면 유미 본체를 직접 노릴 수 없더라도 보호받던 아군의 빈틈을 친다.

## 대단원 파동이 아군 전체를 가르지 않게 한다
**`대단원(R)`은 여러 파동으로 적을 공격하고 아군을 회복하며 시전 중에도 유미가 움직일 수 있다.** 한 방향으로 모여 도망치지 말고 좌우로 갈라진다. 붙은 아군 하나를 끝까지 추격하면 파동 회복을 모두 허용하므로 범위에서 먼저 벗어난다.'
AND updated_at = '2026-09-15T10:10:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-matchup-yuumi-20260915');

-- milio 상대법 (768자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-milio', 'matchup', NULL, NULL, 'published', 'milio', '', 0, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — `Q`를 쓴 뒤에 진입한다 · 모닥불 범위 밖으로 싸움을 옮긴다 · `R`로 풀 수 없는 띄우기를 활용한다

## 초특급 불꽃 킥을 먼저 빼낸다
**`초특급 불꽃 킥(Q)`은 처음 맞은 적을 밀어내고 뒤쪽에 떨어져 광역 둔화를 만든다.**[* [밀리오 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=163)] 정면 돌진을 바로 쓰지 말고 방향을 바꾸는 짧은 움직임으로 발사를 유도한다. `Q`가 빗나간 뒤에는 밀리오가 진입을 끊을 수단이 줄어든다.

## 아늑한 모닥불에서 걸어 나온다
**`아늑한 모닥불(W)`은 아군을 따라다니며 회복과 공격 사거리를 준다.** 그 범위 안에서 긴 피해 교환을 하지 말고 뒤로 물러나 지속시간을 흘린다. 모닥불이 끝난 뒤 사거리 우위가 사라진 순간 웨이브를 압박한다.

## 따스한 포옹의 두 충전을 센다
**`따스한 포옹(E)`은 두 번 충전되는 보호막과 이동 속도를 제공한다.** 첫 보호막이 사라졌다고 바로 모든 피해를 쓰면 두 번째 충전에 막힌다. 사용 표시를 두 번 확인하거나 서로 다른 대상에게 나뉜 뒤 핵심 대상을 공격한다.

## 생명의 온기 뒤 제어를 다시 잇는다
**`생명의 온기(R)`은 주변 아군의 방해 효과를 제거하고 회복하지만 공중에 뜬 상태는 해제하지 못한다.** 먼저 짧은 제어로 궁극기를 유도한 뒤 다음 제어를 이어 쓴다. 밀리오 본체를 먼저 묶거나 띄우면 적절한 순간에 정화하기 어렵다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:10:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-milio' AND kind = 'matchup' AND champion_slug = 'milio'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-milio');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-matchup-milio-20260915', id, NULL, 0, general, '서폿 Mom 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-milio' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — `Q`를 쓴 뒤에 진입한다 · 모닥불 범위 밖으로 싸움을 옮긴다 · `R`로 풀 수 없는 띄우기를 활용한다

## 초특급 불꽃 킥을 먼저 빼낸다
**`초특급 불꽃 킥(Q)`은 처음 맞은 적을 밀어내고 뒤쪽에 떨어져 광역 둔화를 만든다.**[* [밀리오 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=163)] 정면 돌진을 바로 쓰지 말고 방향을 바꾸는 짧은 움직임으로 발사를 유도한다. `Q`가 빗나간 뒤에는 밀리오가 진입을 끊을 수단이 줄어든다.

## 아늑한 모닥불에서 걸어 나온다
**`아늑한 모닥불(W)`은 아군을 따라다니며 회복과 공격 사거리를 준다.** 그 범위 안에서 긴 피해 교환을 하지 말고 뒤로 물러나 지속시간을 흘린다. 모닥불이 끝난 뒤 사거리 우위가 사라진 순간 웨이브를 압박한다.

## 따스한 포옹의 두 충전을 센다
**`따스한 포옹(E)`은 두 번 충전되는 보호막과 이동 속도를 제공한다.** 첫 보호막이 사라졌다고 바로 모든 피해를 쓰면 두 번째 충전에 막힌다. 사용 표시를 두 번 확인하거나 서로 다른 대상에게 나뉜 뒤 핵심 대상을 공격한다.

## 생명의 온기 뒤 제어를 다시 잇는다
**`생명의 온기(R)`은 주변 아군의 방해 효과를 제거하고 회복하지만 공중에 뜬 상태는 해제하지 못한다.** 먼저 짧은 제어로 궁극기를 유도한 뒤 다음 제어를 이어 쓴다. 밀리오 본체를 먼저 묶거나 띄우면 적절한 순간에 정화하기 어렵다.'
AND updated_at = '2026-09-15T10:10:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-matchup-milio-20260915');

-- sona 상대법 (779자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-sona', 'matchup', NULL, NULL, 'published', 'sona', '', 0, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 세 번째 기본 스킬 뒤 강화 공격을 본다 · 오라가 여러 아군에게 닿지 않게 흩어진다 · `R` 직선에서 벗어난다

## 파워 코드의 색과 효과를 읽는다
**소나는 기본 스킬을 세 번 쓰면 다음 기본 공격이 강화되고 마지막 곡에 따라 효과가 달라진다.**[* [소나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=59)] 강화 공격이 준비되면 사거리 안 막타를 잠시 양보한다. 특히 `W` 뒤 공격은 내가 주는 피해를 낮추고 `E` 뒤 공격은 크게 둔화하므로 먼저 소모하게 한다.

## 용맹의 찬가가 두 대상을 잡지 못하게 한다
**`용맹의 찬가(Q)`는 가까운 두 적을 공격하고 주변 아군의 다음 공격을 강화한다.** 원거리 딜러와 붙어 동시에 맞지 말고 서로 다른 방향으로 선다. 소나가 공격 오라를 묻히러 앞으로 걸어오면 짧게 본체를 압박한다.

## 인내의 아리아와 긴 교환을 하지 않는다
**`인내의 아리아(W)`는 소나와 다친 아군을 회복하고 오라에 닿은 아군에게 보호막을 준다.** 작은 피해를 여러 번 나누면 계속 회복할 시간을 준다. 보호막이 끝난 순간 짧게 집중하고, 소나와 아군이 떨어졌을 때 교전을 연다.

## 크레센도의 정면 폭을 비운다
**`크레센도(R)`는 긴 직선의 적을 기절시킨다.** 좁은 입구에서 아군과 나란히 서지 않고 대각선 간격을 둔다. 소나가 앞으로 걸어오는 것은 여러 명을 맞힐 각을 찾는 신호일 수 있으므로 측면으로 이동한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:10:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-sona' AND kind = 'matchup' AND champion_slug = 'sona'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-sona');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-matchup-sona-20260915', id, NULL, 0, general, '서폿 Mom 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-sona' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 세 번째 기본 스킬 뒤 강화 공격을 본다 · 오라가 여러 아군에게 닿지 않게 흩어진다 · `R` 직선에서 벗어난다

## 파워 코드의 색과 효과를 읽는다
**소나는 기본 스킬을 세 번 쓰면 다음 기본 공격이 강화되고 마지막 곡에 따라 효과가 달라진다.**[* [소나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=59)] 강화 공격이 준비되면 사거리 안 막타를 잠시 양보한다. 특히 `W` 뒤 공격은 내가 주는 피해를 낮추고 `E` 뒤 공격은 크게 둔화하므로 먼저 소모하게 한다.

## 용맹의 찬가가 두 대상을 잡지 못하게 한다
**`용맹의 찬가(Q)`는 가까운 두 적을 공격하고 주변 아군의 다음 공격을 강화한다.** 원거리 딜러와 붙어 동시에 맞지 말고 서로 다른 방향으로 선다. 소나가 공격 오라를 묻히러 앞으로 걸어오면 짧게 본체를 압박한다.

## 인내의 아리아와 긴 교환을 하지 않는다
**`인내의 아리아(W)`는 소나와 다친 아군을 회복하고 오라에 닿은 아군에게 보호막을 준다.** 작은 피해를 여러 번 나누면 계속 회복할 시간을 준다. 보호막이 끝난 순간 짧게 집중하고, 소나와 아군이 떨어졌을 때 교전을 연다.

## 크레센도의 정면 폭을 비운다
**`크레센도(R)`는 긴 직선의 적을 기절시킨다.** 좁은 입구에서 아군과 나란히 서지 않고 대각선 간격을 둔다. 소나가 앞으로 걸어오는 것은 여러 명을 맞힐 각을 찾는 신호일 수 있으므로 측면으로 이동한다.'
AND updated_at = '2026-09-15T10:10:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-matchup-sona-20260915');

-- taric 상대법 (777자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-taric', 'matchup', NULL, NULL, 'published', 'taric', '', 0, '16.17.1', 'guarded', '2026-09-15T10:10:00.000Z', '2026-09-15T10:10:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 강화 기본 공격을 허용하지 않는다 · 연결된 아군 쪽 `E`도 피한다 · `R` 발동 전 싸움에서 빠진다

## 담대함의 연속 공격을 끊는다
**타릭은 스킬 사용 뒤 강화 기본 공격으로 기본 스킬의 재사용 시간을 줄인다.**[* [타릭 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=62)] 가까운 챔피언과 미니언을 계속 치게 두면 회복과 기절이 빠르게 돌아온다. 스킬을 사용한 타릭에게서 잠깐 거리를 벌여 공격 대상을 주지 않는다.

## 수호의 고리 반대편까지 확인한다
**타릭의 기본 스킬은 `수호의 고리(W)`로 연결된 아군 위치에서도 함께 시전된다.** 타릭 본체의 각만 피하다가 진입한 아군 쪽 기절에 맞지 않도록 두 사람 사이에서 벗어난다. 연결선이 바뀌면 새 대상의 앞 방향을 즉시 본다.

## 황홀한 강타의 선과 직각으로 움직인다
**`황홀한 강타(E)`는 잠시 충전한 뒤 타릭과 연결된 아군 앞에서 적을 기절시킨다.** 뒤로만 달리면 선 안에 오래 남으므로 옆으로 빠진다. 타릭이 이동 방향을 맞출 수 있어 너무 일찍 한쪽으로 고정하지 말고 마지막에 꺾는다.

## 우주의 광휘 발동 전에 결정을 끝낸다
**`우주의 광휘(R)`는 지연 시간 뒤 타릭과 연결된 아군 주변을 무적으로 만든다.** 표시가 생기면 무적이 되기 전에 확실히 마무리할 수 있는 경우만 공격을 이어간다. 어렵다면 즉시 빠져 발동 시간을 흘리고, 무적이 끝난 다음 기술을 사용한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:10:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-taric' AND kind = 'matchup' AND champion_slug = 'taric'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-taric');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-mom-matchup-taric-20260915', id, NULL, 0, general, '서폿 Mom 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:10:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-taric' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 강화 기본 공격을 허용하지 않는다 · 연결된 아군 쪽 `E`도 피한다 · `R` 발동 전 싸움에서 빠진다

## 담대함의 연속 공격을 끊는다
**타릭은 스킬 사용 뒤 강화 기본 공격으로 기본 스킬의 재사용 시간을 줄인다.**[* [타릭 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=62)] 가까운 챔피언과 미니언을 계속 치게 두면 회복과 기절이 빠르게 돌아온다. 스킬을 사용한 타릭에게서 잠깐 거리를 벌여 공격 대상을 주지 않는다.

## 수호의 고리 반대편까지 확인한다
**타릭의 기본 스킬은 `수호의 고리(W)`로 연결된 아군 위치에서도 함께 시전된다.** 타릭 본체의 각만 피하다가 진입한 아군 쪽 기절에 맞지 않도록 두 사람 사이에서 벗어난다. 연결선이 바뀌면 새 대상의 앞 방향을 즉시 본다.

## 황홀한 강타의 선과 직각으로 움직인다
**`황홀한 강타(E)`는 잠시 충전한 뒤 타릭과 연결된 아군 앞에서 적을 기절시킨다.** 뒤로만 달리면 선 안에 오래 남으므로 옆으로 빠진다. 타릭이 이동 방향을 맞출 수 있어 너무 일찍 한쪽으로 고정하지 말고 마지막에 꺾는다.

## 우주의 광휘 발동 전에 결정을 끝낸다
**`우주의 광휘(R)`는 지연 시간 뒤 타릭과 연결된 아군 주변을 무적으로 만든다.** 표시가 생기면 무적이 되기 전에 확실히 마무리할 수 있는 경우만 공격을 이어간다. 어렵다면 즉시 빠져 발동 시간을 흘리고, 무적이 끝난 다음 기술을 사용한다.'
AND updated_at = '2026-09-15T10:10:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-mom-matchup-taric-20260915');
