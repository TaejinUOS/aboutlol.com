-- scripts/seed-adc-wiki.ts가 생성. 원딜 일반 위키 22개와 공통 상대법 23개.
-- 기존 공유 문서와 사용자 편집은 덮어쓰지 않으며 같은 SQL을 다시 실행해도 이력이 늘지 않는다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)
VALUES ('user-system', 'system', 'seed', '깨남.COM', NULL, 'admin', '2026-09-15T09:00:00.000Z');

-- 케이틀린 챔피언 위키 (702자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-caitlyn-20260915', 'article', '케이틀린', '케이틀린', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 긴 사거리로 막타 순간을 친다 · 덫은 제어가 끝날 자리에 둔다 · 투망은 퇴로를 남기며 쓴다
[[분류:원딜]]

## 사거리 우위를 웨이브 압박으로 바꾼다
**케이틀린은 상대가 막타를 치는 순간 기본 공격을 넣고 바로 미니언 뒤로 돌아오는 짧은 압박이 강하다.**[* [케이틀린 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=9)] 한 대를 더 치려고 미니언 사이로 들어가기보다 사거리 끝을 유지해 다음 막타도 불편하게 만든다.

## `Q`는 첫 대상 앞에서 쏜다
**`필트오버 피스메이커(Q)`는 첫 대상을 지난 뒤 피해가 줄어든다.** 챔피언과 미니언을 함께 맞힐 때는 챔피언이 먼저 닿는 각을 고르고, 정면이 막혔다면 무리하게 쓰지 않고 웨이브 정리에만 쓴다.

## 덫은 움직임이 이미 제한된 곳에 둔다
**`요들잡이 덫(W)`은 아군 제어가 끝날 자리, 좁은 입구, 포탑 가장자리에서 확실해진다.** 상대 발밑에 즉흥적으로 놓기보다 도망칠 방향을 하나씩 지워 헤드샷 기회를 만든다.

## `E`는 공격과 생존 중 하나를 정한다
**`90구경 투망(E)`의 반동은 벽을 넘거나 거리를 다시 벌리는 핵심 수단이다.** 공격적으로 헤드샷을 만들었다면 적 정글 위치를 알고 있어야 하며, 정보가 없으면 돌진 대응용으로 남긴다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-caitlyn-20260915' OR (kind = 'article' AND title_key = '케이틀린'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-caitlyn-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-caitlyn-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 긴 사거리로 막타 순간을 친다 · 덫은 제어가 끝날 자리에 둔다 · 투망은 퇴로를 남기며 쓴다
[[분류:원딜]]

## 사거리 우위를 웨이브 압박으로 바꾼다
**케이틀린은 상대가 막타를 치는 순간 기본 공격을 넣고 바로 미니언 뒤로 돌아오는 짧은 압박이 강하다.**[* [케이틀린 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=9)] 한 대를 더 치려고 미니언 사이로 들어가기보다 사거리 끝을 유지해 다음 막타도 불편하게 만든다.

## `Q`는 첫 대상 앞에서 쏜다
**`필트오버 피스메이커(Q)`는 첫 대상을 지난 뒤 피해가 줄어든다.** 챔피언과 미니언을 함께 맞힐 때는 챔피언이 먼저 닿는 각을 고르고, 정면이 막혔다면 무리하게 쓰지 않고 웨이브 정리에만 쓴다.

## 덫은 움직임이 이미 제한된 곳에 둔다
**`요들잡이 덫(W)`은 아군 제어가 끝날 자리, 좁은 입구, 포탑 가장자리에서 확실해진다.** 상대 발밑에 즉흥적으로 놓기보다 도망칠 방향을 하나씩 지워 헤드샷 기회를 만든다.

## `E`는 공격과 생존 중 하나를 정한다
**`90구경 투망(E)`의 반동은 벽을 넘거나 거리를 다시 벌리는 핵심 수단이다.** 공격적으로 헤드샷을 만들었다면 적 정글 위치를 알고 있어야 하며, 정보가 없으면 돌진 대응용으로 남긴다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-caitlyn-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-caitlyn-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-caitlyn-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-caitlyn-20260915' AND target_key = '분류:원딜');

-- 징크스 챔피언 위키 (672자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-jinx-20260915', 'article', '징크스', '징크스', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 미니건과 로켓의 목적을 나눈다 · 지뢰로 진입로를 닫는다 · 첫 처치 관여 뒤 전진한다
[[분류:원딜]]

## 무기는 거리와 대상 수로 고른다
**`휘릭휘릭!(Q)`의 미니건은 한 대상을 오래 칠 때, 로켓은 멀리서 여러 대상을 함께 칠 때 강하다.**[* [징크스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=116)] 로켓을 계속 쓰며 자원을 잃지 말고 상대가 사거리 밖에 있거나 뭉친 순간에만 바꾼다.

## 미니건 중첩은 안전한 대상에서 준비한다
**미니언이나 앞라인을 치며 공격 속도를 올린 뒤 챔피언으로 대상을 바꾸면 첫 교환부터 빠르게 공격할 수 있다.** 준비하려고 앞으로 나가면 안 되므로 아군 진형 안에서 칠 대상을 찾는다.

## `E`는 맞히는 기술보다 벽이다
**`와작와작 뻥!(E)`을 적의 이동기 착지점이나 좁은 입구에 놓으면 진입을 멈출 수 있다.** 이미 붙은 적 발밑보다 내가 빠질 방향과 적 사이에 가로로 깔아 시간을 번다.

## 흥분은 첫 발동을 기다린다
**처치 관여나 구조물 파괴로 신난다가 켜지기 전에는 이동기가 없는 원거리 딜러다.** 첫 발동 전에는 안전한 대상부터 공격하고, 이동 속도가 오른 뒤에야 다음 적과의 거리를 좁힌다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-jinx-20260915' OR (kind = 'article' AND title_key = '징크스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-jinx-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-jinx-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 미니건과 로켓의 목적을 나눈다 · 지뢰로 진입로를 닫는다 · 첫 처치 관여 뒤 전진한다
[[분류:원딜]]

## 무기는 거리와 대상 수로 고른다
**`휘릭휘릭!(Q)`의 미니건은 한 대상을 오래 칠 때, 로켓은 멀리서 여러 대상을 함께 칠 때 강하다.**[* [징크스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=116)] 로켓을 계속 쓰며 자원을 잃지 말고 상대가 사거리 밖에 있거나 뭉친 순간에만 바꾼다.

## 미니건 중첩은 안전한 대상에서 준비한다
**미니언이나 앞라인을 치며 공격 속도를 올린 뒤 챔피언으로 대상을 바꾸면 첫 교환부터 빠르게 공격할 수 있다.** 준비하려고 앞으로 나가면 안 되므로 아군 진형 안에서 칠 대상을 찾는다.

## `E`는 맞히는 기술보다 벽이다
**`와작와작 뻥!(E)`을 적의 이동기 착지점이나 좁은 입구에 놓으면 진입을 멈출 수 있다.** 이미 붙은 적 발밑보다 내가 빠질 방향과 적 사이에 가로로 깔아 시간을 번다.

## 흥분은 첫 발동을 기다린다
**처치 관여나 구조물 파괴로 신난다가 켜지기 전에는 이동기가 없는 원거리 딜러다.** 첫 발동 전에는 안전한 대상부터 공격하고, 이동 속도가 오른 뒤에야 다음 적과의 거리를 좁힌다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-jinx-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-jinx-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-jinx-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-jinx-20260915' AND target_key = '분류:원딜');

-- 이즈리얼 챔피언 위키 (685자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-ezreal-20260915', 'article', '이즈리얼', '이즈리얼', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — `Q`를 맞혀 기술 시간을 당긴다 · `W` 표식을 확실히 터뜨린다 · `E`는 마지막 탈출 수단이다
[[분류:원딜]]

## `Q` 적중이 모든 기술의 박자를 바꾼다
**`신비한 화살(Q)`이 적중하면 다른 기술의 재사용 대기시간도 줄어든다.**[* [이즈리얼 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=15)] 챔피언만 노리다 계속 빗나가기보다 안전한 미니언이나 앞라인에 맞혀 다음 회전을 앞당긴다.

## 평타 사거리에서도 싸운다
**기술만 던지고 물러나면 공격할 수 있는 시간을 스스로 버린다.** 상대의 위협 기술이 빠졌다면 미니언 사이에서 기본 공격을 섞고, 다시 위험해질 때 `Q` 사거리로 돌아간다.

## `W`는 터뜨릴 수 있을 때 붙인다
**`정수의 흐름(W)` 표식은 기본 공격이나 다른 기술로 공격해야 폭발한다.** 벽이나 미니언 때문에 후속 공격이 막힌다면 먼저 쓰지 않고, 포탑이나 챔피언에 확실히 연결될 때 사용한다.

## `E`를 앞 이동으로 쓸 조건을 엄격히 둔다
**`비전 이동(E)`은 순간적으로 위치를 바꾸지만 사용 뒤 긴 공백이 생긴다.** 상대의 핵심 제어와 진입기가 모두 빠지고 처치가 확실할 때만 앞으로 쓰며, 그 외에는 측면 공격을 피하는 데 남긴다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-ezreal-20260915' OR (kind = 'article' AND title_key = '이즈리얼'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-ezreal-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-ezreal-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — `Q`를 맞혀 기술 시간을 당긴다 · `W` 표식을 확실히 터뜨린다 · `E`는 마지막 탈출 수단이다
[[분류:원딜]]

## `Q` 적중이 모든 기술의 박자를 바꾼다
**`신비한 화살(Q)`이 적중하면 다른 기술의 재사용 대기시간도 줄어든다.**[* [이즈리얼 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=15)] 챔피언만 노리다 계속 빗나가기보다 안전한 미니언이나 앞라인에 맞혀 다음 회전을 앞당긴다.

## 평타 사거리에서도 싸운다
**기술만 던지고 물러나면 공격할 수 있는 시간을 스스로 버린다.** 상대의 위협 기술이 빠졌다면 미니언 사이에서 기본 공격을 섞고, 다시 위험해질 때 `Q` 사거리로 돌아간다.

## `W`는 터뜨릴 수 있을 때 붙인다
**`정수의 흐름(W)` 표식은 기본 공격이나 다른 기술로 공격해야 폭발한다.** 벽이나 미니언 때문에 후속 공격이 막힌다면 먼저 쓰지 않고, 포탑이나 챔피언에 확실히 연결될 때 사용한다.

## `E`를 앞 이동으로 쓸 조건을 엄격히 둔다
**`비전 이동(E)`은 순간적으로 위치를 바꾸지만 사용 뒤 긴 공백이 생긴다.** 상대의 핵심 제어와 진입기가 모두 빠지고 처치가 확실할 때만 앞으로 쓰며, 그 외에는 측면 공격을 피하는 데 남긴다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-ezreal-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-ezreal-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-ezreal-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-ezreal-20260915' AND target_key = '분류:원딜');

-- 진 챔피언 위키 (664자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-jhin-20260915', 'article', '진', '진', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 네 번째 탄환을 막타와 견제에 맞춘다 · 표식 뒤 `W`를 잇는다 · 재장전 시간에는 거리를 둔다
[[분류:원딜]]

## 네 번째 탄환을 쓰기 전에 대상을 정한다
**진은 네 발을 쏜 뒤 재장전하며 네 번째 탄환이 가장 강하다.**[* [진 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=129)] 강한 탄환을 체력이 충분한 미니언에 낭비하지 말고 막타나 챔피언 견제 중 더 큰 이득을 고른다.

## `Q`의 처치 연쇄를 웨이브에서 만든다
**`춤추는 유탄(Q)`은 앞 대상을 처치할수록 다음 대상 피해가 커진다.** 낮은 체력 미니언을 첫 대상으로 골라 상대 챔피언까지 튀는 경로를 만들고, 경로가 없으면 막타 확보에만 쓴다.

## 표식이 생긴 뒤 `W`를 쏜다
**`살상연희(W)`는 최근 피해를 입은 챔피언을 맞혀야 속박한다.** 아군의 공격이나 `E`가 닿은 것을 확인하고 발사하며, 미니언은 관통해도 첫 챔피언에서 멈춘다는 점을 본다.

## 재장전 시간에는 공격보다 자리 이동을 한다
**탄환이 없는 동안에는 기본 공격으로 위협할 수 없다.** 앞서 얻은 이동 속도로 아군 뒤나 다음 사격 각으로 이동하고, 쫓아가다 상대의 진입 거리에 남지 않는다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-jhin-20260915' OR (kind = 'article' AND title_key = '진'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-jhin-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-jhin-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 네 번째 탄환을 막타와 견제에 맞춘다 · 표식 뒤 `W`를 잇는다 · 재장전 시간에는 거리를 둔다
[[분류:원딜]]

## 네 번째 탄환을 쓰기 전에 대상을 정한다
**진은 네 발을 쏜 뒤 재장전하며 네 번째 탄환이 가장 강하다.**[* [진 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=129)] 강한 탄환을 체력이 충분한 미니언에 낭비하지 말고 막타나 챔피언 견제 중 더 큰 이득을 고른다.

## `Q`의 처치 연쇄를 웨이브에서 만든다
**`춤추는 유탄(Q)`은 앞 대상을 처치할수록 다음 대상 피해가 커진다.** 낮은 체력 미니언을 첫 대상으로 골라 상대 챔피언까지 튀는 경로를 만들고, 경로가 없으면 막타 확보에만 쓴다.

## 표식이 생긴 뒤 `W`를 쏜다
**`살상연희(W)`는 최근 피해를 입은 챔피언을 맞혀야 속박한다.** 아군의 공격이나 `E`가 닿은 것을 확인하고 발사하며, 미니언은 관통해도 첫 챔피언에서 멈춘다는 점을 본다.

## 재장전 시간에는 공격보다 자리 이동을 한다
**탄환이 없는 동안에는 기본 공격으로 위협할 수 없다.** 앞서 얻은 이동 속도로 아군 뒤나 다음 사격 각으로 이동하고, 쫓아가다 상대의 진입 거리에 남지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-jhin-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-jhin-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-jhin-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-jhin-20260915' AND target_key = '분류:원딜');

-- 자야 챔피언 위키 (676자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-xayah-20260915', 'article', '자야', '자야', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 깃털을 상대 뒤에 쌓는다 · 세 장의 회수 선을 만든다 · 궁극기는 회피 뒤 깃털까지 본다
[[분류:원딜]]

## 기본 공격마다 깃털의 종착점을 본다
**자야의 공격과 `깃털 연타(Q)`는 적을 지나 뒤쪽에 깃털을 남긴다.**[* [자야 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=136)] 상대와 깃털 사이에 내가 놓이는 구도를 만들고, 같은 선에 세 장 이상 쌓일 때 회수할 준비를 한다.

## `E`는 피해보다 속박 각을 우선한다
**`깃부르미(E)`는 여러 깃털이 한 대상을 지나면 속박한다.** 한두 장으로 약한 피해만 넣기보다 상대가 막타를 치거나 좁은 길에 들어올 때까지 기다려 움직임을 묶는다.

## `W` 중에는 공격할 수 있는 거리만 따라간다
**`죽음의 깃(W)`은 공격 속도와 피해를 높이고 챔피언을 치면 이동 속도도 준다.** 첫 공격이 닿지 않는다면 앞으로 무리하지 않고, 앞라인을 치며 속도를 얻은 뒤 위치를 바꾼다.

## 궁극기 뒤의 회수 선을 즉시 만든다
**`저항의 비상(R)`은 잠시 대상으로 지정되지 않게 하며 여러 깃털을 남긴다.** 큰 공격을 피하는 데 사용한 뒤 착지 위치를 옆으로 조정해 새 깃털과 기존 깃털이 적을 가로지르게 한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-xayah-20260915' OR (kind = 'article' AND title_key = '자야'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-xayah-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-xayah-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 깃털을 상대 뒤에 쌓는다 · 세 장의 회수 선을 만든다 · 궁극기는 회피 뒤 깃털까지 본다
[[분류:원딜]]

## 기본 공격마다 깃털의 종착점을 본다
**자야의 공격과 `깃털 연타(Q)`는 적을 지나 뒤쪽에 깃털을 남긴다.**[* [자야 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=136)] 상대와 깃털 사이에 내가 놓이는 구도를 만들고, 같은 선에 세 장 이상 쌓일 때 회수할 준비를 한다.

## `E`는 피해보다 속박 각을 우선한다
**`깃부르미(E)`는 여러 깃털이 한 대상을 지나면 속박한다.** 한두 장으로 약한 피해만 넣기보다 상대가 막타를 치거나 좁은 길에 들어올 때까지 기다려 움직임을 묶는다.

## `W` 중에는 공격할 수 있는 거리만 따라간다
**`죽음의 깃(W)`은 공격 속도와 피해를 높이고 챔피언을 치면 이동 속도도 준다.** 첫 공격이 닿지 않는다면 앞으로 무리하지 않고, 앞라인을 치며 속도를 얻은 뒤 위치를 바꾼다.

## 궁극기 뒤의 회수 선을 즉시 만든다
**`저항의 비상(R)`은 잠시 대상으로 지정되지 않게 하며 여러 깃털을 남긴다.** 큰 공격을 피하는 데 사용한 뒤 착지 위치를 옆으로 조정해 새 깃털과 기존 깃털이 적을 가로지르게 한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-xayah-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-xayah-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-xayah-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-xayah-20260915' AND target_key = '분류:원딜');

-- 미스 포츈 챔피언 위키 (685자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-missfortune-20260915', 'article', '미스 포츈', '미스포츈', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 대상을 바꿔 추가 피해를 반복한다 · `Q` 두 번째 탄환의 선을 만든다 · 궁극기 전에 이동을 묶는다
[[분류:원딜]]

## 같은 대상을 계속 치기 전에 옆 대상을 본다
**미스 포츈은 새로운 대상을 공격할 때 추가 피해를 준다.**[* [미스 포츈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=40)] 두 미니언 사이를 번갈아 치며 막타를 준비하고, 챔피언이 사거리에 들어오면 한 번 바꿔 친 뒤 안전하게 돌아온다.

## `Q`의 첫 대상 뒤를 겨눈다
**`한 발에 두 놈(Q)`은 첫 대상을 맞힌 뒤 뒤쪽 적에게 튄다.** 낮은 체력 미니언과 상대가 한 선에 놓일 때 사용해 두 번째 탄환을 위협하고, 각이 없으면 막타에만 소비한다.

## 활보를 지키려 먼저 맞지 않는다
**`활보(W)`의 이동 속도는 피해를 받지 않을 때 유지된다.** 교전 전 불필요한 견제를 맞지 않고 빠르게 자리를 잡으며, 공격을 시작할 순간에 활성화해 공격 속도를 활용한다.

## 궁극기 채널을 보호받을 각에서 연다
**`쌍권총 난사(R)`는 정면 넓은 범위를 오래 공격하지만 이동하면 끊긴다.** 아군 제어가 적중하거나 좁은 입구가 닫힌 뒤 사용하고, 적의 방해 기술이 남았다면 너무 가까이서 시작하지 않는다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-missfortune-20260915' OR (kind = 'article' AND title_key = '미스포츈'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-missfortune-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-missfortune-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 대상을 바꿔 추가 피해를 반복한다 · `Q` 두 번째 탄환의 선을 만든다 · 궁극기 전에 이동을 묶는다
[[분류:원딜]]

## 같은 대상을 계속 치기 전에 옆 대상을 본다
**미스 포츈은 새로운 대상을 공격할 때 추가 피해를 준다.**[* [미스 포츈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=40)] 두 미니언 사이를 번갈아 치며 막타를 준비하고, 챔피언이 사거리에 들어오면 한 번 바꿔 친 뒤 안전하게 돌아온다.

## `Q`의 첫 대상 뒤를 겨눈다
**`한 발에 두 놈(Q)`은 첫 대상을 맞힌 뒤 뒤쪽 적에게 튄다.** 낮은 체력 미니언과 상대가 한 선에 놓일 때 사용해 두 번째 탄환을 위협하고, 각이 없으면 막타에만 소비한다.

## 활보를 지키려 먼저 맞지 않는다
**`활보(W)`의 이동 속도는 피해를 받지 않을 때 유지된다.** 교전 전 불필요한 견제를 맞지 않고 빠르게 자리를 잡으며, 공격을 시작할 순간에 활성화해 공격 속도를 활용한다.

## 궁극기 채널을 보호받을 각에서 연다
**`쌍권총 난사(R)`는 정면 넓은 범위를 오래 공격하지만 이동하면 끊긴다.** 아군 제어가 적중하거나 좁은 입구가 닫힌 뒤 사용하고, 적의 방해 기술이 남았다면 너무 가까이서 시작하지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-missfortune-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-missfortune-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-missfortune-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-missfortune-20260915' AND target_key = '분류:원딜');

-- 애쉬 챔피언 위키 (663자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-ashe-20260915', 'article', '애쉬', '애쉬', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 둔화로 거리를 계속 유지한다 · `Q` 중첩 뒤 싸움을 연다 · 매로 보지 못한 길을 확인한다
[[분류:원딜]]

## 첫 공격 뒤 같은 거리를 유지한다
**애쉬의 공격은 대상을 둔화하므로 한 번 닿은 뒤 일정한 간격에서 계속 공격하기 좋다.**[* [애쉬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=6)] 무조건 앞으로 걷기보다 상대가 다가오면 뒤로, 도망가면 옆으로 따라가며 사거리 끝을 유지한다.

## `Q`는 중첩을 만든 뒤 켠다
**`궁사의 집중(Q)`은 공격으로 집중을 쌓아야 사용할 수 있다.** 미니언이나 앞라인을 치며 준비하고, 상대가 이동기를 쓴 뒤 활성화해 강화된 공격 시간을 낭비하지 않는다.

## `W`의 화살이 한 대상에 겹치지 않는 점을 본다
**`일제 사격(W)`은 넓게 퍼져 첫 대상들을 맞히고 둔화를 건다.** 미니언이 정면을 막으면 챔피언에게 닿지 않으므로 웨이브 옆이나 빈 통로에서 사용한다.

## `E`로 교전 전 정보를 산다
**`매 날리기(E)`는 맵 먼 곳의 시야를 확인하는 전투 준비 기술이다.** 목표물 반대편과 측면 수풀을 먼저 밝혀 뒤를 노리는 적을 찾고, 확인한 정보에 맞춰 궁극기 발사 방향을 정한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-ashe-20260915' OR (kind = 'article' AND title_key = '애쉬'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-ashe-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-ashe-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 둔화로 거리를 계속 유지한다 · `Q` 중첩 뒤 싸움을 연다 · 매로 보지 못한 길을 확인한다
[[분류:원딜]]

## 첫 공격 뒤 같은 거리를 유지한다
**애쉬의 공격은 대상을 둔화하므로 한 번 닿은 뒤 일정한 간격에서 계속 공격하기 좋다.**[* [애쉬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=6)] 무조건 앞으로 걷기보다 상대가 다가오면 뒤로, 도망가면 옆으로 따라가며 사거리 끝을 유지한다.

## `Q`는 중첩을 만든 뒤 켠다
**`궁사의 집중(Q)`은 공격으로 집중을 쌓아야 사용할 수 있다.** 미니언이나 앞라인을 치며 준비하고, 상대가 이동기를 쓴 뒤 활성화해 강화된 공격 시간을 낭비하지 않는다.

## `W`의 화살이 한 대상에 겹치지 않는 점을 본다
**`일제 사격(W)`은 넓게 퍼져 첫 대상들을 맞히고 둔화를 건다.** 미니언이 정면을 막으면 챔피언에게 닿지 않으므로 웨이브 옆이나 빈 통로에서 사용한다.

## `E`로 교전 전 정보를 산다
**`매 날리기(E)`는 맵 먼 곳의 시야를 확인하는 전투 준비 기술이다.** 목표물 반대편과 측면 수풀을 먼저 밝혀 뒤를 노리는 적을 찾고, 확인한 정보에 맞춰 궁극기 발사 방향을 정한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-ashe-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-ashe-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-ashe-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-ashe-20260915' AND target_key = '분류:원딜');

-- 바루스 챔피언 위키 (644자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-varus-20260915', 'article', '바루스', '바루스', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 기본 공격으로 역병을 쌓는다 · 기술로 중첩을 터뜨린다 · 사슬은 퍼질 공간까지 본다
[[분류:원딜]]

## 역병을 쌓고 기술로 마무리한다
**바루스의 기본 공격은 역병을 남기고 다른 기술이 적중하면 중첩을 폭발시킨다.**[* [바루스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=97)] 기술부터 모두 쓰지 말고 안전한 기본 공격을 몇 차례 넣은 뒤 `Q`나 `E`로 터뜨린다.

## `Q` 충전은 시야와 거리로 보호한다
**`꿰뚫는 화살(Q)`은 오래 조준할수록 사거리와 피해가 늘지만 이동이 읽힌다.** 수풀이나 아군 뒤에서 충전하고, 상대가 옆으로 피할 공간이 적을 때 발사한다.

## `E`를 회복과 퇴로 위에 둔다
**`퍼붓는 화살(E)`의 지면은 적을 늦추고 회복을 줄인다.** 단순 피해보다 앞으로 들어오는 적의 발밑이나 도망칠 길에 깔아 다음 기본 공격과 `Q`를 연결한다.

## 궁극기는 첫 대상 뒤의 간격을 본다
**`부패의 사슬(R)`은 첫 챔피언을 묶고 가까운 다른 적에게 퍼진다.** 한 명만 맞히는 것보다 적이 좁게 모인 순간을 노리되, 발사 전 내 퇴로가 없는 위치로 깊게 들어가지는 않는다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-varus-20260915' OR (kind = 'article' AND title_key = '바루스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-varus-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-varus-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 기본 공격으로 역병을 쌓는다 · 기술로 중첩을 터뜨린다 · 사슬은 퍼질 공간까지 본다
[[분류:원딜]]

## 역병을 쌓고 기술로 마무리한다
**바루스의 기본 공격은 역병을 남기고 다른 기술이 적중하면 중첩을 폭발시킨다.**[* [바루스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=97)] 기술부터 모두 쓰지 말고 안전한 기본 공격을 몇 차례 넣은 뒤 `Q`나 `E`로 터뜨린다.

## `Q` 충전은 시야와 거리로 보호한다
**`꿰뚫는 화살(Q)`은 오래 조준할수록 사거리와 피해가 늘지만 이동이 읽힌다.** 수풀이나 아군 뒤에서 충전하고, 상대가 옆으로 피할 공간이 적을 때 발사한다.

## `E`를 회복과 퇴로 위에 둔다
**`퍼붓는 화살(E)`의 지면은 적을 늦추고 회복을 줄인다.** 단순 피해보다 앞으로 들어오는 적의 발밑이나 도망칠 길에 깔아 다음 기본 공격과 `Q`를 연결한다.

## 궁극기는 첫 대상 뒤의 간격을 본다
**`부패의 사슬(R)`은 첫 챔피언을 묶고 가까운 다른 적에게 퍼진다.** 한 명만 맞히는 것보다 적이 좁게 모인 순간을 노리되, 발사 전 내 퇴로가 없는 위치로 깊게 들어가지는 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-varus-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-varus-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-varus-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-varus-20260915' AND target_key = '분류:원딜');

-- 카이사 챔피언 위키 (659자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-kaisa-20260915', 'article', '카이사', '카이사', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 고립된 대상에게 `Q`를 집중한다 · 플라즈마를 쌓고 터뜨린다 · 궁극기는 착지 위치를 고른다
[[분류:원딜]]

## `Q`의 미사일을 한 대상에 모은다
**`이케시아 폭우(Q)`은 근처 적들에게 미사일을 나누므로 대상이 홀로 있을수록 피해가 집중된다.**[* [카이사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=140)] 웨이브 한가운데서 누르기보다 상대가 미니언과 떨어지는 순간에 가까이 간다.

## 플라즈마 중첩을 팀의 제어와 함께 쌓는다
**기본 공격과 `공허추적자(W)`, 아군의 이동 불가 효과가 플라즈마를 준비한다.** 중첩이 충분한 대상을 우선해 폭발시키고, 여러 적에게 조금씩 나누지 않는다.

## `E` 충전 중 공격할 수 없음을 계산한다
**`고속 충전(E)`은 이동 뒤 공격 속도를 주지만 준비 중에는 공격이 멈춘다.** 상대의 큰 기술을 피하며 측면으로 움직이거나 교전 직전에 미리 사용한다.

## `R`은 진입 버튼보다 재배치 기술이다
**`사냥본능(R)`은 플라즈마가 묻은 적 근처로 이동하며 보호막을 준다.** 대상 바로 앞이 아니라 위험 기술을 피할 옆이나 아군과 이어지는 뒤쪽에 착지해 계속 공격할 자리를 만든다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-kaisa-20260915' OR (kind = 'article' AND title_key = '카이사'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-kaisa-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-kaisa-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 고립된 대상에게 `Q`를 집중한다 · 플라즈마를 쌓고 터뜨린다 · 궁극기는 착지 위치를 고른다
[[분류:원딜]]

## `Q`의 미사일을 한 대상에 모은다
**`이케시아 폭우(Q)`은 근처 적들에게 미사일을 나누므로 대상이 홀로 있을수록 피해가 집중된다.**[* [카이사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=140)] 웨이브 한가운데서 누르기보다 상대가 미니언과 떨어지는 순간에 가까이 간다.

## 플라즈마 중첩을 팀의 제어와 함께 쌓는다
**기본 공격과 `공허추적자(W)`, 아군의 이동 불가 효과가 플라즈마를 준비한다.** 중첩이 충분한 대상을 우선해 폭발시키고, 여러 적에게 조금씩 나누지 않는다.

## `E` 충전 중 공격할 수 없음을 계산한다
**`고속 충전(E)`은 이동 뒤 공격 속도를 주지만 준비 중에는 공격이 멈춘다.** 상대의 큰 기술을 피하며 측면으로 움직이거나 교전 직전에 미리 사용한다.

## `R`은 진입 버튼보다 재배치 기술이다
**`사냥본능(R)`은 플라즈마가 묻은 적 근처로 이동하며 보호막을 준다.** 대상 바로 앞이 아니라 위험 기술을 피할 옆이나 아군과 이어지는 뒤쪽에 착지해 계속 공격할 자리를 만든다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-kaisa-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-kaisa-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-kaisa-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-kaisa-20260915' AND target_key = '분류:원딜');

-- 아펠리오스 챔피언 위키 (704자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-aphelios-20260915', 'article', '아펠리오스', '아펠리오스', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 현재 두 무기의 역할을 말로 정리한다 · 탄약을 다음 교전 전에 조절한다 · 궁극기는 주 무기 효과를 보고 쓴다
[[분류:원딜]]

## 두 무기의 조합부터 확인한다
**아펠리오스는 주 무기와 보조 무기를 함께 쓰며 각 `Q`가 다른 무기의 효과와 연결된다.**[* [아펠리오스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=147)] 사거리, 회복, 둔화, 광역 피해, 근접 지속 피해 중 지금 조합이 잘하는 일을 먼저 정한다.

## 탄약을 다음 싸움의 순서로 바꾼다
**주 무기 탄약이 모두 떨어지면 정해진 다음 무기가 들어온다.** 목표물 전투 직전에 불필요한 탄약을 안전하게 소모해 필요한 무기를 앞당기고, 교전 중 갑자기 역할이 바뀌지 않게 한다.

## `W` 교체로 같은 거리에서 선택을 바꾼다
**`위상 변화(W)`는 주 무기와 보조 무기를 즉시 바꾼다.** 접근하기 전에 먼 무기로 시작하고, 적이 붙은 뒤 가까운 전투에 강한 무기로 바꾸는 식으로 거리 변화에 맞춘다.

## 궁극기는 현재 주 무기의 결과를 노린다
**`월광포화(R)`는 적중 뒤 폭발하며 주 무기의 고유 효과를 적용한다.** 단순 피해만 보지 않고 여러 적에게 광역 효과가 필요한지, 한 대상을 추적하거나 회복할지 정한 뒤 무기를 확인하고 발사한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-aphelios-20260915' OR (kind = 'article' AND title_key = '아펠리오스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-aphelios-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-aphelios-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 현재 두 무기의 역할을 말로 정리한다 · 탄약을 다음 교전 전에 조절한다 · 궁극기는 주 무기 효과를 보고 쓴다
[[분류:원딜]]

## 두 무기의 조합부터 확인한다
**아펠리오스는 주 무기와 보조 무기를 함께 쓰며 각 `Q`가 다른 무기의 효과와 연결된다.**[* [아펠리오스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=147)] 사거리, 회복, 둔화, 광역 피해, 근접 지속 피해 중 지금 조합이 잘하는 일을 먼저 정한다.

## 탄약을 다음 싸움의 순서로 바꾼다
**주 무기 탄약이 모두 떨어지면 정해진 다음 무기가 들어온다.** 목표물 전투 직전에 불필요한 탄약을 안전하게 소모해 필요한 무기를 앞당기고, 교전 중 갑자기 역할이 바뀌지 않게 한다.

## `W` 교체로 같은 거리에서 선택을 바꾼다
**`위상 변화(W)`는 주 무기와 보조 무기를 즉시 바꾼다.** 접근하기 전에 먼 무기로 시작하고, 적이 붙은 뒤 가까운 전투에 강한 무기로 바꾸는 식으로 거리 변화에 맞춘다.

## 궁극기는 현재 주 무기의 결과를 노린다
**`월광포화(R)`는 적중 뒤 폭발하며 주 무기의 고유 효과를 적용한다.** 단순 피해만 보지 않고 여러 적에게 광역 효과가 필요한지, 한 대상을 추적하거나 회복할지 정한 뒤 무기를 확인하고 발사한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-aphelios-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-aphelios-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-aphelios-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-aphelios-20260915' AND target_key = '분류:원딜');

-- 시비르 챔피언 위키 (663자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-sivir-20260915', 'article', '시비르', '시비르', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 부메랑 왕복 선을 맞춘다 · 튕김으로 웨이브와 챔피언을 함께 친다 · 방어막은 가장 큰 기술에 남긴다
[[분류:원딜]]

## `Q`가 돌아오는 경로까지 움직인다
**`부메랑 검(Q)`은 나아갈 때와 돌아올 때 두 번 피해를 준다.**[* [시비르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=58)] 첫 적중 뒤 옆으로 걸어 귀환 경로를 상대의 이동 방향에 겹치고, 미니언이 많은 선에서는 피해가 분산될 수 있음을 본다.

## `W`는 첫 대상보다 다음 튕김을 본다
**`튕기는 부메랑(W)`은 첫 공격 뒤 주변 대상에 연쇄된다.** 상대와 가까운 미니언을 쳐 안전한 거리에서 견제하고, 웨이브를 원치 않게 전부 밀 상황이면 사용을 늦춘다.

## `E`는 예측 가능한 핵심 기술에 쓴다
**`주문 방어막(E)`은 적 기술 하나를 막고 성공하면 체력과 이동 이득을 준다.** 약한 견제에 먼저 쓰기보다 속박이나 큰 단일 공격의 동작을 기다린다.

## 궁극기로 팀의 같은 방향을 만든다
**`사냥 개시(R)`는 아군의 이동 속도를 높이고 공격 중 기본 기술의 시간을 줄인다.** 흩어진 상태에서 혼자 켜기보다 진입하거나 빠질 방향을 팀이 고른 순간 사용한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-sivir-20260915' OR (kind = 'article' AND title_key = '시비르'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-sivir-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-sivir-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 부메랑 왕복 선을 맞춘다 · 튕김으로 웨이브와 챔피언을 함께 친다 · 방어막은 가장 큰 기술에 남긴다
[[분류:원딜]]

## `Q`가 돌아오는 경로까지 움직인다
**`부메랑 검(Q)`은 나아갈 때와 돌아올 때 두 번 피해를 준다.**[* [시비르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=58)] 첫 적중 뒤 옆으로 걸어 귀환 경로를 상대의 이동 방향에 겹치고, 미니언이 많은 선에서는 피해가 분산될 수 있음을 본다.

## `W`는 첫 대상보다 다음 튕김을 본다
**`튕기는 부메랑(W)`은 첫 공격 뒤 주변 대상에 연쇄된다.** 상대와 가까운 미니언을 쳐 안전한 거리에서 견제하고, 웨이브를 원치 않게 전부 밀 상황이면 사용을 늦춘다.

## `E`는 예측 가능한 핵심 기술에 쓴다
**`주문 방어막(E)`은 적 기술 하나를 막고 성공하면 체력과 이동 이득을 준다.** 약한 견제에 먼저 쓰기보다 속박이나 큰 단일 공격의 동작을 기다린다.

## 궁극기로 팀의 같은 방향을 만든다
**`사냥 개시(R)`는 아군의 이동 속도를 높이고 공격 중 기본 기술의 시간을 줄인다.** 흩어진 상태에서 혼자 켜기보다 진입하거나 빠질 방향을 팀이 고른 순간 사용한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-sivir-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-sivir-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-sivir-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-sivir-20260915' AND target_key = '분류:원딜');

-- 루시안 챔피언 위키 (674자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-lucian-20260915', 'article', '루시안', '루시안', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 기술마다 두 발을 섞는다 · `Q` 관통 선으로 견제한다 · `E`는 추격보다 회피에 먼저 쓴다
[[분류:원딜]]

## 기술 뒤의 두 발까지가 한 묶음이다
**루시안은 기술을 사용한 뒤 다음 기본 공격에서 두 발을 연속으로 쏜다.**[* [루시안 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=115)] 기술만 연달아 누르지 말고 사거리 안에서 두 발을 넣은 뒤 다음 기술로 이어 간다.

## `Q`는 미니언을 통과해 챔피언에게 닿게 한다
**`꿰뚫는 빛(Q)`은 선택한 대상을 지나 직선으로 공격한다.** 상대가 막타를 치는 순간 앞 미니언을 지정해 피하기 어려운 관통 선을 만들고, 챔피언만 쫓아 웨이브 밖으로 나가지 않는다.

## `W` 표식으로 이동 속도를 얻는다
**`타는 불길(W)`에 맞은 적을 공격하면 루시안의 이동 속도가 오른다.** 교환 시작 전에 붙여 두고 두 발 공격으로 발동해 상대의 반격을 옆으로 피한다.

## `E`는 핵심 기술을 피한 뒤 공격을 잇는다
**`끈질긴 추격(E)`은 짧게 이동하고 두 발 공격으로 다시 쓸 시간을 줄일 수 있다.** 먼저 앞으로 쓰기보다 상대의 제어나 투사체를 피하며 각도를 바꾸고, 안전이 확인된 뒤 추격에 사용한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-lucian-20260915' OR (kind = 'article' AND title_key = '루시안'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-lucian-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-lucian-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 기술마다 두 발을 섞는다 · `Q` 관통 선으로 견제한다 · `E`는 추격보다 회피에 먼저 쓴다
[[분류:원딜]]

## 기술 뒤의 두 발까지가 한 묶음이다
**루시안은 기술을 사용한 뒤 다음 기본 공격에서 두 발을 연속으로 쏜다.**[* [루시안 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=115)] 기술만 연달아 누르지 말고 사거리 안에서 두 발을 넣은 뒤 다음 기술로 이어 간다.

## `Q`는 미니언을 통과해 챔피언에게 닿게 한다
**`꿰뚫는 빛(Q)`은 선택한 대상을 지나 직선으로 공격한다.** 상대가 막타를 치는 순간 앞 미니언을 지정해 피하기 어려운 관통 선을 만들고, 챔피언만 쫓아 웨이브 밖으로 나가지 않는다.

## `W` 표식으로 이동 속도를 얻는다
**`타는 불길(W)`에 맞은 적을 공격하면 루시안의 이동 속도가 오른다.** 교환 시작 전에 붙여 두고 두 발 공격으로 발동해 상대의 반격을 옆으로 피한다.

## `E`는 핵심 기술을 피한 뒤 공격을 잇는다
**`끈질긴 추격(E)`은 짧게 이동하고 두 발 공격으로 다시 쓸 시간을 줄일 수 있다.** 먼저 앞으로 쓰기보다 상대의 제어나 투사체를 피하며 각도를 바꾸고, 안전이 확인된 뒤 추격에 사용한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-lucian-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-lucian-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-lucian-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-lucian-20260915' AND target_key = '분류:원딜');

-- 드레이븐 챔피언 위키 (669자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-draven-20260915', 'article', '드레이븐', '드레이븐', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 도끼 낙하점을 다음 위치로 삼는다 · 회수마다 `W`를 다시 쓴다 · 밀치기로 진입을 끊는다
[[분류:원딜]]

## 공격 전에 도끼가 떨어질 방향을 정한다
**`회전 도끼(Q)`는 공격 뒤 드레이븐의 이동 방향 쪽으로 튕겨 나간다.**[* [드레이븐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=99)] 공격 직후 가려는 쪽으로 먼저 움직여 안전한 낙하점을 만들고, 위험한 도끼 하나를 위해 적 진형으로 들어가지 않는다.

## 두 도끼보다 안전한 한 도끼를 우선한다
**도끼를 두 개 유지하면 피해는 커지지만 받아야 할 위치도 두 군데가 된다.** 진입 위협이 보이면 하나를 포기하고 아군 쪽 낙하점만 따라가며 기본 공격 흐름을 지킨다.

## 회수한 순간 `W`로 다음 도끼를 받는다
**도끼를 잡으면 `광기의 피(W)`를 다시 사용할 수 있다.** 이동 속도로 다음 낙하점에 닿고 공격 속도로 새 도끼를 던지되, 자원이 부족할 때 무조건 반복하지 않는다.

## `E`는 적의 이동 기술에 맞춘다
**`비켜서라(E)`는 적을 옆으로 밀고 둔화한다.** 정면 피해용으로 먼저 쓰지 않고 뛰어드는 적의 경로를 끊거나, 궁극기가 돌아오는 선에 상대를 붙잡는 데 사용한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-draven-20260915' OR (kind = 'article' AND title_key = '드레이븐'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-draven-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-draven-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 도끼 낙하점을 다음 위치로 삼는다 · 회수마다 `W`를 다시 쓴다 · 밀치기로 진입을 끊는다
[[분류:원딜]]

## 공격 전에 도끼가 떨어질 방향을 정한다
**`회전 도끼(Q)`는 공격 뒤 드레이븐의 이동 방향 쪽으로 튕겨 나간다.**[* [드레이븐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=99)] 공격 직후 가려는 쪽으로 먼저 움직여 안전한 낙하점을 만들고, 위험한 도끼 하나를 위해 적 진형으로 들어가지 않는다.

## 두 도끼보다 안전한 한 도끼를 우선한다
**도끼를 두 개 유지하면 피해는 커지지만 받아야 할 위치도 두 군데가 된다.** 진입 위협이 보이면 하나를 포기하고 아군 쪽 낙하점만 따라가며 기본 공격 흐름을 지킨다.

## 회수한 순간 `W`로 다음 도끼를 받는다
**도끼를 잡으면 `광기의 피(W)`를 다시 사용할 수 있다.** 이동 속도로 다음 낙하점에 닿고 공격 속도로 새 도끼를 던지되, 자원이 부족할 때 무조건 반복하지 않는다.

## `E`는 적의 이동 기술에 맞춘다
**`비켜서라(E)`는 적을 옆으로 밀고 둔화한다.** 정면 피해용으로 먼저 쓰지 않고 뛰어드는 적의 경로를 끊거나, 궁극기가 돌아오는 선에 상대를 붙잡는 데 사용한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-draven-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-draven-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-draven-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-draven-20260915' AND target_key = '분류:원딜');

-- 코그모 챔피언 위키 (671자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-kogmaw-20260915', 'article', '코그모', '코그모', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — `W`가 켜진 시간에만 앞으로 선다 · `Q`로 방어를 낮춘다 · 궁극기는 낮은 체력 마무리에 쓴다
[[분류:원딜]]

## `W`의 시작과 끝을 교전 시간으로 삼는다
**`생체마법 폭격(W)`은 공격 사거리와 대상 최대 체력 비례 피해를 높인다.**[* [코그모 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=32)] 켜진 동안 사거리 끝에서 계속 공격하고, 효과가 끝나면 같은 위치에 남지 않고 아군 뒤로 돌아간다.

## `Q`를 맞힌 대상부터 공격한다
**`부식성 침(Q)`은 적의 방어력과 마법 저항력을 낮춘다.** 앞라인이나 다가오는 적에게 먼저 맞힌 뒤 기본 공격을 집중해 약화 시간을 실제 피해로 바꾼다.

## `E`를 발밑과 퇴로 사이에 긋는다
**`공허의 분비물(E)`은 긴 흔적 위의 적을 둔화한다.** 이미 붙은 적과 내가 빠질 방향 사이에 깔아 추격을 늦추고, 안전할 때는 적의 도주로에 두어 `W` 공격 시간을 늘린다.

## `R`은 연속 사용 비용을 센다
**`살아있는 곡사포(R)`는 멀리 있는 낮은 체력 적에게 강하지만 반복할수록 자원 소모가 커진다.** 시야 확인과 마무리 중 목적을 정하고, 체력이 충분한 적에게 습관적으로 연사하지 않는다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-kogmaw-20260915' OR (kind = 'article' AND title_key = '코그모'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-kogmaw-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-kogmaw-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — `W`가 켜진 시간에만 앞으로 선다 · `Q`로 방어를 낮춘다 · 궁극기는 낮은 체력 마무리에 쓴다
[[분류:원딜]]

## `W`의 시작과 끝을 교전 시간으로 삼는다
**`생체마법 폭격(W)`은 공격 사거리와 대상 최대 체력 비례 피해를 높인다.**[* [코그모 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=32)] 켜진 동안 사거리 끝에서 계속 공격하고, 효과가 끝나면 같은 위치에 남지 않고 아군 뒤로 돌아간다.

## `Q`를 맞힌 대상부터 공격한다
**`부식성 침(Q)`은 적의 방어력과 마법 저항력을 낮춘다.** 앞라인이나 다가오는 적에게 먼저 맞힌 뒤 기본 공격을 집중해 약화 시간을 실제 피해로 바꾼다.

## `E`를 발밑과 퇴로 사이에 긋는다
**`공허의 분비물(E)`은 긴 흔적 위의 적을 둔화한다.** 이미 붙은 적과 내가 빠질 방향 사이에 깔아 추격을 늦추고, 안전할 때는 적의 도주로에 두어 `W` 공격 시간을 늘린다.

## `R`은 연속 사용 비용을 센다
**`살아있는 곡사포(R)`는 멀리 있는 낮은 체력 적에게 강하지만 반복할수록 자원 소모가 커진다.** 시야 확인과 마무리 중 목적을 정하고, 체력이 충분한 적에게 습관적으로 연사하지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-kogmaw-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-kogmaw-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-kogmaw-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-kogmaw-20260915' AND target_key = '분류:원딜');

-- 트위치 챔피언 위키 (646자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-twitch-20260915', 'article', '트위치', '트위치', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 위장으로 공격 각을 바꾼다 · 맹독 중첩 뒤 `E`를 쓴다 · 궁극기는 적이 한 줄일 때 연다
[[분류:원딜]]

## `Q`는 숨는 시간보다 나타날 위치가 중요하다
**`매복(Q)`이 끝나면 트위치는 잠시 공격 속도를 얻는다.**[* [트위치 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=68)] 정면에서 사라졌다 같은 자리로 나오기보다 수풀이나 측면으로 이동해 상대의 퇴로와 직각인 공격 선을 만든다.

## 독약 병은 중첩과 추격을 함께 돕는다
**`독약 병(W)`은 범위를 둔화하고 맹독을 계속 쌓기 쉽게 한다.** 적 뒤쪽에 던져 돌아갈 길을 늦추고, 병 안에 있는 동안 안전한 기본 공격 수를 늘린다.

## `E`는 중첩 수를 보고 누른다
**`오염(E)`은 맹독이 많이 쌓일수록 강해진다.** 첫 공격 직후 성급히 쓰지 말고 상대가 사거리 밖으로 나가기 직전이나 충분한 중첩이 쌓였을 때 마무리한다.

## 궁극기는 관통할 적을 한 선에 둔다
**`무차별 난사(R)`는 사거리 긴 관통 화살로 여러 적을 공격한다.** 좁은 길이나 아군 제어 뒤에 사용하고, 측면에서 적의 앞뒤가 겹치도록 서되 혼자 고립되지는 않는다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-twitch-20260915' OR (kind = 'article' AND title_key = '트위치'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-twitch-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-twitch-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 위장으로 공격 각을 바꾼다 · 맹독 중첩 뒤 `E`를 쓴다 · 궁극기는 적이 한 줄일 때 연다
[[분류:원딜]]

## `Q`는 숨는 시간보다 나타날 위치가 중요하다
**`매복(Q)`이 끝나면 트위치는 잠시 공격 속도를 얻는다.**[* [트위치 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=68)] 정면에서 사라졌다 같은 자리로 나오기보다 수풀이나 측면으로 이동해 상대의 퇴로와 직각인 공격 선을 만든다.

## 독약 병은 중첩과 추격을 함께 돕는다
**`독약 병(W)`은 범위를 둔화하고 맹독을 계속 쌓기 쉽게 한다.** 적 뒤쪽에 던져 돌아갈 길을 늦추고, 병 안에 있는 동안 안전한 기본 공격 수를 늘린다.

## `E`는 중첩 수를 보고 누른다
**`오염(E)`은 맹독이 많이 쌓일수록 강해진다.** 첫 공격 직후 성급히 쓰지 말고 상대가 사거리 밖으로 나가기 직전이나 충분한 중첩이 쌓였을 때 마무리한다.

## 궁극기는 관통할 적을 한 선에 둔다
**`무차별 난사(R)`는 사거리 긴 관통 화살로 여러 적을 공격한다.** 좁은 길이나 아군 제어 뒤에 사용하고, 측면에서 적의 앞뒤가 겹치도록 서되 혼자 고립되지는 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-twitch-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-twitch-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-twitch-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-twitch-20260915' AND target_key = '분류:원딜');

-- 베인 챔피언 위키 (648자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-vayne-20260915', 'article', '베인', '베인', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 같은 대상을 세 번 친다 · 구르기는 옆으로 거리를 맞춘다 · 선고 전에 벽 위치를 본다
[[분류:원딜]]

## 은화살 중첩을 다른 대상에 나누지 않는다
**`은화살(W)`은 같은 대상에 세 번째 공격이나 기술이 적중할 때 최대 체력 비례 고정 피해를 준다.**[* [베인 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=71)] 두 번 친 대상을 놓치지 말고 세 번째까지 연결하되, 위험해지면 중첩보다 생존을 택한다.

## `Q`는 앞으로보다 옆으로 쓴다
**`구르기(Q)`는 짧게 이동하며 다음 공격을 강화한다.** 상대와 평행하게 움직여 사거리 끝을 유지하고, 정면으로 굴러 제어 기술과 가까워지지 않는다.

## 선고 각은 벽과 대상이 만든다
**`선고(E)`는 대상을 밀어내고 지형에 부딪히면 기절시킨다.** 벽이 없는 곳에서는 생존용 밀치기로 남기고, 벽 근처에서는 먼저 옆으로 걸어 대상과 벽을 일직선에 둔다.

## 궁극기 중에도 공격 간격을 지킨다
**`결전의 시간(R)`은 공격력을 높이고 구르기 때 잠시 모습을 숨긴다.** 은신을 진입 허가로 생각하지 말고 상대의 방향을 틀어 다음 공격 위치를 숨기는 데 사용한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-vayne-20260915' OR (kind = 'article' AND title_key = '베인'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-vayne-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-vayne-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 같은 대상을 세 번 친다 · 구르기는 옆으로 거리를 맞춘다 · 선고 전에 벽 위치를 본다
[[분류:원딜]]

## 은화살 중첩을 다른 대상에 나누지 않는다
**`은화살(W)`은 같은 대상에 세 번째 공격이나 기술이 적중할 때 최대 체력 비례 고정 피해를 준다.**[* [베인 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=71)] 두 번 친 대상을 놓치지 말고 세 번째까지 연결하되, 위험해지면 중첩보다 생존을 택한다.

## `Q`는 앞으로보다 옆으로 쓴다
**`구르기(Q)`는 짧게 이동하며 다음 공격을 강화한다.** 상대와 평행하게 움직여 사거리 끝을 유지하고, 정면으로 굴러 제어 기술과 가까워지지 않는다.

## 선고 각은 벽과 대상이 만든다
**`선고(E)`는 대상을 밀어내고 지형에 부딪히면 기절시킨다.** 벽이 없는 곳에서는 생존용 밀치기로 남기고, 벽 근처에서는 먼저 옆으로 걸어 대상과 벽을 일직선에 둔다.

## 궁극기 중에도 공격 간격을 지킨다
**`결전의 시간(R)`은 공격력을 높이고 구르기 때 잠시 모습을 숨긴다.** 은신을 진입 허가로 생각하지 말고 상대의 방향을 틀어 다음 공격 위치를 숨기는 데 사용한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-vayne-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-vayne-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-vayne-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-vayne-20260915' AND target_key = '분류:원딜');

-- 사미라 챔피언 위키 (669자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-samira-20260915', 'article', '사미라', '사미라', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 서로 다른 공격으로 등급을 올린다 · `W`는 큰 투사체에 남긴다 · 궁극기 전에 퇴로를 확인한다
[[분류:원딜]]

## 같은 공격을 반복하지 않고 스타일을 잇는다
**사미라는 서로 다른 기본 공격과 기술을 연속으로 맞혀 스타일 등급을 올린다.**[* [사미라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=151)] 멀리서 기본 공격과 `Q`로 시작하고, 아군 제어가 맞은 뒤 가까운 공격으로 이어 순서를 끊지 않는다.

## 원거리와 근거리 `Q`의 자리를 나눈다
**`천부적 재능(Q)`은 거리에 따라 총을 쏘거나 검으로 벤다.** 안전하게 등급을 쌓을 때는 원거리로, 여러 적에게 붙은 뒤에는 근거리 범위를 활용한다.

## `W`는 진입 중 생존을 책임진다
**`원형 검무(W)`는 주변 투사체를 파괴한다.** 약한 견제에 미리 쓰지 않고 `E`로 들어갈 때 날아오는 핵심 제어나 큰 탄환을 지워 궁극기까지 이어질 시간을 번다.

## `E` 초기화가 보여도 다음 대상을 고른다
**`거침없는 질주(E)`는 처치 관여 뒤 다시 사용할 수 있다.** 첫 대상에게 들어가기 전에 다음 적과 아군 위치를 보고, 궁극기를 쓴 뒤 빠져나올 경로가 있을 때만 깊게 진입한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-samira-20260915' OR (kind = 'article' AND title_key = '사미라'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-samira-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-samira-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 서로 다른 공격으로 등급을 올린다 · `W`는 큰 투사체에 남긴다 · 궁극기 전에 퇴로를 확인한다
[[분류:원딜]]

## 같은 공격을 반복하지 않고 스타일을 잇는다
**사미라는 서로 다른 기본 공격과 기술을 연속으로 맞혀 스타일 등급을 올린다.**[* [사미라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=151)] 멀리서 기본 공격과 `Q`로 시작하고, 아군 제어가 맞은 뒤 가까운 공격으로 이어 순서를 끊지 않는다.

## 원거리와 근거리 `Q`의 자리를 나눈다
**`천부적 재능(Q)`은 거리에 따라 총을 쏘거나 검으로 벤다.** 안전하게 등급을 쌓을 때는 원거리로, 여러 적에게 붙은 뒤에는 근거리 범위를 활용한다.

## `W`는 진입 중 생존을 책임진다
**`원형 검무(W)`는 주변 투사체를 파괴한다.** 약한 견제에 미리 쓰지 않고 `E`로 들어갈 때 날아오는 핵심 제어나 큰 탄환을 지워 궁극기까지 이어질 시간을 번다.

## `E` 초기화가 보여도 다음 대상을 고른다
**`거침없는 질주(E)`는 처치 관여 뒤 다시 사용할 수 있다.** 첫 대상에게 들어가기 전에 다음 적과 아군 위치를 보고, 궁극기를 쓴 뒤 빠져나올 경로가 있을 때만 깊게 진입한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-samira-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-samira-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-samira-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-samira-20260915' AND target_key = '분류:원딜');

-- 제리 챔피언 위키 (654자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-zeri-20260915', 'article', '제리', '제리', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — `Q`를 기본 공격처럼 맞힌다 · 벽을 이용해 `W`를 넓힌다 · `E`는 넘을 지형의 끝을 본다
[[분류:원딜]]

## `Q` 탄환이 모두 닿는 거리를 유지한다
**`집중 사격(Q)`은 여러 발을 직선으로 쏘며 기본 공격으로 취급된다.**[* [제리 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=158)] 미니언이 앞을 막으면 챔피언에게 닿지 않으므로 웨이브 옆에서 각을 만들고 움직이며 조준한다.

## 충전된 기본 공격을 구분해 쓴다
**제리의 별도 기본 공격은 이동과 `Q`로 충전되며 완전히 찼을 때 더 강하다.** 충전이 부족하면 낮은 체력 미니언 정리에 쓰고, 가득 찼다면 챔피언 견제에 남긴다.

## `W`는 벽에 맞혀 범위를 바꾼다
**`초강력 레이저(W)`가 지형에 닿으면 벽 너머로 넓은 레이저가 퍼진다.** 시야 밖 견제나 좁은 입구 차단에 사용하고, 가까운 적에게는 짧은 직선으로 즉시 맞힌다.

## `E`의 도착 지점부터 안전한지 본다
**`스파크 돌진(E)`은 맞닿은 지형을 길게 넘어갈 수 있다.** 벽에 들어가기 전 반대편 시야와 적 위치를 확인하고, 교전에서는 관통 `Q`가 필요한지 탈출이 필요한지 정한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-zeri-20260915' OR (kind = 'article' AND title_key = '제리'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-zeri-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-zeri-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — `Q`를 기본 공격처럼 맞힌다 · 벽을 이용해 `W`를 넓힌다 · `E`는 넘을 지형의 끝을 본다
[[분류:원딜]]

## `Q` 탄환이 모두 닿는 거리를 유지한다
**`집중 사격(Q)`은 여러 발을 직선으로 쏘며 기본 공격으로 취급된다.**[* [제리 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=158)] 미니언이 앞을 막으면 챔피언에게 닿지 않으므로 웨이브 옆에서 각을 만들고 움직이며 조준한다.

## 충전된 기본 공격을 구분해 쓴다
**제리의 별도 기본 공격은 이동과 `Q`로 충전되며 완전히 찼을 때 더 강하다.** 충전이 부족하면 낮은 체력 미니언 정리에 쓰고, 가득 찼다면 챔피언 견제에 남긴다.

## `W`는 벽에 맞혀 범위를 바꾼다
**`초강력 레이저(W)`가 지형에 닿으면 벽 너머로 넓은 레이저가 퍼진다.** 시야 밖 견제나 좁은 입구 차단에 사용하고, 가까운 적에게는 짧은 직선으로 즉시 맞힌다.

## `E`의 도착 지점부터 안전한지 본다
**`스파크 돌진(E)`은 맞닿은 지형을 길게 넘어갈 수 있다.** 벽에 들어가기 전 반대편 시야와 적 위치를 확인하고, 교전에서는 관통 `Q`가 필요한지 탈출이 필요한지 정한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-zeri-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-zeri-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-zeri-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-zeri-20260915' AND target_key = '분류:원딜');

-- 칼리스타 챔피언 위키 (663자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-kalista-20260915', 'article', '칼리스타', '칼리스타', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 공격마다 안전한 방향으로 뛴다 · 창이 쌓인 대상을 놓치지 않는다 · 계약자와 같은 대상을 친다
[[분류:원딜]]

## 도약 방향을 공격 전에 입력한다
**칼리스타는 기본 공격이나 `Q` 뒤 이동 명령으로 짧게 도약한다.**[* [칼리스타 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=122)] 적을 따라가는 방향만 고르지 말고 투사체와 진입기를 옆으로 피할 방향을 번갈아 사용한다.

## 창 중첩은 한 대상에 모은다
**기본 공격과 `꿰뚫는 창(Q)`은 적에게 창을 남기고 `뽑아 찢기(E)`가 이를 회수한다.** 공격 대상을 자주 바꾸지 말고 처치하거나 충분한 중첩이 쌓일 때 `E`를 사용한다.

## `E` 초기화로 막타와 교환을 함께 잇는다
**`E`로 대상을 처치하면 다시 사용할 수 있다.** 낮은 체력 미니언과 챔피언에 창을 함께 쌓아 막타로 초기화하면서 둔화를 걸고, 실패할 체력에서는 성급히 누르지 않는다.

## 계약자의 준비를 확인하고 궁극기를 쓴다
**`운명의 부름(R)`은 계약자를 불러들인 뒤 직접 돌진 방향을 고르게 한다.** 위험에서 구할지 교전을 열지 신호를 맞추고, 계약자가 기술을 모두 쓴 뒤에는 진입보다 구조에 사용한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-kalista-20260915' OR (kind = 'article' AND title_key = '칼리스타'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-kalista-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-kalista-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 공격마다 안전한 방향으로 뛴다 · 창이 쌓인 대상을 놓치지 않는다 · 계약자와 같은 대상을 친다
[[분류:원딜]]

## 도약 방향을 공격 전에 입력한다
**칼리스타는 기본 공격이나 `Q` 뒤 이동 명령으로 짧게 도약한다.**[* [칼리스타 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=122)] 적을 따라가는 방향만 고르지 말고 투사체와 진입기를 옆으로 피할 방향을 번갈아 사용한다.

## 창 중첩은 한 대상에 모은다
**기본 공격과 `꿰뚫는 창(Q)`은 적에게 창을 남기고 `뽑아 찢기(E)`가 이를 회수한다.** 공격 대상을 자주 바꾸지 말고 처치하거나 충분한 중첩이 쌓일 때 `E`를 사용한다.

## `E` 초기화로 막타와 교환을 함께 잇는다
**`E`로 대상을 처치하면 다시 사용할 수 있다.** 낮은 체력 미니언과 챔피언에 창을 함께 쌓아 막타로 초기화하면서 둔화를 걸고, 실패할 체력에서는 성급히 누르지 않는다.

## 계약자의 준비를 확인하고 궁극기를 쓴다
**`운명의 부름(R)`은 계약자를 불러들인 뒤 직접 돌진 방향을 고르게 한다.** 위험에서 구할지 교전을 열지 신호를 맞추고, 계약자가 기술을 모두 쓴 뒤에는 진입보다 구조에 사용한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-kalista-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-kalista-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-kalista-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-kalista-20260915' AND target_key = '분류:원딜');

-- 닐라 챔피언 위키 (663자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-nilah-20260915', 'article', '닐라', '닐라', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — `Q` 적중 뒤 늘어난 사거리로 친다 · 장막을 아군과 나눈다 · 두 번의 돌진을 따로 쓴다
[[분류:원딜]]

## `Q`를 맞혀야 공격 범위가 열린다
**`무형의 검(Q)`이 적중하면 닐라의 공격 사거리가 잠시 늘어난다.**[* [닐라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=161)] 먼저 끝 거리에서 맞힌 뒤 강화된 기본 공격으로 이어 가고, 빗나갔다면 짧은 사거리로 억지로 들어가지 않는다.

## `W`는 기본 공격이 몰릴 때 켠다
**`승리의 장막(W)`은 닐라가 기본 공격을 피하게 하고 닿은 아군에게도 효과를 나눈다.** 적 원거리 딜러의 공격이 집중되는 순간 아군 곁에서 사용해 함께 전진하거나 빠진다.

## `E` 두 번을 진입과 복귀로 나눈다
**`급류(E)`는 대상을 향해 돌진하며 충전을 나눠 쓸 수 있다.** 첫 돌진으로 사거리를 만들고, 두 번째는 상대 이동기를 따라가거나 아군 쪽 대상으로 빠지는 데 남긴다.

## 궁극기는 여러 적이 닿을 때까지 기다린다
**`환희(R)`는 주변을 공격한 뒤 적을 가까이 끌어당긴다.** 아군 제어와 겹치거나 두 명 이상이 모인 순간 사용하고, 시작 전에 장막이나 퇴로가 있는지 확인한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-nilah-20260915' OR (kind = 'article' AND title_key = '닐라'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-nilah-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-nilah-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — `Q` 적중 뒤 늘어난 사거리로 친다 · 장막을 아군과 나눈다 · 두 번의 돌진을 따로 쓴다
[[분류:원딜]]

## `Q`를 맞혀야 공격 범위가 열린다
**`무형의 검(Q)`이 적중하면 닐라의 공격 사거리가 잠시 늘어난다.**[* [닐라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=161)] 먼저 끝 거리에서 맞힌 뒤 강화된 기본 공격으로 이어 가고, 빗나갔다면 짧은 사거리로 억지로 들어가지 않는다.

## `W`는 기본 공격이 몰릴 때 켠다
**`승리의 장막(W)`은 닐라가 기본 공격을 피하게 하고 닿은 아군에게도 효과를 나눈다.** 적 원거리 딜러의 공격이 집중되는 순간 아군 곁에서 사용해 함께 전진하거나 빠진다.

## `E` 두 번을 진입과 복귀로 나눈다
**`급류(E)`는 대상을 향해 돌진하며 충전을 나눠 쓸 수 있다.** 첫 돌진으로 사거리를 만들고, 두 번째는 상대 이동기를 따라가거나 아군 쪽 대상으로 빠지는 데 남긴다.

## 궁극기는 여러 적이 닿을 때까지 기다린다
**`환희(R)`는 주변을 공격한 뒤 적을 가까이 끌어당긴다.** 아군 제어와 겹치거나 두 명 이상이 모인 순간 사용하고, 시작 전에 장막이나 퇴로가 있는지 확인한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-nilah-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-nilah-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-nilah-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-nilah-20260915' AND target_key = '분류:원딜');

-- 세나 챔피언 위키 (666자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-senna-20260915', 'article', '세나', '세나', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 영혼을 먹되 사거리 밖으로 나가지 않는다 · `Q` 관통선에 아군과 적을 함께 둔다 · 속박은 뒤 대상을 노린다
[[분류:원딜]]

## 영혼 하나보다 다음 공격 위치를 우선한다
**세나는 쓰러진 적에게서 나온 영혼을 모아 공격 능력을 성장시킨다.**[* [세나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=146)] 위험한 영혼을 위해 미니언 앞으로 나가지 않고, 상대 견제 기술이 빠졌을 때만 회수한다.

## `Q` 한 줄에 회복과 피해를 겹친다
**`꿰뚫는 어둠(Q)`은 대상을 관통해 아군을 회복하고 적에게 피해를 준다.** 아군이나 미니언을 지정해 뒤쪽 적까지 닿는 선을 만들고, 단일 막타에만 반복해 쓰지 않는다.

## `W`는 앞 대상 뒤의 적까지 묶는다
**`마지막 포옹(W)`은 첫 대상에 붙은 뒤 잠시 후 주변을 함께 속박한다.** 낮은 체력 미니언에 맞혀 빠르게 폭발시키거나, 진입하는 앞라인 뒤에 모인 적을 노린다.

## 궁극기는 전투 전체를 보고 쏜다
**`여명의 그림자(R)`는 맵을 가로질러 아군에게 보호막을 주고 적에게 피해를 준다.** 내 공격이 닿지 않는 교전도 살피되, 눈앞의 위협을 피할 위치를 먼저 확보하고 정신을 집중한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-senna-20260915' OR (kind = 'article' AND title_key = '세나'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-senna-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-senna-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 영혼을 먹되 사거리 밖으로 나가지 않는다 · `Q` 관통선에 아군과 적을 함께 둔다 · 속박은 뒤 대상을 노린다
[[분류:원딜]]

## 영혼 하나보다 다음 공격 위치를 우선한다
**세나는 쓰러진 적에게서 나온 영혼을 모아 공격 능력을 성장시킨다.**[* [세나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=146)] 위험한 영혼을 위해 미니언 앞으로 나가지 않고, 상대 견제 기술이 빠졌을 때만 회수한다.

## `Q` 한 줄에 회복과 피해를 겹친다
**`꿰뚫는 어둠(Q)`은 대상을 관통해 아군을 회복하고 적에게 피해를 준다.** 아군이나 미니언을 지정해 뒤쪽 적까지 닿는 선을 만들고, 단일 막타에만 반복해 쓰지 않는다.

## `W`는 앞 대상 뒤의 적까지 묶는다
**`마지막 포옹(W)`은 첫 대상에 붙은 뒤 잠시 후 주변을 함께 속박한다.** 낮은 체력 미니언에 맞혀 빠르게 폭발시키거나, 진입하는 앞라인 뒤에 모인 적을 노린다.

## 궁극기는 전투 전체를 보고 쏜다
**`여명의 그림자(R)`는 맵을 가로질러 아군에게 보호막을 주고 적에게 피해를 준다.** 내 공격이 닿지 않는 교전도 살피되, 눈앞의 위협을 피할 위치를 먼저 확보하고 정신을 집중한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-senna-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-senna-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-senna-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-senna-20260915' AND target_key = '분류:원딜');

-- 유나라 챔피언 위키 (702자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-adc-champion-yunara-20260915', 'article', '유나라', '유나라', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 방출을 모아 `Q` 시간을 연다 · 구슬의 둔화로 공격 거리를 만든다 · 초월 뒤 강화 기술 순서를 정한다
[[분류:원딜]]

## 방출 중첩을 교전 전에 준비한다
**유나라는 기본 공격으로 방출을 쌓고 `영혼 단련(Q)`에서 소모해 공격 속도와 추가 피해를 얻는다.**[* [유나라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=171)] 미니언을 안전하게 치며 준비하고, 활성화한 뒤에는 주변으로 퍼지는 공격이 웨이브를 미는 점도 계산한다.

## `W`가 느리게 만든 선에서 계속 공격한다
**`심판의 궤적(W)`은 회전하는 구슬로 적을 둔화한다.** 상대가 막타를 치거나 좁은 입구에 들어올 때 맞혀 기본 공격 시간을 만들고, 구슬을 따라 위험한 위치까지 걷지 않는다.

## `E`는 초월 전후의 역할이 다르다
**`칸메이의 발자취(E)`는 평소 이동 속도를 높이고 초월 상태에서는 돌진으로 강화된다.** 평소에는 거리를 유지하는 데 쓰고, 초월 중에는 큰 기술을 피하며 공격 각을 바꾸는 데 사용한다.

## 궁극기 전에 강화 기술의 목적을 정한다
**`자기 초월(R)`은 `Q`를 즉시 켜고 `W`와 `E`를 강화한다.** 적이 사거리에 들어온 뒤 사용해 지속시간을 아끼고, 강화 `E`로 들어갈지 빠질지 먼저 결정한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-adc-champion-yunara-20260915' OR (kind = 'article' AND title_key = '유나라'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-champion-yunara-20260915', id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-adc-champion-yunara-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 방출을 모아 `Q` 시간을 연다 · 구슬의 둔화로 공격 거리를 만든다 · 초월 뒤 강화 기술 순서를 정한다
[[분류:원딜]]

## 방출 중첩을 교전 전에 준비한다
**유나라는 기본 공격으로 방출을 쌓고 `영혼 단련(Q)`에서 소모해 공격 속도와 추가 피해를 얻는다.**[* [유나라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=171)] 미니언을 안전하게 치며 준비하고, 활성화한 뒤에는 주변으로 퍼지는 공격이 웨이브를 미는 점도 계산한다.

## `W`가 느리게 만든 선에서 계속 공격한다
**`심판의 궤적(W)`은 회전하는 구슬로 적을 둔화한다.** 상대가 막타를 치거나 좁은 입구에 들어올 때 맞혀 기본 공격 시간을 만들고, 구슬을 따라 위험한 위치까지 걷지 않는다.

## `E`는 초월 전후의 역할이 다르다
**`칸메이의 발자취(E)`는 평소 이동 속도를 높이고 초월 상태에서는 돌진으로 강화된다.** 평소에는 거리를 유지하는 데 쓰고, 초월 중에는 큰 기술을 피하며 공격 각을 바꾸는 데 사용한다.

## 궁극기 전에 강화 기술의 목적을 정한다
**`자기 초월(R)`은 `Q`를 즉시 켜고 `W`와 `E`를 강화한다.** 적이 사거리에 들어온 뒤 사용해 지속시간을 아끼고, 강화 `E`로 들어갈지 빠질지 먼저 결정한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-champion-yunara-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-adc-champion-yunara-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-adc-champion-yunara-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-adc-champion-yunara-20260915' AND target_key = '분류:원딜');

-- caitlyn 상대법 (647자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-caitlyn', 'matchup', NULL, NULL, 'published', 'caitlyn', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 막타와 동시에 사거리 안에 서지 않는다 · 덫 사이의 길을 먼저 본다 · 투망이 빠진 뒤 접근한다

## 막타를 칠 때 한 대 맞는 습관을 끊는다
**케이틀린은 긴 기본 공격 사거리로 내가 막타 동작에 멈추는 순간을 노린다.**[* [케이틀린 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=9)] 체력이 높은 미니언 뒤에 있다가 마지막 타격 직전에 옆으로 움직이고, 한두 개를 양보해 웨이브가 내 쪽으로 오게 한다.

## `Q`의 첫 대상이 되지 않는다
**`필트오버 피스메이커(Q)`는 첫 적을 지난 뒤 피해가 줄어든다.** 피하기 어렵다면 미니언 뒤에서 맞고, 케이틀린이 오래 조준하는 동작이 보이면 직선 옆으로 빠진다.

## 덫을 밟지 말고 빈 통로를 기억한다
**`요들잡이 덫(W)`은 이동을 막고 강화 헤드샷을 연다.** 포탑 가장자리와 수풀 입구의 덫 위치를 먼저 확인하고, 아군 제어에 걸렸을 때 발밑에 새 덫이 놓이는 것도 본다.

## 투망 뒤의 착지점을 압박한다
**`90구경 투망(E)`을 쓰면 케이틀린은 반대 방향으로 밀려난다.** 먼저 이동기를 쓰지 말고 투망 방향에서 비껴선 뒤, 반동이 끝난 자리로 접근한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-caitlyn' AND kind = 'matchup' AND champion_slug = 'caitlyn'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-caitlyn');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-caitlyn-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-caitlyn' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 막타와 동시에 사거리 안에 서지 않는다 · 덫 사이의 길을 먼저 본다 · 투망이 빠진 뒤 접근한다

## 막타를 칠 때 한 대 맞는 습관을 끊는다
**케이틀린은 긴 기본 공격 사거리로 내가 막타 동작에 멈추는 순간을 노린다.**[* [케이틀린 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=9)] 체력이 높은 미니언 뒤에 있다가 마지막 타격 직전에 옆으로 움직이고, 한두 개를 양보해 웨이브가 내 쪽으로 오게 한다.

## `Q`의 첫 대상이 되지 않는다
**`필트오버 피스메이커(Q)`는 첫 적을 지난 뒤 피해가 줄어든다.** 피하기 어렵다면 미니언 뒤에서 맞고, 케이틀린이 오래 조준하는 동작이 보이면 직선 옆으로 빠진다.

## 덫을 밟지 말고 빈 통로를 기억한다
**`요들잡이 덫(W)`은 이동을 막고 강화 헤드샷을 연다.** 포탑 가장자리와 수풀 입구의 덫 위치를 먼저 확인하고, 아군 제어에 걸렸을 때 발밑에 새 덫이 놓이는 것도 본다.

## 투망 뒤의 착지점을 압박한다
**`90구경 투망(E)`을 쓰면 케이틀린은 반대 방향으로 밀려난다.** 먼저 이동기를 쓰지 말고 투망 방향에서 비껴선 뒤, 반동이 끝난 자리로 접근한다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-caitlyn-20260915');

-- jinx 상대법 (622자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-jinx', 'matchup', NULL, NULL, 'published', 'jinx', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 로켓 광역 피해로 뭉치지 않는다 · 지뢰를 넘기 전에 멈춘다 · 첫 처치 관여를 내주지 않는다

## 로켓을 들면 미니언과 거리를 둔다
**징크스의 로켓 공격은 사거리가 길고 대상 주변에도 피해를 준다.**[* [징크스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=116)] 아군 미니언 바로 옆에서 막타를 기다리지 말고 옆으로 벌어져 한 발이 웨이브와 나를 함께 치지 못하게 한다.

## 미니건 중첩이 쌓이기 전에 교환을 끊는다
**미니건은 계속 공격할수록 공격 속도가 오른다.** 첫 두 발만 보고 맞서기보다 징크스가 한 대상을 오래 칠 수 없도록 제어나 거리 조절로 공격 흐름을 끊는다.

## 지뢰는 밟기 전에 돌아간다
**`E` 와작와작 뻥!은 일렬로 놓여 닿은 챔피언을 묶는다.** 억지로 사이를 통과하지 말고 끝을 돌아가며, 이동기 착지점에 깔리면 방향을 바꾼다.

## 낮은 체력 아군을 먼저 빼낸다
**징크스는 처치 관여가 생기면 이동과 공격 속도가 크게 올라 다음 대상을 쫓는다.** 첫 희생을 내주지 않도록 체력이 빠진 아군은 일찍 이탈하고, 발동 전 징크스를 집중한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-jinx' AND kind = 'matchup' AND champion_slug = 'jinx'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-jinx');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-jinx-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-jinx' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 로켓 광역 피해로 뭉치지 않는다 · 지뢰를 넘기 전에 멈춘다 · 첫 처치 관여를 내주지 않는다

## 로켓을 들면 미니언과 거리를 둔다
**징크스의 로켓 공격은 사거리가 길고 대상 주변에도 피해를 준다.**[* [징크스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=116)] 아군 미니언 바로 옆에서 막타를 기다리지 말고 옆으로 벌어져 한 발이 웨이브와 나를 함께 치지 못하게 한다.

## 미니건 중첩이 쌓이기 전에 교환을 끊는다
**미니건은 계속 공격할수록 공격 속도가 오른다.** 첫 두 발만 보고 맞서기보다 징크스가 한 대상을 오래 칠 수 없도록 제어나 거리 조절로 공격 흐름을 끊는다.

## 지뢰는 밟기 전에 돌아간다
**`E` 와작와작 뻥!은 일렬로 놓여 닿은 챔피언을 묶는다.** 억지로 사이를 통과하지 말고 끝을 돌아가며, 이동기 착지점에 깔리면 방향을 바꾼다.

## 낮은 체력 아군을 먼저 빼낸다
**징크스는 처치 관여가 생기면 이동과 공격 속도가 크게 올라 다음 대상을 쫓는다.** 첫 희생을 내주지 않도록 체력이 빠진 아군은 일찍 이탈하고, 발동 전 징크스를 집중한다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-jinx-20260915');

-- ezreal 상대법 (630자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-ezreal', 'matchup', NULL, NULL, 'published', 'ezreal', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 미니언으로 `Q`를 막는다 · `W` 표식이 있으면 후속 공격을 피한다 · `E`가 빠진 뒤 진입한다

## 미니언 뒤에서 `Q` 적중을 줄인다
**이즈리얼의 `신비한 화살(Q)`은 첫 유닛에 멈추고 맞을 때마다 다른 기술의 시간도 당긴다.**[* [이즈리얼 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=15)] 웨이브 옆으로 완전히 노출되지 말고 미니언을 방패로 사용한다.

## `W`가 붙으면 직선 후속 공격을 경계한다
**`정수의 흐름(W)`은 챔피언에 남아 다음 공격이 닿을 때 폭발한다.** 표식이 있는 동안 `Q` 선에서 벗어나고, 이즈리얼이 기본 공격 거리로 들어오면 짧게 맞서 퇴로를 압박한다.

## 앞 `E`를 확인한 뒤 제어를 쓴다
**`비전 이동(E)`은 순간적으로 위치를 바꾸는 핵심 생존기다.** 먼저 중요한 기술을 던지지 말고 이동을 유도한 뒤 착지점에 제어와 피해를 겹친다.

## 궁극기 예고 중에는 같은 선에 서지 않는다
**`정조준 일격(R)`은 긴 준비 뒤 맵을 관통한다.** 귀환하거나 낮은 체력으로 빠질 때 직선을 자주 바꾸고, 여러 명이 한 줄로 이동하지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-ezreal' AND kind = 'matchup' AND champion_slug = 'ezreal'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-ezreal');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-ezreal-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-ezreal' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 미니언으로 `Q`를 막는다 · `W` 표식이 있으면 후속 공격을 피한다 · `E`가 빠진 뒤 진입한다

## 미니언 뒤에서 `Q` 적중을 줄인다
**이즈리얼의 `신비한 화살(Q)`은 첫 유닛에 멈추고 맞을 때마다 다른 기술의 시간도 당긴다.**[* [이즈리얼 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=15)] 웨이브 옆으로 완전히 노출되지 말고 미니언을 방패로 사용한다.

## `W`가 붙으면 직선 후속 공격을 경계한다
**`정수의 흐름(W)`은 챔피언에 남아 다음 공격이 닿을 때 폭발한다.** 표식이 있는 동안 `Q` 선에서 벗어나고, 이즈리얼이 기본 공격 거리로 들어오면 짧게 맞서 퇴로를 압박한다.

## 앞 `E`를 확인한 뒤 제어를 쓴다
**`비전 이동(E)`은 순간적으로 위치를 바꾸는 핵심 생존기다.** 먼저 중요한 기술을 던지지 말고 이동을 유도한 뒤 착지점에 제어와 피해를 겹친다.

## 궁극기 예고 중에는 같은 선에 서지 않는다
**`정조준 일격(R)`은 긴 준비 뒤 맵을 관통한다.** 귀환하거나 낮은 체력으로 빠질 때 직선을 자주 바꾸고, 여러 명이 한 줄로 이동하지 않는다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-ezreal-20260915');

-- jhin 상대법 (635자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-jhin', 'matchup', NULL, NULL, 'published', 'jhin', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 네 번째 탄환에는 막타를 양보한다 · 표식 뒤 `W` 선을 피한다 · 재장전할 때 압박한다

## 탄환 수를 총소리와 표시로 센다
**진의 네 번째 탄환은 강하고 그 뒤에는 반드시 재장전한다.**[* [진 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=129)] 강한 탄환이 준비되면 한 번 물러나 미니언에 쓰게 하고, 재장전이 시작될 때 웨이브와 거리를 되찾는다.

## 낮은 체력 미니언 뒤에 서지 않는다
**`춤추는 유탄(Q)`은 대상을 처치할 때마다 다음 튕김 피해가 커진다.** 연속으로 죽을 미니언과 한 선에 서지 않고, 첫 대상이 처치되지 않을 때만 가까운 막타를 친다.

## 피해를 맞은 직후 `W`를 예상한다
**최근 진이나 아군에게 피해를 받은 상태에서 `살상연희(W)`를 맞으면 속박된다.** 표식이 생기면 미니언 뒤로 숨기보다 직선 옆으로 이동하고, 진의 긴 조준 동작을 본다.

## 궁극기 탄환을 체력 많은 아군과 나눈다
**`커튼 콜(R)`은 멀리서 네 발을 쏘며 낮은 체력 대상에게 더 위협적이다.** 좌우로 방향을 바꾸고, 마지막 탄환은 필요한 경우 체력이 충분한 아군이 대신 막는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-jhin' AND kind = 'matchup' AND champion_slug = 'jhin'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-jhin');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-jhin-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-jhin' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 네 번째 탄환에는 막타를 양보한다 · 표식 뒤 `W` 선을 피한다 · 재장전할 때 압박한다

## 탄환 수를 총소리와 표시로 센다
**진의 네 번째 탄환은 강하고 그 뒤에는 반드시 재장전한다.**[* [진 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=129)] 강한 탄환이 준비되면 한 번 물러나 미니언에 쓰게 하고, 재장전이 시작될 때 웨이브와 거리를 되찾는다.

## 낮은 체력 미니언 뒤에 서지 않는다
**`춤추는 유탄(Q)`은 대상을 처치할 때마다 다음 튕김 피해가 커진다.** 연속으로 죽을 미니언과 한 선에 서지 않고, 첫 대상이 처치되지 않을 때만 가까운 막타를 친다.

## 피해를 맞은 직후 `W`를 예상한다
**최근 진이나 아군에게 피해를 받은 상태에서 `살상연희(W)`를 맞으면 속박된다.** 표식이 생기면 미니언 뒤로 숨기보다 직선 옆으로 이동하고, 진의 긴 조준 동작을 본다.

## 궁극기 탄환을 체력 많은 아군과 나눈다
**`커튼 콜(R)`은 멀리서 네 발을 쏘며 낮은 체력 대상에게 더 위협적이다.** 좌우로 방향을 바꾸고, 마지막 탄환은 필요한 경우 체력이 충분한 아군이 대신 막는다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-jhin-20260915');

-- xayah 상대법 (618자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-xayah', 'matchup', NULL, NULL, 'published', 'xayah', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 자야와 깃털 사이에 서지 않는다 · 세 장이 쌓이면 옆으로 빠진다 · 궁극기 뒤 회수를 기다린다

## 바닥의 깃털을 계속 센다
**자야는 공격과 `Q`로 남긴 깃털을 `깃부르미(E)`로 되불러 경로의 적을 공격한다.**[* [자야 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=136)] 자야와 깃털을 잇는 직선에서 옆으로 벗어나고, 내 뒤에 깃털이 여러 장 남지 않게 위치를 바꾼다.

## 세 장의 회수 선이 생기면 공격을 멈춘다
**여러 깃털이 한꺼번에 지나면 속박까지 이어진다.** 한 대 더 치려고 같은 선에 머물지 말고 회수를 먼저 피한 뒤 `E`가 비는 동안 반격한다.

## `W`가 켜진 동안 긴 기본 공격전을 피한다
**`죽음의 깃(W)`은 자야의 공격 속도와 피해를 높인다.** 효과가 보이면 거리를 벌리고, 끝난 뒤 사거리 우위나 제어를 이용한다.

## 궁극기 착지 뒤 바로 모이지 않는다
**`저항의 비상(R)`은 자야를 잠시 대상으로 지정할 수 없게 하고 새 깃털을 넓게 남긴다.** 착지점을 둘러싸기보다 펼쳐진 깃털의 회수 선부터 피하고 그 다음 공격한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-xayah' AND kind = 'matchup' AND champion_slug = 'xayah'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-xayah');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-xayah-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-xayah' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 자야와 깃털 사이에 서지 않는다 · 세 장이 쌓이면 옆으로 빠진다 · 궁극기 뒤 회수를 기다린다

## 바닥의 깃털을 계속 센다
**자야는 공격과 `Q`로 남긴 깃털을 `깃부르미(E)`로 되불러 경로의 적을 공격한다.**[* [자야 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=136)] 자야와 깃털을 잇는 직선에서 옆으로 벗어나고, 내 뒤에 깃털이 여러 장 남지 않게 위치를 바꾼다.

## 세 장의 회수 선이 생기면 공격을 멈춘다
**여러 깃털이 한꺼번에 지나면 속박까지 이어진다.** 한 대 더 치려고 같은 선에 머물지 말고 회수를 먼저 피한 뒤 `E`가 비는 동안 반격한다.

## `W`가 켜진 동안 긴 기본 공격전을 피한다
**`죽음의 깃(W)`은 자야의 공격 속도와 피해를 높인다.** 효과가 보이면 거리를 벌리고, 끝난 뒤 사거리 우위나 제어를 이용한다.

## 궁극기 착지 뒤 바로 모이지 않는다
**`저항의 비상(R)`은 자야를 잠시 대상으로 지정할 수 없게 하고 새 깃털을 넓게 남긴다.** 착지점을 둘러싸기보다 펼쳐진 깃털의 회수 선부터 피하고 그 다음 공격한다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-xayah-20260915');

-- missfortune 상대법 (631자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-missfortune', 'matchup', NULL, NULL, 'published', 'missfortune', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 낮은 체력 미니언 뒤에 서지 않는다 · 대상 전환 추가 피해를 센다 · 궁극기 원뿔 옆으로 빠진다

## 미니언과 일직선으로 막타를 기다리지 않는다
**미스 포츈의 `Q` 한 발에 두 놈은 첫 대상을 맞힌 뒤 뒤쪽 적에게 튄다.**[* [미스 포츈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=40)] 특히 첫 미니언이 처치될 체력이라면 뒤쪽 탄환이 크게 위협적이므로 옆으로 벌어진다.

## 대상을 바꾼 첫 공격을 가볍게 보지 않는다
**미스 포츈은 새로운 대상을 공격할 때 추가 피해를 준다.** 미니언을 친 뒤 나에게 바꿔 쏘는 한 발을 예상하고, 짧은 교환을 반복해서 공짜로 내주지 않는다.

## 먼저 건드려 활보를 끊는다
**피해를 받지 않으면 `활보(W)`로 빠르게 자리를 잡는다.** 안전한 원거리 공격으로 이동 속도를 끊되, 이를 위해 미니언 밖으로 깊게 나가지는 않는다.

## 궁극기는 뒤보다 옆으로 벗어난다
**`쌍권총 난사(R)`는 정면 원뿔을 지속적으로 공격한다.** 뒤로만 달리면 범위 안에 오래 남으므로 가장 가까운 측면으로 빠지고, 방해 기술이 있다면 정신 집중을 즉시 끊는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-missfortune' AND kind = 'matchup' AND champion_slug = 'missfortune'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-missfortune');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-missfortune-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-missfortune' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 낮은 체력 미니언 뒤에 서지 않는다 · 대상 전환 추가 피해를 센다 · 궁극기 원뿔 옆으로 빠진다

## 미니언과 일직선으로 막타를 기다리지 않는다
**미스 포츈의 `Q` 한 발에 두 놈은 첫 대상을 맞힌 뒤 뒤쪽 적에게 튄다.**[* [미스 포츈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=40)] 특히 첫 미니언이 처치될 체력이라면 뒤쪽 탄환이 크게 위협적이므로 옆으로 벌어진다.

## 대상을 바꾼 첫 공격을 가볍게 보지 않는다
**미스 포츈은 새로운 대상을 공격할 때 추가 피해를 준다.** 미니언을 친 뒤 나에게 바꿔 쏘는 한 발을 예상하고, 짧은 교환을 반복해서 공짜로 내주지 않는다.

## 먼저 건드려 활보를 끊는다
**피해를 받지 않으면 `활보(W)`로 빠르게 자리를 잡는다.** 안전한 원거리 공격으로 이동 속도를 끊되, 이를 위해 미니언 밖으로 깊게 나가지는 않는다.

## 궁극기는 뒤보다 옆으로 벗어난다
**`쌍권총 난사(R)`는 정면 원뿔을 지속적으로 공격한다.** 뒤로만 달리면 범위 안에 오래 남으므로 가장 가까운 측면으로 빠지고, 방해 기술이 있다면 정신 집중을 즉시 끊는다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-missfortune-20260915');

-- ashe 상대법 (612자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-ashe', 'matchup', NULL, NULL, 'published', 'ashe', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 첫 둔화 뒤 거리를 즉시 끊는다 · 미니언으로 `W`를 막는다 · 매가 지나간 뒤 시야 밖 움직임을 한다

## 첫 공격이 닿으면 한 대 더 맞서지 않는다
**애쉬의 공격은 둔화를 걸어 다음 공격 거리를 계속 유지하게 한다.**[* [애쉬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=6)] 첫 화살 뒤 이동기나 제어로 간격을 끊고, 그대로 직선 도주하며 연속 공격을 허용하지 않는다.

## `Q`가 준비된 상태를 확인한다
**애쉬는 공격으로 집중을 쌓은 뒤 `궁사의 집중(Q)`을 켜 연속 공격을 강화한다.** 중첩이 준비되면 짧은 맞교환을 피하고, 효과가 끝난 뒤 접근한다.

## 미니언 뒤에서 `W`의 빈틈을 줄인다
**`일제 사격(W)`은 부채꼴 화살이 각각 첫 대상에 막힌다.** 체력이 충분한 미니언 뒤에 서고, 웨이브 옆이 비면 다시 중앙으로 이동한다.

## 궁극기를 위해 한 줄로 서지 않는다
**`마법의 수정화살(R)`은 멀리서 맞을수록 기절이 길어진다.** 시야가 없는 통로에서 팀과 같은 직선으로 이동하지 말고, 애쉬가 사라지면 귀환 위치도 바꾼다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-ashe' AND kind = 'matchup' AND champion_slug = 'ashe'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-ashe');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-ashe-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-ashe' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 첫 둔화 뒤 거리를 즉시 끊는다 · 미니언으로 `W`를 막는다 · 매가 지나간 뒤 시야 밖 움직임을 한다

## 첫 공격이 닿으면 한 대 더 맞서지 않는다
**애쉬의 공격은 둔화를 걸어 다음 공격 거리를 계속 유지하게 한다.**[* [애쉬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=6)] 첫 화살 뒤 이동기나 제어로 간격을 끊고, 그대로 직선 도주하며 연속 공격을 허용하지 않는다.

## `Q`가 준비된 상태를 확인한다
**애쉬는 공격으로 집중을 쌓은 뒤 `궁사의 집중(Q)`을 켜 연속 공격을 강화한다.** 중첩이 준비되면 짧은 맞교환을 피하고, 효과가 끝난 뒤 접근한다.

## 미니언 뒤에서 `W`의 빈틈을 줄인다
**`일제 사격(W)`은 부채꼴 화살이 각각 첫 대상에 막힌다.** 체력이 충분한 미니언 뒤에 서고, 웨이브 옆이 비면 다시 중앙으로 이동한다.

## 궁극기를 위해 한 줄로 서지 않는다
**`마법의 수정화살(R)`은 멀리서 맞을수록 기절이 길어진다.** 시야가 없는 통로에서 팀과 같은 직선으로 이동하지 말고, 애쉬가 사라지면 귀환 위치도 바꾼다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-ashe-20260915');

-- varus 상대법 (614자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-varus', 'matchup', NULL, NULL, 'published', 'varus', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 역병 중첩이 쌓이면 기술을 피한다 · 충전 `Q`는 옆으로 움직인다 · 사슬이 퍼질 간격을 벌린다

## 기본 공격 뒤의 기술을 더 경계한다
**바루스의 기본 공격은 역병을 남기고 다른 기술이 이를 폭발시켜 최대 체력 비례 피해를 준다.**[* [바루스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=97)] 중첩이 여러 개 쌓이면 한 대 더 맞서지 말고 `Q`와 `E`를 피할 준비를 한다.

## 충전 중인 `Q`와 직각으로 움직인다
**`꿰뚫는 화살(Q)`은 오래 조준할수록 사거리와 피해가 커진다.** 뒤로만 달리지 말고 발사 직전에 옆으로 방향을 바꾸며, 미니언 뒤에서도 관통한다는 점을 잊지 않는다.

## 오염 지면에서 바로 나온다
**`퍼붓는 화살(E)`은 범위를 둔화하고 회복 효과를 줄인다.** 그 안에서 맞대응하지 말고 가장 짧은 경계로 빠진 뒤 교환을 이어 간다.

## 첫 속박 대상과 거리를 둔다
**`부패의 사슬(R)`은 처음 맞은 챔피언에서 가까운 다른 챔피언으로 퍼진다.** 아군이 맞았다면 함께 돕겠다고 붙지 말고 사슬이 닿지 않는 간격을 만든다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-varus' AND kind = 'matchup' AND champion_slug = 'varus'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-varus');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-varus-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-varus' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 역병 중첩이 쌓이면 기술을 피한다 · 충전 `Q`는 옆으로 움직인다 · 사슬이 퍼질 간격을 벌린다

## 기본 공격 뒤의 기술을 더 경계한다
**바루스의 기본 공격은 역병을 남기고 다른 기술이 이를 폭발시켜 최대 체력 비례 피해를 준다.**[* [바루스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=97)] 중첩이 여러 개 쌓이면 한 대 더 맞서지 말고 `Q`와 `E`를 피할 준비를 한다.

## 충전 중인 `Q`와 직각으로 움직인다
**`꿰뚫는 화살(Q)`은 오래 조준할수록 사거리와 피해가 커진다.** 뒤로만 달리지 말고 발사 직전에 옆으로 방향을 바꾸며, 미니언 뒤에서도 관통한다는 점을 잊지 않는다.

## 오염 지면에서 바로 나온다
**`퍼붓는 화살(E)`은 범위를 둔화하고 회복 효과를 줄인다.** 그 안에서 맞대응하지 말고 가장 짧은 경계로 빠진 뒤 교환을 이어 간다.

## 첫 속박 대상과 거리를 둔다
**`부패의 사슬(R)`은 처음 맞은 챔피언에서 가까운 다른 챔피언으로 퍼진다.** 아군이 맞았다면 함께 돕겠다고 붙지 말고 사슬이 닿지 않는 간격을 만든다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-varus-20260915');

-- kaisa 상대법 (612자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-kaisa', 'matchup', NULL, NULL, 'published', 'kaisa', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 미니언과 붙어 `Q`를 나눈다 · 플라즈마 중첩을 초기화한다 · 궁극기 착지점을 남겨 두지 않는다

## 고립된 채 `Q`를 맞지 않는다
**카이사의 `이케시아 폭우(Q)`은 근처 대상들에게 미사일을 나눠 쏜다.**[* [카이사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=140)] 아군 미니언이나 팀원 가까이에서 피해를 분산하고, 혼자 측면에 남지 않는다.

## 플라즈마가 쌓이면 잠시 교환을 끊는다
**기본 공격과 `공허추적자(W)`, 이동 불가 효과는 플라즈마를 쌓아 폭발을 준비한다.** 중첩이 높은 상태에서 한 대를 더 내주지 말고 지속시간이 끝날 때까지 거리를 둔다.

## 긴 `W`를 미니언으로 막는다
**`W`는 첫 대상에 멈추는 장거리 광선이다.** 열린 통로에서 귀환하거나 이동하지 말고 미니언과 앞라인 뒤를 사용한다.

## 궁극기 착지 가능한 원을 의식한다
**`사냥본능(R)`은 플라즈마가 묻은 대상 근처로 카이사를 이동시킨다.** 표식이 있다면 아군 뒤 깊숙이 물러나 카이사가 안전한 옆자리에 착지하지 못하게 하고, 도착 지점에 제어를 남긴다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-kaisa' AND kind = 'matchup' AND champion_slug = 'kaisa'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-kaisa');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-kaisa-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-kaisa' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 미니언과 붙어 `Q`를 나눈다 · 플라즈마 중첩을 초기화한다 · 궁극기 착지점을 남겨 두지 않는다

## 고립된 채 `Q`를 맞지 않는다
**카이사의 `이케시아 폭우(Q)`은 근처 대상들에게 미사일을 나눠 쏜다.**[* [카이사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=140)] 아군 미니언이나 팀원 가까이에서 피해를 분산하고, 혼자 측면에 남지 않는다.

## 플라즈마가 쌓이면 잠시 교환을 끊는다
**기본 공격과 `공허추적자(W)`, 이동 불가 효과는 플라즈마를 쌓아 폭발을 준비한다.** 중첩이 높은 상태에서 한 대를 더 내주지 말고 지속시간이 끝날 때까지 거리를 둔다.

## 긴 `W`를 미니언으로 막는다
**`W`는 첫 대상에 멈추는 장거리 광선이다.** 열린 통로에서 귀환하거나 이동하지 말고 미니언과 앞라인 뒤를 사용한다.

## 궁극기 착지 가능한 원을 의식한다
**`사냥본능(R)`은 플라즈마가 묻은 대상 근처로 카이사를 이동시킨다.** 표식이 있다면 아군 뒤 깊숙이 물러나 카이사가 안전한 옆자리에 착지하지 못하게 하고, 도착 지점에 제어를 남긴다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-kaisa-20260915');

-- aphelios 상대법 (638자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-aphelios', 'matchup', NULL, NULL, 'published', 'aphelios', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 현재 두 무기를 먼저 읽는다 · 탄약이 적으면 다음 무기를 예상한다 · 궁극기 전에 뭉치지 않는다

## 무기 색보다 역할을 말로 확인한다
**아펠리오스는 사거리·회복·둔화·광역 피해·근접 지속 피해가 다른 다섯 무기와 서로 다른 `Q`를 순환한다.**[* [아펠리오스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=147)] 현재 주 무기와 보조 무기가 무엇인지 보고 교환 거리를 바꾼다.

## 탄약이 적은 무기의 마지막 사용을 기다린다
**탄약이 끝나면 다음 무기가 들어오며 전투 역할도 달라진다.** 좋은 조합이 곧 사라진다면 먼저 싸우지 않고 소모를 기다리고, 위험한 다음 조합이 오기 전 압박한다.

## 표식과 파수탑을 그대로 두지 않는다
**만월총 표식은 먼 추가 공격을, 반월검 파수탑은 가까운 지역 압박을 만든다.** 표식이 있으면 사거리 밖으로 빠지고 파수탑은 안전할 때 먼저 제거한다.

## 궁극기 발사 전에 팀 간격을 벌린다
**`월광포화(R)`는 챔피언 적중 뒤 범위로 폭발하고 주 무기 효과를 여러 명에게 적용한다.** 좁은 길에서 겹치지 말고 옆으로 벌어 한 번에 여러 명이 맞지 않게 한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-aphelios' AND kind = 'matchup' AND champion_slug = 'aphelios'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-aphelios');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-aphelios-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-aphelios' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 현재 두 무기를 먼저 읽는다 · 탄약이 적으면 다음 무기를 예상한다 · 궁극기 전에 뭉치지 않는다

## 무기 색보다 역할을 말로 확인한다
**아펠리오스는 사거리·회복·둔화·광역 피해·근접 지속 피해가 다른 다섯 무기와 서로 다른 `Q`를 순환한다.**[* [아펠리오스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=147)] 현재 주 무기와 보조 무기가 무엇인지 보고 교환 거리를 바꾼다.

## 탄약이 적은 무기의 마지막 사용을 기다린다
**탄약이 끝나면 다음 무기가 들어오며 전투 역할도 달라진다.** 좋은 조합이 곧 사라진다면 먼저 싸우지 않고 소모를 기다리고, 위험한 다음 조합이 오기 전 압박한다.

## 표식과 파수탑을 그대로 두지 않는다
**만월총 표식은 먼 추가 공격을, 반월검 파수탑은 가까운 지역 압박을 만든다.** 표식이 있으면 사거리 밖으로 빠지고 파수탑은 안전할 때 먼저 제거한다.

## 궁극기 발사 전에 팀 간격을 벌린다
**`월광포화(R)`는 챔피언 적중 뒤 범위로 폭발하고 주 무기 효과를 여러 명에게 적용한다.** 좁은 길에서 겹치지 말고 옆으로 벌어 한 번에 여러 명이 맞지 않게 한다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-aphelios-20260915');

-- sivir 상대법 (620자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-sivir', 'matchup', NULL, NULL, 'published', 'sivir', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 부메랑 왕복 경로를 두 번 피한다 · 튕김 대상과 떨어진다 · 방어막을 약한 기술로 먼저 뺀다

## 첫 `Q` 뒤 돌아오는 칼날을 다시 본다
**시비르의 `부메랑 검(Q)`은 나간 뒤 다시 돌아오며 두 번 피해를 준다.**[* [시비르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=58)] 첫 타를 피한 방향에 멈추지 말고 시비르가 움직여 바뀐 귀환 선까지 확인한다.

## 아군 미니언과 거리를 둔다
**`튕기는 부메랑(W)`은 첫 대상에서 주변 적으로 연쇄된다.** 막타 미니언 바로 옆에 서지 않고, 활성화가 보이면 웨이브 바깥으로 잠시 벌어진다.

## 가장 큰 기술을 방어막에 주지 않는다
**`주문 방어막(E)`은 적 기술 하나를 막고 성공 시 시비르에게 생존 이득을 준다.** 약한 견제나 위협 동작으로 먼저 사용하게 한 뒤 핵심 제어를 연결한다.

## 궁극기가 켜지면 추격 경로를 정면으로 막지 않는다
**`사냥 개시(R)`는 시비르와 아군의 이동을 빠르게 한다.** 뒤로만 도망가며 따라잡히지 말고 좁은 길을 비운 채 옆으로 흩어져 한 대상에 진입이 몰리지 않게 한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-sivir' AND kind = 'matchup' AND champion_slug = 'sivir'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-sivir');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-sivir-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-sivir' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 부메랑 왕복 경로를 두 번 피한다 · 튕김 대상과 떨어진다 · 방어막을 약한 기술로 먼저 뺀다

## 첫 `Q` 뒤 돌아오는 칼날을 다시 본다
**시비르의 `부메랑 검(Q)`은 나간 뒤 다시 돌아오며 두 번 피해를 준다.**[* [시비르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=58)] 첫 타를 피한 방향에 멈추지 말고 시비르가 움직여 바뀐 귀환 선까지 확인한다.

## 아군 미니언과 거리를 둔다
**`튕기는 부메랑(W)`은 첫 대상에서 주변 적으로 연쇄된다.** 막타 미니언 바로 옆에 서지 않고, 활성화가 보이면 웨이브 바깥으로 잠시 벌어진다.

## 가장 큰 기술을 방어막에 주지 않는다
**`주문 방어막(E)`은 적 기술 하나를 막고 성공 시 시비르에게 생존 이득을 준다.** 약한 견제나 위협 동작으로 먼저 사용하게 한 뒤 핵심 제어를 연결한다.

## 궁극기가 켜지면 추격 경로를 정면으로 막지 않는다
**`사냥 개시(R)`는 시비르와 아군의 이동을 빠르게 한다.** 뒤로만 도망가며 따라잡히지 말고 좁은 길을 비운 채 옆으로 흩어져 한 대상에 진입이 몰리지 않게 한다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-sivir-20260915');

-- lucian 상대법 (610자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-lucian', 'matchup', NULL, NULL, 'published', 'lucian', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 기술 뒤 두 발을 계산한다 · 미니언 관통 `Q` 선을 피한다 · `E`가 빠진 뒤 제어한다

## 기술 하나를 두 발의 시작으로 본다
**루시안은 기술을 쓴 뒤 다음 기본 공격에서 두 발을 연속으로 쏜다.**[* [루시안 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=115)] 기술 피해만 맞고 끝났다고 생각하지 말고 두 발 사거리에서 즉시 벗어난다.

## 내 앞 미니언과 일직선으로 서지 않는다
**`꿰뚫는 빛(Q)`은 지정한 대상을 관통해 뒤쪽까지 닿는다.** 낮은 체력 미니언 뒤에서 막타를 기다리지 말고 옆으로 움직여 관통 견제와 막타를 동시에 주지 않는다.

## `W` 표식 뒤의 이동 속도를 끊는다
**`타는 불길(W)`에 맞은 대상을 공격하면 루시안이 빨라진다.** 표식이 남은 동안 거리를 늘리고, 첫 공격을 허용했다면 직선 추격을 제어나 둔화로 끊는다.

## 돌진 착지점에 기술을 남긴다
**`끈질긴 추격(E)`은 루시안의 핵심 회피 수단이며 두 발 공격으로 다시 준비된다.** 먼저 큰 기술을 쓰지 말고 돌진을 유도한 뒤 다음 움직임을 제한한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-lucian' AND kind = 'matchup' AND champion_slug = 'lucian'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-lucian');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-lucian-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-lucian' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 기술 뒤 두 발을 계산한다 · 미니언 관통 `Q` 선을 피한다 · `E`가 빠진 뒤 제어한다

## 기술 하나를 두 발의 시작으로 본다
**루시안은 기술을 쓴 뒤 다음 기본 공격에서 두 발을 연속으로 쏜다.**[* [루시안 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=115)] 기술 피해만 맞고 끝났다고 생각하지 말고 두 발 사거리에서 즉시 벗어난다.

## 내 앞 미니언과 일직선으로 서지 않는다
**`꿰뚫는 빛(Q)`은 지정한 대상을 관통해 뒤쪽까지 닿는다.** 낮은 체력 미니언 뒤에서 막타를 기다리지 말고 옆으로 움직여 관통 견제와 막타를 동시에 주지 않는다.

## `W` 표식 뒤의 이동 속도를 끊는다
**`타는 불길(W)`에 맞은 대상을 공격하면 루시안이 빨라진다.** 표식이 남은 동안 거리를 늘리고, 첫 공격을 허용했다면 직선 추격을 제어나 둔화로 끊는다.

## 돌진 착지점에 기술을 남긴다
**`끈질긴 추격(E)`은 루시안의 핵심 회피 수단이며 두 발 공격으로 다시 준비된다.** 먼저 큰 기술을 쓰지 말고 돌진을 유도한 뒤 다음 움직임을 제한한다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-lucian-20260915');

-- draven 상대법 (627자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-draven', 'matchup', NULL, NULL, 'published', 'draven', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 도끼 낙하점을 먼저 노린다 · 도끼를 포기하게 거리를 바꾼다 · 돌아오는 궁극기 선을 피한다

## 공중의 도끼 표시를 공격 예고로 본다
**드레이븐은 `회전 도끼(Q)`가 떨어질 위치로 움직여야 강화 공격을 계속 유지한다.**[* [드레이븐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=99)] 낙하점에 견제나 제어를 미리 두고, 그 자리가 위험하면 도끼를 포기하게 만든다.

## 도끼를 잡은 직후의 속도를 경계한다
**도끼를 회수하면 `광기의 피(W)`를 다시 쓸 수 있다.** 한 번 둔화했다고 안심하지 말고 다음 낙하점까지 따라오는 속도를 계산해 거리를 더 벌린다.

## 진입 기술을 `E`에 먼저 내주지 않는다
**`비켜서라(E)`는 적을 옆으로 밀고 둔화해 돌진을 끊을 수 있다.** 약한 접근으로 사용을 유도한 뒤 핵심 이동기를 쓰거나, 투사체가 지나간 다음 진입한다.

## 궁극기는 왕복 경로를 두 번 피한다
**`죽음의 소용돌이(R)`는 챔피언을 맞힌 뒤 돌아오거나 드레이븐이 일찍 회수할 수 있다.** 첫 도끼 옆으로 피한 뒤 드레이븐과 나를 잇는 귀환 선에서도 다시 벗어난다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-draven' AND kind = 'matchup' AND champion_slug = 'draven'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-draven');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-draven-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-draven' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 도끼 낙하점을 먼저 노린다 · 도끼를 포기하게 거리를 바꾼다 · 돌아오는 궁극기 선을 피한다

## 공중의 도끼 표시를 공격 예고로 본다
**드레이븐은 `회전 도끼(Q)`가 떨어질 위치로 움직여야 강화 공격을 계속 유지한다.**[* [드레이븐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=99)] 낙하점에 견제나 제어를 미리 두고, 그 자리가 위험하면 도끼를 포기하게 만든다.

## 도끼를 잡은 직후의 속도를 경계한다
**도끼를 회수하면 `광기의 피(W)`를 다시 쓸 수 있다.** 한 번 둔화했다고 안심하지 말고 다음 낙하점까지 따라오는 속도를 계산해 거리를 더 벌린다.

## 진입 기술을 `E`에 먼저 내주지 않는다
**`비켜서라(E)`는 적을 옆으로 밀고 둔화해 돌진을 끊을 수 있다.** 약한 접근으로 사용을 유도한 뒤 핵심 이동기를 쓰거나, 투사체가 지나간 다음 진입한다.

## 궁극기는 왕복 경로를 두 번 피한다
**`죽음의 소용돌이(R)`는 챔피언을 맞힌 뒤 돌아오거나 드레이븐이 일찍 회수할 수 있다.** 첫 도끼 옆으로 피한 뒤 드레이븐과 나를 잇는 귀환 선에서도 다시 벗어난다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-draven-20260915');

-- kogmaw 상대법 (632자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-kogmaw', 'matchup', NULL, NULL, 'published', 'kogmaw', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — `W`가 켜진 동안 거리를 끊는다 · `Q` 적중 뒤 앞라인을 내주지 않는다 · 궁극기 연사를 움직임으로 비싸게 만든다

## `W` 지속시간에 맞대응하지 않는다
**코그모의 `생체마법 폭격(W)`은 사거리와 최대 체력 비례 피해를 높인다.**[* [코그모 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=32)] 효과가 켜지면 시야나 지형 뒤로 빠지고, 끝난 뒤 짧아진 공격 거리에서 진입한다.

## `Q`를 맞은 대상을 보호한다
**`부식성 침(Q)`은 방어력과 마법 저항력을 낮춘다.** 약화된 앞라인이 계속 맞지 않도록 대상을 교대하고, 투사체를 피한 뒤에만 정면 교전을 연다.

## 분비물 흔적에서 옆으로 나온다
**`공허의 분비물(E)`은 긴 지면을 남겨 이동을 늦춘다.** 흔적을 따라 뒤로만 달리지 말고 가장 가까운 옆 경계로 빠져 코그모의 공격 시간을 줄인다.

## 궁극기 그림자가 생길 때마다 방향을 바꾼다
**`살아있는 곡사포(R)`는 낮은 체력 적에게 강하지만 연속 사용 비용이 커진다.** 일정한 방향으로 걷지 말고 매 발 사이 움직임을 바꿔 빗나가게 하며, 연사가 끝난 뒤 접근한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-kogmaw' AND kind = 'matchup' AND champion_slug = 'kogmaw'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-kogmaw');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-kogmaw-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-kogmaw' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — `W`가 켜진 동안 거리를 끊는다 · `Q` 적중 뒤 앞라인을 내주지 않는다 · 궁극기 연사를 움직임으로 비싸게 만든다

## `W` 지속시간에 맞대응하지 않는다
**코그모의 `생체마법 폭격(W)`은 사거리와 최대 체력 비례 피해를 높인다.**[* [코그모 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=32)] 효과가 켜지면 시야나 지형 뒤로 빠지고, 끝난 뒤 짧아진 공격 거리에서 진입한다.

## `Q`를 맞은 대상을 보호한다
**`부식성 침(Q)`은 방어력과 마법 저항력을 낮춘다.** 약화된 앞라인이 계속 맞지 않도록 대상을 교대하고, 투사체를 피한 뒤에만 정면 교전을 연다.

## 분비물 흔적에서 옆으로 나온다
**`공허의 분비물(E)`은 긴 지면을 남겨 이동을 늦춘다.** 흔적을 따라 뒤로만 달리지 말고 가장 가까운 옆 경계로 빠져 코그모의 공격 시간을 줄인다.

## 궁극기 그림자가 생길 때마다 방향을 바꾼다
**`살아있는 곡사포(R)`는 낮은 체력 적에게 강하지만 연속 사용 비용이 커진다.** 일정한 방향으로 걷지 말고 매 발 사이 움직임을 바꿔 빗나가게 하며, 연사가 끝난 뒤 접근한다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-kogmaw-20260915');

-- twitch 상대법 (603자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-twitch', 'matchup', NULL, NULL, 'published', 'twitch', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 사라진 위치보다 나타날 측면을 본다 · 맹독 중첩에서 물러난다 · 궁극기 앞에 한 줄로 서지 않는다

## `Q`가 보이면 측면 시야를 먼저 잡는다
**트위치는 `매복(Q)`으로 위장한 뒤 나타나며 공격 속도를 얻는다.**[* [트위치 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=68)] 마지막으로 본 자리만 쫓지 말고 수풀과 뒤쪽 진입로를 밝히며, 혼자 웨이브를 받지 않는다.

## 독약 병 안에서 오래 싸우지 않는다
**`독약 병(W)`은 범위를 둔화하고 맹독 중첩을 쌓기 쉽게 한다.** 가장 짧은 경계로 나온 뒤 중첩이 사라질 시간을 만들고, 병 안에서 직선 추격을 허용하지 않는다.

## 맹독이 많이 쌓이면 `E` 전에 이탈한다
**`오염(E)`은 대상의 맹독 중첩에 비례해 강해진다.** 체력만 보고 한 대 더 맞서지 말고 표식 수가 늘면 사거리 밖으로 빠진다.

## 궁극기 관통선을 흩뜨린다
**`무차별 난사(R)`는 사거리가 길고 여러 적을 관통한다.** 팀이 앞뒤 한 줄로 서지 않고 좌우로 벌어져 한 발이 모두를 지나지 못하게 한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-twitch' AND kind = 'matchup' AND champion_slug = 'twitch'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-twitch');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-twitch-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-twitch' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 사라진 위치보다 나타날 측면을 본다 · 맹독 중첩에서 물러난다 · 궁극기 앞에 한 줄로 서지 않는다

## `Q`가 보이면 측면 시야를 먼저 잡는다
**트위치는 `매복(Q)`으로 위장한 뒤 나타나며 공격 속도를 얻는다.**[* [트위치 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=68)] 마지막으로 본 자리만 쫓지 말고 수풀과 뒤쪽 진입로를 밝히며, 혼자 웨이브를 받지 않는다.

## 독약 병 안에서 오래 싸우지 않는다
**`독약 병(W)`은 범위를 둔화하고 맹독 중첩을 쌓기 쉽게 한다.** 가장 짧은 경계로 나온 뒤 중첩이 사라질 시간을 만들고, 병 안에서 직선 추격을 허용하지 않는다.

## 맹독이 많이 쌓이면 `E` 전에 이탈한다
**`오염(E)`은 대상의 맹독 중첩에 비례해 강해진다.** 체력만 보고 한 대 더 맞서지 말고 표식 수가 늘면 사거리 밖으로 빠진다.

## 궁극기 관통선을 흩뜨린다
**`무차별 난사(R)`는 사거리가 길고 여러 적을 관통한다.** 팀이 앞뒤 한 줄로 서지 않고 좌우로 벌어져 한 발이 모두를 지나지 못하게 한다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-twitch-20260915');

-- vayne 상대법 (621자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-vayne', 'matchup', NULL, NULL, 'published', 'vayne', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 은화살 세 번째 공격 전에 거리를 끊는다 · 벽을 등지지 않는다 · 궁극기 구르기 뒤 위치를 다시 찾는다

## 같은 대상 세 번째 타격을 내주지 않는다
**베인의 `은화살(W)`은 같은 대상에 세 번째 공격이나 기술이 닿으면 최대 체력 비례 고정 피해를 준다.**[* [베인 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=71)] 두 중첩이 보이면 앞으로 맞서지 말고 표식이 사라질 때까지 거리를 둔다.

## 구르기 방향의 다음 공격을 예상한다
**`Q` 구르기는 짧게 이동하고 다음 공격을 강화한다.** 베인이 옆으로 구르면 그 방향으로 따라가기보다 사거리 밖 반대쪽으로 움직여 세 번째 타격 연결을 끊는다.

## 벽과 베인 사이에 서지 않는다
**`선고(E)`는 대상을 밀어 지형에 부딪히면 기절시킨다.** 수풀과 벽 가까이에서 정면 교환하지 말고 열린 쪽으로 비스듬히 선다.

## 궁극기 중 구르기 직후 기술을 서두르지 않는다
**`결전의 시간(R)` 동안 베인은 구를 때 잠시 모습을 숨긴다.** 사라진 위치에 기술을 모두 쓰지 말고 다시 나타나는 방향을 확인해 제어를 맞춘다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-vayne' AND kind = 'matchup' AND champion_slug = 'vayne'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-vayne');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-vayne-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-vayne' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 은화살 세 번째 공격 전에 거리를 끊는다 · 벽을 등지지 않는다 · 궁극기 구르기 뒤 위치를 다시 찾는다

## 같은 대상 세 번째 타격을 내주지 않는다
**베인의 `은화살(W)`은 같은 대상에 세 번째 공격이나 기술이 닿으면 최대 체력 비례 고정 피해를 준다.**[* [베인 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=71)] 두 중첩이 보이면 앞으로 맞서지 말고 표식이 사라질 때까지 거리를 둔다.

## 구르기 방향의 다음 공격을 예상한다
**`Q` 구르기는 짧게 이동하고 다음 공격을 강화한다.** 베인이 옆으로 구르면 그 방향으로 따라가기보다 사거리 밖 반대쪽으로 움직여 세 번째 타격 연결을 끊는다.

## 벽과 베인 사이에 서지 않는다
**`선고(E)`는 대상을 밀어 지형에 부딪히면 기절시킨다.** 수풀과 벽 가까이에서 정면 교환하지 말고 열린 쪽으로 비스듬히 선다.

## 궁극기 중 구르기 직후 기술을 서두르지 않는다
**`결전의 시간(R)` 동안 베인은 구를 때 잠시 모습을 숨긴다.** 사라진 위치에 기술을 모두 쓰지 말고 다시 나타나는 방향을 확인해 제어를 맞춘다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-vayne-20260915');

-- samira 상대법 (616자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-samira', 'matchup', NULL, NULL, 'published', 'samira', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 스타일 등급을 끊는다 · 투사체를 `W`에 겹치지 않는다 · 낮은 체력 아군을 돌진 발판으로 남기지 않는다

## 서로 다른 공격의 연속을 끊는다
**사미라는 기본 공격과 기술을 다르게 이어 맞힐수록 스타일 등급을 올려 궁극기를 연다.**[* [사미라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=151)] 짧은 제어와 거리 조절로 다음 공격이 닿지 않게 해 연속을 초기화한다.

## 투사체를 한 박자에 몰아 쓰지 않는다
**`원형 검무(W)`는 주변의 적 투사체를 파괴한다.** 먼저 약한 탄환으로 사용을 유도하고, 검무가 끝난 뒤 속박이나 큰 원거리 기술을 발사한다.

## 돌진 뒤쪽에 낮은 체력 대상을 두지 않는다
**`거침없는 질주(E)`는 대상을 통과하고 처치 관여 시 다시 사용할 수 있다.** 체력이 낮은 아군은 진형 뒤 일직선에 남지 말고 옆으로 빠져 연쇄 진입을 막는다.

## S등급이 되면 서로 벌어진다
**`지옥불 난사(R)`는 주변 모든 적을 지속 공격한다.** 등급이 완성되면 사미라 근처에 모이지 않고, 방해 가능한 제어를 검무가 끝난 뒤까지 남긴다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-samira' AND kind = 'matchup' AND champion_slug = 'samira'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-samira');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-samira-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-samira' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 스타일 등급을 끊는다 · 투사체를 `W`에 겹치지 않는다 · 낮은 체력 아군을 돌진 발판으로 남기지 않는다

## 서로 다른 공격의 연속을 끊는다
**사미라는 기본 공격과 기술을 다르게 이어 맞힐수록 스타일 등급을 올려 궁극기를 연다.**[* [사미라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=151)] 짧은 제어와 거리 조절로 다음 공격이 닿지 않게 해 연속을 초기화한다.

## 투사체를 한 박자에 몰아 쓰지 않는다
**`원형 검무(W)`는 주변의 적 투사체를 파괴한다.** 먼저 약한 탄환으로 사용을 유도하고, 검무가 끝난 뒤 속박이나 큰 원거리 기술을 발사한다.

## 돌진 뒤쪽에 낮은 체력 대상을 두지 않는다
**`거침없는 질주(E)`는 대상을 통과하고 처치 관여 시 다시 사용할 수 있다.** 체력이 낮은 아군은 진형 뒤 일직선에 남지 말고 옆으로 빠져 연쇄 진입을 막는다.

## S등급이 되면 서로 벌어진다
**`지옥불 난사(R)`는 주변 모든 적을 지속 공격한다.** 등급이 완성되면 사미라 근처에 모이지 않고, 방해 가능한 제어를 검무가 끝난 뒤까지 남긴다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-samira-20260915');

-- zeri 상대법 (587자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-zeri', 'matchup', NULL, NULL, 'published', 'zeri', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 미니언으로 `Q`를 막는다 · 벽 근처 레이저 각을 피한다 · 긴 벽을 등지고 싸우지 않는다

## 미니언을 사이에 두고 `Q`를 막는다
**제리의 `집중 사격(Q)`은 첫 대상에 맞는 여러 탄환이며 기본 공격으로 취급된다.**[* [제리 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=158)] 열린 옆길로 나가지 말고 미니언 뒤에서 탄환을 대신 맞게 한다.

## 충전된 기본 공격을 확인한다
**제리는 이동과 `Q`로 별도 기본 공격을 충전하고 가득 찼을 때 강한 피해를 준다.** 충전 표시가 찼다면 짧은 견제를 피하고 미니언에 소비된 뒤 접근한다.

## 벽과 일직선에서 `W`를 기다리지 않는다
**`초강력 레이저(W)`는 지형에 닿으면 벽 너머 넓은 공격으로 바뀐다.** 벽 바로 뒤에 숨는 대신 벽 끝에서 비스듬히 떨어져 확산 선을 피한다.

## 긴 지형 옆에서는 퇴로를 먼저 막는다
**`스파크 돌진(E)`은 맞닿은 벽을 길게 넘어간다.** 제리와 벽 사이에서 싸우지 말고 반대편 시야를 확보해 도착점을 압박한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-zeri' AND kind = 'matchup' AND champion_slug = 'zeri'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-zeri');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-zeri-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-zeri' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 미니언으로 `Q`를 막는다 · 벽 근처 레이저 각을 피한다 · 긴 벽을 등지고 싸우지 않는다

## 미니언을 사이에 두고 `Q`를 막는다
**제리의 `집중 사격(Q)`은 첫 대상에 맞는 여러 탄환이며 기본 공격으로 취급된다.**[* [제리 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=158)] 열린 옆길로 나가지 말고 미니언 뒤에서 탄환을 대신 맞게 한다.

## 충전된 기본 공격을 확인한다
**제리는 이동과 `Q`로 별도 기본 공격을 충전하고 가득 찼을 때 강한 피해를 준다.** 충전 표시가 찼다면 짧은 견제를 피하고 미니언에 소비된 뒤 접근한다.

## 벽과 일직선에서 `W`를 기다리지 않는다
**`초강력 레이저(W)`는 지형에 닿으면 벽 너머 넓은 공격으로 바뀐다.** 벽 바로 뒤에 숨는 대신 벽 끝에서 비스듬히 떨어져 확산 선을 피한다.

## 긴 지형 옆에서는 퇴로를 먼저 막는다
**`스파크 돌진(E)`은 맞닿은 벽을 길게 넘어간다.** 제리와 벽 사이에서 싸우지 말고 반대편 시야를 확보해 도착점을 압박한다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-zeri-20260915');

-- kalista 상대법 (609자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-kalista', 'matchup', NULL, NULL, 'published', 'kalista', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 도약 착지점을 겨냥한다 · 창 중첩이 쌓이면 물러난다 · 계약자와 같은 대상이 되지 않는다

## 현재 위치보다 다음 착지점을 공격한다
**칼리스타는 기본 공격과 `Q` 뒤 이동 방향으로 도약한다.**[* [칼리스타 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=122)] 투사체를 몸에 바로 겨누기보다 반복해서 움직일 방향 앞에 두고, 둔화로 도약 거리를 줄인다.

## 창이 여러 개 박히면 교환을 끝낸다
**`뽑아 찢기(E)`는 대상에 쌓인 창이 많을수록 강하고 둔화까지 건다.** 체력이 충분해 보여도 중첩이 높다면 사거리 밖으로 나가며, 막타 초기화로 다시 쓸 수 있음을 본다.

## 계약자와 동시에 맞지 않는다
**칼리스타와 계약자가 같은 대상을 공격하면 추가 피해가 생긴다.** 두 명의 공격 범위가 겹치는 곳에서 맞서지 말고 한쪽이 떨어진 순간에 교환한다.

## 궁극기 뒤 계약자의 착지점을 비운다
**`운명의 부름(R)`은 계약자를 보호한 뒤 원하는 방향으로 돌진시켜 적을 밀어낸다.** 칼리스타만 쫓지 말고 계약자가 날아올 경로에서 옆으로 벌어진다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-kalista' AND kind = 'matchup' AND champion_slug = 'kalista'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-kalista');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-kalista-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-kalista' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 도약 착지점을 겨냥한다 · 창 중첩이 쌓이면 물러난다 · 계약자와 같은 대상이 되지 않는다

## 현재 위치보다 다음 착지점을 공격한다
**칼리스타는 기본 공격과 `Q` 뒤 이동 방향으로 도약한다.**[* [칼리스타 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=122)] 투사체를 몸에 바로 겨누기보다 반복해서 움직일 방향 앞에 두고, 둔화로 도약 거리를 줄인다.

## 창이 여러 개 박히면 교환을 끝낸다
**`뽑아 찢기(E)`는 대상에 쌓인 창이 많을수록 강하고 둔화까지 건다.** 체력이 충분해 보여도 중첩이 높다면 사거리 밖으로 나가며, 막타 초기화로 다시 쓸 수 있음을 본다.

## 계약자와 동시에 맞지 않는다
**칼리스타와 계약자가 같은 대상을 공격하면 추가 피해가 생긴다.** 두 명의 공격 범위가 겹치는 곳에서 맞서지 말고 한쪽이 떨어진 순간에 교환한다.

## 궁극기 뒤 계약자의 착지점을 비운다
**`운명의 부름(R)`은 계약자를 보호한 뒤 원하는 방향으로 돌진시켜 적을 밀어낸다.** 칼리스타만 쫓지 말고 계약자가 날아올 경로에서 옆으로 벌어진다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-kalista-20260915');

-- nilah 상대법 (595자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-nilah', 'matchup', NULL, NULL, 'published', 'nilah', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — `Q`가 빗나간 순간 사거리 우위를 쓴다 · 장막 동안 기본 공격을 멈춘다 · 두 번째 돌진까지 센다

## `Q` 적중 여부로 교환 거리를 바꾼다
**닐라는 `무형의 검(Q)`을 맞히면 공격 사거리가 잠시 늘어난다.**[* [닐라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=161)] 적중했을 때는 물러나고, 빗나가 짧은 사거리로 돌아간 순간 원거리 공격을 넣는다.

## 장막에 기본 공격을 낭비하지 않는다
**`승리의 장막(W)`은 닐라와 닿은 아군이 기본 공격을 피하게 한다.** 효과가 보이면 공격을 멈추고 기술 피해나 거리 조절로 시간을 흘린다.

## 첫 돌진 뒤 두 번째를 기다린다
**`급류(E)`는 충전을 나눠 연속으로 접근할 수 있다.** 첫 이동만 보고 도주 기술을 모두 쓰지 말고, 두 번째 방향이 정해진 뒤 제어한다.

## 궁극기 전에 서로 붙지 않는다
**`환희(R)`는 주변 적을 공격하고 가까이 끌어당긴다.** 닐라가 들어올 때 좌우로 벌어져 여러 명이 함께 맞지 않게 하고, 정신 집중 구간에 제어를 겹친다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-nilah' AND kind = 'matchup' AND champion_slug = 'nilah'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-nilah');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-nilah-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-nilah' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — `Q`가 빗나간 순간 사거리 우위를 쓴다 · 장막 동안 기본 공격을 멈춘다 · 두 번째 돌진까지 센다

## `Q` 적중 여부로 교환 거리를 바꾼다
**닐라는 `무형의 검(Q)`을 맞히면 공격 사거리가 잠시 늘어난다.**[* [닐라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=161)] 적중했을 때는 물러나고, 빗나가 짧은 사거리로 돌아간 순간 원거리 공격을 넣는다.

## 장막에 기본 공격을 낭비하지 않는다
**`승리의 장막(W)`은 닐라와 닿은 아군이 기본 공격을 피하게 한다.** 효과가 보이면 공격을 멈추고 기술 피해나 거리 조절로 시간을 흘린다.

## 첫 돌진 뒤 두 번째를 기다린다
**`급류(E)`는 충전을 나눠 연속으로 접근할 수 있다.** 첫 이동만 보고 도주 기술을 모두 쓰지 말고, 두 번째 방향이 정해진 뒤 제어한다.

## 궁극기 전에 서로 붙지 않는다
**`환희(R)`는 주변 적을 공격하고 가까이 끌어당긴다.** 닐라가 들어올 때 좌우로 벌어져 여러 명이 함께 맞지 않게 하고, 정신 집중 구간에 제어를 겹친다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-nilah-20260915');

-- smolder 상대법 (618자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-smolder', 'matchup', NULL, NULL, 'published', 'smolder', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — `Q` 막타를 편하게 주지 않는다 · `W` 폭발 범위에서 벌어진다 · `E`가 끝날 벽 너머를 압박한다

## `Q`로 막타와 견제를 함께 얻지 못하게 한다
**스몰더는 `초강력 화염 숨결(Q)`로 유닛을 처치하거나 챔피언을 맞혀 영구 중첩을 쌓는다.**[* [스몰더 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=167)] 낮은 체력 미니언 옆에서 맞지 말고, `Q`를 챔피언에 썼다면 그동안 막타를 압박한다.

## `W`를 맞은 아군에게서 떨어진다
**`에취!(W)`는 챔피언에 맞으면 주변으로 폭발한다.** 투사체를 좌우로 피하고, 한 명이 맞았다면 곁으로 모이지 않아 추가 피해를 줄인다.

## `E`가 시작되면 도착 지점을 본다
**`펄럭펄럭(E)`은 지형을 넘어 이동하며 주변 적을 공격한다.** 스몰더를 벽 안에서 쫓지 말고 반대편 출구로 이동해 끝나는 위치를 압박한다.

## 궁극기 중앙선에서 비껴선다
**스몰더의 궁극기는 긴 직선으로 지나가며 중앙 경로에서 자신을 회복할 수 있다.** 스몰더와 같은 선에 서지 않고 옆으로 빠져 피해와 회복을 동시에 주지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-smolder' AND kind = 'matchup' AND champion_slug = 'smolder'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-smolder');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-smolder-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-smolder' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — `Q` 막타를 편하게 주지 않는다 · `W` 폭발 범위에서 벌어진다 · `E`가 끝날 벽 너머를 압박한다

## `Q`로 막타와 견제를 함께 얻지 못하게 한다
**스몰더는 `초강력 화염 숨결(Q)`로 유닛을 처치하거나 챔피언을 맞혀 영구 중첩을 쌓는다.**[* [스몰더 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=167)] 낮은 체력 미니언 옆에서 맞지 말고, `Q`를 챔피언에 썼다면 그동안 막타를 압박한다.

## `W`를 맞은 아군에게서 떨어진다
**`에취!(W)`는 챔피언에 맞으면 주변으로 폭발한다.** 투사체를 좌우로 피하고, 한 명이 맞았다면 곁으로 모이지 않아 추가 피해를 줄인다.

## `E`가 시작되면 도착 지점을 본다
**`펄럭펄럭(E)`은 지형을 넘어 이동하며 주변 적을 공격한다.** 스몰더를 벽 안에서 쫓지 말고 반대편 출구로 이동해 끝나는 위치를 압박한다.

## 궁극기 중앙선에서 비껴선다
**스몰더의 궁극기는 긴 직선으로 지나가며 중앙 경로에서 자신을 회복할 수 있다.** 스몰더와 같은 선에 서지 않고 옆으로 빠져 피해와 회복을 동시에 주지 않는다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-smolder-20260915');

-- senna 상대법 (610자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-senna', 'matchup', NULL, NULL, 'published', 'senna', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 영혼을 먹는 순간을 압박한다 · `Q` 관통선에서 벗어난다 · 속박 대상과 거리를 둔다

## 영혼을 주우러 오는 순간을 노린다
**세나는 쓰러진 적에게서 나온 영혼을 모으기 위해 잠시 정해진 위치로 접근한다.**[* [세나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=146)] 위험한 영혼 주변에 견제 범위를 만들고, 이를 먹는 동작에 맞춰 공격한다.

## 아군과 적을 한 줄에 두지 않는다
**`꿰뚫는 어둠(Q)`은 대상을 관통하며 아군은 회복하고 적은 공격한다.** 세나와 아군 미니언의 연장선에서 비켜나 한 번에 막타와 견제를 주지 않는다.

## `W`가 붙은 대상에게서 먼저 떨어진다
**`마지막 포옹(W)`은 첫 대상에 붙은 뒤 주변까지 속박한다.** 아군이 맞으면 구하러 붙지 말고 폭발 범위 밖으로 벌어진 뒤 세나를 압박한다.

## 안개 속 형체에 중요한 기술을 쓰지 않는다
**`검은 안개의 저주(E)` 안의 아군은 정체를 숨기고 대상으로 지정하기 어려워진다.** 범위 밖으로 나올 때까지 지정 기술을 아끼고, 안개 전체를 범위 공격으로 견제한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-senna' AND kind = 'matchup' AND champion_slug = 'senna'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-senna');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-senna-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-senna' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 영혼을 먹는 순간을 압박한다 · `Q` 관통선에서 벗어난다 · 속박 대상과 거리를 둔다

## 영혼을 주우러 오는 순간을 노린다
**세나는 쓰러진 적에게서 나온 영혼을 모으기 위해 잠시 정해진 위치로 접근한다.**[* [세나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=146)] 위험한 영혼 주변에 견제 범위를 만들고, 이를 먹는 동작에 맞춰 공격한다.

## 아군과 적을 한 줄에 두지 않는다
**`꿰뚫는 어둠(Q)`은 대상을 관통하며 아군은 회복하고 적은 공격한다.** 세나와 아군 미니언의 연장선에서 비켜나 한 번에 막타와 견제를 주지 않는다.

## `W`가 붙은 대상에게서 먼저 떨어진다
**`마지막 포옹(W)`은 첫 대상에 붙은 뒤 주변까지 속박한다.** 아군이 맞으면 구하러 붙지 말고 폭발 범위 밖으로 벌어진 뒤 세나를 압박한다.

## 안개 속 형체에 중요한 기술을 쓰지 않는다
**`검은 안개의 저주(E)` 안의 아군은 정체를 숨기고 대상으로 지정하기 어려워진다.** 범위 밖으로 나올 때까지 지정 기술을 아끼고, 안개 전체를 범위 공격으로 견제한다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-senna-20260915');

-- yunara 상대법 (587자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-yunara', 'matchup', NULL, NULL, 'published', 'yunara', '', 0, '16.17.1', 'guarded', '2026-09-15T09:00:00.000Z', '2026-09-15T09:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 방출이 찼을 때 물러난다 · 회전 구슬의 옆으로 피한다 · 초월 지속시간을 먼저 흘린다

## 방출을 모으는 공격 횟수를 본다
**유나라는 기본 공격으로 방출을 쌓고 `영혼 단련(Q)`에서 소모해 공격을 강화한다.**[* [유나라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=171)] 중첩이 준비되면 짧은 기본 공격전을 피하고, 활성화가 끝난 뒤 웨이브를 압박한다.

## `Q` 중에는 미니언과 붙지 않는다
**강화된 기본 공격은 주변 적에게도 퍼진다.** 아군 미니언이나 팀원과 거리를 벌려 한 발이 여러 대상을 함께 치지 못하게 한다.

## `W` 구슬과 직각으로 움직인다
**`심판의 궤적(W)`은 회전하며 전진해 적을 둔화한다.** 뒤로 같은 선을 따라 달리지 말고 옆으로 빠져 후속 기본 공격 거리를 끊는다.

## 초월 상태에서는 강화 `E`까지 기다린다
**`자기 초월(R)`은 기본 기술을 강화하고 `E`를 돌진으로 바꾼다.** 첫 이동을 확인하기 전에 제어를 쓰지 말고, 지속시간을 거리로 흘린 뒤 반격한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-yunara' AND kind = 'matchup' AND champion_slug = 'yunara'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-yunara');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-adc-matchup-yunara-20260915', id, NULL, 0, general, '원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-yunara' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 방출이 찼을 때 물러난다 · 회전 구슬의 옆으로 피한다 · 초월 지속시간을 먼저 흘린다

## 방출을 모으는 공격 횟수를 본다
**유나라는 기본 공격으로 방출을 쌓고 `영혼 단련(Q)`에서 소모해 공격을 강화한다.**[* [유나라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=171)] 중첩이 준비되면 짧은 기본 공격전을 피하고, 활성화가 끝난 뒤 웨이브를 압박한다.

## `Q` 중에는 미니언과 붙지 않는다
**강화된 기본 공격은 주변 적에게도 퍼진다.** 아군 미니언이나 팀원과 거리를 벌려 한 발이 여러 대상을 함께 치지 못하게 한다.

## `W` 구슬과 직각으로 움직인다
**`심판의 궤적(W)`은 회전하며 전진해 적을 둔화한다.** 뒤로 같은 선을 따라 달리지 말고 옆으로 빠져 후속 기본 공격 거리를 끊는다.

## 초월 상태에서는 강화 `E`까지 기다린다
**`자기 초월(R)`은 기본 기술을 강화하고 `E`를 돌진으로 바꾼다.** 첫 이동을 확인하기 전에 제어를 쓰지 말고, 지속시간을 거리로 흘린 뒤 반격한다.'
AND updated_at = '2026-09-15T09:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-adc-matchup-yunara-20260915');
