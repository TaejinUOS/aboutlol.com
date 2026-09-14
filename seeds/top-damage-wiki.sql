-- scripts/seed-top-damage-wiki.ts가 생성. 탑 딜러 일반 위키 8개와 공통 상대법 9개.
-- 기존 공유 문서와 사용자 편집은 덮어쓰지 않으며 같은 SQL을 다시 실행해도 이력이 늘지 않는다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)
VALUES ('user-system', 'system', 'seed', '깨남.COM', NULL, 'admin', '2026-09-14T14:50:00.000Z');

-- 티모 챔피언 위키 (918자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-damage-champion-teemo-20260914', 'article', '티모', '티모', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 기본 공격 직전 `Q`로 반격을 막는다 · 독이 끝날 때까지 거리를 유지한다 · 버섯은 길목과 퇴로를 함께 덮는다

[[분류:탑]] [[분류:딜러]]

## 실명은 피해보다 상대 공격 순서를 끊는다

**`실명 다트(Q)`는 기본 공격이 강한 상대가 공격을 시작하는 순간 써야 가장 많은 반격을 지운다.**[* [티모 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=63)] 사거리 끝에서 먼저 던지고 걸어가면 실명이 끝날 때 붙잡힐 수 있다. 상대가 막타를 치거나 강화 공격을 준비할 때 사용하고, 실명 동안 기본 공격을 넣은 뒤 끝나기 전에 빠진다.

## 맹독이 남은 시간을 교환 길이로 쓴다

**`맹독 다트(E)`는 기본 공격 즉시 피해와 이어지는 중독 피해를 함께 남긴다.** 한 대마다 무리하게 따라가기보다 독이 지속되는 동안 상대가 막타를 포기하게 만들고 다음 공격 거리를 잡는다. 이미 독이 묻은 대상보다 새 막타를 지키는 위치가 더 중요할 때는 웨이브 쪽으로 돌아선다.

## 이동 속도는 맞기 전에 활용한다

**`신속한 이동(W)`의 지속 효과는 챔피언이나 포탑에 맞으면 중단되므로 첫 공격을 허용한 뒤에는 도주력이 줄어든다.** 상대 기술이 빠진 순간 활성화해 옆으로 파고들고, 반격이 시작되기 전에 사거리 밖으로 나온다. 시야가 없을 때는 능동 효과를 남겨 갱킹 경로와 반대로 빠진다.

## 버섯은 한곳에 겹치지 않는다

**`유독성 함정(R)`은 밟은 적을 둔화시키고 지속 피해를 주며 다른 버섯 위로 던지면 더 멀리 튕긴다.** 강가 입구만 채우기보다 내 퇴로, 수풀 입구, 상대가 막타 뒤 물러날 선을 나눠 막는다. 교전 중에는 앞 버섯을 발판으로 새 버섯을 튕겨 추격선 뒤에 놓는다.', 1, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-damage-champion-teemo-20260914' OR (kind = 'article' AND title_key = '티모'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-champion-teemo-20260914', id, NULL, 0, general, '탑 딜러 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-damage-champion-teemo-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 기본 공격 직전 `Q`로 반격을 막는다 · 독이 끝날 때까지 거리를 유지한다 · 버섯은 길목과 퇴로를 함께 덮는다

[[분류:탑]] [[분류:딜러]]

## 실명은 피해보다 상대 공격 순서를 끊는다

**`실명 다트(Q)`는 기본 공격이 강한 상대가 공격을 시작하는 순간 써야 가장 많은 반격을 지운다.**[* [티모 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=63)] 사거리 끝에서 먼저 던지고 걸어가면 실명이 끝날 때 붙잡힐 수 있다. 상대가 막타를 치거나 강화 공격을 준비할 때 사용하고, 실명 동안 기본 공격을 넣은 뒤 끝나기 전에 빠진다.

## 맹독이 남은 시간을 교환 길이로 쓴다

**`맹독 다트(E)`는 기본 공격 즉시 피해와 이어지는 중독 피해를 함께 남긴다.** 한 대마다 무리하게 따라가기보다 독이 지속되는 동안 상대가 막타를 포기하게 만들고 다음 공격 거리를 잡는다. 이미 독이 묻은 대상보다 새 막타를 지키는 위치가 더 중요할 때는 웨이브 쪽으로 돌아선다.

## 이동 속도는 맞기 전에 활용한다

**`신속한 이동(W)`의 지속 효과는 챔피언이나 포탑에 맞으면 중단되므로 첫 공격을 허용한 뒤에는 도주력이 줄어든다.** 상대 기술이 빠진 순간 활성화해 옆으로 파고들고, 반격이 시작되기 전에 사거리 밖으로 나온다. 시야가 없을 때는 능동 효과를 남겨 갱킹 경로와 반대로 빠진다.

## 버섯은 한곳에 겹치지 않는다

**`유독성 함정(R)`은 밟은 적을 둔화시키고 지속 피해를 주며 다른 버섯 위로 던지면 더 멀리 튕긴다.** 강가 입구만 채우기보다 내 퇴로, 수풀 입구, 상대가 막타 뒤 물러날 선을 나눠 막는다. 교전 중에는 앞 버섯을 발판으로 새 버섯을 튕겨 추격선 뒤에 놓는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-champion-teemo-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-teemo-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-damage-champion-teemo-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-teemo-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-teemo-20260914', NULL, '분류:딜러', '분류:딜러' FROM wiki_docs WHERE id = 'doc-top-damage-champion-teemo-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-teemo-20260914' AND target_key = '분류:딜러');

-- 퀸 챔피언 위키 (899자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-damage-champion-quinn-20260914', 'article', '퀸', '퀸', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 매사냥 표식을 바로 터뜨린다 · `E` 착지 방향을 안전하게 둔다 · 라인을 밀었을 때만 `R`로 떠난다

[[분류:탑]] [[분류:딜러]]

## 표식과 다음 기본 공격을 한 묶음으로 본다

**퀸은 매사냥 표식이 있는 대상을 공격하면 추가 피해와 함께 공격 속도와 이동 속도를 얻는다.**[* [퀸 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=111)] 표식이 생긴 뒤 다른 미니언을 치며 시간을 보내지 말고 안전한 거리에서 바로 터뜨린다. 얻은 이동 속도로 옆으로 빠져 미니언 반격을 줄이고 다음 표식까지 거리를 초기화한다.

## 실명 공격은 미니언 틈으로 던진다

**`실명 공격(Q)`은 첫 대상에 맞아 주변 피해와 표식을 남기므로 앞 미니언에 막히면 챔피언의 시야를 좁히지 못한다.** 상대가 막타를 치러 웨이브 옆으로 나오는 순간을 기다려 직선으로 맞힌다. 적중 뒤에는 표식 공격을 넣고, 빗나가면 `공중제비(E)`를 공격보다 거리 확보에 남긴다.

## 공중제비 뒤 착지할 자리를 먼저 본다

**`공중제비(E)`는 대상에게 붙었다가 최대 공격 사거리로 물러나므로 사용 방향에 따라 착지점이 달라진다.** 상대 뒤에 적 정글러가 있거나 벽에 막히는 방향이면 진입기로 쓰지 않는다. 돌진 기술을 끊거나 내 쪽으로 다가온 적을 밀어낸 뒤 표식 공격을 연결한다.

## 후방 지원은 사라진 시간까지 계산한다

**`후방 지원(R)`은 빠르게 이동하고 종료할 때 주변 적에게 피해와 표식을 남긴다.** 웨이브를 남겨둔 채 떠나면 로밍이 보이는 동안 포탑 손실이 생긴다. 끝까지 밀고 시야 밖에서 변신한 뒤, 적의 퇴로 쪽에 도착해 공중 강습과 표식 공격을 한 번에 연다.', 1, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-damage-champion-quinn-20260914' OR (kind = 'article' AND title_key = '퀸'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-champion-quinn-20260914', id, NULL, 0, general, '탑 딜러 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-damage-champion-quinn-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 매사냥 표식을 바로 터뜨린다 · `E` 착지 방향을 안전하게 둔다 · 라인을 밀었을 때만 `R`로 떠난다

[[분류:탑]] [[분류:딜러]]

## 표식과 다음 기본 공격을 한 묶음으로 본다

**퀸은 매사냥 표식이 있는 대상을 공격하면 추가 피해와 함께 공격 속도와 이동 속도를 얻는다.**[* [퀸 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=111)] 표식이 생긴 뒤 다른 미니언을 치며 시간을 보내지 말고 안전한 거리에서 바로 터뜨린다. 얻은 이동 속도로 옆으로 빠져 미니언 반격을 줄이고 다음 표식까지 거리를 초기화한다.

## 실명 공격은 미니언 틈으로 던진다

**`실명 공격(Q)`은 첫 대상에 맞아 주변 피해와 표식을 남기므로 앞 미니언에 막히면 챔피언의 시야를 좁히지 못한다.** 상대가 막타를 치러 웨이브 옆으로 나오는 순간을 기다려 직선으로 맞힌다. 적중 뒤에는 표식 공격을 넣고, 빗나가면 `공중제비(E)`를 공격보다 거리 확보에 남긴다.

## 공중제비 뒤 착지할 자리를 먼저 본다

**`공중제비(E)`는 대상에게 붙었다가 최대 공격 사거리로 물러나므로 사용 방향에 따라 착지점이 달라진다.** 상대 뒤에 적 정글러가 있거나 벽에 막히는 방향이면 진입기로 쓰지 않는다. 돌진 기술을 끊거나 내 쪽으로 다가온 적을 밀어낸 뒤 표식 공격을 연결한다.

## 후방 지원은 사라진 시간까지 계산한다

**`후방 지원(R)`은 빠르게 이동하고 종료할 때 주변 적에게 피해와 표식을 남긴다.** 웨이브를 남겨둔 채 떠나면 로밍이 보이는 동안 포탑 손실이 생긴다. 끝까지 밀고 시야 밖에서 변신한 뒤, 적의 퇴로 쪽에 도착해 공중 강습과 표식 공격을 한 번에 연다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-champion-quinn-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-quinn-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-damage-champion-quinn-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-quinn-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-quinn-20260914', NULL, '분류:딜러', '분류:딜러' FROM wiki_docs WHERE id = 'doc-top-damage-champion-quinn-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-quinn-20260914' AND target_key = '분류:딜러');

-- 케넨 챔피언 위키 (889자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-damage-champion-kennen-20260914', 'article', '케넨', '케넨', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 표식 두 개에서 세 번째 적중을 준비한다 · 강화 기본 공격을 아낀다 · `E`로 진입한 뒤 공격 속도를 활용한다

[[분류:탑]] [[분류:딜러]]

## 폭풍의 표식을 세 번에 나눠 쌓는다

**케넨의 기술은 폭풍의 표식을 남기고 세 개가 되면 대상을 기절시키며 기력을 돌려준다.**[* [케넨 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=31)] 한 번에 모든 기술을 쓰기보다 `천둥의 표창(Q)`이나 강화 기본 공격으로 첫 표식을 만들고, 상대가 다시 막타를 치러 올 때 `전류 방출(W)`로 두 번째와 세 번째를 묶는다.

## 강화 기본 공격의 준비 상태를 숨기지 않는다

**`전류 방출(W)`의 지속 효과는 일정 공격마다 다음 기본 공격에 표식을 싣는다.** 준비된 공격을 미니언 막타에 쓰면 기절 위협이 사라진다. 상대가 사거리에 들어올 때까지 유지하고, 직접 공격이 어려우면 `Q` 표식 뒤 능동 `W`로 안전하게 추가 표식을 남긴다.

## 번개 질주 뒤의 공격 속도를 사용한다

**`번개 질주(E)`는 유닛을 통과해 표식을 남기고 종료하면 공격 속도를 높인다.** 단순 탈출기로만 쓰기보다 상대 핵심 기술이 빠진 뒤 관통해 강화 공격과 `W`를 잇는다. 시야가 없을 때는 진입에 쓰지 않고 기력과 퇴로를 남긴다.

## 소용돌이는 여러 명보다 확실한 진입을 고른다

**`날카로운 소용돌이(R)`는 주변 챔피언을 반복 공격해 표식을 쌓으므로 가까운 적을 기절시키기 쉽다.** 많은 적을 스치려고 중앙을 가로지르기보다 후방이나 측면에서 `E`로 들어가 핵심 두세 명에게 머문다. 첫 기절 뒤 다음 제어까지 기본 공격과 `W` 순서를 나눈다.', 1, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-damage-champion-kennen-20260914' OR (kind = 'article' AND title_key = '케넨'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-champion-kennen-20260914', id, NULL, 0, general, '탑 딜러 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-damage-champion-kennen-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 표식 두 개에서 세 번째 적중을 준비한다 · 강화 기본 공격을 아낀다 · `E`로 진입한 뒤 공격 속도를 활용한다

[[분류:탑]] [[분류:딜러]]

## 폭풍의 표식을 세 번에 나눠 쌓는다

**케넨의 기술은 폭풍의 표식을 남기고 세 개가 되면 대상을 기절시키며 기력을 돌려준다.**[* [케넨 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=31)] 한 번에 모든 기술을 쓰기보다 `천둥의 표창(Q)`이나 강화 기본 공격으로 첫 표식을 만들고, 상대가 다시 막타를 치러 올 때 `전류 방출(W)`로 두 번째와 세 번째를 묶는다.

## 강화 기본 공격의 준비 상태를 숨기지 않는다

**`전류 방출(W)`의 지속 효과는 일정 공격마다 다음 기본 공격에 표식을 싣는다.** 준비된 공격을 미니언 막타에 쓰면 기절 위협이 사라진다. 상대가 사거리에 들어올 때까지 유지하고, 직접 공격이 어려우면 `Q` 표식 뒤 능동 `W`로 안전하게 추가 표식을 남긴다.

## 번개 질주 뒤의 공격 속도를 사용한다

**`번개 질주(E)`는 유닛을 통과해 표식을 남기고 종료하면 공격 속도를 높인다.** 단순 탈출기로만 쓰기보다 상대 핵심 기술이 빠진 뒤 관통해 강화 공격과 `W`를 잇는다. 시야가 없을 때는 진입에 쓰지 않고 기력과 퇴로를 남긴다.

## 소용돌이는 여러 명보다 확실한 진입을 고른다

**`날카로운 소용돌이(R)`는 주변 챔피언을 반복 공격해 표식을 쌓으므로 가까운 적을 기절시키기 쉽다.** 많은 적을 스치려고 중앙을 가로지르기보다 후방이나 측면에서 `E`로 들어가 핵심 두세 명에게 머문다. 첫 기절 뒤 다음 제어까지 기본 공격과 `W` 순서를 나눈다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-champion-kennen-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-kennen-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-damage-champion-kennen-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-kennen-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-kennen-20260914', NULL, '분류:딜러', '분류:딜러' FROM wiki_docs WHERE id = 'doc-top-damage-champion-kennen-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-kennen-20260914' AND target_key = '분류:딜러');

-- 블라디미르 챔피언 위키 (912자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-damage-champion-vladimir-20260914', 'article', '블라디미르', '블라디미르', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 강화 `Q`에 맞춰 앞으로 선다 · `E`는 미니언에 막히지 않는 각을 만든다 · 웅덩이는 핵심 제어에 남긴다

[[분류:탑]] [[분류:딜러]]

## 강화 수혈의 짧은 시간을 놓치지 않는다

**`수혈(Q)`을 반복하면 잠시 피해와 회복이 크게 강화되므로 자원이 차는 순간 상대 사거리 안에 있어야 한다.**[* [블라디미르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=73)] 강화 직전에 웨이브 뒤에서만 기다리면 상대가 물러난다. 한 단계 전부터 앞으로 걸어 막타와 챔피언 중 확실한 대상을 고르고, 강화 사용 뒤에는 다음 주기까지 거리를 줄인다.

## 선혈의 파도는 옆선에서 충전한다

**`선혈의 파도(E)`는 충전 뒤 주변으로 퍼지지만 적 유닛이 파도를 가로막을 수 있다.** 미니언 정면에서 쓰지 말고 웨이브 옆으로 움직여 챔피언과 열린 선을 만든다. 충전 중 체력을 쓰므로 상대 제어가 남아 있으면 끝까지 욕심내지 않고 일찍 방출한다.

## 웅덩이는 첫 견제가 아니라 결정적 공격을 피한다

**`피의 웅덩이(W)` 동안은 대상으로 지정되지 않지만 체력을 소모하고 재사용까지 빈틈이 길다.** 가벼운 견제에 사용하면 다음 진입을 막지 못한다. 상대의 핵심 제어나 처치 기술이 시작되는 순간 웅덩이로 지나가고, 나온 뒤 `Q` 회복이 닿는 위치로 움직인다.

## 혈사병의 지연 피해까지 한 교환으로 묶는다

**`혈사병(R)`에 감염된 적은 받는 피해가 늘고 잠시 뒤 피해와 회복이 발생한다.** 궁극기 직후 모든 기술을 빠르게 넣되, 지연 폭발 전에 상대가 완전히 빠지지 않도록 퇴로 쪽에 선다. 여러 명을 맞혔다면 한 명을 깊게 쫓기보다 폭발 회복을 받은 뒤 다음 대상을 고른다.', 1, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-damage-champion-vladimir-20260914' OR (kind = 'article' AND title_key = '블라디미르'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-champion-vladimir-20260914', id, NULL, 0, general, '탑 딜러 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-damage-champion-vladimir-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 강화 `Q`에 맞춰 앞으로 선다 · `E`는 미니언에 막히지 않는 각을 만든다 · 웅덩이는 핵심 제어에 남긴다

[[분류:탑]] [[분류:딜러]]

## 강화 수혈의 짧은 시간을 놓치지 않는다

**`수혈(Q)`을 반복하면 잠시 피해와 회복이 크게 강화되므로 자원이 차는 순간 상대 사거리 안에 있어야 한다.**[* [블라디미르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=73)] 강화 직전에 웨이브 뒤에서만 기다리면 상대가 물러난다. 한 단계 전부터 앞으로 걸어 막타와 챔피언 중 확실한 대상을 고르고, 강화 사용 뒤에는 다음 주기까지 거리를 줄인다.

## 선혈의 파도는 옆선에서 충전한다

**`선혈의 파도(E)`는 충전 뒤 주변으로 퍼지지만 적 유닛이 파도를 가로막을 수 있다.** 미니언 정면에서 쓰지 말고 웨이브 옆으로 움직여 챔피언과 열린 선을 만든다. 충전 중 체력을 쓰므로 상대 제어가 남아 있으면 끝까지 욕심내지 않고 일찍 방출한다.

## 웅덩이는 첫 견제가 아니라 결정적 공격을 피한다

**`피의 웅덩이(W)` 동안은 대상으로 지정되지 않지만 체력을 소모하고 재사용까지 빈틈이 길다.** 가벼운 견제에 사용하면 다음 진입을 막지 못한다. 상대의 핵심 제어나 처치 기술이 시작되는 순간 웅덩이로 지나가고, 나온 뒤 `Q` 회복이 닿는 위치로 움직인다.

## 혈사병의 지연 피해까지 한 교환으로 묶는다

**`혈사병(R)`에 감염된 적은 받는 피해가 늘고 잠시 뒤 피해와 회복이 발생한다.** 궁극기 직후 모든 기술을 빠르게 넣되, 지연 폭발 전에 상대가 완전히 빠지지 않도록 퇴로 쪽에 선다. 여러 명을 맞혔다면 한 명을 깊게 쫓기보다 폭발 회복을 받은 뒤 다음 대상을 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-champion-vladimir-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-vladimir-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-damage-champion-vladimir-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-vladimir-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-vladimir-20260914', NULL, '분류:딜러', '분류:딜러' FROM wiki_docs WHERE id = 'doc-top-damage-champion-vladimir-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-vladimir-20260914' AND target_key = '분류:딜러');

-- 럼블 챔피언 위키 (889자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-damage-champion-rumble-20260914', 'article', '럼블', '럼블', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 위험 상태 직전에 열을 맞춘다 · 과열할 마지막 기술을 고른다 · `R`은 적의 이동 방향을 따라 긋는다

[[분류:탑]] [[분류:딜러]]

## 열 수치를 기술 순서로 관리한다

**럼블은 열이 50 이상이면 기술이 강화되고 150에 도달하면 잠시 기술을 쓰지 못하는 대신 기본 공격이 강해진다.**[* [럼블 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=52)] 교환 전에 50 근처를 만들고 `화염방사기(Q)`나 `고철 방패(W)` 중 무엇으로 과열할지 정한다. 도망쳐야 할 때 `W`를 쓰지 못하는 과열은 피한다.

## 화염방사기 동안 몸의 방향을 계속 맞춘다

**`화염방사기(Q)`는 몇 초 동안 럼블 정면 원뿔을 태우므로 첫 적중 뒤의 이동이 총피해를 결정한다.** 상대가 뒤로 빠지면 직선으로 따라가고 옆으로 돌면 몸을 같은 방향으로 틀어 범위를 유지한다. 웨이브까지 함께 태우면 라인이 밀리므로 추격 전에 강가 시야를 확인한다.

## 작살 두 발을 같은 이동선에 묶는다

**`전기 작살(E)`은 두 발을 저장하고 적의 이동 속도와 마법 저항력을 낮춘다.** 첫 발을 최대 거리에서 던져 이동 방향을 확인한 뒤 두 번째를 앞쪽에 둔다. 두 발을 급히 같은 자리에 쓰기보다 `Q`가 닿는 동안 둔화를 이어 가는 데 사용한다.

## 이퀄라이저는 발밑보다 퇴로에 긋는다

**`이퀄라이저 미사일(R)`은 긴 화염 지대를 만들어 그 위의 적을 둔화시키고 계속 피해를 준다.** 현재 위치에 짧게 겹치기보다 적이 빠질 길과 아군 제어가 이어질 선을 따라 그린다. 좁은 입구를 가로막거나 전투 대형을 둘로 나누면 지대 위 체류 시간을 늘릴 수 있다.', 1, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-damage-champion-rumble-20260914' OR (kind = 'article' AND title_key = '럼블'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-champion-rumble-20260914', id, NULL, 0, general, '탑 딜러 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-damage-champion-rumble-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 위험 상태 직전에 열을 맞춘다 · 과열할 마지막 기술을 고른다 · `R`은 적의 이동 방향을 따라 긋는다

[[분류:탑]] [[분류:딜러]]

## 열 수치를 기술 순서로 관리한다

**럼블은 열이 50 이상이면 기술이 강화되고 150에 도달하면 잠시 기술을 쓰지 못하는 대신 기본 공격이 강해진다.**[* [럼블 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=52)] 교환 전에 50 근처를 만들고 `화염방사기(Q)`나 `고철 방패(W)` 중 무엇으로 과열할지 정한다. 도망쳐야 할 때 `W`를 쓰지 못하는 과열은 피한다.

## 화염방사기 동안 몸의 방향을 계속 맞춘다

**`화염방사기(Q)`는 몇 초 동안 럼블 정면 원뿔을 태우므로 첫 적중 뒤의 이동이 총피해를 결정한다.** 상대가 뒤로 빠지면 직선으로 따라가고 옆으로 돌면 몸을 같은 방향으로 틀어 범위를 유지한다. 웨이브까지 함께 태우면 라인이 밀리므로 추격 전에 강가 시야를 확인한다.

## 작살 두 발을 같은 이동선에 묶는다

**`전기 작살(E)`은 두 발을 저장하고 적의 이동 속도와 마법 저항력을 낮춘다.** 첫 발을 최대 거리에서 던져 이동 방향을 확인한 뒤 두 번째를 앞쪽에 둔다. 두 발을 급히 같은 자리에 쓰기보다 `Q`가 닿는 동안 둔화를 이어 가는 데 사용한다.

## 이퀄라이저는 발밑보다 퇴로에 긋는다

**`이퀄라이저 미사일(R)`은 긴 화염 지대를 만들어 그 위의 적을 둔화시키고 계속 피해를 준다.** 현재 위치에 짧게 겹치기보다 적이 빠질 길과 아군 제어가 이어질 선을 따라 그린다. 좁은 입구를 가로막거나 전투 대형을 둘로 나누면 지대 위 체류 시간을 늘릴 수 있다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-champion-rumble-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-rumble-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-damage-champion-rumble-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-rumble-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-rumble-20260914', NULL, '분류:딜러', '분류:딜러' FROM wiki_docs WHERE id = 'doc-top-damage-champion-rumble-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-rumble-20260914' AND target_key = '분류:딜러');

-- 케일 챔피언 위키 (887자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-damage-champion-kayle-20260914', 'article', '케일', '케일', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 6레벨 전에는 체력을 지킨다 · `Q` 저항 감소 뒤 공격한다 · `R`은 마지막 피해보다 먼저 쓴다

[[분류:탑]] [[분류:딜러]]

## 성장 단계마다 싸움의 거리를 바꾼다

**케일은 6레벨에 공격 사거리를 얻고 11레벨에 화염파, 16레벨에 영구 강화 상태와 더 긴 사거리를 얻는다.**[* [케일 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=30)] 6레벨 전에는 근접 막타를 무리하지 않고 체력을 보존한다. 사거리가 생긴 뒤에는 미니언을 치며 공격 속도 중첩을 만든 다음 상대 막타에 맞춰 앞으로 선다.

## 광휘의 일격 뒤에 화력을 모은다

**`광휘의 일격(Q)`은 적을 둔화시키고 방어력과 마법 저항력을 함께 낮춘다.** 먼저 맞혀 이동을 묶은 뒤 기본 공격과 `화염주문검(E)`을 이어야 후속 피해가 커진다. 미니언 뒤까지 관통하므로 상대와 웨이브를 함께 맞히되 원치 않게 라인을 밀지 않도록 수를 조절한다.

## 축복은 회복과 거리 조절을 함께 본다

**`천상의 축복(W)`은 자신과 가까운 아군을 회복시키고 이동 속도를 높인다.** 체력이 조금 줄었다고 바로 쓰기보다 상대가 접근할 때 빠지거나 추격할 순간에 사용한다. 아군과 가까이 서면 두 명이 함께 효과를 받아 합류 교전의 이동선을 만들 수 있다.

## 무적이 끝날 자리까지 공격을 이어 간다

**`신성한 심판(R)`은 대상 아군을 무적으로 만들고 잠시 뒤 주변에 검을 떨어뜨린다.** 체력이 완전히 바닥난 뒤 반응하려 하지 말고 큰 피해가 들어오기 전에 사용한다. 자신에게 썼다면 무적 동안 상대 퇴로를 따라 움직여 낙하 피해와 다음 기본 공격이 닿을 위치를 잡는다.', 1, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-damage-champion-kayle-20260914' OR (kind = 'article' AND title_key = '케일'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-champion-kayle-20260914', id, NULL, 0, general, '탑 딜러 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-damage-champion-kayle-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 6레벨 전에는 체력을 지킨다 · `Q` 저항 감소 뒤 공격한다 · `R`은 마지막 피해보다 먼저 쓴다

[[분류:탑]] [[분류:딜러]]

## 성장 단계마다 싸움의 거리를 바꾼다

**케일은 6레벨에 공격 사거리를 얻고 11레벨에 화염파, 16레벨에 영구 강화 상태와 더 긴 사거리를 얻는다.**[* [케일 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=30)] 6레벨 전에는 근접 막타를 무리하지 않고 체력을 보존한다. 사거리가 생긴 뒤에는 미니언을 치며 공격 속도 중첩을 만든 다음 상대 막타에 맞춰 앞으로 선다.

## 광휘의 일격 뒤에 화력을 모은다

**`광휘의 일격(Q)`은 적을 둔화시키고 방어력과 마법 저항력을 함께 낮춘다.** 먼저 맞혀 이동을 묶은 뒤 기본 공격과 `화염주문검(E)`을 이어야 후속 피해가 커진다. 미니언 뒤까지 관통하므로 상대와 웨이브를 함께 맞히되 원치 않게 라인을 밀지 않도록 수를 조절한다.

## 축복은 회복과 거리 조절을 함께 본다

**`천상의 축복(W)`은 자신과 가까운 아군을 회복시키고 이동 속도를 높인다.** 체력이 조금 줄었다고 바로 쓰기보다 상대가 접근할 때 빠지거나 추격할 순간에 사용한다. 아군과 가까이 서면 두 명이 함께 효과를 받아 합류 교전의 이동선을 만들 수 있다.

## 무적이 끝날 자리까지 공격을 이어 간다

**`신성한 심판(R)`은 대상 아군을 무적으로 만들고 잠시 뒤 주변에 검을 떨어뜨린다.** 체력이 완전히 바닥난 뒤 반응하려 하지 말고 큰 피해가 들어오기 전에 사용한다. 자신에게 썼다면 무적 동안 상대 퇴로를 따라 움직여 낙하 피해와 다음 기본 공격이 닿을 위치를 잡는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-champion-kayle-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-kayle-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-damage-champion-kayle-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-kayle-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-kayle-20260914', NULL, '분류:딜러', '분류:딜러' FROM wiki_docs WHERE id = 'doc-top-damage-champion-kayle-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-kayle-20260914' AND target_key = '분류:딜러');

-- 하이머딩거 챔피언 위키 (910자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-damage-champion-heimerdinger-20260914', 'article', '하이머딩거', '하이머딩거', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 포탑 사거리를 겹치되 한곳에 몰지 않는다 · `E` 수류탄 중앙을 맞힌다 · 강화 기술은 전투 목적에 맞춰 고른다

[[분류:탑]] [[분류:딜러]]

## 포탑 세 개로 안전한 삼각형을 만든다

**`H-28 G 진화형 포탑(Q)`은 지속 사격과 관통 광선으로 지역을 지키므로 서로 지원할 거리에 배치해야 한다.**[* [하이머딩거 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=21)] 한곳에 겹치면 광역 공격에 모두 잃고 너무 벌리면 각개로 정리된다. 웨이브 양옆과 뒤에 삼각형을 만들어 상대가 어느 포탑을 치더라도 다른 포탑 사거리에 들어오게 한다.

## 로켓은 끝점보다 교차점을 겨눈다

**`마법공학 초소형 로켓(W)`은 마우스 위치로 모이므로 먼 거리에서는 퍼지고 목표 지점에서 집중된다.** 상대가 막타를 치는 발밑을 교차점으로 잡고, 가까운 대상에게는 커서를 몸 뒤에 두어 여러 발을 겹친다. 포탑 광선 충전을 위해 한 발이라도 챔피언에게 맞히는 것을 우선한다.

## 수류탄 중앙과 포탑 광선을 연결한다

**`CH-2 전자폭풍 수류탄(E)`은 중앙에 맞힌 적을 기절시키고 바깥에는 둔화를 준다.** 먼저 던져 맞히려 하기보다 상대가 포탑을 치러 멈추거나 돌진한 착지점에 사용한다. 기절 중 포탑 광선과 `W`를 겹쳐 짧은 시간에 화력을 모은다.

## 업그레이드는 필요한 기능 하나를 고른다

**`업그레이드!!!(R)`는 다음 기본 기술을 강화하므로 매 전투에서 같은 선택을 할 필요가 없다.** 좁은 구역을 오래 지킬 때는 강화 포탑, 먼 적을 마무리할 때는 강화 로켓, 여러 명의 진입을 막을 때는 강화 수류탄을 고른다. 선택 전 현재 포탑 수와 적 이동기를 먼저 확인한다.', 1, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-damage-champion-heimerdinger-20260914' OR (kind = 'article' AND title_key = '하이머딩거'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-champion-heimerdinger-20260914', id, NULL, 0, general, '탑 딜러 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-damage-champion-heimerdinger-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 포탑 사거리를 겹치되 한곳에 몰지 않는다 · `E` 수류탄 중앙을 맞힌다 · 강화 기술은 전투 목적에 맞춰 고른다

[[분류:탑]] [[분류:딜러]]

## 포탑 세 개로 안전한 삼각형을 만든다

**`H-28 G 진화형 포탑(Q)`은 지속 사격과 관통 광선으로 지역을 지키므로 서로 지원할 거리에 배치해야 한다.**[* [하이머딩거 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=21)] 한곳에 겹치면 광역 공격에 모두 잃고 너무 벌리면 각개로 정리된다. 웨이브 양옆과 뒤에 삼각형을 만들어 상대가 어느 포탑을 치더라도 다른 포탑 사거리에 들어오게 한다.

## 로켓은 끝점보다 교차점을 겨눈다

**`마법공학 초소형 로켓(W)`은 마우스 위치로 모이므로 먼 거리에서는 퍼지고 목표 지점에서 집중된다.** 상대가 막타를 치는 발밑을 교차점으로 잡고, 가까운 대상에게는 커서를 몸 뒤에 두어 여러 발을 겹친다. 포탑 광선 충전을 위해 한 발이라도 챔피언에게 맞히는 것을 우선한다.

## 수류탄 중앙과 포탑 광선을 연결한다

**`CH-2 전자폭풍 수류탄(E)`은 중앙에 맞힌 적을 기절시키고 바깥에는 둔화를 준다.** 먼저 던져 맞히려 하기보다 상대가 포탑을 치러 멈추거나 돌진한 착지점에 사용한다. 기절 중 포탑 광선과 `W`를 겹쳐 짧은 시간에 화력을 모은다.

## 업그레이드는 필요한 기능 하나를 고른다

**`업그레이드!!!(R)`는 다음 기본 기술을 강화하므로 매 전투에서 같은 선택을 할 필요가 없다.** 좁은 구역을 오래 지킬 때는 강화 포탑, 먼 적을 마무리할 때는 강화 로켓, 여러 명의 진입을 막을 때는 강화 수류탄을 고른다. 선택 전 현재 포탑 수와 적 이동기를 먼저 확인한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-champion-heimerdinger-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-heimerdinger-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-damage-champion-heimerdinger-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-heimerdinger-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-heimerdinger-20260914', NULL, '분류:딜러', '분류:딜러' FROM wiki_docs WHERE id = 'doc-top-damage-champion-heimerdinger-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-heimerdinger-20260914' AND target_key = '분류:딜러');

-- 신지드 챔피언 위키 (879자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-damage-champion-singed-20260914', 'article', '신지드', '신지드', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`를 켠 시간만큼 끈 시간도 만든다 · 접착제 뒤로 넘겨 속박한다 · 추격시키되 아군과 너무 멀어지지 않는다

[[분류:탑]] [[분류:딜러]]

## 맹독은 필요한 순간에만 켠다

**`맹독의 자취(Q)`는 신지드 뒤에 독구름을 남기므로 상대가 지나갈 길을 몸으로 그리는 기술이다.**[* [신지드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=56)] 웨이브 앞에서 계속 켜 두기보다 미니언 사이를 한 번 가로지른 뒤 끈다. 교환에서는 상대 퇴로를 먼저 지나가 독길을 만들고, 같은 자리를 맴돌아 자원을 낭비하지 않는다.

## 접착제와 던져넘기기를 한 위치에 맞춘다

**`초강력 접착제(W)` 위로 `던져넘기기(E)` 한 대상을 떨어뜨리면 속박할 수 있다.** 상대 발밑에 바로 접착제를 쓰기보다 내 뒤쪽 착지 지점에 깔고 접근한다. 이동 기술을 막는 구역이라 도주 방향을 제한한 뒤 넘기면 아군이 후속 공격할 시간이 생긴다.

## 상대가 쫓을 이유를 만들어 둔다

**신지드는 뒤따르는 적을 독에 오래 노출시키지만 아무 목적 없이 멀리 달리면 전투에서 이탈한다.** 웨이브나 핵심 지역을 건드려 상대가 따라오게 하고, 독길 끝이 아군과 만나는 방향이 되게 한다. 상대가 추격을 포기하면 곧장 돌아가 다음 길을 막는다.

## 광기의 물약 동안 전투를 끊지 않는다

**`광기의 물약(R)`은 여러 전투 능력을 높이고 독에 고통스러운 상처까지 더한다.** 사용 직후 한 대상만 깊게 쫓기보다 적 사이를 지나며 여러 이동선을 독으로 막는다. 강화 시간이 끝나기 전에 `W`와 `E`로 핵심 대상을 아군 쪽으로 넘기고 빠질 길을 남긴다.', 1, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-damage-champion-singed-20260914' OR (kind = 'article' AND title_key = '신지드'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-champion-singed-20260914', id, NULL, 0, general, '탑 딜러 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-damage-champion-singed-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`를 켠 시간만큼 끈 시간도 만든다 · 접착제 뒤로 넘겨 속박한다 · 추격시키되 아군과 너무 멀어지지 않는다

[[분류:탑]] [[분류:딜러]]

## 맹독은 필요한 순간에만 켠다

**`맹독의 자취(Q)`는 신지드 뒤에 독구름을 남기므로 상대가 지나갈 길을 몸으로 그리는 기술이다.**[* [신지드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=56)] 웨이브 앞에서 계속 켜 두기보다 미니언 사이를 한 번 가로지른 뒤 끈다. 교환에서는 상대 퇴로를 먼저 지나가 독길을 만들고, 같은 자리를 맴돌아 자원을 낭비하지 않는다.

## 접착제와 던져넘기기를 한 위치에 맞춘다

**`초강력 접착제(W)` 위로 `던져넘기기(E)` 한 대상을 떨어뜨리면 속박할 수 있다.** 상대 발밑에 바로 접착제를 쓰기보다 내 뒤쪽 착지 지점에 깔고 접근한다. 이동 기술을 막는 구역이라 도주 방향을 제한한 뒤 넘기면 아군이 후속 공격할 시간이 생긴다.

## 상대가 쫓을 이유를 만들어 둔다

**신지드는 뒤따르는 적을 독에 오래 노출시키지만 아무 목적 없이 멀리 달리면 전투에서 이탈한다.** 웨이브나 핵심 지역을 건드려 상대가 따라오게 하고, 독길 끝이 아군과 만나는 방향이 되게 한다. 상대가 추격을 포기하면 곧장 돌아가 다음 길을 막는다.

## 광기의 물약 동안 전투를 끊지 않는다

**`광기의 물약(R)`은 여러 전투 능력을 높이고 독에 고통스러운 상처까지 더한다.** 사용 직후 한 대상만 깊게 쫓기보다 적 사이를 지나며 여러 이동선을 독으로 막는다. 강화 시간이 끝나기 전에 `W`와 `E`로 핵심 대상을 아군 쪽으로 넘기고 빠질 길을 남긴다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-champion-singed-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-singed-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-damage-champion-singed-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-singed-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-damage-champion-singed-20260914', NULL, '분류:딜러', '분류:딜러' FROM wiki_docs WHERE id = 'doc-top-damage-champion-singed-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-damage-champion-singed-20260914' AND target_key = '분류:딜러');

-- teemo 상대법 (850자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-teemo', 'matchup', NULL, NULL, 'published', 'teemo', '', 0, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 실명이 빠진 뒤 기본 공격을 쓴다 · 독이 끝날 때까지 교환을 끊는다 · 버섯이 있을 법한 길을 반복해 걷지 않는다

## 실명에 강화 공격을 낭비하지 않는다

**티모의 `실명 다트(Q)`가 유지되는 동안 기본 공격은 빗나가므로 공격 강화 효과를 먼저 쓰지 않는다.**[* [티모 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=63)] 실명이 들어오면 기술 피해나 이동으로 시간을 보내고 끝난 뒤 공격한다. 티모가 막타 견제에 `Q`를 썼다면 재사용 전이 근접 챔피언이 거리를 좁힐 가장 분명한 구간이다.

## 독이 묻은 채로 한 대씩 더 주고받지 않는다

**`맹독 다트(E)`는 공격 뒤에도 중독 피해가 이어지므로 같은 체력처럼 보여도 교환 결과가 늦게 바뀐다.** 독이 끝날 때까지 거리를 끊고 다음 막타에서 다시 시작한다. 중독 중 체력이 낮아졌다고 급히 되돌아가면 새 공격으로 지속시간까지 갱신된다.

## 먼저 맞혀 이동 속도 지속 효과를 끊는다

**티모는 공격받지 않았을 때 `신속한 이동(W)`의 이동 속도 효과를 유지한다.** 짧은 원거리 기술로 먼저 맞히면 추격과 도주가 느려진다. 능동 효과를 켰을 때는 직선으로 쫓기보다 퇴로 쪽으로 이동해 다음 사거리를 제한한다.

## 버섯을 밟은 자리에서 방향을 바꾼다

**`유독성 함정(R)`은 주요 길목을 둔화 지대로 바꾸므로 같은 수풀과 벽선을 반복하면 연속으로 밟기 쉽다.** 하나가 터졌다면 가장 가까운 안전한 가장자리로 빠지고 다른 경로로 돌아온다. 웨이브가 없는 어두운 길보다 미니언이 먼저 지나간 선을 따라 접근한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-teemo' AND kind = 'matchup' AND champion_slug = 'teemo'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-teemo');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-matchup-teemo-20260914', id, NULL, 0, general, '탑 딜러 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-teemo' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 실명이 빠진 뒤 기본 공격을 쓴다 · 독이 끝날 때까지 교환을 끊는다 · 버섯이 있을 법한 길을 반복해 걷지 않는다

## 실명에 강화 공격을 낭비하지 않는다

**티모의 `실명 다트(Q)`가 유지되는 동안 기본 공격은 빗나가므로 공격 강화 효과를 먼저 쓰지 않는다.**[* [티모 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=63)] 실명이 들어오면 기술 피해나 이동으로 시간을 보내고 끝난 뒤 공격한다. 티모가 막타 견제에 `Q`를 썼다면 재사용 전이 근접 챔피언이 거리를 좁힐 가장 분명한 구간이다.

## 독이 묻은 채로 한 대씩 더 주고받지 않는다

**`맹독 다트(E)`는 공격 뒤에도 중독 피해가 이어지므로 같은 체력처럼 보여도 교환 결과가 늦게 바뀐다.** 독이 끝날 때까지 거리를 끊고 다음 막타에서 다시 시작한다. 중독 중 체력이 낮아졌다고 급히 되돌아가면 새 공격으로 지속시간까지 갱신된다.

## 먼저 맞혀 이동 속도 지속 효과를 끊는다

**티모는 공격받지 않았을 때 `신속한 이동(W)`의 이동 속도 효과를 유지한다.** 짧은 원거리 기술로 먼저 맞히면 추격과 도주가 느려진다. 능동 효과를 켰을 때는 직선으로 쫓기보다 퇴로 쪽으로 이동해 다음 사거리를 제한한다.

## 버섯을 밟은 자리에서 방향을 바꾼다

**`유독성 함정(R)`은 주요 길목을 둔화 지대로 바꾸므로 같은 수풀과 벽선을 반복하면 연속으로 밟기 쉽다.** 하나가 터졌다면 가장 가까운 안전한 가장자리로 빠지고 다른 경로로 돌아온다. 웨이브가 없는 어두운 길보다 미니언이 먼저 지나간 선을 따라 접근한다.'
AND updated_at = '2026-09-14T14:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-matchup-teemo-20260914');

-- quinn 상대법 (831자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-quinn', 'matchup', NULL, NULL, 'published', 'quinn', '', 0, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 매사냥 표식이 사라질 때까지 거리를 둔다 · `Q`를 미니언 뒤에서 피한다 · `E` 착지점에 반격한다

## 표식이 생기면 다음 공격을 공짜로 주지 않는다

**퀸은 매사냥 표식을 기본 공격으로 터뜨리면 추가 피해와 이동 속도를 얻어 짧은 교환을 끝낸다.**[* [퀸 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=111)] 표식이 머리 위에 생겼다면 막타 하나를 양보하고 공격 사거리 밖으로 나간다. 이미 맞았다면 빨라진 퀸을 바로 쫓지 말고 효과가 끝난 다음 접근한다.

## 실명 공격의 첫 대상이 되지 않는다

**`실명 공격(Q)`은 첫 대상에 맞으면 멈추므로 미니언을 사이에 두면 시야 제한과 표식을 막을 수 있다.** 미니언과 완전히 같은 선에서는 주변 피해를 맞을 수 있어 한 걸음 뒤·옆으로 선다. `Q`가 빗나간 뒤에는 퀸이 안전하게 표식을 만들 수단이 줄어든다.

## 공중제비 착지 지점을 겨눈다

**`공중제비(E)`는 대상에게 접근했다가 반대편 최대 공격 사거리로 돌아간다.** 돌진 시작점에 기술을 쓰지 말고 퀸이 착지할 선에 제어를 둔다. 내 이동기를 먼저 쓰면 `E`로 끊고 다시 거리를 만들 수 있으므로 퀸이 사용한 뒤 따라간다.

## 퀸이 사라지면 라인보다 경로를 먼저 알린다

**`후방 지원(R)`은 퀸의 이동 속도를 크게 높여 다른 전투에 먼저 도착하게 한다.** 보이지 않는 즉시 아군에게 알리고 강가의 직선 경로에서 물러난다. 퀸이 로밍에서 성과를 얻지 못하면 밀린 탑 웨이브와 포탑 압박으로 손실을 되돌릴 수 있다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-quinn' AND kind = 'matchup' AND champion_slug = 'quinn'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-quinn');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-matchup-quinn-20260914', id, NULL, 0, general, '탑 딜러 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-quinn' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 매사냥 표식이 사라질 때까지 거리를 둔다 · `Q`를 미니언 뒤에서 피한다 · `E` 착지점에 반격한다

## 표식이 생기면 다음 공격을 공짜로 주지 않는다

**퀸은 매사냥 표식을 기본 공격으로 터뜨리면 추가 피해와 이동 속도를 얻어 짧은 교환을 끝낸다.**[* [퀸 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=111)] 표식이 머리 위에 생겼다면 막타 하나를 양보하고 공격 사거리 밖으로 나간다. 이미 맞았다면 빨라진 퀸을 바로 쫓지 말고 효과가 끝난 다음 접근한다.

## 실명 공격의 첫 대상이 되지 않는다

**`실명 공격(Q)`은 첫 대상에 맞으면 멈추므로 미니언을 사이에 두면 시야 제한과 표식을 막을 수 있다.** 미니언과 완전히 같은 선에서는 주변 피해를 맞을 수 있어 한 걸음 뒤·옆으로 선다. `Q`가 빗나간 뒤에는 퀸이 안전하게 표식을 만들 수단이 줄어든다.

## 공중제비 착지 지점을 겨눈다

**`공중제비(E)`는 대상에게 접근했다가 반대편 최대 공격 사거리로 돌아간다.** 돌진 시작점에 기술을 쓰지 말고 퀸이 착지할 선에 제어를 둔다. 내 이동기를 먼저 쓰면 `E`로 끊고 다시 거리를 만들 수 있으므로 퀸이 사용한 뒤 따라간다.

## 퀸이 사라지면 라인보다 경로를 먼저 알린다

**`후방 지원(R)`은 퀸의 이동 속도를 크게 높여 다른 전투에 먼저 도착하게 한다.** 보이지 않는 즉시 아군에게 알리고 강가의 직선 경로에서 물러난다. 퀸이 로밍에서 성과를 얻지 못하면 밀린 탑 웨이브와 포탑 압박으로 손실을 되돌릴 수 있다.'
AND updated_at = '2026-09-14T14:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-matchup-quinn-20260914');

-- kennen 상대법 (789자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-kennen', 'matchup', NULL, NULL, 'published', 'kennen', '', 0, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 표식 두 개면 교환을 끊는다 · 강화 기본 공격을 확인한다 · 궁극기 때 아군과 흩어진다

## 세 번째 표식 전에 거리를 초기화한다

**케넨의 폭풍 표식이 세 개가 되면 기절하고 케넨은 기력을 돌려받는다.**[* [케넨 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=31)] 두 개가 쌓인 상태에서 막타 하나를 더 먹으려 하지 말고 표식이 사라질 때까지 빠진다. 기절을 허용하면 `Q`와 강화 공격이 다시 돌아와 교환이 길어진다.

## 강화 기본 공격이 준비됐을 때 사거리를 준다

**케넨은 일정 공격마다 다음 기본 공격으로 표식을 남길 수 있다.** 손에 전기가 모인 상태에서는 앞 미니언을 포기하고, 미니언에 소모한 직후 앞으로 나간다. `Q` 투사체는 미니언에 막히므로 강화 공격과 동시에 맞지 않게 웨이브 뒤에 선다.

## 번개 질주가 빠진 뒤 추격한다

**`번개 질주(E)`는 빠르게 이동하며 통과한 대상에게 표식을 남기는 진입·탈출 수단이다.** 먼저 이동기를 쓰면 케넨이 `E`로 거리를 끊는다. 케넨이 웨이브 정리에 사용하고 원래 모습으로 돌아온 뒤에만 긴 교환을 연다.

## 소용돌이 중심에 함께 모이지 않는다

**`날카로운 소용돌이(R)`는 주변 챔피언을 반복 공격해 여러 명에게 기절을 만든다.** 케넨이 측면에서 사라지면 아군끼리 간격을 벌리고 진입선 옆으로 빠진다. 이미 궁극기가 켜졌다면 케넨을 가로질러 도망치지 말고 가장 가까운 바깥쪽으로 나간다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-kennen' AND kind = 'matchup' AND champion_slug = 'kennen'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-kennen');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-matchup-kennen-20260914', id, NULL, 0, general, '탑 딜러 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-kennen' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 표식 두 개면 교환을 끊는다 · 강화 기본 공격을 확인한다 · 궁극기 때 아군과 흩어진다

## 세 번째 표식 전에 거리를 초기화한다

**케넨의 폭풍 표식이 세 개가 되면 기절하고 케넨은 기력을 돌려받는다.**[* [케넨 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=31)] 두 개가 쌓인 상태에서 막타 하나를 더 먹으려 하지 말고 표식이 사라질 때까지 빠진다. 기절을 허용하면 `Q`와 강화 공격이 다시 돌아와 교환이 길어진다.

## 강화 기본 공격이 준비됐을 때 사거리를 준다

**케넨은 일정 공격마다 다음 기본 공격으로 표식을 남길 수 있다.** 손에 전기가 모인 상태에서는 앞 미니언을 포기하고, 미니언에 소모한 직후 앞으로 나간다. `Q` 투사체는 미니언에 막히므로 강화 공격과 동시에 맞지 않게 웨이브 뒤에 선다.

## 번개 질주가 빠진 뒤 추격한다

**`번개 질주(E)`는 빠르게 이동하며 통과한 대상에게 표식을 남기는 진입·탈출 수단이다.** 먼저 이동기를 쓰면 케넨이 `E`로 거리를 끊는다. 케넨이 웨이브 정리에 사용하고 원래 모습으로 돌아온 뒤에만 긴 교환을 연다.

## 소용돌이 중심에 함께 모이지 않는다

**`날카로운 소용돌이(R)`는 주변 챔피언을 반복 공격해 여러 명에게 기절을 만든다.** 케넨이 측면에서 사라지면 아군끼리 간격을 벌리고 진입선 옆으로 빠진다. 이미 궁극기가 켜졌다면 케넨을 가로질러 도망치지 말고 가장 가까운 바깥쪽으로 나간다.'
AND updated_at = '2026-09-14T14:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-matchup-kennen-20260914');

-- vladimir 상대법 (819자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-vladimir', 'matchup', NULL, NULL, 'published', 'vladimir', '', 0, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 강화 `Q` 때 막타를 양보한다 · 미니언으로 `E`를 막는다 · 웅덩이가 빠진 뒤 제어를 건다

## 붉어진 수혈 주기에 앞으로 서지 않는다

**블라디미르는 `수혈(Q)`을 반복한 뒤 잠시 더 강한 피해와 회복을 얻는다.**[* [블라디미르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=73)] 강화 상태에서는 막타 하나를 양보해 사거리를 끊고, 일반 수혈로 돌아온 뒤 교환한다. 체력이 낮다고 강화 수혈 직전에 달려들면 피해와 회복을 동시에 내준다.

## 충전 파도와 몸 사이에 미니언을 둔다

**`선혈의 파도(E)`는 적 유닛에 가로막힐 수 있으므로 웨이브가 방패가 된다.** 블라디미르가 옆으로 움직이면 같은 방향으로 돌지 말고 반대편 미니언 뒤로 선다. 오래 충전할수록 스스로 체력을 쓰므로 맞지 않고 기다리는 것만으로 교환 이득이 생긴다.

## 웅덩이를 먼저 빼고 핵심 공격을 남긴다

**`피의 웅덩이(W)` 중에는 블라디미르를 대상으로 지정할 수 없다.** 큰 제어와 피해를 한꺼번에 쓰지 말고 짧은 위협으로 웅덩이를 유도한다. 웅덩이가 끝나는 위치에 다음 기술을 준비하고, 재사용 전에는 블라디미르의 안전한 탈출 수단이 줄어든다.

## 혈사병이 묻으면 추가 피해를 줄인다

**`혈사병(R)`은 감염 중 받는 피해를 늘리고 끝날 때 블라디미르를 회복시킨다.** 표시가 생기면 맞교환을 계속하지 말고 사거리 밖으로 빠져 후속 피해를 최소화한다. 지연 폭발과 회복이 끝난 뒤 다시 진입해야 체력 계산이 뒤집히지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-vladimir' AND kind = 'matchup' AND champion_slug = 'vladimir'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-vladimir');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-matchup-vladimir-20260914', id, NULL, 0, general, '탑 딜러 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-vladimir' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 강화 `Q` 때 막타를 양보한다 · 미니언으로 `E`를 막는다 · 웅덩이가 빠진 뒤 제어를 건다

## 붉어진 수혈 주기에 앞으로 서지 않는다

**블라디미르는 `수혈(Q)`을 반복한 뒤 잠시 더 강한 피해와 회복을 얻는다.**[* [블라디미르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=73)] 강화 상태에서는 막타 하나를 양보해 사거리를 끊고, 일반 수혈로 돌아온 뒤 교환한다. 체력이 낮다고 강화 수혈 직전에 달려들면 피해와 회복을 동시에 내준다.

## 충전 파도와 몸 사이에 미니언을 둔다

**`선혈의 파도(E)`는 적 유닛에 가로막힐 수 있으므로 웨이브가 방패가 된다.** 블라디미르가 옆으로 움직이면 같은 방향으로 돌지 말고 반대편 미니언 뒤로 선다. 오래 충전할수록 스스로 체력을 쓰므로 맞지 않고 기다리는 것만으로 교환 이득이 생긴다.

## 웅덩이를 먼저 빼고 핵심 공격을 남긴다

**`피의 웅덩이(W)` 중에는 블라디미르를 대상으로 지정할 수 없다.** 큰 제어와 피해를 한꺼번에 쓰지 말고 짧은 위협으로 웅덩이를 유도한다. 웅덩이가 끝나는 위치에 다음 기술을 준비하고, 재사용 전에는 블라디미르의 안전한 탈출 수단이 줄어든다.

## 혈사병이 묻으면 추가 피해를 줄인다

**`혈사병(R)`은 감염 중 받는 피해를 늘리고 끝날 때 블라디미르를 회복시킨다.** 표시가 생기면 맞교환을 계속하지 말고 사거리 밖으로 빠져 후속 피해를 최소화한다. 지연 폭발과 회복이 끝난 뒤 다시 진입해야 체력 계산이 뒤집히지 않는다.'
AND updated_at = '2026-09-14T14:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-matchup-vladimir-20260914');

-- rumble 상대법 (820자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-rumble', 'matchup', NULL, NULL, 'published', 'rumble', '', 0, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 열이 낮을 때 교환한다 · 화염방사기 옆으로 빠진다 · 과열 중에는 거리를 두고 기본 공격을 피한다

## 위험 상태에 들어가기 전에 압박한다

**럼블은 열이 50 이상이면 기술이 강해지고 150에 도달하면 잠시 기술 대신 강화된 기본 공격을 사용한다.**[* [럼블 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=52)] 열이 낮을 때 짧게 교환하고, 위험 상태에서는 `Q`와 `E`를 함께 맞지 않도록 물러난다. 과열했다고 무조건 붙으면 강한 기본 공격에 역으로 손해 본다.

## 화염방사기의 원뿔 옆으로 이동한다

**`화염방사기(Q)`는 럼블이 바라보는 정면을 계속 태우므로 뒤로만 달리면 전체 지속시간을 맞는다.** 럼블 몸을 가로질러 옆으로 꺾거나 원뿔의 가까운 가장자리로 나온다. 기술이 끝난 뒤에는 럼블이 다시 열을 조절해야 하므로 짧게 되받아칠 수 있다.

## 첫 작살 뒤 같은 방향으로 달리지 않는다

**`전기 작살(E)`은 두 발을 저장하며 맞을수록 이동 속도와 마법 저항력이 낮아진다.** 첫 발을 맞았다면 직선 퇴로에서 옆으로 방향을 바꿔 두 번째를 피한다. 두 발이 모두 빠지면 럼블이 거리를 유지할 수단이 줄어든다.

## 이퀄라이저를 가로질러 짧게 나온다

**`이퀄라이저 미사일(R)`은 긴 화염 지대 위에 머무는 시간을 벌어 피해를 누적한다.** 선을 따라 도망치지 말고 가장 가까운 옆 가장자리로 빠진다. 아군과 같은 출구에 몰리지 않도록 서로 반대 방향으로 흩어져 후속 `Q` 범위까지 겹치지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-rumble' AND kind = 'matchup' AND champion_slug = 'rumble'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-rumble');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-matchup-rumble-20260914', id, NULL, 0, general, '탑 딜러 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-rumble' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 열이 낮을 때 교환한다 · 화염방사기 옆으로 빠진다 · 과열 중에는 거리를 두고 기본 공격을 피한다

## 위험 상태에 들어가기 전에 압박한다

**럼블은 열이 50 이상이면 기술이 강해지고 150에 도달하면 잠시 기술 대신 강화된 기본 공격을 사용한다.**[* [럼블 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=52)] 열이 낮을 때 짧게 교환하고, 위험 상태에서는 `Q`와 `E`를 함께 맞지 않도록 물러난다. 과열했다고 무조건 붙으면 강한 기본 공격에 역으로 손해 본다.

## 화염방사기의 원뿔 옆으로 이동한다

**`화염방사기(Q)`는 럼블이 바라보는 정면을 계속 태우므로 뒤로만 달리면 전체 지속시간을 맞는다.** 럼블 몸을 가로질러 옆으로 꺾거나 원뿔의 가까운 가장자리로 나온다. 기술이 끝난 뒤에는 럼블이 다시 열을 조절해야 하므로 짧게 되받아칠 수 있다.

## 첫 작살 뒤 같은 방향으로 달리지 않는다

**`전기 작살(E)`은 두 발을 저장하며 맞을수록 이동 속도와 마법 저항력이 낮아진다.** 첫 발을 맞았다면 직선 퇴로에서 옆으로 방향을 바꿔 두 번째를 피한다. 두 발이 모두 빠지면 럼블이 거리를 유지할 수단이 줄어든다.

## 이퀄라이저를 가로질러 짧게 나온다

**`이퀄라이저 미사일(R)`은 긴 화염 지대 위에 머무는 시간을 벌어 피해를 누적한다.** 선을 따라 도망치지 말고 가장 가까운 옆 가장자리로 빠진다. 아군과 같은 출구에 몰리지 않도록 서로 반대 방향으로 흩어져 후속 `Q` 범위까지 겹치지 않는다.'
AND updated_at = '2026-09-14T14:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-matchup-rumble-20260914');

-- kayle 상대법 (801자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-kayle', 'matchup', NULL, NULL, 'published', 'kayle', '', 0, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 6레벨 전에 웨이브를 통제한다 · `Q`를 맞으면 교환을 끊는다 · 궁극기 무적이 끝날 때 공격한다

## 원거리 공격을 얻기 전에 막타를 압박한다

**케일은 6레벨부터 공격 사거리를 얻고 이후 레벨 구간마다 지속 공격이 강해진다.**[* [케일 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=30)] 초반부터 무작정 라인을 밀어 안전한 막타를 주지 말고 내 쪽에 미니언을 남긴다. 케일이 근접 막타를 먹으러 올 때 짧게 공격하고 체력을 먼저 줄인다.

## 광휘의 일격 뒤에는 맞서지 않는다

**`광휘의 일격(Q)`을 맞으면 둔화와 함께 방어력과 마법 저항력이 낮아진다.** 효과가 남은 동안 긴 교환을 열지 말고 사거리 밖으로 끊는다. 투사체는 첫 대상 뒤로 관통하므로 미니언과 같은 직선보다 옆으로 서서 피한다.

## 화염주문검은 낮은 체력에서 더 경계한다

**`화염주문검(E)`의 강화 공격은 대상이 잃은 체력에 비례한 추가 피해를 준다.** 체력이 낮은 채 막타를 지키겠다고 사거리에 남지 않는다. 케일이 미니언에 강화 공격을 사용한 직후에는 마무리 압력이 줄어 잠깐 앞으로 설 수 있다.

## 무적 동안 큰 피해를 낭비하지 않는다

**`신성한 심판(R)` 대상은 잠시 피해를 받지 않고 주변에는 뒤늦게 검이 떨어진다.** 궁극기가 보이면 처치 기술을 멈추고 낙하 범위 밖으로 빠진다. 무적 종료 시점에 제어와 남은 피해를 맞추되, 케일의 `W` 이동 속도로 거리가 벌어질 방향까지 막는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-kayle' AND kind = 'matchup' AND champion_slug = 'kayle'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-kayle');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-matchup-kayle-20260914', id, NULL, 0, general, '탑 딜러 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-kayle' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 6레벨 전에 웨이브를 통제한다 · `Q`를 맞으면 교환을 끊는다 · 궁극기 무적이 끝날 때 공격한다

## 원거리 공격을 얻기 전에 막타를 압박한다

**케일은 6레벨부터 공격 사거리를 얻고 이후 레벨 구간마다 지속 공격이 강해진다.**[* [케일 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=30)] 초반부터 무작정 라인을 밀어 안전한 막타를 주지 말고 내 쪽에 미니언을 남긴다. 케일이 근접 막타를 먹으러 올 때 짧게 공격하고 체력을 먼저 줄인다.

## 광휘의 일격 뒤에는 맞서지 않는다

**`광휘의 일격(Q)`을 맞으면 둔화와 함께 방어력과 마법 저항력이 낮아진다.** 효과가 남은 동안 긴 교환을 열지 말고 사거리 밖으로 끊는다. 투사체는 첫 대상 뒤로 관통하므로 미니언과 같은 직선보다 옆으로 서서 피한다.

## 화염주문검은 낮은 체력에서 더 경계한다

**`화염주문검(E)`의 강화 공격은 대상이 잃은 체력에 비례한 추가 피해를 준다.** 체력이 낮은 채 막타를 지키겠다고 사거리에 남지 않는다. 케일이 미니언에 강화 공격을 사용한 직후에는 마무리 압력이 줄어 잠깐 앞으로 설 수 있다.

## 무적 동안 큰 피해를 낭비하지 않는다

**`신성한 심판(R)` 대상은 잠시 피해를 받지 않고 주변에는 뒤늦게 검이 떨어진다.** 궁극기가 보이면 처치 기술을 멈추고 낙하 범위 밖으로 빠진다. 무적 종료 시점에 제어와 남은 피해를 맞추되, 케일의 `W` 이동 속도로 거리가 벌어질 방향까지 막는다.'
AND updated_at = '2026-09-14T14:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-matchup-kayle-20260914');

-- akshan 상대법 (861자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-akshan', 'matchup', NULL, NULL, 'published', 'akshan', '', 0, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 미니언과 일직선으로 서지 않는다 · `E` 회전 경로를 몸과 지형으로 끊는다 · 궁극기 탄환은 미니언 뒤에서 막는다

## 부메랑의 왕복 선을 두 번 피한다

**아크샨의 `복수의 부메랑(Q)`은 적을 맞힐 때마다 사거리가 늘고 돌아오며 다시 피해를 준다.**[* [아크샨 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=156)] 미니언 줄 뒤에 서면 사거리를 늘려 챔피언까지 닿으므로 웨이브 옆으로 선다. 첫 투사체를 피한 뒤 아크샨과 같은 방향으로 움직이지 말고 귀환 경로에서도 벗어난다.

## 두 번째 탄을 쏘는지 취소하는지 본다

**아크샨의 기본 공격은 추가 탄으로 피해를 이어 가거나 취소해 이동 속도를 얻는 선택이 있다.** 한 발 맞았다고 즉시 기술을 쓰면 취소 이동으로 피할 수 있다. 두 번째 탄을 쏘며 멈춘 순간에 기술을 맞히고, 취소했다면 이동 속도가 끝날 때까지 거리를 유지한다.

## 영웅의 비상 궤도를 좁힌다

**`영웅의 비상(E)`은 지형에 갈고리를 걸어 회전하며 챔피언이나 지형과 충돌하면 끝난다.** 벽에서 멀리 열린 원을 내주지 말고 아크샨과 갈고리 지점 사이를 압박해 회전 경로를 짧게 만든다. 착지 지점에 제어를 남기고 첫 위치를 향해 기술을 낭비하지 않는다.

## 궁극기는 웨이브와 구조물 뒤에서 받는다

**`인과응보(R)`의 탄환은 챔피언뿐 아니라 미니언과 구조물에도 막힌다.** 조준선이 생기면 혼자 옆으로 달리기보다 포탑이나 건강한 미니언 뒤로 이동한다. 아크샨이 사격을 시작하기 전에 갈고리로 각도를 바꿀 수 있으므로 방패가 될 대상과 같은 선을 계속 유지한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-akshan' AND kind = 'matchup' AND champion_slug = 'akshan'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-akshan');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-matchup-akshan-20260914', id, NULL, 0, general, '탑 딜러 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-akshan' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 미니언과 일직선으로 서지 않는다 · `E` 회전 경로를 몸과 지형으로 끊는다 · 궁극기 탄환은 미니언 뒤에서 막는다

## 부메랑의 왕복 선을 두 번 피한다

**아크샨의 `복수의 부메랑(Q)`은 적을 맞힐 때마다 사거리가 늘고 돌아오며 다시 피해를 준다.**[* [아크샨 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=156)] 미니언 줄 뒤에 서면 사거리를 늘려 챔피언까지 닿으므로 웨이브 옆으로 선다. 첫 투사체를 피한 뒤 아크샨과 같은 방향으로 움직이지 말고 귀환 경로에서도 벗어난다.

## 두 번째 탄을 쏘는지 취소하는지 본다

**아크샨의 기본 공격은 추가 탄으로 피해를 이어 가거나 취소해 이동 속도를 얻는 선택이 있다.** 한 발 맞았다고 즉시 기술을 쓰면 취소 이동으로 피할 수 있다. 두 번째 탄을 쏘며 멈춘 순간에 기술을 맞히고, 취소했다면 이동 속도가 끝날 때까지 거리를 유지한다.

## 영웅의 비상 궤도를 좁힌다

**`영웅의 비상(E)`은 지형에 갈고리를 걸어 회전하며 챔피언이나 지형과 충돌하면 끝난다.** 벽에서 멀리 열린 원을 내주지 말고 아크샨과 갈고리 지점 사이를 압박해 회전 경로를 짧게 만든다. 착지 지점에 제어를 남기고 첫 위치를 향해 기술을 낭비하지 않는다.

## 궁극기는 웨이브와 구조물 뒤에서 받는다

**`인과응보(R)`의 탄환은 챔피언뿐 아니라 미니언과 구조물에도 막힌다.** 조준선이 생기면 혼자 옆으로 달리기보다 포탑이나 건강한 미니언 뒤로 이동한다. 아크샨이 사격을 시작하기 전에 갈고리로 각도를 바꿀 수 있으므로 방패가 될 대상과 같은 선을 계속 유지한다.'
AND updated_at = '2026-09-14T14:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-matchup-akshan-20260914');

-- heimerdinger 상대법 (835자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-heimerdinger', 'matchup', NULL, NULL, 'published', 'heimerdinger', '', 0, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 포탑을 하나씩 바깥에서 지운다 · `E` 수류탄 중앙을 옆으로 피한다 · 강화 기술이 끝난 뒤 들어간다

## 포탑 세 개의 겹친 사거리로 들어가지 않는다

**하이머딩거의 `H-28 G 진화형 포탑(Q)`은 지속 사격과 광선으로 주변 지역을 지킨다.**[* [하이머딩거 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=21)] 챔피언을 먼저 잡으려고 중앙에 뛰지 말고 가장 바깥 포탑부터 사거리 끝에서 지운다. 새 포탑이 설치되면 위치가 완성되기 전에 짧게 공격해 수를 줄인다.

## 로켓이 모이는 지점에서 방향을 바꾼다

**`마법공학 초소형 로켓(W)`은 지정 지점으로 모이므로 커서 근처에 여러 발이 집중된다.** 첫 로켓을 본 뒤 같은 방향으로 계속 달리지 말고 교차점 직전에 옆으로 꺾는다. 미니언과 떨어져 서면 하이머딩거가 웨이브 정리와 견제를 한 번에 하기 어렵다.

## 수류탄 중심을 피한 뒤 돌진한다

**`CH-2 전자폭풍 수류탄(E)`은 중앙 적중 시 기절하고 바깥은 둔화만 준다.** 하이머딩거에게 곧장 달려들면 발밑에 중앙을 맞히기 쉽다. 좌우로 움직여 먼저 사용하게 만들고, 빗나간 뒤 포탑 하나를 정리하거나 짧은 교환을 연다.

## 강화된 기술을 보고 전투 길이를 바꾼다

**`업그레이드!!!(R)`는 다음 `Q`, `W`, `E` 중 하나를 크게 강화한다.** 강화 포탑은 구역을 떠나고, 강화 로켓은 옆으로 넓게 피하며, 강화 수류탄은 연속 충격 경로를 가로지르지 않는다. 강화 효과가 끝난 뒤에 남은 포탑 수를 보고 다시 들어간다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-heimerdinger' AND kind = 'matchup' AND champion_slug = 'heimerdinger'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-heimerdinger');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-matchup-heimerdinger-20260914', id, NULL, 0, general, '탑 딜러 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-heimerdinger' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 포탑을 하나씩 바깥에서 지운다 · `E` 수류탄 중앙을 옆으로 피한다 · 강화 기술이 끝난 뒤 들어간다

## 포탑 세 개의 겹친 사거리로 들어가지 않는다

**하이머딩거의 `H-28 G 진화형 포탑(Q)`은 지속 사격과 광선으로 주변 지역을 지킨다.**[* [하이머딩거 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=21)] 챔피언을 먼저 잡으려고 중앙에 뛰지 말고 가장 바깥 포탑부터 사거리 끝에서 지운다. 새 포탑이 설치되면 위치가 완성되기 전에 짧게 공격해 수를 줄인다.

## 로켓이 모이는 지점에서 방향을 바꾼다

**`마법공학 초소형 로켓(W)`은 지정 지점으로 모이므로 커서 근처에 여러 발이 집중된다.** 첫 로켓을 본 뒤 같은 방향으로 계속 달리지 말고 교차점 직전에 옆으로 꺾는다. 미니언과 떨어져 서면 하이머딩거가 웨이브 정리와 견제를 한 번에 하기 어렵다.

## 수류탄 중심을 피한 뒤 돌진한다

**`CH-2 전자폭풍 수류탄(E)`은 중앙 적중 시 기절하고 바깥은 둔화만 준다.** 하이머딩거에게 곧장 달려들면 발밑에 중앙을 맞히기 쉽다. 좌우로 움직여 먼저 사용하게 만들고, 빗나간 뒤 포탑 하나를 정리하거나 짧은 교환을 연다.

## 강화된 기술을 보고 전투 길이를 바꾼다

**`업그레이드!!!(R)`는 다음 `Q`, `W`, `E` 중 하나를 크게 강화한다.** 강화 포탑은 구역을 떠나고, 강화 로켓은 옆으로 넓게 피하며, 강화 수류탄은 연속 충격 경로를 가로지르지 않는다. 강화 효과가 끝난 뒤에 남은 포탑 수를 보고 다시 들어간다.'
AND updated_at = '2026-09-14T14:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-matchup-heimerdinger-20260914');

-- singed 상대법 (825자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-singed', 'matchup', NULL, NULL, 'published', 'singed', '', 0, '16.17.1', 'guarded', '2026-09-14T14:50:00.000Z', '2026-09-14T14:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 신지드 뒤를 오래 쫓지 않는다 · 접착제 위로 던져질 각을 피한다 · `R`이 켜지면 전투를 끊는다

## 독길을 따라 직선으로 추격하지 않는다

**신지드의 `맹독의 자취(Q)`는 지나간 자리에 독구름을 남겨 뒤따르는 적에게 계속 피해를 준다.**[* [신지드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=56)] 체력이 낮아 보여도 같은 길을 오래 쫓지 말고 옆으로 빠져 다음 이동 지점을 선점한다. 신지드 대신 웨이브를 정리하면 다시 돌아올 이유를 만들 수 있다.

## 접착제와 신지드 사이에 서지 않는다

**`초강력 접착제(W)`는 이동 기술을 막고, 그 위로 `던져넘기기(E)`를 당하면 속박된다.** 바닥 구역이 생기면 신지드 반대쪽으로 돌아 던져질 착지점을 바꾼다. 이동기는 접착제에 들어가기 전에 쓰고, 이미 안에 있다면 가장 가까운 가장자리로 걸어 나온다.

## 던져넘기기 이후 바로 되돌아가지 않는다

**`던져넘기기(E)`는 대상을 신지드 뒤로 보내므로 곧장 따라붙으면 다시 독길 안에 선다.** 착지 뒤 독 바깥쪽으로 빠지고 재사용 전까지 거리를 유지한다. 신지드가 아군 쪽으로 넘기러 들어올 때만 짧은 제어로 접근을 끊는다.

## 광기의 물약은 시간을 보내서 뺀다

**`광기의 물약(R)`이 켜진 신지드는 여러 능력치가 올라가고 독에 회복 감소 효과까지 생긴다.** 좁은 길에서 맞싸우지 말고 서로 흩어져 이동하며 강화 시간을 소모시킨다. 궁극기가 끝난 뒤 남아 있는 접착제와 던져넘기기 여부를 확인하고 다시 들어간다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-singed' AND kind = 'matchup' AND champion_slug = 'singed'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-singed');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-damage-matchup-singed-20260914', id, NULL, 0, general, '탑 딜러 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-singed' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 신지드 뒤를 오래 쫓지 않는다 · 접착제 위로 던져질 각을 피한다 · `R`이 켜지면 전투를 끊는다

## 독길을 따라 직선으로 추격하지 않는다

**신지드의 `맹독의 자취(Q)`는 지나간 자리에 독구름을 남겨 뒤따르는 적에게 계속 피해를 준다.**[* [신지드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=56)] 체력이 낮아 보여도 같은 길을 오래 쫓지 말고 옆으로 빠져 다음 이동 지점을 선점한다. 신지드 대신 웨이브를 정리하면 다시 돌아올 이유를 만들 수 있다.

## 접착제와 신지드 사이에 서지 않는다

**`초강력 접착제(W)`는 이동 기술을 막고, 그 위로 `던져넘기기(E)`를 당하면 속박된다.** 바닥 구역이 생기면 신지드 반대쪽으로 돌아 던져질 착지점을 바꾼다. 이동기는 접착제에 들어가기 전에 쓰고, 이미 안에 있다면 가장 가까운 가장자리로 걸어 나온다.

## 던져넘기기 이후 바로 되돌아가지 않는다

**`던져넘기기(E)`는 대상을 신지드 뒤로 보내므로 곧장 따라붙으면 다시 독길 안에 선다.** 착지 뒤 독 바깥쪽으로 빠지고 재사용 전까지 거리를 유지한다. 신지드가 아군 쪽으로 넘기러 들어올 때만 짧은 제어로 접근을 끊는다.

## 광기의 물약은 시간을 보내서 뺀다

**`광기의 물약(R)`이 켜진 신지드는 여러 능력치가 올라가고 독에 회복 감소 효과까지 생긴다.** 좁은 길에서 맞싸우지 말고 서로 흩어져 이동하며 강화 시간을 소모시킨다. 궁극기가 끝난 뒤 남아 있는 접착제와 던져넘기기 여부를 확인하고 다시 들어간다.'
AND updated_at = '2026-09-14T14:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-damage-matchup-singed-20260914');
