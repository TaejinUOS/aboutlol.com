-- scripts/seed-top-tank-wiki.ts가 생성. 원고는 seeds/champion-wiki와 seeds/top-tank-matchup-wiki.
-- 기존 사용자 편집을 보존하고, 조사 시점과 상태가 정확히 같은 시스템 초안만 갱신한다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)
VALUES ('user-system', 'system', 'seed', '깨남.COM', NULL, 'admin', '2026-09-13T06:00:00.000Z');

-- 오른 챔피언 위키 (1133자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-tank-champion-ornn-20260913', 'article', '오른', '오른', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 짧은 교환은 불안정 표식까지 터뜨린다 · `Q` 기둥은 `E`의 출발점이다 · 궁극기는 정령보다 상대의 이동을 본다

[[분류:탑]] [[분류:탱커]]

## 라인에 오래 남는 힘을 웨이브 이득으로 바꾼다

**오른의 제작 능력은 귀환을 완전히 대신하는 기술이 아니라, 좋은 웨이브를 한 번 더 만들 수 있는 시간 차이다.**[* [입문자를 위한 오른 파헤치기](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137340)] 제작하려고 뒤로 빠지는 동안 상대가 라인을 밀 수 있으므로 다음 미니언이 어디에 있는지 먼저 본다. 체력과 마나가 부족하면 억지로 남지 않고, 버틸 수 있을 때만 제작 후 한 웨이브를 더 정리한다.

## `Q`를 맞힌 자리가 다음 싸움의 지형이다

**`용암 균열(Q)`은 둔화 뒤에 기둥을 남긴다.**[* [오른 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=138)] 상대를 맞히는 것만 보지 말고 **기둥과 벽 사이로 상대가 빠질 길**을 계산한다. 기둥이 생기기 전에 `화염 돌진(E)`을 누르면 벽 충돌이 늦거나 빗나간다. 상대가 기둥 반대편으로 물러났다면 억지로 돌진하지 않고 그만큼의 공간으로 막타와 라인 위치를 챙긴다.

## `W`의 마지막 불꽃 뒤에 기본 공격을 남긴다

**`불꽃 풀무질(W)`의 마지막 불꽃이 불안정을 묻힌다.** 끝까지 맞히지 못할 거리라면 마나를 써서 앞으로 걷기보다 `Q` 둔화를 먼저 만든다. 불안정이 묻은 뒤 기본 공격이나 다른 띄우기로 표식을 터뜨리는 데까지가 한 번의 교환이다. 표식을 남겨 둔 채 상대 포탑 쪽으로 한 대 더 따라가면 오른의 긴 기술 재사용 대기시간만 드러난다.

## 궁극기는 두 번째 박치기 자리를 먼저 고른다

**`대장장이 신의 부름(R)`은 첫 정령을 맞히는 것보다 되받아칠 각이 중요하다.** 정령이 오는 동안 상대만 보다가 벽이나 방해 효과에 막히지 않도록 **오른이 서 있을 자리와 박치기 방향을 먼저 정한다.** 좁은 길에서는 여러 명을 노릴 수 있지만 아군이 닿지 않는 거리라면 좋은 적중도 처치로 이어지지 않는다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-tank-champion-ornn-20260913' OR (kind = 'article' AND title_key = '오른'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-ornn-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-tank-champion-ornn-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 짧은 교환은 불안정 표식까지 터뜨린다 · `Q` 기둥은 `E`의 출발점이다 · 궁극기는 정령보다 상대의 이동을 본다

[[분류:탑]] [[분류:탱커]]

## 라인에 오래 남는 힘을 웨이브 이득으로 바꾼다

**오른의 제작 능력은 귀환을 완전히 대신하는 기술이 아니라, 좋은 웨이브를 한 번 더 만들 수 있는 시간 차이다.**[* [입문자를 위한 오른 파헤치기](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137340)] 제작하려고 뒤로 빠지는 동안 상대가 라인을 밀 수 있으므로 다음 미니언이 어디에 있는지 먼저 본다. 체력과 마나가 부족하면 억지로 남지 않고, 버틸 수 있을 때만 제작 후 한 웨이브를 더 정리한다.

## `Q`를 맞힌 자리가 다음 싸움의 지형이다

**`용암 균열(Q)`은 둔화 뒤에 기둥을 남긴다.**[* [오른 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=138)] 상대를 맞히는 것만 보지 말고 **기둥과 벽 사이로 상대가 빠질 길**을 계산한다. 기둥이 생기기 전에 `화염 돌진(E)`을 누르면 벽 충돌이 늦거나 빗나간다. 상대가 기둥 반대편으로 물러났다면 억지로 돌진하지 않고 그만큼의 공간으로 막타와 라인 위치를 챙긴다.

## `W`의 마지막 불꽃 뒤에 기본 공격을 남긴다

**`불꽃 풀무질(W)`의 마지막 불꽃이 불안정을 묻힌다.** 끝까지 맞히지 못할 거리라면 마나를 써서 앞으로 걷기보다 `Q` 둔화를 먼저 만든다. 불안정이 묻은 뒤 기본 공격이나 다른 띄우기로 표식을 터뜨리는 데까지가 한 번의 교환이다. 표식을 남겨 둔 채 상대 포탑 쪽으로 한 대 더 따라가면 오른의 긴 기술 재사용 대기시간만 드러난다.

## 궁극기는 두 번째 박치기 자리를 먼저 고른다

**`대장장이 신의 부름(R)`은 첫 정령을 맞히는 것보다 되받아칠 각이 중요하다.** 정령이 오는 동안 상대만 보다가 벽이나 방해 효과에 막히지 않도록 **오른이 서 있을 자리와 박치기 방향을 먼저 정한다.** 좁은 길에서는 여러 명을 노릴 수 있지만 아군이 닿지 않는 거리라면 좋은 적중도 처치로 이어지지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-ornn-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-ornn-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-tank-champion-ornn-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-ornn-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-top-tank-champion-ornn-20260913';

-- ornn 상대법 (985자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-ornn', 'matchup', NULL, NULL, 'published', 'ornn', '', 0, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 기둥과 벽을 한 줄에 두지 않는다 · 불안정 표식 뒤의 기본 공격을 끊는다 · 궁극기는 오른의 박치기 위치를 본다

## 제작 중인 시간은 압박하되 무리해서 잡으러 가지 않는다

**오른이 라인 뒤에서 제작을 시작하면 그 짧은 시간 동안 막타와 위치를 먼저 잡는다.**[* [입문자를 위한 오른 파헤치기](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137340)] 제작을 끊겠다고 큰 웨이브를 가로질러 들어가면 미니언 피해로 교환을 진다. 대신 라인을 밀어 귀환 선택을 어렵게 만들거나, 강가 시야를 먼저 잡아 다음 웨이브의 주도권으로 바꾼다.

## `Q` 기둥이 생긴 뒤에는 옆으로 빠진다

**`용암 균열(Q)`에 맞았다면 뒤로만 달리지 않는다.**[* [오른 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=138)] 내 뒤의 자연 지형과 새로 생길 기둥이 `화염 돌진(E)` 한 번에 이어지지 않는지 본다. **벽과 기둥 사이에 서 있는 순간이 오른의 가장 단순한 띄우기 각**이다. `E`가 빠진 뒤에는 오른의 즉시 접근 수단이 줄어드니 짧게 체력이나 라인 이득을 돌려받는다.

## 불안정이 묻으면 한 대를 덜 치고 간격을 만든다

**`불꽃 풀무질(W)` 마지막 타격에 맞으면 표식이 남는다.** 이때 기본 공격 한 대를 더 욕심내면 오른이 표식을 터뜨리며 교환을 완성한다. 표식이 사라질 때까지 거리를 벌리고, `W`가 빗나갔을 때만 긴 교환을 연다.

## 궁극기의 첫 적중보다 되받아치는 오른을 방해한다

**정령이 지나오는 선에서 옆으로 벗어나고, 팀에 밀치기나 기절이 있다면 정령과 충돌하려는 오른에게 남긴다.** 여러 명이 같은 방향으로 도망가면 두 번째 정령에 한꺼번에 뜬다. 좁은 입구를 비우고 서로 다른 각으로 벌어지는 편이 안전하다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-ornn' AND kind = 'matchup' AND champion_slug = 'ornn'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-ornn');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-ornn-20260913', id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-ornn' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 기둥과 벽을 한 줄에 두지 않는다 · 불안정 표식 뒤의 기본 공격을 끊는다 · 궁극기는 오른의 박치기 위치를 본다

## 제작 중인 시간은 압박하되 무리해서 잡으러 가지 않는다

**오른이 라인 뒤에서 제작을 시작하면 그 짧은 시간 동안 막타와 위치를 먼저 잡는다.**[* [입문자를 위한 오른 파헤치기](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137340)] 제작을 끊겠다고 큰 웨이브를 가로질러 들어가면 미니언 피해로 교환을 진다. 대신 라인을 밀어 귀환 선택을 어렵게 만들거나, 강가 시야를 먼저 잡아 다음 웨이브의 주도권으로 바꾼다.

## `Q` 기둥이 생긴 뒤에는 옆으로 빠진다

**`용암 균열(Q)`에 맞았다면 뒤로만 달리지 않는다.**[* [오른 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=138)] 내 뒤의 자연 지형과 새로 생길 기둥이 `화염 돌진(E)` 한 번에 이어지지 않는지 본다. **벽과 기둥 사이에 서 있는 순간이 오른의 가장 단순한 띄우기 각**이다. `E`가 빠진 뒤에는 오른의 즉시 접근 수단이 줄어드니 짧게 체력이나 라인 이득을 돌려받는다.

## 불안정이 묻으면 한 대를 덜 치고 간격을 만든다

**`불꽃 풀무질(W)` 마지막 타격에 맞으면 표식이 남는다.** 이때 기본 공격 한 대를 더 욕심내면 오른이 표식을 터뜨리며 교환을 완성한다. 표식이 사라질 때까지 거리를 벌리고, `W`가 빗나갔을 때만 긴 교환을 연다.

## 궁극기의 첫 적중보다 되받아치는 오른을 방해한다

**정령이 지나오는 선에서 옆으로 벗어나고, 팀에 밀치기나 기절이 있다면 정령과 충돌하려는 오른에게 남긴다.** 여러 명이 같은 방향으로 도망가면 두 번째 정령에 한꺼번에 뜬다. 좁은 입구를 비우고 서로 다른 각으로 벌어지는 편이 안전하다.'
AND updated_at = '2026-09-13T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-ornn-20260913');

-- 말파이트 챔피언 위키 (1089자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-tank-champion-malphite-20260913', 'article', '말파이트', '말파이트', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 보호막이 돌아온 교환만 고른다 · `Q`는 피해와 거리 조절을 함께 산다 · 궁극기는 보유 자체로 상대 진형을 벌린다

[[분류:탑]] [[분류:탱커]]

## 화강암 방패가 없을 때는 다음 교환을 기다린다

**말파이트는 보호막이 있을 때 받은 피해를 지우며 짧게 교환하는 챔피언이다.**[* [다이아) 캐리형 최대추댐 탑 탱커 말파이트](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133569&vtype=pc)] 보호막이 깨진 직후 같은 자리에서 막타를 더 먹으면 체력으로 비용을 낸다. 잠시 공격받지 않을 공간을 만들고, 보호막이 돌아오는 순간 상대의 막타 타이밍에 맞춰 다시 앞으로 나간다.

## `Q`를 견제기가 아니라 간격을 만드는 기술로 쓴다

**`지진의 파편(Q)`은 상대 이동 속도를 훔친다.**[* [말파이트 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=36)] 피해만 넣고 제자리로 돌아오면 마나만 줄지만, 상대가 붙는 순간 사용해 빠지거나 아군 정글이 오는 방향으로 상대를 몰면 이동 속도 차이가 실제 이득이 된다. 원거리 상대에게 매번 던지기보다 **막타를 포기시키거나 다음 기본 공격까지 닿을 때** 사용한다.

## 근접 교환은 `E`의 공격 속도 감소까지 묶는다

**상대가 기본 공격으로 길게 싸우려 들어오면 `지면 강타(E)`를 먼저 맞혀 공격 속도를 낮추고 `천둥소리(W)`의 강화 공격을 이어 간다.** 반대로 기술 피해 위주 상대에게는 `E`의 가치가 낮아질 수 있으니, 웨이브를 무리하게 밀기 위해 쓰지 않고 접근을 끊을 때 남겨 둔다.

## 궁극기를 서두르지 않을수록 진입 각이 넓어진다

**`멈출 수 없는 힘(R)`은 먼저 보이는 한 명에게 쓰는 버튼이 아니다.** **말파이트가 시야에 서 있기만 해도 상대 딜러는 서로 붙기 어렵다.** 아군이 후속 피해를 넣을 거리인지, 상대 이동기가 빠졌는지 확인한다. 한 명을 확실히 끊는 궁과 여러 명을 띄우는 궁 중 그 교전에서 필요한 쪽을 고른다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-tank-champion-malphite-20260913' OR (kind = 'article' AND title_key = '말파이트'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-malphite-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-tank-champion-malphite-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 보호막이 돌아온 교환만 고른다 · `Q`는 피해와 거리 조절을 함께 산다 · 궁극기는 보유 자체로 상대 진형을 벌린다

[[분류:탑]] [[분류:탱커]]

## 화강암 방패가 없을 때는 다음 교환을 기다린다

**말파이트는 보호막이 있을 때 받은 피해를 지우며 짧게 교환하는 챔피언이다.**[* [다이아) 캐리형 최대추댐 탑 탱커 말파이트](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133569&vtype=pc)] 보호막이 깨진 직후 같은 자리에서 막타를 더 먹으면 체력으로 비용을 낸다. 잠시 공격받지 않을 공간을 만들고, 보호막이 돌아오는 순간 상대의 막타 타이밍에 맞춰 다시 앞으로 나간다.

## `Q`를 견제기가 아니라 간격을 만드는 기술로 쓴다

**`지진의 파편(Q)`은 상대 이동 속도를 훔친다.**[* [말파이트 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=36)] 피해만 넣고 제자리로 돌아오면 마나만 줄지만, 상대가 붙는 순간 사용해 빠지거나 아군 정글이 오는 방향으로 상대를 몰면 이동 속도 차이가 실제 이득이 된다. 원거리 상대에게 매번 던지기보다 **막타를 포기시키거나 다음 기본 공격까지 닿을 때** 사용한다.

## 근접 교환은 `E`의 공격 속도 감소까지 묶는다

**상대가 기본 공격으로 길게 싸우려 들어오면 `지면 강타(E)`를 먼저 맞혀 공격 속도를 낮추고 `천둥소리(W)`의 강화 공격을 이어 간다.** 반대로 기술 피해 위주 상대에게는 `E`의 가치가 낮아질 수 있으니, 웨이브를 무리하게 밀기 위해 쓰지 않고 접근을 끊을 때 남겨 둔다.

## 궁극기를 서두르지 않을수록 진입 각이 넓어진다

**`멈출 수 없는 힘(R)`은 먼저 보이는 한 명에게 쓰는 버튼이 아니다.** **말파이트가 시야에 서 있기만 해도 상대 딜러는 서로 붙기 어렵다.** 아군이 후속 피해를 넣을 거리인지, 상대 이동기가 빠졌는지 확인한다. 한 명을 확실히 끊는 궁과 여러 명을 띄우는 궁 중 그 교전에서 필요한 쪽을 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-malphite-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-malphite-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-tank-champion-malphite-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-malphite-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-top-tank-champion-malphite-20260913';

-- malphite 상대법 (978자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-malphite', 'matchup', NULL, NULL, 'published', 'malphite', '', 0, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 작은 공격으로 보호막 재생을 막는다 · `Q`를 쓴 뒤의 마나와 거리를 본다 · 6레벨부터 정글 위치와 궁극기 각을 함께 계산한다

## 보호막을 깨는 공격과 본 교환을 나눈다

**말파이트의 화강암 방패가 켜진 상태에서 큰 기술부터 쓰면 체력에 닿는 피해가 줄어든다.**[* [다이아) 캐리형 최대추댐 탑 탱커 말파이트](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133569&vtype=pc)] 기본 공격이나 짧은 견제로 먼저 보호막을 지우고, 재생되기 전에 다음 교환을 건다. 다만 보호막을 막겠다고 매번 앞으로 걸으면 `Q` 이동 속도 차이로 되받아칠 수 있으니 웨이브가 내 편일 때만 반복한다.

## `Q`를 맞은 직후 따라가지 않는다

**`지진의 파편(Q)`은 내 이동 속도를 빼앗아 말파이트에게 준다.**[* [말파이트 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=36)] 맞은 직후 추격하면 거리는 벌어지고 적 미니언 피해만 받는다. 말파이트가 마나를 써서 막타를 먹었는지, 견제에 썼는지 구분한다. **견제만 반복해 마나가 줄었다면 라인을 밀어 선택지를 좁힌다.**

## 평타 기반 챔피언은 `E`가 빠진 뒤 길게 싸운다

**`지면 강타(E)`에 맞으면 공격 속도가 낮아진다.** 기술을 맞은 상태에서 맞딜을 이어 가지 말고 한 번 빠졌다가 감소 효과와 재사용 대기시간을 기다린다. 말파이트가 웨이브 정리에 `E`를 썼다면 그때가 긴 교환을 열기 쉬운 창이다.

## 6레벨 이후에는 일직선으로 겹치지 않는다

**상대 정글이 보이지 않을 때 말파이트의 궁극기 사거리 안에서 체력을 낮게 유지하지 않는다.** 한타에서는 딜러와 보조 인원이 같은 원 안에 뭉치지 않고, 말파이트가 시야에서 사라졌다면 좁은 입구를 먼저 확인한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-malphite' AND kind = 'matchup' AND champion_slug = 'malphite'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-malphite');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-malphite-20260913', id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-malphite' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 작은 공격으로 보호막 재생을 막는다 · `Q`를 쓴 뒤의 마나와 거리를 본다 · 6레벨부터 정글 위치와 궁극기 각을 함께 계산한다

## 보호막을 깨는 공격과 본 교환을 나눈다

**말파이트의 화강암 방패가 켜진 상태에서 큰 기술부터 쓰면 체력에 닿는 피해가 줄어든다.**[* [다이아) 캐리형 최대추댐 탑 탱커 말파이트](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133569&vtype=pc)] 기본 공격이나 짧은 견제로 먼저 보호막을 지우고, 재생되기 전에 다음 교환을 건다. 다만 보호막을 막겠다고 매번 앞으로 걸으면 `Q` 이동 속도 차이로 되받아칠 수 있으니 웨이브가 내 편일 때만 반복한다.

## `Q`를 맞은 직후 따라가지 않는다

**`지진의 파편(Q)`은 내 이동 속도를 빼앗아 말파이트에게 준다.**[* [말파이트 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=36)] 맞은 직후 추격하면 거리는 벌어지고 적 미니언 피해만 받는다. 말파이트가 마나를 써서 막타를 먹었는지, 견제에 썼는지 구분한다. **견제만 반복해 마나가 줄었다면 라인을 밀어 선택지를 좁힌다.**

## 평타 기반 챔피언은 `E`가 빠진 뒤 길게 싸운다

**`지면 강타(E)`에 맞으면 공격 속도가 낮아진다.** 기술을 맞은 상태에서 맞딜을 이어 가지 말고 한 번 빠졌다가 감소 효과와 재사용 대기시간을 기다린다. 말파이트가 웨이브 정리에 `E`를 썼다면 그때가 긴 교환을 열기 쉬운 창이다.

## 6레벨 이후에는 일직선으로 겹치지 않는다

**상대 정글이 보이지 않을 때 말파이트의 궁극기 사거리 안에서 체력을 낮게 유지하지 않는다.** 한타에서는 딜러와 보조 인원이 같은 원 안에 뭉치지 않고, 말파이트가 시야에서 사라졌다면 좁은 입구를 먼저 확인한다.'
AND updated_at = '2026-09-13T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-malphite-20260913');

-- 쉔 챔피언 위키 (1082자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-tank-champion-shen-20260913', 'article', '쉔', '쉔', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 기의 검이 상대를 통과해야 교환이 강해진다 · `W`는 평타 한 묶음을 지운다 · 궁극기 전에 탑 웨이브의 비용을 계산한다

[[분류:탑]] [[분류:탱커]]

## 기의 검 위치가 다음 교환의 절반이다

**쉔은 `황혼 강습(Q)`으로 검을 불러올 때 검이 적 챔피언을 통과해야 강화 공격과 둔화를 제대로 얻는다.**[* [쉔은 절대 라인전 약캐가 아닙니다](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115811&vtype=pc)] 검이 항상 쉔 뒤에만 있으면 상대가 안전한 쪽으로 물러나기 쉽다. 교환이 끝난 뒤 검을 상대 뒤쪽에 남길 수 있는 자리로 움직여 다음 막타 타이밍을 압박한다.

## `W`는 공격 한 대가 아니라 상대의 리듬을 막는다

**`의지의 결계(W)`는 기의 검 주변에서 기본 공격을 차단한다.**[* [쉔 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=55)] 상대가 강화 공격이나 연속 기본 공격을 시작하는 순간 켜야 가치가 크다. 너무 일찍 켜면 상대가 결계 밖에서 기다린다. **검 위치와 아군 위치를 함께 보면 쉔 자신뿐 아니라 교전 중인 아군의 핵심 공격도 지울 수 있다.**

## `E`로 들어가기 전에 빠져나올 장면까지 본다

**`그림자 돌진(E)`이 적중하면 교환이 열리지만 빗나가면 쉔의 퇴로와 기력이 동시에 줄어든다.** 큰 적 웨이브 안이나 상대 포탑 쪽으로 최대 사거리 도발을 시도하지 않는다. 상대 이동기가 빠지고 아군이 닿을 때, 또는 짧은 도발 뒤 `Q` 강화 공격만 넣고 빠질 수 있을 때 사용한다.

## 궁극기의 이득에서 탑 웨이브를 뺀다

**`단결된 의지(R)`로 아군을 살려도 큰 웨이브와 포탑을 함께 잃으면 실제 이득이 작다.** 궁을 누르기 전에 현재 웨이브를 밀 수 있는지, 상대 탑이 포탑을 얼마나 때릴지, 도착 후 귀환할 수 있는지를 빠르게 본다. 보호막이 필요한 아군보다 **도착한 쉔이 바로 도발로 연결할 수 있는 아군**이 좋은 대상일 때가 많다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-tank-champion-shen-20260913' OR (kind = 'article' AND title_key = '쉔'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-shen-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-tank-champion-shen-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 기의 검이 상대를 통과해야 교환이 강해진다 · `W`는 평타 한 묶음을 지운다 · 궁극기 전에 탑 웨이브의 비용을 계산한다

[[분류:탑]] [[분류:탱커]]

## 기의 검 위치가 다음 교환의 절반이다

**쉔은 `황혼 강습(Q)`으로 검을 불러올 때 검이 적 챔피언을 통과해야 강화 공격과 둔화를 제대로 얻는다.**[* [쉔은 절대 라인전 약캐가 아닙니다](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115811&vtype=pc)] 검이 항상 쉔 뒤에만 있으면 상대가 안전한 쪽으로 물러나기 쉽다. 교환이 끝난 뒤 검을 상대 뒤쪽에 남길 수 있는 자리로 움직여 다음 막타 타이밍을 압박한다.

## `W`는 공격 한 대가 아니라 상대의 리듬을 막는다

**`의지의 결계(W)`는 기의 검 주변에서 기본 공격을 차단한다.**[* [쉔 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=55)] 상대가 강화 공격이나 연속 기본 공격을 시작하는 순간 켜야 가치가 크다. 너무 일찍 켜면 상대가 결계 밖에서 기다린다. **검 위치와 아군 위치를 함께 보면 쉔 자신뿐 아니라 교전 중인 아군의 핵심 공격도 지울 수 있다.**

## `E`로 들어가기 전에 빠져나올 장면까지 본다

**`그림자 돌진(E)`이 적중하면 교환이 열리지만 빗나가면 쉔의 퇴로와 기력이 동시에 줄어든다.** 큰 적 웨이브 안이나 상대 포탑 쪽으로 최대 사거리 도발을 시도하지 않는다. 상대 이동기가 빠지고 아군이 닿을 때, 또는 짧은 도발 뒤 `Q` 강화 공격만 넣고 빠질 수 있을 때 사용한다.

## 궁극기의 이득에서 탑 웨이브를 뺀다

**`단결된 의지(R)`로 아군을 살려도 큰 웨이브와 포탑을 함께 잃으면 실제 이득이 작다.** 궁을 누르기 전에 현재 웨이브를 밀 수 있는지, 상대 탑이 포탑을 얼마나 때릴지, 도착 후 귀환할 수 있는지를 빠르게 본다. 보호막이 필요한 아군보다 **도착한 쉔이 바로 도발로 연결할 수 있는 아군**이 좋은 대상일 때가 많다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-shen-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-shen-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-tank-champion-shen-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-shen-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-top-tank-champion-shen-20260913';

-- shen 상대법 (935자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-shen', 'matchup', NULL, NULL, 'published', 'shen', '', 0, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 쉔과 기의 검 사이에 서지 않는다 · 결계가 끝난 뒤 기본 공격을 몰아친다 · 쉔이 궁을 쓰면 끊기와 웨이브 이득 중 빠른 쪽을 고른다

## 검이 내 뒤에 놓였는지 먼저 본다

**쉔 본체만 보면 `Q` 강화 공격 각을 놓친다.**[* [쉔은 절대 라인전 약캐가 아닙니다](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115811&vtype=pc)] 기의 검과 쉔 사이에 서 있으면 검이 통과하며 쉔의 다음 공격이 강해진다. 막타를 먹을 때 두 점을 한 줄로 만들지 않고 옆으로 선다. 검이 쉔 가까이에 이미 있다면 통과 강화가 어려워져 짧게 견제하기 좋다.

## `W` 안에서 기본 공격을 낭비하지 않는다

**기의 검 주변에 결계가 생기면 기본 공격을 잠시 멈추고 위치를 바꾼다.**[* [쉔 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=55)] 강화 평타나 공격 속도 증가 기술을 결계에 쏟지 않는다. `W`가 끝난 뒤에도 쉔의 `E`가 남아 있다면 바로 추격하지 말고 도발 경로를 옆으로 비튼다.

## 도발이 빗나가면 웨이브가 허락하는 만큼만 응징한다

**`그림자 돌진(E)`이 빠진 쉔은 즉시 거리를 줄일 방법이 줄어든다.** 다만 적 미니언이 많다면 긴 추격보다 체력 한 번과 라인 위치를 가져오는 것으로 끝낸다. 포탑 쪽으로 도망가는 쉔을 따라가다 다음 `Q`와 보호막까지 기다려 주지 않는다.

## 궁극기 정신 집중을 보자마자 결정을 끝낸다

**끊을 수 있는 방해 기술과 거리가 있다면 즉시 사용한다.** 끊을 수 없다면 뒤늦게 맵을 따라가기보다 웨이브를 포탑에 넣고 포탑 피해를 챙긴다. 쉔이 돌아올 경로에 시야를 남겨 복귀 후 기습까지 대비한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-shen' AND kind = 'matchup' AND champion_slug = 'shen'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-shen');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-shen-20260913', id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-shen' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 쉔과 기의 검 사이에 서지 않는다 · 결계가 끝난 뒤 기본 공격을 몰아친다 · 쉔이 궁을 쓰면 끊기와 웨이브 이득 중 빠른 쪽을 고른다

## 검이 내 뒤에 놓였는지 먼저 본다

**쉔 본체만 보면 `Q` 강화 공격 각을 놓친다.**[* [쉔은 절대 라인전 약캐가 아닙니다](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115811&vtype=pc)] 기의 검과 쉔 사이에 서 있으면 검이 통과하며 쉔의 다음 공격이 강해진다. 막타를 먹을 때 두 점을 한 줄로 만들지 않고 옆으로 선다. 검이 쉔 가까이에 이미 있다면 통과 강화가 어려워져 짧게 견제하기 좋다.

## `W` 안에서 기본 공격을 낭비하지 않는다

**기의 검 주변에 결계가 생기면 기본 공격을 잠시 멈추고 위치를 바꾼다.**[* [쉔 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=55)] 강화 평타나 공격 속도 증가 기술을 결계에 쏟지 않는다. `W`가 끝난 뒤에도 쉔의 `E`가 남아 있다면 바로 추격하지 말고 도발 경로를 옆으로 비튼다.

## 도발이 빗나가면 웨이브가 허락하는 만큼만 응징한다

**`그림자 돌진(E)`이 빠진 쉔은 즉시 거리를 줄일 방법이 줄어든다.** 다만 적 미니언이 많다면 긴 추격보다 체력 한 번과 라인 위치를 가져오는 것으로 끝낸다. 포탑 쪽으로 도망가는 쉔을 따라가다 다음 `Q`와 보호막까지 기다려 주지 않는다.

## 궁극기 정신 집중을 보자마자 결정을 끝낸다

**끊을 수 있는 방해 기술과 거리가 있다면 즉시 사용한다.** 끊을 수 없다면 뒤늦게 맵을 따라가기보다 웨이브를 포탑에 넣고 포탑 피해를 챙긴다. 쉔이 돌아올 경로에 시야를 남겨 복귀 후 기습까지 대비한다.'
AND updated_at = '2026-09-13T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-shen-20260913');

-- 크산테 챔피언 위키 (1113자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-tank-champion-ksante-20260913', 'article', '크산테', '크산테', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 중첩을 교환 전에 준비한다 · `W` 충전은 피해 감소와 이동 방향을 함께 고른다 · 총공세는 탱커 역할을 내려놓는 선택이다

[[분류:탑]] [[분류:탱커]]

## `Q` 세 번째 타격을 준비한 뒤 상대의 막타를 본다

**크산테는 `엔토포 타격(Q)` 두 번을 미니언에 적중시킨 뒤 생기는 끌어당김으로 교환을 설계한다.**[* [크산테의 핵심 정동열](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148170&vtype=pc)] 세 번째 `Q`가 준비됐다고 바로 던지면 상대는 뒤로 빠지기만 하면 된다. 상대가 막타 때문에 멈추는 순간이나 아군 정글이 닿는 방향으로 움직였을 때 사용한다. 준비 시간이 끝나기 직전이라고 나쁜 각에 억지로 쓰지 않는다.

## 표식을 터뜨릴 기본 공격까지가 짧은 교환이다

**기술을 맞힌 뒤 생긴 표식은 기본 공격으로 소비해야 피해가 완성된다.**[* [크산테 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=162)] 하지만 표식 한 번 때문에 큰 적 웨이브 안으로 걸어가면 손해가 더 크다. `Q` 둔화나 `발놀림(E)` 보호막으로 안전하게 닿을 때만 공격하고, 상대가 거리를 내줬다면 다음 중첩을 준비한다.

## `W`는 오래 모으는 것보다 밀어낼 방향이 중요하다

**`길을 여는 자(W)` 충전 중에는 피해를 줄이며 방해 효과를 버틸 수 있다.** 정면 피해를 막는 데만 쓰지 말고 **상대를 벽이나 아군 쪽으로 밀 수 있는 각**을 만든다. 최대 충전에 집착하면 상대가 옆으로 비켜난다. 필요한 거리와 기절 시간이 나왔을 때 일찍 놓는 편이 낫다.

## 총공세 뒤에는 다시 탱커처럼 서 있지 않는다

**`총공세(R)`는 적을 벽 너머로 분리하지만 크산테의 방어 능력도 크게 낮춘다.** 아군이 상대 앞선을 받아 줄 수 있는지, 데려간 적을 제한 시간 안에 끝낼 수 있는지 확인한다. 처치하지 못했는데 적진 한가운데로 돌아가면 변신 전보다 쉽게 녹는다. 수적 우위나 확실한 벽 각이 없으면 궁을 보존해 앞선을 지키는 선택도 강하다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-tank-champion-ksante-20260913' OR (kind = 'article' AND title_key = '크산테'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-ksante-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-tank-champion-ksante-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 중첩을 교환 전에 준비한다 · `W` 충전은 피해 감소와 이동 방향을 함께 고른다 · 총공세는 탱커 역할을 내려놓는 선택이다

[[분류:탑]] [[분류:탱커]]

## `Q` 세 번째 타격을 준비한 뒤 상대의 막타를 본다

**크산테는 `엔토포 타격(Q)` 두 번을 미니언에 적중시킨 뒤 생기는 끌어당김으로 교환을 설계한다.**[* [크산테의 핵심 정동열](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148170&vtype=pc)] 세 번째 `Q`가 준비됐다고 바로 던지면 상대는 뒤로 빠지기만 하면 된다. 상대가 막타 때문에 멈추는 순간이나 아군 정글이 닿는 방향으로 움직였을 때 사용한다. 준비 시간이 끝나기 직전이라고 나쁜 각에 억지로 쓰지 않는다.

## 표식을 터뜨릴 기본 공격까지가 짧은 교환이다

**기술을 맞힌 뒤 생긴 표식은 기본 공격으로 소비해야 피해가 완성된다.**[* [크산테 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=162)] 하지만 표식 한 번 때문에 큰 적 웨이브 안으로 걸어가면 손해가 더 크다. `Q` 둔화나 `발놀림(E)` 보호막으로 안전하게 닿을 때만 공격하고, 상대가 거리를 내줬다면 다음 중첩을 준비한다.

## `W`는 오래 모으는 것보다 밀어낼 방향이 중요하다

**`길을 여는 자(W)` 충전 중에는 피해를 줄이며 방해 효과를 버틸 수 있다.** 정면 피해를 막는 데만 쓰지 말고 **상대를 벽이나 아군 쪽으로 밀 수 있는 각**을 만든다. 최대 충전에 집착하면 상대가 옆으로 비켜난다. 필요한 거리와 기절 시간이 나왔을 때 일찍 놓는 편이 낫다.

## 총공세 뒤에는 다시 탱커처럼 서 있지 않는다

**`총공세(R)`는 적을 벽 너머로 분리하지만 크산테의 방어 능력도 크게 낮춘다.** 아군이 상대 앞선을 받아 줄 수 있는지, 데려간 적을 제한 시간 안에 끝낼 수 있는지 확인한다. 처치하지 못했는데 적진 한가운데로 돌아가면 변신 전보다 쉽게 녹는다. 수적 우위나 확실한 벽 각이 없으면 궁을 보존해 앞선을 지키는 선택도 강하다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-ksante-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-ksante-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-tank-champion-ksante-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-ksante-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-top-tank-champion-ksante-20260913';

-- ksante 상대법 (1022자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-ksante', 'matchup', NULL, NULL, 'published', 'ksante', '', 0, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — `Q` 중첩을 세며 막타 각을 바꾼다 · 충전 중인 `W` 앞에서 핵심 기술을 쓰지 않는다 · 벽을 등진 채 총공세를 맞지 않는다

## 세 번째 `Q`가 준비되면 막타 하나를 늦춘다

**크산테가 `Q`를 두 번 맞힌 뒤에는 다음 타격이 끌어당김으로 바뀐다.**[* [크산테의 핵심 정동열](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148170&vtype=pc)] 준비 상태에서 정면으로 막타를 먹으면 `Q`부터 `W`까지 연계될 수 있다. 미니언 옆으로 각도를 바꾸거나 잠시 거리를 내주고, 세 번째 `Q`가 빗나간 뒤 짧게 압박한다.

## 표식이 묻은 상태에서 기본 공격 거리를 주지 않는다

**크산테의 기술에 맞으면 표식이 생기고 다음 기본 공격이 추가 피해를 만든다.**[* [크산테 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=162)] 기술 한 번을 맞았다고 즉시 맞딜로 들어가기보다 한 걸음 빠져 표식 소비를 어렵게 한다. `E`로 따라왔다면 보호막이 끝난 뒤 되받아치되, 아군 미니언을 타고 더 멀리 움직일 수 있다는 점을 계산한다.

## 충전하는 `W`에는 기술을 겹치지 않는다

**`길을 여는 자(W)` 충전 중인 크산테는 피해를 줄여 받고 방해 효과를 버틴다.** 큰 피해나 핵심 군중 제어기를 그 시간에 쓰지 않는다. 돌진 방향을 옆으로 피한 뒤 재사용 대기시간 동안 교환한다. 벽 가까이에서는 짧은 적중만으로도 이어지는 위치가 나빠지므로 중앙 쪽으로 움직인다.

## 총공세 뒤에는 도망만 가지 말고 낮아진 방어력을 본다

**벽을 등진 채 `R`을 맞으면 팀과 분리된다.** 교전 전에 벽에서 떨어지고, 궁극기를 맞았다면 이동기로 더 깊은 곳에 끌려가지 않게 측면으로 빠진다. 크산테는 총공세 동안 공격성이 커지는 대신 방어 능력이 낮아지므로 아군이 가까우면 집중 공격으로 되받아칠 수 있다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-ksante' AND kind = 'matchup' AND champion_slug = 'ksante'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-ksante');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-ksante-20260913', id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-ksante' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — `Q` 중첩을 세며 막타 각을 바꾼다 · 충전 중인 `W` 앞에서 핵심 기술을 쓰지 않는다 · 벽을 등진 채 총공세를 맞지 않는다

## 세 번째 `Q`가 준비되면 막타 하나를 늦춘다

**크산테가 `Q`를 두 번 맞힌 뒤에는 다음 타격이 끌어당김으로 바뀐다.**[* [크산테의 핵심 정동열](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148170&vtype=pc)] 준비 상태에서 정면으로 막타를 먹으면 `Q`부터 `W`까지 연계될 수 있다. 미니언 옆으로 각도를 바꾸거나 잠시 거리를 내주고, 세 번째 `Q`가 빗나간 뒤 짧게 압박한다.

## 표식이 묻은 상태에서 기본 공격 거리를 주지 않는다

**크산테의 기술에 맞으면 표식이 생기고 다음 기본 공격이 추가 피해를 만든다.**[* [크산테 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=162)] 기술 한 번을 맞았다고 즉시 맞딜로 들어가기보다 한 걸음 빠져 표식 소비를 어렵게 한다. `E`로 따라왔다면 보호막이 끝난 뒤 되받아치되, 아군 미니언을 타고 더 멀리 움직일 수 있다는 점을 계산한다.

## 충전하는 `W`에는 기술을 겹치지 않는다

**`길을 여는 자(W)` 충전 중인 크산테는 피해를 줄여 받고 방해 효과를 버틴다.** 큰 피해나 핵심 군중 제어기를 그 시간에 쓰지 않는다. 돌진 방향을 옆으로 피한 뒤 재사용 대기시간 동안 교환한다. 벽 가까이에서는 짧은 적중만으로도 이어지는 위치가 나빠지므로 중앙 쪽으로 움직인다.

## 총공세 뒤에는 도망만 가지 말고 낮아진 방어력을 본다

**벽을 등진 채 `R`을 맞으면 팀과 분리된다.** 교전 전에 벽에서 떨어지고, 궁극기를 맞았다면 이동기로 더 깊은 곳에 끌려가지 않게 측면으로 빠진다. 크산테는 총공세 동안 공격성이 커지는 대신 방어 능력이 낮아지므로 아군이 가까우면 집중 공격으로 되받아칠 수 있다.'
AND updated_at = '2026-09-13T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-ksante-20260913');

-- 사이온 챔피언 위키: 기존 시스템 초안만 보강
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`는 적중보다 이동을 강요한다 · 낮은 체력 미니언은 `E` 투사체다 · 궁극기 출발 전에 도착할 웨이브를 계산한다

[[분류:탑]] [[분류:탱커]]

## `Q`는 오래 모으는 기술이 아니라 길을 닫는 기술이다

**`대량 학살 강타(Q)`를 끝까지 맞히는 것보다 상대가 피할 방향을 제한하는 일이 먼저다.**[* [M1 탑사이온 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=114749&vtype=pc)] 시야가 열린 중앙에서는 짧게 끊어 피해와 막타를 확정하고, 수풀이나 `E` 둔화 뒤에만 길게 모은다. 상대가 범위를 벗어나느라 CS를 포기했다면 이미 이득이므로 끝까지 추격해 내 위치를 망치지 않는다.

## 낮은 체력 미니언으로 교환을 시작한다

**`학살자의 포효(E)`가 미니언을 밀어내면 뒤의 상대까지 둔화하고 방어력을 낮춘다.**[* [사이온 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=57)] 상대가 자기 미니언 뒤에 숨는 순간, 체력이 낮고 진행선이 곧은 미니언을 고른다. `E`가 맞으면 퇴로에 `Q`를 놓고, 빗나가면 마나를 더 쓰지 않고 다음 웨이브를 기다린다.

## `W`는 보호막과 폭발을 모두 쓸 거리에서 켠다

**`영혼의 용광로(W)`는 미니언 처치로 최대 체력을 쌓고, 사용 시 보호막 뒤 범위 피해를 만든다.** 멀리서 견제 하나만 막으려고 켜면 폭발을 쓰지 못한다. 서로 막타를 먹으러 가까워지기 직전에 켜고, 보호막이 깨지기 전에 상대와 미니언에 폭발을 함께 맞힐 자리를 잡는다.

## 궁극기와 사망 후 시간을 공짜로 보지 않는다

**`멈출 수 없는 맹공(R)`으로 복귀하거나 다른 라인에 합류하기 전, 출발하는 웨이브와 도착 후 돌아올 방법을 본다.** 실패한 장거리 궁은 탑 경험치까지 잃는다. 죽은 뒤 패시브로 웨이브를 정리할 수 있어도 **죽음을 먼저 선택하는 운영은 상대에게 처치 보상과 다음 움직임을 함께 준다.** 살아서 앞선을 만들 수 있다면 그쪽이 우선이다.', revision = 2, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-sion-20260912' AND kind = 'article' AND revision = 1 AND updated_by = 'user-system'
AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-sion-20260912') = 1
AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-sion-20260912' AND doc_id = 'doc-ai-champion-sion-20260912' AND status = 'accepted')
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-sion-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-sion-20260913', id, NULL, 1, general, '탑 탱커 챔피언 위키 보강', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 2 FROM wiki_docs
WHERE id = 'doc-ai-champion-sion-20260912' AND revision = 2 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`는 적중보다 이동을 강요한다 · 낮은 체력 미니언은 `E` 투사체다 · 궁극기 출발 전에 도착할 웨이브를 계산한다

[[분류:탑]] [[분류:탱커]]

## `Q`는 오래 모으는 기술이 아니라 길을 닫는 기술이다

**`대량 학살 강타(Q)`를 끝까지 맞히는 것보다 상대가 피할 방향을 제한하는 일이 먼저다.**[* [M1 탑사이온 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=114749&vtype=pc)] 시야가 열린 중앙에서는 짧게 끊어 피해와 막타를 확정하고, 수풀이나 `E` 둔화 뒤에만 길게 모은다. 상대가 범위를 벗어나느라 CS를 포기했다면 이미 이득이므로 끝까지 추격해 내 위치를 망치지 않는다.

## 낮은 체력 미니언으로 교환을 시작한다

**`학살자의 포효(E)`가 미니언을 밀어내면 뒤의 상대까지 둔화하고 방어력을 낮춘다.**[* [사이온 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=57)] 상대가 자기 미니언 뒤에 숨는 순간, 체력이 낮고 진행선이 곧은 미니언을 고른다. `E`가 맞으면 퇴로에 `Q`를 놓고, 빗나가면 마나를 더 쓰지 않고 다음 웨이브를 기다린다.

## `W`는 보호막과 폭발을 모두 쓸 거리에서 켠다

**`영혼의 용광로(W)`는 미니언 처치로 최대 체력을 쌓고, 사용 시 보호막 뒤 범위 피해를 만든다.** 멀리서 견제 하나만 막으려고 켜면 폭발을 쓰지 못한다. 서로 막타를 먹으러 가까워지기 직전에 켜고, 보호막이 깨지기 전에 상대와 미니언에 폭발을 함께 맞힐 자리를 잡는다.

## 궁극기와 사망 후 시간을 공짜로 보지 않는다

**`멈출 수 없는 맹공(R)`으로 복귀하거나 다른 라인에 합류하기 전, 출발하는 웨이브와 도착 후 돌아올 방법을 본다.** 실패한 장거리 궁은 탑 경험치까지 잃는다. 죽은 뒤 패시브로 웨이브를 정리할 수 있어도 **죽음을 먼저 선택하는 운영은 상대에게 처치 보상과 다음 움직임을 함께 준다.** 살아서 앞선을 만들 수 있다면 그쪽이 우선이다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-sion-20260913');
DELETE FROM wiki_links WHERE source_doc = 'doc-ai-champion-sion-20260912' AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-sion-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-sion-20260912', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-sion-20260912' AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-sion-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-sion-20260912', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-sion-20260912' AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-sion-20260913');

-- 사이온 상대법: 기존 시스템 초안만 보강
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 보이지 않는 수풀 앞을 비운다 · 낮은 체력 미니언과 일직선에 서지 않는다 · 처치 뒤 패시브가 끝날 때까지 거리를 둔다

## 충전 중인 `Q`는 뒤보다 옆으로 피한다

**`대량 학살 강타(Q)`의 충전이 보이면 최대 사거리 밖으로 뛰기보다 직각에 가깝게 옆으로 벗어난다.**[* [M1 탑사이온 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=114749&vtype=pc)] 수풀과 시야 밖에서는 시작 동작이 보이지 않으므로 사이온이 사라진 쪽 벽을 따라 걷지 않는다. 사이온이 짧게 끊었다면 다시 바로 붙지 말고 다음 기술과 미니언 수를 확인한다.

## 미니언 뒤가 안전지대가 아니다

**`학살자의 포효(E)`는 미니언을 뒤로 날려 그 경로의 챔피언에게 둔화와 방어력 감소를 건다.**[* [사이온 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=57)] 낮은 체력 미니언과 사이온을 한 줄에 두지 않는다. `E`가 빗나가면 사이온은 먼 거리에서 `Q`를 준비하기 어려워지므로 막타나 짧은 견제를 돌려받는다.

## `W` 보호막이 켜지면 폭발 거리부터 벗어난다

**보호막을 무조건 깨려고 기술을 몰아 쓰면 사이온이 피해를 흡수한 뒤 범위 폭발까지 맞힐 수 있다.** 보호막이 켜진 순간 한 걸음 빠져 폭발 범위를 비우고, 사라진 뒤 교환한다. 큰 웨이브에서는 보호막 폭발이 라인 정리까지 해 주므로 먼저 무리해 싸우지 않는다.

## 궁극기 소리와 사망 후 패시브를 별개로 대응한다

**궁극기 소리가 들리면 사이온이 보일 때까지 직선 통로를 따라 달리지 않고 충돌선에서 먼저 벗어난다.** 사이온을 처치한 뒤 체력이 낮다면 시체 옆의 미니언을 바로 먹지 않는다. 되살아난 동안 빠르게 공격하므로 간격을 만든 뒤 패시브가 끝나고 웨이브를 정리한다.', revision = 2, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-sion' AND kind = 'matchup' AND revision = 1 AND updated_by = 'user-system'
AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-sion') = 1
AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-mid-matchup-sion-20260912' AND doc_id = 'doc-c-sion' AND status = 'accepted')
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-sion-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-sion-20260913', id, NULL, 1, general, '탑 탱커 상대법 보강', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 2 FROM wiki_docs
WHERE id = 'doc-c-sion' AND revision = 2 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 보이지 않는 수풀 앞을 비운다 · 낮은 체력 미니언과 일직선에 서지 않는다 · 처치 뒤 패시브가 끝날 때까지 거리를 둔다

## 충전 중인 `Q`는 뒤보다 옆으로 피한다

**`대량 학살 강타(Q)`의 충전이 보이면 최대 사거리 밖으로 뛰기보다 직각에 가깝게 옆으로 벗어난다.**[* [M1 탑사이온 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=114749&vtype=pc)] 수풀과 시야 밖에서는 시작 동작이 보이지 않으므로 사이온이 사라진 쪽 벽을 따라 걷지 않는다. 사이온이 짧게 끊었다면 다시 바로 붙지 말고 다음 기술과 미니언 수를 확인한다.

## 미니언 뒤가 안전지대가 아니다

**`학살자의 포효(E)`는 미니언을 뒤로 날려 그 경로의 챔피언에게 둔화와 방어력 감소를 건다.**[* [사이온 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=57)] 낮은 체력 미니언과 사이온을 한 줄에 두지 않는다. `E`가 빗나가면 사이온은 먼 거리에서 `Q`를 준비하기 어려워지므로 막타나 짧은 견제를 돌려받는다.

## `W` 보호막이 켜지면 폭발 거리부터 벗어난다

**보호막을 무조건 깨려고 기술을 몰아 쓰면 사이온이 피해를 흡수한 뒤 범위 폭발까지 맞힐 수 있다.** 보호막이 켜진 순간 한 걸음 빠져 폭발 범위를 비우고, 사라진 뒤 교환한다. 큰 웨이브에서는 보호막 폭발이 라인 정리까지 해 주므로 먼저 무리해 싸우지 않는다.

## 궁극기 소리와 사망 후 패시브를 별개로 대응한다

**궁극기 소리가 들리면 사이온이 보일 때까지 직선 통로를 따라 달리지 않고 충돌선에서 먼저 벗어난다.** 사이온을 처치한 뒤 체력이 낮다면 시체 옆의 미니언을 바로 먹지 않는다. 되살아난 동안 빠르게 공격하므로 간격을 만든 뒤 패시브가 끝나고 웨이브를 정리한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-sion-20260913');

-- 초가스 챔피언 위키 (1016자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-tank-champion-chogath-20260913', 'article', '초가스', '초가스', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 미니언 처치 회복으로 나쁜 교환을 복구한다 · `Q`는 발밑보다 퇴로에 둔다 · `R` 처형선이 보일 때 싸움을 짧게 끝낸다

[[분류:탑]] [[분류:탱커]]

## 유지력은 맞아도 된다는 허가가 아니다

**초가스는 미니언을 처치하며 체력과 마나를 회복해 작은 손해를 되돌릴 수 있다.**[* [정석 착취 초가스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146725)] 그렇다고 막타 하나마다 큰 견제를 맞으면 다음 웨이브를 먹을 체력이 남지 않는다. 안전한 미니언부터 챙기고, 상대가 기술을 웨이브에 쓴 뒤에만 앞으로 나가 회복량 이상의 손해를 막는다.

## `Q`는 현재 위치보다 다음 발걸음에 둔다

**`파열(Q)`은 발동 전 표시를 보고 피할 수 있다.**[* [초가스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=11)] 상대 발밑 정중앙보다 막타를 친 뒤 돌아갈 길, 수풀 입구, 벽 쪽 이동선에 놓는다. 맞히면 바로 `흉포한 울부짖음(W)`을 겹쳐 이동기나 반격을 막고, 빗나가면 긴 재교환을 열지 않는다.

## `W`와 `E`는 근접한 상대를 놓치지 않는 묶음이다

**상대가 파고들면 `W` 침묵으로 기술 사용을 늦추고 `날카로운 가시(E)`의 세 번 공격으로 둔화를 이어 간다.** `E`는 뒤의 미니언까지 밀기 때문에 라인이 예상보다 빨리 밀릴 수 있다. 프리징이 필요하면 챔피언을 치려고 가시를 미니언 전체에 통과시키지 않는다.

## `R`은 체력 성장과 확정 처치 사이에서 목적을 고른다

**`포식(R)`으로 미니언을 처치해 최대 체력을 쌓을 수 있지만, 상대와 오브젝트를 확정하는 수단이기도 하다.** 곧 싸움이 열릴 때 재사용 대기시간을 성장에 쓰지 않는다. 상대 체력이 처형선에 들어왔다면 `Q`를 더 맞히려 욕심내기보다 침묵과 둔화로 접근해 확정 피해로 끝낸다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-tank-champion-chogath-20260913' OR (kind = 'article' AND title_key = '초가스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-chogath-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-tank-champion-chogath-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 미니언 처치 회복으로 나쁜 교환을 복구한다 · `Q`는 발밑보다 퇴로에 둔다 · `R` 처형선이 보일 때 싸움을 짧게 끝낸다

[[분류:탑]] [[분류:탱커]]

## 유지력은 맞아도 된다는 허가가 아니다

**초가스는 미니언을 처치하며 체력과 마나를 회복해 작은 손해를 되돌릴 수 있다.**[* [정석 착취 초가스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146725)] 그렇다고 막타 하나마다 큰 견제를 맞으면 다음 웨이브를 먹을 체력이 남지 않는다. 안전한 미니언부터 챙기고, 상대가 기술을 웨이브에 쓴 뒤에만 앞으로 나가 회복량 이상의 손해를 막는다.

## `Q`는 현재 위치보다 다음 발걸음에 둔다

**`파열(Q)`은 발동 전 표시를 보고 피할 수 있다.**[* [초가스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=11)] 상대 발밑 정중앙보다 막타를 친 뒤 돌아갈 길, 수풀 입구, 벽 쪽 이동선에 놓는다. 맞히면 바로 `흉포한 울부짖음(W)`을 겹쳐 이동기나 반격을 막고, 빗나가면 긴 재교환을 열지 않는다.

## `W`와 `E`는 근접한 상대를 놓치지 않는 묶음이다

**상대가 파고들면 `W` 침묵으로 기술 사용을 늦추고 `날카로운 가시(E)`의 세 번 공격으로 둔화를 이어 간다.** `E`는 뒤의 미니언까지 밀기 때문에 라인이 예상보다 빨리 밀릴 수 있다. 프리징이 필요하면 챔피언을 치려고 가시를 미니언 전체에 통과시키지 않는다.

## `R`은 체력 성장과 확정 처치 사이에서 목적을 고른다

**`포식(R)`으로 미니언을 처치해 최대 체력을 쌓을 수 있지만, 상대와 오브젝트를 확정하는 수단이기도 하다.** 곧 싸움이 열릴 때 재사용 대기시간을 성장에 쓰지 않는다. 상대 체력이 처형선에 들어왔다면 `Q`를 더 맞히려 욕심내기보다 침묵과 둔화로 접근해 확정 피해로 끝낸다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-chogath-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-chogath-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-tank-champion-chogath-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-chogath-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-top-tank-champion-chogath-20260913';

-- chogath 상대법 (978자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-chogath', 'matchup', NULL, NULL, 'published', 'chogath', '', 0, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — `Q`는 발밑 표시보다 이동 방향으로 피한다 · 미니언을 꾸준히 먹게 두면 체력 교환이 복구된다 · 6레벨부터 포식 처형선을 넉넉하게 본다

## `Q`를 피할 이동기를 먼저 쓰지 않는다

**초가스의 `파열(Q)`이 남아 있을 때 접근 이동기를 공격에 쓰면 발밑 파열을 피할 수단이 사라진다.**[* [정석 착취 초가스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146725)] 지면 표시가 생기면 직선으로 뒤로 빠지기보다 가장 가까운 가장자리로 벗어난다. `Q`가 빗나간 뒤에는 초가스의 원거리 진입 차단이 줄어드니 짧게 압박한다.

## 견제 뒤에는 막타 회복까지 막아야 손해가 남는다

**초가스는 미니언을 처치하며 체력과 마나를 회복한다.**[* [초가스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=11)] 한 번 때리고 라인을 천천히 두면 다음 웨이브에서 손해를 복구한다. 체력 우위를 만들었다면 미니언 앞에 서서 안전한 막타 수를 줄이되, 큰 적 웨이브 안에서 무리해 유지력보다 더 큰 피해를 받지 않는다.

## 침묵을 맞은 상태에서는 긴 교환을 열지 않는다

**`흉포한 울부짖음(W)`에 맞으면 이동기와 방어 기술이 잠시 막힌다.** 초가스 쪽으로 계속 들어가기보다 침묵이 끝날 때까지 옆으로 빠진다. `E` 가시는 미니언을 관통하므로 낮은 체력 아군 미니언 바로 뒤에서 맞딜하지 않는다.

## 포식 표시가 보이기 전부터 체력선을 관리한다

**6레벨 이후 초가스가 가까이 있고 내 체력이 낮다면 보호막이나 회복을 너무 늦게 쓰지 않는다.** `포식(R)`은 방어력을 무시하는 고정 피해라 마지막 순간의 저항력으로 버티기 어렵다. 한타에서는 주요 오브젝트 체력이 낮을 때 초가스를 먼저 밀어내 처형 사거리 진입을 막는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-chogath' AND kind = 'matchup' AND champion_slug = 'chogath'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-chogath');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-chogath-20260913', id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-chogath' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — `Q`는 발밑 표시보다 이동 방향으로 피한다 · 미니언을 꾸준히 먹게 두면 체력 교환이 복구된다 · 6레벨부터 포식 처형선을 넉넉하게 본다

## `Q`를 피할 이동기를 먼저 쓰지 않는다

**초가스의 `파열(Q)`이 남아 있을 때 접근 이동기를 공격에 쓰면 발밑 파열을 피할 수단이 사라진다.**[* [정석 착취 초가스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146725)] 지면 표시가 생기면 직선으로 뒤로 빠지기보다 가장 가까운 가장자리로 벗어난다. `Q`가 빗나간 뒤에는 초가스의 원거리 진입 차단이 줄어드니 짧게 압박한다.

## 견제 뒤에는 막타 회복까지 막아야 손해가 남는다

**초가스는 미니언을 처치하며 체력과 마나를 회복한다.**[* [초가스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=11)] 한 번 때리고 라인을 천천히 두면 다음 웨이브에서 손해를 복구한다. 체력 우위를 만들었다면 미니언 앞에 서서 안전한 막타 수를 줄이되, 큰 적 웨이브 안에서 무리해 유지력보다 더 큰 피해를 받지 않는다.

## 침묵을 맞은 상태에서는 긴 교환을 열지 않는다

**`흉포한 울부짖음(W)`에 맞으면 이동기와 방어 기술이 잠시 막힌다.** 초가스 쪽으로 계속 들어가기보다 침묵이 끝날 때까지 옆으로 빠진다. `E` 가시는 미니언을 관통하므로 낮은 체력 아군 미니언 바로 뒤에서 맞딜하지 않는다.

## 포식 표시가 보이기 전부터 체력선을 관리한다

**6레벨 이후 초가스가 가까이 있고 내 체력이 낮다면 보호막이나 회복을 너무 늦게 쓰지 않는다.** `포식(R)`은 방어력을 무시하는 고정 피해라 마지막 순간의 저항력으로 버티기 어렵다. 한타에서는 주요 오브젝트 체력이 낮을 때 초가스를 먼저 밀어내 처형 사거리 진입을 막는다.'
AND updated_at = '2026-09-13T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-chogath-20260913');

-- 뽀삐 챔피언 위키 (1060자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-tank-champion-poppy-20260913', 'article', '뽀삐', '뽀삐', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 방패 막타 뒤의 착지 위치를 본다 · 벽꿍은 벽보다 상대의 퇴로에서 시작한다 · `W`는 진입보다 역진입을 막을 때 더 값지다

[[분류:탑]] [[분류:탱커]]

## 방패는 안전한 막타와 다음 교환을 함께 만든다

**원거리 방패 공격은 어려운 막타를 챙기면서 보호막을 준비하는 수단이다.**[* [뽀삐 공략 게시판](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=49)] 방패가 떨어진 자리가 상대 쪽이면 무리해서 줍지 않는다. 상대가 방패를 밟으러 움직이는 순간 `망치 강타(Q)` 범위로 유도하거나, 안전한 쪽에 떨어졌을 때만 주워 다음 근접 교환을 연다.

## `Q` 두 번째 폭발까지 맞힐 자리를 고른다

**`망치 강타(Q)`는 첫 타격 뒤 지대가 다시 폭발한다.**[* [뽀삐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=49)] 상대가 자유롭게 옆으로 빠질 수 있는 중앙보다 막타를 치는 순간이나 벽 쪽에 몰렸을 때 사용한다. 첫 타격을 맞혔다고 기본 공격을 오래 이어 가기보다 두 번째 폭발 범위로 상대가 움직이게 만든 뒤 거리를 정리한다.

## 벽꿍은 상대가 벽에 붙은 뒤 찾으면 늦다

**`용감한 돌진(E)` 각은 뽀삐와 상대, 충돌할 지형이 한 줄이 될 때 열린다.** **라인 중앙에서부터 상대의 퇴로 반대편으로 몸을 옮겨 벽 쪽 선택을 강요한다.** 각이 아닌데 `E`로 접근하면 상대를 안전한 방향으로 밀어주고 퇴로까지 잃는다. 벽 충돌이 확실하지 않으면 `Q`와 방패로 짧게 교환한다.

## `W`와 궁극기는 한타의 사람 수를 바꾼다

**`굳건한 태세(W)`는 상대 돌진을 막고 다시 이동기를 쓰지 못하게 한다.** 먼저 뛰어들기보다 아군 딜러에게 들어오는 핵심 돌진에 남기면 교전이 단순해진다. `수호자의 심판(R)`은 빠르게 눌러 띄우거나 충전해 멀리 보낼 수 있다. 잡을 대상을 날리지 말고, **싸움에서 가장 오래 빼 두면 좋은 적**을 고른다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-tank-champion-poppy-20260913' OR (kind = 'article' AND title_key = '뽀삐'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-poppy-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-tank-champion-poppy-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 방패 막타 뒤의 착지 위치를 본다 · 벽꿍은 벽보다 상대의 퇴로에서 시작한다 · `W`는 진입보다 역진입을 막을 때 더 값지다

[[분류:탑]] [[분류:탱커]]

## 방패는 안전한 막타와 다음 교환을 함께 만든다

**원거리 방패 공격은 어려운 막타를 챙기면서 보호막을 준비하는 수단이다.**[* [뽀삐 공략 게시판](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=49)] 방패가 떨어진 자리가 상대 쪽이면 무리해서 줍지 않는다. 상대가 방패를 밟으러 움직이는 순간 `망치 강타(Q)` 범위로 유도하거나, 안전한 쪽에 떨어졌을 때만 주워 다음 근접 교환을 연다.

## `Q` 두 번째 폭발까지 맞힐 자리를 고른다

**`망치 강타(Q)`는 첫 타격 뒤 지대가 다시 폭발한다.**[* [뽀삐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=49)] 상대가 자유롭게 옆으로 빠질 수 있는 중앙보다 막타를 치는 순간이나 벽 쪽에 몰렸을 때 사용한다. 첫 타격을 맞혔다고 기본 공격을 오래 이어 가기보다 두 번째 폭발 범위로 상대가 움직이게 만든 뒤 거리를 정리한다.

## 벽꿍은 상대가 벽에 붙은 뒤 찾으면 늦다

**`용감한 돌진(E)` 각은 뽀삐와 상대, 충돌할 지형이 한 줄이 될 때 열린다.** **라인 중앙에서부터 상대의 퇴로 반대편으로 몸을 옮겨 벽 쪽 선택을 강요한다.** 각이 아닌데 `E`로 접근하면 상대를 안전한 방향으로 밀어주고 퇴로까지 잃는다. 벽 충돌이 확실하지 않으면 `Q`와 방패로 짧게 교환한다.

## `W`와 궁극기는 한타의 사람 수를 바꾼다

**`굳건한 태세(W)`는 상대 돌진을 막고 다시 이동기를 쓰지 못하게 한다.** 먼저 뛰어들기보다 아군 딜러에게 들어오는 핵심 돌진에 남기면 교전이 단순해진다. `수호자의 심판(R)`은 빠르게 눌러 띄우거나 충전해 멀리 보낼 수 있다. 잡을 대상을 날리지 말고, **싸움에서 가장 오래 빼 두면 좋은 적**을 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-poppy-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-poppy-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-tank-champion-poppy-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-poppy-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-top-tank-champion-poppy-20260913';

-- poppy 상대법 (898자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-poppy', 'matchup', NULL, NULL, 'published', 'poppy', '', 0, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 벽과 뽀삐 사이에 서지 않는다 · 돌진은 `W`가 빠진 뒤 쓴다 · 궁극기 충전이 보이면 옆으로 흩어진다

## 방패가 떨어진 자리에서 다음 교환을 읽는다

**뽀삐가 던진 방패를 주우면 보호막을 얻으므로, 안전하다면 먼저 밟아 없앨 수 있다.**[* [뽀삐 공략 게시판](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=49)] 다만 방패 하나를 지우겠다고 벽 쪽이나 큰 적 웨이브로 들어가면 `E` 각을 내준다. 방패의 착지점이 뽀삐의 `Q` 범위와 겹치는지도 확인한다.

## 벽에서 한 걸음 떨어지는 것이 기술 하나를 지우는 셈이다

**`용감한 돌진(E)`은 지형에 부딪혀야 기절한다.**[* [뽀삐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=49)] 수풀 입구, 포탑 잔해, 협곡 벽을 등진 채 막타를 먹지 않는다. 뽀삐가 측면으로 돌아오면 같은 방향으로 도망가지 말고 중앙으로 각도를 바꾼다. 벽꿍이 실패한 뒤에는 접근기와 기절이 함께 빠지므로 짧게 되받아친다.

## `W`가 켜진 원 안에서 돌진하지 않는다

**뽀삐 주변에 `굳건한 태세(W)`가 켜지면 이동기를 공격에 쓰지 않는다.** 막힌 뒤에는 둔화와 이동 기술 제한까지 이어진다. 걸어서 원 밖으로 나오거나 지속시간을 기다리고, `W`가 빠진 다음 교환에 돌진을 남긴다.

## 궁극기는 충전 방향과 아군 위치를 함께 본다

**짧게 쓰는 궁극기는 즉시 띄우고, 길게 모으면 멀리 날려 교전에서 제외한다.** 뽀삐가 충전하면 한 줄로 서지 않고 옆으로 벌어진다. 한 명이 날아가면 남은 인원이 수적으로 불리한 싸움을 계속하지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-poppy' AND kind = 'matchup' AND champion_slug = 'poppy'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-poppy');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-poppy-20260913', id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-poppy' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 벽과 뽀삐 사이에 서지 않는다 · 돌진은 `W`가 빠진 뒤 쓴다 · 궁극기 충전이 보이면 옆으로 흩어진다

## 방패가 떨어진 자리에서 다음 교환을 읽는다

**뽀삐가 던진 방패를 주우면 보호막을 얻으므로, 안전하다면 먼저 밟아 없앨 수 있다.**[* [뽀삐 공략 게시판](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=49)] 다만 방패 하나를 지우겠다고 벽 쪽이나 큰 적 웨이브로 들어가면 `E` 각을 내준다. 방패의 착지점이 뽀삐의 `Q` 범위와 겹치는지도 확인한다.

## 벽에서 한 걸음 떨어지는 것이 기술 하나를 지우는 셈이다

**`용감한 돌진(E)`은 지형에 부딪혀야 기절한다.**[* [뽀삐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=49)] 수풀 입구, 포탑 잔해, 협곡 벽을 등진 채 막타를 먹지 않는다. 뽀삐가 측면으로 돌아오면 같은 방향으로 도망가지 말고 중앙으로 각도를 바꾼다. 벽꿍이 실패한 뒤에는 접근기와 기절이 함께 빠지므로 짧게 되받아친다.

## `W`가 켜진 원 안에서 돌진하지 않는다

**뽀삐 주변에 `굳건한 태세(W)`가 켜지면 이동기를 공격에 쓰지 않는다.** 막힌 뒤에는 둔화와 이동 기술 제한까지 이어진다. 걸어서 원 밖으로 나오거나 지속시간을 기다리고, `W`가 빠진 다음 교환에 돌진을 남긴다.

## 궁극기는 충전 방향과 아군 위치를 함께 본다

**짧게 쓰는 궁극기는 즉시 띄우고, 길게 모으면 멀리 날려 교전에서 제외한다.** 뽀삐가 충전하면 한 줄로 서지 않고 옆으로 벌어진다. 한 명이 날아가면 남은 인원이 수적으로 불리한 싸움을 계속하지 않는다.'
AND updated_at = '2026-09-13T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-poppy-20260913');

-- 마오카이 챔피언 위키 (1082자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-tank-champion-maokai-20260913', 'article', '마오카이', '마오카이', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 패시브 회복 공격을 놓치지 않는다 · `Q`는 피해보다 밀어낼 방향을 고른다 · 궁극기는 정면보다 옆으로 길을 닫는다

[[분류:탑]] [[분류:탱커]]

## 회복 가능한 기본 공격을 안전한 대상에 쓴다

**마오카이의 유지력은 패시브가 준비됐을 때 기본 공격을 실제로 넣어야 생긴다.**[* [마오카이에 대한 팁들](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141364&vtype=pc)] 체력이 낮다고 상대 챔피언에게 걸어가 억지로 치지 않고 가까운 미니언으로 회복한다. 상대가 막타를 먹으러 오는 순간에는 회복 공격과 `덤불 주먹(Q)`을 함께 사용해 체력과 라인 위치를 동시에 챙긴다.

## `Q`는 상대를 어디로 보낼지 정하고 누른다

**가까운 적은 `덤불 주먹(Q)`에 밀려난다.**[* [시즌 8 마오카이 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141885&vtype=pc)] 상대를 아군 쪽으로 당겨 두고 싶다면 뒤로 돌아가 밀고, 교환을 끝내려면 정면에서 밀어낸다. **피해를 조금 더 넣겠다고 상대를 안전한 포탑 쪽으로 보내는 실수**가 자주 나온다. 웨이브를 밀 때도 챔피언을 어느 방향으로 튕길지 먼저 본다.

## `W`는 회피와 속박을 동시에 해결한다

**`뒤틀린 전진(W)`으로 이동하는 동안 대상으로 지정되지 않는다.** 상대의 큰 기술이 날아오는 순간에 맞춰 사라지고, 나타난 뒤 `Q`로 아군 쪽에 밀어 연계한다. 사거리 끝의 적에게 먼저 쓰면 적진 한가운데 고립되므로 아군이 닿거나 빠져나올 `Q` 방향이 있을 때 들어간다.

## 묘목과 궁극기로 싸울 공간을 먼저 만든다

**`묘목 던지기(E)`는 수풀에서 강해지지만 무작정 많이 던지면 마나와 웨이브가 함께 흔들린다.** 교전이 날 입구와 상대가 돌아올 수풀에 미리 둔다. `대자연의 마수(R)`는 정면으로 따라가며 쓰면 빠른 적이 먼저 피한다. 옆에서 통로를 가로지르거나 퇴로를 덮어 상대가 아군 쪽으로 움직이게 만든다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-tank-champion-maokai-20260913' OR (kind = 'article' AND title_key = '마오카이'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-maokai-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-tank-champion-maokai-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 패시브 회복 공격을 놓치지 않는다 · `Q`는 피해보다 밀어낼 방향을 고른다 · 궁극기는 정면보다 옆으로 길을 닫는다

[[분류:탑]] [[분류:탱커]]

## 회복 가능한 기본 공격을 안전한 대상에 쓴다

**마오카이의 유지력은 패시브가 준비됐을 때 기본 공격을 실제로 넣어야 생긴다.**[* [마오카이에 대한 팁들](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141364&vtype=pc)] 체력이 낮다고 상대 챔피언에게 걸어가 억지로 치지 않고 가까운 미니언으로 회복한다. 상대가 막타를 먹으러 오는 순간에는 회복 공격과 `덤불 주먹(Q)`을 함께 사용해 체력과 라인 위치를 동시에 챙긴다.

## `Q`는 상대를 어디로 보낼지 정하고 누른다

**가까운 적은 `덤불 주먹(Q)`에 밀려난다.**[* [시즌 8 마오카이 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141885&vtype=pc)] 상대를 아군 쪽으로 당겨 두고 싶다면 뒤로 돌아가 밀고, 교환을 끝내려면 정면에서 밀어낸다. **피해를 조금 더 넣겠다고 상대를 안전한 포탑 쪽으로 보내는 실수**가 자주 나온다. 웨이브를 밀 때도 챔피언을 어느 방향으로 튕길지 먼저 본다.

## `W`는 회피와 속박을 동시에 해결한다

**`뒤틀린 전진(W)`으로 이동하는 동안 대상으로 지정되지 않는다.** 상대의 큰 기술이 날아오는 순간에 맞춰 사라지고, 나타난 뒤 `Q`로 아군 쪽에 밀어 연계한다. 사거리 끝의 적에게 먼저 쓰면 적진 한가운데 고립되므로 아군이 닿거나 빠져나올 `Q` 방향이 있을 때 들어간다.

## 묘목과 궁극기로 싸울 공간을 먼저 만든다

**`묘목 던지기(E)`는 수풀에서 강해지지만 무작정 많이 던지면 마나와 웨이브가 함께 흔들린다.** 교전이 날 입구와 상대가 돌아올 수풀에 미리 둔다. `대자연의 마수(R)`는 정면으로 따라가며 쓰면 빠른 적이 먼저 피한다. 옆에서 통로를 가로지르거나 퇴로를 덮어 상대가 아군 쪽으로 움직이게 만든다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-maokai-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-maokai-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-tank-champion-maokai-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-maokai-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-top-tank-champion-maokai-20260913';

-- maokai 상대법 (969자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-maokai', 'matchup', NULL, NULL, 'published', 'maokai', '', 0, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 수풀을 얼굴로 확인하지 않는다 · `W` 대상 지정 뒤에는 도망보다 착지 지점을 준비한다 · 패시브 회복 공격을 공짜로 주지 않는다

## 수풀 묘목은 미니언이나 시야로 먼저 확인한다

**마오카이가 오래 점유한 수풀에는 강화된 묘목이 있을 가능성이 높다.**[* [마오카이에 대한 팁들](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141364&vtype=pc)] 체력으로 확인하지 말고 미니언이 들어가게 하거나 시야를 확보한 뒤 지난다. 묘목이 달려오면 아군 웨이브로 끌고 가지 않고 빈 공간으로 빠져 폭발 범위를 분리한다.

## 패시브가 준비된 막타를 압박한다

**마오카이는 준비된 기본 공격으로 체력을 회복한다.**[* [시즌 8 마오카이 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141885&vtype=pc)] 체력이 낮은 미니언 앞에 서서 회복 대상을 쉽게 주지 않으면 유지력이 줄어든다. 다만 회복 한 번을 막으려다 `Q`로 적 웨이브 안에 밀려나지 않도록 미니언 수와 위치를 먼저 본다.

## `W`에 지정된 뒤에는 착지 후 기술을 맞힌다

**`뒤틀린 전진(W)`이 시작되면 마오카이가 잠시 대상으로 지정되지 않아 날아가는 기술이 헛돈다.** 이동기를 급히 쓰기보다 착지 위치를 보고, 나타난 순간 방어 기술이나 군중 제어기를 사용한다. 착지 직후 `Q`에 아군 쪽으로 밀리지 않도록 몸의 방향도 바꾼다.

## 궁극기 벽과 평행하게 달리지 않는다

**`대자연의 마수(R)`가 넓게 다가오면 뒤로만 달릴수록 오래 같은 경로에 남는다.** 가까운 줄기 사이의 틈이나 측면으로 빠지고, 이미 아군 한 명이 맞았다면 같은 줄에 겹쳐 서지 않는다. 궁극기가 빠진 뒤에는 마오카이의 장거리 교전 개시가 줄어든다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-maokai' AND kind = 'matchup' AND champion_slug = 'maokai'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-maokai');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-maokai-20260913', id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-maokai' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 수풀을 얼굴로 확인하지 않는다 · `W` 대상 지정 뒤에는 도망보다 착지 지점을 준비한다 · 패시브 회복 공격을 공짜로 주지 않는다

## 수풀 묘목은 미니언이나 시야로 먼저 확인한다

**마오카이가 오래 점유한 수풀에는 강화된 묘목이 있을 가능성이 높다.**[* [마오카이에 대한 팁들](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141364&vtype=pc)] 체력으로 확인하지 말고 미니언이 들어가게 하거나 시야를 확보한 뒤 지난다. 묘목이 달려오면 아군 웨이브로 끌고 가지 않고 빈 공간으로 빠져 폭발 범위를 분리한다.

## 패시브가 준비된 막타를 압박한다

**마오카이는 준비된 기본 공격으로 체력을 회복한다.**[* [시즌 8 마오카이 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141885&vtype=pc)] 체력이 낮은 미니언 앞에 서서 회복 대상을 쉽게 주지 않으면 유지력이 줄어든다. 다만 회복 한 번을 막으려다 `Q`로 적 웨이브 안에 밀려나지 않도록 미니언 수와 위치를 먼저 본다.

## `W`에 지정된 뒤에는 착지 후 기술을 맞힌다

**`뒤틀린 전진(W)`이 시작되면 마오카이가 잠시 대상으로 지정되지 않아 날아가는 기술이 헛돈다.** 이동기를 급히 쓰기보다 착지 위치를 보고, 나타난 순간 방어 기술이나 군중 제어기를 사용한다. 착지 직후 `Q`에 아군 쪽으로 밀리지 않도록 몸의 방향도 바꾼다.

## 궁극기 벽과 평행하게 달리지 않는다

**`대자연의 마수(R)`가 넓게 다가오면 뒤로만 달릴수록 오래 같은 경로에 남는다.** 가까운 줄기 사이의 틈이나 측면으로 빠지고, 이미 아군 한 명이 맞았다면 같은 줄에 겹쳐 서지 않는다. 궁극기가 빠진 뒤에는 마오카이의 장거리 교전 개시가 줄어든다.'
AND updated_at = '2026-09-13T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-maokai-20260913');

-- 나서스 챔피언 위키 (1142자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-tank-champion-nasus-20260913', 'article', '나서스', '나서스', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 스택 하나보다 살아 있는 웨이브가 먼저다 · `E`는 방어력을 낮춘 자리에서 싸운다 · 궁극기 시간 동안 도망가는 적을 끝없이 쫓지 않는다

[[분류:탑]] [[분류:탱커]]

## 초반 목표는 모든 스택이 아니라 무너지지 않는 라인이다

**`흡수의 일격(Q)` 막타 하나를 위해 체력과 웨이브 위치를 함께 잃으면 다음 스택 여러 개가 사라진다.**[* [TOP 나서스에 대해](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133482&vtype=pc)] 상대가 강할 때는 원거리 미니언이나 대포 하나를 포기해도 된다. 라인이 아군 쪽으로 오게 두고, 상대 핵심 기술이 빠진 짧은 시간에만 앞으로 나가 `Q` 막타를 챙긴다.

## `쇠약(W)`은 싸움을 시작할 때보다 상대가 빠질 때 강하다

**상대가 아직 이동기를 들고 먼 거리에 있을 때 걸면 지속시간 대부분을 접근에 쓴다.**[* [TOP 나서스, 한 번 해보지 않을래?](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=110707)] 적이 공격하려 들어왔거나 도주 기술을 사용한 뒤에 `W`를 걸어 이동 속도와 공격 속도 감소를 끝까지 활용한다. 갱 호응에서도 정글러가 보이기 전에 너무 일찍 걸어 상대에게 퇴각 신호를 주지 않는다.

## `E` 위에서 교환하고 라인이 밀리는 비용을 센다

**`영혼의 불길(E)`은 범위 안 적의 방어력을 낮춰 `Q` 피해를 키운다.** 상대가 막타 때문에 멈추는 위치에 깔고, 그 위에서만 짧게 때린다. 미니언 전체에 계속 사용하면 라인이 밀려 갱에 노출되고 포탑 아래 `Q` 막타도 어려워진다. 주도권이 필요한 웨이브와 당겨야 할 웨이브를 구분한다.

## 궁극기는 강한 시간이지 모든 추격의 허가가 아니다

**`사막의 분노(R)` 동안 체력과 방어 능력이 오르고 `Q`를 더 자주 쓸 수 있다.** 상대가 넓은 공간에서 계속 빠지면 궁극기 시간을 걷는 데 쓰지 않는다. 포탑, 오브젝트, 좁은 길처럼 상대가 자리를 포기하기 어려운 곳에서 켠다. 성장 뒤에도 깊은 사이드에서 시야 없이 한 웨이브를 더 먹는 죽음이 가장 큰 손해다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-tank-champion-nasus-20260913' OR (kind = 'article' AND title_key = '나서스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-nasus-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-tank-champion-nasus-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 스택 하나보다 살아 있는 웨이브가 먼저다 · `E`는 방어력을 낮춘 자리에서 싸운다 · 궁극기 시간 동안 도망가는 적을 끝없이 쫓지 않는다

[[분류:탑]] [[분류:탱커]]

## 초반 목표는 모든 스택이 아니라 무너지지 않는 라인이다

**`흡수의 일격(Q)` 막타 하나를 위해 체력과 웨이브 위치를 함께 잃으면 다음 스택 여러 개가 사라진다.**[* [TOP 나서스에 대해](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133482&vtype=pc)] 상대가 강할 때는 원거리 미니언이나 대포 하나를 포기해도 된다. 라인이 아군 쪽으로 오게 두고, 상대 핵심 기술이 빠진 짧은 시간에만 앞으로 나가 `Q` 막타를 챙긴다.

## `쇠약(W)`은 싸움을 시작할 때보다 상대가 빠질 때 강하다

**상대가 아직 이동기를 들고 먼 거리에 있을 때 걸면 지속시간 대부분을 접근에 쓴다.**[* [TOP 나서스, 한 번 해보지 않을래?](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=110707)] 적이 공격하려 들어왔거나 도주 기술을 사용한 뒤에 `W`를 걸어 이동 속도와 공격 속도 감소를 끝까지 활용한다. 갱 호응에서도 정글러가 보이기 전에 너무 일찍 걸어 상대에게 퇴각 신호를 주지 않는다.

## `E` 위에서 교환하고 라인이 밀리는 비용을 센다

**`영혼의 불길(E)`은 범위 안 적의 방어력을 낮춰 `Q` 피해를 키운다.** 상대가 막타 때문에 멈추는 위치에 깔고, 그 위에서만 짧게 때린다. 미니언 전체에 계속 사용하면 라인이 밀려 갱에 노출되고 포탑 아래 `Q` 막타도 어려워진다. 주도권이 필요한 웨이브와 당겨야 할 웨이브를 구분한다.

## 궁극기는 강한 시간이지 모든 추격의 허가가 아니다

**`사막의 분노(R)` 동안 체력과 방어 능력이 오르고 `Q`를 더 자주 쓸 수 있다.** 상대가 넓은 공간에서 계속 빠지면 궁극기 시간을 걷는 데 쓰지 않는다. 포탑, 오브젝트, 좁은 길처럼 상대가 자리를 포기하기 어려운 곳에서 켠다. 성장 뒤에도 깊은 사이드에서 시야 없이 한 웨이브를 더 먹는 죽음이 가장 큰 손해다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-nasus-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-nasus-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-tank-champion-nasus-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-nasus-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-top-tank-champion-nasus-20260913';

-- nasus 상대법 (989자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-nasus', 'matchup', NULL, NULL, 'published', 'nasus', '', 0, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 초반 푸시 뒤 되돌아오는 웨이브를 잡는다 · `Q` 막타마다 작은 비용을 붙인다 · 궁극기가 켜지면 시간을 빼고 다시 싸운다

## 처음부터 계속 밀기보다 되돌아오는 웨이브를 이용한다

**나서스를 포탑 아래에 영원히 가두겠다고 계속 밀면 안전한 `Q` 막타와 정글의 갱 경로를 함께 준다.**[* [TOP 나서스에 대해](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133482&vtype=pc)] 초반 웨이브를 포탑에 넣었다면 다음 웨이브가 내 쪽으로 돌아오게 두고, 긴 탑 라인 중앙에서 나서스가 막타를 먹으러 나오도록 만든다.

## `Q` 막타를 먹는 순간에만 정확히 때린다

**나서스가 모든 미니언을 먹는 동안 의미 없이 기술을 쓰기보다 `Q`로 막타를 치는 고정된 순간에 견제를 맞힌다.**[* [TOP 나서스, 한 번 해보지 않을래?](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=110707)] 체력 우위를 만들었다면 대포 미니언 앞에서 압박하고, 적 웨이브가 더 많을 때는 스택 하나를 막겠다고 맞딜하지 않는다.

## `쇠약`을 맞으면 공격 속도와 이동 속도가 함께 줄어든다

**평타 기반 챔피언은 `W`가 걸린 상태에서 긴 맞딜을 시작하지 않는다.** 초반 둔화가 약해 보여도 시간이 갈수록 강해진다. 이동기나 방어 기술로 간격을 벌리고 지속시간이 끝난 뒤 되받아친다. `E` 장판 위에서는 방어력이 낮아지므로 그 자리에서 버티지 않는다.

## 궁극기를 켠 나서스에게 킬을 확인하러 돌아가지 않는다

**`사막의 분노(R)`가 켜지면 체력과 방어 능력이 오르고 `Q`가 빨리 돌아온다.** 처음 간격을 벌인 뒤 체력이 조금 남았다는 이유로 다시 붙지 않는다. 궁극기 시간을 충분히 뺀 다음, 이동기가 없는 나서스를 여러 방향에서 느리게 압박한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-nasus' AND kind = 'matchup' AND champion_slug = 'nasus'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-nasus');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-nasus-20260913', id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-nasus' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 초반 푸시 뒤 되돌아오는 웨이브를 잡는다 · `Q` 막타마다 작은 비용을 붙인다 · 궁극기가 켜지면 시간을 빼고 다시 싸운다

## 처음부터 계속 밀기보다 되돌아오는 웨이브를 이용한다

**나서스를 포탑 아래에 영원히 가두겠다고 계속 밀면 안전한 `Q` 막타와 정글의 갱 경로를 함께 준다.**[* [TOP 나서스에 대해](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133482&vtype=pc)] 초반 웨이브를 포탑에 넣었다면 다음 웨이브가 내 쪽으로 돌아오게 두고, 긴 탑 라인 중앙에서 나서스가 막타를 먹으러 나오도록 만든다.

## `Q` 막타를 먹는 순간에만 정확히 때린다

**나서스가 모든 미니언을 먹는 동안 의미 없이 기술을 쓰기보다 `Q`로 막타를 치는 고정된 순간에 견제를 맞힌다.**[* [TOP 나서스, 한 번 해보지 않을래?](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=110707)] 체력 우위를 만들었다면 대포 미니언 앞에서 압박하고, 적 웨이브가 더 많을 때는 스택 하나를 막겠다고 맞딜하지 않는다.

## `쇠약`을 맞으면 공격 속도와 이동 속도가 함께 줄어든다

**평타 기반 챔피언은 `W`가 걸린 상태에서 긴 맞딜을 시작하지 않는다.** 초반 둔화가 약해 보여도 시간이 갈수록 강해진다. 이동기나 방어 기술로 간격을 벌리고 지속시간이 끝난 뒤 되받아친다. `E` 장판 위에서는 방어력이 낮아지므로 그 자리에서 버티지 않는다.

## 궁극기를 켠 나서스에게 킬을 확인하러 돌아가지 않는다

**`사막의 분노(R)`가 켜지면 체력과 방어 능력이 오르고 `Q`가 빨리 돌아온다.** 처음 간격을 벌인 뒤 체력이 조금 남았다는 이유로 다시 붙지 않는다. 궁극기 시간을 충분히 뺀 다음, 이동기가 없는 나서스를 여러 방향에서 느리게 압박한다.'
AND updated_at = '2026-09-13T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-nasus-20260913');

-- 자크 챔피언 위키 (1006자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-tank-champion-zac-20260913', 'article', '자크', '자크', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 조각을 주울 수 있는 쪽으로 교환한다 · `Q`는 두 번째 대상을 먼저 확보한다 · `E`는 착지보다 충전 위치를 숨긴다

[[분류:탑]] [[분류:탱커]]

## 체력 비용은 조각을 회수할 수 있을 때만 싸진다

**자크는 기술을 맞혀 떨어진 조각을 주워야 소모한 체력과 교환 손해를 되돌린다.**[* [탑, 미드 자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146717)] 조각이 상대 포탑 쪽에 떨어졌다면 한 번 더 맞으면서 줍지 않는다. 내 쪽이나 수풀 쪽으로 상대를 유도하고, 조각 하나를 줍는 움직임에 `불안정 물질(W)` 재사용까지 연결한다.

## `Q`는 첫 대상보다 붙여 칠 두 번째 대상을 본다

**`탄성 주먹(Q)`으로 챔피언을 잡은 뒤 다른 미니언을 기본 공격하면 둘을 충돌시킬 수 있다.**[* [자크장인 탑자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115999)] 상대만 바라보고 던지기보다 **내가 바로 때릴 수 있는 미니언이나 다른 적이 남아 있는지** 먼저 본다. 웨이브가 비었으면 연계가 약해지므로 사거리 끝 `Q`를 낭비하지 않는다.

## `E`는 화면 밖에서 시작할수록 위협적이다

**`새총 발사(E)`를 상대 시야 안에서 오래 모으면 착지점이 읽힌다.** 수풀과 벽 너머에서 충전을 시작하고, 상대의 뒤보다 퇴로와 아군 방향 사이에 착지한다. 라인에서 도주용으로 남겨야 할 상황이라면 짧은 교환에 먼저 쓰지 않는다.

## 궁극기 중에도 조각과 다음 위치를 본다

**`바운스!(R)`는 여러 번 튀며 적을 띄우고 둔화한다.** 첫 적중 뒤 무조건 깊이 따라가기보다 떨어진 조각과 아군의 공격 범위를 따라 움직인다. 패시브가 있다고 죽음을 가볍게 보면 안 된다. 네 조각이 적에게 쉽게 정리될 위치라면 부활까지 포함해도 손해다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-tank-champion-zac-20260913' OR (kind = 'article' AND title_key = '자크'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-zac-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-tank-champion-zac-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 조각을 주울 수 있는 쪽으로 교환한다 · `Q`는 두 번째 대상을 먼저 확보한다 · `E`는 착지보다 충전 위치를 숨긴다

[[분류:탑]] [[분류:탱커]]

## 체력 비용은 조각을 회수할 수 있을 때만 싸진다

**자크는 기술을 맞혀 떨어진 조각을 주워야 소모한 체력과 교환 손해를 되돌린다.**[* [탑, 미드 자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146717)] 조각이 상대 포탑 쪽에 떨어졌다면 한 번 더 맞으면서 줍지 않는다. 내 쪽이나 수풀 쪽으로 상대를 유도하고, 조각 하나를 줍는 움직임에 `불안정 물질(W)` 재사용까지 연결한다.

## `Q`는 첫 대상보다 붙여 칠 두 번째 대상을 본다

**`탄성 주먹(Q)`으로 챔피언을 잡은 뒤 다른 미니언을 기본 공격하면 둘을 충돌시킬 수 있다.**[* [자크장인 탑자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115999)] 상대만 바라보고 던지기보다 **내가 바로 때릴 수 있는 미니언이나 다른 적이 남아 있는지** 먼저 본다. 웨이브가 비었으면 연계가 약해지므로 사거리 끝 `Q`를 낭비하지 않는다.

## `E`는 화면 밖에서 시작할수록 위협적이다

**`새총 발사(E)`를 상대 시야 안에서 오래 모으면 착지점이 읽힌다.** 수풀과 벽 너머에서 충전을 시작하고, 상대의 뒤보다 퇴로와 아군 방향 사이에 착지한다. 라인에서 도주용으로 남겨야 할 상황이라면 짧은 교환에 먼저 쓰지 않는다.

## 궁극기 중에도 조각과 다음 위치를 본다

**`바운스!(R)`는 여러 번 튀며 적을 띄우고 둔화한다.** 첫 적중 뒤 무조건 깊이 따라가기보다 떨어진 조각과 아군의 공격 범위를 따라 움직인다. 패시브가 있다고 죽음을 가볍게 보면 안 된다. 네 조각이 적에게 쉽게 정리될 위치라면 부활까지 포함해도 손해다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-zac-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-zac-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-tank-champion-zac-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-zac-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-top-tank-champion-zac-20260913';

-- zac 상대법 (942자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-zac', 'matchup', NULL, NULL, 'published', 'zac', '', 0, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 떨어진 조각을 먼저 밟는다 · `Q`에 맞으면 다른 유닛과 거리를 둔다 · 보이지 않는 자크의 `E` 착지선을 비운다

## 조각 하나를 지우는 것이 다음 `W`까지 늦춘다

**자크가 기술을 맞힌 뒤 떨어뜨린 조각을 안전하게 밟으면 회복과 `W` 재사용 감소를 함께 막는다.**[* [탑, 미드 자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146717)] 하지만 조각을 밟으러 적 웨이브 안으로 들어가면 자크가 원하는 긴 교환이 열린다. 내 발 가까이 떨어진 조각부터 지우고 먼 것은 포기한다.

## `Q`에 붙잡히면 미니언 곁에서 떨어진다

**`탄성 주먹(Q)` 첫 타격을 맞은 뒤 자크가 다른 대상을 공격하면 둘이 충돌한다.**[* [자크장인 탑자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115999)] 아군 미니언이나 소환물 옆에 그대로 서지 않고 반대 방향으로 움직인다. 자크가 두 번째 대상을 찾지 못하면 기술의 핵심 제어가 사라진다.

## 자크가 시야에서 사라지면 벽 옆 직선을 비운다

**`새총 발사(E)`는 보이지 않는 곳에서 충전할 때 대응 시간이 짧다.** 자크가 수풀이나 벽 뒤로 빠지면 같은 자리에서 막타를 계속 치지 않는다. 착지 표시를 본 뒤 옆으로 빠지고, 가까운 거리에서 충전이 보인다면 방해 기술로 끊을 수 있는지 판단한다.

## 처치 전에 패시브 유무와 주변 적을 확인한다

**자크가 네 조각으로 갈라지면 하나라도 살아남을 때 부활할 수 있다.** 체력이 낮은 채 혼자 조각을 치다가 상대 팀이 합류하면 처치 하나 때문에 교전을 뒤집힌다. 안전한 조각부터 팀과 나눠 정리하고, 위험하면 부활 위치만 기억한 채 빠진다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-zac' AND kind = 'matchup' AND champion_slug = 'zac'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-zac');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-zac-20260913', id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-zac' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 떨어진 조각을 먼저 밟는다 · `Q`에 맞으면 다른 유닛과 거리를 둔다 · 보이지 않는 자크의 `E` 착지선을 비운다

## 조각 하나를 지우는 것이 다음 `W`까지 늦춘다

**자크가 기술을 맞힌 뒤 떨어뜨린 조각을 안전하게 밟으면 회복과 `W` 재사용 감소를 함께 막는다.**[* [탑, 미드 자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146717)] 하지만 조각을 밟으러 적 웨이브 안으로 들어가면 자크가 원하는 긴 교환이 열린다. 내 발 가까이 떨어진 조각부터 지우고 먼 것은 포기한다.

## `Q`에 붙잡히면 미니언 곁에서 떨어진다

**`탄성 주먹(Q)` 첫 타격을 맞은 뒤 자크가 다른 대상을 공격하면 둘이 충돌한다.**[* [자크장인 탑자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115999)] 아군 미니언이나 소환물 옆에 그대로 서지 않고 반대 방향으로 움직인다. 자크가 두 번째 대상을 찾지 못하면 기술의 핵심 제어가 사라진다.

## 자크가 시야에서 사라지면 벽 옆 직선을 비운다

**`새총 발사(E)`는 보이지 않는 곳에서 충전할 때 대응 시간이 짧다.** 자크가 수풀이나 벽 뒤로 빠지면 같은 자리에서 막타를 계속 치지 않는다. 착지 표시를 본 뒤 옆으로 빠지고, 가까운 거리에서 충전이 보인다면 방해 기술로 끊을 수 있는지 판단한다.

## 처치 전에 패시브 유무와 주변 적을 확인한다

**자크가 네 조각으로 갈라지면 하나라도 살아남을 때 부활할 수 있다.** 체력이 낮은 채 혼자 조각을 치다가 상대 팀이 합류하면 처치 하나 때문에 교전을 뒤집힌다. 안전한 조각부터 팀과 나눠 정리하고, 위험하면 부활 위치만 기억한 채 빠진다.'
AND updated_at = '2026-09-13T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-zac-20260913');

-- 탐 켄치 챔피언 위키 (1052자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-tank-champion-tahmkench-20260913', 'article', '탐 켄치', '탐켄치', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 세 번째 절대 미각 중첩 전에 다음 행동을 정한다 · `Q`는 견제와 회복을 동시에 노린다 · `E` 보호막은 상대의 마지막 피해 묶음에 맞춘다

[[분류:탑]] [[분류:탱커]]

## 절대 미각 세 중첩이 교환의 기준선이다

**탐 켄치는 기본 공격과 `혀 채찍(Q)`으로 중첩을 쌓고, 세 중첩에서 기절이나 집어삼키기로 교환을 크게 만든다.**[* [탑 플래티넘 길라잡이](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143266)] 한두 중첩을 묻혔다고 적 포탑까지 따라가지 않는다. 세 번째 공격이 닿을 거리와 상대의 도주 기술을 보고 계속할지 끝낼지 미리 정한다.

## `Q`는 미니언 사이의 빈 선을 기다린다

**`혀 채찍(Q)`은 처음 맞는 유닛에 막힌다.**[* [탐 켄치 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=126)] 상대가 막타를 치러 미니언 옆으로 나오는 순간 각을 열고, 챔피언에게 맞혀 피해와 회복을 함께 챙긴다. 무작정 웨이브를 밀어 미니언 방패를 없애기보다 라인을 길게 두고 상대가 빈 선을 지나게 만든다.

## `W`는 도착 지점을 아군 쪽으로 잡는다

**`심연 잠수(W)`는 멀리 이동해 범위 안 적을 띄운다.** 상대 바로 뒤를 찍기보다 퇴로와 내 포탑 사이에 나타나야 다음 기본 공격이 이어진다. 시야 안에서 길게 준비하면 쉽게 피하므로 수풀이나 다른 기술의 둔화 뒤에 사용한다. 빗나갔다면 걸어서 긴 추격을 시작하지 않는다.

## 회색 체력과 궁극기로 피해 순서를 바꾼다

**`두꺼운 피부(E)`는 받은 피해 일부를 저장했다가 회복하거나 보호막으로 바꾼다.** 작은 피해에 바로 보호막을 쓰지 않고 상대의 마지막 폭발 피해가 들어오기 직전에 켠다. `집어삼키기(R)`는 적을 격리하거나 아군을 보호한다. 처치 욕심으로 적을 삼켜 아군 기술을 피하게 만들지 말고, **그 몇 초 동안 전장에서 없어져야 할 대상**을 고른다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-tank-champion-tahmkench-20260913' OR (kind = 'article' AND title_key = '탐켄치'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-tahmkench-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-tank-champion-tahmkench-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 세 번째 절대 미각 중첩 전에 다음 행동을 정한다 · `Q`는 견제와 회복을 동시에 노린다 · `E` 보호막은 상대의 마지막 피해 묶음에 맞춘다

[[분류:탑]] [[분류:탱커]]

## 절대 미각 세 중첩이 교환의 기준선이다

**탐 켄치는 기본 공격과 `혀 채찍(Q)`으로 중첩을 쌓고, 세 중첩에서 기절이나 집어삼키기로 교환을 크게 만든다.**[* [탑 플래티넘 길라잡이](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143266)] 한두 중첩을 묻혔다고 적 포탑까지 따라가지 않는다. 세 번째 공격이 닿을 거리와 상대의 도주 기술을 보고 계속할지 끝낼지 미리 정한다.

## `Q`는 미니언 사이의 빈 선을 기다린다

**`혀 채찍(Q)`은 처음 맞는 유닛에 막힌다.**[* [탐 켄치 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=126)] 상대가 막타를 치러 미니언 옆으로 나오는 순간 각을 열고, 챔피언에게 맞혀 피해와 회복을 함께 챙긴다. 무작정 웨이브를 밀어 미니언 방패를 없애기보다 라인을 길게 두고 상대가 빈 선을 지나게 만든다.

## `W`는 도착 지점을 아군 쪽으로 잡는다

**`심연 잠수(W)`는 멀리 이동해 범위 안 적을 띄운다.** 상대 바로 뒤를 찍기보다 퇴로와 내 포탑 사이에 나타나야 다음 기본 공격이 이어진다. 시야 안에서 길게 준비하면 쉽게 피하므로 수풀이나 다른 기술의 둔화 뒤에 사용한다. 빗나갔다면 걸어서 긴 추격을 시작하지 않는다.

## 회색 체력과 궁극기로 피해 순서를 바꾼다

**`두꺼운 피부(E)`는 받은 피해 일부를 저장했다가 회복하거나 보호막으로 바꾼다.** 작은 피해에 바로 보호막을 쓰지 않고 상대의 마지막 폭발 피해가 들어오기 직전에 켠다. `집어삼키기(R)`는 적을 격리하거나 아군을 보호한다. 처치 욕심으로 적을 삼켜 아군 기술을 피하게 만들지 말고, **그 몇 초 동안 전장에서 없어져야 할 대상**을 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-tahmkench-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-tahmkench-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-tank-champion-tahmkench-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-tahmkench-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-top-tank-champion-tahmkench-20260913';

-- tahmkench 상대법 (924자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-tahmkench', 'matchup', NULL, NULL, 'published', 'tahmkench', '', 0, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 절대 미각 중첩이 쌓이면 먼저 끊는다 · 미니언으로 `Q` 선을 막는다 · 회색 체력이 보호막이 된 뒤에는 시간을 뺀다

## 두 번째 중첩에서 이미 물러날 준비를 한다

**탐 켄치에게 세 중첩이 쌓인 뒤 빠지려 하면 `Q` 기절이나 `R` 격리가 이어진다.**[* [탑 플래티넘 길라잡이](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143266)] 체력바 주변 중첩을 보고 두 번째에서 거리를 만들기 시작한다. 세 번째 기본 공격을 피하려고 적 포탑 방향으로 도망가지 않고, 내 미니언 뒤로 돌아 `Q`까지 막는다.

## `Q`와 내 몸 사이에 미니언을 둔다

**`혀 채찍(Q)`은 첫 유닛에 막힌다.**[* [탐 켄치 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=126)] 원거리 미니언 옆에서 각도를 유지하고, 탐 켄치가 옆으로 크게 돌아 선을 만들면 반대편으로 움직인다. `Q`가 미니언에 빠진 뒤에는 회복과 둔화가 모두 없으므로 짧게 압박한다.

## `W` 표시는 중심이 아니라 가장자리로 빠진다

**`심연 잠수(W)`의 도착 표시가 생기면 가장 가까운 바깥쪽으로 벗어난다.** 뒤로만 가면 탐 켄치가 퇴로를 막는 위치에 나타날 수 있다. 빗나간 뒤 탐 켄치가 아군 미니언에서 멀다면 그 짧은 시간에 체력 이득을 돌려받는다.

## 큰 보호막을 때리며 기술을 낭비하지 않는다

**`두꺼운 피부(E)`로 회색 체력을 보호막으로 바꾸면 잠시 교환을 멈춘다.** 보호막이 사라진 뒤 다시 싸우고, 체력이 낮아 보여도 집어삼키기의 보호와 회복을 고려한다. 한타에서는 세 중첩을 허용한 아군이 삼켜지기 전에 탐 켄치와 거리를 벌리도록 돕는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-tahmkench' AND kind = 'matchup' AND champion_slug = 'tahmkench'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-tahmkench');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-tahmkench-20260913', id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-tahmkench' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 절대 미각 중첩이 쌓이면 먼저 끊는다 · 미니언으로 `Q` 선을 막는다 · 회색 체력이 보호막이 된 뒤에는 시간을 뺀다

## 두 번째 중첩에서 이미 물러날 준비를 한다

**탐 켄치에게 세 중첩이 쌓인 뒤 빠지려 하면 `Q` 기절이나 `R` 격리가 이어진다.**[* [탑 플래티넘 길라잡이](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143266)] 체력바 주변 중첩을 보고 두 번째에서 거리를 만들기 시작한다. 세 번째 기본 공격을 피하려고 적 포탑 방향으로 도망가지 않고, 내 미니언 뒤로 돌아 `Q`까지 막는다.

## `Q`와 내 몸 사이에 미니언을 둔다

**`혀 채찍(Q)`은 첫 유닛에 막힌다.**[* [탐 켄치 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=126)] 원거리 미니언 옆에서 각도를 유지하고, 탐 켄치가 옆으로 크게 돌아 선을 만들면 반대편으로 움직인다. `Q`가 미니언에 빠진 뒤에는 회복과 둔화가 모두 없으므로 짧게 압박한다.

## `W` 표시는 중심이 아니라 가장자리로 빠진다

**`심연 잠수(W)`의 도착 표시가 생기면 가장 가까운 바깥쪽으로 벗어난다.** 뒤로만 가면 탐 켄치가 퇴로를 막는 위치에 나타날 수 있다. 빗나간 뒤 탐 켄치가 아군 미니언에서 멀다면 그 짧은 시간에 체력 이득을 돌려받는다.

## 큰 보호막을 때리며 기술을 낭비하지 않는다

**`두꺼운 피부(E)`로 회색 체력을 보호막으로 바꾸면 잠시 교환을 멈춘다.** 보호막이 사라진 뒤 다시 싸우고, 체력이 낮아 보여도 집어삼키기의 보호와 회복을 고려한다. 한타에서는 세 중첩을 허용한 아군이 삼켜지기 전에 탐 켄치와 거리를 벌리도록 돕는다.'
AND updated_at = '2026-09-13T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-tahmkench-20260913');

-- 문도 박사 챔피언 위키 (1083자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-tank-champion-drmundo-20260913', 'article', '문도 박사', '문도박사', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`가 미니언에 막힐 각을 먼저 지운다 · `W`는 피해를 받은 뒤 되돌릴 대상 곁에서 끝낸다 · 궁극기는 죽기 직전보다 싸움 초반에 쓴다

[[분류:탑]] [[분류:탱커]]

## `Q`는 맞히는 횟수보다 빈 선을 만드는 과정이다

**`오염된 뼈톱(Q)`은 첫 유닛에 막히므로 상대와 나 사이의 낮은 체력 미니언을 먼저 정리하거나 옆으로 각을 바꾼다.**[* [문도 박사 연구 결과 및 분석 - 탑](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112977&vtype=pc)] 최대 거리에서 무작정 던져 체력만 소모하지 않는다. 상대가 막타를 치려고 미니언 옆으로 나오는 순간 맞히고, 둔화가 묻었을 때만 다음 기본 공격 거리를 본다.

## `W`는 켜는 순간보다 끝내는 자리가 중요하다

**`심장 전기 충격(W)`은 받은 피해 일부를 저장하고, 종료할 때 적을 맞혀야 더 많이 회복한다.**[* [문도 박사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=13)] 상대의 큰 교환이 시작될 때 켜고, 재사용 순간 챔피언이나 미니언 곁에 있도록 움직인다. 회복하려고 적 포탑까지 따라가기보다 안전한 미니언에 적중시켜 교환을 끝낸다.

## `E`로 처치할 미니언의 뒤를 본다

**`둔기에 의한 외상(E)`으로 적을 처치하면 뒤로 날아가 경로의 적에게 피해를 준다.** 낮은 체력 미니언과 상대 챔피언을 한 줄로 맞추면 막타와 견제를 함께 해결한다. 라인을 당겨야 할 때는 무심코 미니언을 밀어 웨이브 전체를 빠르게 정리하지 않는다.

## 군중 제어 면역과 궁극기를 체력 여유로 바꾼다

**문도 박사는 처음 맞는 이동 불가 효과를 막고 떨어진 화학 물질을 주워 회복할 수 있다.** 적의 핵심 제어기를 대신 맞을 때는 주울 길까지 본다. `최대 투여량(R)`은 체력이 사라진 뒤 누르는 구조가 아니다. **상대의 폭발 피해가 들어오기 전에 사용해 회복할 시간을 확보하고**, 얻은 이동 속도로 앞선을 유지할지 빠질지 결정한다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-tank-champion-drmundo-20260913' OR (kind = 'article' AND title_key = '문도박사'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-champion-drmundo-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-tank-champion-drmundo-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`가 미니언에 막힐 각을 먼저 지운다 · `W`는 피해를 받은 뒤 되돌릴 대상 곁에서 끝낸다 · 궁극기는 죽기 직전보다 싸움 초반에 쓴다

[[분류:탑]] [[분류:탱커]]

## `Q`는 맞히는 횟수보다 빈 선을 만드는 과정이다

**`오염된 뼈톱(Q)`은 첫 유닛에 막히므로 상대와 나 사이의 낮은 체력 미니언을 먼저 정리하거나 옆으로 각을 바꾼다.**[* [문도 박사 연구 결과 및 분석 - 탑](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112977&vtype=pc)] 최대 거리에서 무작정 던져 체력만 소모하지 않는다. 상대가 막타를 치려고 미니언 옆으로 나오는 순간 맞히고, 둔화가 묻었을 때만 다음 기본 공격 거리를 본다.

## `W`는 켜는 순간보다 끝내는 자리가 중요하다

**`심장 전기 충격(W)`은 받은 피해 일부를 저장하고, 종료할 때 적을 맞혀야 더 많이 회복한다.**[* [문도 박사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=13)] 상대의 큰 교환이 시작될 때 켜고, 재사용 순간 챔피언이나 미니언 곁에 있도록 움직인다. 회복하려고 적 포탑까지 따라가기보다 안전한 미니언에 적중시켜 교환을 끝낸다.

## `E`로 처치할 미니언의 뒤를 본다

**`둔기에 의한 외상(E)`으로 적을 처치하면 뒤로 날아가 경로의 적에게 피해를 준다.** 낮은 체력 미니언과 상대 챔피언을 한 줄로 맞추면 막타와 견제를 함께 해결한다. 라인을 당겨야 할 때는 무심코 미니언을 밀어 웨이브 전체를 빠르게 정리하지 않는다.

## 군중 제어 면역과 궁극기를 체력 여유로 바꾼다

**문도 박사는 처음 맞는 이동 불가 효과를 막고 떨어진 화학 물질을 주워 회복할 수 있다.** 적의 핵심 제어기를 대신 맞을 때는 주울 길까지 본다. `최대 투여량(R)`은 체력이 사라진 뒤 누르는 구조가 아니다. **상대의 폭발 피해가 들어오기 전에 사용해 회복할 시간을 확보하고**, 얻은 이동 속도로 앞선을 유지할지 빠질지 결정한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-champion-drmundo-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-drmundo-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-tank-champion-drmundo-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-tank-champion-drmundo-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-top-tank-champion-drmundo-20260913';

-- drmundo 상대법 (974자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-drmundo', 'matchup', NULL, NULL, 'published', 'drmundo', '', 0, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 미니언으로 `Q`를 막는다 · 첫 이동 불가 효과는 패시브를 벗기는 데 쓴다 · 궁극기가 켜지면 회복 시간을 주지 않거나 싸움을 끊는다

## 뼈톱의 빈 선을 계속 바꾼다

**`오염된 뼈톱(Q)`은 처음 맞는 유닛에 막힌다.**[* [문도 박사 연구 결과 및 분석 - 탑](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112977&vtype=pc)] 체력이 충분한 미니언 뒤에서 각도를 유지하고, 낮은 체력 미니언은 `E`에 밀려 투사체가 될 수 있으니 바로 뒤에 서지 않는다. `Q`가 미니언에 빠졌다면 둔화가 없는 시간에 막타나 짧은 견제를 챙긴다.

## 첫 군중 제어기는 처치보다 패시브 제거가 목적이다

**문도 박사는 처음 맞는 이동 불가 효과를 막고 화학 물질을 떨어뜨린다.**[* [문도 박사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=13)] 가장 긴 핵심 기술부터 쓰지 말고 짧은 제어기로 패시브를 먼저 벗긴다. 떨어진 물질을 문도가 줍기 전에 안전하게 밟을 수 있다면 회복과 패시브 재사용 감소를 함께 막는다.

## `W`가 켜졌을 때 피해를 한꺼번에 몰지 않는다

**문도는 `심장 전기 충격(W)` 동안 받은 피해 일부를 저장했다가 종료 적중으로 회복한다.** 큰 기술을 모두 겹치면 되돌리는 양도 커진다. 종료할 때 거리를 벌여 적중 대상을 주지 않거나, 회복이 끝난 뒤 남은 기술로 다시 교환한다.

## 궁극기를 빼면 끝까지 따라가기보다 다음 창을 만든다

**`최대 투여량(R)`은 긴 시간 체력을 회복하고 이동 속도를 준다.** 문도가 낮은 체력이라고 직선으로 계속 쫓으면 회복이 따라잡는다. 처치를 확정할 피해가 없다면 궁극기만 빼고 웨이브나 시야를 챙긴 뒤, 재사용 대기시간 동안 다음 교환을 준비한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-13T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-drmundo' AND kind = 'matchup' AND champion_slug = 'drmundo'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-drmundo');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-tank-matchup-drmundo-20260913', id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-drmundo' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 미니언으로 `Q`를 막는다 · 첫 이동 불가 효과는 패시브를 벗기는 데 쓴다 · 궁극기가 켜지면 회복 시간을 주지 않거나 싸움을 끊는다

## 뼈톱의 빈 선을 계속 바꾼다

**`오염된 뼈톱(Q)`은 처음 맞는 유닛에 막힌다.**[* [문도 박사 연구 결과 및 분석 - 탑](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112977&vtype=pc)] 체력이 충분한 미니언 뒤에서 각도를 유지하고, 낮은 체력 미니언은 `E`에 밀려 투사체가 될 수 있으니 바로 뒤에 서지 않는다. `Q`가 미니언에 빠졌다면 둔화가 없는 시간에 막타나 짧은 견제를 챙긴다.

## 첫 군중 제어기는 처치보다 패시브 제거가 목적이다

**문도 박사는 처음 맞는 이동 불가 효과를 막고 화학 물질을 떨어뜨린다.**[* [문도 박사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=13)] 가장 긴 핵심 기술부터 쓰지 말고 짧은 제어기로 패시브를 먼저 벗긴다. 떨어진 물질을 문도가 줍기 전에 안전하게 밟을 수 있다면 회복과 패시브 재사용 감소를 함께 막는다.

## `W`가 켜졌을 때 피해를 한꺼번에 몰지 않는다

**문도는 `심장 전기 충격(W)` 동안 받은 피해 일부를 저장했다가 종료 적중으로 회복한다.** 큰 기술을 모두 겹치면 되돌리는 양도 커진다. 종료할 때 거리를 벌여 적중 대상을 주지 않거나, 회복이 끝난 뒤 남은 기술로 다시 교환한다.

## 궁극기를 빼면 끝까지 따라가기보다 다음 창을 만든다

**`최대 투여량(R)`은 긴 시간 체력을 회복하고 이동 속도를 준다.** 문도가 낮은 체력이라고 직선으로 계속 쫓으면 회복이 따라잡는다. 처치를 확정할 피해가 없다면 궁극기만 빼고 웨이브나 시야를 챙긴 뒤, 재사용 대기시간 동안 다음 교환을 준비한다.'
AND updated_at = '2026-09-13T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-tank-matchup-drmundo-20260913');
