-- scripts/seed-top-bruiser-wiki.ts가 생성. 원고는 seeds/champion-wiki와 seeds/top-bruiser-matchup-wiki.
-- 기존 사용자 편집을 보존하고, 조사 시점과 상태가 정확히 같은 이렐리아 시스템 원고만 갱신한다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)
VALUES ('user-system', 'system', 'seed', '깨남.COM', NULL, 'admin', '2026-09-14T06:00:00.000Z');

-- 아트록스 챔피언 위키 (1104자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-champion-aatrox-20260914', 'article', '아트록스', '아트록스', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 끝을 맞힐 거리를 만든다 · `E`는 피해보다 위치 보정에 쓴다 · 궁극기의 회복 증폭은 적중해야 의미가 있다

[[분류:탑]] [[분류:딜탱]]

## 첫 `Q`는 피해보다 다음 칼날의 자리를 만든다

**`다르킨의 검(Q)`은 세 번의 범위와 핵심 타격 지점이 서로 다르다.** 첫 칼날의 바깥쪽으로 상대를 띄운 뒤 `지옥사슬(W)`을 걸면 다음 칼날을 피할 공간이 줄어든다.[* [아트록스 원챔러의 글](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145316&vtype=pc)] 첫 타가 빗나갔다면 남은 횟수를 무조건 소비하지 않는다. 웨이브를 함께 긁어 라인을 밀어 버릴지, 재사용 대기시간을 앞당길지 먼저 고른다.

## `E`는 칼날이 내려오는 순간에 짧게 보정한다

**`파멸의 돌진(E)`을 먼저 써서 거리를 좁히면 상대는 `Q`의 방향을 읽기 쉽다.** `Q`를 누른 뒤 상대가 옆으로 피하는 움직임에 맞춰 짧게 보정하면 핵심부 적중률이 높아진다. 반대로 상대의 강한 진입기가 남아 있다면 `E`를 공격에 모두 쓰지 않고 첫 반격을 피할 여지를 남긴다.

## 사슬은 도망칠 길이 좁을 때 건다

**`지옥사슬(W)`은 맞히는 순간보다 끌려오는 순간에 가치가 생긴다.**[* [메타에 따라 바뀌는 아트록스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142004&vtype=pc)] 상대 뒤에 벽이나 미니언이 있어 옆으로 빠질 길이 줄었을 때 사용하고, 사슬 중앙으로 이동할 상대에게 두 번째 `Q`를 겹친다. 넓은 공간에서 빗나가면 억지로 추격하지 않고 다음 웨이브까지 기다린다.

## 궁극기는 첫 적중 직전에 켠다

**`세계의 종결자(R)`의 이동 속도와 회복 증폭은 실제로 챔피언을 맞힐 때 힘이 난다.** 너무 일찍 켜고 걸어가면 지속시간만 줄어든다. 첫 `Q`나 사슬이 닿을 구도가 만들어진 뒤 켜고, 처치 관여로 지속시간이 늘어날 수 있는 교전에서는 체력이 낮은 대상부터 무리하게 쫓기보다 다음 핵심 타격이 닿는 대상을 고른다.', 1, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-aatrox-20260914' OR (kind = 'article' AND title_key = '아트록스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-champion-aatrox-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-champion-aatrox-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 끝을 맞힐 거리를 만든다 · `E`는 피해보다 위치 보정에 쓴다 · 궁극기의 회복 증폭은 적중해야 의미가 있다

[[분류:탑]] [[분류:딜탱]]

## 첫 `Q`는 피해보다 다음 칼날의 자리를 만든다

**`다르킨의 검(Q)`은 세 번의 범위와 핵심 타격 지점이 서로 다르다.** 첫 칼날의 바깥쪽으로 상대를 띄운 뒤 `지옥사슬(W)`을 걸면 다음 칼날을 피할 공간이 줄어든다.[* [아트록스 원챔러의 글](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145316&vtype=pc)] 첫 타가 빗나갔다면 남은 횟수를 무조건 소비하지 않는다. 웨이브를 함께 긁어 라인을 밀어 버릴지, 재사용 대기시간을 앞당길지 먼저 고른다.

## `E`는 칼날이 내려오는 순간에 짧게 보정한다

**`파멸의 돌진(E)`을 먼저 써서 거리를 좁히면 상대는 `Q`의 방향을 읽기 쉽다.** `Q`를 누른 뒤 상대가 옆으로 피하는 움직임에 맞춰 짧게 보정하면 핵심부 적중률이 높아진다. 반대로 상대의 강한 진입기가 남아 있다면 `E`를 공격에 모두 쓰지 않고 첫 반격을 피할 여지를 남긴다.

## 사슬은 도망칠 길이 좁을 때 건다

**`지옥사슬(W)`은 맞히는 순간보다 끌려오는 순간에 가치가 생긴다.**[* [메타에 따라 바뀌는 아트록스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142004&vtype=pc)] 상대 뒤에 벽이나 미니언이 있어 옆으로 빠질 길이 줄었을 때 사용하고, 사슬 중앙으로 이동할 상대에게 두 번째 `Q`를 겹친다. 넓은 공간에서 빗나가면 억지로 추격하지 않고 다음 웨이브까지 기다린다.

## 궁극기는 첫 적중 직전에 켠다

**`세계의 종결자(R)`의 이동 속도와 회복 증폭은 실제로 챔피언을 맞힐 때 힘이 난다.** 너무 일찍 켜고 걸어가면 지속시간만 줄어든다. 첫 `Q`나 사슬이 닿을 구도가 만들어진 뒤 켜고, 처치 관여로 지속시간이 늘어날 수 있는 교전에서는 체력이 낮은 대상부터 무리하게 쫓기보다 다음 핵심 타격이 닿는 대상을 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-aatrox-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-aatrox-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-aatrox-20260914';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-aatrox-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-aatrox-20260914';

-- aatrox 상대법 (960자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-aatrox', 'matchup', NULL, NULL, 'published', 'aatrox', '', 0, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 첫 `Q`는 옆으로 피한다 · 사슬은 가장 가까운 경계로 나간다 · 궁극기 동안 회복할 대상을 내주지 않는다

## 첫 칼날을 피한 방향에서 다음 범위를 예상한다

**아트록스의 `다르킨의 검(Q)`은 세 번의 모양과 강한 지점이 서로 다르다.**[* [아트록스 원챔러의 글](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145316&vtype=pc)] 첫 타의 바깥쪽 끝에서 뒤로만 물러나면 두 번째 타격의 넓은 중심에 들어간다. 첫 칼날은 옆으로 벗어나고, 두 번째는 아트록스 가까이 붙거나 완전히 멀어지는 쪽을 즉시 고른다.

## `E` 보정이 빠진 뒤 방향을 바꾼다

**칼날이 내려오기 전에 아트록스가 `파멸의 돌진(E)`으로 위치를 고칠 수 있다.** 너무 일찍 한 방향으로 달리면 `E`가 그 움직임을 따라온다. 짧게 유도한 뒤 돌진이 보이는 순간 반대쪽으로 꺾고, `E`가 빠진 다음 교환에서 이동 우위를 활용한다.

## 사슬 중앙을 가로지르지 않는다

**`지옥사슬(W)`에 맞으면 중앙에서 가장 가까운 경계로 곧장 빠져나간다.**[* [메타에 따라 바뀌는 아트록스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142004&vtype=pc)] 아트록스를 피해 반대편으로 빙 돌아 나가면 끌려오기 쉽다. 경계 밖으로 나간 뒤에야 다음 칼날을 피하고, 사슬과 `Q`가 모두 빠졌을 때 짧게 되받아친다.

## 궁극기 동안은 처치와 회복의 연쇄를 끊는다

**`세계의 종결자(R)`가 켜지면 아트록스의 이동과 회복이 강해지고 처치 관여로 시간이 늘어난다.** 체력이 낮은 아군이 앞에 남아 첫 연장을 내주지 않도록 흩어져 빠진다. 핵심 칼날이 빗나간 뒤에만 제어를 이어서 회복할 피해 자체를 줄인다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-aatrox' AND kind = 'matchup' AND champion_slug = 'aatrox'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-aatrox');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-matchup-aatrox-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-aatrox' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 첫 `Q`는 옆으로 피한다 · 사슬은 가장 가까운 경계로 나간다 · 궁극기 동안 회복할 대상을 내주지 않는다

## 첫 칼날을 피한 방향에서 다음 범위를 예상한다

**아트록스의 `다르킨의 검(Q)`은 세 번의 모양과 강한 지점이 서로 다르다.**[* [아트록스 원챔러의 글](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145316&vtype=pc)] 첫 타의 바깥쪽 끝에서 뒤로만 물러나면 두 번째 타격의 넓은 중심에 들어간다. 첫 칼날은 옆으로 벗어나고, 두 번째는 아트록스 가까이 붙거나 완전히 멀어지는 쪽을 즉시 고른다.

## `E` 보정이 빠진 뒤 방향을 바꾼다

**칼날이 내려오기 전에 아트록스가 `파멸의 돌진(E)`으로 위치를 고칠 수 있다.** 너무 일찍 한 방향으로 달리면 `E`가 그 움직임을 따라온다. 짧게 유도한 뒤 돌진이 보이는 순간 반대쪽으로 꺾고, `E`가 빠진 다음 교환에서 이동 우위를 활용한다.

## 사슬 중앙을 가로지르지 않는다

**`지옥사슬(W)`에 맞으면 중앙에서 가장 가까운 경계로 곧장 빠져나간다.**[* [메타에 따라 바뀌는 아트록스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142004&vtype=pc)] 아트록스를 피해 반대편으로 빙 돌아 나가면 끌려오기 쉽다. 경계 밖으로 나간 뒤에야 다음 칼날을 피하고, 사슬과 `Q`가 모두 빠졌을 때 짧게 되받아친다.

## 궁극기 동안은 처치와 회복의 연쇄를 끊는다

**`세계의 종결자(R)`가 켜지면 아트록스의 이동과 회복이 강해지고 처치 관여로 시간이 늘어난다.** 체력이 낮은 아군이 앞에 남아 첫 연장을 내주지 않도록 흩어져 빠진다. 핵심 칼날이 빗나간 뒤에만 제어를 이어서 회복할 피해 자체를 줄인다.'
AND updated_at = '2026-09-14T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-matchup-aatrox-20260914');

-- 다리우스 챔피언 위키 (993자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-champion-darius-20260914', 'article', '다리우스', '다리우스', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 도끼날과 자루를 구분한다 · 출혈 다섯 중첩 전에는 퇴로를 남긴다 · 라인을 얼릴 때는 광역기를 아낀다

[[분류:탑]] [[분류:딜탱]]

## 도끼날을 맞힐 공간부터 확보한다

**`학살(Q)`은 바깥 도끼날을 맞혀야 큰 피해와 회복을 함께 얻는다.**[* [다리우스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=98)] 상대가 안으로 파고들면 자루에 맞으므로 `마비의 일격(W)` 둔화나 `포획(E)` 뒤에 반 걸음 물러나 끝 거리를 맞춘다. 체력이 낮을수록 여러 챔피언을 긁겠다고 중앙으로 들어가기보다 도끼날이 확실한 한 명을 고른다.

## 출혈 중첩은 한 번에 완성하려 하지 않는다

**기본 공격과 기술 사이를 끊지 않아야 다섯 중첩의 압박이 생긴다.** 상대의 이동기가 남았는데 `E`부터 쓰면 마지막 중첩 전에 거리가 벌어진다. 먼저 걸어서 기본 공격과 `W`를 묻히고, 도주가 시작될 때 끌어당기는 편이 긴 교환을 이어 가기 쉽다.

## `Q`를 웨이브에 쓰기 전에 라인 위치를 본다

**막타 견제로 `Q`를 반복하면 원치 않게 라인이 밀려 상대 포탑 앞에 얼 수 있다.**[* [D3 오열다리 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133490)] 확실한 교환이 아니라면 기본 공격으로 미니언을 정리하고, 상대가 도끼날과 막타를 동시에 내줄 때만 넓게 휘두른다. 긴 라인에서 싸우고 싶다면 강가 쪽 정보를 먼저 확인한다.

## 궁극기는 중첩과 다음 대상을 함께 본다

**`녹서스의 단두대(R)`는 출혈이 쌓일수록 강해지고 처치하면 다시 쓸 기회가 생긴다.** 한 명을 너무 일찍 찍어 처치에 실패하면 가장 강한 연쇄가 끊긴다. 현재 대상의 중첩 수와 남은 체력을 확인하고, 처치 뒤 바로 닿을 다음 적이 있는지도 보고 뛰어든다.', 1, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-darius-20260914' OR (kind = 'article' AND title_key = '다리우스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-champion-darius-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-champion-darius-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 도끼날과 자루를 구분한다 · 출혈 다섯 중첩 전에는 퇴로를 남긴다 · 라인을 얼릴 때는 광역기를 아낀다

[[분류:탑]] [[분류:딜탱]]

## 도끼날을 맞힐 공간부터 확보한다

**`학살(Q)`은 바깥 도끼날을 맞혀야 큰 피해와 회복을 함께 얻는다.**[* [다리우스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=98)] 상대가 안으로 파고들면 자루에 맞으므로 `마비의 일격(W)` 둔화나 `포획(E)` 뒤에 반 걸음 물러나 끝 거리를 맞춘다. 체력이 낮을수록 여러 챔피언을 긁겠다고 중앙으로 들어가기보다 도끼날이 확실한 한 명을 고른다.

## 출혈 중첩은 한 번에 완성하려 하지 않는다

**기본 공격과 기술 사이를 끊지 않아야 다섯 중첩의 압박이 생긴다.** 상대의 이동기가 남았는데 `E`부터 쓰면 마지막 중첩 전에 거리가 벌어진다. 먼저 걸어서 기본 공격과 `W`를 묻히고, 도주가 시작될 때 끌어당기는 편이 긴 교환을 이어 가기 쉽다.

## `Q`를 웨이브에 쓰기 전에 라인 위치를 본다

**막타 견제로 `Q`를 반복하면 원치 않게 라인이 밀려 상대 포탑 앞에 얼 수 있다.**[* [D3 오열다리 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133490)] 확실한 교환이 아니라면 기본 공격으로 미니언을 정리하고, 상대가 도끼날과 막타를 동시에 내줄 때만 넓게 휘두른다. 긴 라인에서 싸우고 싶다면 강가 쪽 정보를 먼저 확인한다.

## 궁극기는 중첩과 다음 대상을 함께 본다

**`녹서스의 단두대(R)`는 출혈이 쌓일수록 강해지고 처치하면 다시 쓸 기회가 생긴다.** 한 명을 너무 일찍 찍어 처치에 실패하면 가장 강한 연쇄가 끊긴다. 현재 대상의 중첩 수와 남은 체력을 확인하고, 처치 뒤 바로 닿을 다음 적이 있는지도 보고 뛰어든다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-darius-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-darius-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-darius-20260914';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-darius-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-darius-20260914';

-- darius 상대법 (920자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-darius', 'matchup', NULL, NULL, 'published', 'darius', '', 0, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — `Q`는 도끼 안쪽으로 파고든다 · 출혈이 쌓이면 교환을 끊는다 · `E`가 빠진 뒤 거리 우위를 쓴다

## 도끼날과 자루 사이에서 선택한다

**다리우스의 `학살(Q)`는 바깥 도끼날에 맞아야 피해와 회복이 커진다.**[* [다리우스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=98)] 완전히 벗어날 수 없다면 뒤로 달리기보다 다리우스 안쪽으로 붙어 자루에 맞는다. 바깥으로 빠질 거리가 충분할 때만 멀어지고, 도끼날 회복을 내준 상태에서는 바로 긴 싸움을 열지 않는다.

## 출혈 중첩이 낮을 때 교환을 끝낸다

**다섯 중첩에 가까워질수록 기본 공격과 `녹서스의 단두대(R)`의 위협이 함께 커진다.** 세 번째나 네 번째 중첩을 허용한 뒤 한 대만 더 치겠다고 남지 않는다. 표식이 사라질 시간을 확보하고 다음 막타를 포기해서라도 거리를 초기화한다.

## `E`를 쓰게 만든 뒤 이동기로 빠진다

**`포획(E)`이 남아 있으면 먼저 이동기를 써도 다시 끌려와 긴 교환이 열린다.** 끌어당김 범위 끝에서 앞뒤로 움직여 사용을 유도하고, 빗나간 뒤에 짧게 공격하거나 라인을 정리한다. `E`에 잡혔다면 다리우스가 `Q` 끝을 맞힐 수 없도록 안쪽으로 움직인다.

## 라인을 얼릴 때 `Q`를 미니언에 쓰게 한다

**다리우스가 견제용 `Q`로 웨이브까지 계속 치면 라인이 자연히 앞으로 온다.**[* [D3 오열다리 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133490)] 내 포탑 바깥에 미니언을 남기고 도끼 한 번으로 막타와 견제를 동시에 하게 유도한다. 긴 라인으로 돌아갈 때는 출혈 중첩이 없는 상태에서 시작한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-darius' AND kind = 'matchup' AND champion_slug = 'darius'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-darius');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-matchup-darius-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-darius' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — `Q`는 도끼 안쪽으로 파고든다 · 출혈이 쌓이면 교환을 끊는다 · `E`가 빠진 뒤 거리 우위를 쓴다

## 도끼날과 자루 사이에서 선택한다

**다리우스의 `학살(Q)`는 바깥 도끼날에 맞아야 피해와 회복이 커진다.**[* [다리우스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=98)] 완전히 벗어날 수 없다면 뒤로 달리기보다 다리우스 안쪽으로 붙어 자루에 맞는다. 바깥으로 빠질 거리가 충분할 때만 멀어지고, 도끼날 회복을 내준 상태에서는 바로 긴 싸움을 열지 않는다.

## 출혈 중첩이 낮을 때 교환을 끝낸다

**다섯 중첩에 가까워질수록 기본 공격과 `녹서스의 단두대(R)`의 위협이 함께 커진다.** 세 번째나 네 번째 중첩을 허용한 뒤 한 대만 더 치겠다고 남지 않는다. 표식이 사라질 시간을 확보하고 다음 막타를 포기해서라도 거리를 초기화한다.

## `E`를 쓰게 만든 뒤 이동기로 빠진다

**`포획(E)`이 남아 있으면 먼저 이동기를 써도 다시 끌려와 긴 교환이 열린다.** 끌어당김 범위 끝에서 앞뒤로 움직여 사용을 유도하고, 빗나간 뒤에 짧게 공격하거나 라인을 정리한다. `E`에 잡혔다면 다리우스가 `Q` 끝을 맞힐 수 없도록 안쪽으로 움직인다.

## 라인을 얼릴 때 `Q`를 미니언에 쓰게 한다

**다리우스가 견제용 `Q`로 웨이브까지 계속 치면 라인이 자연히 앞으로 온다.**[* [D3 오열다리 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133490)] 내 포탑 바깥에 미니언을 남기고 도끼 한 번으로 막타와 견제를 동시에 하게 유도한다. 긴 라인으로 돌아갈 때는 출혈 중첩이 없는 상태에서 시작한다.'
AND updated_at = '2026-09-14T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-matchup-darius-20260914');

-- 가렌 챔피언 위키 (973자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-champion-garen-20260914', 'article', '가렌', '가렌', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`로 둔화를 먼저 지운다 · `W`의 첫 순간에 큰 피해를 받는다 · `E`는 한 대상을 중심에 둔다

[[분류:탑]] [[분류:딜탱]]

## 회복 구간을 웨이브와 맞춘다

**가렌의 유지력은 상대 챔피언에게 맞지 않는 시간을 확보할 때 돌아온다.**[* [새 시즌 가렌 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148076)] 체력이 빠졌다면 막타 하나를 위해 견제 범위로 다시 들어가기보다 미니언이 내 쪽으로 오게 두고 잠시 거리를 둔다. 회복이 시작된 뒤에야 다음 교환을 열어야 짧은 교환을 반복하는 강점이 살아난다.

## `Q`는 접근 버튼이자 둔화 해제다

**`결정타(Q)`를 상대가 보이는 즉시 누르지 말고, 먼저 걸려 오는 둔화를 지울 순간을 기다린다.** 침묵 뒤 `심판(E)`을 이어야 상대의 반격 기술을 늦출 수 있다. 접근할 수 없는 거리에서 이동 속도만 소비했다면 웨이브를 밀겠다고 깊이 따라가지 않는다.

## `W`의 첫 순간을 큰 공격에 겹친다

**`용기(W)`는 사용 직후의 보호막과 강인함이 가장 급한 피해와 제어를 넘기는 구간이다.**[* [진짜 가렌 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142970&vtype=pc)] 상대의 약한 견제에 미리 쓰지 않고, 기절이나 강한 단일 기술이 닿기 직전에 켠다. `W`가 없을 때는 평소와 같은 거리로 들어가지 않는다.

## `E`가 끝난 뒤의 거리를 계산한다

**`심판(E)`은 한 대상을 가까이 두고 끝까지 맞힐 때 압박이 커진다.** 회전 중 상대 포탑 쪽으로 깊어지면 끝난 뒤 빠질 기술이 없다. `Q` 침묵 동안 필요한 만큼만 따라가고, 처형 가능한 체력이 아니라면 상대의 이동기가 돌아오기 전에 회전을 끊고 나온다.', 1, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-garen-20260914' OR (kind = 'article' AND title_key = '가렌'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-champion-garen-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-champion-garen-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`로 둔화를 먼저 지운다 · `W`의 첫 순간에 큰 피해를 받는다 · `E`는 한 대상을 중심에 둔다

[[분류:탑]] [[분류:딜탱]]

## 회복 구간을 웨이브와 맞춘다

**가렌의 유지력은 상대 챔피언에게 맞지 않는 시간을 확보할 때 돌아온다.**[* [새 시즌 가렌 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148076)] 체력이 빠졌다면 막타 하나를 위해 견제 범위로 다시 들어가기보다 미니언이 내 쪽으로 오게 두고 잠시 거리를 둔다. 회복이 시작된 뒤에야 다음 교환을 열어야 짧은 교환을 반복하는 강점이 살아난다.

## `Q`는 접근 버튼이자 둔화 해제다

**`결정타(Q)`를 상대가 보이는 즉시 누르지 말고, 먼저 걸려 오는 둔화를 지울 순간을 기다린다.** 침묵 뒤 `심판(E)`을 이어야 상대의 반격 기술을 늦출 수 있다. 접근할 수 없는 거리에서 이동 속도만 소비했다면 웨이브를 밀겠다고 깊이 따라가지 않는다.

## `W`의 첫 순간을 큰 공격에 겹친다

**`용기(W)`는 사용 직후의 보호막과 강인함이 가장 급한 피해와 제어를 넘기는 구간이다.**[* [진짜 가렌 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142970&vtype=pc)] 상대의 약한 견제에 미리 쓰지 않고, 기절이나 강한 단일 기술이 닿기 직전에 켠다. `W`가 없을 때는 평소와 같은 거리로 들어가지 않는다.

## `E`가 끝난 뒤의 거리를 계산한다

**`심판(E)`은 한 대상을 가까이 두고 끝까지 맞힐 때 압박이 커진다.** 회전 중 상대 포탑 쪽으로 깊어지면 끝난 뒤 빠질 기술이 없다. `Q` 침묵 동안 필요한 만큼만 따라가고, 처형 가능한 체력이 아니라면 상대의 이동기가 돌아오기 전에 회전을 끊고 나온다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-garen-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-garen-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-garen-20260914';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-garen-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-garen-20260914';

-- garen 상대법 (948자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-garen', 'matchup', NULL, NULL, 'published', 'garen', '', 0, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — `Q` 침묵 전에 거리를 벌린다 · `W` 첫 순간에는 큰 기술을 아낀다 · 회복이 시작되기 전에 가볍게 건드린다

## 검이 빛나면 기술보다 거리를 먼저 쓴다

**가렌의 `결정타(Q)`는 둔화를 지우고 이동 속도를 높인 뒤 다음 공격으로 침묵시킨다.**[* [진짜 가렌 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142970&vtype=pc)] 둔화 하나만 믿고 정면에서 견제하면 해제한 뒤 바로 붙는다. 검이 빛나는 동안은 옆이나 뒤로 빠지고, 강화 공격이 미니언에 소비되거나 시간이 끝난 뒤 기술을 건다.

## `W` 보호막이 보이면 큰 피해를 늦춘다

**`용기(W)`는 사용 직후 보호막과 높은 강인함을 얻고 이어서 피해를 줄인다.** 제어와 폭발 피해를 첫 순간에 모두 넣지 않는다. 약한 공격으로 사용을 확인한 뒤 보호막이 사라지는 박자에 핵심 기술을 맞추고, `W`가 없는 다음 교환을 길게 가져간다.

## `E` 한가운데서 함께 걷지 않는다

**`심판(E)`가 시작되면 가렌과 같은 방향으로 오래 달리지 말고 가장 짧은 바깥 경로로 벗어난다.** 회전이 끝난 자리에서 바로 반격할 수 있도록 거리를 유지한다. 침묵까지 맞았다면 기술이 돌아오는 순간만 기다리고 포탑 반대쪽으로 맞서 걷지 않는다.

## 회복 시간을 공짜로 주지 않는다

**가렌은 상대 챔피언에게 피해를 받지 않는 시간이 이어지면 체력을 회복한다.**[* [새 시즌 가렌 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148076)] 큰 교환을 열 수 없더라도 안전한 원거리 공격 하나로 회복 시작을 늦춘다. 다만 이를 위해 미니언 사이로 깊게 들어가 `Q`와 `E` 전체를 맞는 선택은 피한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-garen' AND kind = 'matchup' AND champion_slug = 'garen'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-garen');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-matchup-garen-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-garen' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — `Q` 침묵 전에 거리를 벌린다 · `W` 첫 순간에는 큰 기술을 아낀다 · 회복이 시작되기 전에 가볍게 건드린다

## 검이 빛나면 기술보다 거리를 먼저 쓴다

**가렌의 `결정타(Q)`는 둔화를 지우고 이동 속도를 높인 뒤 다음 공격으로 침묵시킨다.**[* [진짜 가렌 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142970&vtype=pc)] 둔화 하나만 믿고 정면에서 견제하면 해제한 뒤 바로 붙는다. 검이 빛나는 동안은 옆이나 뒤로 빠지고, 강화 공격이 미니언에 소비되거나 시간이 끝난 뒤 기술을 건다.

## `W` 보호막이 보이면 큰 피해를 늦춘다

**`용기(W)`는 사용 직후 보호막과 높은 강인함을 얻고 이어서 피해를 줄인다.** 제어와 폭발 피해를 첫 순간에 모두 넣지 않는다. 약한 공격으로 사용을 확인한 뒤 보호막이 사라지는 박자에 핵심 기술을 맞추고, `W`가 없는 다음 교환을 길게 가져간다.

## `E` 한가운데서 함께 걷지 않는다

**`심판(E)`가 시작되면 가렌과 같은 방향으로 오래 달리지 말고 가장 짧은 바깥 경로로 벗어난다.** 회전이 끝난 자리에서 바로 반격할 수 있도록 거리를 유지한다. 침묵까지 맞았다면 기술이 돌아오는 순간만 기다리고 포탑 반대쪽으로 맞서 걷지 않는다.

## 회복 시간을 공짜로 주지 않는다

**가렌은 상대 챔피언에게 피해를 받지 않는 시간이 이어지면 체력을 회복한다.**[* [새 시즌 가렌 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148076)] 큰 교환을 열 수 없더라도 안전한 원거리 공격 하나로 회복 시작을 늦춘다. 다만 이를 위해 미니언 사이로 깊게 들어가 `Q`와 `E` 전체를 맞는 선택은 피한다.'
AND updated_at = '2026-09-14T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-matchup-garen-20260914');

-- 레넥톤 챔피언 위키 (1056자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-champion-renekton-20260914', 'article', '레넥톤', '레넥톤', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 분노 50을 어떤 기술에 쓸지 먼저 정한다 · 첫 `E`는 대상을 맞혀야 두 번째가 열린다 · 궁극기로 다음 강화 기술을 당긴다

[[분류:탑]] [[분류:딜탱]]

## 분노는 교환 전에 용도를 정한다

**레넥톤의 같은 기술도 분노 50을 넘으면 역할이 달라진다.**[* [D3 탑 레넥톤 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132728&vtype=pc)] 체력을 회복하며 여러 대상을 긁어야 하면 강화 `양떼 도륙(Q)`, 보호막을 깨고 오래 묶어야 하면 강화 `무자비한 포식자(W)`, 방어력을 낮춰 긴 싸움을 열어야 하면 두 번째 `자르고 토막내기(E)`에 쓴다. 교환 도중 우연히 먼저 눌린 기술에 분노를 쓰지 않는다.

## 첫 돌진은 미니언을 통과해 쓴다

**`자르기(E)`가 적을 맞혀야 짧은 시간 안에 `토막내기(E)`를 다시 쓸 수 있다.**[* [레넥톤 500판 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138688)] 상대에게 바로 닿지 않아도 앞 미니언을 통과해 두 번째 돌진을 열고, `W`와 `Q` 교환 뒤 아군 쪽으로 빠지는 경로를 남긴다. 두 번을 모두 진입에 쓰면 상대 정글이 보이지 않을 때 퇴로가 없다.

## 짧은 교환은 기절 시간 안에 끝낸다

**`W`로 묶은 동안 기본 공격을 더 욕심내기보다 `Q`까지 넣고 두 번째 `E`로 나온다.** 상대의 반격이 시작된 뒤 빠지면 레넥톤의 짧은 폭발력보다 긴 재사용 대기시간이 드러난다. 강화 `W`가 필요하다면 분노가 차기 전부터 거리를 좁히지 않는다.

## 궁극기는 체력보다 분노 흐름을 본다

**`강신(R)`은 추가 체력과 함께 즉시·지속적으로 분노를 공급한다.** 체력이 거의 사라진 뒤 생존용으로만 누르면 강화 기술을 쓸 시간이 없다. 교환이 길어질 것이 확정된 순간에 켜서 첫 강화 기술을 당기고, 주변 피해를 넣으려 상대 포탑 쪽으로 무리하게 붙지는 않는다.', 1, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-renekton-20260914' OR (kind = 'article' AND title_key = '레넥톤'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-champion-renekton-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-champion-renekton-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 분노 50을 어떤 기술에 쓸지 먼저 정한다 · 첫 `E`는 대상을 맞혀야 두 번째가 열린다 · 궁극기로 다음 강화 기술을 당긴다

[[분류:탑]] [[분류:딜탱]]

## 분노는 교환 전에 용도를 정한다

**레넥톤의 같은 기술도 분노 50을 넘으면 역할이 달라진다.**[* [D3 탑 레넥톤 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132728&vtype=pc)] 체력을 회복하며 여러 대상을 긁어야 하면 강화 `양떼 도륙(Q)`, 보호막을 깨고 오래 묶어야 하면 강화 `무자비한 포식자(W)`, 방어력을 낮춰 긴 싸움을 열어야 하면 두 번째 `자르고 토막내기(E)`에 쓴다. 교환 도중 우연히 먼저 눌린 기술에 분노를 쓰지 않는다.

## 첫 돌진은 미니언을 통과해 쓴다

**`자르기(E)`가 적을 맞혀야 짧은 시간 안에 `토막내기(E)`를 다시 쓸 수 있다.**[* [레넥톤 500판 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138688)] 상대에게 바로 닿지 않아도 앞 미니언을 통과해 두 번째 돌진을 열고, `W`와 `Q` 교환 뒤 아군 쪽으로 빠지는 경로를 남긴다. 두 번을 모두 진입에 쓰면 상대 정글이 보이지 않을 때 퇴로가 없다.

## 짧은 교환은 기절 시간 안에 끝낸다

**`W`로 묶은 동안 기본 공격을 더 욕심내기보다 `Q`까지 넣고 두 번째 `E`로 나온다.** 상대의 반격이 시작된 뒤 빠지면 레넥톤의 짧은 폭발력보다 긴 재사용 대기시간이 드러난다. 강화 `W`가 필요하다면 분노가 차기 전부터 거리를 좁히지 않는다.

## 궁극기는 체력보다 분노 흐름을 본다

**`강신(R)`은 추가 체력과 함께 즉시·지속적으로 분노를 공급한다.** 체력이 거의 사라진 뒤 생존용으로만 누르면 강화 기술을 쓸 시간이 없다. 교환이 길어질 것이 확정된 순간에 켜서 첫 강화 기술을 당기고, 주변 피해를 넣으려 상대 포탑 쪽으로 무리하게 붙지는 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-renekton-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-renekton-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-renekton-20260914';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-renekton-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-renekton-20260914';

-- renekton 상대법 (944자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-renekton', 'matchup', NULL, NULL, 'published', 'renekton', '', 0, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 분노 50 전후로 거리를 바꾼다 · 첫 `E`가 미니언을 맞힐 선을 피한다 · 두 번째 돌진 뒤에 반격한다

## 분노가 차기 전과 후를 다른 챔피언처럼 본다

**레넥톤은 분노 50 이상에서 다음 기본 기술 하나를 강화한다.**[* [D3 탑 레넥톤 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132728&vtype=pc)] 분노가 낮을 때는 막타를 두고 짧게 압박하되, 50에 가까우면 강화 `W`나 `Q`의 범위 밖으로 물러난다. 강화 기술이 미니언 정리에 소비된 직후가 되받아칠 구간이다.

## 내 미니언이 첫 돌진의 발판이 되지 않게 선다

**`자르기(E)`가 유닛을 맞히면 레넥톤은 `토막내기(E)`를 한 번 더 쓸 수 있다.**[* [레넥톤 500판 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138688)] 낮은 체력 미니언 바로 뒤에 서면 첫 돌진으로 웨이브를 통과한 뒤 두 번째로 쉽게 닿는다. 미니언 선 옆으로 벌어져 첫 `E`가 챔피언과 웨이브를 함께 긁지 못하게 한다.

## 기절 중에는 반격 버튼을 서두르지 않는다

**`무자비한 포식자(W)`에 묶인 동안 레넥톤은 `Q`를 넣고 두 번째 `E`로 빠지는 짧은 교환을 노린다.** 제어 중 기술을 연타하기보다 끝난 뒤 레넥톤의 복귀 지점을 겨냥한다. 두 번의 돌진이 모두 빠졌다면 다음 웨이브 전까지 이동 수단이 부족하다.

## 궁극기를 켜면 강화 기술 횟수를 다시 센다

**`강신(R)`은 추가 체력뿐 아니라 즉시·지속적으로 분노를 준다.** 체력 막대만 보고 처치 직전이라고 판단하지 않는다. 궁극기가 켜진 동안 주변 피해에서 빠지고, 새로 준비되는 강화 기술까지 흘린 뒤 다시 싸운다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-renekton' AND kind = 'matchup' AND champion_slug = 'renekton'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-renekton');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-matchup-renekton-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-renekton' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 분노 50 전후로 거리를 바꾼다 · 첫 `E`가 미니언을 맞힐 선을 피한다 · 두 번째 돌진 뒤에 반격한다

## 분노가 차기 전과 후를 다른 챔피언처럼 본다

**레넥톤은 분노 50 이상에서 다음 기본 기술 하나를 강화한다.**[* [D3 탑 레넥톤 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132728&vtype=pc)] 분노가 낮을 때는 막타를 두고 짧게 압박하되, 50에 가까우면 강화 `W`나 `Q`의 범위 밖으로 물러난다. 강화 기술이 미니언 정리에 소비된 직후가 되받아칠 구간이다.

## 내 미니언이 첫 돌진의 발판이 되지 않게 선다

**`자르기(E)`가 유닛을 맞히면 레넥톤은 `토막내기(E)`를 한 번 더 쓸 수 있다.**[* [레넥톤 500판 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138688)] 낮은 체력 미니언 바로 뒤에 서면 첫 돌진으로 웨이브를 통과한 뒤 두 번째로 쉽게 닿는다. 미니언 선 옆으로 벌어져 첫 `E`가 챔피언과 웨이브를 함께 긁지 못하게 한다.

## 기절 중에는 반격 버튼을 서두르지 않는다

**`무자비한 포식자(W)`에 묶인 동안 레넥톤은 `Q`를 넣고 두 번째 `E`로 빠지는 짧은 교환을 노린다.** 제어 중 기술을 연타하기보다 끝난 뒤 레넥톤의 복귀 지점을 겨냥한다. 두 번의 돌진이 모두 빠졌다면 다음 웨이브 전까지 이동 수단이 부족하다.

## 궁극기를 켜면 강화 기술 횟수를 다시 센다

**`강신(R)`은 추가 체력뿐 아니라 즉시·지속적으로 분노를 준다.** 체력 막대만 보고 처치 직전이라고 판단하지 않는다. 궁극기가 켜진 동안 주변 피해에서 빠지고, 새로 준비되는 강화 기술까지 흘린 뒤 다시 싸운다.'
AND updated_at = '2026-09-14T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-matchup-renekton-20260914');

-- 세트 챔피언 위키 (1011자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-champion-sett-20260914', 'article', '세트', '세트', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 양쪽에 적을 둬 `E` 기절을 만든다 · 투지가 찼을 때 `W` 중심선을 고정한다 · 궁극기의 착지 방향을 먼저 고른다

[[분류:탑]] [[분류:딜탱]]

## 오른손까지 맞힌 뒤 `Q`로 다시 잇는다

**세트의 기본 공격은 왼손과 빠른 오른손이 한 묶음이다.** 두 번째 주먹까지 닿는 거리에서 `주먹다짐(Q)`으로 공격 흐름을 다시 시작하면 짧은 시간에 네 번의 타격을 연결할 수 있다.[* [세트 사용법 강의](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147651&vtype=pc)] 상대가 첫 주먹 뒤 바로 빠질 수 있다면 `Q`를 먼저 켜 이동 속도로 거리를 좁힌다.

## `E` 기절은 미니언 배치가 만든다

**`안면 강타(E)`는 양쪽에서 적을 끌어야 기절하고, 한쪽에만 있으면 둔화에 그친다.** 상대 챔피언 반대편에 적 미니언을 두고 서면 확정성이 높아진다. 웨이브를 모두 정리한 뒤에는 같은 버튼이 약해지므로, 막타를 치기 전에 교환 위치부터 잡는다.

## 투지가 많아도 중심선이 아니면 기다린다

**`강펀치(W)`는 저장한 투지가 클수록 보호막과 중심선 피해가 커진다.**[* [세트의 모든 것을 담은 사용법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147651&vtype=pc)] 체력이 낮아졌다는 이유만으로 즉시 쓰면 상대가 옆으로 빠진다. `E` 기절이나 둔화로 중심선을 고정할 수 있을 때 연결하고, 그 각이 없다면 보호막으로 다음 피해를 넘기는 데 집중한다.

## 궁극기는 잡을 대상보다 떨어질 곳을 본다

**`대미 장식(R)`은 붙잡은 적 뒤편으로 이동해 함께 착지한다.** 상대 앞라인을 아군 쪽으로 넘길지, 그 몸을 이용해 뒤쪽 여러 명에게 충돌 피해를 줄지 먼저 정한다. 착지 뒤 혼자 고립되는 방향이라면 잡을 수 있다는 이유만으로 사용하지 않는다.', 1, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-sett-20260914' OR (kind = 'article' AND title_key = '세트'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-champion-sett-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-champion-sett-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 양쪽에 적을 둬 `E` 기절을 만든다 · 투지가 찼을 때 `W` 중심선을 고정한다 · 궁극기의 착지 방향을 먼저 고른다

[[분류:탑]] [[분류:딜탱]]

## 오른손까지 맞힌 뒤 `Q`로 다시 잇는다

**세트의 기본 공격은 왼손과 빠른 오른손이 한 묶음이다.** 두 번째 주먹까지 닿는 거리에서 `주먹다짐(Q)`으로 공격 흐름을 다시 시작하면 짧은 시간에 네 번의 타격을 연결할 수 있다.[* [세트 사용법 강의](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147651&vtype=pc)] 상대가 첫 주먹 뒤 바로 빠질 수 있다면 `Q`를 먼저 켜 이동 속도로 거리를 좁힌다.

## `E` 기절은 미니언 배치가 만든다

**`안면 강타(E)`는 양쪽에서 적을 끌어야 기절하고, 한쪽에만 있으면 둔화에 그친다.** 상대 챔피언 반대편에 적 미니언을 두고 서면 확정성이 높아진다. 웨이브를 모두 정리한 뒤에는 같은 버튼이 약해지므로, 막타를 치기 전에 교환 위치부터 잡는다.

## 투지가 많아도 중심선이 아니면 기다린다

**`강펀치(W)`는 저장한 투지가 클수록 보호막과 중심선 피해가 커진다.**[* [세트의 모든 것을 담은 사용법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147651&vtype=pc)] 체력이 낮아졌다는 이유만으로 즉시 쓰면 상대가 옆으로 빠진다. `E` 기절이나 둔화로 중심선을 고정할 수 있을 때 연결하고, 그 각이 없다면 보호막으로 다음 피해를 넘기는 데 집중한다.

## 궁극기는 잡을 대상보다 떨어질 곳을 본다

**`대미 장식(R)`은 붙잡은 적 뒤편으로 이동해 함께 착지한다.** 상대 앞라인을 아군 쪽으로 넘길지, 그 몸을 이용해 뒤쪽 여러 명에게 충돌 피해를 줄지 먼저 정한다. 착지 뒤 혼자 고립되는 방향이라면 잡을 수 있다는 이유만으로 사용하지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-sett-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-sett-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-sett-20260914';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-sett-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-sett-20260914';

-- sett 상대법 (953자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-sett', 'matchup', NULL, NULL, 'published', 'sett', '', 0, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 미니언과 세트 사이에 끼지 않는다 · 투지가 찼을 때 옆으로 빠진다 · 궁극기의 착지 방향을 비운다

## 양쪽에 대상이 생기는 자리를 피한다

**세트의 `안면 강타(E)`는 양쪽에서 적을 끌면 기절하고 한쪽만 끌면 둔화한다.**[* [세트 사용법 강의](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147651&vtype=pc)] 세트 반대편에 내 미니언이 있는 선에 서지 않는다. 옆으로 비켜 한쪽 끌어당김만 허용하면 `강펀치(W)` 중심선을 피할 시간도 늘어난다.

## 오른손과 `Q` 두 타를 모두 맞서 치지 않는다

**세트는 왼손 다음 오른손을 빠르게 내고 `주먹다짐(Q)`으로 두 공격을 다시 강화한다.** 첫 타만 보고 교환이 끝났다고 생각하면 네 번의 연속 공격을 허용한다. 두 번째 주먹 전에 거리를 벌리거나 짧은 제어로 흐름을 끊고, `Q`가 미니언에 소비된 뒤 막타를 압박한다.

## 투지가 많을수록 뒤가 아니라 옆으로 움직인다

**세트가 받은 피해로 투지를 많이 모으면 `강펀치(W)`의 보호막과 중심선 고정 피해가 커진다.**[* [세트의 모든 것을 담은 사용법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147651&vtype=pc)] 체력이 낮다고 정면으로 마무리하려 들지 않는다. 주먹의 예고 방향에서 옆으로 벗어나고, 보호막이 줄어든 뒤 남은 피해를 넣는다.

## 앞라인 뒤에 한 줄로 서지 않는다

**`대미 장식(R)`은 잡은 대상을 뒤쪽으로 내리꽂아 착지 주변을 함께 위협한다.** 단단한 아군 바로 뒤에 모이면 세트가 그 몸을 이용해 진형 안으로 들어온다. 앞라인과 비스듬히 벌어져 착지 중심을 비우고, 세트가 들어온 뒤 빠질 수단이 적다는 점을 이용한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-sett' AND kind = 'matchup' AND champion_slug = 'sett'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-sett');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-matchup-sett-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-sett' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 미니언과 세트 사이에 끼지 않는다 · 투지가 찼을 때 옆으로 빠진다 · 궁극기의 착지 방향을 비운다

## 양쪽에 대상이 생기는 자리를 피한다

**세트의 `안면 강타(E)`는 양쪽에서 적을 끌면 기절하고 한쪽만 끌면 둔화한다.**[* [세트 사용법 강의](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147651&vtype=pc)] 세트 반대편에 내 미니언이 있는 선에 서지 않는다. 옆으로 비켜 한쪽 끌어당김만 허용하면 `강펀치(W)` 중심선을 피할 시간도 늘어난다.

## 오른손과 `Q` 두 타를 모두 맞서 치지 않는다

**세트는 왼손 다음 오른손을 빠르게 내고 `주먹다짐(Q)`으로 두 공격을 다시 강화한다.** 첫 타만 보고 교환이 끝났다고 생각하면 네 번의 연속 공격을 허용한다. 두 번째 주먹 전에 거리를 벌리거나 짧은 제어로 흐름을 끊고, `Q`가 미니언에 소비된 뒤 막타를 압박한다.

## 투지가 많을수록 뒤가 아니라 옆으로 움직인다

**세트가 받은 피해로 투지를 많이 모으면 `강펀치(W)`의 보호막과 중심선 고정 피해가 커진다.**[* [세트의 모든 것을 담은 사용법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147651&vtype=pc)] 체력이 낮다고 정면으로 마무리하려 들지 않는다. 주먹의 예고 방향에서 옆으로 벗어나고, 보호막이 줄어든 뒤 남은 피해를 넣는다.

## 앞라인 뒤에 한 줄로 서지 않는다

**`대미 장식(R)`은 잡은 대상을 뒤쪽으로 내리꽂아 착지 주변을 함께 위협한다.** 단단한 아군 바로 뒤에 모이면 세트가 그 몸을 이용해 진형 안으로 들어온다. 앞라인과 비스듬히 벌어져 착지 중심을 비우고, 세트가 들어온 뒤 빠질 수단이 적다는 점을 이용한다.'
AND updated_at = '2026-09-14T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-matchup-sett-20260914');

-- 리븐 챔피언 위키 (1043자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-champion-riven-20260914', 'article', '리븐', '리븐', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 사이마다 기본 공격을 둔다 · 세 번째 `Q`의 밀치기를 따로 계산한다 · `E`를 쓰고 난 뒤의 퇴로를 남긴다

[[분류:탑]] [[분류:딜탱]]

## 세 번의 `Q`를 한꺼번에 소비하지 않는다

**`부러진 날개(Q)`는 돌진과 공격을 세 번 나눠 쓰며 마지막 타격이 적을 밀쳐 낸다.** 첫 `Q`로 거리를 좁힌 뒤 기본 공격, 다음 `Q` 뒤 다시 기본 공격을 섞어야 기술 사이의 시간을 피해로 바꿀 수 있다.[* [탑 리븐 라인전 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115049&vtype=pc)] 상대가 빠졌다면 세 번째 `Q`는 쫓기보다 안전하게 나오는 데 쓴다.

## 기절과 밀치기의 순서를 고른다

**`기 폭발(W)`은 아주 가까운 적을 즉시 묶고, 세 번째 `Q`는 착지 지점에서 적을 밀친다.** 두 제어를 겹쳐 낭비하지 않고 상대의 이동기를 한 번 본 뒤 두 번째를 잇는다. 짧은 교환에서는 `W` 동안 한 대를 더 치고 `Q`로 빠지는 식으로 상대의 반격 시간을 줄인다.

## `E` 보호막은 들어갈 때보다 나올 때 값질 수 있다

**`용맹(E)`은 짧게 이동하며 피해를 흡수한다.**[* [리븐 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140432&vtype=pc)] 먼저 접근에 쓰면 교환 뒤 돌아올 수단이 줄어든다. 상대의 핵심 공격을 막으면서 옆으로 비켜 갈지, 콤보가 끝난 뒤 미니언 뒤로 빠질지 미리 정하고 사용한다.

## 궁극기의 두 번째 사용은 체력과 거리를 함께 본다

**`추방자의 검(R)`을 켜면 공격력과 사거리가 늘고, 한 번의 `바람 가르기`를 사용할 수 있다.** 상대 체력이 낮을수록 마무리 가치가 커지지만 멀리서 성급히 던지면 피하기 쉽다. `W`나 세 번째 `Q`로 움직임을 제한한 뒤 사용하고, 첫 활성화가 남아 있는 동안 기본 공격 사거리 이점도 챙긴다.', 1, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-riven-20260914' OR (kind = 'article' AND title_key = '리븐'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-champion-riven-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-champion-riven-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 사이마다 기본 공격을 둔다 · 세 번째 `Q`의 밀치기를 따로 계산한다 · `E`를 쓰고 난 뒤의 퇴로를 남긴다

[[분류:탑]] [[분류:딜탱]]

## 세 번의 `Q`를 한꺼번에 소비하지 않는다

**`부러진 날개(Q)`는 돌진과 공격을 세 번 나눠 쓰며 마지막 타격이 적을 밀쳐 낸다.** 첫 `Q`로 거리를 좁힌 뒤 기본 공격, 다음 `Q` 뒤 다시 기본 공격을 섞어야 기술 사이의 시간을 피해로 바꿀 수 있다.[* [탑 리븐 라인전 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115049&vtype=pc)] 상대가 빠졌다면 세 번째 `Q`는 쫓기보다 안전하게 나오는 데 쓴다.

## 기절과 밀치기의 순서를 고른다

**`기 폭발(W)`은 아주 가까운 적을 즉시 묶고, 세 번째 `Q`는 착지 지점에서 적을 밀친다.** 두 제어를 겹쳐 낭비하지 않고 상대의 이동기를 한 번 본 뒤 두 번째를 잇는다. 짧은 교환에서는 `W` 동안 한 대를 더 치고 `Q`로 빠지는 식으로 상대의 반격 시간을 줄인다.

## `E` 보호막은 들어갈 때보다 나올 때 값질 수 있다

**`용맹(E)`은 짧게 이동하며 피해를 흡수한다.**[* [리븐 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140432&vtype=pc)] 먼저 접근에 쓰면 교환 뒤 돌아올 수단이 줄어든다. 상대의 핵심 공격을 막으면서 옆으로 비켜 갈지, 콤보가 끝난 뒤 미니언 뒤로 빠질지 미리 정하고 사용한다.

## 궁극기의 두 번째 사용은 체력과 거리를 함께 본다

**`추방자의 검(R)`을 켜면 공격력과 사거리가 늘고, 한 번의 `바람 가르기`를 사용할 수 있다.** 상대 체력이 낮을수록 마무리 가치가 커지지만 멀리서 성급히 던지면 피하기 쉽다. `W`나 세 번째 `Q`로 움직임을 제한한 뒤 사용하고, 첫 활성화가 남아 있는 동안 기본 공격 사거리 이점도 챙긴다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-riven-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-riven-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-riven-20260914';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-riven-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-riven-20260914';

-- riven 상대법 (983자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-riven', 'matchup', NULL, NULL, 'published', 'riven', '', 0, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 세 번째 `Q`의 밀치기를 센다 · `E` 보호막에 큰 피해를 쓰지 않는다 · 짧은 교환 뒤 추격하지 않는다

## `Q` 횟수를 소리와 동작으로 센다

**리븐의 `부러진 날개(Q)`는 세 번 사용할 수 있고 마지막 타격이 적을 밀쳐 낸다.**[* [탑 리븐 라인전 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115049&vtype=pc)] 첫 두 번을 이동에 썼다면 세 번째 착지 범위를 비우고, 마지막 타격이 끝난 뒤 막타나 짧은 반격을 노린다. 횟수를 놓쳤다면 가까이 붙어 추측하기보다 거리를 초기화한다.

## 보호막이 생긴 순간에는 큰 기술을 늦춘다

**`용맹(E)`은 짧게 이동하며 피해를 흡수한다.** 리븐이 정면으로 미끄러져 올 때 핵심 피해를 바로 던지면 보호막에 사라진다. 이동이 끝난 뒤 보호막이 줄어드는 박자에 맞추고, `E`를 접근에 쓴 교환에서는 리븐의 복귀 경로를 압박한다.

## 기절과 밀치기를 모두 맞고 따라가지 않는다

**`기 폭발(W)`와 세 번째 `Q`가 연달아 들어오면 반격할 시간이 짧다.** 제어가 끝났다고 바로 쫓으면 리븐의 다음 기술 회전이 먼저 돌아올 수 있다. 한 번의 교환을 받아낸 뒤 미니언 수와 남은 체력을 확인하고, 기술이 비는 구간에만 앞으로 간다.

## 궁극기 활성화 뒤에는 낮은 체력으로 직선 도주하지 않는다

**`추방자의 검(R)`은 공격 범위를 키우고 한 번의 원거리 마무리 공격을 연다.**[* [리븐 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140432&vtype=pc)] 체력이 낮을수록 마지막 공격이 위험하므로 같은 방향으로 길게 달리지 않는다. `W`나 세 번째 `Q`에 묶이기 전에 옆으로 벌어져 투사체 각을 바꾸고, 시야가 끊기는 지형을 이용한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-riven' AND kind = 'matchup' AND champion_slug = 'riven'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-riven');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-matchup-riven-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-riven' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 세 번째 `Q`의 밀치기를 센다 · `E` 보호막에 큰 피해를 쓰지 않는다 · 짧은 교환 뒤 추격하지 않는다

## `Q` 횟수를 소리와 동작으로 센다

**리븐의 `부러진 날개(Q)`는 세 번 사용할 수 있고 마지막 타격이 적을 밀쳐 낸다.**[* [탑 리븐 라인전 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115049&vtype=pc)] 첫 두 번을 이동에 썼다면 세 번째 착지 범위를 비우고, 마지막 타격이 끝난 뒤 막타나 짧은 반격을 노린다. 횟수를 놓쳤다면 가까이 붙어 추측하기보다 거리를 초기화한다.

## 보호막이 생긴 순간에는 큰 기술을 늦춘다

**`용맹(E)`은 짧게 이동하며 피해를 흡수한다.** 리븐이 정면으로 미끄러져 올 때 핵심 피해를 바로 던지면 보호막에 사라진다. 이동이 끝난 뒤 보호막이 줄어드는 박자에 맞추고, `E`를 접근에 쓴 교환에서는 리븐의 복귀 경로를 압박한다.

## 기절과 밀치기를 모두 맞고 따라가지 않는다

**`기 폭발(W)`와 세 번째 `Q`가 연달아 들어오면 반격할 시간이 짧다.** 제어가 끝났다고 바로 쫓으면 리븐의 다음 기술 회전이 먼저 돌아올 수 있다. 한 번의 교환을 받아낸 뒤 미니언 수와 남은 체력을 확인하고, 기술이 비는 구간에만 앞으로 간다.

## 궁극기 활성화 뒤에는 낮은 체력으로 직선 도주하지 않는다

**`추방자의 검(R)`은 공격 범위를 키우고 한 번의 원거리 마무리 공격을 연다.**[* [리븐 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140432&vtype=pc)] 체력이 낮을수록 마지막 공격이 위험하므로 같은 방향으로 길게 달리지 않는다. `W`나 세 번째 `Q`에 묶이기 전에 옆으로 벌어져 투사체 각을 바꾸고, 시야가 끊기는 지형을 이용한다.'
AND updated_at = '2026-09-14T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-matchup-riven-20260914');

-- 이렐리아 챔피언 위키: 인라인 출처 이관까지 끝난 시스템 원고만 보강
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — 낮은 체력 미니언으로 왕복 경로를 만든다 · 패시브 중첩이 낮으면 싸우지 않는다 · `W`로 큰 물리 피해를 받아낸다

[[분류:탑]] [[분류:딜탱]]

## 낮은 체력 미니언을 진입과 복귀로 나눈다

**`칼날 쇄도(Q)`로 처치할 수 있는 미니언은 이렐리아의 이동 경로다.**[* [이렐리아 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145057)] 상대 가까이 있는 미니언만 준비하면 들어간 뒤 나올 길이 없다. 아군 쪽에 돌아올 미니언 하나를 남기고, `Q` 한 번에 죽을 체력인지 확인한 뒤 교환을 연다.

## 패시브 중첩이 준비된 웨이브에서 싸운다

**기술을 맞힐 때 쌓이는 중첩은 최대일 때 기본 공격의 위력을 크게 높인다.**[* [이렐리아 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=22)] 중첩이 낮은 채 챔피언에게 `Q`부터 쓰면 초기화도 받지 못하고 긴 탑 라인 가운데에 남는다. 미니언을 정리하며 중첩을 만들고 표식이 생겼을 때만 챔피언을 경로에 넣는다.

## `E`는 두 칼날 사이의 선으로 맞힌다

**`쌍검협무(E)`는 두 칼날이 서로를 향해 날아가는 선 위의 적을 기절시키고 표식을 남긴다.** 첫 칼날을 상대가 보는 정면에 두면 두 번째 위치를 읽기 쉽다. 내 발밑이나 이동 경로 뒤에 첫 칼날을 숨기고, 상대가 막타 동작에 들어갈 때 선을 완성한다.

## `W`가 줄이지 못하는 피해까지 버티지 않는다

**`저항의 춤(W)`은 충전 중 물리 피해를 줄이지만 제자리에서 시간을 쓴다.** 상대의 강한 물리 공격이 예고됐을 때 받아내고, 끝나는 방향으로 피해를 돌려준다. 장판이나 마법 피해까지 모두 견디는 기술로 생각하지 말고, 위험이 겹치면 충전을 짧게 끝내 위치부터 바꾼다.', revision = 3, patch = '16.17.1', updated_at = '2026-09-14T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-irelia-20260912' AND kind = 'article' AND revision = 2 AND updated_by = 'user-system'
AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-irelia-20260912') = 2
AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-irelia-20260912' AND doc_id = 'doc-ai-champion-irelia-20260912' AND status = 'accepted')
AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-irelia-20260913' AND doc_id = 'doc-ai-champion-irelia-20260912' AND status = 'accepted' AND revision = 2)
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-irelia-20260914');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-champion-irelia-20260914', id, NULL, 2, general, '탑 딜탱 챔피언 위키 보강', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 3 FROM wiki_docs
WHERE id = 'doc-ai-champion-irelia-20260912' AND revision = 3 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 낮은 체력 미니언으로 왕복 경로를 만든다 · 패시브 중첩이 낮으면 싸우지 않는다 · `W`로 큰 물리 피해를 받아낸다

[[분류:탑]] [[분류:딜탱]]

## 낮은 체력 미니언을 진입과 복귀로 나눈다

**`칼날 쇄도(Q)`로 처치할 수 있는 미니언은 이렐리아의 이동 경로다.**[* [이렐리아 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145057)] 상대 가까이 있는 미니언만 준비하면 들어간 뒤 나올 길이 없다. 아군 쪽에 돌아올 미니언 하나를 남기고, `Q` 한 번에 죽을 체력인지 확인한 뒤 교환을 연다.

## 패시브 중첩이 준비된 웨이브에서 싸운다

**기술을 맞힐 때 쌓이는 중첩은 최대일 때 기본 공격의 위력을 크게 높인다.**[* [이렐리아 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=22)] 중첩이 낮은 채 챔피언에게 `Q`부터 쓰면 초기화도 받지 못하고 긴 탑 라인 가운데에 남는다. 미니언을 정리하며 중첩을 만들고 표식이 생겼을 때만 챔피언을 경로에 넣는다.

## `E`는 두 칼날 사이의 선으로 맞힌다

**`쌍검협무(E)`는 두 칼날이 서로를 향해 날아가는 선 위의 적을 기절시키고 표식을 남긴다.** 첫 칼날을 상대가 보는 정면에 두면 두 번째 위치를 읽기 쉽다. 내 발밑이나 이동 경로 뒤에 첫 칼날을 숨기고, 상대가 막타 동작에 들어갈 때 선을 완성한다.

## `W`가 줄이지 못하는 피해까지 버티지 않는다

**`저항의 춤(W)`은 충전 중 물리 피해를 줄이지만 제자리에서 시간을 쓴다.** 상대의 강한 물리 공격이 예고됐을 때 받아내고, 끝나는 방향으로 피해를 돌려준다. 장판이나 마법 피해까지 모두 견디는 기술로 생각하지 말고, 위험이 겹치면 충전을 짧게 끝내 위치부터 바꾼다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-irelia-20260914');
DELETE FROM wiki_links WHERE source_doc = 'doc-ai-champion-irelia-20260912' AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-irelia-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-irelia-20260912', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-irelia-20260912' AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-irelia-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-irelia-20260912', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-ai-champion-irelia-20260912' AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-irelia-20260914');

-- 이렐리아 상대법: 인라인 출처 이관까지 끝난 시스템 원고만 보강
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 낮은 체력 미니언을 이동기로 본다 · 패시브 최대 중첩에서 물러난다 · `E` 두 칼날의 선을 가로지르지 않는다

## 내 미니언 체력이 곧 이렐리아의 사거리다

**이렐리아는 `칼날 쇄도(Q)`로 미니언을 처치하면 즉시 다시 이동할 수 있다.**[* [이렐리아 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145057)] 낮은 체력 미니언 바로 뒤에 서지 않고, 연속으로 처치할 수 있는 미니언이 몇 개인지 먼저 센다. 경로가 완성되기 전에 웨이브를 정리하거나 옆으로 벌어져 첫 도착 지점에서 벗어난다.

## 패시브가 빛나는 동안 막타 하나를 양보한다

**기술 적중으로 쌓인 중첩이 최대가 되면 이렐리아의 기본 공격이 크게 강해진다.**[* [이렐리아 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=22)] 중첩이 가득한 상태에서 짧게 한 대만 교환하려 해도 `Q` 추격으로 길어진다. 중첩이 떨어질 때까지 거리를 두고, 웨이브가 새로 만나 준비가 다시 필요할 때 압박한다.

## 첫 칼날이 보이면 두 번째 위치의 옆으로 간다

**`쌍검협무(E)`는 두 칼날을 잇는 선을 따라 기절과 표식을 남긴다.** 첫 칼날에서 무조건 멀어지는 대신 이렐리아가 두 번째 칼날을 둘 만한 반대편을 예상한다. 선과 직각으로 움직이고, 빗나간 뒤에는 표식 없는 `Q`가 초기화되지 않는 점을 이용한다.

## `W` 충전 중에는 물리 피해를 몰아넣지 않는다

**`저항의 춤(W)`은 충전하는 동안 물리 피해를 줄인다.** 큰 공격을 아끼고 끝나는 방향을 옆으로 피한 뒤 되받아친다. 다만 이렐리아가 충전으로 미니언 체력을 한꺼번에 낮춰 새 `Q` 경로를 만들 수 있으므로 웨이브 뒤에 그대로 머물지 않는다.', revision = 3, patch = '16.17.1', updated_at = '2026-09-14T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-irelia' AND kind = 'matchup' AND revision = 2 AND updated_by = 'user-system'
AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-irelia') = 2
AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-mid-matchup-irelia-20260912' AND doc_id = 'doc-c-irelia' AND status = 'accepted')
AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-irelia-20260913' AND doc_id = 'doc-c-irelia' AND status = 'accepted' AND revision = 2)
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-matchup-irelia-20260914');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-matchup-irelia-20260914', id, NULL, 2, general, '탑 딜탱 상대법 보강', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 3 FROM wiki_docs
WHERE id = 'doc-c-irelia' AND revision = 3 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 낮은 체력 미니언을 이동기로 본다 · 패시브 최대 중첩에서 물러난다 · `E` 두 칼날의 선을 가로지르지 않는다

## 내 미니언 체력이 곧 이렐리아의 사거리다

**이렐리아는 `칼날 쇄도(Q)`로 미니언을 처치하면 즉시 다시 이동할 수 있다.**[* [이렐리아 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145057)] 낮은 체력 미니언 바로 뒤에 서지 않고, 연속으로 처치할 수 있는 미니언이 몇 개인지 먼저 센다. 경로가 완성되기 전에 웨이브를 정리하거나 옆으로 벌어져 첫 도착 지점에서 벗어난다.

## 패시브가 빛나는 동안 막타 하나를 양보한다

**기술 적중으로 쌓인 중첩이 최대가 되면 이렐리아의 기본 공격이 크게 강해진다.**[* [이렐리아 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=22)] 중첩이 가득한 상태에서 짧게 한 대만 교환하려 해도 `Q` 추격으로 길어진다. 중첩이 떨어질 때까지 거리를 두고, 웨이브가 새로 만나 준비가 다시 필요할 때 압박한다.

## 첫 칼날이 보이면 두 번째 위치의 옆으로 간다

**`쌍검협무(E)`는 두 칼날을 잇는 선을 따라 기절과 표식을 남긴다.** 첫 칼날에서 무조건 멀어지는 대신 이렐리아가 두 번째 칼날을 둘 만한 반대편을 예상한다. 선과 직각으로 움직이고, 빗나간 뒤에는 표식 없는 `Q`가 초기화되지 않는 점을 이용한다.

## `W` 충전 중에는 물리 피해를 몰아넣지 않는다

**`저항의 춤(W)`은 충전하는 동안 물리 피해를 줄인다.** 큰 공격을 아끼고 끝나는 방향을 옆으로 피한 뒤 되받아친다. 다만 이렐리아가 충전으로 미니언 체력을 한꺼번에 낮춰 새 `Q` 경로를 만들 수 있으므로 웨이브 뒤에 그대로 머물지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-matchup-irelia-20260914');

-- 피오라 챔피언 위키 (1042자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-champion-fiora-20260914', 'article', '피오라', '피오라', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 급소가 안전한 방향일 때만 찌른다 · `W`는 상대의 제어에 맞춘다 · 궁극기는 다음 급소로 갈 동선을 먼저 본다

[[분류:탑]] [[분류:딜탱]]

## 급소 하나보다 찌른 뒤의 위치가 중요하다

**`찌르기(Q)`는 짧게 돌진해 가까운 대상과 급소를 우선 공격한다.**[* [피오라 3분 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=119841&vtype=pc)] 상대 뒤쪽 급소를 치려고 포탑 쪽으로 깊게 들어가면 재사용 대기시간이 줄어도 돌아올 길이 위험하다. 내 쪽이나 옆쪽 급소를 기다리고, 찌른 뒤 수풀이나 미니언 뒤로 빠질 각을 남긴다.

## `W`는 가장 큰 제어 하나에 맞춘다

**`응수(W)`는 짧은 시간 모든 피해와 이동 불가 효과를 막고, 제어를 막으면 상대를 기절시킨다.** 상대가 여러 기술을 연달아 쓸 수 있다면 첫 견제에 반사적으로 누르지 않는다. 확실한 기절이나 폭발 피해가 시작되는 동작을 정해 두고, 응수 방향도 상대가 옆으로 피할 곳에 맞춘다.

## 기본 공격의 리듬으로 급소 사이를 이동한다

**`대가의 검술(E)` 첫 공격은 둔화하고 두 번째는 더 강하게 적중한다.** `Q`로 급소를 친 뒤 첫 공격으로 상대의 이동을 늦추고 다음 급소 쪽으로 걸어간다. 모든 버튼을 같은 자리에서 소비하기보다 둔화 시간에 몸을 옮겨야 긴 교환이 이어진다.

## 궁극기는 네 방향을 도는 순서를 정하고 건다

**`대결투(R)`은 네 급소를 모두 치거나 급소를 친 대상이 쓰러지면 회복 지대를 만든다.**[* [시즌10 피오라 상대법 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146186&vtype=pc)] 벽에 붙은 대상을 골라 마지막 급소가 막히지 않는지 보고, 가까운 급소부터 시계 방향이나 반대 방향으로 이어 갈 순서를 정한다. 한 급소를 치고 상대의 제어가 남았다면 속도보다 `W` 타이밍을 우선한다.', 1, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-fiora-20260914' OR (kind = 'article' AND title_key = '피오라'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-champion-fiora-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-champion-fiora-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 급소가 안전한 방향일 때만 찌른다 · `W`는 상대의 제어에 맞춘다 · 궁극기는 다음 급소로 갈 동선을 먼저 본다

[[분류:탑]] [[분류:딜탱]]

## 급소 하나보다 찌른 뒤의 위치가 중요하다

**`찌르기(Q)`는 짧게 돌진해 가까운 대상과 급소를 우선 공격한다.**[* [피오라 3분 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=119841&vtype=pc)] 상대 뒤쪽 급소를 치려고 포탑 쪽으로 깊게 들어가면 재사용 대기시간이 줄어도 돌아올 길이 위험하다. 내 쪽이나 옆쪽 급소를 기다리고, 찌른 뒤 수풀이나 미니언 뒤로 빠질 각을 남긴다.

## `W`는 가장 큰 제어 하나에 맞춘다

**`응수(W)`는 짧은 시간 모든 피해와 이동 불가 효과를 막고, 제어를 막으면 상대를 기절시킨다.** 상대가 여러 기술을 연달아 쓸 수 있다면 첫 견제에 반사적으로 누르지 않는다. 확실한 기절이나 폭발 피해가 시작되는 동작을 정해 두고, 응수 방향도 상대가 옆으로 피할 곳에 맞춘다.

## 기본 공격의 리듬으로 급소 사이를 이동한다

**`대가의 검술(E)` 첫 공격은 둔화하고 두 번째는 더 강하게 적중한다.** `Q`로 급소를 친 뒤 첫 공격으로 상대의 이동을 늦추고 다음 급소 쪽으로 걸어간다. 모든 버튼을 같은 자리에서 소비하기보다 둔화 시간에 몸을 옮겨야 긴 교환이 이어진다.

## 궁극기는 네 방향을 도는 순서를 정하고 건다

**`대결투(R)`은 네 급소를 모두 치거나 급소를 친 대상이 쓰러지면 회복 지대를 만든다.**[* [시즌10 피오라 상대법 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146186&vtype=pc)] 벽에 붙은 대상을 골라 마지막 급소가 막히지 않는지 보고, 가까운 급소부터 시계 방향이나 반대 방향으로 이어 갈 순서를 정한다. 한 급소를 치고 상대의 제어가 남았다면 속도보다 `W` 타이밍을 우선한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-fiora-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-fiora-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-fiora-20260914';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-fiora-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-fiora-20260914';

-- fiora 상대법 (993자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-fiora', 'matchup', NULL, NULL, 'published', 'fiora', '', 0, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 불리한 급소는 화면 밖으로 재배치한다 · 제어를 `W`에 먼저 내주지 않는다 · 궁극기 마지막 급소를 벽으로 막는다

## 치기 쉬운 급소를 공짜로 내주지 않는다

**피오라는 드러난 급소를 치면 추가 피해와 이동 이득을 얻는다.** 내 앞쪽처럼 피오라가 쉽게 찌를 수 있는 방향에 급소가 생겼다면 안전하게 멀어져 표식을 새로 만든다. 막타 하나 때문에 급소와 `찌르기(Q)`를 함께 허용하지 않는다.[* [시즌10 피오라 상대법 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146186&vtype=pc)]

## 가장 읽기 쉬운 제어부터 쓰지 않는다

**`응수(W)`는 피해와 이동 불가 효과를 막고, 제어를 막으면 되돌려 기절시킨다.**[* [피오라 3분 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=119841&vtype=pc)] 큰 제어의 준비 동작을 매번 같은 박자로 쓰지 않는다. 약한 공격이나 움직임으로 `W`를 유도하고, 빗나간 뒤 긴 재사용 대기시간 동안 핵심 기술을 사용한다.

## `Q`가 빗나간 순간에 거리를 돌려받는다

**`찌르기(Q)`가 대상을 맞히면 다시 쓸 시간이 줄지만 허공에 끝나면 공백이 길어진다.** 급소 끝 거리에서 앞뒤로 움직여 사용을 유도하고, 빗나가면 피오라가 다음 급소에 닿기 전에 짧게 반격한다. 추격하다 새 급소 방향을 내주면 얻은 시간을 다시 잃는다.

## 궁극기가 걸리면 마지막 방향을 지형에 붙인다

**`대결투(R)`은 네 급소를 모두 치면 넓은 회복 지대를 만든다.** 벽이나 포탑 가장자리에 몸을 붙여 한 방향을 피오라가 밟지 못하게 막고, 나머지 세 방향을 모두 지키려 빙글빙글 돌기보다 아군 쪽으로 빠진다. 한 급소라도 친 뒤 쓰러지면 회복이 열릴 수 있으므로 낮은 체력에서는 더 일찍 이탈한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-fiora' AND kind = 'matchup' AND champion_slug = 'fiora'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-fiora');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-matchup-fiora-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-fiora' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 불리한 급소는 화면 밖으로 재배치한다 · 제어를 `W`에 먼저 내주지 않는다 · 궁극기 마지막 급소를 벽으로 막는다

## 치기 쉬운 급소를 공짜로 내주지 않는다

**피오라는 드러난 급소를 치면 추가 피해와 이동 이득을 얻는다.** 내 앞쪽처럼 피오라가 쉽게 찌를 수 있는 방향에 급소가 생겼다면 안전하게 멀어져 표식을 새로 만든다. 막타 하나 때문에 급소와 `찌르기(Q)`를 함께 허용하지 않는다.[* [시즌10 피오라 상대법 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146186&vtype=pc)]

## 가장 읽기 쉬운 제어부터 쓰지 않는다

**`응수(W)`는 피해와 이동 불가 효과를 막고, 제어를 막으면 되돌려 기절시킨다.**[* [피오라 3분 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=119841&vtype=pc)] 큰 제어의 준비 동작을 매번 같은 박자로 쓰지 않는다. 약한 공격이나 움직임으로 `W`를 유도하고, 빗나간 뒤 긴 재사용 대기시간 동안 핵심 기술을 사용한다.

## `Q`가 빗나간 순간에 거리를 돌려받는다

**`찌르기(Q)`가 대상을 맞히면 다시 쓸 시간이 줄지만 허공에 끝나면 공백이 길어진다.** 급소 끝 거리에서 앞뒤로 움직여 사용을 유도하고, 빗나가면 피오라가 다음 급소에 닿기 전에 짧게 반격한다. 추격하다 새 급소 방향을 내주면 얻은 시간을 다시 잃는다.

## 궁극기가 걸리면 마지막 방향을 지형에 붙인다

**`대결투(R)`은 네 급소를 모두 치면 넓은 회복 지대를 만든다.** 벽이나 포탑 가장자리에 몸을 붙여 한 방향을 피오라가 밟지 못하게 막고, 나머지 세 방향을 모두 지키려 빙글빙글 돌기보다 아군 쪽으로 빠진다. 한 급소라도 친 뒤 쓰러지면 회복이 열릴 수 있으므로 낮은 체력에서는 더 일찍 이탈한다.'
AND updated_at = '2026-09-14T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-matchup-fiora-20260914');

-- 잭스 챔피언 위키 (1016자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-champion-jax-20260914', 'article', '잭스', '잭스', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `E` 동안 기본 공격을 받아낸다 · `Q`는 적뿐 아니라 퇴로에도 쓴다 · 세 번째 공격 준비를 숨긴다

[[분류:탑]] [[분류:딜탱]]

## 세 번째 공격을 미니언에 미리 준비한다

**`무기의 달인(R)` 기본 지속 효과는 세 번째 연속 공격에 추가 피해를 준다.** 교환 전에 미니언을 두 번 때려 다음 공격을 준비하면 짧은 진입의 첫 타격이 강해진다. 다만 웨이브를 계속 치면 라인이 밀리므로 상대가 막타를 치러 들어오는 순간에만 준비한다.

## `E`는 공격을 피한 뒤 기절까지 맞혀야 완성된다

**`반격(E)`은 짧은 시간 기본 공격을 회피하고, 끝날 때 주변 적을 기절시킨다.**[* [잭스 챔피언별 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143406)] 상대가 기본 공격을 시작한 뒤 켜서 피해를 흘리고, 너무 멀리 달아나기 전에 다시 눌러 기절을 확정한다. 기술 피해만 쓰는 상대에게는 회피보다 기절 거리 확보가 목적이다.

## `Q`는 마지막까지 남길 수 있는 이동기다

**`도약 공격(Q)`은 적 챔피언뿐 아니라 유닛을 향해 이동할 수 있다.** 먼저 걸어서 `W` 강화 공격을 넣고 상대가 빠질 때 따라가거나, 교환이 끝난 뒤 아군 미니언으로 빠지는 편이 안전하다. 처음부터 도약하면 상대의 이동기를 쫓을 수 없고 정글 개입에도 취약해진다.

## 궁극기의 방어력은 여러 명이 닿을 때 키운다

**`R`을 사용하면 주변에 피해를 주고 잠시 방어력과 마법 저항력을 얻는다.**[* [잭스 공략과 스킬 설명](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143406)] 혼자 있는 약한 대상을 잡는 데 성급히 쓰기보다 둘 이상에게 둘러싸이거나 큰 피해가 들어오기 직전에 사용한다. 방어 시간이 끝나기 전에 목적 대상을 정하고 계속 공격해 기본 지속 효과의 흐름을 잇는다.', 1, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-jax-20260914' OR (kind = 'article' AND title_key = '잭스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-champion-jax-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-champion-jax-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `E` 동안 기본 공격을 받아낸다 · `Q`는 적뿐 아니라 퇴로에도 쓴다 · 세 번째 공격 준비를 숨긴다

[[분류:탑]] [[분류:딜탱]]

## 세 번째 공격을 미니언에 미리 준비한다

**`무기의 달인(R)` 기본 지속 효과는 세 번째 연속 공격에 추가 피해를 준다.** 교환 전에 미니언을 두 번 때려 다음 공격을 준비하면 짧은 진입의 첫 타격이 강해진다. 다만 웨이브를 계속 치면 라인이 밀리므로 상대가 막타를 치러 들어오는 순간에만 준비한다.

## `E`는 공격을 피한 뒤 기절까지 맞혀야 완성된다

**`반격(E)`은 짧은 시간 기본 공격을 회피하고, 끝날 때 주변 적을 기절시킨다.**[* [잭스 챔피언별 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143406)] 상대가 기본 공격을 시작한 뒤 켜서 피해를 흘리고, 너무 멀리 달아나기 전에 다시 눌러 기절을 확정한다. 기술 피해만 쓰는 상대에게는 회피보다 기절 거리 확보가 목적이다.

## `Q`는 마지막까지 남길 수 있는 이동기다

**`도약 공격(Q)`은 적 챔피언뿐 아니라 유닛을 향해 이동할 수 있다.** 먼저 걸어서 `W` 강화 공격을 넣고 상대가 빠질 때 따라가거나, 교환이 끝난 뒤 아군 미니언으로 빠지는 편이 안전하다. 처음부터 도약하면 상대의 이동기를 쫓을 수 없고 정글 개입에도 취약해진다.

## 궁극기의 방어력은 여러 명이 닿을 때 키운다

**`R`을 사용하면 주변에 피해를 주고 잠시 방어력과 마법 저항력을 얻는다.**[* [잭스 공략과 스킬 설명](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143406)] 혼자 있는 약한 대상을 잡는 데 성급히 쓰기보다 둘 이상에게 둘러싸이거나 큰 피해가 들어오기 직전에 사용한다. 방어 시간이 끝나기 전에 목적 대상을 정하고 계속 공격해 기본 지속 효과의 흐름을 잇는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-jax-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-jax-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-jax-20260914';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-jax-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-jax-20260914';

-- jax 상대법 (906자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-jax', 'matchup', NULL, NULL, 'published', 'jax', '', 0, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 세 번째 기본 공격을 센다 · `E` 동안 기본 공격을 멈춘다 · `Q`가 빠진 뒤 거리 우위를 쓴다

## 미니언을 친 횟수까지 센다

**잭스는 연속 세 번째 공격에 추가 피해를 싣는다.** 미니언을 두 번 친 뒤 다가오면 다음 한 대가 평소보다 강하다. 준비가 보이는 동안 막타에서 떨어지고, 강화 공격이 미니언에 소비된 직후 짧은 견제를 돌려준다.

## `E`가 켜지면 기본 공격을 더하지 않는다

**`반격(E)` 동안 잭스는 기본 공격을 피하고, 끝날 때 주변을 기절시킨다.**[* [잭스 챔피언별 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143406)] 공격을 계속해 마지막 피해를 키워 주지 말고 기절 범위 밖으로 빠진다. 이동기가 있다면 너무 일찍 쓰지 않고 잭스가 재사용해 기절하려는 순간에 거리를 벌린다.

## 도약 뒤의 복귀 대상을 지운다

**`도약 공격(Q)`은 적뿐 아니라 유닛을 향해서도 이동할 수 있다.** 잭스가 아군 미니언으로 들어오면 뒤에 남은 미니언이나 다른 대상을 이용해 빠질 수 있다. 웨이브 옆으로 싸움 위치를 바꾸고, `Q`를 진입에 쓴 뒤에는 다음 도약 전까지 거리를 유지한다.

## 궁극기를 켠 동안 긴 맞대결을 피한다

**`무기의 달인(R)` 사용 효과는 주변에 피해를 주고 잠시 방어 능력을 높인다.**[* [잭스 공략과 스킬 설명](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143406)] 활성화 직후 모든 피해를 쏟지 않고 지속시간을 흘린다. 잭스가 공격을 이어 가지 못하게 짧은 제어와 거리 조절을 사용하면 세 번째 공격의 흐름도 함께 끊긴다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-jax' AND kind = 'matchup' AND champion_slug = 'jax'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-jax');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-matchup-jax-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-jax' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 세 번째 기본 공격을 센다 · `E` 동안 기본 공격을 멈춘다 · `Q`가 빠진 뒤 거리 우위를 쓴다

## 미니언을 친 횟수까지 센다

**잭스는 연속 세 번째 공격에 추가 피해를 싣는다.** 미니언을 두 번 친 뒤 다가오면 다음 한 대가 평소보다 강하다. 준비가 보이는 동안 막타에서 떨어지고, 강화 공격이 미니언에 소비된 직후 짧은 견제를 돌려준다.

## `E`가 켜지면 기본 공격을 더하지 않는다

**`반격(E)` 동안 잭스는 기본 공격을 피하고, 끝날 때 주변을 기절시킨다.**[* [잭스 챔피언별 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143406)] 공격을 계속해 마지막 피해를 키워 주지 말고 기절 범위 밖으로 빠진다. 이동기가 있다면 너무 일찍 쓰지 않고 잭스가 재사용해 기절하려는 순간에 거리를 벌린다.

## 도약 뒤의 복귀 대상을 지운다

**`도약 공격(Q)`은 적뿐 아니라 유닛을 향해서도 이동할 수 있다.** 잭스가 아군 미니언으로 들어오면 뒤에 남은 미니언이나 다른 대상을 이용해 빠질 수 있다. 웨이브 옆으로 싸움 위치를 바꾸고, `Q`를 진입에 쓴 뒤에는 다음 도약 전까지 거리를 유지한다.

## 궁극기를 켠 동안 긴 맞대결을 피한다

**`무기의 달인(R)` 사용 효과는 주변에 피해를 주고 잠시 방어 능력을 높인다.**[* [잭스 공략과 스킬 설명](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143406)] 활성화 직후 모든 피해를 쏟지 않고 지속시간을 흘린다. 잭스가 공격을 이어 가지 못하게 짧은 제어와 거리 조절을 사용하면 세 번째 공격의 흐름도 함께 끊긴다.'
AND updated_at = '2026-09-14T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-matchup-jax-20260914');

-- 카밀 챔피언 위키 (1024자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-champion-camille-20260914', 'article', '카밀', '카밀', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 첫 `Q` 뒤 강화 타이밍을 기다린다 · 벽과 상대를 한 선에 둔다 · 궁극기로 핵심 기술을 피한다

[[분류:탑]] [[분류:딜탱]]

## 첫 `Q`와 강화 `Q` 사이를 걸어서 채운다

**`정확성 프로토콜(Q)`은 첫 공격 뒤 잠시 기다려 다시 쓰면 두 번째 피해가 크게 늘어난다.**[* [딜탱 탑 카밀 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133520)] 첫 타격의 이동 속도로 상대 옆을 따라가고, 강화 표시가 오기 전에 두 번째 사용을 서두르지 않는다. 상대가 멀어질 수 있다면 미니언에 첫 `Q`를 준비해 강화 타격만 챔피언에게 전달한다.

## `W`는 바깥쪽으로 맞히고 안쪽으로 걸어간다

**`전술적 휩쓸기(W)`는 원뿔 바깥쪽의 적을 둔화하고 더 강하게 때리며 카밀을 회복시킨다.** 가까이 붙은 상대에게 바로 쓰기보다 한 걸음 물러나 바깥 선을 맞춘 뒤, 둔화 동안 다음 기본 공격 거리로 들어간다. 시전 중 움직일 수 있다는 점을 이용해 막타와 견제를 한 선에 둔다.

## 갈고리는 붙을 벽과 착지점을 함께 본다

**`갈고리 발사(E)`는 벽으로 이동한 뒤 다시 도약해 챔피언을 기절시킨다.**[* [스플릿 카밀 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=136992&vtype=pc)] 가까운 벽만 잡지 말고 두 번째 도약이 상대의 옆이나 뒤에 떨어지는지 본다. 상대의 밀치기나 이동 불가 효과가 남아 있으면 정면 진입을 늦추고, 도주에 쓸 벽도 기억한다.

## 궁극기는 가두기와 회피를 동시에 노린다

**`마법공학 최후통첩(R)`은 대상에게 도약해 일정 지역에 가두며 도약 순간 위치를 바꾼다.** 상대의 큰 기술이 날아오는 순간에 사용하면 피하면서 퇴로도 끊을 수 있다. 아군이 닿지 못하는 곳에 혼자 가두면 역으로 고립되므로, 착지 지점과 합류 시간을 먼저 확인한다.', 1, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-camille-20260914' OR (kind = 'article' AND title_key = '카밀'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-champion-camille-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-champion-camille-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 첫 `Q` 뒤 강화 타이밍을 기다린다 · 벽과 상대를 한 선에 둔다 · 궁극기로 핵심 기술을 피한다

[[분류:탑]] [[분류:딜탱]]

## 첫 `Q`와 강화 `Q` 사이를 걸어서 채운다

**`정확성 프로토콜(Q)`은 첫 공격 뒤 잠시 기다려 다시 쓰면 두 번째 피해가 크게 늘어난다.**[* [딜탱 탑 카밀 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133520)] 첫 타격의 이동 속도로 상대 옆을 따라가고, 강화 표시가 오기 전에 두 번째 사용을 서두르지 않는다. 상대가 멀어질 수 있다면 미니언에 첫 `Q`를 준비해 강화 타격만 챔피언에게 전달한다.

## `W`는 바깥쪽으로 맞히고 안쪽으로 걸어간다

**`전술적 휩쓸기(W)`는 원뿔 바깥쪽의 적을 둔화하고 더 강하게 때리며 카밀을 회복시킨다.** 가까이 붙은 상대에게 바로 쓰기보다 한 걸음 물러나 바깥 선을 맞춘 뒤, 둔화 동안 다음 기본 공격 거리로 들어간다. 시전 중 움직일 수 있다는 점을 이용해 막타와 견제를 한 선에 둔다.

## 갈고리는 붙을 벽과 착지점을 함께 본다

**`갈고리 발사(E)`는 벽으로 이동한 뒤 다시 도약해 챔피언을 기절시킨다.**[* [스플릿 카밀 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=136992&vtype=pc)] 가까운 벽만 잡지 말고 두 번째 도약이 상대의 옆이나 뒤에 떨어지는지 본다. 상대의 밀치기나 이동 불가 효과가 남아 있으면 정면 진입을 늦추고, 도주에 쓸 벽도 기억한다.

## 궁극기는 가두기와 회피를 동시에 노린다

**`마법공학 최후통첩(R)`은 대상에게 도약해 일정 지역에 가두며 도약 순간 위치를 바꾼다.** 상대의 큰 기술이 날아오는 순간에 사용하면 피하면서 퇴로도 끊을 수 있다. 아군이 닿지 못하는 곳에 혼자 가두면 역으로 고립되므로, 착지 지점과 합류 시간을 먼저 확인한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-champion-camille-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-camille-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-camille-20260914';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-champion-camille-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-champion-camille-20260914';

-- camille 상대법 (940자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-camille', 'matchup', NULL, NULL, 'published', 'camille', '', 0, '16.17.1', 'guarded', '2026-09-14T06:00:00.000Z', '2026-09-14T06:00:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 첫 `Q` 뒤 강화 타격을 기다린다 · 벽과 일직선으로 서지 않는다 · `W`는 안쪽으로 파고든다

## 첫 `Q`를 맞은 뒤 바로 되받아치지 않는다

**카밀의 `정확성 프로토콜(Q)`은 첫 공격 뒤 기다렸다 쓰는 두 번째 타격이 훨씬 강하다.**[* [딜탱 탑 카밀 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133520)] 첫 타격만 보고 긴 교환을 열면 이동 속도로 따라와 강화 공격을 맞힌다. 표시가 사라지거나 두 번째 타격이 미니언에 소비될 때까지 거리를 둔 뒤 반격한다.

## 가까운 벽과 카밀 사이의 선을 비운다

**`갈고리 발사(E)`는 벽에 붙은 뒤 챔피언 쪽으로 다시 도약해 기절시킨다.**[* [스플릿 카밀 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=136992&vtype=pc)] 벽 가까운 좁은 쪽에 서면 예고 시간이 짧아진다. 라인 중앙 쪽으로 벌어지고, 카밀이 벽에 붙는 순간 정면이 아니라 옆으로 움직여 착지 선을 피한다.

## `W` 바깥날 대신 안쪽으로 들어간다

**`전술적 휩쓸기(W)`는 원뿔 바깥쪽이 더 강하고 둔화와 회복까지 준다.** 완전히 멀어질 수 없다면 카밀 쪽 안쪽 범위로 파고들어 바깥날을 피한다. `W`가 끝난 뒤에는 카밀의 유지력과 추격 둔화가 줄어든 구간을 이용한다.

## 궁극기 앞에서는 피할 기술을 한꺼번에 쓰지 않는다

**`마법공학 최후통첩(R)`은 대상에게 도약해 가두므로 카밀이 순간적으로 위치를 바꿀 수 있다.** 큰 투사체나 지연 기술을 한 번에 쓰면 궁극기로 피할 수 있다. 먼저 짧은 기술로 사용을 유도하고, 갇힌 뒤에는 경계만 두드리기보다 카밀의 강화 `Q` 박자에 맞춰 방어한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T06:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-camille' AND kind = 'matchup' AND champion_slug = 'camille'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-camille');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-matchup-camille-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-camille' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 첫 `Q` 뒤 강화 타격을 기다린다 · 벽과 일직선으로 서지 않는다 · `W`는 안쪽으로 파고든다

## 첫 `Q`를 맞은 뒤 바로 되받아치지 않는다

**카밀의 `정확성 프로토콜(Q)`은 첫 공격 뒤 기다렸다 쓰는 두 번째 타격이 훨씬 강하다.**[* [딜탱 탑 카밀 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133520)] 첫 타격만 보고 긴 교환을 열면 이동 속도로 따라와 강화 공격을 맞힌다. 표시가 사라지거나 두 번째 타격이 미니언에 소비될 때까지 거리를 둔 뒤 반격한다.

## 가까운 벽과 카밀 사이의 선을 비운다

**`갈고리 발사(E)`는 벽에 붙은 뒤 챔피언 쪽으로 다시 도약해 기절시킨다.**[* [스플릿 카밀 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=136992&vtype=pc)] 벽 가까운 좁은 쪽에 서면 예고 시간이 짧아진다. 라인 중앙 쪽으로 벌어지고, 카밀이 벽에 붙는 순간 정면이 아니라 옆으로 움직여 착지 선을 피한다.

## `W` 바깥날 대신 안쪽으로 들어간다

**`전술적 휩쓸기(W)`는 원뿔 바깥쪽이 더 강하고 둔화와 회복까지 준다.** 완전히 멀어질 수 없다면 카밀 쪽 안쪽 범위로 파고들어 바깥날을 피한다. `W`가 끝난 뒤에는 카밀의 유지력과 추격 둔화가 줄어든 구간을 이용한다.

## 궁극기 앞에서는 피할 기술을 한꺼번에 쓰지 않는다

**`마법공학 최후통첩(R)`은 대상에게 도약해 가두므로 카밀이 순간적으로 위치를 바꿀 수 있다.** 큰 투사체나 지연 기술을 한 번에 쓰면 궁극기로 피할 수 있다. 먼저 짧은 기술로 사용을 유도하고, 갇힌 뒤에는 경계만 두드리기보다 카밀의 강화 `Q` 박자에 맞춰 방어한다.'
AND updated_at = '2026-09-14T06:00:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-matchup-camille-20260914');
