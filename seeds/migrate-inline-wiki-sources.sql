-- scripts/migrate-inline-wiki-sources.ts가 생성.
-- 운영 조사값과 같은 시스템 원고만 새 리비전으로 이관하며 조사 뒤 편집이 있으면 건너뛴다.
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q 한 번보다 두 번째 적중을 설계한다 · 무리는 공짜 피해가 아니라 라인 자원이다 · 들어갈 때는 상대의 반격부터 뺀다

## `Q` 한 번보다 두 번째 적중을 설계한다

**다르킨 단검의 첫 타는 출혈을 만들고, 두 번째 타가 같은 대상을 맞혀야 추가 피해와 회복을 얻는다.**[* [에메랄드가 쓰는 개쉬운 베이가 승리법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148095&vtype=pc)] 첫 `Q`가 빗나갔다면 두 번째까지 급하게 던져 마나를 비우지 말고 막타나 다음 압박에 쓴다. 상대가 CS를 먹으러 멈추는 순간 첫 단검을 맞히고, 퇴로를 읽어 두 번째 방향을 조정한다.

## 무리는 공짜 피해가 아니라 라인 자원이다

**무리는 스킬을 맞힌 대상을 따라가 견제를 보태지만 광역 공격과 근접 기본 공격에 정리될 수 있다.**[* [4년 연속 마스터 카타리나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148155&view=a)] 상대의 범위 스킬이 남아 있는데 무리부터 웨이브 안으로 보내면 다음 교환이 약해진다. 적출(`E`)은 나피리가 이동하면서 흩어진 무리를 다시 불러 회복시키므로, 교환을 끝내고 무리를 보존하는 용도로도 쓴다.

## 들어갈 때는 상대의 반격부터 뺀다

**나피리의 추격은 직선적이라 상대가 준비한 방해 스킬을 정면으로 받기 쉽다.** `Q`로 먼저 체력을 깎고 이동기나 핵심 CC가 빠진 뒤 진입한다. 상대 체력이 낮아도 적 정글이 안 보이거나 큰 적 웨이브가 남았다면 한 번 더 기다린다. 진입을 시작한 뒤에는 방향을 바꾸기 어려우므로, 퇴로와 아군 위치를 먼저 확인한다.

## 빠른 푸시는 로밍 성공률과 함께 본다

**나피리는 `Q`와 무리로 라인을 밀고 먼저 움직이기 좋지만, 밀었다는 이유만으로 매번 사이드로 달리면 동선이 읽힌다.** 상대 미드와 정글 위치, 강가 시야, 도착할 때 교전이 계속될지를 확인한다. 확실한 로밍이 아니면 시야에서 잠깐 사라져 압박만 주고 미드로 돌아와 다음 웨이브를 챙긴다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-23010eca-0af1-4ee2-a3a2-ac98f90fa9f9' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-23010eca-0af1-4ee2-a3a2-ac98f90fa9f9') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-23010eca-0af1-4ee2-a3a2-ac98f90fa9f9' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-naafiri-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-naafiri-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-23010eca-0af1-4ee2-a3a2-ac98f90fa9f9' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q 한 번보다 두 번째 적중을 설계한다 · 무리는 공짜 피해가 아니라 라인 자원이다 · 들어갈 때는 상대의 반격부터 뺀다

## `Q` 한 번보다 두 번째 적중을 설계한다

**다르킨 단검의 첫 타는 출혈을 만들고, 두 번째 타가 같은 대상을 맞혀야 추가 피해와 회복을 얻는다.**[* [에메랄드가 쓰는 개쉬운 베이가 승리법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148095&vtype=pc)] 첫 `Q`가 빗나갔다면 두 번째까지 급하게 던져 마나를 비우지 말고 막타나 다음 압박에 쓴다. 상대가 CS를 먹으러 멈추는 순간 첫 단검을 맞히고, 퇴로를 읽어 두 번째 방향을 조정한다.

## 무리는 공짜 피해가 아니라 라인 자원이다

**무리는 스킬을 맞힌 대상을 따라가 견제를 보태지만 광역 공격과 근접 기본 공격에 정리될 수 있다.**[* [4년 연속 마스터 카타리나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148155&view=a)] 상대의 범위 스킬이 남아 있는데 무리부터 웨이브 안으로 보내면 다음 교환이 약해진다. 적출(`E`)은 나피리가 이동하면서 흩어진 무리를 다시 불러 회복시키므로, 교환을 끝내고 무리를 보존하는 용도로도 쓴다.

## 들어갈 때는 상대의 반격부터 뺀다

**나피리의 추격은 직선적이라 상대가 준비한 방해 스킬을 정면으로 받기 쉽다.** `Q`로 먼저 체력을 깎고 이동기나 핵심 CC가 빠진 뒤 진입한다. 상대 체력이 낮아도 적 정글이 안 보이거나 큰 적 웨이브가 남았다면 한 번 더 기다린다. 진입을 시작한 뒤에는 방향을 바꾸기 어려우므로, 퇴로와 아군 위치를 먼저 확인한다.

## 빠른 푸시는 로밍 성공률과 함께 본다

**나피리는 `Q`와 무리로 라인을 밀고 먼저 움직이기 좋지만, 밀었다는 이유만으로 매번 사이드로 달리면 동선이 읽힌다.** 상대 미드와 정글 위치, 강가 시야, 도착할 때 교전이 계속될지를 확인한다. 확실한 로밍이 아니면 시야에서 잠깐 사라져 압박만 주고 미드로 돌아와 다음 웨이브를 챙긴다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-naafiri-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — E는 체력이 낮은 미니언을 통해 상대에게 번진다 · W를 단독으로 쓸지 E와 묶을지 결정한다 · Q 앞의 첫 대상을 확인한다

## `E`는 체력이 낮은 미니언을 통해 상대에게 번진다

**주문 전이는 주변 대상에게 표식을 퍼뜨린다.**[* [라이즈 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139359)] 상대 가까이에 체력이 낮은 미니언이 있다면 그 미니언에 `E`를 쓰고 `Q`로 정리해 파밍과 견제를 함께 노릴 수 있다. 이 과정은 웨이브를 빠르게 밀기 때문에 강가 시야가 없을 때 반복하지 않는다.

## `W`를 단독으로 쓸지 `E`와 묶을지 결정한다

**`W`만 사용하면 둔화지만 `E` 표식이 있는 대상에게 쓰면 속박이 된다.**[* [라이즈 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140641)] 상대가 단순히 막타를 먹는 상황에는 둔화로 짧게 압박할 수 있고, 이동기를 끊거나 정글러와 잡아야 할 때는 `E`-`W`를 보존한다. 모든 교환을 속박으로 시작하면 마나와 핵심 기술이 동시에 비게 된다.

## `Q` 앞의 첫 대상을 확인한다

**과부하 투사체는 앞에 선 대상에 막힌다.** 상대가 미니언 뒤에 있을 때 정면에서 계속 던지지 말고, 웨이브 옆으로 한두 걸음 이동하거나 `E`가 번진 미니언을 이용한다. 각을 만들겠다고 너무 옆으로 나가면 강가에서 오는 적에게 노출되므로 시야가 있는 쪽으로 움직인다.

## 연계 뒤의 이동 속도로 빠져나온다

**다른 기본 기술은 `Q`의 재사용을 초기화하며, 두 개의 룬을 모은 뒤 `Q`를 쓰면 이동 속도를 얻는다.** 긴 맞대결을 계속하기보다 필요한 주문을 순서대로 사용하고 이 속도로 상대 사거리 밖으로 나가 짧은 교환을 완성한다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-67086497-75b0-4808-a001-3dddfeacc105' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-67086497-75b0-4808-a001-3dddfeacc105') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-67086497-75b0-4808-a001-3dddfeacc105' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-ryze-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-ryze-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-67086497-75b0-4808-a001-3dddfeacc105' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — E는 체력이 낮은 미니언을 통해 상대에게 번진다 · W를 단독으로 쓸지 E와 묶을지 결정한다 · Q 앞의 첫 대상을 확인한다

## `E`는 체력이 낮은 미니언을 통해 상대에게 번진다

**주문 전이는 주변 대상에게 표식을 퍼뜨린다.**[* [라이즈 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139359)] 상대 가까이에 체력이 낮은 미니언이 있다면 그 미니언에 `E`를 쓰고 `Q`로 정리해 파밍과 견제를 함께 노릴 수 있다. 이 과정은 웨이브를 빠르게 밀기 때문에 강가 시야가 없을 때 반복하지 않는다.

## `W`를 단독으로 쓸지 `E`와 묶을지 결정한다

**`W`만 사용하면 둔화지만 `E` 표식이 있는 대상에게 쓰면 속박이 된다.**[* [라이즈 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140641)] 상대가 단순히 막타를 먹는 상황에는 둔화로 짧게 압박할 수 있고, 이동기를 끊거나 정글러와 잡아야 할 때는 `E`-`W`를 보존한다. 모든 교환을 속박으로 시작하면 마나와 핵심 기술이 동시에 비게 된다.

## `Q` 앞의 첫 대상을 확인한다

**과부하 투사체는 앞에 선 대상에 막힌다.** 상대가 미니언 뒤에 있을 때 정면에서 계속 던지지 말고, 웨이브 옆으로 한두 걸음 이동하거나 `E`가 번진 미니언을 이용한다. 각을 만들겠다고 너무 옆으로 나가면 강가에서 오는 적에게 노출되므로 시야가 있는 쪽으로 움직인다.

## 연계 뒤의 이동 속도로 빠져나온다

**다른 기본 기술은 `Q`의 재사용을 초기화하며, 두 개의 룬을 모은 뒤 `Q`를 쓰면 이동 속도를 얻는다.** 긴 맞대결을 계속하기보다 필요한 주문을 순서대로 사용하고 이 속도로 상대 사거리 밖으로 나가 짧은 교환을 완성한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-ryze-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — E는 바로 터뜨리지 않아도 된다 · Q는 미니언 하나 뒤의 상대도 묶는다 · 표식 기본 공격은 안전할 때만 회수한다

## `E`는 바로 터뜨리지 않아도 된다

**광휘의 특이점은 남아 있는 동안 상대를 둔화하고 공간을 막는다.**[* [11.5 럭스 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143095&vtype=pc)] 상대 발밑에 던진 뒤 즉시 폭발시키는 것보다, 이동 방향이 정해질 때까지 잠시 유지하면 `Q`를 피할 길을 좁힐 수 있다. 수풀이나 강가 입구를 확인할 때도 `E`의 시야를 활용한다.

## `Q`는 미니언 하나 뒤의 상대도 묶는다

**빛의 속박은 최대 두 대상을 맞힐 수 있다.**[* [간편 럭스 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=117471&vtype=pc)] 상대와 럭스 사이에 미니언이 하나뿐인 순간은 미니언을 관통해 속박할 수 있는 각이다. 반대로 미니언이 겹겹이 있을 때 정면으로 던지면 쉽게 막히므로 웨이브 옆 각도를 만든다.

## 표식 기본 공격은 안전할 때만 회수한다

**스킬 적중 뒤 기본 공격으로 추가 피해를 낼 수 있지만, 표식 하나를 터뜨리려고 상대의 반격 사거리까지 걸어갈 필요는 없다.** 상대 핵심 기술이 빠졌거나 `W`의 왕복 보호막을 받을 수 있을 때만 짧게 치고 빠진다.

## 라인에 쓴 `E`는 잠시 생존기가 아니다

**`E`로 웨이브를 밀면 둔화와 시야 확인 수단이 동시에 사라진다.** 상대 정글러 위치가 보이지 않을 때는 미니언 전체를 맞히겠다고 앞으로 던지지 말고, 라인이 안전한 위치로 돌아올 여지를 남긴다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-27bd0e78-66b0-4a9b-846a-32b18365e3ef' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-27bd0e78-66b0-4a9b-846a-32b18365e3ef') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-27bd0e78-66b0-4a9b-846a-32b18365e3ef' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-lux-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-lux-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-27bd0e78-66b0-4a9b-846a-32b18365e3ef' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — E는 바로 터뜨리지 않아도 된다 · Q는 미니언 하나 뒤의 상대도 묶는다 · 표식 기본 공격은 안전할 때만 회수한다

## `E`는 바로 터뜨리지 않아도 된다

**광휘의 특이점은 남아 있는 동안 상대를 둔화하고 공간을 막는다.**[* [11.5 럭스 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143095&vtype=pc)] 상대 발밑에 던진 뒤 즉시 폭발시키는 것보다, 이동 방향이 정해질 때까지 잠시 유지하면 `Q`를 피할 길을 좁힐 수 있다. 수풀이나 강가 입구를 확인할 때도 `E`의 시야를 활용한다.

## `Q`는 미니언 하나 뒤의 상대도 묶는다

**빛의 속박은 최대 두 대상을 맞힐 수 있다.**[* [간편 럭스 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=117471&vtype=pc)] 상대와 럭스 사이에 미니언이 하나뿐인 순간은 미니언을 관통해 속박할 수 있는 각이다. 반대로 미니언이 겹겹이 있을 때 정면으로 던지면 쉽게 막히므로 웨이브 옆 각도를 만든다.

## 표식 기본 공격은 안전할 때만 회수한다

**스킬 적중 뒤 기본 공격으로 추가 피해를 낼 수 있지만, 표식 하나를 터뜨리려고 상대의 반격 사거리까지 걸어갈 필요는 없다.** 상대 핵심 기술이 빠졌거나 `W`의 왕복 보호막을 받을 수 있을 때만 짧게 치고 빠진다.

## 라인에 쓴 `E`는 잠시 생존기가 아니다

**`E`로 웨이브를 밀면 둔화와 시야 확인 수단이 동시에 사라진다.** 상대 정글러 위치가 보이지 않을 때는 미니언 전체를 맞히겠다고 앞으로 던지지 말고, 라인이 안전한 위치로 돌아올 여지를 남긴다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-lux-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 평타와 앞무빙도 압박이다 · W는 들어간 자리보다 돌아갈 자리를 본다 · 사슬은 옆 각도와 정글이 만든다

## 평타와 앞무빙도 압박이다

**르블랑은 콤보를 쓸 때만 강한 것이 아니다.**[* [다5 르블랑 매니아 홍르입니다!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141589&vtype=pc)] 상대가 막타를 치는 순간 앞으로 걸어가 기본 공격과 `Q`를 섞으면, `W`를 실제로 쓰지 않아도 상대 움직임을 줄일 수 있다. 매번 `W`까지 눌러 마나와 퇴로를 함께 쓰지 말고, 상대가 물러난다면 그 공간으로 먼저 웨이브 주도권을 챙긴다.

## `W`는 들어간 자리보다 돌아갈 자리를 본다

**왜곡을 쓰기 전에 출발 지점이 안전한지 확인한다.**[* [르블랑의 모든것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112713&vtype=pc)] 상대 정글이 그 자리를 덮거나 상대가 스킬을 깔아 두면 복귀 버튼이 있어도 퇴로가 아니다. 상대와 미니언을 함께 맞히면 교환과 푸시를 동시에 얻지만 라인이 원치 않게 밀릴 수 있다. 돌아갈지 걸어서 빠질지도 매번 새로 판단한다.

## 사슬은 옆 각도와 정글이 만든다

**`E`는 미니언에 막히므로 정면에서 억지로 던지기보다 상대가 막타를 먹는 순간 옆으로 각을 바꾼다.** 상대 이동기가 빠졌다면 아군 정글을 부르고, 먼저 사슬을 맞혀 갱 호응을 만든다. 연결을 유지하겠다고 적 정글 쪽까지 따라가지 말고, 속박 전에 위험해지면 짧은 피해만 얻고 빠진다.

## 로밍 전에는 양쪽 정글부터 본다

**르블랑은 먼저 움직이면 사이드에 큰 압박을 주지만, 라인전이 강한 만큼 상대 정글의 집중 대상도 되기 쉽다.** `W`로 웨이브를 넣은 뒤 아군과 적 정글 위치, 강가 시야를 확인한다. 혼자 깊이 들어가기보다 정글과 함께 적 정글 입구나 사이드를 압박하고, 웨이브를 끝까지 못 밀었다면 무리한 로밍 대신 라인을 당겨 갱 각을 만든다.', revision = 5, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-leblanc-20260911' AND kind = 'article' AND revision = 4
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-leblanc-20260911') = 4
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-leblanc-20260911' AND revision = 4 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-leblanc-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-leblanc-20260913', id, NULL, 4, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 5
FROM wiki_docs WHERE id = 'doc-ai-champion-leblanc-20260911' AND revision = 5
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 평타와 앞무빙도 압박이다 · W는 들어간 자리보다 돌아갈 자리를 본다 · 사슬은 옆 각도와 정글이 만든다

## 평타와 앞무빙도 압박이다

**르블랑은 콤보를 쓸 때만 강한 것이 아니다.**[* [다5 르블랑 매니아 홍르입니다!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141589&vtype=pc)] 상대가 막타를 치는 순간 앞으로 걸어가 기본 공격과 `Q`를 섞으면, `W`를 실제로 쓰지 않아도 상대 움직임을 줄일 수 있다. 매번 `W`까지 눌러 마나와 퇴로를 함께 쓰지 말고, 상대가 물러난다면 그 공간으로 먼저 웨이브 주도권을 챙긴다.

## `W`는 들어간 자리보다 돌아갈 자리를 본다

**왜곡을 쓰기 전에 출발 지점이 안전한지 확인한다.**[* [르블랑의 모든것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112713&vtype=pc)] 상대 정글이 그 자리를 덮거나 상대가 스킬을 깔아 두면 복귀 버튼이 있어도 퇴로가 아니다. 상대와 미니언을 함께 맞히면 교환과 푸시를 동시에 얻지만 라인이 원치 않게 밀릴 수 있다. 돌아갈지 걸어서 빠질지도 매번 새로 판단한다.

## 사슬은 옆 각도와 정글이 만든다

**`E`는 미니언에 막히므로 정면에서 억지로 던지기보다 상대가 막타를 먹는 순간 옆으로 각을 바꾼다.** 상대 이동기가 빠졌다면 아군 정글을 부르고, 먼저 사슬을 맞혀 갱 호응을 만든다. 연결을 유지하겠다고 적 정글 쪽까지 따라가지 말고, 속박 전에 위험해지면 짧은 피해만 얻고 빠진다.

## 로밍 전에는 양쪽 정글부터 본다

**르블랑은 먼저 움직이면 사이드에 큰 압박을 주지만, 라인전이 강한 만큼 상대 정글의 집중 대상도 되기 쉽다.** `W`로 웨이브를 넣은 뒤 아군과 적 정글 위치, 강가 시야를 확인한다. 혼자 깊이 들어가기보다 정글과 함께 적 정글 입구나 사이드를 압박하고, 웨이브를 끝까지 못 밀었다면 무리한 로밍 대신 라인을 당겨 갱 각을 만든다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-leblanc-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 앞의 미니언을 이용해 사거리를 늘린다 · E를 던졌다고 반드시 따라갈 필요는 없다 · W와 궁극기의 제어 시간을 겹치지 않는다

## `Q`는 앞의 미니언을 이용해 사거리를 늘린다

**얼음 파편은 첫 대상에 맞은 뒤 뒤쪽으로 갈라져 나간다.**[* [리산드라 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142572&vtype=pc)] 상대가 미니언 뒤에서 막타를 치는 순간 앞 미니언에 `Q`를 맞히면 직접 던질 때보다 먼 거리에서 견제할 수 있다. 라인을 당기고 싶다면 광역 파편이 여러 미니언을 건드리지 않도록 각도를 좁힌다.

## `E`를 던졌다고 반드시 따라갈 필요는 없다

**얼음갈퀴 길은 이동이 느리고 재사용할 때 현재 위치로 순간이동한다.**[* [미드 리산드라 기본 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109060&vtype=pc)] 먼저 던져 상대가 뒤로 빠지게 한 뒤 라인을 밀거나 정글러를 기다리는 것만으로도 이득이다. 적 정글러가 보이지 않거나 상대 제어기가 남아 있으면 끝까지 보내고도 이동하지 않는다.

## `W`와 궁극기의 제어 시간을 겹치지 않는다

**정글러와 상대를 잡을 때 `W`와 적 대상 궁극기를 동시에 쓰면 제어 시간 일부가 낭비된다.** 첫 속박이 끝날 즈음 다음 기절을 이어 상대가 움직이지 못하는 시간을 늘린다. 급하게 자신을 지켜야 하면 적에게 궁을 쓰는 것보다 자신에게 사용해 시간을 버는 선택도 있다.

## 광역기로 라인이 저절로 밀리는 것을 계산한다

**`Q`, `W`, `E`가 여러 미니언을 건드리기 쉬워 짧은 견제도 웨이브를 밀 수 있다.** 로밍하려면 빠르게 끝까지 밀고 움직이고, 정글러 갱을 받으려면 챔피언만 맞는 `Q` 각을 사용해 라인이 아군 쪽에 남도록 한다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-132c9ef9-8e8b-4aff-8e16-2e4098465398' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-132c9ef9-8e8b-4aff-8e16-2e4098465398') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-132c9ef9-8e8b-4aff-8e16-2e4098465398' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-lissandra-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-lissandra-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-132c9ef9-8e8b-4aff-8e16-2e4098465398' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 앞의 미니언을 이용해 사거리를 늘린다 · E를 던졌다고 반드시 따라갈 필요는 없다 · W와 궁극기의 제어 시간을 겹치지 않는다

## `Q`는 앞의 미니언을 이용해 사거리를 늘린다

**얼음 파편은 첫 대상에 맞은 뒤 뒤쪽으로 갈라져 나간다.**[* [리산드라 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142572&vtype=pc)] 상대가 미니언 뒤에서 막타를 치는 순간 앞 미니언에 `Q`를 맞히면 직접 던질 때보다 먼 거리에서 견제할 수 있다. 라인을 당기고 싶다면 광역 파편이 여러 미니언을 건드리지 않도록 각도를 좁힌다.

## `E`를 던졌다고 반드시 따라갈 필요는 없다

**얼음갈퀴 길은 이동이 느리고 재사용할 때 현재 위치로 순간이동한다.**[* [미드 리산드라 기본 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109060&vtype=pc)] 먼저 던져 상대가 뒤로 빠지게 한 뒤 라인을 밀거나 정글러를 기다리는 것만으로도 이득이다. 적 정글러가 보이지 않거나 상대 제어기가 남아 있으면 끝까지 보내고도 이동하지 않는다.

## `W`와 궁극기의 제어 시간을 겹치지 않는다

**정글러와 상대를 잡을 때 `W`와 적 대상 궁극기를 동시에 쓰면 제어 시간 일부가 낭비된다.** 첫 속박이 끝날 즈음 다음 기절을 이어 상대가 움직이지 못하는 시간을 늘린다. 급하게 자신을 지켜야 하면 적에게 궁을 쓰는 것보다 자신에게 사용해 시간을 버는 선택도 있다.

## 광역기로 라인이 저절로 밀리는 것을 계산한다

**`Q`, `W`, `E`가 여러 미니언을 건드리기 쉬워 짧은 견제도 웨이브를 밀 수 있다.** 로밍하려면 빠르게 끝까지 밀고 움직이고, 정글러 갱을 받으려면 챔피언만 맞는 `Q` 각을 사용해 라인이 아군 쪽에 남도록 한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-lissandra-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — E가 옮겨갈 다음 대상을 먼저 본다 · 공허충은 E가 붙은 대상이 있을 때 부른다 · Q는 침묵뿐 아니라 E 지속시간을 잇는 기술이다

## `E`가 옮겨갈 다음 대상을 먼저 본다

**재앙의 환상은 대상이 죽으면 가까운 적에게 옮겨간다.**[* [9.1 미드 말자하 정석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143585)] 상대 챔피언 가까이에 체력이 낮은 미니언이 있다면 그 미니언에 `E`를 붙여 막타와 견제를 함께 노릴 수 있다. 반대로 옮겨갈 대상이 없는데 무작정 `E`를 쓰면 마나만 쓰고 라인도 원하는 만큼 밀리지 않는다.

## 공허충은 `E`가 붙은 대상이 있을 때 부른다

**공허충은 광역기에 쉽게 정리되므로 습관적으로 먼저 소환하지 않는다.**[* [말자하 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138980&view=a)] `E`가 붙은 대상이 있고 상대의 광역 정리기가 빠진 뒤 사용해야 미니언 정리와 압박에 제대로 기여한다. 공허충으로 라인을 빠르게 밀면 자연스럽게 앞으로 나가게 되므로 강가 시야가 없을 때는 수를 아낀다.

## `Q`는 침묵뿐 아니라 `E` 지속시간을 잇는 기술이다

**상대가 `E`를 달고 물러나는 경로에 `Q`를 놓으면 침묵과 함께 `E`의 지속시간을 갱신할 수 있다.** 다만 맞히기 어려운 거리에서 계속 `Q`를 쓰면 정글러가 왔을 때 끊을 기술이 남지 않는다. 상대가 스킬을 쓰거나 막타를 치는 고정 동작을 기다린다.

## 궁극기는 혼자 잡기보다 함께 때릴 시간을 만든다

**제압은 정글러의 접근과 피해를 확정하는 데 특히 강하다.** 라인이 아군 쪽에 있고 정글러가 가까울 때가 가장 단순한 킬 각이다. 반대로 큰 미니언 웨이브를 적 포탑에 넣은 상태에서 혼자 궁을 시작하면 주변 적에게 쉽게 끊기므로 위치부터 확인한다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-077fa2c7-41b2-4620-ae2c-185b81fe54d1' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-077fa2c7-41b2-4620-ae2c-185b81fe54d1') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-077fa2c7-41b2-4620-ae2c-185b81fe54d1' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-malzahar-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-malzahar-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-077fa2c7-41b2-4620-ae2c-185b81fe54d1' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — E가 옮겨갈 다음 대상을 먼저 본다 · 공허충은 E가 붙은 대상이 있을 때 부른다 · Q는 침묵뿐 아니라 E 지속시간을 잇는 기술이다

## `E`가 옮겨갈 다음 대상을 먼저 본다

**재앙의 환상은 대상이 죽으면 가까운 적에게 옮겨간다.**[* [9.1 미드 말자하 정석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143585)] 상대 챔피언 가까이에 체력이 낮은 미니언이 있다면 그 미니언에 `E`를 붙여 막타와 견제를 함께 노릴 수 있다. 반대로 옮겨갈 대상이 없는데 무작정 `E`를 쓰면 마나만 쓰고 라인도 원하는 만큼 밀리지 않는다.

## 공허충은 `E`가 붙은 대상이 있을 때 부른다

**공허충은 광역기에 쉽게 정리되므로 습관적으로 먼저 소환하지 않는다.**[* [말자하 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138980&view=a)] `E`가 붙은 대상이 있고 상대의 광역 정리기가 빠진 뒤 사용해야 미니언 정리와 압박에 제대로 기여한다. 공허충으로 라인을 빠르게 밀면 자연스럽게 앞으로 나가게 되므로 강가 시야가 없을 때는 수를 아낀다.

## `Q`는 침묵뿐 아니라 `E` 지속시간을 잇는 기술이다

**상대가 `E`를 달고 물러나는 경로에 `Q`를 놓으면 침묵과 함께 `E`의 지속시간을 갱신할 수 있다.** 다만 맞히기 어려운 거리에서 계속 `Q`를 쓰면 정글러가 왔을 때 끊을 기술이 남지 않는다. 상대가 스킬을 쓰거나 막타를 치는 고정 동작을 기다린다.

## 궁극기는 혼자 잡기보다 함께 때릴 시간을 만든다

**제압은 정글러의 접근과 피해를 확정하는 데 특히 강하다.** 라인이 아군 쪽에 있고 정글러가 가까울 때가 가장 단순한 킬 각이다. 반대로 큰 미니언 웨이브를 적 포탑에 넣은 상태에서 혼자 궁을 시작하면 주변 적에게 쉽게 끊기므로 위치부터 확인한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-malzahar-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — W는 평범한 견제보다 결정적인 투사체에 남긴다 · E는 중심부가 맞아야 속박된다 · Q는 멈춘 적에게 써야 피해가 남는다

## `W`는 평범한 견제보다 결정적인 투사체에 남긴다

**반박은 모든 피해를 지우는 기술이 아니다.**[* [멜 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=170)] 반사할 수 있는 투사체와 막지 못하는 비투사체·지속 공격을 구분해야 한다. 작은 견제 하나에 먼저 쓰면 상대의 핵심 투사체나 정글러의 진입을 받아낼 방법이 사라지므로, 어떤 기술을 돌려보낼지 라인 시작 전에 정해 둔다.

## `E`는 중심부가 맞아야 속박된다

**태양 올가미의 바깥 부분은 둔화에 그치므로, 멀리서 무작정 던지기보다 상대가 막타를 치는 순간이나 좁은 통로에 들어온 순간을 노린다.**[* [멜 단점과 카운터에 대한 유저 경험](https://www.inven.co.kr/board/lol/3370/571366)] 돌진형 상대에게는 먼저 소모하지 않고 진입 경로에 사용하면 `Q`의 반복 피해를 넣을 시간을 벌 수 있다.

## `Q`는 멈춘 적에게 써야 피해가 남는다

**빛의 세례는 한 지점에 피해가 반복되는 기술이라 자유롭게 움직이는 상대에게는 효율이 떨어진다.** `E`의 속박·둔화나 아군의 제어가 확인된 뒤 사용하고, `Q`와 `E`를 동시에 빗맞힌 상태에서는 강화 공격을 넣겠다고 앞으로 나가지 않는다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-5bd97d30-0917-495d-b049-bb438235d231' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-5bd97d30-0917-495d-b049-bb438235d231') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-5bd97d30-0917-495d-b049-bb438235d231' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-mel-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-mel-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-5bd97d30-0917-495d-b049-bb438235d231' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — W는 평범한 견제보다 결정적인 투사체에 남긴다 · E는 중심부가 맞아야 속박된다 · Q는 멈춘 적에게 써야 피해가 남는다

## `W`는 평범한 견제보다 결정적인 투사체에 남긴다

**반박은 모든 피해를 지우는 기술이 아니다.**[* [멜 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=170)] 반사할 수 있는 투사체와 막지 못하는 비투사체·지속 공격을 구분해야 한다. 작은 견제 하나에 먼저 쓰면 상대의 핵심 투사체나 정글러의 진입을 받아낼 방법이 사라지므로, 어떤 기술을 돌려보낼지 라인 시작 전에 정해 둔다.

## `E`는 중심부가 맞아야 속박된다

**태양 올가미의 바깥 부분은 둔화에 그치므로, 멀리서 무작정 던지기보다 상대가 막타를 치는 순간이나 좁은 통로에 들어온 순간을 노린다.**[* [멜 단점과 카운터에 대한 유저 경험](https://www.inven.co.kr/board/lol/3370/571366)] 돌진형 상대에게는 먼저 소모하지 않고 진입 경로에 사용하면 `Q`의 반복 피해를 넣을 시간을 벌 수 있다.

## `Q`는 멈춘 적에게 써야 피해가 남는다

**빛의 세례는 한 지점에 피해가 반복되는 기술이라 자유롭게 움직이는 상대에게는 효율이 떨어진다.** `E`의 속박·둔화나 아군의 제어가 확인된 뒤 사용하고, `Q`와 `E`를 동시에 빗맞힌 상태에서는 강화 공격을 넣겠다고 앞으로 나가지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-mel-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q로 미니언 두 마리를 한 줄에 세운다 · E는 기절보다 우리 안에 가두는 것만으로도 성공이다 · W는 움직일 곳이 줄었을 때 떨어뜨린다

## `Q`로 미니언 두 마리를 한 줄에 세운다

**사악한 일격은 앞의 두 대상을 맞힐 수 있다.**[* [베이가는 졸렬한 플레이](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=131611)] 체력이 낮은 미니언 두 마리를 일렬로 두고 마지막 타격을 하면 성장과 마나 사용을 함께 챙길 수 있다. 상대를 맞히겠다고 웨이브 옆으로 깊게 나가기보다 안정적인 막타를 먼저 확보한다.

## `E`는 기절보다 우리 안에 가두는 것만으로도 성공이다

**사건의 지평선 가장자리를 정확히 맞히려다 빗나가는 것보다, 상대의 퇴로나 진입로를 잘라 우리 안에 머물게 하는 편이 안정적이다.**[* [미드 베이가 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=118725)] 상대가 이동기를 가진 경우 먼저 쓰지 않고, 진입한 뒤 돌아갈 길을 막으면 생존에도 도움이 된다.

## `W`는 움직일 곳이 줄었을 때 떨어뜨린다

**암흑 물질은 떨어지기까지 시간이 있어 자유롭게 움직이는 상대에게 맞히기 어렵다.** `E`로 공간을 제한하거나 상대가 막타를 치는 위치가 정해진 뒤 사용한다. 아무 근거 없이 `W`를 반복하면 마나가 줄고 웨이브만 밀린다.

## 초반에는 킬보다 안전한 성장을 우선한다

**견제 한 번을 위해 `Q` 막타와 좋은 라인 위치를 동시에 잃지 않는다.** 상대가 기술을 미니언에 사용했을 때만 짧게 압박하고, 위협적인 진입기가 남아 있으면 `E`를 보존한 채 포탑 쪽에서 성장한다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-bed696ba-2310-4820-9cf4-ee5c34ae55a2' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-bed696ba-2310-4820-9cf4-ee5c34ae55a2') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-bed696ba-2310-4820-9cf4-ee5c34ae55a2' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-veigar-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-veigar-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-bed696ba-2310-4820-9cf4-ee5c34ae55a2' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q로 미니언 두 마리를 한 줄에 세운다 · E는 기절보다 우리 안에 가두는 것만으로도 성공이다 · W는 움직일 곳이 줄었을 때 떨어뜨린다

## `Q`로 미니언 두 마리를 한 줄에 세운다

**사악한 일격은 앞의 두 대상을 맞힐 수 있다.**[* [베이가는 졸렬한 플레이](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=131611)] 체력이 낮은 미니언 두 마리를 일렬로 두고 마지막 타격을 하면 성장과 마나 사용을 함께 챙길 수 있다. 상대를 맞히겠다고 웨이브 옆으로 깊게 나가기보다 안정적인 막타를 먼저 확보한다.

## `E`는 기절보다 우리 안에 가두는 것만으로도 성공이다

**사건의 지평선 가장자리를 정확히 맞히려다 빗나가는 것보다, 상대의 퇴로나 진입로를 잘라 우리 안에 머물게 하는 편이 안정적이다.**[* [미드 베이가 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=118725)] 상대가 이동기를 가진 경우 먼저 쓰지 않고, 진입한 뒤 돌아갈 길을 막으면 생존에도 도움이 된다.

## `W`는 움직일 곳이 줄었을 때 떨어뜨린다

**암흑 물질은 떨어지기까지 시간이 있어 자유롭게 움직이는 상대에게 맞히기 어렵다.** `E`로 공간을 제한하거나 상대가 막타를 치는 위치가 정해진 뒤 사용한다. 아무 근거 없이 `W`를 반복하면 마나가 줄고 웨이브만 밀린다.

## 초반에는 킬보다 안전한 성장을 우선한다

**견제 한 번을 위해 `Q` 막타와 좋은 라인 위치를 동시에 잃지 않는다.** 상대가 기술을 미니언에 사용했을 때만 짧게 압박하고, 위협적인 진입기가 남아 있으면 `E`를 보존한 채 포탑 쪽에서 성장한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-veigar-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 공포는 기술이 아니라 자원으로 관리한다 · E로 움직임을 늦춘 뒤 Q를 잇는다 · W는 다가오는 상대에게 남긴다

## 공포는 기술이 아니라 자원으로 관리한다

**파멸 중첩이 준비된 상태에서 스킬을 웨이브에 쓰면 잠시 돌진을 끊을 수단이 사라진다.**[* [벡스 라인전 및 교전 상세 팁](https://www.inven.co.kr/board/lol/3370/548883)] 상대가 들어올 수 있는 구도에서는 라인 정리를 조금 늦추더라도 공포를 보유한다. 안전하게 밀 수 있거나 상대 이동기가 빠졌을 때만 웨이브에 사용한다.

## `E`로 움직임을 늦춘 뒤 `Q`를 잇는다

**커지는 어둠은 범위를 만들고 상대를 둔화해 다음 `Q`를 맞히기 쉽게 한다.**[* [미드 벡스 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147487)] 상대가 막타를 치는 자리에 `E`를 놓고 이동 방향을 본 뒤 `Q`를 보내면 단독 `Q`보다 안정적이다. 두 기술이 모두 빗나가면 앞으로 걸어 추가 공격을 시도하지 않는다.

## `W`는 다가오는 상대에게 남긴다

**거리 유지가 필요한 벡스에게 `W`의 보호막과 주변 피해는 중요한 방어 수단이다.** 돌진형 상대가 있는 라인에서 단순 막타나 작은 견제에 쓰지 않고, 상대가 몸 안쪽으로 들어오는 순간 공포와 함께 끊는 용도로 사용한다.

## 긴 사거리 상대에게는 라인 안에서 억지로 싸우지 않는다

**더 먼 거리에서 웨이브와 체력을 동시에 압박하는 상대에게 계속 정면 교환을 걸면 손해가 누적된다.** 안전한 순간에 라인을 정리하고 시야 밖으로 사라져 정글러와 움직이면 벡스의 진입 위협을 살릴 수 있다. 궁극기가 맞아도 불리한 위치라면 재사용하지 않는다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-80df8739-7bdf-428b-9789-58571366b198' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-80df8739-7bdf-428b-9789-58571366b198') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-80df8739-7bdf-428b-9789-58571366b198' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-vex-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-vex-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-80df8739-7bdf-428b-9789-58571366b198' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 공포는 기술이 아니라 자원으로 관리한다 · E로 움직임을 늦춘 뒤 Q를 잇는다 · W는 다가오는 상대에게 남긴다

## 공포는 기술이 아니라 자원으로 관리한다

**파멸 중첩이 준비된 상태에서 스킬을 웨이브에 쓰면 잠시 돌진을 끊을 수단이 사라진다.**[* [벡스 라인전 및 교전 상세 팁](https://www.inven.co.kr/board/lol/3370/548883)] 상대가 들어올 수 있는 구도에서는 라인 정리를 조금 늦추더라도 공포를 보유한다. 안전하게 밀 수 있거나 상대 이동기가 빠졌을 때만 웨이브에 사용한다.

## `E`로 움직임을 늦춘 뒤 `Q`를 잇는다

**커지는 어둠은 범위를 만들고 상대를 둔화해 다음 `Q`를 맞히기 쉽게 한다.**[* [미드 벡스 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147487)] 상대가 막타를 치는 자리에 `E`를 놓고 이동 방향을 본 뒤 `Q`를 보내면 단독 `Q`보다 안정적이다. 두 기술이 모두 빗나가면 앞으로 걸어 추가 공격을 시도하지 않는다.

## `W`는 다가오는 상대에게 남긴다

**거리 유지가 필요한 벡스에게 `W`의 보호막과 주변 피해는 중요한 방어 수단이다.** 돌진형 상대가 있는 라인에서 단순 막타나 작은 견제에 쓰지 않고, 상대가 몸 안쪽으로 들어오는 순간 공포와 함께 끊는 용도로 사용한다.

## 긴 사거리 상대에게는 라인 안에서 억지로 싸우지 않는다

**더 먼 거리에서 웨이브와 체력을 동시에 압박하는 상대에게 계속 정면 교환을 걸면 손해가 누적된다.** 안전한 순간에 라인을 정리하고 시야 밖으로 사라져 정글러와 움직이면 벡스의 진입 위협을 살릴 수 있다. 궁극기가 맞아도 불리한 위치라면 재사용하지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-vex-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 한 번의 E에 푸시와 견제를 모두 욕심내지 않는다 · Q 강화 공격은 걸어갈 가치가 있을 때만 쓴다 · W는 즉시 기절이 아니라 이동 경로를 막는 장판이다

## 한 번의 `E`에 푸시와 견제를 모두 욕심내지 않는다

**죽음의 광선은 미니언을 정리하면서 상대를 맞히기 좋지만, 매번 두 가지를 동시에 노리면 예측하기 쉬운 직선이 된다.**[* [미드 빅토르 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144393)] 상대가 막타를 먹는 위치와 웨이브를 가르는 각이 겹칠 때만 둘을 함께 노리고, 그렇지 않으면 라인 관리와 체력 압박 중 하나를 선택한다.

## `Q` 강화 공격은 걸어갈 가치가 있을 때만 쓴다

**`Q` 보호막 덕분에 짧은 교환은 강하지만 강화 기본 공격을 넣으려고 앞으로 걸으면 상대의 핵심 기술 사거리에 들어갈 수 있다.**[* [빅토르의 교과서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133858&vtype=pc)] 상대 스킬이 빠졌거나 미니언 수가 비슷할 때만 강화 공격까지 연결하고, 위험하면 보호막으로 받은 이득만 챙겨 물러난다.

## `W`는 즉시 기절이 아니라 이동 경로를 막는 장판이다

**중력장은 상대 발밑보다 퇴로 또는 자신의 도주로에 걸쳐 놓는 편이 효과적이다.** 돌진기가 남아 있는 상대에게 먼저 쓰면 쉽게 벗어나므로, 이동기가 빠지거나 정글러가 접근해 진행 방향이 정해진 뒤 사용한다.

## 초반의 승리는 첫 귀환까지 쓰러지지 않는 것이다

**초반 재사용 대기시간이 길 때 무리한 연속 교환을 하면 빈 시간이 크다.** 사거리로 체력을 조금씩 깎되, 킬을 위해 앞으로 나가기보다 체력과 미니언을 보존해 안정적으로 성장하는 것을 우선한다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-f1404d69-50a3-4c61-9452-d31dd292564a' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-f1404d69-50a3-4c61-9452-d31dd292564a') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-f1404d69-50a3-4c61-9452-d31dd292564a' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-viktor-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-viktor-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-f1404d69-50a3-4c61-9452-d31dd292564a' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 한 번의 E에 푸시와 견제를 모두 욕심내지 않는다 · Q 강화 공격은 걸어갈 가치가 있을 때만 쓴다 · W는 즉시 기절이 아니라 이동 경로를 막는 장판이다

## 한 번의 `E`에 푸시와 견제를 모두 욕심내지 않는다

**죽음의 광선은 미니언을 정리하면서 상대를 맞히기 좋지만, 매번 두 가지를 동시에 노리면 예측하기 쉬운 직선이 된다.**[* [미드 빅토르 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144393)] 상대가 막타를 먹는 위치와 웨이브를 가르는 각이 겹칠 때만 둘을 함께 노리고, 그렇지 않으면 라인 관리와 체력 압박 중 하나를 선택한다.

## `Q` 강화 공격은 걸어갈 가치가 있을 때만 쓴다

**`Q` 보호막 덕분에 짧은 교환은 강하지만 강화 기본 공격을 넣으려고 앞으로 걸으면 상대의 핵심 기술 사거리에 들어갈 수 있다.**[* [빅토르의 교과서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133858&vtype=pc)] 상대 스킬이 빠졌거나 미니언 수가 비슷할 때만 강화 공격까지 연결하고, 위험하면 보호막으로 받은 이득만 챙겨 물러난다.

## `W`는 즉시 기절이 아니라 이동 경로를 막는 장판이다

**중력장은 상대 발밑보다 퇴로 또는 자신의 도주로에 걸쳐 놓는 편이 효과적이다.** 돌진기가 남아 있는 상대에게 먼저 쓰면 쉽게 벗어나므로, 이동기가 빠지거나 정글러가 접근해 진행 방향이 정해진 뒤 사용한다.

## 초반의 승리는 첫 귀환까지 쓰러지지 않는 것이다

**초반 재사용 대기시간이 길 때 무리한 연속 교환을 하면 빈 시간이 크다.** 사거리로 체력을 조금씩 깎되, 킬을 위해 앞으로 나가기보다 체력과 미니언을 보존해 안정적으로 성장하는 것을 우선한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-viktor-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 움직이면서 던지고 막타 동작을 노린다 · 남아 있는 구체와 E의 직선을 계속 본다 · W의 둔화로 다음 기술을 맞힌다

## `Q`는 움직이면서 던지고 막타 동작을 노린다

**신드라는 `Q`를 사용하는 동안 이동을 멈출 필요가 없다.**[* [초보를 위한 신드라 공략서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=119807&vtype=pc)] 상대가 미니언을 치려고 잠깐 멈추는 순간 구체를 놓고 곧바로 옆으로 움직여 반격 각을 줄인다. 기본 공격을 섞을 수는 있지만, 한 대를 더 치기 위해 상대 미니언 한가운데까지 걷지 않는다.

## 남아 있는 구체와 `E`의 직선을 계속 본다

**바닥의 구체는 잠시 남고 `E`에 밀리면 직선상의 적을 기절시킨다.**[* [신드라 간단 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=123417)] 상대 정면의 구체만 볼 것이 아니라 살짝 옆에 남은 구체와 상대를 잇는 선을 찾아야 예측하기 어려운 각이 나온다. 시야가 없거나 암살자가 진입할 수 있을 때 `E`를 단순 견제에 쓰면 생존 수단이 사라진다.

## `W`의 둔화로 다음 기술을 맞힌다

**미니언이나 구체를 던지는 `W`는 피해만 넣는 기술이 아니다.** 상대의 막타 경로에 던져 둔화를 만든 뒤 `Q`나 `E`를 연결하면 적중이 쉬워진다. 구체를 집어 들 때는 기존 `E` 각을 없애는지 함께 확인한다.

## 한 번 빗나가면 연계를 억지로 완성하지 않는다

**신드라의 긴 연계는 첫 제어기가 적중했을 때 강하다.** `Q`나 `W`가 빗나갔는데도 `E`를 추가로 소모하면 상대가 들어올 긴 빈틈만 생긴다. 실패한 교환은 즉시 끊고 다음 구체 배치를 준비한다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-908b088a-d7ea-4d7a-bdc5-3c47ada13b5e' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-908b088a-d7ea-4d7a-bdc5-3c47ada13b5e') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-908b088a-d7ea-4d7a-bdc5-3c47ada13b5e' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-syndra-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-syndra-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-908b088a-d7ea-4d7a-bdc5-3c47ada13b5e' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 움직이면서 던지고 막타 동작을 노린다 · 남아 있는 구체와 E의 직선을 계속 본다 · W의 둔화로 다음 기술을 맞힌다

## `Q`는 움직이면서 던지고 막타 동작을 노린다

**신드라는 `Q`를 사용하는 동안 이동을 멈출 필요가 없다.**[* [초보를 위한 신드라 공략서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=119807&vtype=pc)] 상대가 미니언을 치려고 잠깐 멈추는 순간 구체를 놓고 곧바로 옆으로 움직여 반격 각을 줄인다. 기본 공격을 섞을 수는 있지만, 한 대를 더 치기 위해 상대 미니언 한가운데까지 걷지 않는다.

## 남아 있는 구체와 `E`의 직선을 계속 본다

**바닥의 구체는 잠시 남고 `E`에 밀리면 직선상의 적을 기절시킨다.**[* [신드라 간단 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=123417)] 상대 정면의 구체만 볼 것이 아니라 살짝 옆에 남은 구체와 상대를 잇는 선을 찾아야 예측하기 어려운 각이 나온다. 시야가 없거나 암살자가 진입할 수 있을 때 `E`를 단순 견제에 쓰면 생존 수단이 사라진다.

## `W`의 둔화로 다음 기술을 맞힌다

**미니언이나 구체를 던지는 `W`는 피해만 넣는 기술이 아니다.** 상대의 막타 경로에 던져 둔화를 만든 뒤 `Q`나 `E`를 연결하면 적중이 쉬워진다. 구체를 집어 들 때는 기존 `E` 각을 없애는지 함께 확인한다.

## 한 번 빗나가면 연계를 억지로 완성하지 않는다

**신드라의 긴 연계는 첫 제어기가 적중했을 때 강하다.** `Q`나 `W`가 빗나갔는데도 `E`를 추가로 소모하면 상대가 들어올 긴 빈틈만 생긴다. 실패한 교환은 즉시 끊고 다음 구체 배치를 준비한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-syndra-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 돌아오는 길까지 맞혀야 한다 · 매혹은 먼저 던지기보다 남겨 둘 때 강하다 · W의 이동 속도로 교환을 끊는다

## `Q`는 돌아오는 길까지 맞혀야 한다

**현혹의 구슬은 나갈 때보다 돌아올 때의 궤적을 맞히는 것이 중요하다.**[* [아리 기초 중의 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147001&vtype=pc)] 상대가 막타를 치느라 멈추는 순간 던지고, 구슬이 돌아올 때 옆으로 움직여 귀환 경로가 상대를 다시 지나게 만든다. 첫 타만 맞았는데 무리해서 앞으로 따라가면 되레 상대의 반격 거리로 들어가므로, 돌아오는 각이 없으면 짧은 이득으로 끝낸다.

## 매혹은 먼저 던지기보다 남겨 둘 때 강하다

**매혹은 미니언에 막히므로 정면에서 습관적으로 사용하지 않는다.**[* [아리 기본 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=134209&vtype=pc)] 상대의 이동기가 빠졌거나 막타 동작으로 움직임이 고정됐을 때 쓰면 적중률이 높다. 시야가 없거나 돌진형 상대가 접근할 수 있는 상황에서는 매혹을 견제에 소모하지 않고, 진입을 끊는 용도로 보유하는 편이 라인 유지에 도움이 된다.

## `W`의 이동 속도로 교환을 끊는다

**여우불은 추가 피해뿐 아니라 잠깐의 이동 속도를 주는 기술이다.** 평타나 `Q`로 교환을 시작한 뒤 `W`의 속도로 상대 사거리 밖으로 빠지면 일방적인 짧은 교환을 만들기 쉽다. 반대로 `W`를 켜고 오래 추격하면 미니언 피해와 정글 개입에 노출된다.

## 라인을 밀 때와 싸울 때의 `Q`를 구분한다

**초반부터 모든 `Q`를 미니언과 챔피언에게 동시에 맞히려 하면 마나와 체력을 함께 잃기 쉽다.** 라인을 밀 목적이라면 먼저 강가 시야와 상대 위치를 확인하고, 싸울 목적이라면 미니언 체력이 낮아 상대가 막타를 치는 순간을 노린다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-2df64efd-93e1-4656-bddf-8f305f5df8cc' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-2df64efd-93e1-4656-bddf-8f305f5df8cc') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-2df64efd-93e1-4656-bddf-8f305f5df8cc' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-ahri-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-ahri-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-2df64efd-93e1-4656-bddf-8f305f5df8cc' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 돌아오는 길까지 맞혀야 한다 · 매혹은 먼저 던지기보다 남겨 둘 때 강하다 · W의 이동 속도로 교환을 끊는다

## `Q`는 돌아오는 길까지 맞혀야 한다

**현혹의 구슬은 나갈 때보다 돌아올 때의 궤적을 맞히는 것이 중요하다.**[* [아리 기초 중의 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147001&vtype=pc)] 상대가 막타를 치느라 멈추는 순간 던지고, 구슬이 돌아올 때 옆으로 움직여 귀환 경로가 상대를 다시 지나게 만든다. 첫 타만 맞았는데 무리해서 앞으로 따라가면 되레 상대의 반격 거리로 들어가므로, 돌아오는 각이 없으면 짧은 이득으로 끝낸다.

## 매혹은 먼저 던지기보다 남겨 둘 때 강하다

**매혹은 미니언에 막히므로 정면에서 습관적으로 사용하지 않는다.**[* [아리 기본 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=134209&vtype=pc)] 상대의 이동기가 빠졌거나 막타 동작으로 움직임이 고정됐을 때 쓰면 적중률이 높다. 시야가 없거나 돌진형 상대가 접근할 수 있는 상황에서는 매혹을 견제에 소모하지 않고, 진입을 끊는 용도로 보유하는 편이 라인 유지에 도움이 된다.

## `W`의 이동 속도로 교환을 끊는다

**여우불은 추가 피해뿐 아니라 잠깐의 이동 속도를 주는 기술이다.** 평타나 `Q`로 교환을 시작한 뒤 `W`의 속도로 상대 사거리 밖으로 빠지면 일방적인 짧은 교환을 만들기 쉽다. 반대로 `W`를 켜고 오래 추격하면 미니언 피해와 정글 개입에 노출된다.

## 라인을 밀 때와 싸울 때의 `Q`를 구분한다

**초반부터 모든 `Q`를 미니언과 챔피언에게 동시에 맞히려 하면 마나와 체력을 함께 잃기 쉽다.** 라인을 밀 목적이라면 먼저 강가 시야와 상대 위치를 확인하고, 싸울 목적이라면 미니언 체력이 낮아 상대가 막타를 치는 순간을 노린다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-ahri-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 라인 정리와 챔피언 견제를 한 번에 욕심내지 않는다 · Q 정신 집중은 상대 핵심 기술이 빠진 뒤에 한다 · 앞 W는 견제가 아니라 맞대결을 여는 선택이다

## 라인 정리와 챔피언 견제를 한 번에 욕심내지 않는다

**아우렐리온 솔은 `Q`를 미니언에 쓰는 동안 같은 기술로 상대를 견제하기 어렵다.**[* [아우솔 라인전 상대법 및 라인전 개념](https://www.inven.co.kr/board/lol/3370/568546?my=chu)] 상대와 웨이브를 억지로 한 줄에 세우려다 앞으로 나가기보다, 라인을 정리할지 체력을 압박할지 먼저 고른다. 상대가 두 일을 동시에 하는 기술로 압박하면 미니언을 우선 챙긴다.

## `Q` 정신 집중은 상대 핵심 기술이 빠진 뒤에 한다

**빛의 숨결을 오래 유지하는 동안 아우렐리온 솔은 자리에 멈춰 표적이 된다.**[* [아우렐리온 솔 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=130)] 상대의 제어기나 강한 견제기가 남아 있을 때 폭발 피해 한 번을 더 보겠다고 버티지 않는다. 기술이 빠졌거나 `E`로 이동 경로가 제한된 순간에만 길게 유지한다.

## 앞 `W`는 견제가 아니라 맞대결을 여는 선택이다

**상대 쪽으로 별의 비행을 쓰며 `Q`를 이어가면 강한 지속 교환이 가능하지만, 짧게 때리고 바로 빠지는 기술은 아니다.** 상대 체력이 충분하거나 제어기가 남았으면 오히려 도착 경로에서 끊긴다. 먼저 원거리에서 체력을 줄이고 상대의 핵심 기술이 빠진 뒤 사용한다.

## 별가루보다 체력과 웨이브를 먼저 지킨다

**`E` 안의 미니언과 `Q` 적중으로 별가루를 얻더라도, 그 과정에서 체력을 크게 잃으면 다음 웨이브를 먹지 못한다.** 위험한 미니언 몇 개는 포기하고 라인을 아군 쪽으로 받아 성장 시간을 확보한다. 초반에 쓰러지지 않는 것이 가장 안정적인 성장 수단이다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-f1945b6e-3dee-45ee-b457-00c5384aa05c' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-f1945b6e-3dee-45ee-b457-00c5384aa05c') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-f1945b6e-3dee-45ee-b457-00c5384aa05c' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-aurelionsol-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-aurelionsol-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-f1945b6e-3dee-45ee-b457-00c5384aa05c' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 라인 정리와 챔피언 견제를 한 번에 욕심내지 않는다 · Q 정신 집중은 상대 핵심 기술이 빠진 뒤에 한다 · 앞 W는 견제가 아니라 맞대결을 여는 선택이다

## 라인 정리와 챔피언 견제를 한 번에 욕심내지 않는다

**아우렐리온 솔은 `Q`를 미니언에 쓰는 동안 같은 기술로 상대를 견제하기 어렵다.**[* [아우솔 라인전 상대법 및 라인전 개념](https://www.inven.co.kr/board/lol/3370/568546?my=chu)] 상대와 웨이브를 억지로 한 줄에 세우려다 앞으로 나가기보다, 라인을 정리할지 체력을 압박할지 먼저 고른다. 상대가 두 일을 동시에 하는 기술로 압박하면 미니언을 우선 챙긴다.

## `Q` 정신 집중은 상대 핵심 기술이 빠진 뒤에 한다

**빛의 숨결을 오래 유지하는 동안 아우렐리온 솔은 자리에 멈춰 표적이 된다.**[* [아우렐리온 솔 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=130)] 상대의 제어기나 강한 견제기가 남아 있을 때 폭발 피해 한 번을 더 보겠다고 버티지 않는다. 기술이 빠졌거나 `E`로 이동 경로가 제한된 순간에만 길게 유지한다.

## 앞 `W`는 견제가 아니라 맞대결을 여는 선택이다

**상대 쪽으로 별의 비행을 쓰며 `Q`를 이어가면 강한 지속 교환이 가능하지만, 짧게 때리고 바로 빠지는 기술은 아니다.** 상대 체력이 충분하거나 제어기가 남았으면 오히려 도착 경로에서 끊긴다. 먼저 원거리에서 체력을 줄이고 상대의 핵심 기술이 빠진 뒤 사용한다.

## 별가루보다 체력과 웨이브를 먼저 지킨다

**`E` 안의 미니언과 `Q` 적중으로 별가루를 얻더라도, 그 과정에서 체력을 크게 잃으면 다음 웨이브를 먹지 못한다.** 위험한 미니언 몇 개는 포기하고 라인을 아군 쪽으로 받아 성장 시간을 확보한다. 초반에 쓰러지지 않는 것이 가장 안정적인 성장 수단이다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-aurelionsol-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 병사를 상대가 막타를 칠 자리에 둔다 · Q는 피해 기술이면서 병사 전체의 위치 변경이다 · 돌진 상대와 병사를 일직선으로 둔다

## 병사를 상대가 막타를 칠 자리에 둔다

**모래 병사는 소환한 위치 주변을 공격한다.**[* [아지르 기본·라인전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139602)] 상대 몸에 바로 붙이기보다 체력이 낮은 미니언 옆에 두면 상대가 막타와 견제 회피 중 하나를 선택하게 만들 수 있다. 병사의 공격은 일직선으로 관통하므로 미니언과 상대를 같은 선에 두는 각을 찾는다.

## `Q`는 피해 기술이면서 병사 전체의 위치 변경이다

**`W`-`Q`-공격은 짧은 견제에 좋지만, `Q`를 사용하면 모든 병사가 이동해 기존 압박 구역과 `E`의 도착점이 바뀐다.**[* [아지르 라인전 콤보와 운영](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144745&vtype=pc)] 상대 이동기가 남았거나 정글러 위치가 보이지 않을 때 `Q`를 먼저 쓰지 않고 병사 기본 공격으로 압박한다. 상대가 물러날 때 마지막으로 `Q`를 사용하면 퇴로를 지키기 쉽다.

## 돌진 상대와 병사를 일직선으로 둔다

**상대가 들어올 때 아지르와 병사 사이에 상대가 놓이도록 서면, 병사 공격을 이어가면서 `E`의 보호막과 충돌 피해도 활용할 수 있다.** 다만 `E`는 적 챔피언과 부딪히면 이동이 멈추므로, 도주 목적으로 쓸 때 적이 경로를 막는지 확인한다.

## 병사 범위 밖까지 추격하지 않는다

**아지르의 강한 지속 피해는 상대가 병사 공격 범위에 머물 때 나온다.** 체력이 조금 남았다고 병사를 뒤에 두고 본체만 앞으로 걸으면 평범한 원거리 챔피언이 된다. 상대가 범위를 벗어나면 라인 주도권과 체력 이득을 챙기고 멈춘다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-5fc0f788-ca1b-4024-86b9-1d459c56490c' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-5fc0f788-ca1b-4024-86b9-1d459c56490c') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-5fc0f788-ca1b-4024-86b9-1d459c56490c' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-azir-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-azir-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-5fc0f788-ca1b-4024-86b9-1d459c56490c' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 병사를 상대가 막타를 칠 자리에 둔다 · Q는 피해 기술이면서 병사 전체의 위치 변경이다 · 돌진 상대와 병사를 일직선으로 둔다

## 병사를 상대가 막타를 칠 자리에 둔다

**모래 병사는 소환한 위치 주변을 공격한다.**[* [아지르 기본·라인전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139602)] 상대 몸에 바로 붙이기보다 체력이 낮은 미니언 옆에 두면 상대가 막타와 견제 회피 중 하나를 선택하게 만들 수 있다. 병사의 공격은 일직선으로 관통하므로 미니언과 상대를 같은 선에 두는 각을 찾는다.

## `Q`는 피해 기술이면서 병사 전체의 위치 변경이다

**`W`-`Q`-공격은 짧은 견제에 좋지만, `Q`를 사용하면 모든 병사가 이동해 기존 압박 구역과 `E`의 도착점이 바뀐다.**[* [아지르 라인전 콤보와 운영](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144745&vtype=pc)] 상대 이동기가 남았거나 정글러 위치가 보이지 않을 때 `Q`를 먼저 쓰지 않고 병사 기본 공격으로 압박한다. 상대가 물러날 때 마지막으로 `Q`를 사용하면 퇴로를 지키기 쉽다.

## 돌진 상대와 병사를 일직선으로 둔다

**상대가 들어올 때 아지르와 병사 사이에 상대가 놓이도록 서면, 병사 공격을 이어가면서 `E`의 보호막과 충돌 피해도 활용할 수 있다.** 다만 `E`는 적 챔피언과 부딪히면 이동이 멈추므로, 도주 목적으로 쓸 때 적이 경로를 막는지 확인한다.

## 병사 범위 밖까지 추격하지 않는다

**아지르의 강한 지속 피해는 상대가 병사 공격 범위에 머물 때 나온다.** 체력이 조금 남았다고 병사를 뒤에 두고 본체만 앞으로 걸으면 평범한 원거리 챔피언이 된다. 상대가 범위를 벗어나면 라인 주도권과 체력 이득을 챙기고 멈춘다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-azir-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 막타보다 체력과 기력을 남긴다 · 장막은 두 번째 체력처럼 아낀다 · E를 맞힌 것과 따라가는 것은 별개다

## 막타보다 체력과 기력을 남긴다

**원거리 상대 앞에서 모든 CS를 기본 공격으로 먹으려 하면 정작 진입할 레벨에 체력이 없다.**[* [\[별길잡이\] 아칼리의 모든 것!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142641)] 위험한 막타는 `Q`로 챙기고, 사거리 끝으로 상대를 맞힌 뒤 패시브 원을 빠져나갈 공간이 있을 때만 교환한다. `Q`를 맞혔다고 계속 붙지 말고 원 밖으로 나갔다가 강화 공격으로 돌아오는 리듬을 만든다.

## 장막은 두 번째 체력처럼 아낀다

**`W`는 몸을 숨기는 동시에 다음 공격에 쓸 기력을 돌려주는 핵심 수단이다.**[* [\[버프\] 마나가 안 닳는 에코!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142976&vtype=pc)] 먼저 장막을 쓰고 억지로 들어가면, 교환 뒤 상대 정글을 만났을 때 버틸 방법이 없다. 장막 안에서도 같은 자리에 머물지 말고 방향을 바꾸며 상대의 광역 스킬을 흘린다. 장막이 빠진 다음 웨이브에는 같은 강도로 싸우지 않는다.

## `E`를 맞힌 것과 따라가는 것은 별개다

**표창곡예가 맞아도 상대가 포탑이나 정글 쪽으로 빠지면 재사용하지 않는다.** `E`2는 강한 추격기지만 돌아오는 버튼은 아니다. 진입 전 상대의 주요 방해 스킬, 적 미니언 수, 장막 유무를 함께 확인한다. 상대가 견제기를 미니언에 썼을 때 짧게 `Q`와 강화 공격만 넣고 빠지는 교환도 충분하다.

## 로밍은 억지 푸시보다 좋은 웨이브에서

**아칼리는 라인을 무조건 빨리 지우기보다 체력과 기력을 보존하며 움직일 파동을 고르는 편이 안전하다.** 웨이브를 상대 포탑에 넣었거나 상대가 귀환한 순간에 강가를 본다. 먼저 사라지겠다고 큰 웨이브를 버리면 실패한 로밍 뒤 성장이 끊긴다. 가능하면 정글과 같은 방향으로 움직여 짧은 교전을 만든다.', revision = 5, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-akali-20260911' AND kind = 'article' AND revision = 4
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-akali-20260911') = 4
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-akali-20260911' AND revision = 4 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-akali-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-akali-20260913', id, NULL, 4, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 5
FROM wiki_docs WHERE id = 'doc-ai-champion-akali-20260911' AND revision = 5
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 막타보다 체력과 기력을 남긴다 · 장막은 두 번째 체력처럼 아낀다 · E를 맞힌 것과 따라가는 것은 별개다

## 막타보다 체력과 기력을 남긴다

**원거리 상대 앞에서 모든 CS를 기본 공격으로 먹으려 하면 정작 진입할 레벨에 체력이 없다.**[* [\[별길잡이\] 아칼리의 모든 것!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142641)] 위험한 막타는 `Q`로 챙기고, 사거리 끝으로 상대를 맞힌 뒤 패시브 원을 빠져나갈 공간이 있을 때만 교환한다. `Q`를 맞혔다고 계속 붙지 말고 원 밖으로 나갔다가 강화 공격으로 돌아오는 리듬을 만든다.

## 장막은 두 번째 체력처럼 아낀다

**`W`는 몸을 숨기는 동시에 다음 공격에 쓸 기력을 돌려주는 핵심 수단이다.**[* [\[버프\] 마나가 안 닳는 에코!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142976&vtype=pc)] 먼저 장막을 쓰고 억지로 들어가면, 교환 뒤 상대 정글을 만났을 때 버틸 방법이 없다. 장막 안에서도 같은 자리에 머물지 말고 방향을 바꾸며 상대의 광역 스킬을 흘린다. 장막이 빠진 다음 웨이브에는 같은 강도로 싸우지 않는다.

## `E`를 맞힌 것과 따라가는 것은 별개다

**표창곡예가 맞아도 상대가 포탑이나 정글 쪽으로 빠지면 재사용하지 않는다.** `E`2는 강한 추격기지만 돌아오는 버튼은 아니다. 진입 전 상대의 주요 방해 스킬, 적 미니언 수, 장막 유무를 함께 확인한다. 상대가 견제기를 미니언에 썼을 때 짧게 `Q`와 강화 공격만 넣고 빠지는 교환도 충분하다.

## 로밍은 억지 푸시보다 좋은 웨이브에서

**아칼리는 라인을 무조건 빨리 지우기보다 체력과 기력을 보존하며 움직일 파동을 고르는 편이 안전하다.** 웨이브를 상대 포탑에 넣었거나 상대가 귀환한 순간에 강가를 본다. 먼저 사라지겠다고 큰 웨이브를 버리면 실패한 로밍 뒤 성장이 끊긴다. 가능하면 정글과 같은 방향으로 움직여 짧은 교전을 만든다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-akali-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q 막타로 마나와 기절 중첩을 함께 관리한다 · 세 중첩에서 E로 기절을 숨긴다 · 긴 기본 공격 사거리는 상대 기술이 빠졌을 때 활용한다

## `Q` 막타로 마나와 기절 중첩을 함께 관리한다

**붕괴로 미니언을 처치하면 사용한 마나를 돌려받는다.**[* [마스터 티어 애니 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145212)] 평타로 체력을 맞춘 뒤 `Q`로 막타를 챙기면 큰 비용 없이 방화광 중첩을 쌓을 수 있다. 상대를 맞히기 위해 `Q`를 남발해 막타와 마나를 동시에 잃지 않는다.

## 세 중첩에서 `E`로 기절을 숨긴다

**기절이 완전히 준비된 상태로 오래 서 있으면 상대는 거리를 벌린다.** 세 중첩을 유지하다 상대가 막타를 치러 들어오는 순간 `E`를 사용해 네 번째 중첩을 만들면 갑자기 기절 위협을 만들 수 있다. 다만 `E`가 필요한 생존 상황이라면 이 공격에 먼저 소모하지 않는다.

## 긴 기본 공격 사거리는 상대 기술이 빠졌을 때 활용한다

**애니는 기본 공격으로 견제하기 좋지만, 적 챔피언을 때리면 미니언 어그로가 붙는다.** 상대의 핵심 기술이 빠진 순간 한 대를 치고 즉시 뒤로 빠져 어그로를 끊는다. 한 번 더 치려고 웨이브 안에 남으면 받은 피해가 더 커질 수 있다.

## 사거리가 긴 상대에게 억지로 먼저 걸지 않는다

**애니보다 긴 거리에서 견제하는 상대에게 정면으로 걸어가면 체력을 잃고 시작한다.** 기절을 보유한 채 미니언을 챙기고, 상대가 라인 정리 기술을 쓴 순간이나 정글러가 도착했을 때 확정 제어를 연결한다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-65d0b98e-aca6-4035-a3bf-d7fd4faa29cf' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-65d0b98e-aca6-4035-a3bf-d7fd4faa29cf') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-65d0b98e-aca6-4035-a3bf-d7fd4faa29cf' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-annie-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-annie-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-65d0b98e-aca6-4035-a3bf-d7fd4faa29cf' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q 막타로 마나와 기절 중첩을 함께 관리한다 · 세 중첩에서 E로 기절을 숨긴다 · 긴 기본 공격 사거리는 상대 기술이 빠졌을 때 활용한다

## `Q` 막타로 마나와 기절 중첩을 함께 관리한다

**붕괴로 미니언을 처치하면 사용한 마나를 돌려받는다.**[* [마스터 티어 애니 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145212)] 평타로 체력을 맞춘 뒤 `Q`로 막타를 챙기면 큰 비용 없이 방화광 중첩을 쌓을 수 있다. 상대를 맞히기 위해 `Q`를 남발해 막타와 마나를 동시에 잃지 않는다.

## 세 중첩에서 `E`로 기절을 숨긴다

**기절이 완전히 준비된 상태로 오래 서 있으면 상대는 거리를 벌린다.** 세 중첩을 유지하다 상대가 막타를 치러 들어오는 순간 `E`를 사용해 네 번째 중첩을 만들면 갑자기 기절 위협을 만들 수 있다. 다만 `E`가 필요한 생존 상황이라면 이 공격에 먼저 소모하지 않는다.

## 긴 기본 공격 사거리는 상대 기술이 빠졌을 때 활용한다

**애니는 기본 공격으로 견제하기 좋지만, 적 챔피언을 때리면 미니언 어그로가 붙는다.** 상대의 핵심 기술이 빠진 순간 한 대를 치고 즉시 뒤로 빠져 어그로를 끊는다. 한 번 더 치려고 웨이브 안에 남으면 받은 피해가 더 커질 수 있다.

## 사거리가 긴 상대에게 억지로 먼저 걸지 않는다

**애니보다 긴 거리에서 견제하는 상대에게 정면으로 걸어가면 체력을 잃고 시작한다.** 기절을 보유한 채 미니언을 챙기고, 상대가 라인 정리 기술을 쓴 순간이나 정글러가 도착했을 때 확정 제어를 연결한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-annie-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 지나갈 때와 폭발할 때 두 번 맞힌다 · Q는 견제기이면서 생존기다 · 벽은 적을 맞히는 기술보다 길을 줄이는 기술이다

## `Q`는 지나갈 때와 폭발할 때 두 번 맞힌다

**냉기 폭발은 적을 통과할 때 피해를 주고 재사용해 터뜨릴 수 있다.**[* [초심자를 위한 애니비아](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=120543&vtype=pc)] 무조건 최대 거리까지 보내기보다 상대 몸을 지난 직후 폭발시켜 두 번의 피해와 기절을 노린다. 투사체가 느리므로 상대가 막타를 치거나 벽 때문에 이동 방향이 제한된 순간이 좋다.

## `Q`는 견제기이면서 생존기다

**돌진형 상대나 정글러가 보이지 않을 때 `Q`를 멀리 던지면 되돌아올 때까지 자신을 지킬 방법이 적다.**[* [쉽고 빠른 애니비아](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142233)] 먼저 던져 맞히려 하기보다 상대가 들어오는 방향으로 사용하면 적중도 쉽고 `E`를 연결할 시간도 생긴다.

## 벽은 적을 맞히는 기술보다 길을 줄이는 기술이다

**상대 바로 아래에 벽을 세우려 하면 방향을 잘못 밀어낼 수 있다.** 먼저 벽으로 퇴로 한쪽을 막고, 남은 길에 `Q`를 보내는 방식이 안정적이다. 아군 정글러의 진입로까지 막을 수 있으므로 어느 쪽으로 밀릴지 확인한다.

## 강화 `E`는 냉기가 묻은 뒤 사용한다

**동상은 `Q` 기절이나 충분히 형성된 궁극기로 냉기가 묻은 대상에게 강해진다.** 냉기 없이 `E`부터 던지는 교환은 마나 대비 효율이 낮다. 궁극기를 라인에 오래 유지할 때는 상대 정글러가 들어올 경로와 남은 마나를 함께 본다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-7f7d1f23-aefd-455d-995a-3d8fbb3539e5' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-7f7d1f23-aefd-455d-995a-3d8fbb3539e5') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-7f7d1f23-aefd-455d-995a-3d8fbb3539e5' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-anivia-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-anivia-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-7f7d1f23-aefd-455d-995a-3d8fbb3539e5' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 지나갈 때와 폭발할 때 두 번 맞힌다 · Q는 견제기이면서 생존기다 · 벽은 적을 맞히는 기술보다 길을 줄이는 기술이다

## `Q`는 지나갈 때와 폭발할 때 두 번 맞힌다

**냉기 폭발은 적을 통과할 때 피해를 주고 재사용해 터뜨릴 수 있다.**[* [초심자를 위한 애니비아](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=120543&vtype=pc)] 무조건 최대 거리까지 보내기보다 상대 몸을 지난 직후 폭발시켜 두 번의 피해와 기절을 노린다. 투사체가 느리므로 상대가 막타를 치거나 벽 때문에 이동 방향이 제한된 순간이 좋다.

## `Q`는 견제기이면서 생존기다

**돌진형 상대나 정글러가 보이지 않을 때 `Q`를 멀리 던지면 되돌아올 때까지 자신을 지킬 방법이 적다.**[* [쉽고 빠른 애니비아](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142233)] 먼저 던져 맞히려 하기보다 상대가 들어오는 방향으로 사용하면 적중도 쉽고 `E`를 연결할 시간도 생긴다.

## 벽은 적을 맞히는 기술보다 길을 줄이는 기술이다

**상대 바로 아래에 벽을 세우려 하면 방향을 잘못 밀어낼 수 있다.** 먼저 벽으로 퇴로 한쪽을 막고, 남은 길에 `Q`를 보내는 방식이 안정적이다. 아군 정글러의 진입로까지 막을 수 있으므로 어느 쪽으로 밀릴지 확인한다.

## 강화 `E`는 냉기가 묻은 뒤 사용한다

**동상은 `Q` 기절이나 충분히 형성된 궁극기로 냉기가 묻은 대상에게 강해진다.** 냉기 없이 `E`부터 던지는 교환은 마나 대비 효율이 낮다. 궁극기를 라인에 오래 유지할 때는 상대 정글러가 들어올 경로와 남은 마나를 함께 본다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-anivia-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 회수 경로까지 보고 다시 누른다 · W는 진입기이자 이탈기다 · E의 뒤로 뛰는 거리를 계산한다

## `Q`는 회수 경로까지 보고 다시 누른다

**첫 `Q`로 표식을 묻힌 뒤 바로 회수하기보다, 한두 걸음 옆으로 움직여 돌아오는 투사체가 상대와 미니언을 함께 지나게 만든다.**[* [미드 오로라 완벽 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148099)] 상대가 회수 경로를 피하려 움직이는 것 자체로 막타 위치를 제한할 수 있다. 회수 각이 없으면 더 깊이 따라가지 않는다.

## `W`는 진입기이자 이탈기다

**`W`의 도약과 투명화는 핵심 기술 하나를 피하거나 짧은 교환 뒤 시야를 끊는 데 유용하다.**[* [오로라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=168)] 피해를 더 넣기 위해 먼저 사용하면 돌아올 수단이 없어지며, 투명화가 광역 피해까지 막아 주는 것은 아니다. 상대의 위치와 남은 기술을 확인하고 사용한다.

## `E`의 뒤로 뛰는 거리를 계산한다

**`E`는 피해와 둔화를 주면서 오로라를 뒤로 이동시켜 짧은 교환을 끝내기 좋다.** 다만 등을 강가나 적 정글 쪽으로 두고 사용하면 위험한 방향으로 넘어갈 수 있다. 교환을 시작하기 전에 `E` 사용 뒤 도착할 지점을 먼저 본다.

## 세 번째 적중을 위해 무리하지 않는다

**지속 효과를 완성하면 이득이 크지만 마지막 한 번을 넣으려고 미니언을 넘어가면 상대의 전체 연계를 맞을 수 있다.** 안전한 `Q` 회수나 기본 공격 각이 아니면 교환을 끊고 다음 주기를 기다린다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-2899fe45-3c51-4058-9487-26242464d8de' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-2899fe45-3c51-4058-9487-26242464d8de') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-2899fe45-3c51-4058-9487-26242464d8de' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-aurora-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-aurora-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-2899fe45-3c51-4058-9487-26242464d8de' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 회수 경로까지 보고 다시 누른다 · W는 진입기이자 이탈기다 · E의 뒤로 뛰는 거리를 계산한다

## `Q`는 회수 경로까지 보고 다시 누른다

**첫 `Q`로 표식을 묻힌 뒤 바로 회수하기보다, 한두 걸음 옆으로 움직여 돌아오는 투사체가 상대와 미니언을 함께 지나게 만든다.**[* [미드 오로라 완벽 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148099)] 상대가 회수 경로를 피하려 움직이는 것 자체로 막타 위치를 제한할 수 있다. 회수 각이 없으면 더 깊이 따라가지 않는다.

## `W`는 진입기이자 이탈기다

**`W`의 도약과 투명화는 핵심 기술 하나를 피하거나 짧은 교환 뒤 시야를 끊는 데 유용하다.**[* [오로라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=168)] 피해를 더 넣기 위해 먼저 사용하면 돌아올 수단이 없어지며, 투명화가 광역 피해까지 막아 주는 것은 아니다. 상대의 위치와 남은 기술을 확인하고 사용한다.

## `E`의 뒤로 뛰는 거리를 계산한다

**`E`는 피해와 둔화를 주면서 오로라를 뒤로 이동시켜 짧은 교환을 끝내기 좋다.** 다만 등을 강가나 적 정글 쪽으로 두고 사용하면 위험한 방향으로 넘어갈 수 있다. 교환을 시작하기 전에 `E` 사용 뒤 도착할 지점을 먼저 본다.

## 세 번째 적중을 위해 무리하지 않는다

**지속 효과를 완성하면 이득이 크지만 마지막 한 번을 넣으려고 미니언을 넘어가면 상대의 전체 연계를 맞을 수 있다.** 안전한 `Q` 회수나 기본 공격 각이 아니면 교환을 끊고 다음 주기를 기다린다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-aurora-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 공의 위치가 실제 사거리다 · Q는 여러 대상을 통과할수록 피해가 줄어든다 · W는 공을 먼저 놓은 뒤 사용한다

## 공의 위치가 실제 사거리다

**`Q` 사거리 밖을 클릭하면 공만 가는 것이 아니라 오리아나가 앞으로 걸어갈 수 있다.**[* [11.2 오리아나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144290&vtype=pc)] 최대 거리 견제를 시도하다 상대의 제어기 안으로 들어가는 실수가 잦으므로, 공과 상대 사이의 거리를 기준으로 명령한다. 위험한 쪽에 공을 오래 두면 자신을 지킬 `E`도 늦어진다.

## `Q`는 여러 대상을 통과할수록 피해가 줄어든다

**웨이브 전체를 관통해 상대를 맞히는 `Q`는 견제 피해가 낮아진다.**[* [오리아나 완벽 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140796&vtype=pc)] 상대 체력을 깎을 때는 미니언 옆에서 공이 직접 닿는 각을 만들고, 웨이브를 밀 때는 챔피언 적중을 억지로 욕심내지 않는다.

## `W`는 공을 먼저 놓은 뒤 사용한다

**`W`의 둔화와 피해는 공 주변에서 발생한다.** `Q`가 빗나갔는데 `W`까지 바로 누르면 마나만 쓰고 두 기술이 함께 빈다. 공이 상대의 이동 경로에 놓였거나 `E`로 돌아오는 길에 상대를 지나갈 때 사용해 교환을 확정한다.

## `E`로 교환을 끝내며 공을 회수한다

**`E`는 보호막을 주고 공이 돌아오는 경로의 적에게 피해를 준다.** `Q`-`W` 견제 뒤 상대가 반격할 때 `E`로 보호막을 받으며 공을 회수하면 손해를 줄일 수 있다. 공이 돌아온 뒤에는 압박 가능한 위치가 달라졌다는 점을 잊지 않는다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-0d4c7c07-b905-472f-9b4a-b4a94f0f08cb' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-0d4c7c07-b905-472f-9b4a-b4a94f0f08cb') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-0d4c7c07-b905-472f-9b4a-b4a94f0f08cb' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-orianna-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-orianna-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-0d4c7c07-b905-472f-9b4a-b4a94f0f08cb' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 공의 위치가 실제 사거리다 · Q는 여러 대상을 통과할수록 피해가 줄어든다 · W는 공을 먼저 놓은 뒤 사용한다

## 공의 위치가 실제 사거리다

**`Q` 사거리 밖을 클릭하면 공만 가는 것이 아니라 오리아나가 앞으로 걸어갈 수 있다.**[* [11.2 오리아나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144290&vtype=pc)] 최대 거리 견제를 시도하다 상대의 제어기 안으로 들어가는 실수가 잦으므로, 공과 상대 사이의 거리를 기준으로 명령한다. 위험한 쪽에 공을 오래 두면 자신을 지킬 `E`도 늦어진다.

## `Q`는 여러 대상을 통과할수록 피해가 줄어든다

**웨이브 전체를 관통해 상대를 맞히는 `Q`는 견제 피해가 낮아진다.**[* [오리아나 완벽 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140796&vtype=pc)] 상대 체력을 깎을 때는 미니언 옆에서 공이 직접 닿는 각을 만들고, 웨이브를 밀 때는 챔피언 적중을 억지로 욕심내지 않는다.

## `W`는 공을 먼저 놓은 뒤 사용한다

**`W`의 둔화와 피해는 공 주변에서 발생한다.** `Q`가 빗나갔는데 `W`까지 바로 누르면 마나만 쓰고 두 기술이 함께 빈다. 공이 상대의 이동 경로에 놓였거나 `E`로 돌아오는 길에 상대를 지나갈 때 사용해 교환을 확정한다.

## `E`로 교환을 끝내며 공을 회수한다

**`E`는 보호막을 주고 공이 돌아오는 경로의 적에게 피해를 준다.** `Q`-`W` 견제 뒤 상대가 반격할 때 `E`로 보호막을 받으며 공을 회수하면 손해를 줄일 수 있다. 공이 돌아온 뒤에는 압박 가능한 위치가 달라졌다는 점을 잊지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-orianna-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 1~2레벨은 Q로 체력을 지킨다 · 그림자는 견제와 탈출 중 하나다 · 기력까지 있어야 한 콤보다

## 1~2레벨은 `Q`로 체력을 지킨다

**원거리 상대에게 모든 막타를 기본 공격으로 먹으려 하면 그림자를 배우기 전에 체력이 먼저 무너진다.**[* [보이지 않는 검이 가장 무서운 법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=1461841&view=p)] 위험한 CS는 `Q`로 챙기고, 상대가 막타를 치느라 멈추는 순간에만 표창을 겹친다. 미니언을 먼저 맞은 `Q`는 압박이 약해지므로 챔피언과의 직선 사이에 무엇이 있는지도 본다.

## 그림자는 견제와 탈출 중 하나다

**`W`로 그림자를 앞으로 보낸 순간에는 같은 스킬이 도주로에서 빠진다.**[* [내 경험을 토대로 써보는 제드 공략글](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115630&vtype=pc)] 상대 정글이 보이지 않거나 강가 시야가 없으면 그림자 견제 뒤에 한 걸음 물러난다. 그림자가 상대 곁에 있다고 무조건 자리를 바꾸지 말고, 본체와 그림자의 `Q` 각이 모두 열릴 때만 교환한다. 빗나갔다면 추가 진입으로 손해를 만회하려 하지 않는다.

## 기력까지 있어야 한 콤보다

**본체와 그림자가 같은 대상을 맞히면 기력을 되찾지만, 하나만 맞히는 견제를 반복하면 다음 교환이 비게 된다.** 궁극기가 있어도 기력이 부족하면 착지 뒤 이어 갈 공격이 없다. 라인을 지울 때와 상대를 노릴 때 쓸 기력을 구분하고, `W`가 돌아오기 전에는 짧은 `Q` 파밍으로 다음 기회를 기다린다.

## 밀었을 때만 시야 밖으로 나간다

**제드는 라인을 먼저 정리하면 강가 합류와 로밍 두 선택을 상대에게 동시에 보여 줄 수 있다.** 반대로 웨이브를 남겨 두고 사라졌다가 성과 없이 돌아오면 경험치 손해가 크다. 이동 전에는 상대 미드가 따라올 길과 아군 정글 위치를 보고, 혼자 깊이 들어가기보다 정글과 같은 방향으로 움직인다.', revision = 5, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-zed-20260911' AND kind = 'article' AND revision = 4
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-zed-20260911') = 4
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-zed-20260911' AND revision = 4 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-zed-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-zed-20260913', id, NULL, 4, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 5
FROM wiki_docs WHERE id = 'doc-ai-champion-zed-20260911' AND revision = 5
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 1~2레벨은 Q로 체력을 지킨다 · 그림자는 견제와 탈출 중 하나다 · 기력까지 있어야 한 콤보다

## 1~2레벨은 `Q`로 체력을 지킨다

**원거리 상대에게 모든 막타를 기본 공격으로 먹으려 하면 그림자를 배우기 전에 체력이 먼저 무너진다.**[* [보이지 않는 검이 가장 무서운 법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=1461841&view=p)] 위험한 CS는 `Q`로 챙기고, 상대가 막타를 치느라 멈추는 순간에만 표창을 겹친다. 미니언을 먼저 맞은 `Q`는 압박이 약해지므로 챔피언과의 직선 사이에 무엇이 있는지도 본다.

## 그림자는 견제와 탈출 중 하나다

**`W`로 그림자를 앞으로 보낸 순간에는 같은 스킬이 도주로에서 빠진다.**[* [내 경험을 토대로 써보는 제드 공략글](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115630&vtype=pc)] 상대 정글이 보이지 않거나 강가 시야가 없으면 그림자 견제 뒤에 한 걸음 물러난다. 그림자가 상대 곁에 있다고 무조건 자리를 바꾸지 말고, 본체와 그림자의 `Q` 각이 모두 열릴 때만 교환한다. 빗나갔다면 추가 진입으로 손해를 만회하려 하지 않는다.

## 기력까지 있어야 한 콤보다

**본체와 그림자가 같은 대상을 맞히면 기력을 되찾지만, 하나만 맞히는 견제를 반복하면 다음 교환이 비게 된다.** 궁극기가 있어도 기력이 부족하면 착지 뒤 이어 갈 공격이 없다. 라인을 지울 때와 상대를 노릴 때 쓸 기력을 구분하고, `W`가 돌아오기 전에는 짧은 `Q` 파밍으로 다음 기회를 기다린다.

## 밀었을 때만 시야 밖으로 나간다

**제드는 라인을 먼저 정리하면 강가 합류와 로밍 두 선택을 상대에게 동시에 보여 줄 수 있다.** 반대로 웨이브를 남겨 두고 사라졌다가 성과 없이 돌아오면 경험치 손해가 크다. 이동 전에는 상대 미드가 따라올 길과 아군 정글 위치를 보고, 혼자 깊이 들어가기보다 정글과 같은 방향으로 움직인다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-zed-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 첫 몇 발은 피해보다 무빙 습관을 알아보는 데 쓴다 · W의 중심 둔화가 다음 기술의 출발점이다 · Q를 충전하는 위치부터 숨긴다

## 첫 몇 발은 피해보다 무빙 습관을 알아보는 데 쓴다

**상대가 `Q`를 피할 때 늘 같은 방향으로 움직이는지, 막타 직전에 멈추는지 먼저 본다.**[* [제라스 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132556)] 처음부터 최대 사거리 예측 사격만 반복하기보다 상대의 회피 방향을 확인한 뒤 다음 기술을 그쪽에 놓는다. 미니언을 먹는 순간은 이동 선택지가 가장 적다.

## `W`의 중심 둔화가 다음 기술의 출발점이다

**`W` 중심부를 맞히면 강한 둔화가 걸려 `Q`나 `E`를 잇기 쉬워진다.**[* [제라스 스킬 활용 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112649&vtype=pc)] 반대로 움직임이 자유로운 상대에게 `E`부터 멀리 던지면 생존 기술까지 함께 잃는다. 돌진기가 있는 상대에게는 `E`를 견제에 쓰지 않고 진입을 끊는 용도로 남겨 둔다.

## `Q`를 충전하는 위치부터 숨긴다

**시야 밖이나 미니언 뒤에서 충전을 시작하면 상대가 방향과 시점을 읽기 어렵다.** 하지만 최대 사거리만 고집하며 같은 자리에서 충전하면 정글러에게 움직임이 그대로 노출된다. 시야가 확보된 쪽으로 자리를 바꾸고, 위험하면 짧게 충전해 바로 이동한다.

## 빠른 라인 정리는 안전한 위치와 함께 만든다

**스킬로 웨이브를 지우면 자연스럽게 라인이 상대 쪽으로 간다.** 도주기가 없는 제라스는 한쪽 강가에 시야를 만들고 그쪽에 가깝게 서야 한다. 양쪽이 모두 보이지 않으면 상대 체력을 깎는 것보다 웨이브가 돌아오도록 기다리는 편이 낫다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-d804656d-2129-4e55-b28c-658608efa1fd' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-d804656d-2129-4e55-b28c-658608efa1fd') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-d804656d-2129-4e55-b28c-658608efa1fd' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-xerath-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-xerath-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-d804656d-2129-4e55-b28c-658608efa1fd' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 첫 몇 발은 피해보다 무빙 습관을 알아보는 데 쓴다 · W의 중심 둔화가 다음 기술의 출발점이다 · Q를 충전하는 위치부터 숨긴다

## 첫 몇 발은 피해보다 무빙 습관을 알아보는 데 쓴다

**상대가 `Q`를 피할 때 늘 같은 방향으로 움직이는지, 막타 직전에 멈추는지 먼저 본다.**[* [제라스 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132556)] 처음부터 최대 사거리 예측 사격만 반복하기보다 상대의 회피 방향을 확인한 뒤 다음 기술을 그쪽에 놓는다. 미니언을 먹는 순간은 이동 선택지가 가장 적다.

## `W`의 중심 둔화가 다음 기술의 출발점이다

**`W` 중심부를 맞히면 강한 둔화가 걸려 `Q`나 `E`를 잇기 쉬워진다.**[* [제라스 스킬 활용 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112649&vtype=pc)] 반대로 움직임이 자유로운 상대에게 `E`부터 멀리 던지면 생존 기술까지 함께 잃는다. 돌진기가 있는 상대에게는 `E`를 견제에 쓰지 않고 진입을 끊는 용도로 남겨 둔다.

## `Q`를 충전하는 위치부터 숨긴다

**시야 밖이나 미니언 뒤에서 충전을 시작하면 상대가 방향과 시점을 읽기 어렵다.** 하지만 최대 사거리만 고집하며 같은 자리에서 충전하면 정글러에게 움직임이 그대로 노출된다. 시야가 확보된 쪽으로 자리를 바꾸고, 위험하면 짧게 충전해 바로 이동한다.

## 빠른 라인 정리는 안전한 위치와 함께 만든다

**스킬로 웨이브를 지우면 자연스럽게 라인이 상대 쪽으로 간다.** 도주기가 없는 제라스는 한쪽 강가에 시야를 만들고 그쪽에 가깝게 서야 한다. 양쪽이 모두 보이지 않으면 상대 체력을 깎는 것보다 웨이브가 돌아오도록 기다리는 편이 낫다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-xerath-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 첫 방향보다 전체 이동 거리가 중요하다 · 수면은 정면보다 벽과 시야 밖에서 강하다 · 궁극기의 출발 지점이 곧 돌아올 자리다

## `Q`는 첫 방향보다 전체 이동 거리가 중요하다

**통통별은 방향을 한 번 바꿀 수 있고 이동한 거리가 길수록 강해진다.**[* [조이 초보자 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145204)] 첫 시전을 뒤로 보내는 습관만 고집하면 상대가 앞으로 들어올 때 도주 공간이 사라진다. 옆으로 보내 각도를 만들거나, 상대가 막타를 치는 순간 짧고 확실하게 맞히는 선택도 필요하다.

## 수면은 정면보다 벽과 시야 밖에서 강하다

**헤롱헤롱쿨쿨방울은 지형을 통과하면 긴 각을 만들 수 있다.**[* [조이 스킬 콤보의 모든 것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139114)] 라인을 민 뒤 강가나 측면 시야에서 던지면 상대가 출발점을 늦게 본다. 정면에서 계속 사용해 빗나가면 상대가 들어올 동안 막을 기술이 없으므로, 시야가 없을 때는 보유한다.

## 궁극기의 출발 지점이 곧 돌아올 자리다

**차원 넘기는 잠깐 앞으로 이동할 뿐 반드시 원래 위치로 돌아온다.** 상대 제어기를 피하지 못한 채 앞으로 쓰면 복귀 지점에 기술이 예약된다. 출발 자리가 안전한지 확인하고, 수면이나 아군 제어가 적중한 뒤 `Q` 각을 늘리는 용도로 사용한다.

## 라인에만 붙어 있기보다 먼저 시야를 잡는다

**조이는 좁은 길과 벽 너머에서 위협이 커진다.** 웨이브를 먼저 정리했다면 상대 포탑 앞에서 무리한 견제를 반복하기보다 정글러와 함께 강가 시야를 잡아 다음 수면 각을 만든다. 라인이 밀려 있는데 먼저 움직이면 경험치 손해가 더 크다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-cc54cdde-cfcc-479d-9737-2b26f152b569' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-cc54cdde-cfcc-479d-9737-2b26f152b569') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-cc54cdde-cfcc-479d-9737-2b26f152b569' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-zoe-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-zoe-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-cc54cdde-cfcc-479d-9737-2b26f152b569' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 첫 방향보다 전체 이동 거리가 중요하다 · 수면은 정면보다 벽과 시야 밖에서 강하다 · 궁극기의 출발 지점이 곧 돌아올 자리다

## `Q`는 첫 방향보다 전체 이동 거리가 중요하다

**통통별은 방향을 한 번 바꿀 수 있고 이동한 거리가 길수록 강해진다.**[* [조이 초보자 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145204)] 첫 시전을 뒤로 보내는 습관만 고집하면 상대가 앞으로 들어올 때 도주 공간이 사라진다. 옆으로 보내 각도를 만들거나, 상대가 막타를 치는 순간 짧고 확실하게 맞히는 선택도 필요하다.

## 수면은 정면보다 벽과 시야 밖에서 강하다

**헤롱헤롱쿨쿨방울은 지형을 통과하면 긴 각을 만들 수 있다.**[* [조이 스킬 콤보의 모든 것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139114)] 라인을 민 뒤 강가나 측면 시야에서 던지면 상대가 출발점을 늦게 본다. 정면에서 계속 사용해 빗나가면 상대가 들어올 동안 막을 기술이 없으므로, 시야가 없을 때는 보유한다.

## 궁극기의 출발 지점이 곧 돌아올 자리다

**차원 넘기는 잠깐 앞으로 이동할 뿐 반드시 원래 위치로 돌아온다.** 상대 제어기를 피하지 못한 채 앞으로 쓰면 복귀 지점에 기술이 예약된다. 출발 자리가 안전한지 확인하고, 수면이나 아군 제어가 적중한 뒤 `Q` 각을 늘리는 용도로 사용한다.

## 라인에만 붙어 있기보다 먼저 시야를 잡는다

**조이는 좁은 길과 벽 너머에서 위협이 커진다.** 웨이브를 먼저 정리했다면 상대 포탑 앞에서 무리한 견제를 반복하기보다 정글러와 함께 강가 시야를 잡아 다음 수면 각을 만든다. 라인이 밀려 있는데 먼저 움직이면 경험치 손해가 더 크다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-zoe-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q를 맞힌 뒤에 E를 반복한다 · W는 현재 위치보다 도착할 길에 깐다 · E 막타로 라인 유지 비용을 줄인다

## `Q`를 맞힌 뒤에 `E`를 반복한다

**쌍독니는 중독된 대상에게 사용할 때 비로소 강한 지속 피해와 회복을 만든다.**[* [카시오페아의 모든 것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141308)] `Q`가 빗나갔는데도 `E`를 연속으로 쓰면 마나만 빠지고 상대의 반격 시간을 길게 준다. 상대가 막타를 치는 순간 `Q`를 노리고, 적중을 확인한 뒤 앞으로 움직일지 결정한다.

## `W`는 현재 위치보다 도착할 길에 깐다

**독기의 늪은 상대를 둔화하고 이동기를 막지만 이미 벗어나는 적의 뒤에 쓰면 의미가 적다.**[* [카시오페아 1000게임 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142456&vtype=pc)] 돌진한 상대의 퇴로나 자신에게 접근하는 길목에 놓아 움직임을 제한한다. 좁은 강가 입구와 미니언 옆길처럼 피할 방향이 적은 곳에서 특히 안정적이다.

## `E` 막타로 라인 유지 비용을 줄인다

**쌍독니로 미니언을 처치하면 마나를 돌려받는다.** 평타와 `E`의 피해를 익혀 막타에 사용하면 라인을 유지하기 쉽다. 모든 미니언에 독을 묻혀 빠르게 밀기보다, 상대 정글러 위치가 보이지 않을 때는 라인이 아군 쪽에 남도록 조절한다.

## 궁극기는 기절하지 않아도 거리를 벌 수 있다

**정면을 보는 적은 기절하지만 등을 돌린 적에게도 둔화가 걸린다.** 완벽한 정면 기절만 기다리다 죽기보다, 상대가 달라붙었을 때 즉시 공간을 만들고 `W`와 `Q`를 이어가는 판단도 필요하다. 여러 방향에서 적이 오는 위치는 피한다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-0e9226b2-5491-42cb-b678-0d9219f200c4' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-0e9226b2-5491-42cb-b678-0d9219f200c4') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-0e9226b2-5491-42cb-b678-0d9219f200c4' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-cassiopeia-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-cassiopeia-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-0e9226b2-5491-42cb-b678-0d9219f200c4' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q를 맞힌 뒤에 E를 반복한다 · W는 현재 위치보다 도착할 길에 깐다 · E 막타로 라인 유지 비용을 줄인다

## `Q`를 맞힌 뒤에 `E`를 반복한다

**쌍독니는 중독된 대상에게 사용할 때 비로소 강한 지속 피해와 회복을 만든다.**[* [카시오페아의 모든 것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141308)] `Q`가 빗나갔는데도 `E`를 연속으로 쓰면 마나만 빠지고 상대의 반격 시간을 길게 준다. 상대가 막타를 치는 순간 `Q`를 노리고, 적중을 확인한 뒤 앞으로 움직일지 결정한다.

## `W`는 현재 위치보다 도착할 길에 깐다

**독기의 늪은 상대를 둔화하고 이동기를 막지만 이미 벗어나는 적의 뒤에 쓰면 의미가 적다.**[* [카시오페아 1000게임 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142456&vtype=pc)] 돌진한 상대의 퇴로나 자신에게 접근하는 길목에 놓아 움직임을 제한한다. 좁은 강가 입구와 미니언 옆길처럼 피할 방향이 적은 곳에서 특히 안정적이다.

## `E` 막타로 라인 유지 비용을 줄인다

**쌍독니로 미니언을 처치하면 마나를 돌려받는다.** 평타와 `E`의 피해를 익혀 막타에 사용하면 라인을 유지하기 쉽다. 모든 미니언에 독을 묻혀 빠르게 밀기보다, 상대 정글러 위치가 보이지 않을 때는 라인이 아군 쪽에 남도록 조절한다.

## 궁극기는 기절하지 않아도 거리를 벌 수 있다

**정면을 보는 적은 기절하지만 등을 돌린 적에게도 둔화가 걸린다.** 완벽한 정면 기절만 기다리다 죽기보다, 상대가 달라붙었을 때 즉시 공간을 만들고 `W`와 `Q`를 이어가는 판단도 필요하다. 여러 방향에서 적이 오는 위치는 피한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-cassiopeia-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 체력을 막타와 바꾸지 않는다 · 앞순보는 정글 위치와 퇴로를 본 뒤 · Q와 단검은 상대 CS 타이밍에 겹친다

## 체력을 막타와 바꾸지 않는다

**카타리나는 초반에 근접 막타 하나 때문에 원거리 견제를 여러 번 맞으면 다음 웨이브부터 선택지가 사라진다.**[* [3500++/ M1 카타할께공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148158&vtype=pc)] `Q`로 안전하게 먹을 수 없는 CS는 버려도 된다. 포션이 있을 때는 체력이 절반 아래로 떨어질 때까지 아끼지 말고, 교전 직전에는 체력을 먼저 복구한다. 라인이 힘들수록 억지 솔로킬보다 강가나 사이드의 작은 싸움에 먼저 합류할 체력을 남긴다.

## 앞순보는 정글 위치와 퇴로를 본 뒤

**상대 정글이 보이지 않으면 적 챔피언이나 앞쪽 단검으로 먼저 순보하지 않는다.**[* [\[M1\] 간단하게 보는 카타리나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147939)] 진입 전 뒤쪽 아군 미니언과 남은 단검처럼 돌아올 대상을 함께 본다. 상대가 견제 스킬을 미니언에 썼더라도 적 미니언이 많으면 `Q`와 단검 피해만 짧게 넣고 빠진다. 킬이 확실하지 않은데 퇴로까지 써 버리는 긴 교환은 피한다.

## `Q`와 단검은 상대 CS 타이밍에 겹친다

**`Q`를 막타기로만 쓰지 말고 상대가 CS를 먹으러 움직일 때 챔피언을 맞혀 뒤쪽에 단검을 만든다.** 상대가 단검을 피해서 CS를 포기하면 그것으로 이득이다. 상대가 단검 위에 남을 때만 순보로 짧게 들어가고, 멀어졌다면 억지로 따라가지 않는다.

## 로밍은 밀고, 정글과 함께

**먼저 라인을 밀어야 움직일 권리가 생긴다.** 맵을 자주 보되 바텀에서 싸움이 날 것 같다는 이유만으로 바로 내려가지는 않는다. 상대 미드와 정글의 위치, 지나갈 길의 와드, 도착했을 때 교전이 계속될지를 확인한다. 가능하면 아군 정글과 같이 움직이고, 상대가 길을 막고 있는데 혼자 강으로 들어가지 않는다. 라인을 밀지 못한 채 실패한 로밍은 미니언과 체력을 모두 잃는 큰 손해다.', revision = 5, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-katarina-20260911' AND kind = 'article' AND revision = 4
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-katarina-20260911') = 4
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-katarina-20260911' AND revision = 4 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-katarina-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-katarina-20260913', id, NULL, 4, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 5
FROM wiki_docs WHERE id = 'doc-ai-champion-katarina-20260911' AND revision = 5
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 체력을 막타와 바꾸지 않는다 · 앞순보는 정글 위치와 퇴로를 본 뒤 · Q와 단검은 상대 CS 타이밍에 겹친다

## 체력을 막타와 바꾸지 않는다

**카타리나는 초반에 근접 막타 하나 때문에 원거리 견제를 여러 번 맞으면 다음 웨이브부터 선택지가 사라진다.**[* [3500++/ M1 카타할께공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148158&vtype=pc)] `Q`로 안전하게 먹을 수 없는 CS는 버려도 된다. 포션이 있을 때는 체력이 절반 아래로 떨어질 때까지 아끼지 말고, 교전 직전에는 체력을 먼저 복구한다. 라인이 힘들수록 억지 솔로킬보다 강가나 사이드의 작은 싸움에 먼저 합류할 체력을 남긴다.

## 앞순보는 정글 위치와 퇴로를 본 뒤

**상대 정글이 보이지 않으면 적 챔피언이나 앞쪽 단검으로 먼저 순보하지 않는다.**[* [\[M1\] 간단하게 보는 카타리나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147939)] 진입 전 뒤쪽 아군 미니언과 남은 단검처럼 돌아올 대상을 함께 본다. 상대가 견제 스킬을 미니언에 썼더라도 적 미니언이 많으면 `Q`와 단검 피해만 짧게 넣고 빠진다. 킬이 확실하지 않은데 퇴로까지 써 버리는 긴 교환은 피한다.

## `Q`와 단검은 상대 CS 타이밍에 겹친다

**`Q`를 막타기로만 쓰지 말고 상대가 CS를 먹으러 움직일 때 챔피언을 맞혀 뒤쪽에 단검을 만든다.** 상대가 단검을 피해서 CS를 포기하면 그것으로 이득이다. 상대가 단검 위에 남을 때만 순보로 짧게 들어가고, 멀어졌다면 억지로 따라가지 않는다.

## 로밍은 밀고, 정글과 함께

**먼저 라인을 밀어야 움직일 권리가 생긴다.** 맵을 자주 보되 바텀에서 싸움이 날 것 같다는 이유만으로 바로 내려가지는 않는다. 상대 미드와 정글의 위치, 지나갈 길의 와드, 도착했을 때 교전이 계속될지를 확인한다. 가능하면 아군 정글과 같이 움직이고, 상대가 길을 막고 있는데 혼자 강으로 들어가지 않는다. 라인을 밀지 못한 채 실패한 로밍은 미니언과 체력을 모두 잃는 큰 손해다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-katarina-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 1레벨은 CS보다 체력을 지킨다 · 싸우기 전에는 원소부터 들고 있다 · E 진입 뒤 빠질 장면까지 본다

## 1레벨은 CS보다 체력을 지킨다

**키아나는 원거리 상대에게 1레벨부터 무리해 막타를 먹으면 3레벨 교환을 시작할 체력이 남지 않는다.**[* [M1 누구나 쉽게 키아나로 점수올리기](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144987)] `Q`로 안전하게 먹을 수 있는 CS와 버릴 CS를 나누고 경험치 범위는 지킨다. 상대가 견제기를 미니언에 쓴 순간에만 앞으로 나간다. 초반 손해를 한 번에 복구하려 긴 교환을 열지 않는다.

## 싸우기 전에는 원소부터 들고 있다

**딜교가 끝난 직후가 아니라면 `W`로 원소를 준비해 둔다.**[* [키아나 A to Z](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147203&vtype=pc)] 강 원소는 상대의 퇴로를 묶고, 수풀 원소는 반격을 흘리며, 벽 원소는 체력이 빠진 상대를 마무리하는 데 유리하다. 원소 없이 `E`로 먼저 들어가면 두 번째 `Q`와 탈출 선택이 함께 사라진다. 주변 지형이 무엇을 줄 수 있는지 보고 라인 위치를 잡는다.

## `E` 진입 뒤 빠질 장면까지 본다

**`E`는 상대에게 붙는 기술이지 자동으로 안전하게 돌아오는 기술이 아니다.** 상대의 핵심 스킬이 두 개 이상 빠졌거나 적 미니언 수가 적을 때 짧게 들어간다. 수풀 `Q`로 시야를 끊거나 `W` 이동으로 옆으로 빠질 길을 남겨 두고, `Q` 두 번을 다 쓴 뒤에도 적 정글 위치가 보이지 않으면 추격하지 않는다.

## 로밍은 라인을 정리하고 정글과 함께

**키아나는 강과 벽 근처 소규모 교전이 강하지만, 로밍에 집착해 미드 웨이브를 계속 버리면 다음 싸움의 피해가 부족해진다.** 라인을 상대 포탑에 넣은 뒤 아군 정글과 같은 방향으로 움직인다. 상대가 먼저 사라졌다면 무작정 따라가기보다 위험 핑을 찍고 반대쪽 시야나 웨이브에서 확실한 이득을 고른다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-3425cc0c-770c-44fb-9e75-434bc8f27357' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-3425cc0c-770c-44fb-9e75-434bc8f27357') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-3425cc0c-770c-44fb-9e75-434bc8f27357' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-qiyana-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-qiyana-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-3425cc0c-770c-44fb-9e75-434bc8f27357' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 1레벨은 CS보다 체력을 지킨다 · 싸우기 전에는 원소부터 들고 있다 · E 진입 뒤 빠질 장면까지 본다

## 1레벨은 CS보다 체력을 지킨다

**키아나는 원거리 상대에게 1레벨부터 무리해 막타를 먹으면 3레벨 교환을 시작할 체력이 남지 않는다.**[* [M1 누구나 쉽게 키아나로 점수올리기](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144987)] `Q`로 안전하게 먹을 수 있는 CS와 버릴 CS를 나누고 경험치 범위는 지킨다. 상대가 견제기를 미니언에 쓴 순간에만 앞으로 나간다. 초반 손해를 한 번에 복구하려 긴 교환을 열지 않는다.

## 싸우기 전에는 원소부터 들고 있다

**딜교가 끝난 직후가 아니라면 `W`로 원소를 준비해 둔다.**[* [키아나 A to Z](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147203&vtype=pc)] 강 원소는 상대의 퇴로를 묶고, 수풀 원소는 반격을 흘리며, 벽 원소는 체력이 빠진 상대를 마무리하는 데 유리하다. 원소 없이 `E`로 먼저 들어가면 두 번째 `Q`와 탈출 선택이 함께 사라진다. 주변 지형이 무엇을 줄 수 있는지 보고 라인 위치를 잡는다.

## `E` 진입 뒤 빠질 장면까지 본다

**`E`는 상대에게 붙는 기술이지 자동으로 안전하게 돌아오는 기술이 아니다.** 상대의 핵심 스킬이 두 개 이상 빠졌거나 적 미니언 수가 적을 때 짧게 들어간다. 수풀 `Q`로 시야를 끊거나 `W` 이동으로 옆으로 빠질 길을 남겨 두고, `Q` 두 번을 다 쓴 뒤에도 적 정글 위치가 보이지 않으면 추격하지 않는다.

## 로밍은 라인을 정리하고 정글과 함께

**키아나는 강과 벽 근처 소규모 교전이 강하지만, 로밍에 집착해 미드 웨이브를 계속 버리면 다음 싸움의 피해가 부족해진다.** 라인을 상대 포탑에 넣은 뒤 아군 정글과 같은 방향으로 움직인다. 상대가 먼저 사라졌다면 무작정 따라가기보다 위험 핑을 찍고 반대쪽 시야나 웨이브에서 확실한 이득을 고른다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-qiyana-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 갈퀴손은 돌아오는 칼날까지 본다 · Q의 거리는 진입 위험을 바꾼다 · 패시브 한 스택에 목숨 걸지 않는다

## 갈퀴손은 돌아오는 칼날까지 본다

**`W`는 나갈 때보다 돌아올 때까지 맞아야 다음 교환이 열린다.**[* [\[D1\] 영감 탈론과 마법 탈론의 장단점](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141475&vtype=pc)] 상대가 막타를 치러 멈추는 순간 던지고, 옆으로 빠질 길을 미리 막는다. 첫 타만 맞았는데 `Q`로 곧장 들어가면 상대는 복귀 칼날을 피하면서 반격할 수 있다. 두 번째 타가 빗나갔다면 패시브를 억지로 완성하려 하지 않는다.

## `Q`의 거리는 진입 위험을 바꾼다

**가까운 거리의 `Q`는 강하지만, 먼 거리에서 쓰면 탈론이 눈에 보이게 상대 쪽으로 이동한다.**[* [부패물약 아지르](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139602)] 적 미니언이 많거나 상대 정글이 안 보일 때 원거리 `Q`로 먼저 들어가지 않는다. `W` 두 타와 기본 공격까지 이어질 상황인지 확인하고, 짧은 체력 이득을 봤다면 한 대를 더 치기보다 다시 웨이브 뒤로 빠진다.

## 패시브 한 스택에 목숨 걸지 않는다

**탈론의 큰 피해는 스킬로 표식을 쌓고 기본 공격으로 마무리할 때 나온다.** 하지만 세 번째 표식을 만들겠다고 상대 포탑이나 큰 웨이브까지 따라가면 교환을 이겨도 라인을 잃는다. 상대가 핵심 스킬을 미니언에 썼거나 `W` 복귀를 맞은 순간에만 완성하고, 조건이 어긋나면 다음 `W`를 기다린다.

## 로밍은 벽을 넘기 전에 웨이브부터

**탈론은 벽을 넘어 빠르게 합류할 수 있지만, 이동 속도가 빠른 것과 로밍 비용이 없는 것은 다르다.** 먼저 웨이브를 상대 포탑에 넣고 아군 정글과 같은 방향으로 움직인다. 갈 길과 돌아올 길을 다르게 잡으면 동선이 덜 읽히고, 실패해도 다음 웨이브에 복귀하기 쉽다. 라인을 못 밀었다면 사라지는 척만 하고 미드 압박을 이어 간다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-0b3be62a-0b48-461d-8bef-96e5057ae96d' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-0b3be62a-0b48-461d-8bef-96e5057ae96d') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-0b3be62a-0b48-461d-8bef-96e5057ae96d' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-talon-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-talon-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-0b3be62a-0b48-461d-8bef-96e5057ae96d' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 갈퀴손은 돌아오는 칼날까지 본다 · Q의 거리는 진입 위험을 바꾼다 · 패시브 한 스택에 목숨 걸지 않는다

## 갈퀴손은 돌아오는 칼날까지 본다

**`W`는 나갈 때보다 돌아올 때까지 맞아야 다음 교환이 열린다.**[* [\[D1\] 영감 탈론과 마법 탈론의 장단점](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141475&vtype=pc)] 상대가 막타를 치러 멈추는 순간 던지고, 옆으로 빠질 길을 미리 막는다. 첫 타만 맞았는데 `Q`로 곧장 들어가면 상대는 복귀 칼날을 피하면서 반격할 수 있다. 두 번째 타가 빗나갔다면 패시브를 억지로 완성하려 하지 않는다.

## `Q`의 거리는 진입 위험을 바꾼다

**가까운 거리의 `Q`는 강하지만, 먼 거리에서 쓰면 탈론이 눈에 보이게 상대 쪽으로 이동한다.**[* [부패물약 아지르](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139602)] 적 미니언이 많거나 상대 정글이 안 보일 때 원거리 `Q`로 먼저 들어가지 않는다. `W` 두 타와 기본 공격까지 이어질 상황인지 확인하고, 짧은 체력 이득을 봤다면 한 대를 더 치기보다 다시 웨이브 뒤로 빠진다.

## 패시브 한 스택에 목숨 걸지 않는다

**탈론의 큰 피해는 스킬로 표식을 쌓고 기본 공격으로 마무리할 때 나온다.** 하지만 세 번째 표식을 만들겠다고 상대 포탑이나 큰 웨이브까지 따라가면 교환을 이겨도 라인을 잃는다. 상대가 핵심 스킬을 미니언에 썼거나 `W` 복귀를 맞은 순간에만 완성하고, 조건이 어긋나면 다음 `W`를 기다린다.

## 로밍은 벽을 넘기 전에 웨이브부터

**탈론은 벽을 넘어 빠르게 합류할 수 있지만, 이동 속도가 빠른 것과 로밍 비용이 없는 것은 다르다.** 먼저 웨이브를 상대 포탑에 넣고 아군 정글과 같은 방향으로 움직인다. 갈 길과 돌아올 길을 다르게 잡으면 동선이 덜 읽히고, 실패해도 다음 웨이브에 복귀하기 쉽다. 라인을 못 밀었다면 사라지는 척만 하고 미드 압박을 이어 간다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-talon-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 움직이며 쓰되 미니언에 막히는 각을 계산한다 · 돌진 경로에는 E를 먼저 놓는다 · 기본 연계는 E로 길을 만들고 W로 밀어 넣는다

## `Q`는 움직이며 쓰되 미니언에 막히는 각을 계산한다

**파편 난사 중에도 자유롭게 움직일 수 있지만, 바위는 앞의 대상에 먼저 닿는다.**[* [미드 탈리야 정석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=129711&vtype=pc)] 상대가 미니언 뒤에 있으면 정면에서 전부 던지지 말고 웨이브 옆으로 각도를 만들거나 체력이 낮은 미니언이 사라지는 순간을 노린다. 시야가 없는 쪽으로 옆걸음하지 않는다.

## 돌진 경로에는 `E`를 먼저 놓는다

**대지의 파동 위로 상대가 돌진하거나 밀려나면 바위가 폭발해 기절한다.**[* [도파 트페 공략의 탈리야 상대 분석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143990&vtype=pc)] 이동기가 있는 상대에게 `W`부터 맞히려 하기보다 진입 예상 경로에 `E`를 깔아 선택지를 줄인다. 상대가 밭을 피하려 멈추거나 돌아갈 때 `Q`를 맞히기 쉬워진다.

## 기본 연계는 `E`로 길을 만들고 `W`로 밀어 넣는다

**움직이는 상대에게 `W`를 먼저 맞히고 뒤늦게 `E`를 까는 방식은 실패하기 쉽다.** `E`로 둔화와 위험 구역을 만든 뒤, 상대가 빠질 방향을 예상해 `W`로 그 안에 밀어 넣는 편이 안정적이다. `W`가 빗나가면 `Q`까지 무리하게 쫓아가지 않는다.

## 라인을 민 뒤에만 벽과 이동 속도를 활용한다

**탈리야는 웨이브를 정리하고 벽을 따라 먼저 움직일 때 강하다.** 미니언이 남아 있는데 시야에서 사라지면 로밍이 실패했을 때 손해가 크다. 먼저 웨이브를 포탑에 넣고 정글러 위치를 확인한 뒤 강가로 움직인다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-6ac51090-21cb-4daf-a0c6-66e8482021c5' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-6ac51090-21cb-4daf-a0c6-66e8482021c5') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-6ac51090-21cb-4daf-a0c6-66e8482021c5' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-taliyah-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-taliyah-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-6ac51090-21cb-4daf-a0c6-66e8482021c5' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 움직이며 쓰되 미니언에 막히는 각을 계산한다 · 돌진 경로에는 E를 먼저 놓는다 · 기본 연계는 E로 길을 만들고 W로 밀어 넣는다

## `Q`는 움직이며 쓰되 미니언에 막히는 각을 계산한다

**파편 난사 중에도 자유롭게 움직일 수 있지만, 바위는 앞의 대상에 먼저 닿는다.**[* [미드 탈리야 정석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=129711&vtype=pc)] 상대가 미니언 뒤에 있으면 정면에서 전부 던지지 말고 웨이브 옆으로 각도를 만들거나 체력이 낮은 미니언이 사라지는 순간을 노린다. 시야가 없는 쪽으로 옆걸음하지 않는다.

## 돌진 경로에는 `E`를 먼저 놓는다

**대지의 파동 위로 상대가 돌진하거나 밀려나면 바위가 폭발해 기절한다.**[* [도파 트페 공략의 탈리야 상대 분석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143990&vtype=pc)] 이동기가 있는 상대에게 `W`부터 맞히려 하기보다 진입 예상 경로에 `E`를 깔아 선택지를 줄인다. 상대가 밭을 피하려 멈추거나 돌아갈 때 `Q`를 맞히기 쉬워진다.

## 기본 연계는 `E`로 길을 만들고 `W`로 밀어 넣는다

**움직이는 상대에게 `W`를 먼저 맞히고 뒤늦게 `E`를 까는 방식은 실패하기 쉽다.** `E`로 둔화와 위험 구역을 만든 뒤, 상대가 빠질 방향을 예상해 `W`로 그 안에 밀어 넣는 편이 안정적이다. `W`가 빗나가면 `Q`까지 무리하게 쫓아가지 않는다.

## 라인을 민 뒤에만 벽과 이동 속도를 활용한다

**탈리야는 웨이브를 정리하고 벽을 따라 먼저 움직일 때 강하다.** 미니언이 남아 있는데 시야에서 사라지면 로밍이 실패했을 때 손해가 크다. 먼저 웨이브를 포탑에 넣고 정글러 위치를 확인한 뒤 강가로 움직인다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-taliyah-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 골드 카드의 위협은 뽑기 전에도 존재한다 · 평타 견제는 미니언 어그로와 라인을 바꾼다 · 카드는 다음 행동에 맞춰 고른다

## 골드 카드(`W`)의 위협은 뽑기 전에도 존재한다

**골드 카드를 너무 일찍 확정하면 상대는 카드가 사라질 때까지 물러나면 된다.**[* [도파 트페 분석 9.21](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143990&vtype=pc)] 상대가 막타를 치러 들어오거나 정글러가 접근할 때 카드를 돌리기 시작해야 선택지를 압박할 수 있다. 카드를 들고 앞으로 걷는 동안 다른 적의 위치도 함께 확인한다.

## 평타 견제는 미니언 어그로와 라인을 바꾼다

**상대를 기본 공격하면 적 미니언이 트위스티드 페이트를 공격하고 웨이브가 밀리기 쉽다.**[* [도파 트페 분석 10.10](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145528&vtype=pc)] 한 대를 때린 뒤 수풀이나 거리 밖으로 빠져 어그로를 끊고, 라인을 당겨야 하는 상황에서는 무리한 평타 견제를 줄인다.

## 카드는 다음 행동에 맞춰 고른다

**웨이브를 빠르게 정리할 때는 레드 카드의 범위를 활용하고, 정글러가 오거나 상대가 접근할 때는 골드 카드를 준비한다.** 카드를 먼저 고른 뒤 목적을 찾는 습관보다 라인을 밀지, 잡을지를 먼저 결정해야 불필요하게 웨이브를 망치지 않는다.

## 궁극기 전에 현재 웨이브를 끝낸다

**다른 라인에 기회가 보여도 미니언을 포탑에 넣지 않고 이동하면 상대 미드가 손쉽게 경험치와 포탑 피해를 챙긴다.** 먼저 웨이브를 밀고 상대 위치를 확인한 뒤 이동한다. 도착 지점도 적 바로 위보다 퇴로나 아군과 합류할 수 있는 쪽이 안전하다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-cfa6e563-1fcd-4407-b0f7-bf98b68fa239' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-cfa6e563-1fcd-4407-b0f7-bf98b68fa239') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-cfa6e563-1fcd-4407-b0f7-bf98b68fa239' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-twistedfate-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-twistedfate-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-cfa6e563-1fcd-4407-b0f7-bf98b68fa239' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 골드 카드의 위협은 뽑기 전에도 존재한다 · 평타 견제는 미니언 어그로와 라인을 바꾼다 · 카드는 다음 행동에 맞춰 고른다

## 골드 카드(`W`)의 위협은 뽑기 전에도 존재한다

**골드 카드를 너무 일찍 확정하면 상대는 카드가 사라질 때까지 물러나면 된다.**[* [도파 트페 분석 9.21](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143990&vtype=pc)] 상대가 막타를 치러 들어오거나 정글러가 접근할 때 카드를 돌리기 시작해야 선택지를 압박할 수 있다. 카드를 들고 앞으로 걷는 동안 다른 적의 위치도 함께 확인한다.

## 평타 견제는 미니언 어그로와 라인을 바꾼다

**상대를 기본 공격하면 적 미니언이 트위스티드 페이트를 공격하고 웨이브가 밀리기 쉽다.**[* [도파 트페 분석 10.10](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145528&vtype=pc)] 한 대를 때린 뒤 수풀이나 거리 밖으로 빠져 어그로를 끊고, 라인을 당겨야 하는 상황에서는 무리한 평타 견제를 줄인다.

## 카드는 다음 행동에 맞춰 고른다

**웨이브를 빠르게 정리할 때는 레드 카드의 범위를 활용하고, 정글러가 오거나 상대가 접근할 때는 골드 카드를 준비한다.** 카드를 먼저 고른 뒤 목적을 찾는 습관보다 라인을 밀지, 잡을지를 먼저 결정해야 불필요하게 웨이브를 망치지 않는다.

## 궁극기 전에 현재 웨이브를 끝낸다

**다른 라인에 기회가 보여도 미니언을 포탑에 넣지 않고 이동하면 상대 미드가 손쉽게 경험치와 포탑 피해를 챙긴다.** 먼저 웨이브를 밀고 상대 위치를 확인한 뒤 이동한다. 도착 지점도 적 바로 위보다 퇴로나 아군과 합류할 수 있는 쪽이 안전하다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-twistedfate-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 첫 웨이브는 CS보다 체력이다 · E는 먼저 들어가는 버튼이 아니다 · Q를 쓰기 전에 도착 지점을 본다

## 첫 웨이브는 CS보다 체력이다

**원거리 상대에게 막타마다 맞아 주면 스킬이 갖춰지는 3레벨에 싸울 체력이 남지 않는다.**[* [픽창 때 보면 좋을 꿀팁가득 피즈 기초 교본](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=121553)] 초반 몇 개의 CS는 내주더라도 경험치를 챙기며 라인을 받는다. 상대가 주요 견제기를 미니언에 쓴 순간에만 앞으로 나가고, 적 미니언이 많으면 긴 평타 교환을 피한다.

## `E`는 먼저 들어가는 버튼이 아니다

**재간둥이는 피해와 라인 정리뿐 아니라 상대 핵심 스킬을 흘리고 갱에서 빠져나오는 수단이다.**[* [라인전·한타 최강 극딜 피즈](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109904&vtype=pc)] 상대가 스킬을 쓰기도 전에 `E`로 진입하면 가장 중요한 안전장치를 먼저 버린다. 정글 위치가 안 보일 때는 특히 아끼고, 교환에서는 상대의 반격을 피한 뒤 착지 피해까지 넣는 순서를 노린다.

## `Q`를 쓰기 전에 도착 지점을 본다

**성게 찌르기는 대상을 통과하므로, 들어가기 전 상대 뒤에 어디로 멈출지 확인한다.** 도착 지점이 큰 적 웨이브나 포탑 쪽이면 짧은 교환이 퇴로 없는 싸움이 된다. `W` 강화 공격을 섞되 한 대를 더 치겠다고 `E`까지 공격에 쓰지 않는다. 이미 체력 이득을 봤다면 안전하게 빠지는 것으로 교환을 끝낸다.

## 로밍은 `E`로 웨이브를 민 뒤가 아니라 돌아온 뒤

**`E`로 라인을 정리하면 빠르게 움직일 수 있지만, 곧바로 강가에서 적을 만나면 피할 도구가 없다.** 웨이브를 넣은 뒤 `E`가 돌아올 시간과 상대 정글 위치를 함께 본다. 궁극기가 있으면 아군 정글과 같은 방향으로 움직여 퇴로가 좁은 적을 노리고, 궁이 빗나가면 계획대로 억지 진입하지 않는다.', revision = 5, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-fizz-20260911' AND kind = 'article' AND revision = 4
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-fizz-20260911') = 4
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-fizz-20260911' AND revision = 4 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-fizz-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-fizz-20260913', id, NULL, 4, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 5
FROM wiki_docs WHERE id = 'doc-ai-champion-fizz-20260911' AND revision = 5
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 첫 웨이브는 CS보다 체력이다 · E는 먼저 들어가는 버튼이 아니다 · Q를 쓰기 전에 도착 지점을 본다

## 첫 웨이브는 CS보다 체력이다

**원거리 상대에게 막타마다 맞아 주면 스킬이 갖춰지는 3레벨에 싸울 체력이 남지 않는다.**[* [픽창 때 보면 좋을 꿀팁가득 피즈 기초 교본](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=121553)] 초반 몇 개의 CS는 내주더라도 경험치를 챙기며 라인을 받는다. 상대가 주요 견제기를 미니언에 쓴 순간에만 앞으로 나가고, 적 미니언이 많으면 긴 평타 교환을 피한다.

## `E`는 먼저 들어가는 버튼이 아니다

**재간둥이는 피해와 라인 정리뿐 아니라 상대 핵심 스킬을 흘리고 갱에서 빠져나오는 수단이다.**[* [라인전·한타 최강 극딜 피즈](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109904&vtype=pc)] 상대가 스킬을 쓰기도 전에 `E`로 진입하면 가장 중요한 안전장치를 먼저 버린다. 정글 위치가 안 보일 때는 특히 아끼고, 교환에서는 상대의 반격을 피한 뒤 착지 피해까지 넣는 순서를 노린다.

## `Q`를 쓰기 전에 도착 지점을 본다

**성게 찌르기는 대상을 통과하므로, 들어가기 전 상대 뒤에 어디로 멈출지 확인한다.** 도착 지점이 큰 적 웨이브나 포탑 쪽이면 짧은 교환이 퇴로 없는 싸움이 된다. `W` 강화 공격을 섞되 한 대를 더 치겠다고 `E`까지 공격에 쓰지 않는다. 이미 체력 이득을 봤다면 안전하게 빠지는 것으로 교환을 끝낸다.

## 로밍은 `E`로 웨이브를 민 뒤가 아니라 돌아온 뒤

**`E`로 라인을 정리하면 빠르게 움직일 수 있지만, 곧바로 강가에서 적을 만나면 피할 도구가 없다.** 웨이브를 넣은 뒤 `E`가 돌아올 시간과 상대 정글 위치를 함께 본다. 궁극기가 있으면 아군 정글과 같은 방향으로 움직여 퇴로가 좁은 적을 노리고, 궁이 빗나가면 계획대로 억지 진입하지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-fizz-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

> **한눈에 보기** — 파멸 기술을 라인에 쓰면 잠시 견제도 사라진다 · 고통 계열은 생존 자원으로 남긴다 · `WE`는 안전한 막타와 함께 회수한다

## 파멸 기술을 라인에 쓰면 잠시 견제도 사라진다

**흐웨이의 세 파멸 기술은 같은 계열의 재사용 대기시간을 공유한다.**[* [흐웨이 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148025)] `QE`로 웨이브를 정리한 직후에는 `QQ`로 상대를 때릴 수 없으므로, 라인을 밀 목적과 체력을 깎을 목적을 한 번의 선택으로 구분한다. 상대가 막타를 치는 순간 두 목적이 겹칠 때만 함께 노린다.

## 고통 계열은 생존 자원으로 남긴다

**`EQ`의 공포, `EW`의 감시와 속박, `EE`의 끌어당김은 모두 같은 계열이다.**[* [흐웨이 연구 제대로 했다](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148026&vtype=pc)] 돌진형 상대가 들어올 수 있는데 원거리 견제용으로 하나를 먼저 쓰면 나머지도 사용할 수 없다. 정면으로 달려오는 적에게는 `EQ`, 좁은 진입로나 수풀 확인에는 `EW`, 여러 대상의 경로를 모을 때는 `EE`처럼 상황을 먼저 정한다.

## `WE`는 안전한 막타와 함께 회수한다

**요동치는 빛은 다음 기본 공격이나 스킬에 추가 피해를 주고 적중 시 마나를 돌려준다.** 활성화만 하고 물러나면 마나 회복을 충분히 받지 못한다. 안전하게 칠 수 있는 미니언과 상대 위치를 확인한 뒤 사용해 세 번의 적중을 차분히 소비한다.

## 긴 사거리만 믿고 제어기를 함께 소모하지 않는다

**흐웨이는 멀리서 라인을 건드릴 수 있지만 이동기가 없다.** 파멸과 고통 기술을 한 번에 빗맞히면 상대가 들어오는 동안 막을 방법이 적다. 첫 제어가 빗나가면 추가 기술을 억지로 잇지 않고 거리를 다시 만든다.', revision = 4, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-a-12ad2a64-3bb7-489e-8ccb-459432858e90' AND kind = 'article' AND revision = 3
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-a-12ad2a64-3bb7-489e-8ccb-459432858e90') = 3
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-a-12ad2a64-3bb7-489e-8ccb-459432858e90' AND revision = 3 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-hwei-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-hwei-20260913', id, NULL, 3, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 4
FROM wiki_docs WHERE id = 'doc-a-12ad2a64-3bb7-489e-8ccb-459432858e90' AND revision = 4
  AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 파멸 기술을 라인에 쓰면 잠시 견제도 사라진다 · 고통 계열은 생존 자원으로 남긴다 · `WE`는 안전한 막타와 함께 회수한다

## 파멸 기술을 라인에 쓰면 잠시 견제도 사라진다

**흐웨이의 세 파멸 기술은 같은 계열의 재사용 대기시간을 공유한다.**[* [흐웨이 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148025)] `QE`로 웨이브를 정리한 직후에는 `QQ`로 상대를 때릴 수 없으므로, 라인을 밀 목적과 체력을 깎을 목적을 한 번의 선택으로 구분한다. 상대가 막타를 치는 순간 두 목적이 겹칠 때만 함께 노린다.

## 고통 계열은 생존 자원으로 남긴다

**`EQ`의 공포, `EW`의 감시와 속박, `EE`의 끌어당김은 모두 같은 계열이다.**[* [흐웨이 연구 제대로 했다](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148026&vtype=pc)] 돌진형 상대가 들어올 수 있는데 원거리 견제용으로 하나를 먼저 쓰면 나머지도 사용할 수 없다. 정면으로 달려오는 적에게는 `EQ`, 좁은 진입로나 수풀 확인에는 `EW`, 여러 대상의 경로를 모을 때는 `EE`처럼 상황을 먼저 정한다.

## `WE`는 안전한 막타와 함께 회수한다

**요동치는 빛은 다음 기본 공격이나 스킬에 추가 피해를 주고 적중 시 마나를 돌려준다.** 활성화만 하고 물러나면 마나 회복을 충분히 받지 못한다. 안전하게 칠 수 있는 미니언과 상대 위치를 확인한 뒤 사용해 세 번의 적중을 차분히 소비한다.

## 긴 사거리만 믿고 제어기를 함께 소모하지 않는다

**흐웨이는 멀리서 라인을 건드릴 수 있지만 이동기가 없다.** 파멸과 고통 기술을 한 번에 빗맞히면 상대가 들어오는 동안 막을 방법이 적다. 첫 제어가 빗나가면 추가 기술을 억지로 잇지 않고 거리를 다시 만든다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-hwei-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 짧게 때리고 빠질 때보다 두 번째 회전에 강하다

사일러스는 스킬 사이에 강화 기본 공격을 섞어야 피해와 라인 정리가 함께 나온다. 스킬을 한꺼번에 누른 뒤 평타를 몰아 치기보다 **스킬 하나 → 강화 평타 → 다음 스킬**의 리듬을 잡는다. 강화 공격은 주변 미니언에도 닿으므로 상대를 때리면서 웨이브가 예상보다 빨리 밀릴 수 있다.

> 교환을 시작하기 전에 `국왕시해자(W)`로 회복할 수 있는 적 챔피언과 빠져나올 미니언 위치를 같이 본다.

## 레벨별 라인전

| 구간 | 우선할 판단 |
| --- | --- |
| 1레벨 | `사슬 후려치기(Q)`의 교차 지점을 미니언과 챔피언에 함께 맞힌다. 두 번째 폭발까지 맞힐 수 없으면 마나만 쓰지 않는다. |
| 2~3레벨 | `도주(E1)`는 진입 버튼이면서 회피 버튼이다. `억압(E2)`이 빗나갔을 때 돌아올 길이 없으면 먼저 쓰지 않는다. |
| 6레벨 이후 | 훔친 궁극기의 이름보다 **지금 라인에서 바로 쓸 수 있는가**를 본다. 교전이 끝난 뒤 필요한 궁을 미리 훔쳐 라인 압박을 버리지 않는다. |

## 교환 전 체크

- 적의 핵심 견제기가 빠졌는가.
- `억압(E2)` 앞을 미니언이 막고 있지 않은가.
- `국왕시해자(W)`를 너무 일찍 써서 회복 구간을 버리지 않는가.
- 스킬 사용 뒤 강화 평타를 칠 거리인가.

`Q`는 첫 타격보다 교차 지점의 지연 폭발 비중이 크다. 상대가 막타를 치려고 멈추는 순간에 교차점을 놓으면 적중률이 올라간다. 반대로 이동기가 남은 상대에게 최대 사거리로 던지면 첫 타만 맞고 끝나기 쉽다.

## 같이 보면 좋은 문서

사일러스처럼 근접 교환 뒤 회복으로 버티는 챔피언은 [[다이애나]]와 라인 관리의 결이 다르다. 다이애나는 표식을 이용한 재진입을, 사일러스는 빗나간 `E2` 뒤의 공백을 더 엄격하게 관리한다.

이 글은 인벤 사일러스 공략 게시판과 미드 공략의 스킬 구조·라인 클리어 설명을 참고해, 현재 Data Dragon 스킬 설명과 맞는 내용만 남겼다.[* [사일러스 공략 게시판](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=143)][* [미드 사일러스 설명서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146557)]', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-sylas-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-sylas-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-sylas-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-sylas-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-sylas-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-sylas-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 짧게 때리고 빠질 때보다 두 번째 회전에 강하다

사일러스는 스킬 사이에 강화 기본 공격을 섞어야 피해와 라인 정리가 함께 나온다. 스킬을 한꺼번에 누른 뒤 평타를 몰아 치기보다 **스킬 하나 → 강화 평타 → 다음 스킬**의 리듬을 잡는다. 강화 공격은 주변 미니언에도 닿으므로 상대를 때리면서 웨이브가 예상보다 빨리 밀릴 수 있다.

> 교환을 시작하기 전에 `국왕시해자(W)`로 회복할 수 있는 적 챔피언과 빠져나올 미니언 위치를 같이 본다.

## 레벨별 라인전

| 구간 | 우선할 판단 |
| --- | --- |
| 1레벨 | `사슬 후려치기(Q)`의 교차 지점을 미니언과 챔피언에 함께 맞힌다. 두 번째 폭발까지 맞힐 수 없으면 마나만 쓰지 않는다. |
| 2~3레벨 | `도주(E1)`는 진입 버튼이면서 회피 버튼이다. `억압(E2)`이 빗나갔을 때 돌아올 길이 없으면 먼저 쓰지 않는다. |
| 6레벨 이후 | 훔친 궁극기의 이름보다 **지금 라인에서 바로 쓸 수 있는가**를 본다. 교전이 끝난 뒤 필요한 궁을 미리 훔쳐 라인 압박을 버리지 않는다. |

## 교환 전 체크

- 적의 핵심 견제기가 빠졌는가.
- `억압(E2)` 앞을 미니언이 막고 있지 않은가.
- `국왕시해자(W)`를 너무 일찍 써서 회복 구간을 버리지 않는가.
- 스킬 사용 뒤 강화 평타를 칠 거리인가.

`Q`는 첫 타격보다 교차 지점의 지연 폭발 비중이 크다. 상대가 막타를 치려고 멈추는 순간에 교차점을 놓으면 적중률이 올라간다. 반대로 이동기가 남은 상대에게 최대 사거리로 던지면 첫 타만 맞고 끝나기 쉽다.

## 같이 보면 좋은 문서

사일러스처럼 근접 교환 뒤 회복으로 버티는 챔피언은 [[다이애나]]와 라인 관리의 결이 다르다. 다이애나는 표식을 이용한 재진입을, 사일러스는 빗나간 `E2` 뒤의 공백을 더 엄격하게 관리한다.

이 글은 인벤 사일러스 공략 게시판과 미드 공략의 스킬 구조·라인 클리어 설명을 참고해, 현재 Data Dragon 스킬 설명과 맞는 내용만 남겼다.[* [사일러스 공략 게시판](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=143)][* [미드 사일러스 설명서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146557)]' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-sylas-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 1~2레벨은 버티고 3레벨부터 교환한다

요네는 초반 두 레벨에 먼저 맞기 시작하면 되받아칠 수단이 부족하다. `영혼 가르기(W)`로 **상대와 미니언을 함께 긁어** 보호막과 막타를 동시에 챙기고, `필멸의 검(Q)` 중첩과 `영혼해방(E)`가 모두 준비된 뒤 교환을 연다.[* [요네 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146418)]

## Q3은 맞히는 기술보다 예고되는 시간이다

`Q`를 두 번 맞히면 다음 `Q`가 돌진과 에어본으로 바뀐다. 이때 상대도 요네가 들어올 것을 안다.

- 바로 쓰지 말고 막타를 먹는 척하며 옆각을 만든다.
- 적이 뒤로 빠지면 무리해 소모하지 않고 웨이브 압박에 쓴다.
- `E`로 먼저 나간 뒤 `Q3`를 쓰면, 돌아갈 육신과 적 정글의 접근 방향을 확인한다.

## E는 안전장치가 아니라 제한 시간이다

`영혼해방(E)`는 시작점으로 반드시 돌아온다. 따라서 시작점을 적이 장악할 수 있는 강가 입구나 포탑 사거리 가까이에 두면, 교환을 이겨도 복귀 순간 손해를 본다.

| 좋은 시작점 | 나쁜 시작점 |
| --- | --- |
| 아군 원거리 미니언 뒤 | 적 정글이 올 수 있는 강가 쪽 |
| 포탑 쪽으로 한 걸음 빠진 자리 | 적의 설치형 스킬 위 |
| 적 핵심 CC가 빠진 뒤 | 상대 CC가 그대로 남은 상태 |

`E`가 끝나기 직전에는 한 대를 더 치는 것보다 안전하게 돌아가는 편이 낫다. 돌아갈 때 증폭 피해가 들어가므로, 이미 충분히 교환했다면 욕심을 줄인다.

## 같이 보면 좋은 문서

`Q3` 준비와 미니언 돌진 경로를 함께 관리한다는 점은 [[야스오]]와 닮았다. 차이는 요네가 `E`의 복귀점을, 야스오가 `질풍검(E)`에 남겨 둘 미니언을 더 먼저 계산한다는 데 있다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-yone-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-yone-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-yone-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-yone-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-yone-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-yone-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 1~2레벨은 버티고 3레벨부터 교환한다

요네는 초반 두 레벨에 먼저 맞기 시작하면 되받아칠 수단이 부족하다. `영혼 가르기(W)`로 **상대와 미니언을 함께 긁어** 보호막과 막타를 동시에 챙기고, `필멸의 검(Q)` 중첩과 `영혼해방(E)`가 모두 준비된 뒤 교환을 연다.[* [요네 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146418)]

## Q3은 맞히는 기술보다 예고되는 시간이다

`Q`를 두 번 맞히면 다음 `Q`가 돌진과 에어본으로 바뀐다. 이때 상대도 요네가 들어올 것을 안다.

- 바로 쓰지 말고 막타를 먹는 척하며 옆각을 만든다.
- 적이 뒤로 빠지면 무리해 소모하지 않고 웨이브 압박에 쓴다.
- `E`로 먼저 나간 뒤 `Q3`를 쓰면, 돌아갈 육신과 적 정글의 접근 방향을 확인한다.

## E는 안전장치가 아니라 제한 시간이다

`영혼해방(E)`는 시작점으로 반드시 돌아온다. 따라서 시작점을 적이 장악할 수 있는 강가 입구나 포탑 사거리 가까이에 두면, 교환을 이겨도 복귀 순간 손해를 본다.

| 좋은 시작점 | 나쁜 시작점 |
| --- | --- |
| 아군 원거리 미니언 뒤 | 적 정글이 올 수 있는 강가 쪽 |
| 포탑 쪽으로 한 걸음 빠진 자리 | 적의 설치형 스킬 위 |
| 적 핵심 CC가 빠진 뒤 | 상대 CC가 그대로 남은 상태 |

`E`가 끝나기 직전에는 한 대를 더 치는 것보다 안전하게 돌아가는 편이 낫다. 돌아갈 때 증폭 피해가 들어가므로, 이미 충분히 교환했다면 욕심을 줄인다.

## 같이 보면 좋은 문서

`Q3` 준비와 미니언 돌진 경로를 함께 관리한다는 점은 [[야스오]]와 닮았다. 차이는 요네가 `E`의 복귀점을, 야스오가 `질풍검(E)`에 남겨 둘 미니언을 더 먼저 계산한다는 데 있다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-yone-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 미니언은 진입로이자 퇴로다

야스오는 `질풍검(E)`으로 같은 대상에게 연속 돌진할 수 없다. 상대에게 갈 때 앞 미니언을 전부 써 버리면 돌아올 경로가 사라진다. **들어갈 미니언 하나, 빠질 미니언 하나**를 나눠 두고 교환한다.

- 적 원거리 미니언을 타고 접근했다면 근거리 미니언은 퇴로로 남긴다.
- 웨이브가 적 포탑 쪽으로 너무 기울면 긴 교환을 열지 않는다.
- `E` 도중 `Q`를 써 원형 공격을 맞히려다 포탑 사거리까지 미끄러지지 않는지 본다.

## 보호막을 먼저 빼앗기지 않는다

기류 보호막이 준비됐을 때 적의 약한 평타 한 대에 맞으면 중요한 교환 전에 보호막이 사라진다. 반대로 내가 먼저 거리를 좁힐 수 있다면 보호막으로 첫 견제를 흡수하고 짧게 때린 뒤 나온다.

| 준비된 것 | 선택 |
| --- | --- |
| `Q3` + 보호막 | 막타에 멈춘 적에게 진입을 압박한다. |
| `Q3`만 준비 | 약한 견제에 보호막이 빠졌다면 에어본을 맞혀도 길게 쫓지 않는다. |
| `바람 장막(W)`만 준비 | 핵심 투사체를 막은 뒤 미니언 경로로 접근한다. |

## 장막은 피해량보다 다음 행동을 막는다

`바람 장막(W)`은 투사체를 막지만 모든 스킬을 막는 것은 아니다. 상대의 가장 아픈 기술보다 **맞으면 추격이 이어지는 속박·표식·에어본**에 우선 사용한다. 장막이 사라지기 전에 미니언을 타고 안전한 쪽으로 빠진다.

야스오는 2레벨과 6레벨에 강한 교환을 만들기 쉽다.[* [야스오 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143233)] 먼저 레벨이 오를 웨이브라면 `Q` 중첩과 기류를 미리 준비하고, 레벨이 늦으면 미니언 뒤에서 경험치부터 받는다.

## 같이 보면 좋은 문서

미니언을 연속 돌진 경로로 쓰는 [[이렐리아]]를 상대할 때는 낮은 체력 미니언을 내 퇴로로 착각하지 않는다. 이렐리아가 먼저 처치하며 따라올 수 있다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-yasuo-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-yasuo-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-yasuo-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-yasuo-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-yasuo-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-yasuo-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 미니언은 진입로이자 퇴로다

야스오는 `질풍검(E)`으로 같은 대상에게 연속 돌진할 수 없다. 상대에게 갈 때 앞 미니언을 전부 써 버리면 돌아올 경로가 사라진다. **들어갈 미니언 하나, 빠질 미니언 하나**를 나눠 두고 교환한다.

- 적 원거리 미니언을 타고 접근했다면 근거리 미니언은 퇴로로 남긴다.
- 웨이브가 적 포탑 쪽으로 너무 기울면 긴 교환을 열지 않는다.
- `E` 도중 `Q`를 써 원형 공격을 맞히려다 포탑 사거리까지 미끄러지지 않는지 본다.

## 보호막을 먼저 빼앗기지 않는다

기류 보호막이 준비됐을 때 적의 약한 평타 한 대에 맞으면 중요한 교환 전에 보호막이 사라진다. 반대로 내가 먼저 거리를 좁힐 수 있다면 보호막으로 첫 견제를 흡수하고 짧게 때린 뒤 나온다.

| 준비된 것 | 선택 |
| --- | --- |
| `Q3` + 보호막 | 막타에 멈춘 적에게 진입을 압박한다. |
| `Q3`만 준비 | 약한 견제에 보호막이 빠졌다면 에어본을 맞혀도 길게 쫓지 않는다. |
| `바람 장막(W)`만 준비 | 핵심 투사체를 막은 뒤 미니언 경로로 접근한다. |

## 장막은 피해량보다 다음 행동을 막는다

`바람 장막(W)`은 투사체를 막지만 모든 스킬을 막는 것은 아니다. 상대의 가장 아픈 기술보다 **맞으면 추격이 이어지는 속박·표식·에어본**에 우선 사용한다. 장막이 사라지기 전에 미니언을 타고 안전한 쪽으로 빠진다.

야스오는 2레벨과 6레벨에 강한 교환을 만들기 쉽다.[* [야스오 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143233)] 먼저 레벨이 오를 웨이브라면 `Q` 중첩과 기류를 미리 준비하고, 레벨이 늦으면 미니언 뒤에서 경험치부터 받는다.

## 같이 보면 좋은 문서

미니언을 연속 돌진 경로로 쓰는 [[이렐리아]]를 상대할 때는 낮은 체력 미니언을 내 퇴로로 착각하지 않는다. 이렐리아가 먼저 처치하며 따라올 수 있다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-yasuo-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 상대와 웨이브를 따로 때리지 않는다

갈리오의 `전장의 돌풍(Q)`은 미니언을 밀면서 상대를 건드릴 때 가치가 가장 크다. 원거리 미니언을 향해 쏘되 돌풍의 경로가 상대 챔피언을 지나게 만든다. 상대만 노리다 빗나가면 라인 주도권과 견제를 함께 잃는다.[* [갈리오 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146848)]

`석상의 강타` 광역 피해는 근접 챔피언을 직접 누르지 않아도 옆 미니언을 때려 묻힐 수 있다. 상대가 막타를 치러 들어올 때 가까운 미니언을 쳐서 **상대의 평타 사거리 밖에서 짧게 교환**한다.

## W는 길게 모으는 것이 항상 정답이 아니다

> 도발 범위에서 곧 벗어날 상대라면 짧게 끊고, 도망갈 길이 막힌 상대라면 더 모은다.

- 이동기가 남은 원거리 상대에게는 `듀란드의 방패(W)`를 짧게 사용한다.
- 아군 쪽으로 도망치는 상대에게는 `정의의 주먹(E)`을 먼저 맞히고 도발을 잇는다.
- `E`의 시작 동작은 잠깐 뒤로 물러나므로, 벽과 너무 가깝거나 포탑 앞이면 예상한 거리가 나오지 않는지 확인한다.

## 라인을 민 다음에만 자리를 비운다

| 라인 상태 | 행동 |
| --- | --- |
| 적 포탑에 웨이브가 들어감 | 강가 시야를 잡거나 궁극기 사거리 안의 사이드를 살핀다. |
| 중앙에 웨이브가 만남 | `Q`와 강화 평타로 먼저 정리한다. |
| 아군 포탑에 큰 웨이브가 옴 | 무리한 합류보다 경험치와 포탑 피해를 막는다. |

궁극기가 있다는 이유만으로 항상 먼저 움직일 필요는 없다. 갈리오가 사라지는 것 자체가 압박이므로, 라인을 버리고 성급히 뛰기보다 상대 미드의 이동을 끊는 선택도 있다.

## 같이 보면 좋은 문서

[[사일러스]]가 갈리오의 궁극기를 훔칠 수 있는 구도라면 아군만 보고 착지하지 않는다. 사일러스가 같은 범위 싸움을 뒤집을 수 있는지 함께 확인한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-galio-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-galio-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-galio-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-galio-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-galio-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-galio-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 상대와 웨이브를 따로 때리지 않는다

갈리오의 `전장의 돌풍(Q)`은 미니언을 밀면서 상대를 건드릴 때 가치가 가장 크다. 원거리 미니언을 향해 쏘되 돌풍의 경로가 상대 챔피언을 지나게 만든다. 상대만 노리다 빗나가면 라인 주도권과 견제를 함께 잃는다.[* [갈리오 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146848)]

`석상의 강타` 광역 피해는 근접 챔피언을 직접 누르지 않아도 옆 미니언을 때려 묻힐 수 있다. 상대가 막타를 치러 들어올 때 가까운 미니언을 쳐서 **상대의 평타 사거리 밖에서 짧게 교환**한다.

## W는 길게 모으는 것이 항상 정답이 아니다

> 도발 범위에서 곧 벗어날 상대라면 짧게 끊고, 도망갈 길이 막힌 상대라면 더 모은다.

- 이동기가 남은 원거리 상대에게는 `듀란드의 방패(W)`를 짧게 사용한다.
- 아군 쪽으로 도망치는 상대에게는 `정의의 주먹(E)`을 먼저 맞히고 도발을 잇는다.
- `E`의 시작 동작은 잠깐 뒤로 물러나므로, 벽과 너무 가깝거나 포탑 앞이면 예상한 거리가 나오지 않는지 확인한다.

## 라인을 민 다음에만 자리를 비운다

| 라인 상태 | 행동 |
| --- | --- |
| 적 포탑에 웨이브가 들어감 | 강가 시야를 잡거나 궁극기 사거리 안의 사이드를 살핀다. |
| 중앙에 웨이브가 만남 | `Q`와 강화 평타로 먼저 정리한다. |
| 아군 포탑에 큰 웨이브가 옴 | 무리한 합류보다 경험치와 포탑 피해를 막는다. |

궁극기가 있다는 이유만으로 항상 먼저 움직일 필요는 없다. 갈리오가 사라지는 것 자체가 압박이므로, 라인을 버리고 성급히 뛰기보다 상대 미드의 이동을 끊는 선택도 있다.

## 같이 보면 좋은 문서

[[사일러스]]가 갈리오의 궁극기를 훔칠 수 있는 구도라면 아군만 보고 착지하지 않는다. 사일러스가 같은 범위 싸움을 뒤집을 수 있는지 함께 확인한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-galio-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## Q의 왕복 경로로 웨이브를 접는다

`시간의 톱니바퀴(Q)`는 나갈 때보다 돌아오는 경로까지 맞혀야 라인 정리와 교환이 완성된다. 미니언이 일렬로 올 때 던지고, 돌아오는 위치에 상대가 막타를 치러 서게 만든다.[* [미드 에코 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147488)][* [에코 운영 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=116830)]

상대를 맞히겠다고 `Q` 각도를 비틀어 웨이브를 놓치면 다음 교환 전에 미니언이 쌓인다. **라인을 밀 목적과 체력을 깎을 목적을 한 번의 Q로 겹칠 수 있을 때** 가장 좋다.

## W는 적중보다 이동을 강요한다

`평행 시간 교차(W)`는 발동까지 시간이 있어 보고 맞히기 어렵다. 상대가 이동해야 할 곳에 미리 깐다.

- 대포 미니언을 먹으러 올 자리 뒤쪽
- 아군 정글을 보고 포탑으로 도망갈 경로
- 내가 `시간 도약(E)`으로 들어간 뒤 빠질 방향

상대가 장판 밖으로 피하면 그만큼 막타나 좋은 위치를 포기한 것이다. 기절만 성공으로 보지 않는다. 에코가 장판에 들어가 얻는 보호막으로 짧은 교환만 하고 나오는 선택도 충분하다.

## 3타 뒤에는 더 쫓지 않아도 된다

| 상황 | 판단 |
| --- | --- |
| 패시브 3타 발동 + 이동 속도 획득 | 상대 핵심 스킬이 남았으면 곧바로 빠진다. |
| `E` 첫 이동만 사용 | 상대 반응을 보고 강화 공격의 순간이동을 쓸지 정한다. |
| 궁극기 잔상이 웨이브 뒤에 있음 | 잔상 위치가 안전할 때만 긴 교환을 허용한다. |

궁극기는 체력을 되돌리지만 교환을 시작한 위치까지 안전하게 만들어 주지는 않는다. 잔상이 적 포탑 쪽에 남아 있으면 회복을 믿고 버티지 않는다.

## 같이 보면 좋은 문서

[[다이애나]]처럼 한 번에 붙는 챔피언을 상대할 때는 `W`를 내 발밑보다 **상대가 추격해 들어올 한 걸음 뒤**에 두어 재진입을 막는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-ekko-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-ekko-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-ekko-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-ekko-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-ekko-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-ekko-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## Q의 왕복 경로로 웨이브를 접는다

`시간의 톱니바퀴(Q)`는 나갈 때보다 돌아오는 경로까지 맞혀야 라인 정리와 교환이 완성된다. 미니언이 일렬로 올 때 던지고, 돌아오는 위치에 상대가 막타를 치러 서게 만든다.[* [미드 에코 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147488)][* [에코 운영 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=116830)]

상대를 맞히겠다고 `Q` 각도를 비틀어 웨이브를 놓치면 다음 교환 전에 미니언이 쌓인다. **라인을 밀 목적과 체력을 깎을 목적을 한 번의 Q로 겹칠 수 있을 때** 가장 좋다.

## W는 적중보다 이동을 강요한다

`평행 시간 교차(W)`는 발동까지 시간이 있어 보고 맞히기 어렵다. 상대가 이동해야 할 곳에 미리 깐다.

- 대포 미니언을 먹으러 올 자리 뒤쪽
- 아군 정글을 보고 포탑으로 도망갈 경로
- 내가 `시간 도약(E)`으로 들어간 뒤 빠질 방향

상대가 장판 밖으로 피하면 그만큼 막타나 좋은 위치를 포기한 것이다. 기절만 성공으로 보지 않는다. 에코가 장판에 들어가 얻는 보호막으로 짧은 교환만 하고 나오는 선택도 충분하다.

## 3타 뒤에는 더 쫓지 않아도 된다

| 상황 | 판단 |
| --- | --- |
| 패시브 3타 발동 + 이동 속도 획득 | 상대 핵심 스킬이 남았으면 곧바로 빠진다. |
| `E` 첫 이동만 사용 | 상대 반응을 보고 강화 공격의 순간이동을 쓸지 정한다. |
| 궁극기 잔상이 웨이브 뒤에 있음 | 잔상 위치가 안전할 때만 긴 교환을 허용한다. |

궁극기는 체력을 되돌리지만 교환을 시작한 위치까지 안전하게 만들어 주지는 않는다. 잔상이 적 포탑 쪽에 남아 있으면 회복을 믿고 버티지 않는다.

## 같이 보면 좋은 문서

[[다이애나]]처럼 한 번에 붙는 챔피언을 상대할 때는 `W`를 내 발밑보다 **상대가 추격해 들어올 한 걸음 뒤**에 두어 재진입을 막는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-ekko-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 세 번째 기본 공격을 미리 준비한다

다이애나는 세 번째 기본 공격이 광역 피해를 준다. 상대가 막타를 먹으러 들어오기 전에 미니언에 두 번 공격해 두면, 다음 기본 공격 하나로 챔피언과 웨이브를 함께 칠 수 있다. 다만 광역 피해 때문에 라인이 밀리므로 정글 위치가 보이지 않을 때는 스택을 무조건 소비하지 않는다.

## Q 표식이 진입 허가증이다

`초승달 검기(Q)`가 맞은 대상에게 `월광 쇄도(E)`를 쓰면 E를 다시 사용할 수 있다. **표식 없는 상대에게 먼저 돌진하면 퇴로와 추격 수단을 한 번에 잃는다.**[* [에코의 다이애나 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144254)][* [다이애나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147829)]

- `Q`가 빗나가면 억지로 `E`를 쓰지 않는다.
- 미니언과 챔피언을 함께 맞혀, 미니언을 중간 발판이나 퇴로로 남긴다.
- `은빛 가호(W)` 구체 세 개가 모두 터질 거리에서만 긴 교환을 한다.

## 짧은 교환과 긴 교환을 구분한다

| 목적 | 순서의 핵심 |
| --- | --- |
| 체력만 깎기 | `Q` 적중 뒤 `E-W-평타`, 상대 핵심 스킬이 오기 전에 미니언으로 재이동한다. |
| 킬 압박 | 상대 이동기가 빠진 뒤 표식과 두 번째 E를 추격용으로 남긴다. |
| 갱 회피 | 전방 미니언에 E를 먼저 쓰지 말고, 뒤쪽 미니언을 탈 수 있게 남긴다. |

6레벨 이후 `달빛 낙하(R)`를 쓸 때는 상대를 끌어당기는 것보다 이후에 빠질 위치를 먼저 본다. 미드 한가운데서 한 명을 잡겠다고 적 정글 쪽으로 돌진하면, 궁극기를 맞혀도 살아 나오기 어렵다.

## 같이 보면 좋은 문서

같은 근접 AP 챔피언인 [[사일러스]]는 낮은 체력에서 회복하며 교환을 늘이고, 다이애나는 보호막과 표식 재사용으로 짧은 시간에 두 번 붙는다. 상대할 때도 둘의 두 번째 진입 조건을 다르게 본다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-diana-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-diana-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-diana-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-diana-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-diana-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-diana-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 세 번째 기본 공격을 미리 준비한다

다이애나는 세 번째 기본 공격이 광역 피해를 준다. 상대가 막타를 먹으러 들어오기 전에 미니언에 두 번 공격해 두면, 다음 기본 공격 하나로 챔피언과 웨이브를 함께 칠 수 있다. 다만 광역 피해 때문에 라인이 밀리므로 정글 위치가 보이지 않을 때는 스택을 무조건 소비하지 않는다.

## Q 표식이 진입 허가증이다

`초승달 검기(Q)`가 맞은 대상에게 `월광 쇄도(E)`를 쓰면 E를 다시 사용할 수 있다. **표식 없는 상대에게 먼저 돌진하면 퇴로와 추격 수단을 한 번에 잃는다.**[* [에코의 다이애나 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144254)][* [다이애나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147829)]

- `Q`가 빗나가면 억지로 `E`를 쓰지 않는다.
- 미니언과 챔피언을 함께 맞혀, 미니언을 중간 발판이나 퇴로로 남긴다.
- `은빛 가호(W)` 구체 세 개가 모두 터질 거리에서만 긴 교환을 한다.

## 짧은 교환과 긴 교환을 구분한다

| 목적 | 순서의 핵심 |
| --- | --- |
| 체력만 깎기 | `Q` 적중 뒤 `E-W-평타`, 상대 핵심 스킬이 오기 전에 미니언으로 재이동한다. |
| 킬 압박 | 상대 이동기가 빠진 뒤 표식과 두 번째 E를 추격용으로 남긴다. |
| 갱 회피 | 전방 미니언에 E를 먼저 쓰지 말고, 뒤쪽 미니언을 탈 수 있게 남긴다. |

6레벨 이후 `달빛 낙하(R)`를 쓸 때는 상대를 끌어당기는 것보다 이후에 빠질 위치를 먼저 본다. 미드 한가운데서 한 명을 잡겠다고 적 정글 쪽으로 돌진하면, 궁극기를 맞혀도 살아 나오기 어렵다.

## 같이 보면 좋은 문서

같은 근접 AP 챔피언인 [[사일러스]]는 낮은 체력에서 회복하며 교환을 늘이고, 다이애나는 보호막과 표식 재사용으로 짧은 시간에 두 번 붙는다. 상대할 때도 둘의 두 번째 진입 조건을 다르게 본다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-diana-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 낮은 체력 미니언이 곧 이동 경로다

이렐리아의 라인전은 `칼날 쇄도(Q)`로 처치할 수 있는 미니언을 몇 개 만들어 두는 데서 시작한다. 들어갈 때 쓸 미니언만 보지 말고, 교환 뒤 아군 쪽으로 돌아올 미니언도 남긴다.

- 원거리 미니언 체력을 비슷하게 깎아 연속 Q 경로를 만든다.
- Q 한 번에 죽지 않을 미니언으로 먼저 들어가지 않는다.
- 표식이 없는 챔피언에게 Q를 쓰면 초기화되지 않는다는 점을 확인한다.

## 패시브 중첩을 보고 싸운다

스킬을 맞힐 때마다 공격 속도 중첩이 쌓이고 최대 중첩에서는 기본 공격 피해도 강해진다.[* [이렐리아 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145057)] 상대가 미니언을 먹으러 왔다고 바로 진입하기보다 **Q로 중첩과 경로를 준비한 뒤** 싸운다.

| 상태 | 선택 |
| --- | --- |
| 중첩이 낮고 E가 없음 | 막타만 챙기고 교환하지 않는다. |
| 중첩이 높고 뒤쪽 미니언이 남음 | 짧게 진입한 뒤 Q로 복귀한다. |
| 적의 큰 물리 피해가 예고됨 | `저항의 춤(W)`으로 받아내고 곧바로 재평가한다. |

`W`는 충전 중 물리 피해를 크게 줄이고 끊기지 않는다. 그러나 제자리에서 충전하므로 마법 견제나 장판까지 모두 버티는 기술로 쓰면 안 된다.

## E는 첫 칼날보다 두 번째 칼날이 중요하다

`쌍검협무(E)`의 첫 칼날을 상대가 보는 곳에 던지면 두 번째 선을 읽기 쉽다. 첫 칼날을 내 발밑이나 시야가 덜 닿는 곳에 두고, 상대가 막타를 칠 때 두 번째 칼날로 선을 만든다. 적중해 표식이 생겨도 적 포탑 아래라면 Q로 따라가지 않는다.

## 같이 보면 좋은 문서

[[야스오]]와 맞붙을 때 E와 궁극기 중 어느 투사체에 장막을 쓰게 할지 나눠 생각한다. 장막이 빠진 뒤 다음 표식을 노리는 편이 한 번에 모든 스킬을 던지는 것보다 안전하다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-irelia-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-irelia-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-irelia-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-irelia-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-irelia-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-irelia-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 낮은 체력 미니언이 곧 이동 경로다

이렐리아의 라인전은 `칼날 쇄도(Q)`로 처치할 수 있는 미니언을 몇 개 만들어 두는 데서 시작한다. 들어갈 때 쓸 미니언만 보지 말고, 교환 뒤 아군 쪽으로 돌아올 미니언도 남긴다.

- 원거리 미니언 체력을 비슷하게 깎아 연속 Q 경로를 만든다.
- Q 한 번에 죽지 않을 미니언으로 먼저 들어가지 않는다.
- 표식이 없는 챔피언에게 Q를 쓰면 초기화되지 않는다는 점을 확인한다.

## 패시브 중첩을 보고 싸운다

스킬을 맞힐 때마다 공격 속도 중첩이 쌓이고 최대 중첩에서는 기본 공격 피해도 강해진다.[* [이렐리아 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145057)] 상대가 미니언을 먹으러 왔다고 바로 진입하기보다 **Q로 중첩과 경로를 준비한 뒤** 싸운다.

| 상태 | 선택 |
| --- | --- |
| 중첩이 낮고 E가 없음 | 막타만 챙기고 교환하지 않는다. |
| 중첩이 높고 뒤쪽 미니언이 남음 | 짧게 진입한 뒤 Q로 복귀한다. |
| 적의 큰 물리 피해가 예고됨 | `저항의 춤(W)`으로 받아내고 곧바로 재평가한다. |

`W`는 충전 중 물리 피해를 크게 줄이고 끊기지 않는다. 그러나 제자리에서 충전하므로 마법 견제나 장판까지 모두 버티는 기술로 쓰면 안 된다.

## E는 첫 칼날보다 두 번째 칼날이 중요하다

`쌍검협무(E)`의 첫 칼날을 상대가 보는 곳에 던지면 두 번째 선을 읽기 쉽다. 첫 칼날을 내 발밑이나 시야가 덜 닿는 곳에 두고, 상대가 막타를 칠 때 두 번째 칼날로 선을 만든다. 적중해 표식이 생겨도 적 포탑 아래라면 Q로 따라가지 않는다.

## 같이 보면 좋은 문서

[[야스오]]와 맞붙을 때 E와 궁극기 중 어느 투사체에 장막을 쓰게 할지 나눠 생각한다. 장막이 빠진 뒤 다음 표식을 노리는 편이 한 번에 모든 스킬을 던지는 것보다 안전하다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-irelia-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 라인 정리와 견제를 같은 방향에 둔다

코르키는 `인광탄(Q)`과 `개틀링 건(E)`으로 미니언을 밀면서 상대를 함께 때릴 때 라인전이 편해진다.[* [코르키 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=134908)][* [코르키 딜교 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148079)] **상대만 향해 Q를 던지다 빗나가면 웨이브를 밀 수단과 견제 수단을 동시에 잃는다.**

- 상대가 원거리 미니언 옆에 설 때 Q 범위를 겹친다.
- E를 켰다면 정면을 계속 향해야 한다. 옆으로 크게 틀어 피해 시간을 버리지 않는다.
- 평타 한 대를 더 치려고 미니언 앞으로 나가 `발키리(W)`를 강제로 쓰지 않는다.

## W는 공격 버튼보다 퇴로다

상대의 진입기가 빠졌을 때 앞 `W`로 따라갈 수 있지만, 정글 위치가 보이지 않으면 뒤로 빠질 수단을 남긴다. 특히 미드 중앙에서 옆 벽을 넘은 뒤에는 다음 웨이브와 멀어지므로, 킬이 확실하지 않다면 걸어서 압박한다.

| 상대 상태 | 코르키의 선택 |
| --- | --- |
| 핵심 이동기가 남음 | 미사일과 Q로 체력만 깎는다. |
| 진입기가 빠짐 | E를 켜고 앞으로 걸어 짧게 맞교환한다. |
| 적 정글이 안 보임 | W를 보존하고 웨이브 뒤에서 공격한다. |

## 큰 미사일은 막타보다 챔피언에게

`미사일 폭격(R)`은 세 번째 발사가 더 강하다. 작은 미사일로 웨이브 체력을 정리하고 큰 미사일이 준비될 때 상대가 막타를 먹는 자리를 겨눈다. 미사일을 연속으로 모두 쓰면 다음 웨이브에서 압박이 사라지므로 한 발씩 목적을 정한다.

## 같이 보면 좋은 문서

[[스몰더]]와 달리 코르키는 Q 막타로 영구 중첩을 모으지 않는다. 성장 욕심 때문에 라인을 오래 붙잡기보다, 빠르게 민 뒤 안전한 위치에서 다음 웨이브를 기다리는 것이 낫다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-corki-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-corki-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-corki-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-corki-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-corki-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-corki-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 라인 정리와 견제를 같은 방향에 둔다

코르키는 `인광탄(Q)`과 `개틀링 건(E)`으로 미니언을 밀면서 상대를 함께 때릴 때 라인전이 편해진다.[* [코르키 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=134908)][* [코르키 딜교 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148079)] **상대만 향해 Q를 던지다 빗나가면 웨이브를 밀 수단과 견제 수단을 동시에 잃는다.**

- 상대가 원거리 미니언 옆에 설 때 Q 범위를 겹친다.
- E를 켰다면 정면을 계속 향해야 한다. 옆으로 크게 틀어 피해 시간을 버리지 않는다.
- 평타 한 대를 더 치려고 미니언 앞으로 나가 `발키리(W)`를 강제로 쓰지 않는다.

## W는 공격 버튼보다 퇴로다

상대의 진입기가 빠졌을 때 앞 `W`로 따라갈 수 있지만, 정글 위치가 보이지 않으면 뒤로 빠질 수단을 남긴다. 특히 미드 중앙에서 옆 벽을 넘은 뒤에는 다음 웨이브와 멀어지므로, 킬이 확실하지 않다면 걸어서 압박한다.

| 상대 상태 | 코르키의 선택 |
| --- | --- |
| 핵심 이동기가 남음 | 미사일과 Q로 체력만 깎는다. |
| 진입기가 빠짐 | E를 켜고 앞으로 걸어 짧게 맞교환한다. |
| 적 정글이 안 보임 | W를 보존하고 웨이브 뒤에서 공격한다. |

## 큰 미사일은 막타보다 챔피언에게

`미사일 폭격(R)`은 세 번째 발사가 더 강하다. 작은 미사일로 웨이브 체력을 정리하고 큰 미사일이 준비될 때 상대가 막타를 먹는 자리를 겨눈다. 미사일을 연속으로 모두 쓰면 다음 웨이브에서 압박이 사라지므로 한 발씩 목적을 정한다.

## 같이 보면 좋은 문서

[[스몰더]]와 달리 코르키는 Q 막타로 영구 중첩을 모으지 않는다. 성장 욕심 때문에 라인을 오래 붙잡기보다, 빠르게 민 뒤 안전한 위치에서 다음 웨이브를 기다리는 것이 낫다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-corki-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## Q를 먼저 쏘고 관문을 연다

캐논 상태의 `전격 폭발(Q)`을 먼저 쏜 뒤 제이스 바로 앞에 `가속 관문(E)`을 열면, 강화된 투사체를 상대가 보고 피할 시간이 줄어든다.[* [미드 제이스 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148113)] **관문을 너무 멀리 깔면 상대에게 발사 방향을 미리 알려 준다.**

- 견제: `Q → 내 앞 E`
- 빠지며 카이팅: `E → Q`
- 이동: 관문을 진행 방향과 나란히 길게 깔아 통과 시간을 늘린다.

## 해머 진입은 밀쳐낼 위치까지 본다

가까운 적 미니언에 `하늘로!(Q)`를 써 챔피언까지 범위 피해를 묻힐 수 있다. 그러나 들어간 뒤 `천둥 강타(E)`가 상대를 안전한 포탑 쪽으로 밀어 주면 손해다. 상대를 아군 쪽이나 벽 쪽으로 밀 수 있는 각에서만 해머 교환을 연다.

| 해머로 들어가도 되는 때 | 캐논을 유지할 때 |
| --- | --- |
| 상대 핵심 CC가 빠짐 | 적 정글이 안 보임 |
| 밀친 뒤 걸어서 빠질 수 있음 | 퇴로 미니언이 없음 |
| 원거리 기술을 이미 맞힘 | 웨이브가 적 포탑에 가까움 |

## 초반 우위가 과한 전진의 허가는 아니다

제이스는 낮은 레벨부터 기본 공격과 여섯 개 기술로 압박할 수 있지만, 도주 전용 기술은 없다. 상대 체력을 깎았더라도 정글 위치가 보이지 않으면 웨이브 옆을 넘지 않는다. 변환 뒤 잠깐 얻는 이동 속도는 스킬을 피하고 거리를 다시 잡는 데 쓴다.

> 상대가 로밍을 갔을 때는 뒤늦게 따라갈지, 웨이브를 포탑에 넣을지 하나를 빠르게 정한다. 두 행동을 반씩 하면 둘 다 늦는다.

## 같이 보면 좋은 문서

[[사이온]]의 Q 충전은 해머 E로 끊거나 밀어낼 수 있지만, 이미 사거리 밖이라면 캐논 견제를 유지한다. 끊겠다고 먼저 들어가 다른 스킬을 전부 맞지 않는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-jayce-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-jayce-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-jayce-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-jayce-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-jayce-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-jayce-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## Q를 먼저 쏘고 관문을 연다

캐논 상태의 `전격 폭발(Q)`을 먼저 쏜 뒤 제이스 바로 앞에 `가속 관문(E)`을 열면, 강화된 투사체를 상대가 보고 피할 시간이 줄어든다.[* [미드 제이스 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148113)] **관문을 너무 멀리 깔면 상대에게 발사 방향을 미리 알려 준다.**

- 견제: `Q → 내 앞 E`
- 빠지며 카이팅: `E → Q`
- 이동: 관문을 진행 방향과 나란히 길게 깔아 통과 시간을 늘린다.

## 해머 진입은 밀쳐낼 위치까지 본다

가까운 적 미니언에 `하늘로!(Q)`를 써 챔피언까지 범위 피해를 묻힐 수 있다. 그러나 들어간 뒤 `천둥 강타(E)`가 상대를 안전한 포탑 쪽으로 밀어 주면 손해다. 상대를 아군 쪽이나 벽 쪽으로 밀 수 있는 각에서만 해머 교환을 연다.

| 해머로 들어가도 되는 때 | 캐논을 유지할 때 |
| --- | --- |
| 상대 핵심 CC가 빠짐 | 적 정글이 안 보임 |
| 밀친 뒤 걸어서 빠질 수 있음 | 퇴로 미니언이 없음 |
| 원거리 기술을 이미 맞힘 | 웨이브가 적 포탑에 가까움 |

## 초반 우위가 과한 전진의 허가는 아니다

제이스는 낮은 레벨부터 기본 공격과 여섯 개 기술로 압박할 수 있지만, 도주 전용 기술은 없다. 상대 체력을 깎았더라도 정글 위치가 보이지 않으면 웨이브 옆을 넘지 않는다. 변환 뒤 잠깐 얻는 이동 속도는 스킬을 피하고 거리를 다시 잡는 데 쓴다.

> 상대가 로밍을 갔을 때는 뒤늦게 따라갈지, 웨이브를 포탑에 넣을지 하나를 빠르게 정한다. 두 행동을 반씩 하면 둘 다 늦는다.

## 같이 보면 좋은 문서

[[사이온]]의 Q 충전은 해머 E로 끊거나 밀어낼 수 있지만, 이미 사거리 밖이라면 캐논 견제를 유지한다. 끊겠다고 먼저 들어가 다른 스킬을 전부 맞지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-jayce-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## Q 한 번마다 막타와 견제 중 하나를 확실히 고른다

스몰더는 `초강력 화염 숨결(Q)`로 유닛을 처치하거나 챔피언을 맞혀 영구 중첩을 쌓는다. 애매한 체력의 미니언에 Q를 써서 막타를 놓치고 챔피언도 못 맞히는 상황을 가장 먼저 줄인다.

- 안전한 막타가 있으면 Q로 확정한다.
- 상대가 막타를 먹으러 멈추면 Q로 챔피언을 건드린다.
- 둘 다 어렵다면 평타로 미니언 체력을 정리해 다음 Q를 준비한다.

## W는 맞힐 수 있을 때만 쓴다

`에취!(W)`는 적 챔피언에게 맞으면 폭발하지만, 빗나갔을 때 자원 손해가 크다.[* [스몰더 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148096)] 상대가 원거리 미니언을 치려고 멈추거나 좁은 강가 입구로 움직일 때 사용한다.

| W 결과 | 다음 행동 |
| --- | --- |
| 챔피언 적중 | 폭발 범위와 Q 사거리가 겹칠 때만 한 걸음 전진한다. |
| 미니언만 적중 | 라인을 밀 목적이었는지 확인하고 더 따라가지 않는다. |
| 빗나감 | 다음 웨이브에서는 Q 막타에 집중한다. |

## E는 벽을 넘는 마지막 수단으로 남긴다

`펄럭펄럭(E)`은 지형을 무시할 수 있어 짧은 견제보다 갱 회피 가치가 크다. 적 정글이 안 보일 때 앞으로 쓰면 미드의 짧은 벽조차 안전지대가 되지 못한다. E를 켰을 때는 체력이 낮은 적을 자동으로 노리는 공격보다 **어느 벽을 넘어 끝낼지**를 먼저 정한다.

궁극기는 중앙 경로로 스몰더 자신을 맞히면 회복할 수 있다. 라인에서 맞교환 뒤 사용할 때는 상대만 겨누지 말고 나와 상대가 같은 직선에 놓이도록 움직인다.

## 같이 보면 좋은 문서

[[코르키]]는 미사일을 저장해 순간 압박을 만들고, 스몰더는 Q 사용마다 미래의 힘을 쌓는다. 둘 다 원거리라고 같은 속도로 웨이브를 지우면 스몰더가 챙길 Q 막타가 사라질 수 있다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-smolder-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-smolder-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-smolder-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-smolder-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-smolder-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-smolder-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## Q 한 번마다 막타와 견제 중 하나를 확실히 고른다

스몰더는 `초강력 화염 숨결(Q)`로 유닛을 처치하거나 챔피언을 맞혀 영구 중첩을 쌓는다. 애매한 체력의 미니언에 Q를 써서 막타를 놓치고 챔피언도 못 맞히는 상황을 가장 먼저 줄인다.

- 안전한 막타가 있으면 Q로 확정한다.
- 상대가 막타를 먹으러 멈추면 Q로 챔피언을 건드린다.
- 둘 다 어렵다면 평타로 미니언 체력을 정리해 다음 Q를 준비한다.

## W는 맞힐 수 있을 때만 쓴다

`에취!(W)`는 적 챔피언에게 맞으면 폭발하지만, 빗나갔을 때 자원 손해가 크다.[* [스몰더 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148096)] 상대가 원거리 미니언을 치려고 멈추거나 좁은 강가 입구로 움직일 때 사용한다.

| W 결과 | 다음 행동 |
| --- | --- |
| 챔피언 적중 | 폭발 범위와 Q 사거리가 겹칠 때만 한 걸음 전진한다. |
| 미니언만 적중 | 라인을 밀 목적이었는지 확인하고 더 따라가지 않는다. |
| 빗나감 | 다음 웨이브에서는 Q 막타에 집중한다. |

## E는 벽을 넘는 마지막 수단으로 남긴다

`펄럭펄럭(E)`은 지형을 무시할 수 있어 짧은 견제보다 갱 회피 가치가 크다. 적 정글이 안 보일 때 앞으로 쓰면 미드의 짧은 벽조차 안전지대가 되지 못한다. E를 켰을 때는 체력이 낮은 적을 자동으로 노리는 공격보다 **어느 벽을 넘어 끝낼지**를 먼저 정한다.

궁극기는 중앙 경로로 스몰더 자신을 맞히면 회복할 수 있다. 라인에서 맞교환 뒤 사용할 때는 상대만 겨누지 말고 나와 상대가 같은 직선에 놓이도록 움직인다.

## 같이 보면 좋은 문서

[[코르키]]는 미사일을 저장해 순간 압박을 만들고, 스몰더는 Q 사용마다 미래의 힘을 쌓는다. 둘 다 원거리라고 같은 속도로 웨이브를 지우면 스몰더가 챙길 Q 막타가 사라질 수 있다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-smolder-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 라인을 당기기 어려운 챔피언임을 먼저 인정한다

트리스타나는 미니언을 처치할 때 주변에 피해를 주므로 막타만 쳐도 웨이브가 밀리기 쉽다. 완벽한 프리징을 고집하기보다 **먼저 밀고 강가 쪽을 안전하게 만든 뒤** 다음 웨이브를 받는다.

- 적 정글이 안 보이면 원거리 미니언보다 뒤에 선다.
- 폭발 피해로 다음 미니언 막타가 예상보다 빨리 사라지는지 본다.
- 포탑에 웨이브를 넣은 뒤 남은 미니언을 치려고 오래 머물지 않는다.

## 폭발 화약의 네 번째 중첩을 목표로 한다

`폭발 화약(E)`는 기본 공격과 스킬로 중첩을 쌓을수록 강해진다. 상대가 네 번째 공격 전에 사거리 밖으로 빠질 수 있다면 E부터 붙이지 않는다.[* [트리스타나 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144608)]

| E를 붙인 뒤 | 판단 |
| --- | --- |
| 상대 CC가 남음 | `속사(Q)`와 평타로 가능한 만큼만 쌓고 W는 보존한다. |
| 상대 이동기가 빠짐 | W 착지 피해까지 더해 최대 중첩 폭발을 노린다. |
| 적 정글이 보이지 않음 | 앞으로 점프하지 않고 평타 사거리에서 끝낸다. |

## W는 상대 CC 다음에 쓴다

`로켓 점프(W)`는 진입과 도주를 모두 맡는다. 상대의 속박이나 밀치기가 남아 있을 때 먼저 날면 착지 전에 교환이 끊길 수 있다. 걸어서 E를 붙일 수 있다면 먼저 걸어가고, 핵심 기술이 빠진 뒤 점프로 따라간다.

`대구경 탄환(R)`은 마무리 피해뿐 아니라 거리를 다시 벌리는 기술이다. E가 붙은 상대를 너무 일찍 밀어 폭발 중첩을 포기하지 말고, 반대로 적 정글이 나타났다면 피해보다 생존을 위해 바로 밀어낸다.

## 같이 보면 좋은 문서

[[아크샨]]처럼 낮은 레벨부터 기본 공격 중첩으로 압박하지만, 트리스타나는 앞으로 점프한 뒤 돌아올 벽 기술이 없다. 같은 킬각이라도 정글 위치 확인을 더 엄격하게 한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-tristana-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-tristana-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-tristana-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-tristana-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-tristana-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-tristana-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## 라인을 당기기 어려운 챔피언임을 먼저 인정한다

트리스타나는 미니언을 처치할 때 주변에 피해를 주므로 막타만 쳐도 웨이브가 밀리기 쉽다. 완벽한 프리징을 고집하기보다 **먼저 밀고 강가 쪽을 안전하게 만든 뒤** 다음 웨이브를 받는다.

- 적 정글이 안 보이면 원거리 미니언보다 뒤에 선다.
- 폭발 피해로 다음 미니언 막타가 예상보다 빨리 사라지는지 본다.
- 포탑에 웨이브를 넣은 뒤 남은 미니언을 치려고 오래 머물지 않는다.

## 폭발 화약의 네 번째 중첩을 목표로 한다

`폭발 화약(E)`는 기본 공격과 스킬로 중첩을 쌓을수록 강해진다. 상대가 네 번째 공격 전에 사거리 밖으로 빠질 수 있다면 E부터 붙이지 않는다.[* [트리스타나 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144608)]

| E를 붙인 뒤 | 판단 |
| --- | --- |
| 상대 CC가 남음 | `속사(Q)`와 평타로 가능한 만큼만 쌓고 W는 보존한다. |
| 상대 이동기가 빠짐 | W 착지 피해까지 더해 최대 중첩 폭발을 노린다. |
| 적 정글이 보이지 않음 | 앞으로 점프하지 않고 평타 사거리에서 끝낸다. |

## W는 상대 CC 다음에 쓴다

`로켓 점프(W)`는 진입과 도주를 모두 맡는다. 상대의 속박이나 밀치기가 남아 있을 때 먼저 날면 착지 전에 교환이 끊길 수 있다. 걸어서 E를 붙일 수 있다면 먼저 걸어가고, 핵심 기술이 빠진 뒤 점프로 따라간다.

`대구경 탄환(R)`은 마무리 피해뿐 아니라 거리를 다시 벌리는 기술이다. E가 붙은 상대를 너무 일찍 밀어 폭발 중첩을 포기하지 말고, 반대로 적 정글이 나타났다면 피해보다 생존을 위해 바로 밀어낸다.

## 같이 보면 좋은 문서

[[아크샨]]처럼 낮은 레벨부터 기본 공격 중첩으로 압박하지만, 트리스타나는 앞으로 점프한 뒤 돌아올 벽 기술이 없다. 같은 킬각이라도 정글 위치 확인을 더 엄격하게 한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-tristana-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## Q는 미니언을 통과시켜 사거리를 늘린다

`복수의 부메랑(Q)`은 적에게 맞을 때마다 더 멀리 날아간다. 상대를 직접 겨누기보다 미니언 줄을 통과시켜 뒤의 챔피언까지 맞힌다. 왕복 경로가 다르므로 첫 타를 맞혔다면 상대의 퇴로 쪽으로 걸어 돌아오는 Q까지 겹친다.[* [아크샨 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147363)]

## 두 번째 탄은 피해와 이동 중 하나를 고른다

기본 공격 뒤 자동으로 나가는 두 번째 탄을 끝까지 쏘면 피해와 3타 효과를 빠르게 쌓을 수 있다. **반대로 두 번째 탄을 취소하면 이동 속도를 얻는다.**

- 상대가 도망갈 길이 없으면 두 발을 모두 쏜다.
- 적의 논타깃 기술이 날아오면 두 번째 탄을 취소하고 옆으로 움직인다.
- 보호막이 발동한 뒤에는 한 대를 더 욕심내기보다 사거리 밖으로 빠진다.

| 원하는 E 궤도 | 갈고리 위치 |
| --- | --- |
| 빠르게 붙기 | 내 쪽에 가까운 벽에 걸어 작은 원을 돈다. |
| 도망가는 적 추격 | 상대 쪽 벽에 걸어 더 큰 원을 그린다. |
| 갱 회피 | 적 챔피언과 부딪히지 않을 빈 경로를 먼저 본다. |

## E는 충돌하면 끝난다

`영웅의 비상(E)`은 챔피언이나 지형에 부딪히면 떨어진다. 화려하게 긴 궤도를 그리는 것보다 적과 미니언 사이의 빈 공간을 확보하는 일이 먼저다. 벽에 갈고리를 걸고 이동 방향을 여러 번 입력하다 즉시 뛰어내리지 않도록 한 번만 확실히 지정한다.

궁극기 탄환은 챔피언뿐 아니라 미니언과 구조물에도 막힌다. 라인에서 상대가 낮은 체력이라고 바로 조준하지 말고, 다음 웨이브와 포탑 사이로 숨을 수 있는지 확인한다.

## 같이 보면 좋은 문서

[[트리스타나]]와 맞라인에서는 서로 낮은 레벨부터 강하다. 트리스타나가 E를 붙였을 때 갈고리로 큰 원을 돌려 시간을 끌 수 있는지, 충돌할 미니언이 많은지를 먼저 본다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-akshan-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-akshan-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-akshan-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-akshan-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-akshan-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-akshan-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## Q는 미니언을 통과시켜 사거리를 늘린다

`복수의 부메랑(Q)`은 적에게 맞을 때마다 더 멀리 날아간다. 상대를 직접 겨누기보다 미니언 줄을 통과시켜 뒤의 챔피언까지 맞힌다. 왕복 경로가 다르므로 첫 타를 맞혔다면 상대의 퇴로 쪽으로 걸어 돌아오는 Q까지 겹친다.[* [아크샨 공략 원문](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147363)]

## 두 번째 탄은 피해와 이동 중 하나를 고른다

기본 공격 뒤 자동으로 나가는 두 번째 탄을 끝까지 쏘면 피해와 3타 효과를 빠르게 쌓을 수 있다. **반대로 두 번째 탄을 취소하면 이동 속도를 얻는다.**

- 상대가 도망갈 길이 없으면 두 발을 모두 쏜다.
- 적의 논타깃 기술이 날아오면 두 번째 탄을 취소하고 옆으로 움직인다.
- 보호막이 발동한 뒤에는 한 대를 더 욕심내기보다 사거리 밖으로 빠진다.

| 원하는 E 궤도 | 갈고리 위치 |
| --- | --- |
| 빠르게 붙기 | 내 쪽에 가까운 벽에 걸어 작은 원을 돈다. |
| 도망가는 적 추격 | 상대 쪽 벽에 걸어 더 큰 원을 그린다. |
| 갱 회피 | 적 챔피언과 부딪히지 않을 빈 경로를 먼저 본다. |

## E는 충돌하면 끝난다

`영웅의 비상(E)`은 챔피언이나 지형에 부딪히면 떨어진다. 화려하게 긴 궤도를 그리는 것보다 적과 미니언 사이의 빈 공간을 확보하는 일이 먼저다. 벽에 갈고리를 걸고 이동 방향을 여러 번 입력하다 즉시 뛰어내리지 않도록 한 번만 확실히 지정한다.

궁극기 탄환은 챔피언뿐 아니라 미니언과 구조물에도 막힌다. 라인에서 상대가 낮은 체력이라고 바로 조준하지 말고, 다음 웨이브와 포탑 사이로 숨을 수 있는지 확인한다.

## 같이 보면 좋은 문서

[[트리스타나]]와 맞라인에서는 서로 낮은 레벨부터 강하다. 트리스타나가 E를 붙였을 때 갈고리로 큰 원을 돌려 시간을 끌 수 있는지, 충돌할 미니언이 많은지를 먼저 본다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-akshan-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## Q 표식을 기본 공격으로 회수한다

`의식용 대못(Q)`은 대못을 던져 표식을 남기고, 기본 공격으로 표식을 소모해 추가 피해를 준다. Q만 맞히고 물러나면 교환의 절반만 쓴 셈이므로 **표식을 회수할 수 있는 거리에서 Q를 던지는가**를 먼저 본다.

- 상대가 막타를 치려고 멈출 때 Q를 던진다.
- 표식이 생겨도 적 미니언이 많으면 기본 공격 한 대를 포기한다.
- 여러 대못을 준비했을 때 한 번에 모두 던지지 말고 상대의 좌우 무빙을 확인한다.

## W의 체력 손실을 교환 비용에 넣는다

`영혼 점화(W)`는 공격 속도와 이동 속도를 주지만 로크 자신에게도 피해를 준다. 지속시간 뒤 일부를 회복하더라도, 그 전에 큰 피해를 받으면 회복을 기다릴 수 없다.[* [로크 공략 목록](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=173)]

| W를 켜기 좋은 때 | 보존할 때 |
| --- | --- |
| 상대 핵심 피해 기술이 빠짐 | 현재 체력이 낮음 |
| Q 표식을 기본 공격으로 회수 가능 | 상대가 사거리 밖으로 즉시 이탈 가능 |
| 교환 뒤 안전하게 물러날 길이 있음 | 적 정글 위치가 보이지 않음 |

## E는 진입 지점과 다음 대상을 함께 본다

`잿빛 추격(E)`는 지정 위치로 순간이동한 뒤 다음 대상을 향해 돌진한다. 첫 위치만 보고 누르면 원하지 않은 대상이나 위험한 방향으로 이어질 수 있다. 미니언 수가 많은 웨이브에서는 **도착 지점 뒤에 무엇이 있는지** 확인하고 사용한다.

> Q 표식 회수 → W의 이동 속도로 거리 조절 → E 보존. 모든 기술을 한 번의 교환에 쓰지 않는 것이 기본이다.

궁극기 `연옥(R)`은 적을 구속하고 조건에 따라 처형한다. 낮은 체력 표시만 보고 먼저 쓰기보다, 상대 이동기가 빠졌고 투사체 경로가 열렸는지 확인한다. 봉인으로 얻는 추가 위력은 다음 교환을 강하게 만들지만, 현재 웨이브를 버릴 이유는 아니다.

## 같이 보면 좋은 문서

[[아크샨]]처럼 기본 공격을 이어야 기술의 가치가 완성되는 원거리 챔피언이다. 다만 아크샨은 두 번째 탄을 취소해 이동하고, 로크는 W가 자기 체력을 소모하므로 같은 거리에서도 교환 비용이 다르다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-locke-20260912' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-locke-20260912') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-locke-20260912' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-locke-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-locke-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-ai-champion-locke-20260912' AND revision = 2
  AND general = '# 미드 라인 실전 운용

[[분류:미드]] [[분류:브루저/원딜]]

## Q 표식을 기본 공격으로 회수한다

`의식용 대못(Q)`은 대못을 던져 표식을 남기고, 기본 공격으로 표식을 소모해 추가 피해를 준다. Q만 맞히고 물러나면 교환의 절반만 쓴 셈이므로 **표식을 회수할 수 있는 거리에서 Q를 던지는가**를 먼저 본다.

- 상대가 막타를 치려고 멈출 때 Q를 던진다.
- 표식이 생겨도 적 미니언이 많으면 기본 공격 한 대를 포기한다.
- 여러 대못을 준비했을 때 한 번에 모두 던지지 말고 상대의 좌우 무빙을 확인한다.

## W의 체력 손실을 교환 비용에 넣는다

`영혼 점화(W)`는 공격 속도와 이동 속도를 주지만 로크 자신에게도 피해를 준다. 지속시간 뒤 일부를 회복하더라도, 그 전에 큰 피해를 받으면 회복을 기다릴 수 없다.[* [로크 공략 목록](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=173)]

| W를 켜기 좋은 때 | 보존할 때 |
| --- | --- |
| 상대 핵심 피해 기술이 빠짐 | 현재 체력이 낮음 |
| Q 표식을 기본 공격으로 회수 가능 | 상대가 사거리 밖으로 즉시 이탈 가능 |
| 교환 뒤 안전하게 물러날 길이 있음 | 적 정글 위치가 보이지 않음 |

## E는 진입 지점과 다음 대상을 함께 본다

`잿빛 추격(E)`는 지정 위치로 순간이동한 뒤 다음 대상을 향해 돌진한다. 첫 위치만 보고 누르면 원하지 않은 대상이나 위험한 방향으로 이어질 수 있다. 미니언 수가 많은 웨이브에서는 **도착 지점 뒤에 무엇이 있는지** 확인하고 사용한다.

> Q 표식 회수 → W의 이동 속도로 거리 조절 → E 보존. 모든 기술을 한 번의 교환에 쓰지 않는 것이 기본이다.

궁극기 `연옥(R)`은 적을 구속하고 조건에 따라 처형한다. 낮은 체력 표시만 보고 먼저 쓰기보다, 상대 이동기가 빠졌고 투사체 경로가 열렸는지 확인한다. 봉인으로 얻는 추가 위력은 다음 교환을 강하게 만들지만, 현재 웨이브를 버릴 이유는 아니다.

## 같이 보면 좋은 문서

[[아크샨]]처럼 기본 공격을 이어야 기술의 가치가 완성되는 원거리 챔피언이다. 다만 아크샨은 두 번째 탄을 취소해 이동하고, 로크는 W가 자기 체력을 소모하므로 같은 거리에서도 교환 비용이 다르다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-locke-20260913');
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — 짧은 교환은 불안정 표식까지 터뜨린다 · `Q` 기둥은 `E`의 출발점이다 · 궁극기는 정령보다 상대의 이동을 본다

[[분류:탑]] [[분류:탱커]]

## 라인에 오래 남는 힘을 웨이브 이득으로 바꾼다

**오른의 제작 능력은 귀환을 완전히 대신하는 기술이 아니라, 좋은 웨이브를 한 번 더 만들 수 있는 시간 차이다.**[* [입문자를 위한 오른 파헤치기](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137340)] 제작하려고 뒤로 빠지는 동안 상대가 라인을 밀 수 있으므로 다음 미니언이 어디에 있는지 먼저 본다. 체력과 마나가 부족하면 억지로 남지 않고, 버틸 수 있을 때만 제작 후 한 웨이브를 더 정리한다.

## `Q`를 맞힌 자리가 다음 싸움의 지형이다

**`용암 균열(Q)`은 둔화 뒤에 기둥을 남긴다.**[* [오른 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=138)] 상대를 맞히는 것만 보지 말고 **기둥과 벽 사이로 상대가 빠질 길**을 계산한다. 기둥이 생기기 전에 `화염 돌진(E)`을 누르면 벽 충돌이 늦거나 빗나간다. 상대가 기둥 반대편으로 물러났다면 억지로 돌진하지 않고 그만큼의 공간으로 막타와 라인 위치를 챙긴다.

## `W`의 마지막 불꽃 뒤에 기본 공격을 남긴다

**`불꽃 풀무질(W)`의 마지막 불꽃이 불안정을 묻힌다.** 끝까지 맞히지 못할 거리라면 마나를 써서 앞으로 걷기보다 `Q` 둔화를 먼저 만든다. 불안정이 묻은 뒤 기본 공격이나 다른 띄우기로 표식을 터뜨리는 데까지가 한 번의 교환이다. 표식을 남겨 둔 채 상대 포탑 쪽으로 한 대 더 따라가면 오른의 긴 기술 재사용 대기시간만 드러난다.

## 궁극기는 두 번째 박치기 자리를 먼저 고른다

**`대장장이 신의 부름(R)`은 첫 정령을 맞히는 것보다 되받아칠 각이 중요하다.** 정령이 오는 동안 상대만 보다가 벽이나 방해 효과에 막히지 않도록 **오른이 서 있을 자리와 박치기 방향을 먼저 정한다.** 좁은 길에서는 여러 명을 노릴 수 있지만 아군이 닿지 않는 거리라면 좋은 적중도 처치로 이어지지 않는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-top-tank-champion-ornn-20260913' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-ornn-20260913') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-ornn-20260913' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-ornn-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-ornn-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-top-tank-champion-ornn-20260913' AND revision = 2
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 짧은 교환은 불안정 표식까지 터뜨린다 · `Q` 기둥은 `E`의 출발점이다 · 궁극기는 정령보다 상대의 이동을 본다

[[분류:탑]] [[분류:탱커]]

## 라인에 오래 남는 힘을 웨이브 이득으로 바꾼다

**오른의 제작 능력은 귀환을 완전히 대신하는 기술이 아니라, 좋은 웨이브를 한 번 더 만들 수 있는 시간 차이다.**[* [입문자를 위한 오른 파헤치기](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137340)] 제작하려고 뒤로 빠지는 동안 상대가 라인을 밀 수 있으므로 다음 미니언이 어디에 있는지 먼저 본다. 체력과 마나가 부족하면 억지로 남지 않고, 버틸 수 있을 때만 제작 후 한 웨이브를 더 정리한다.

## `Q`를 맞힌 자리가 다음 싸움의 지형이다

**`용암 균열(Q)`은 둔화 뒤에 기둥을 남긴다.**[* [오른 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=138)] 상대를 맞히는 것만 보지 말고 **기둥과 벽 사이로 상대가 빠질 길**을 계산한다. 기둥이 생기기 전에 `화염 돌진(E)`을 누르면 벽 충돌이 늦거나 빗나간다. 상대가 기둥 반대편으로 물러났다면 억지로 돌진하지 않고 그만큼의 공간으로 막타와 라인 위치를 챙긴다.

## `W`의 마지막 불꽃 뒤에 기본 공격을 남긴다

**`불꽃 풀무질(W)`의 마지막 불꽃이 불안정을 묻힌다.** 끝까지 맞히지 못할 거리라면 마나를 써서 앞으로 걷기보다 `Q` 둔화를 먼저 만든다. 불안정이 묻은 뒤 기본 공격이나 다른 띄우기로 표식을 터뜨리는 데까지가 한 번의 교환이다. 표식을 남겨 둔 채 상대 포탑 쪽으로 한 대 더 따라가면 오른의 긴 기술 재사용 대기시간만 드러난다.

## 궁극기는 두 번째 박치기 자리를 먼저 고른다

**`대장장이 신의 부름(R)`은 첫 정령을 맞히는 것보다 되받아칠 각이 중요하다.** 정령이 오는 동안 상대만 보다가 벽이나 방해 효과에 막히지 않도록 **오른이 서 있을 자리와 박치기 방향을 먼저 정한다.** 좁은 길에서는 여러 명을 노릴 수 있지만 아군이 닿지 않는 거리라면 좋은 적중도 처치로 이어지지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-ornn-20260913');
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — 보호막이 돌아온 교환만 고른다 · `Q`는 피해와 거리 조절을 함께 산다 · 궁극기는 보유 자체로 상대 진형을 벌린다

[[분류:탑]] [[분류:탱커]]

## 화강암 방패가 없을 때는 다음 교환을 기다린다

**말파이트는 보호막이 있을 때 받은 피해를 지우며 짧게 교환하는 챔피언이다.**[* [다이아) 캐리형 최대추댐 탑 탱커 말파이트](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133569&vtype=pc)] 보호막이 깨진 직후 같은 자리에서 막타를 더 먹으면 체력으로 비용을 낸다. 잠시 공격받지 않을 공간을 만들고, 보호막이 돌아오는 순간 상대의 막타 타이밍에 맞춰 다시 앞으로 나간다.

## `Q`를 견제기가 아니라 간격을 만드는 기술로 쓴다

**`지진의 파편(Q)`은 상대 이동 속도를 훔친다.**[* [말파이트 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=36)] 피해만 넣고 제자리로 돌아오면 마나만 줄지만, 상대가 붙는 순간 사용해 빠지거나 아군 정글이 오는 방향으로 상대를 몰면 이동 속도 차이가 실제 이득이 된다. 원거리 상대에게 매번 던지기보다 **막타를 포기시키거나 다음 기본 공격까지 닿을 때** 사용한다.

## 근접 교환은 `E`의 공격 속도 감소까지 묶는다

**상대가 기본 공격으로 길게 싸우려 들어오면 `지면 강타(E)`를 먼저 맞혀 공격 속도를 낮추고 `천둥소리(W)`의 강화 공격을 이어 간다.** 반대로 기술 피해 위주 상대에게는 `E`의 가치가 낮아질 수 있으니, 웨이브를 무리하게 밀기 위해 쓰지 않고 접근을 끊을 때 남겨 둔다.

## 궁극기를 서두르지 않을수록 진입 각이 넓어진다

**`멈출 수 없는 힘(R)`은 먼저 보이는 한 명에게 쓰는 버튼이 아니다.** **말파이트가 시야에 서 있기만 해도 상대 딜러는 서로 붙기 어렵다.** 아군이 후속 피해를 넣을 거리인지, 상대 이동기가 빠졌는지 확인한다. 한 명을 확실히 끊는 궁과 여러 명을 띄우는 궁 중 그 교전에서 필요한 쪽을 고른다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-top-tank-champion-malphite-20260913' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-malphite-20260913') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-malphite-20260913' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-malphite-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-malphite-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-top-tank-champion-malphite-20260913' AND revision = 2
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 보호막이 돌아온 교환만 고른다 · `Q`는 피해와 거리 조절을 함께 산다 · 궁극기는 보유 자체로 상대 진형을 벌린다

[[분류:탑]] [[분류:탱커]]

## 화강암 방패가 없을 때는 다음 교환을 기다린다

**말파이트는 보호막이 있을 때 받은 피해를 지우며 짧게 교환하는 챔피언이다.**[* [다이아) 캐리형 최대추댐 탑 탱커 말파이트](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133569&vtype=pc)] 보호막이 깨진 직후 같은 자리에서 막타를 더 먹으면 체력으로 비용을 낸다. 잠시 공격받지 않을 공간을 만들고, 보호막이 돌아오는 순간 상대의 막타 타이밍에 맞춰 다시 앞으로 나간다.

## `Q`를 견제기가 아니라 간격을 만드는 기술로 쓴다

**`지진의 파편(Q)`은 상대 이동 속도를 훔친다.**[* [말파이트 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=36)] 피해만 넣고 제자리로 돌아오면 마나만 줄지만, 상대가 붙는 순간 사용해 빠지거나 아군 정글이 오는 방향으로 상대를 몰면 이동 속도 차이가 실제 이득이 된다. 원거리 상대에게 매번 던지기보다 **막타를 포기시키거나 다음 기본 공격까지 닿을 때** 사용한다.

## 근접 교환은 `E`의 공격 속도 감소까지 묶는다

**상대가 기본 공격으로 길게 싸우려 들어오면 `지면 강타(E)`를 먼저 맞혀 공격 속도를 낮추고 `천둥소리(W)`의 강화 공격을 이어 간다.** 반대로 기술 피해 위주 상대에게는 `E`의 가치가 낮아질 수 있으니, 웨이브를 무리하게 밀기 위해 쓰지 않고 접근을 끊을 때 남겨 둔다.

## 궁극기를 서두르지 않을수록 진입 각이 넓어진다

**`멈출 수 없는 힘(R)`은 먼저 보이는 한 명에게 쓰는 버튼이 아니다.** **말파이트가 시야에 서 있기만 해도 상대 딜러는 서로 붙기 어렵다.** 아군이 후속 피해를 넣을 거리인지, 상대 이동기가 빠졌는지 확인한다. 한 명을 확실히 끊는 궁과 여러 명을 띄우는 궁 중 그 교전에서 필요한 쪽을 고른다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-malphite-20260913');
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — 기의 검이 상대를 통과해야 교환이 강해진다 · `W`는 평타 한 묶음을 지운다 · 궁극기 전에 탑 웨이브의 비용을 계산한다

[[분류:탑]] [[분류:탱커]]

## 기의 검 위치가 다음 교환의 절반이다

**쉔은 `황혼 강습(Q)`으로 검을 불러올 때 검이 적 챔피언을 통과해야 강화 공격과 둔화를 제대로 얻는다.**[* [쉔은 절대 라인전 약캐가 아닙니다](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115811&vtype=pc)] 검이 항상 쉔 뒤에만 있으면 상대가 안전한 쪽으로 물러나기 쉽다. 교환이 끝난 뒤 검을 상대 뒤쪽에 남길 수 있는 자리로 움직여 다음 막타 타이밍을 압박한다.

## `W`는 공격 한 대가 아니라 상대의 리듬을 막는다

**`의지의 결계(W)`는 기의 검 주변에서 기본 공격을 차단한다.**[* [쉔 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=55)] 상대가 강화 공격이나 연속 기본 공격을 시작하는 순간 켜야 가치가 크다. 너무 일찍 켜면 상대가 결계 밖에서 기다린다. **검 위치와 아군 위치를 함께 보면 쉔 자신뿐 아니라 교전 중인 아군의 핵심 공격도 지울 수 있다.**

## `E`로 들어가기 전에 빠져나올 장면까지 본다

**`그림자 돌진(E)`이 적중하면 교환이 열리지만 빗나가면 쉔의 퇴로와 기력이 동시에 줄어든다.** 큰 적 웨이브 안이나 상대 포탑 쪽으로 최대 사거리 도발을 시도하지 않는다. 상대 이동기가 빠지고 아군이 닿을 때, 또는 짧은 도발 뒤 `Q` 강화 공격만 넣고 빠질 수 있을 때 사용한다.

## 궁극기의 이득에서 탑 웨이브를 뺀다

**`단결된 의지(R)`로 아군을 살려도 큰 웨이브와 포탑을 함께 잃으면 실제 이득이 작다.** 궁을 누르기 전에 현재 웨이브를 밀 수 있는지, 상대 탑이 포탑을 얼마나 때릴지, 도착 후 귀환할 수 있는지를 빠르게 본다. 보호막이 필요한 아군보다 **도착한 쉔이 바로 도발로 연결할 수 있는 아군**이 좋은 대상일 때가 많다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-top-tank-champion-shen-20260913' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-shen-20260913') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-shen-20260913' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-shen-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-shen-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-top-tank-champion-shen-20260913' AND revision = 2
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 기의 검이 상대를 통과해야 교환이 강해진다 · `W`는 평타 한 묶음을 지운다 · 궁극기 전에 탑 웨이브의 비용을 계산한다

[[분류:탑]] [[분류:탱커]]

## 기의 검 위치가 다음 교환의 절반이다

**쉔은 `황혼 강습(Q)`으로 검을 불러올 때 검이 적 챔피언을 통과해야 강화 공격과 둔화를 제대로 얻는다.**[* [쉔은 절대 라인전 약캐가 아닙니다](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115811&vtype=pc)] 검이 항상 쉔 뒤에만 있으면 상대가 안전한 쪽으로 물러나기 쉽다. 교환이 끝난 뒤 검을 상대 뒤쪽에 남길 수 있는 자리로 움직여 다음 막타 타이밍을 압박한다.

## `W`는 공격 한 대가 아니라 상대의 리듬을 막는다

**`의지의 결계(W)`는 기의 검 주변에서 기본 공격을 차단한다.**[* [쉔 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=55)] 상대가 강화 공격이나 연속 기본 공격을 시작하는 순간 켜야 가치가 크다. 너무 일찍 켜면 상대가 결계 밖에서 기다린다. **검 위치와 아군 위치를 함께 보면 쉔 자신뿐 아니라 교전 중인 아군의 핵심 공격도 지울 수 있다.**

## `E`로 들어가기 전에 빠져나올 장면까지 본다

**`그림자 돌진(E)`이 적중하면 교환이 열리지만 빗나가면 쉔의 퇴로와 기력이 동시에 줄어든다.** 큰 적 웨이브 안이나 상대 포탑 쪽으로 최대 사거리 도발을 시도하지 않는다. 상대 이동기가 빠지고 아군이 닿을 때, 또는 짧은 도발 뒤 `Q` 강화 공격만 넣고 빠질 수 있을 때 사용한다.

## 궁극기의 이득에서 탑 웨이브를 뺀다

**`단결된 의지(R)`로 아군을 살려도 큰 웨이브와 포탑을 함께 잃으면 실제 이득이 작다.** 궁을 누르기 전에 현재 웨이브를 밀 수 있는지, 상대 탑이 포탑을 얼마나 때릴지, 도착 후 귀환할 수 있는지를 빠르게 본다. 보호막이 필요한 아군보다 **도착한 쉔이 바로 도발로 연결할 수 있는 아군**이 좋은 대상일 때가 많다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-shen-20260913');
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 중첩을 교환 전에 준비한다 · `W` 충전은 피해 감소와 이동 방향을 함께 고른다 · 총공세는 탱커 역할을 내려놓는 선택이다

[[분류:탑]] [[분류:탱커]]

## `Q` 세 번째 타격을 준비한 뒤 상대의 막타를 본다

**크산테는 `엔토포 타격(Q)` 두 번을 미니언에 적중시킨 뒤 생기는 끌어당김으로 교환을 설계한다.**[* [크산테의 핵심 정동열](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148170&vtype=pc)] 세 번째 `Q`가 준비됐다고 바로 던지면 상대는 뒤로 빠지기만 하면 된다. 상대가 막타 때문에 멈추는 순간이나 아군 정글이 닿는 방향으로 움직였을 때 사용한다. 준비 시간이 끝나기 직전이라고 나쁜 각에 억지로 쓰지 않는다.

## 표식을 터뜨릴 기본 공격까지가 짧은 교환이다

**기술을 맞힌 뒤 생긴 표식은 기본 공격으로 소비해야 피해가 완성된다.**[* [크산테 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=162)] 하지만 표식 한 번 때문에 큰 적 웨이브 안으로 걸어가면 손해가 더 크다. `Q` 둔화나 `발놀림(E)` 보호막으로 안전하게 닿을 때만 공격하고, 상대가 거리를 내줬다면 다음 중첩을 준비한다.

## `W`는 오래 모으는 것보다 밀어낼 방향이 중요하다

**`길을 여는 자(W)` 충전 중에는 피해를 줄이며 방해 효과를 버틸 수 있다.** 정면 피해를 막는 데만 쓰지 말고 **상대를 벽이나 아군 쪽으로 밀 수 있는 각**을 만든다. 최대 충전에 집착하면 상대가 옆으로 비켜난다. 필요한 거리와 기절 시간이 나왔을 때 일찍 놓는 편이 낫다.

## 총공세 뒤에는 다시 탱커처럼 서 있지 않는다

**`총공세(R)`는 적을 벽 너머로 분리하지만 크산테의 방어 능력도 크게 낮춘다.** 아군이 상대 앞선을 받아 줄 수 있는지, 데려간 적을 제한 시간 안에 끝낼 수 있는지 확인한다. 처치하지 못했는데 적진 한가운데로 돌아가면 변신 전보다 쉽게 녹는다. 수적 우위나 확실한 벽 각이 없으면 궁을 보존해 앞선을 지키는 선택도 강하다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-top-tank-champion-ksante-20260913' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-ksante-20260913') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-ksante-20260913' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-ksante-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-ksante-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-top-tank-champion-ksante-20260913' AND revision = 2
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 중첩을 교환 전에 준비한다 · `W` 충전은 피해 감소와 이동 방향을 함께 고른다 · 총공세는 탱커 역할을 내려놓는 선택이다

[[분류:탑]] [[분류:탱커]]

## `Q` 세 번째 타격을 준비한 뒤 상대의 막타를 본다

**크산테는 `엔토포 타격(Q)` 두 번을 미니언에 적중시킨 뒤 생기는 끌어당김으로 교환을 설계한다.**[* [크산테의 핵심 정동열](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148170&vtype=pc)] 세 번째 `Q`가 준비됐다고 바로 던지면 상대는 뒤로 빠지기만 하면 된다. 상대가 막타 때문에 멈추는 순간이나 아군 정글이 닿는 방향으로 움직였을 때 사용한다. 준비 시간이 끝나기 직전이라고 나쁜 각에 억지로 쓰지 않는다.

## 표식을 터뜨릴 기본 공격까지가 짧은 교환이다

**기술을 맞힌 뒤 생긴 표식은 기본 공격으로 소비해야 피해가 완성된다.**[* [크산테 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=162)] 하지만 표식 한 번 때문에 큰 적 웨이브 안으로 걸어가면 손해가 더 크다. `Q` 둔화나 `발놀림(E)` 보호막으로 안전하게 닿을 때만 공격하고, 상대가 거리를 내줬다면 다음 중첩을 준비한다.

## `W`는 오래 모으는 것보다 밀어낼 방향이 중요하다

**`길을 여는 자(W)` 충전 중에는 피해를 줄이며 방해 효과를 버틸 수 있다.** 정면 피해를 막는 데만 쓰지 말고 **상대를 벽이나 아군 쪽으로 밀 수 있는 각**을 만든다. 최대 충전에 집착하면 상대가 옆으로 비켜난다. 필요한 거리와 기절 시간이 나왔을 때 일찍 놓는 편이 낫다.

## 총공세 뒤에는 다시 탱커처럼 서 있지 않는다

**`총공세(R)`는 적을 벽 너머로 분리하지만 크산테의 방어 능력도 크게 낮춘다.** 아군이 상대 앞선을 받아 줄 수 있는지, 데려간 적을 제한 시간 안에 끝낼 수 있는지 확인한다. 처치하지 못했는데 적진 한가운데로 돌아가면 변신 전보다 쉽게 녹는다. 수적 우위나 확실한 벽 각이 없으면 궁을 보존해 앞선을 지키는 선택도 강하다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-ksante-20260913');
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

**`멈출 수 없는 맹공(R)`으로 복귀하거나 다른 라인에 합류하기 전, 출발하는 웨이브와 도착 후 돌아올 방법을 본다.** 실패한 장거리 궁은 탑 경험치까지 잃는다. 죽은 뒤 패시브로 웨이브를 정리할 수 있어도 **죽음을 먼저 선택하는 운영은 상대에게 처치 보상과 다음 움직임을 함께 준다.** 살아서 앞선을 만들 수 있다면 그쪽이 우선이다.', revision = 3, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-ai-champion-sion-20260912' AND kind = 'article' AND revision = 2
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-ai-champion-sion-20260912') = 2
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-ai-champion-sion-20260912' AND revision = 2 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-sion-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-sion-20260913', id, NULL, 2, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 3
FROM wiki_docs WHERE id = 'doc-ai-champion-sion-20260912' AND revision = 3
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`는 적중보다 이동을 강요한다 · 낮은 체력 미니언은 `E` 투사체다 · 궁극기 출발 전에 도착할 웨이브를 계산한다

[[분류:탑]] [[분류:탱커]]

## `Q`는 오래 모으는 기술이 아니라 길을 닫는 기술이다

**`대량 학살 강타(Q)`를 끝까지 맞히는 것보다 상대가 피할 방향을 제한하는 일이 먼저다.**[* [M1 탑사이온 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=114749&vtype=pc)] 시야가 열린 중앙에서는 짧게 끊어 피해와 막타를 확정하고, 수풀이나 `E` 둔화 뒤에만 길게 모은다. 상대가 범위를 벗어나느라 CS를 포기했다면 이미 이득이므로 끝까지 추격해 내 위치를 망치지 않는다.

## 낮은 체력 미니언으로 교환을 시작한다

**`학살자의 포효(E)`가 미니언을 밀어내면 뒤의 상대까지 둔화하고 방어력을 낮춘다.**[* [사이온 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=57)] 상대가 자기 미니언 뒤에 숨는 순간, 체력이 낮고 진행선이 곧은 미니언을 고른다. `E`가 맞으면 퇴로에 `Q`를 놓고, 빗나가면 마나를 더 쓰지 않고 다음 웨이브를 기다린다.

## `W`는 보호막과 폭발을 모두 쓸 거리에서 켠다

**`영혼의 용광로(W)`는 미니언 처치로 최대 체력을 쌓고, 사용 시 보호막 뒤 범위 피해를 만든다.** 멀리서 견제 하나만 막으려고 켜면 폭발을 쓰지 못한다. 서로 막타를 먹으러 가까워지기 직전에 켜고, 보호막이 깨지기 전에 상대와 미니언에 폭발을 함께 맞힐 자리를 잡는다.

## 궁극기와 사망 후 시간을 공짜로 보지 않는다

**`멈출 수 없는 맹공(R)`으로 복귀하거나 다른 라인에 합류하기 전, 출발하는 웨이브와 도착 후 돌아올 방법을 본다.** 실패한 장거리 궁은 탑 경험치까지 잃는다. 죽은 뒤 패시브로 웨이브를 정리할 수 있어도 **죽음을 먼저 선택하는 운영은 상대에게 처치 보상과 다음 움직임을 함께 준다.** 살아서 앞선을 만들 수 있다면 그쪽이 우선이다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-sion-20260913');
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — 미니언 처치 회복으로 나쁜 교환을 복구한다 · `Q`는 발밑보다 퇴로에 둔다 · `R` 처형선이 보일 때 싸움을 짧게 끝낸다

[[분류:탑]] [[분류:탱커]]

## 유지력은 맞아도 된다는 허가가 아니다

**초가스는 미니언을 처치하며 체력과 마나를 회복해 작은 손해를 되돌릴 수 있다.**[* [정석 착취 초가스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146725)] 그렇다고 막타 하나마다 큰 견제를 맞으면 다음 웨이브를 먹을 체력이 남지 않는다. 안전한 미니언부터 챙기고, 상대가 기술을 웨이브에 쓴 뒤에만 앞으로 나가 회복량 이상의 손해를 막는다.

## `Q`는 현재 위치보다 다음 발걸음에 둔다

**`파열(Q)`은 발동 전 표시를 보고 피할 수 있다.**[* [초가스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=11)] 상대 발밑 정중앙보다 막타를 친 뒤 돌아갈 길, 수풀 입구, 벽 쪽 이동선에 놓는다. 맞히면 바로 `흉포한 울부짖음(W)`을 겹쳐 이동기나 반격을 막고, 빗나가면 긴 재교환을 열지 않는다.

## `W`와 `E`는 근접한 상대를 놓치지 않는 묶음이다

**상대가 파고들면 `W` 침묵으로 기술 사용을 늦추고 `날카로운 가시(E)`의 세 번 공격으로 둔화를 이어 간다.** `E`는 뒤의 미니언까지 밀기 때문에 라인이 예상보다 빨리 밀릴 수 있다. 프리징이 필요하면 챔피언을 치려고 가시를 미니언 전체에 통과시키지 않는다.

## `R`은 체력 성장과 확정 처치 사이에서 목적을 고른다

**`포식(R)`으로 미니언을 처치해 최대 체력을 쌓을 수 있지만, 상대와 오브젝트를 확정하는 수단이기도 하다.** 곧 싸움이 열릴 때 재사용 대기시간을 성장에 쓰지 않는다. 상대 체력이 처형선에 들어왔다면 `Q`를 더 맞히려 욕심내기보다 침묵과 둔화로 접근해 확정 피해로 끝낸다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-top-tank-champion-chogath-20260913' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-chogath-20260913') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-chogath-20260913' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-chogath-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-chogath-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-top-tank-champion-chogath-20260913' AND revision = 2
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 미니언 처치 회복으로 나쁜 교환을 복구한다 · `Q`는 발밑보다 퇴로에 둔다 · `R` 처형선이 보일 때 싸움을 짧게 끝낸다

[[분류:탑]] [[분류:탱커]]

## 유지력은 맞아도 된다는 허가가 아니다

**초가스는 미니언을 처치하며 체력과 마나를 회복해 작은 손해를 되돌릴 수 있다.**[* [정석 착취 초가스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146725)] 그렇다고 막타 하나마다 큰 견제를 맞으면 다음 웨이브를 먹을 체력이 남지 않는다. 안전한 미니언부터 챙기고, 상대가 기술을 웨이브에 쓴 뒤에만 앞으로 나가 회복량 이상의 손해를 막는다.

## `Q`는 현재 위치보다 다음 발걸음에 둔다

**`파열(Q)`은 발동 전 표시를 보고 피할 수 있다.**[* [초가스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=11)] 상대 발밑 정중앙보다 막타를 친 뒤 돌아갈 길, 수풀 입구, 벽 쪽 이동선에 놓는다. 맞히면 바로 `흉포한 울부짖음(W)`을 겹쳐 이동기나 반격을 막고, 빗나가면 긴 재교환을 열지 않는다.

## `W`와 `E`는 근접한 상대를 놓치지 않는 묶음이다

**상대가 파고들면 `W` 침묵으로 기술 사용을 늦추고 `날카로운 가시(E)`의 세 번 공격으로 둔화를 이어 간다.** `E`는 뒤의 미니언까지 밀기 때문에 라인이 예상보다 빨리 밀릴 수 있다. 프리징이 필요하면 챔피언을 치려고 가시를 미니언 전체에 통과시키지 않는다.

## `R`은 체력 성장과 확정 처치 사이에서 목적을 고른다

**`포식(R)`으로 미니언을 처치해 최대 체력을 쌓을 수 있지만, 상대와 오브젝트를 확정하는 수단이기도 하다.** 곧 싸움이 열릴 때 재사용 대기시간을 성장에 쓰지 않는다. 상대 체력이 처형선에 들어왔다면 `Q`를 더 맞히려 욕심내기보다 침묵과 둔화로 접근해 확정 피해로 끝낸다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-chogath-20260913');
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — 방패 막타 뒤의 착지 위치를 본다 · 벽꿍은 벽보다 상대의 퇴로에서 시작한다 · `W`는 진입보다 역진입을 막을 때 더 값지다

[[분류:탑]] [[분류:탱커]]

## 방패는 안전한 막타와 다음 교환을 함께 만든다

**원거리 방패 공격은 어려운 막타를 챙기면서 보호막을 준비하는 수단이다.**[* [뽀삐 공략 게시판](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=49)] 방패가 떨어진 자리가 상대 쪽이면 무리해서 줍지 않는다. 상대가 방패를 밟으러 움직이는 순간 `망치 강타(Q)` 범위로 유도하거나, 안전한 쪽에 떨어졌을 때만 주워 다음 근접 교환을 연다.

## `Q` 두 번째 폭발까지 맞힐 자리를 고른다

**`망치 강타(Q)`는 첫 타격 뒤 지대가 다시 폭발한다.**[* [뽀삐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=49)] 상대가 자유롭게 옆으로 빠질 수 있는 중앙보다 막타를 치는 순간이나 벽 쪽에 몰렸을 때 사용한다. 첫 타격을 맞혔다고 기본 공격을 오래 이어 가기보다 두 번째 폭발 범위로 상대가 움직이게 만든 뒤 거리를 정리한다.

## 벽꿍은 상대가 벽에 붙은 뒤 찾으면 늦다

**`용감한 돌진(E)` 각은 뽀삐와 상대, 충돌할 지형이 한 줄이 될 때 열린다.** **라인 중앙에서부터 상대의 퇴로 반대편으로 몸을 옮겨 벽 쪽 선택을 강요한다.** 각이 아닌데 `E`로 접근하면 상대를 안전한 방향으로 밀어주고 퇴로까지 잃는다. 벽 충돌이 확실하지 않으면 `Q`와 방패로 짧게 교환한다.

## `W`와 궁극기는 한타의 사람 수를 바꾼다

**`굳건한 태세(W)`는 상대 돌진을 막고 다시 이동기를 쓰지 못하게 한다.** 먼저 뛰어들기보다 아군 딜러에게 들어오는 핵심 돌진에 남기면 교전이 단순해진다. `수호자의 심판(R)`은 빠르게 눌러 띄우거나 충전해 멀리 보낼 수 있다. 잡을 대상을 날리지 말고, **싸움에서 가장 오래 빼 두면 좋은 적**을 고른다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-top-tank-champion-poppy-20260913' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-poppy-20260913') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-poppy-20260913' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-poppy-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-poppy-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-top-tank-champion-poppy-20260913' AND revision = 2
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 방패 막타 뒤의 착지 위치를 본다 · 벽꿍은 벽보다 상대의 퇴로에서 시작한다 · `W`는 진입보다 역진입을 막을 때 더 값지다

[[분류:탑]] [[분류:탱커]]

## 방패는 안전한 막타와 다음 교환을 함께 만든다

**원거리 방패 공격은 어려운 막타를 챙기면서 보호막을 준비하는 수단이다.**[* [뽀삐 공략 게시판](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=49)] 방패가 떨어진 자리가 상대 쪽이면 무리해서 줍지 않는다. 상대가 방패를 밟으러 움직이는 순간 `망치 강타(Q)` 범위로 유도하거나, 안전한 쪽에 떨어졌을 때만 주워 다음 근접 교환을 연다.

## `Q` 두 번째 폭발까지 맞힐 자리를 고른다

**`망치 강타(Q)`는 첫 타격 뒤 지대가 다시 폭발한다.**[* [뽀삐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=49)] 상대가 자유롭게 옆으로 빠질 수 있는 중앙보다 막타를 치는 순간이나 벽 쪽에 몰렸을 때 사용한다. 첫 타격을 맞혔다고 기본 공격을 오래 이어 가기보다 두 번째 폭발 범위로 상대가 움직이게 만든 뒤 거리를 정리한다.

## 벽꿍은 상대가 벽에 붙은 뒤 찾으면 늦다

**`용감한 돌진(E)` 각은 뽀삐와 상대, 충돌할 지형이 한 줄이 될 때 열린다.** **라인 중앙에서부터 상대의 퇴로 반대편으로 몸을 옮겨 벽 쪽 선택을 강요한다.** 각이 아닌데 `E`로 접근하면 상대를 안전한 방향으로 밀어주고 퇴로까지 잃는다. 벽 충돌이 확실하지 않으면 `Q`와 방패로 짧게 교환한다.

## `W`와 궁극기는 한타의 사람 수를 바꾼다

**`굳건한 태세(W)`는 상대 돌진을 막고 다시 이동기를 쓰지 못하게 한다.** 먼저 뛰어들기보다 아군 딜러에게 들어오는 핵심 돌진에 남기면 교전이 단순해진다. `수호자의 심판(R)`은 빠르게 눌러 띄우거나 충전해 멀리 보낼 수 있다. 잡을 대상을 날리지 말고, **싸움에서 가장 오래 빼 두면 좋은 적**을 고른다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-poppy-20260913');
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — 패시브 회복 공격을 놓치지 않는다 · `Q`는 피해보다 밀어낼 방향을 고른다 · 궁극기는 정면보다 옆으로 길을 닫는다

[[분류:탑]] [[분류:탱커]]

## 회복 가능한 기본 공격을 안전한 대상에 쓴다

**마오카이의 유지력은 패시브가 준비됐을 때 기본 공격을 실제로 넣어야 생긴다.**[* [마오카이에 대한 팁들](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141364&vtype=pc)] 체력이 낮다고 상대 챔피언에게 걸어가 억지로 치지 않고 가까운 미니언으로 회복한다. 상대가 막타를 먹으러 오는 순간에는 회복 공격과 `덤불 주먹(Q)`을 함께 사용해 체력과 라인 위치를 동시에 챙긴다.

## `Q`는 상대를 어디로 보낼지 정하고 누른다

**가까운 적은 `덤불 주먹(Q)`에 밀려난다.**[* [시즌 8 마오카이 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141885&vtype=pc)] 상대를 아군 쪽으로 당겨 두고 싶다면 뒤로 돌아가 밀고, 교환을 끝내려면 정면에서 밀어낸다. **피해를 조금 더 넣겠다고 상대를 안전한 포탑 쪽으로 보내는 실수**가 자주 나온다. 웨이브를 밀 때도 챔피언을 어느 방향으로 튕길지 먼저 본다.

## `W`는 회피와 속박을 동시에 해결한다

**`뒤틀린 전진(W)`으로 이동하는 동안 대상으로 지정되지 않는다.** 상대의 큰 기술이 날아오는 순간에 맞춰 사라지고, 나타난 뒤 `Q`로 아군 쪽에 밀어 연계한다. 사거리 끝의 적에게 먼저 쓰면 적진 한가운데 고립되므로 아군이 닿거나 빠져나올 `Q` 방향이 있을 때 들어간다.

## 묘목과 궁극기로 싸울 공간을 먼저 만든다

**`묘목 던지기(E)`는 수풀에서 강해지지만 무작정 많이 던지면 마나와 웨이브가 함께 흔들린다.** 교전이 날 입구와 상대가 돌아올 수풀에 미리 둔다. `대자연의 마수(R)`는 정면으로 따라가며 쓰면 빠른 적이 먼저 피한다. 옆에서 통로를 가로지르거나 퇴로를 덮어 상대가 아군 쪽으로 움직이게 만든다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-top-tank-champion-maokai-20260913' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-maokai-20260913') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-maokai-20260913' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-maokai-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-maokai-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-top-tank-champion-maokai-20260913' AND revision = 2
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 패시브 회복 공격을 놓치지 않는다 · `Q`는 피해보다 밀어낼 방향을 고른다 · 궁극기는 정면보다 옆으로 길을 닫는다

[[분류:탑]] [[분류:탱커]]

## 회복 가능한 기본 공격을 안전한 대상에 쓴다

**마오카이의 유지력은 패시브가 준비됐을 때 기본 공격을 실제로 넣어야 생긴다.**[* [마오카이에 대한 팁들](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141364&vtype=pc)] 체력이 낮다고 상대 챔피언에게 걸어가 억지로 치지 않고 가까운 미니언으로 회복한다. 상대가 막타를 먹으러 오는 순간에는 회복 공격과 `덤불 주먹(Q)`을 함께 사용해 체력과 라인 위치를 동시에 챙긴다.

## `Q`는 상대를 어디로 보낼지 정하고 누른다

**가까운 적은 `덤불 주먹(Q)`에 밀려난다.**[* [시즌 8 마오카이 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141885&vtype=pc)] 상대를 아군 쪽으로 당겨 두고 싶다면 뒤로 돌아가 밀고, 교환을 끝내려면 정면에서 밀어낸다. **피해를 조금 더 넣겠다고 상대를 안전한 포탑 쪽으로 보내는 실수**가 자주 나온다. 웨이브를 밀 때도 챔피언을 어느 방향으로 튕길지 먼저 본다.

## `W`는 회피와 속박을 동시에 해결한다

**`뒤틀린 전진(W)`으로 이동하는 동안 대상으로 지정되지 않는다.** 상대의 큰 기술이 날아오는 순간에 맞춰 사라지고, 나타난 뒤 `Q`로 아군 쪽에 밀어 연계한다. 사거리 끝의 적에게 먼저 쓰면 적진 한가운데 고립되므로 아군이 닿거나 빠져나올 `Q` 방향이 있을 때 들어간다.

## 묘목과 궁극기로 싸울 공간을 먼저 만든다

**`묘목 던지기(E)`는 수풀에서 강해지지만 무작정 많이 던지면 마나와 웨이브가 함께 흔들린다.** 교전이 날 입구와 상대가 돌아올 수풀에 미리 둔다. `대자연의 마수(R)`는 정면으로 따라가며 쓰면 빠른 적이 먼저 피한다. 옆에서 통로를 가로지르거나 퇴로를 덮어 상대가 아군 쪽으로 움직이게 만든다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-maokai-20260913');
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 스택 하나보다 살아 있는 웨이브가 먼저다 · `E`는 방어력을 낮춘 자리에서 싸운다 · 궁극기 시간 동안 도망가는 적을 끝없이 쫓지 않는다

[[분류:탑]] [[분류:탱커]]

## 초반 목표는 모든 스택이 아니라 무너지지 않는 라인이다

**`흡수의 일격(Q)` 막타 하나를 위해 체력과 웨이브 위치를 함께 잃으면 다음 스택 여러 개가 사라진다.**[* [TOP 나서스에 대해](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133482&vtype=pc)] 상대가 강할 때는 원거리 미니언이나 대포 하나를 포기해도 된다. 라인이 아군 쪽으로 오게 두고, 상대 핵심 기술이 빠진 짧은 시간에만 앞으로 나가 `Q` 막타를 챙긴다.

## `쇠약(W)`은 싸움을 시작할 때보다 상대가 빠질 때 강하다

**상대가 아직 이동기를 들고 먼 거리에 있을 때 걸면 지속시간 대부분을 접근에 쓴다.**[* [TOP 나서스, 한 번 해보지 않을래?](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=110707)] 적이 공격하려 들어왔거나 도주 기술을 사용한 뒤에 `W`를 걸어 이동 속도와 공격 속도 감소를 끝까지 활용한다. 갱 호응에서도 정글러가 보이기 전에 너무 일찍 걸어 상대에게 퇴각 신호를 주지 않는다.

## `E` 위에서 교환하고 라인이 밀리는 비용을 센다

**`영혼의 불길(E)`은 범위 안 적의 방어력을 낮춰 `Q` 피해를 키운다.** 상대가 막타 때문에 멈추는 위치에 깔고, 그 위에서만 짧게 때린다. 미니언 전체에 계속 사용하면 라인이 밀려 갱에 노출되고 포탑 아래 `Q` 막타도 어려워진다. 주도권이 필요한 웨이브와 당겨야 할 웨이브를 구분한다.

## 궁극기는 강한 시간이지 모든 추격의 허가가 아니다

**`사막의 분노(R)` 동안 체력과 방어 능력이 오르고 `Q`를 더 자주 쓸 수 있다.** 상대가 넓은 공간에서 계속 빠지면 궁극기 시간을 걷는 데 쓰지 않는다. 포탑, 오브젝트, 좁은 길처럼 상대가 자리를 포기하기 어려운 곳에서 켠다. 성장 뒤에도 깊은 사이드에서 시야 없이 한 웨이브를 더 먹는 죽음이 가장 큰 손해다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-top-tank-champion-nasus-20260913' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-nasus-20260913') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-nasus-20260913' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-nasus-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-nasus-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-top-tank-champion-nasus-20260913' AND revision = 2
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 스택 하나보다 살아 있는 웨이브가 먼저다 · `E`는 방어력을 낮춘 자리에서 싸운다 · 궁극기 시간 동안 도망가는 적을 끝없이 쫓지 않는다

[[분류:탑]] [[분류:탱커]]

## 초반 목표는 모든 스택이 아니라 무너지지 않는 라인이다

**`흡수의 일격(Q)` 막타 하나를 위해 체력과 웨이브 위치를 함께 잃으면 다음 스택 여러 개가 사라진다.**[* [TOP 나서스에 대해](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133482&vtype=pc)] 상대가 강할 때는 원거리 미니언이나 대포 하나를 포기해도 된다. 라인이 아군 쪽으로 오게 두고, 상대 핵심 기술이 빠진 짧은 시간에만 앞으로 나가 `Q` 막타를 챙긴다.

## `쇠약(W)`은 싸움을 시작할 때보다 상대가 빠질 때 강하다

**상대가 아직 이동기를 들고 먼 거리에 있을 때 걸면 지속시간 대부분을 접근에 쓴다.**[* [TOP 나서스, 한 번 해보지 않을래?](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=110707)] 적이 공격하려 들어왔거나 도주 기술을 사용한 뒤에 `W`를 걸어 이동 속도와 공격 속도 감소를 끝까지 활용한다. 갱 호응에서도 정글러가 보이기 전에 너무 일찍 걸어 상대에게 퇴각 신호를 주지 않는다.

## `E` 위에서 교환하고 라인이 밀리는 비용을 센다

**`영혼의 불길(E)`은 범위 안 적의 방어력을 낮춰 `Q` 피해를 키운다.** 상대가 막타 때문에 멈추는 위치에 깔고, 그 위에서만 짧게 때린다. 미니언 전체에 계속 사용하면 라인이 밀려 갱에 노출되고 포탑 아래 `Q` 막타도 어려워진다. 주도권이 필요한 웨이브와 당겨야 할 웨이브를 구분한다.

## 궁극기는 강한 시간이지 모든 추격의 허가가 아니다

**`사막의 분노(R)` 동안 체력과 방어 능력이 오르고 `Q`를 더 자주 쓸 수 있다.** 상대가 넓은 공간에서 계속 빠지면 궁극기 시간을 걷는 데 쓰지 않는다. 포탑, 오브젝트, 좁은 길처럼 상대가 자리를 포기하기 어려운 곳에서 켠다. 성장 뒤에도 깊은 사이드에서 시야 없이 한 웨이브를 더 먹는 죽음이 가장 큰 손해다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-nasus-20260913');
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — 조각을 주울 수 있는 쪽으로 교환한다 · `Q`는 두 번째 대상을 먼저 확보한다 · `E`는 착지보다 충전 위치를 숨긴다

[[분류:탑]] [[분류:탱커]]

## 체력 비용은 조각을 회수할 수 있을 때만 싸진다

**자크는 기술을 맞혀 떨어진 조각을 주워야 소모한 체력과 교환 손해를 되돌린다.**[* [탑, 미드 자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146717)] 조각이 상대 포탑 쪽에 떨어졌다면 한 번 더 맞으면서 줍지 않는다. 내 쪽이나 수풀 쪽으로 상대를 유도하고, 조각 하나를 줍는 움직임에 `불안정 물질(W)` 재사용까지 연결한다.

## `Q`는 첫 대상보다 붙여 칠 두 번째 대상을 본다

**`탄성 주먹(Q)`으로 챔피언을 잡은 뒤 다른 미니언을 기본 공격하면 둘을 충돌시킬 수 있다.**[* [자크장인 탑자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115999)] 상대만 바라보고 던지기보다 **내가 바로 때릴 수 있는 미니언이나 다른 적이 남아 있는지** 먼저 본다. 웨이브가 비었으면 연계가 약해지므로 사거리 끝 `Q`를 낭비하지 않는다.

## `E`는 화면 밖에서 시작할수록 위협적이다

**`새총 발사(E)`를 상대 시야 안에서 오래 모으면 착지점이 읽힌다.** 수풀과 벽 너머에서 충전을 시작하고, 상대의 뒤보다 퇴로와 아군 방향 사이에 착지한다. 라인에서 도주용으로 남겨야 할 상황이라면 짧은 교환에 먼저 쓰지 않는다.

## 궁극기 중에도 조각과 다음 위치를 본다

**`바운스!(R)`는 여러 번 튀며 적을 띄우고 둔화한다.** 첫 적중 뒤 무조건 깊이 따라가기보다 떨어진 조각과 아군의 공격 범위를 따라 움직인다. 패시브가 있다고 죽음을 가볍게 보면 안 된다. 네 조각이 적에게 쉽게 정리될 위치라면 부활까지 포함해도 손해다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-top-tank-champion-zac-20260913' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-zac-20260913') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-zac-20260913' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-zac-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-zac-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-top-tank-champion-zac-20260913' AND revision = 2
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 조각을 주울 수 있는 쪽으로 교환한다 · `Q`는 두 번째 대상을 먼저 확보한다 · `E`는 착지보다 충전 위치를 숨긴다

[[분류:탑]] [[분류:탱커]]

## 체력 비용은 조각을 회수할 수 있을 때만 싸진다

**자크는 기술을 맞혀 떨어진 조각을 주워야 소모한 체력과 교환 손해를 되돌린다.**[* [탑, 미드 자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146717)] 조각이 상대 포탑 쪽에 떨어졌다면 한 번 더 맞으면서 줍지 않는다. 내 쪽이나 수풀 쪽으로 상대를 유도하고, 조각 하나를 줍는 움직임에 `불안정 물질(W)` 재사용까지 연결한다.

## `Q`는 첫 대상보다 붙여 칠 두 번째 대상을 본다

**`탄성 주먹(Q)`으로 챔피언을 잡은 뒤 다른 미니언을 기본 공격하면 둘을 충돌시킬 수 있다.**[* [자크장인 탑자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115999)] 상대만 바라보고 던지기보다 **내가 바로 때릴 수 있는 미니언이나 다른 적이 남아 있는지** 먼저 본다. 웨이브가 비었으면 연계가 약해지므로 사거리 끝 `Q`를 낭비하지 않는다.

## `E`는 화면 밖에서 시작할수록 위협적이다

**`새총 발사(E)`를 상대 시야 안에서 오래 모으면 착지점이 읽힌다.** 수풀과 벽 너머에서 충전을 시작하고, 상대의 뒤보다 퇴로와 아군 방향 사이에 착지한다. 라인에서 도주용으로 남겨야 할 상황이라면 짧은 교환에 먼저 쓰지 않는다.

## 궁극기 중에도 조각과 다음 위치를 본다

**`바운스!(R)`는 여러 번 튀며 적을 띄우고 둔화한다.** 첫 적중 뒤 무조건 깊이 따라가기보다 떨어진 조각과 아군의 공격 범위를 따라 움직인다. 패시브가 있다고 죽음을 가볍게 보면 안 된다. 네 조각이 적에게 쉽게 정리될 위치라면 부활까지 포함해도 손해다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-zac-20260913');
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — 세 번째 절대 미각 중첩 전에 다음 행동을 정한다 · `Q`는 견제와 회복을 동시에 노린다 · `E` 보호막은 상대의 마지막 피해 묶음에 맞춘다

[[분류:탑]] [[분류:탱커]]

## 절대 미각 세 중첩이 교환의 기준선이다

**탐 켄치는 기본 공격과 `혀 채찍(Q)`으로 중첩을 쌓고, 세 중첩에서 기절이나 집어삼키기로 교환을 크게 만든다.**[* [탑 플래티넘 길라잡이](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143266)] 한두 중첩을 묻혔다고 적 포탑까지 따라가지 않는다. 세 번째 공격이 닿을 거리와 상대의 도주 기술을 보고 계속할지 끝낼지 미리 정한다.

## `Q`는 미니언 사이의 빈 선을 기다린다

**`혀 채찍(Q)`은 처음 맞는 유닛에 막힌다.**[* [탐 켄치 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=126)] 상대가 막타를 치러 미니언 옆으로 나오는 순간 각을 열고, 챔피언에게 맞혀 피해와 회복을 함께 챙긴다. 무작정 웨이브를 밀어 미니언 방패를 없애기보다 라인을 길게 두고 상대가 빈 선을 지나게 만든다.

## `W`는 도착 지점을 아군 쪽으로 잡는다

**`심연 잠수(W)`는 멀리 이동해 범위 안 적을 띄운다.** 상대 바로 뒤를 찍기보다 퇴로와 내 포탑 사이에 나타나야 다음 기본 공격이 이어진다. 시야 안에서 길게 준비하면 쉽게 피하므로 수풀이나 다른 기술의 둔화 뒤에 사용한다. 빗나갔다면 걸어서 긴 추격을 시작하지 않는다.

## 회색 체력과 궁극기로 피해 순서를 바꾼다

**`두꺼운 피부(E)`는 받은 피해 일부를 저장했다가 회복하거나 보호막으로 바꾼다.** 작은 피해에 바로 보호막을 쓰지 않고 상대의 마지막 폭발 피해가 들어오기 직전에 켠다. `집어삼키기(R)`는 적을 격리하거나 아군을 보호한다. 처치 욕심으로 적을 삼켜 아군 기술을 피하게 만들지 말고, **그 몇 초 동안 전장에서 없어져야 할 대상**을 고른다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-top-tank-champion-tahmkench-20260913' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-tahmkench-20260913') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-tahmkench-20260913' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-tahmkench-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-tahmkench-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-top-tank-champion-tahmkench-20260913' AND revision = 2
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 세 번째 절대 미각 중첩 전에 다음 행동을 정한다 · `Q`는 견제와 회복을 동시에 노린다 · `E` 보호막은 상대의 마지막 피해 묶음에 맞춘다

[[분류:탑]] [[분류:탱커]]

## 절대 미각 세 중첩이 교환의 기준선이다

**탐 켄치는 기본 공격과 `혀 채찍(Q)`으로 중첩을 쌓고, 세 중첩에서 기절이나 집어삼키기로 교환을 크게 만든다.**[* [탑 플래티넘 길라잡이](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143266)] 한두 중첩을 묻혔다고 적 포탑까지 따라가지 않는다. 세 번째 공격이 닿을 거리와 상대의 도주 기술을 보고 계속할지 끝낼지 미리 정한다.

## `Q`는 미니언 사이의 빈 선을 기다린다

**`혀 채찍(Q)`은 처음 맞는 유닛에 막힌다.**[* [탐 켄치 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=126)] 상대가 막타를 치러 미니언 옆으로 나오는 순간 각을 열고, 챔피언에게 맞혀 피해와 회복을 함께 챙긴다. 무작정 웨이브를 밀어 미니언 방패를 없애기보다 라인을 길게 두고 상대가 빈 선을 지나게 만든다.

## `W`는 도착 지점을 아군 쪽으로 잡는다

**`심연 잠수(W)`는 멀리 이동해 범위 안 적을 띄운다.** 상대 바로 뒤를 찍기보다 퇴로와 내 포탑 사이에 나타나야 다음 기본 공격이 이어진다. 시야 안에서 길게 준비하면 쉽게 피하므로 수풀이나 다른 기술의 둔화 뒤에 사용한다. 빗나갔다면 걸어서 긴 추격을 시작하지 않는다.

## 회색 체력과 궁극기로 피해 순서를 바꾼다

**`두꺼운 피부(E)`는 받은 피해 일부를 저장했다가 회복하거나 보호막으로 바꾼다.** 작은 피해에 바로 보호막을 쓰지 않고 상대의 마지막 폭발 피해가 들어오기 직전에 켠다. `집어삼키기(R)`는 적을 격리하거나 아군을 보호한다. 처치 욕심으로 적을 삼켜 아군 기술을 피하게 만들지 말고, **그 몇 초 동안 전장에서 없어져야 할 대상**을 고른다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-tahmkench-20260913');
UPDATE wiki_docs
SET general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`가 미니언에 막힐 각을 먼저 지운다 · `W`는 피해를 받은 뒤 되돌릴 대상 곁에서 끝낸다 · 궁극기는 죽기 직전보다 싸움 초반에 쓴다

[[분류:탑]] [[분류:탱커]]

## `Q`는 맞히는 횟수보다 빈 선을 만드는 과정이다

**`오염된 뼈톱(Q)`은 첫 유닛에 막히므로 상대와 나 사이의 낮은 체력 미니언을 먼저 정리하거나 옆으로 각을 바꾼다.**[* [문도 박사 연구 결과 및 분석 - 탑](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112977&vtype=pc)] 최대 거리에서 무작정 던져 체력만 소모하지 않는다. 상대가 막타를 치려고 미니언 옆으로 나오는 순간 맞히고, 둔화가 묻었을 때만 다음 기본 공격 거리를 본다.

## `W`는 켜는 순간보다 끝내는 자리가 중요하다

**`심장 전기 충격(W)`은 받은 피해 일부를 저장하고, 종료할 때 적을 맞혀야 더 많이 회복한다.**[* [문도 박사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=13)] 상대의 큰 교환이 시작될 때 켜고, 재사용 순간 챔피언이나 미니언 곁에 있도록 움직인다. 회복하려고 적 포탑까지 따라가기보다 안전한 미니언에 적중시켜 교환을 끝낸다.

## `E`로 처치할 미니언의 뒤를 본다

**`둔기에 의한 외상(E)`으로 적을 처치하면 뒤로 날아가 경로의 적에게 피해를 준다.** 낮은 체력 미니언과 상대 챔피언을 한 줄로 맞추면 막타와 견제를 함께 해결한다. 라인을 당겨야 할 때는 무심코 미니언을 밀어 웨이브 전체를 빠르게 정리하지 않는다.

## 군중 제어 면역과 궁극기를 체력 여유로 바꾼다

**문도 박사는 처음 맞는 이동 불가 효과를 막고 떨어진 화학 물질을 주워 회복할 수 있다.** 적의 핵심 제어기를 대신 맞을 때는 주울 길까지 본다. `최대 투여량(R)`은 체력이 사라진 뒤 누르는 구조가 아니다. **상대의 폭발 피해가 들어오기 전에 사용해 회복할 시간을 확보하고**, 얻은 이동 속도로 앞선을 유지할지 빠질지 결정한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-top-tank-champion-drmundo-20260913' AND kind = 'article' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-drmundo-20260913') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-top-tank-champion-drmundo-20260913' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-drmundo-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-article-drmundo-20260913', id, NULL, 1, general, '출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-top-tank-champion-drmundo-20260913' AND revision = 2
  AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`가 미니언에 막힐 각을 먼저 지운다 · `W`는 피해를 받은 뒤 되돌릴 대상 곁에서 끝낸다 · 궁극기는 죽기 직전보다 싸움 초반에 쓴다

[[분류:탑]] [[분류:탱커]]

## `Q`는 맞히는 횟수보다 빈 선을 만드는 과정이다

**`오염된 뼈톱(Q)`은 첫 유닛에 막히므로 상대와 나 사이의 낮은 체력 미니언을 먼저 정리하거나 옆으로 각을 바꾼다.**[* [문도 박사 연구 결과 및 분석 - 탑](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112977&vtype=pc)] 최대 거리에서 무작정 던져 체력만 소모하지 않는다. 상대가 막타를 치려고 미니언 옆으로 나오는 순간 맞히고, 둔화가 묻었을 때만 다음 기본 공격 거리를 본다.

## `W`는 켜는 순간보다 끝내는 자리가 중요하다

**`심장 전기 충격(W)`은 받은 피해 일부를 저장하고, 종료할 때 적을 맞혀야 더 많이 회복한다.**[* [문도 박사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=13)] 상대의 큰 교환이 시작될 때 켜고, 재사용 순간 챔피언이나 미니언 곁에 있도록 움직인다. 회복하려고 적 포탑까지 따라가기보다 안전한 미니언에 적중시켜 교환을 끝낸다.

## `E`로 처치할 미니언의 뒤를 본다

**`둔기에 의한 외상(E)`으로 적을 처치하면 뒤로 날아가 경로의 적에게 피해를 준다.** 낮은 체력 미니언과 상대 챔피언을 한 줄로 맞추면 막타와 견제를 함께 해결한다. 라인을 당겨야 할 때는 무심코 미니언을 밀어 웨이브 전체를 빠르게 정리하지 않는다.

## 군중 제어 면역과 궁극기를 체력 여유로 바꾼다

**문도 박사는 처음 맞는 이동 불가 효과를 막고 떨어진 화학 물질을 주워 회복할 수 있다.** 적의 핵심 제어기를 대신 맞을 때는 주울 길까지 본다. `최대 투여량(R)`은 체력이 사라진 뒤 누르는 구조가 아니다. **상대의 폭발 피해가 들어오기 전에 사용해 회복할 시간을 확보하고**, 얻은 이동 속도로 앞선을 유지할지 빠질지 결정한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-article-drmundo-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 1레벨에 밀어 두고, 벽에서 싸우지 않는다

키아나는 원소가 갖춰지기 전 첫 레벨이 약하다. 이때 미니언을 먼저 치되, 2레벨이 되는 순간에는 강가·수풀·벽 쪽으로 물러나지 않는다. **벽 가까이 선 채 체력을 절반 이하로 내주는 것이 가장 위험한 구도**다.[* [M1 키아나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144987)][* [키아나 A to Z](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147203)]

- 키아나가 원소를 줍는 방향을 보고 다음 Q 효과를 예상한다.
- 아군 미니언이 낮은 체력일 때 그 미니언 뒤에 서지 않는다. `대담무쌍(E)`의 발판이 된다.
- 6레벨 이후에는 벽과 평행하게 도망치지 말고 중앙 쪽으로 빠진다.

## 짧은 교환 뒤 바로 간격을 다시 벌린다

수풀 원소 Q 뒤에는 은신 영역이 남는다. 그 안에서 다음 위치를 맞히려 하지 말고 영역 밖으로 빠져 재등장을 기다린다. 키아나가 `W`로 원소를 바꾸면 다시 Q를 쓸 수 있으므로, 첫 Q만 빠졌다고 긴 교환을 열지 않는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-qiyana' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-qiyana') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-qiyana' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-qiyana-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-qiyana-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-qiyana' AND revision = 2
  AND general = '# 미드 라인 상대법

## 1레벨에 밀어 두고, 벽에서 싸우지 않는다

키아나는 원소가 갖춰지기 전 첫 레벨이 약하다. 이때 미니언을 먼저 치되, 2레벨이 되는 순간에는 강가·수풀·벽 쪽으로 물러나지 않는다. **벽 가까이 선 채 체력을 절반 이하로 내주는 것이 가장 위험한 구도**다.[* [M1 키아나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144987)][* [키아나 A to Z](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147203)]

- 키아나가 원소를 줍는 방향을 보고 다음 Q 효과를 예상한다.
- 아군 미니언이 낮은 체력일 때 그 미니언 뒤에 서지 않는다. `대담무쌍(E)`의 발판이 된다.
- 6레벨 이후에는 벽과 평행하게 도망치지 말고 중앙 쪽으로 빠진다.

## 짧은 교환 뒤 바로 간격을 다시 벌린다

수풀 원소 Q 뒤에는 은신 영역이 남는다. 그 안에서 다음 위치를 맞히려 하지 말고 영역 밖으로 빠져 재등장을 기다린다. 키아나가 `W`로 원소를 바꾸면 다시 Q를 쓸 수 있으므로, 첫 Q만 빠졌다고 긴 교환을 열지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-qiyana-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 미니언과 한 줄로 서지 않는다

갈리오는 `전장의 돌풍(Q)`으로 미니언과 챔피언을 함께 맞힐 때 가장 편하다. 원거리 미니언 옆이 아니라 **웨이브와 사선으로 떨어져 서면** 갈리오가 라인 정리와 견제 중 하나를 포기해야 한다.[* [애니의 갈리오 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=135420)][* [신드라 공략의 갈리오 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132083)]

- `정의의 주먹(E)`은 시작할 때 갈리오가 잠깐 뒤로 물러난다. 이 동작이 보이면 옆으로 비킨다.
- `듀란드의 방패(W)`를 모으는 동안에는 범위 밖으로 걷고, 끝난 뒤에 짧게 때린다.
- 갈리오가 시야에서 사라지면 웨이브만 보지 말고 양쪽 강가 움직임을 먼저 알린다.

## 보호막과 도발을 한 번에 빼려 하지 않는다

마법 보호막이 있는 갈리오에게 큰 기술부터 쓰지 않는다. 작은 피해로 보호막을 지운 뒤 다음 기술을 준비한다. 도발을 빼려고 근접했다가 E까지 연달아 맞지 않도록, W가 끝날 때까지 거리를 유지한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-galio' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-galio') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-galio' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-galio-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-galio-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-galio' AND revision = 2
  AND general = '# 미드 라인 상대법

## 미니언과 한 줄로 서지 않는다

갈리오는 `전장의 돌풍(Q)`으로 미니언과 챔피언을 함께 맞힐 때 가장 편하다. 원거리 미니언 옆이 아니라 **웨이브와 사선으로 떨어져 서면** 갈리오가 라인 정리와 견제 중 하나를 포기해야 한다.[* [애니의 갈리오 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=135420)][* [신드라 공략의 갈리오 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132083)]

- `정의의 주먹(E)`은 시작할 때 갈리오가 잠깐 뒤로 물러난다. 이 동작이 보이면 옆으로 비킨다.
- `듀란드의 방패(W)`를 모으는 동안에는 범위 밖으로 걷고, 끝난 뒤에 짧게 때린다.
- 갈리오가 시야에서 사라지면 웨이브만 보지 말고 양쪽 강가 움직임을 먼저 알린다.

## 보호막과 도발을 한 번에 빼려 하지 않는다

마법 보호막이 있는 갈리오에게 큰 기술부터 쓰지 않는다. 작은 피해로 보호막을 지운 뒤 다음 기술을 준비한다. 도발을 빼려고 근접했다가 E까지 연달아 맞지 않도록, W가 끝날 때까지 거리를 유지한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-galio-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 돌아오는 Q와 세 번째 타격을 끊는다

`시간의 톱니바퀴(Q)`는 나갈 때보다 돌아올 때까지 맞으면 교환이 커진다. 첫 타를 맞았더라도 에코와 일직선으로 뒤로 빠지지 말고 옆으로 움직인다. **두 번 맞고 세 번째 타격까지 허용하는 구도를 끊는 것**이 핵심이다.[* [미드 에코 상대법 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141126)][* [구체적 에코 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=134573)]

- 에코가 `시간 도약(E)` 첫 동작을 쓰면 순간이동할 대상과 거리를 벌린다.
- 보이지 않는 곳에서 나타난 큰 원은 `평행 시간 교차(W)`다. 안에서 싸우지 않는다.
- 6레벨 이후에는 에코 뒤의 잔상 위에 서지 않는다.

## 진입이 끝난 자리를 때린다

에코가 E와 3타를 모두 쓰고 이동 속도로 빠질 때 무리하게 따라가지 않는다. 다음 웨이브를 먼저 잡거나, 돌아오는 Q가 빗나간 직후에만 짧게 되받아친다. 궁극기가 준비된 에코의 잔상 근처에서는 마무리 욕심을 줄인다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-ekko' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-ekko') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-ekko' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-ekko-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-ekko-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-ekko' AND revision = 2
  AND general = '# 미드 라인 상대법

## 돌아오는 Q와 세 번째 타격을 끊는다

`시간의 톱니바퀴(Q)`는 나갈 때보다 돌아올 때까지 맞으면 교환이 커진다. 첫 타를 맞았더라도 에코와 일직선으로 뒤로 빠지지 말고 옆으로 움직인다. **두 번 맞고 세 번째 타격까지 허용하는 구도를 끊는 것**이 핵심이다.[* [미드 에코 상대법 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141126)][* [구체적 에코 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=134573)]

- 에코가 `시간 도약(E)` 첫 동작을 쓰면 순간이동할 대상과 거리를 벌린다.
- 보이지 않는 곳에서 나타난 큰 원은 `평행 시간 교차(W)`다. 안에서 싸우지 않는다.
- 6레벨 이후에는 에코 뒤의 잔상 위에 서지 않는다.

## 진입이 끝난 자리를 때린다

에코가 E와 3타를 모두 쓰고 이동 속도로 빠질 때 무리하게 따라가지 않는다. 다음 웨이브를 먼저 잡거나, 돌아오는 Q가 빗나간 직후에만 짧게 되받아친다. 궁극기가 준비된 에코의 잔상 근처에서는 마무리 욕심을 줄인다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-ekko-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## Q가 빗나간 순간이 가장 분명한 창이다

다이애나는 `초승달 검기(Q)`가 묻은 대상에게 `월광 쇄도(E)`를 쓰면 E를 다시 쓸 수 있다. Q를 옆으로 피하면 진입 거리와 추격 횟수가 동시에 줄어든다. **Q가 없는 다이애나에게는 먼저 한 번 때리고 빠져도 된다.**[* [미드 다이애나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146055)][* [다이애나 장문 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138638)]

- Q는 휘어 들어오므로 다이애나 반대쪽보다 안쪽으로 짧게 비키는 선택도 섞는다.
- `은빛 가호(W)` 구체 세 개가 모두 터진 동안에는 긴 교환을 피한다.
- 표식이 묻었다면 아군 미니언에서 떨어져 두 번째 E의 발판을 줄인다.

## 6레벨 이후에는 미니언 한가운데 서지 않는다

`달빛 낙하(R)`는 여러 대상을 끌수록 강해진다. 아군과 미니언이 몰린 자리에서 맞서기보다 옆으로 빠져 한 명만 끌게 만든다. 다이애나가 첫 E로 들어온 뒤 퇴로용 대상이 없도록 뒤쪽 미니언과 간격을 둔다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-diana' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-diana') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-diana' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-diana-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-diana-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-diana' AND revision = 2
  AND general = '# 미드 라인 상대법

## Q가 빗나간 순간이 가장 분명한 창이다

다이애나는 `초승달 검기(Q)`가 묻은 대상에게 `월광 쇄도(E)`를 쓰면 E를 다시 쓸 수 있다. Q를 옆으로 피하면 진입 거리와 추격 횟수가 동시에 줄어든다. **Q가 없는 다이애나에게는 먼저 한 번 때리고 빠져도 된다.**[* [미드 다이애나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146055)][* [다이애나 장문 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138638)]

- Q는 휘어 들어오므로 다이애나 반대쪽보다 안쪽으로 짧게 비키는 선택도 섞는다.
- `은빛 가호(W)` 구체 세 개가 모두 터진 동안에는 긴 교환을 피한다.
- 표식이 묻었다면 아군 미니언에서 떨어져 두 번째 E의 발판을 줄인다.

## 6레벨 이후에는 미니언 한가운데 서지 않는다

`달빛 낙하(R)`는 여러 대상을 끌수록 강해진다. 아군과 미니언이 몰린 자리에서 맞서기보다 옆으로 빠져 한 명만 끌게 만든다. 다이애나가 첫 E로 들어온 뒤 퇴로용 대상이 없도록 뒤쪽 미니언과 간격을 둔다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-diana-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 낮은 체력 미니언은 이렐리아의 이동 경로다

막타 직전 미니언 옆에 서면 `칼날 쇄도(Q)` 초기화로 거리를 단숨에 좁힌다. 웨이브를 볼 때는 내 막타뿐 아니라 **이렐리아가 Q로 처치할 수 있는 미니언의 연속 경로**를 먼저 본다.[* [이렐리아 라인 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145057)][* [이렐리아 기본 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=37546)]

- 낮은 체력 미니언과 일직선으로 서지 않는다.
- `쌍검협무(E)` 첫 칼날이 보이면 두 칼날을 잇는 선의 옆으로 움직인다.
- 이렐리아가 중첩을 모두 쌓은 상태에서는 막타 하나를 포기하고 거리를 둔다.

## 표식이 사라진 뒤 짧게 친다

E나 `선봉진격검(R)` 표식이 남아 있으면 Q가 다시 준비된다. 첫 돌진만 보고 제자리에 맞서지 말고 표식 지속시간을 흘린다. `저항의 춤(W)`을 모으는 동안에는 큰 물리 피해를 억지로 넣지 말고, 끝나는 방향을 피한 뒤 되받아친다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-irelia' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-irelia') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-irelia' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-irelia-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-irelia-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-irelia' AND revision = 2
  AND general = '# 미드 라인 상대법

## 낮은 체력 미니언은 이렐리아의 이동 경로다

막타 직전 미니언 옆에 서면 `칼날 쇄도(Q)` 초기화로 거리를 단숨에 좁힌다. 웨이브를 볼 때는 내 막타뿐 아니라 **이렐리아가 Q로 처치할 수 있는 미니언의 연속 경로**를 먼저 본다.[* [이렐리아 라인 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145057)][* [이렐리아 기본 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=37546)]

- 낮은 체력 미니언과 일직선으로 서지 않는다.
- `쌍검협무(E)` 첫 칼날이 보이면 두 칼날을 잇는 선의 옆으로 움직인다.
- 이렐리아가 중첩을 모두 쌓은 상태에서는 막타 하나를 포기하고 거리를 둔다.

## 표식이 사라진 뒤 짧게 친다

E나 `선봉진격검(R)` 표식이 남아 있으면 Q가 다시 준비된다. 첫 돌진만 보고 제자리에 맞서지 말고 표식 지속시간을 흘린다. `저항의 춤(W)`을 모으는 동안에는 큰 물리 피해를 억지로 넣지 말고, 끝나는 방향을 피한 뒤 되받아친다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-irelia-20260913');
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

**궁극기 소리가 들리면 사이온이 보일 때까지 직선 통로를 따라 달리지 않고 충돌선에서 먼저 벗어난다.** 사이온을 처치한 뒤 체력이 낮다면 시체 옆의 미니언을 바로 먹지 않는다. 되살아난 동안 빠르게 공격하므로 간격을 만든 뒤 패시브가 끝나고 웨이브를 정리한다.', revision = 3, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-sion' AND kind = 'matchup' AND revision = 2
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-sion') = 2
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-sion' AND revision = 2 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-sion-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-sion-20260913', id, NULL, 2, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 3
FROM wiki_docs WHERE id = 'doc-c-sion' AND revision = 3
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — 보이지 않는 수풀 앞을 비운다 · 낮은 체력 미니언과 일직선에 서지 않는다 · 처치 뒤 패시브가 끝날 때까지 거리를 둔다

## 충전 중인 `Q`는 뒤보다 옆으로 피한다

**`대량 학살 강타(Q)`의 충전이 보이면 최대 사거리 밖으로 뛰기보다 직각에 가깝게 옆으로 벗어난다.**[* [M1 탑사이온 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=114749&vtype=pc)] 수풀과 시야 밖에서는 시작 동작이 보이지 않으므로 사이온이 사라진 쪽 벽을 따라 걷지 않는다. 사이온이 짧게 끊었다면 다시 바로 붙지 말고 다음 기술과 미니언 수를 확인한다.

## 미니언 뒤가 안전지대가 아니다

**`학살자의 포효(E)`는 미니언을 뒤로 날려 그 경로의 챔피언에게 둔화와 방어력 감소를 건다.**[* [사이온 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=57)] 낮은 체력 미니언과 사이온을 한 줄에 두지 않는다. `E`가 빗나가면 사이온은 먼 거리에서 `Q`를 준비하기 어려워지므로 막타나 짧은 견제를 돌려받는다.

## `W` 보호막이 켜지면 폭발 거리부터 벗어난다

**보호막을 무조건 깨려고 기술을 몰아 쓰면 사이온이 피해를 흡수한 뒤 범위 폭발까지 맞힐 수 있다.** 보호막이 켜진 순간 한 걸음 빠져 폭발 범위를 비우고, 사라진 뒤 교환한다. 큰 웨이브에서는 보호막 폭발이 라인 정리까지 해 주므로 먼저 무리해 싸우지 않는다.

## 궁극기 소리와 사망 후 패시브를 별개로 대응한다

**궁극기 소리가 들리면 사이온이 보일 때까지 직선 통로를 따라 달리지 않고 충돌선에서 먼저 벗어난다.** 사이온을 처치한 뒤 체력이 낮다면 시체 옆의 미니언을 바로 먹지 않는다. 되살아난 동안 빠르게 공격하므로 간격을 만든 뒤 패시브가 끝나고 웨이브를 정리한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-sion-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 미니언 뒤는 미사일 방패지만 Q의 안전지대는 아니다

`미사일 폭격(R)`은 첫 대상에서 폭발하므로 미니언을 사이에 두면 직접 적중을 줄일 수 있다. 반면 `인광탄(Q)`은 범위 기술이라 미니언과 함께 맞으면 손해다. **미사일에는 미니언을 끼고, Q에는 웨이브와 사선으로 선다.**[* [코르키 상세 대응 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=113454)]

- 세 번째 큰 미사일이 장전됐을 때는 낮은 미니언 뒤에 오래 서지 않는다.
- `개틀링 건(E)`이 켜진 코르키 정면에서 뒤로만 빼지 말고 원뿔 옆으로 나간다.
- `발키리(W)`를 앞으로 쓴 뒤에는 퇴로가 줄어드니 그때 짧게 되받아친다.

## 한 발을 피한 뒤 웨이브를 건드린다

코르키가 Q와 큰 미사일을 모두 들고 있으면 막타를 칠 때 견제를 겹치기 쉽다. 먼저 한 발을 움직임으로 빼고 미니언에 접근한다. 모든 미사일을 피하려 멀어지기보다 큰 탄만 확실히 피하고 작은 탄 사이에 라인을 정리한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-corki' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-corki') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-corki' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-corki-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-corki-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-corki' AND revision = 2
  AND general = '# 미드 라인 상대법

## 미니언 뒤는 미사일 방패지만 Q의 안전지대는 아니다

`미사일 폭격(R)`은 첫 대상에서 폭발하므로 미니언을 사이에 두면 직접 적중을 줄일 수 있다. 반면 `인광탄(Q)`은 범위 기술이라 미니언과 함께 맞으면 손해다. **미사일에는 미니언을 끼고, Q에는 웨이브와 사선으로 선다.**[* [코르키 상세 대응 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=113454)]

- 세 번째 큰 미사일이 장전됐을 때는 낮은 미니언 뒤에 오래 서지 않는다.
- `개틀링 건(E)`이 켜진 코르키 정면에서 뒤로만 빼지 말고 원뿔 옆으로 나간다.
- `발키리(W)`를 앞으로 쓴 뒤에는 퇴로가 줄어드니 그때 짧게 되받아친다.

## 한 발을 피한 뒤 웨이브를 건드린다

코르키가 Q와 큰 미사일을 모두 들고 있으면 막타를 칠 때 견제를 겹치기 쉽다. 먼저 한 발을 움직임으로 빼고 미니언에 접근한다. 모든 미사일을 피하려 멀어지기보다 큰 탄만 확실히 피하고 작은 탄 사이에 라인을 정리한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-corki-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 관문보다 투사체를 먼저 본다

제이스는 `전격 폭발(Q)`을 먼저 쏜 뒤 투사체 앞에 `가속 관문(E)`을 열어 반응 시간을 줄일 수 있다. 관문이 없다고 방심하지 말고 Q의 시작 동작부터 본다. **원거리 미니언을 사이에 두면 강화 Q 폭발을 대신 받아낼 수 있다.**[* [제이스 입문서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=125682)][* [미드 제이스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148113)]

- 미니언에서 너무 붙어 서서 폭발 피해를 함께 받지는 않는다.
- 캐논 Q와 관문이 빠졌다면 원거리 견제 압력이 크게 줄어든다.
- 해머로 바꾼 제이스를 추격할 때는 `천둥 강타(E)`로 밀릴 방향을 먼저 본다.

## 폼 전환 한 번에 긴 싸움을 허용하지 않는다

제이스는 두 형태의 기술을 연달아 쓸 수 있다. 캐논 기술 하나가 빠졌다고 바로 근접하면 해머 Q-E가 남아 있다. 두 형태를 모두 확인한 뒤 짧게 압박하고, 미니언 깊숙이 따라가지는 않는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-jayce' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-jayce') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-jayce' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-jayce-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-jayce-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-jayce' AND revision = 2
  AND general = '# 미드 라인 상대법

## 관문보다 투사체를 먼저 본다

제이스는 `전격 폭발(Q)`을 먼저 쏜 뒤 투사체 앞에 `가속 관문(E)`을 열어 반응 시간을 줄일 수 있다. 관문이 없다고 방심하지 말고 Q의 시작 동작부터 본다. **원거리 미니언을 사이에 두면 강화 Q 폭발을 대신 받아낼 수 있다.**[* [제이스 입문서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=125682)][* [미드 제이스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148113)]

- 미니언에서 너무 붙어 서서 폭발 피해를 함께 받지는 않는다.
- 캐논 Q와 관문이 빠졌다면 원거리 견제 압력이 크게 줄어든다.
- 해머로 바꾼 제이스를 추격할 때는 `천둥 강타(E)`로 밀릴 방향을 먼저 본다.

## 폼 전환 한 번에 긴 싸움을 허용하지 않는다

제이스는 두 형태의 기술을 연달아 쓸 수 있다. 캐논 기술 하나가 빠졌다고 바로 근접하면 해머 Q-E가 남아 있다. 두 형태를 모두 확인한 뒤 짧게 압박하고, 미니언 깊숙이 따라가지는 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-jayce-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 폭발 화약 네 번째 타격을 주지 않는다

`폭발 화약(E)`가 붙으면 트리스타나는 기본 공격과 기술로 중첩을 올린다. 두세 번 맞은 뒤 뒤늦게 맞서지 말고 즉시 사거리 밖으로 빠진다. **최대 중첩 폭발은 `로켓 점프(W)`까지 다시 준비시킬 수 있다.**[* [트리스타나 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109535)][* [트리스타나 스킬 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146264)]

- E가 붙지 않은 평타 한두 대와 E가 붙은 교환을 같은 피해로 생각하지 않는다.
- 트리스타나가 W로 앞으로 들어오면 착지 지점에서 먼저 벗어난다.
- 낮은 체력 미니언 옆에서는 미니언 폭발 피해까지 함께 받는다.

## 점프를 뺀 뒤에만 추격한다

W는 시전 도중 방해를 받아도 이동이 이어지는 경우가 있다. 착지 지점에 제어 기술을 두는 편이 안정적이다. 공격적으로 W를 쓴 뒤 E를 충분히 터뜨리지 못했다면 퇴로가 줄어든 시점이므로, 그때만 짧게 추격한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-tristana' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-tristana') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-tristana' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-tristana-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-tristana-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-tristana' AND revision = 2
  AND general = '# 미드 라인 상대법

## 폭발 화약 네 번째 타격을 주지 않는다

`폭발 화약(E)`가 붙으면 트리스타나는 기본 공격과 기술로 중첩을 올린다. 두세 번 맞은 뒤 뒤늦게 맞서지 말고 즉시 사거리 밖으로 빠진다. **최대 중첩 폭발은 `로켓 점프(W)`까지 다시 준비시킬 수 있다.**[* [트리스타나 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109535)][* [트리스타나 스킬 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146264)]

- E가 붙지 않은 평타 한두 대와 E가 붙은 교환을 같은 피해로 생각하지 않는다.
- 트리스타나가 W로 앞으로 들어오면 착지 지점에서 먼저 벗어난다.
- 낮은 체력 미니언 옆에서는 미니언 폭발 피해까지 함께 받는다.

## 점프를 뺀 뒤에만 추격한다

W는 시전 도중 방해를 받아도 이동이 이어지는 경우가 있다. 착지 지점에 제어 기술을 두는 편이 안정적이다. 공격적으로 W를 쓴 뒤 E를 충분히 터뜨리지 못했다면 퇴로가 줄어든 시점이므로, 그때만 짧게 추격한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-tristana-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 보호막을 작은 피해로 먼저 벗긴다

말자하의 기본 보호막이 남아 있으면 첫 제어 기술이 허무하게 사라질 수 있다. 큰 기술부터 쓰지 말고 기본 공격이나 작은 범위 피해로 지운 뒤 다음 행동을 준비한다. **보호막을 벗긴 직후가 정글 개입과 교환을 걸기 가장 분명한 순간**이다.[* [말자하 라인전 대처](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)]

- `재앙의 환상(E)`이 묻은 미니언이 죽기 직전이면 그 미니언에서 떨어진다.
- 공허충은 환상이 묻은 대상을 향하므로 먼저 정리해 압박을 줄인다.
- `공허의 부름(Q)` 두 문 사이에 오래 서지 않는다.

## 6레벨 뒤에는 먼저 시야 밖으로 걷지 않는다

`황천의 손아귀(R)`는 확정 제압이라 말자하 쪽 정글러가 보이지 않을 때 위험하다. 보호막과 궁극기가 모두 준비된 말자하 앞에서 체력 우위만 믿고 길게 전진하지 않는다. 궁극기가 빠진 뒤에는 이동기가 없는 점을 이용해 간격을 좁힌다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-malzahar' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-malzahar') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-malzahar' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-malzahar-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-malzahar-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-malzahar' AND revision = 2
  AND general = '# 미드 라인 상대법

## 보호막을 작은 피해로 먼저 벗긴다

말자하의 기본 보호막이 남아 있으면 첫 제어 기술이 허무하게 사라질 수 있다. 큰 기술부터 쓰지 말고 기본 공격이나 작은 범위 피해로 지운 뒤 다음 행동을 준비한다. **보호막을 벗긴 직후가 정글 개입과 교환을 걸기 가장 분명한 순간**이다.[* [말자하 라인전 대처](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)]

- `재앙의 환상(E)`이 묻은 미니언이 죽기 직전이면 그 미니언에서 떨어진다.
- 공허충은 환상이 묻은 대상을 향하므로 먼저 정리해 압박을 줄인다.
- `공허의 부름(Q)` 두 문 사이에 오래 서지 않는다.

## 6레벨 뒤에는 먼저 시야 밖으로 걷지 않는다

`황천의 손아귀(R)`는 확정 제압이라 말자하 쪽 정글러가 보이지 않을 때 위험하다. 보호막과 궁극기가 모두 준비된 말자하 앞에서 체력 우위만 믿고 길게 전진하지 않는다. 궁극기가 빠진 뒤에는 이동기가 없는 점을 이용해 간격을 좁힌다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-malzahar-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 광선에 맞지 않으려 계속 작은 방향 전환을 한다

`마법공학 광선(E)`은 별도 준비 동작이 짧아 막타 순간을 노리기 쉽다. 같은 방향으로 오래 걷지 말고 미니언을 칠 때마다 짧게 옆으로 움직인다. **광선을 피한 직후에만 전진하면 빅토르의 일방적인 교환을 줄일 수 있다.**[* [빅토르 라인전 대처](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)][* [빅토르 상대 팁](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=121926)]

- `힘의 흡수(Q)` 직후에는 보호막과 강화 공격이 함께 남아 있으니 바로 맞서지 않는다.
- `중력장(W)` 안에서 직선으로 끝까지 달리지 말고 가장 가까운 가장자리로 나간다.
- 강화 E의 뒤따르는 폭발 위치에 다시 들어가지 않는다.

## 웨이브를 끼고 맞딜하지 않는다

빅토르가 아군 미니언 가까이 전진하면 미니언 피해를 받게 만들 수 있지만, Q 보호막이 켜진 상태라면 교환이 상쇄된다. 보호막이 끝난 뒤 짧게 때리고, 중력장 안으로 추격하지 않는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-viktor' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-viktor') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-viktor' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-viktor-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-viktor-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-viktor' AND revision = 2
  AND general = '# 미드 라인 상대법

## 광선에 맞지 않으려 계속 작은 방향 전환을 한다

`마법공학 광선(E)`은 별도 준비 동작이 짧아 막타 순간을 노리기 쉽다. 같은 방향으로 오래 걷지 말고 미니언을 칠 때마다 짧게 옆으로 움직인다. **광선을 피한 직후에만 전진하면 빅토르의 일방적인 교환을 줄일 수 있다.**[* [빅토르 라인전 대처](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)][* [빅토르 상대 팁](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=121926)]

- `힘의 흡수(Q)` 직후에는 보호막과 강화 공격이 함께 남아 있으니 바로 맞서지 않는다.
- `중력장(W)` 안에서 직선으로 끝까지 달리지 말고 가장 가까운 가장자리로 나간다.
- 강화 E의 뒤따르는 폭발 위치에 다시 들어가지 않는다.

## 웨이브를 끼고 맞딜하지 않는다

빅토르가 아군 미니언 가까이 전진하면 미니언 피해를 받게 만들 수 있지만, Q 보호막이 켜진 상태라면 교환이 상쇄된다. 보호막이 끝난 뒤 짧게 때리고, 중력장 안으로 추격하지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-viktor-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 신드라보다 바닥의 구체를 본다

`적군 와해(E)`는 바닥의 `어둠 구체(Q)`를 밀어 긴 기절 선을 만든다. 신드라와 거리를 두는 것만으로는 부족하고, **신드라-구체-내 위치가 한 줄이 되지 않게** 움직여야 한다.[* [신드라 장문 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109849)][* [신드라 대응법 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=110336)]

- 새 구체가 생길 때마다 그 뒤 직선을 비운다.
- E가 빠지면 신드라의 밀어내기와 기절이 함께 사라지므로 짧게 전진한다.
- `의지의 힘(W)`으로 든 물체를 보고 착지 지점의 옆으로 피한다.

## 구체가 많이 남은 상태에서 마무리를 서두르지 않는다

궁극기는 주변에 준비된 구체가 많을수록 강해진다. 바닥에 구체가 여러 개 남아 있고 체력이 낮다면 한 번 더 맞교환하지 않는다. 궁극기 뒤에는 구체가 한곳에 쌓이므로 이어지는 E 직선을 즉시 피한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-syndra' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-syndra') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-syndra' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-syndra-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-syndra-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-syndra' AND revision = 2
  AND general = '# 미드 라인 상대법

## 신드라보다 바닥의 구체를 본다

`적군 와해(E)`는 바닥의 `어둠 구체(Q)`를 밀어 긴 기절 선을 만든다. 신드라와 거리를 두는 것만으로는 부족하고, **신드라-구체-내 위치가 한 줄이 되지 않게** 움직여야 한다.[* [신드라 장문 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109849)][* [신드라 대응법 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=110336)]

- 새 구체가 생길 때마다 그 뒤 직선을 비운다.
- E가 빠지면 신드라의 밀어내기와 기절이 함께 사라지므로 짧게 전진한다.
- `의지의 힘(W)`으로 든 물체를 보고 착지 지점의 옆으로 피한다.

## 구체가 많이 남은 상태에서 마무리를 서두르지 않는다

궁극기는 주변에 준비된 구체가 많을수록 강해진다. 바닥에 구체가 여러 개 남아 있고 체력이 낮다면 한 번 더 맞교환하지 않는다. 궁극기 뒤에는 구체가 한곳에 쌓이므로 이어지는 E 직선을 즉시 피한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-syndra-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## Q 충전에는 옆걸음, E에는 미니언을 쓴다

제라스가 `비전 파동(Q)`을 모으면 뒤로만 달리지 말고 좌우로 짧게 방향을 바꾼다. `충격 구체(E)`는 첫 유닛에 막히므로 접근할 때는 미니언을 사이에 둔다. **한 기술을 피하려다 다른 기술의 정답 자리를 버리지 않는다.**[* [제라스 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137300)][* [제라스 장인 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=108801)]

- `파멸의 눈(W)` 중앙은 둔화와 피해가 더 크므로 원 가장자리로 즉시 나간다.
- Q와 E가 모두 빠진 뒤에만 간격을 좁힌다.
- 제라스가 기본 공격을 위해 미니언 가까이 올 때 짧게 압박한다.

## 궁극기를 쓰면 첫 발보다 내 이동 규칙을 바꾼다

`비전 의식(R)` 중 제라스는 움직이지 못한다. 매 발마다 같은 박자로 좌우를 반복하지 말고, 짧게 멈추거나 방향 전환 간격을 섞는다. 포탄만 보며 적 정글 쪽으로 도망치지 않도록 안전한 방향을 먼저 정한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-xerath' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-xerath') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-xerath' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-xerath-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-xerath-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-xerath' AND revision = 2
  AND general = '# 미드 라인 상대법

## Q 충전에는 옆걸음, E에는 미니언을 쓴다

제라스가 `비전 파동(Q)`을 모으면 뒤로만 달리지 말고 좌우로 짧게 방향을 바꾼다. `충격 구체(E)`는 첫 유닛에 막히므로 접근할 때는 미니언을 사이에 둔다. **한 기술을 피하려다 다른 기술의 정답 자리를 버리지 않는다.**[* [제라스 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137300)][* [제라스 장인 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=108801)]

- `파멸의 눈(W)` 중앙은 둔화와 피해가 더 크므로 원 가장자리로 즉시 나간다.
- Q와 E가 모두 빠진 뒤에만 간격을 좁힌다.
- 제라스가 기본 공격을 위해 미니언 가까이 올 때 짧게 압박한다.

## 궁극기를 쓰면 첫 발보다 내 이동 규칙을 바꾼다

`비전 의식(R)` 중 제라스는 움직이지 못한다. 매 발마다 같은 박자로 좌우를 반복하지 말고, 짧게 멈추거나 방향 전환 간격을 섞는다. 포탄만 보며 적 정글 쪽으로 도망치지 않도록 안전한 방향을 먼저 정한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-xerath-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 카드 색을 보고 교환 여부를 정한다

트위스티드 페이트가 `카드 뽑기(W)`를 켜면 머리 위 카드가 순환한다. 금색 카드를 확정한 동안은 막타 하나를 포기하고 사거리 밖으로 빠진다. **카드를 미니언에 쓴 직후가 가장 안전한 교환 창**이다.[* [야스오의 트위스티드 페이트 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=108941)][* [트위스티드 페이트 장문 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)]

- 금색 카드가 보이면 거리를 벌리고, 빨간 카드를 미니언에 던질 때는 폭발 범위에서 떨어진다.
- `속임수 덱(E)`의 강화 공격이 준비됐는지 카드 모양을 확인한다.
- `와일드 카드(Q)`는 세 갈래 사이 공간으로 피한다.

## 6레벨 뒤에는 사라진 방향을 바로 알린다

트위스티드 페이트가 웨이브를 밀고 시야에서 사라지면 뒤늦게 따라가지 않는다. 먼저 양쪽 라인에 신호를 보내고 다음 웨이브를 빠르게 밀어 손실을 만든다. 궁극기 시야가 켜졌다면 숨기보다 착지할 만한 아군 주변 공간을 비운다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-twistedfate' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-twistedfate') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-twistedfate' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-twistedfate-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-twistedfate-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-twistedfate' AND revision = 2
  AND general = '# 미드 라인 상대법

## 카드 색을 보고 교환 여부를 정한다

트위스티드 페이트가 `카드 뽑기(W)`를 켜면 머리 위 카드가 순환한다. 금색 카드를 확정한 동안은 막타 하나를 포기하고 사거리 밖으로 빠진다. **카드를 미니언에 쓴 직후가 가장 안전한 교환 창**이다.[* [야스오의 트위스티드 페이트 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=108941)][* [트위스티드 페이트 장문 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)]

- 금색 카드가 보이면 거리를 벌리고, 빨간 카드를 미니언에 던질 때는 폭발 범위에서 떨어진다.
- `속임수 덱(E)`의 강화 공격이 준비됐는지 카드 모양을 확인한다.
- `와일드 카드(Q)`는 세 갈래 사이 공간으로 피한다.

## 6레벨 뒤에는 사라진 방향을 바로 알린다

트위스티드 페이트가 웨이브를 밀고 시야에서 사라지면 뒤늦게 따라가지 않는다. 먼저 양쪽 라인에 신호를 보내고 다음 웨이브를 빠르게 밀어 손실을 만든다. 궁극기 시야가 켜졌다면 숨기보다 착지할 만한 아군 주변 공간을 비운다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-twistedfate-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 미니언 하나만 믿고 Q를 맞지 않는다

`빛의 속박(Q)`은 첫 유닛을 맞힌 뒤 하나를 더 관통한다. 미니언 한 마리 뒤에만 서면 그대로 속박될 수 있으므로 두 마리 이상을 사이에 두거나 옆으로 선다. **Q가 빗나간 뒤가 럭스에게 가장 안전하게 접근할 수 있는 순간**이다.[* [럭스 라인전 대처](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)][* [피즈 공략의 럭스 상대](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=135376)]

- `광휘의 특이점(E)` 원 안에서는 가장 가까운 가장자리로 바로 나온다.
- E가 깔린 채로 막타를 치려 하지 말고 폭발을 먼저 유도한다.
- Q에 묶이면 직선상에서 `최후의 섬광(R)`까지 이어지므로 체력이 낮을 때는 간격을 더 둔다.

## 보호막 왕복을 모두 계산한다

`프리즘 보호막(W)`은 나갈 때와 돌아올 때 두 번 보호한다. 첫 보호막만 보고 피해 계산을 끝내지 않는다. W와 Q를 함께 쓴 뒤에는 방어와 제어 수단이 동시에 비므로, 그 짧은 구간에만 압박한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-lux' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-lux') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-lux' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-lux-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-lux-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-lux' AND revision = 2
  AND general = '# 미드 라인 상대법

## 미니언 하나만 믿고 Q를 맞지 않는다

`빛의 속박(Q)`은 첫 유닛을 맞힌 뒤 하나를 더 관통한다. 미니언 한 마리 뒤에만 서면 그대로 속박될 수 있으므로 두 마리 이상을 사이에 두거나 옆으로 선다. **Q가 빗나간 뒤가 럭스에게 가장 안전하게 접근할 수 있는 순간**이다.[* [럭스 라인전 대처](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)][* [피즈 공략의 럭스 상대](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=135376)]

- `광휘의 특이점(E)` 원 안에서는 가장 가까운 가장자리로 바로 나온다.
- E가 깔린 채로 막타를 치려 하지 말고 폭발을 먼저 유도한다.
- Q에 묶이면 직선상에서 `최후의 섬광(R)`까지 이어지므로 체력이 낮을 때는 간격을 더 둔다.

## 보호막 왕복을 모두 계산한다

`프리즘 보호막(W)`은 나갈 때와 돌아올 때 두 번 보호한다. 첫 보호막만 보고 피해 계산을 끝내지 않는다. W와 Q를 함께 쓴 뒤에는 방어와 제어 수단이 동시에 비므로, 그 짧은 구간에만 압박한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-lux-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 챔피언보다 구체 위치를 본다

오리아나의 모든 위협은 구체에서 시작한다. 오리아나와 멀리 떨어져 있어도 구체 옆에 서면 `명령: 불협화음(W)`과 `명령: 충격파(R)` 범위다. **구체 반대편으로 이동하면 다음 Q 이동 거리와 반응 시간이 늘어난다.**[* [아리의 오리아나 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=122420)][* [신드라의 오리아나 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132083)]

- 구체가 바닥에 있을 때 그 근처 막타를 억지로 치지 않는다.
- 구체가 오리아나에게 돌아오는 `명령: 보호(E)` 경로에서도 피해를 받지 않게 옆으로 선다.
- 오리아나의 연속 기본 공격은 점점 아프므로 길게 맞교환하지 않는다.

## Q-W 뒤의 빈 시간을 쓴다

구체가 앞으로 나와 W까지 터졌다면 다음 견제가 바로 이어지지 않는다. 이때 짧게 전진해 기술 하나를 쓰고, 구체가 다시 움직이기 전에 빠진다. 구체가 보이지 않는 수풀이나 아군 몸에 붙어 있다면 궁극기 범위를 먼저 의심한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-orianna' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-orianna') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-orianna' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-orianna-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-orianna-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-orianna' AND revision = 2
  AND general = '# 미드 라인 상대법

## 챔피언보다 구체 위치를 본다

오리아나의 모든 위협은 구체에서 시작한다. 오리아나와 멀리 떨어져 있어도 구체 옆에 서면 `명령: 불협화음(W)`과 `명령: 충격파(R)` 범위다. **구체 반대편으로 이동하면 다음 Q 이동 거리와 반응 시간이 늘어난다.**[* [아리의 오리아나 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=122420)][* [신드라의 오리아나 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132083)]

- 구체가 바닥에 있을 때 그 근처 막타를 억지로 치지 않는다.
- 구체가 오리아나에게 돌아오는 `명령: 보호(E)` 경로에서도 피해를 받지 않게 옆으로 선다.
- 오리아나의 연속 기본 공격은 점점 아프므로 길게 맞교환하지 않는다.

## Q-W 뒤의 빈 시간을 쓴다

구체가 앞으로 나와 W까지 터졌다면 다음 견제가 바로 이어지지 않는다. 이때 짧게 전진해 기술 하나를 쓰고, 구체가 다시 움직이기 전에 빠진다. 구체가 보이지 않는 수풀이나 아군 몸에 붙어 있다면 궁극기 범위를 먼저 의심한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-orianna-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 느린 Q를 옆으로 피하고 냉각된 상태에서 물러난다

`냉기 폭발(Q)`은 투사체와 폭발에 맞으면 기절한다. 직선으로 뒤로 빼면 오래 따라오므로 옆으로 비킨다. Q나 완성된 `얼음 폭풍(R)`에 맞아 냉각됐다면 **`동상(E)`의 두 배 피해가 오기 전에 사거리 밖으로 나간다.**[* [야스오의 애니비아 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=136999)][* [애니비아 맞춤 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=120543)]

- 벽과 애니비아 사이의 좁은 통로로 들어가지 않는다.
- R 장판이 커지기 전에 즉시 벗어나고, 장판 안에서 막타를 버티지 않는다.
- 패시브가 준비된 애니비아를 쓰러뜨릴 때 알을 끝낼 시간과 적 위치를 먼저 본다.

## 6레벨 전 웨이브를 움직인다

애니비아는 초반 기본 공격과 기술 속도가 느리다. 무리한 처치보다 먼저 밀어 포탑 아래 막타를 강요하고 강가 주도권을 만든다. Q가 빠졌다면 벽 외에는 즉시 진입을 막을 수단이 줄어드니 짧게 압박한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-anivia' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-anivia') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-anivia' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-anivia-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-anivia-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-anivia' AND revision = 2
  AND general = '# 미드 라인 상대법

## 느린 Q를 옆으로 피하고 냉각된 상태에서 물러난다

`냉기 폭발(Q)`은 투사체와 폭발에 맞으면 기절한다. 직선으로 뒤로 빼면 오래 따라오므로 옆으로 비킨다. Q나 완성된 `얼음 폭풍(R)`에 맞아 냉각됐다면 **`동상(E)`의 두 배 피해가 오기 전에 사거리 밖으로 나간다.**[* [야스오의 애니비아 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=136999)][* [애니비아 맞춤 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=120543)]

- 벽과 애니비아 사이의 좁은 통로로 들어가지 않는다.
- R 장판이 커지기 전에 즉시 벗어나고, 장판 안에서 막타를 버티지 않는다.
- 패시브가 준비된 애니비아를 쓰러뜨릴 때 알을 끝낼 시간과 적 위치를 먼저 본다.

## 6레벨 전 웨이브를 움직인다

애니비아는 초반 기본 공격과 기술 속도가 느리다. 무리한 처치보다 먼저 밀어 포탑 아래 막타를 강요하고 강가 주도권을 만든다. Q가 빠졌다면 벽 외에는 즉시 진입을 막을 수단이 줄어드니 짧게 압박한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-anivia-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 미니언과 벽 사이에서 수면 각을 지운다

`헤롱헤롱쿨쿨방울(E)`은 첫 대상에 맞지만 벽을 통과하면 사거리가 길어진다. 미니언 뒤를 쓰되, 옆 벽에서 날아오는 각까지 함께 본다. **수면에 맞았다면 조이와 반대 방향보다 통통별 이동 거리를 줄이는 쪽으로 움직인다.**[* [조이 참고서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141439)]

- 조이가 Q를 뒤로 보냈다면 정면 직선에서 벗어난다.
- `차원 넘기(R)`로 앞으로 나오면 현재 위치보다 돌아갈 표식을 겨냥한다.
- 주문 파편이 떨어진 미니언 근처에서는 조이가 추가 행동을 얻는 순간을 예상한다.

## 수면이 빠진 뒤 웨이브를 민다

E가 빗나가면 조이는 접근을 막는 수단이 크게 줄어든다. 그때 짧게 전진하거나 웨이브를 밀어 다음 수면을 미니언 정리에 쓰게 한다. 시야가 없는 옆 벽에는 E가 길게 넘어올 수 있으므로 중앙에만 시선을 두지 않는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-zoe' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-zoe') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-zoe' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-zoe-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-zoe-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-zoe' AND revision = 2
  AND general = '# 미드 라인 상대법

## 미니언과 벽 사이에서 수면 각을 지운다

`헤롱헤롱쿨쿨방울(E)`은 첫 대상에 맞지만 벽을 통과하면 사거리가 길어진다. 미니언 뒤를 쓰되, 옆 벽에서 날아오는 각까지 함께 본다. **수면에 맞았다면 조이와 반대 방향보다 통통별 이동 거리를 줄이는 쪽으로 움직인다.**[* [조이 참고서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141439)]

- 조이가 Q를 뒤로 보냈다면 정면 직선에서 벗어난다.
- `차원 넘기(R)`로 앞으로 나오면 현재 위치보다 돌아갈 표식을 겨냥한다.
- 주문 파편이 떨어진 미니언 근처에서는 조이가 추가 행동을 얻는 순간을 예상한다.

## 수면이 빠진 뒤 웨이브를 민다

E가 빗나가면 조이는 접근을 막는 수단이 크게 줄어든다. 그때 짧게 전진하거나 웨이브를 밀어 다음 수면을 미니언 정리에 쓰게 한다. 시야가 없는 옆 벽에는 E가 길게 넘어올 수 있으므로 중앙에만 시선을 두지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-zoe-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 감옥이 생기기 전에 바깥으로 나간다

`사건의 지평선(E)`은 테두리가 생긴 뒤 닿으면 기절한다. 예고가 보였을 때 가장 가까운 바깥으로 빠지는 것이 우선이다. 이미 안에 갇혔다면 **테두리를 억지로 넘지 말고 내부에서 `암흑 물질(W)` 착지점을 피한다.**[* [미드 베이가 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138154)][* [베이가 라인전 분류](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)]

- 베이가가 Q로 막타와 챔피언을 함께 맞히지 못하게 웨이브와 사선으로 선다.
- E가 빠진 뒤에는 베이가의 자기 보호 수단이 줄어든다.
- 체력이 낮을수록 궁극기 피해가 커지므로 애매한 체력으로 한 번 더 막타를 보지 않는다.

## 성장 시간을 공짜로 주지 않는다

베이가는 Q로 유닛을 처치할수록 강해진다. 무리한 다이브보다 웨이브를 먼저 밀어 Q를 막타에 쓰게 하고, E가 없는 동안 강가 시야와 합류 우위를 챙긴다. 감옥을 빼냈다면 그 시간을 아무 행동 없이 보내지 않는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-veigar' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-veigar') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-veigar' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-veigar-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-veigar-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-veigar' AND revision = 2
  AND general = '# 미드 라인 상대법

## 감옥이 생기기 전에 바깥으로 나간다

`사건의 지평선(E)`은 테두리가 생긴 뒤 닿으면 기절한다. 예고가 보였을 때 가장 가까운 바깥으로 빠지는 것이 우선이다. 이미 안에 갇혔다면 **테두리를 억지로 넘지 말고 내부에서 `암흑 물질(W)` 착지점을 피한다.**[* [미드 베이가 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138154)][* [베이가 라인전 분류](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)]

- 베이가가 Q로 막타와 챔피언을 함께 맞히지 못하게 웨이브와 사선으로 선다.
- E가 빠진 뒤에는 베이가의 자기 보호 수단이 줄어든다.
- 체력이 낮을수록 궁극기 피해가 커지므로 애매한 체력으로 한 번 더 막타를 보지 않는다.

## 성장 시간을 공짜로 주지 않는다

베이가는 Q로 유닛을 처치할수록 강해진다. 무리한 다이브보다 웨이브를 먼저 밀어 Q를 막타에 쓰게 하고, E가 없는 동안 강가 시야와 합류 우위를 챙긴다. 감옥을 빼냈다면 그 시간을 아무 행동 없이 보내지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-veigar-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 공포가 준비됐을 때 이동기로 들어가지 않는다

벡스의 파멸 표식이 준비되면 다음 기본 기술이 공포를 건다. 상태 표시가 켜진 동안에는 이동기로 먼저 접근하지 않는다. **`커지는 어둠(E)`를 피워 공포를 소모시킨 뒤가 가장 분명한 진입 창**이다.[* [오로라 공략의 벡스 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148099)]

- E 원이 커지는 동안 가장 가까운 바깥으로 걷는다.
- 가까이 붙을 때는 `거리 두기(W)` 보호막과 공포가 함께 나올 수 있음을 계산한다.
- `그림자 파동(R)`은 미니언을 사이에 둬 첫 적중을 막는다.

## 표식이 묻으면 혼자 깊게 빠지지 않는다

R 표식이 남은 동안 벡스는 다시 시전해 대상에게 날아올 수 있다. 아군과 너무 멀어지는 방향으로 도망치지 말고, 벡스가 도착했을 때 함께 대응할 수 있는 쪽으로 이동한다. 첫 R이 빗나가면 장거리 진입 위협이 사라진다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-vex' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-vex') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-vex' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-vex-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-vex-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-vex' AND revision = 2
  AND general = '# 미드 라인 상대법

## 공포가 준비됐을 때 이동기로 들어가지 않는다

벡스의 파멸 표식이 준비되면 다음 기본 기술이 공포를 건다. 상태 표시가 켜진 동안에는 이동기로 먼저 접근하지 않는다. **`커지는 어둠(E)`를 피워 공포를 소모시킨 뒤가 가장 분명한 진입 창**이다.[* [오로라 공략의 벡스 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148099)]

- E 원이 커지는 동안 가장 가까운 바깥으로 걷는다.
- 가까이 붙을 때는 `거리 두기(W)` 보호막과 공포가 함께 나올 수 있음을 계산한다.
- `그림자 파동(R)`은 미니언을 사이에 둬 첫 적중을 막는다.

## 표식이 묻으면 혼자 깊게 빠지지 않는다

R 표식이 남은 동안 벡스는 다시 시전해 대상에게 날아올 수 있다. 아군과 너무 멀어지는 방향으로 도망치지 말고, 벡스가 도착했을 때 함께 대응할 수 있는 쪽으로 이동한다. 첫 R이 빗나가면 장거리 진입 위협이 사라진다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-vex-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## Q를 피하면 쌍독니의 긴 교환도 끊긴다

카시오페아는 `맹독 폭발(Q)`을 맞힌 뒤 이동 속도를 얻고 강화된 `쌍독니(E)`를 반복한다. 첫 Q를 옆으로 피하고, 맞았다면 독이 끝날 때까지 뒤로 빠진다. **독에 걸린 채 제자리에서 맞딜하는 것이 가장 나쁜 선택**이다.[* [카시오페아 라인전 디테일](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145069)][* [카시오페아 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137300)]

- `독기의 늪(W)` 위에서는 이동 기술이 막히므로 가장 가까운 가장자리로 걷는다.
- Q가 빗나가면 카시오페아가 E를 길게 이어갈 이유가 줄어든다.
- 정면에서 궁극기 동작이 보이면 카시오페아 반대쪽으로 시선을 돌린다.

## 짧게 때리고 독이 없는 시간을 쓴다

카시오페아는 긴 싸움에서 강하다. 기술 하나만 쓰고 빠지는 교환을 반복하고, Q가 없는 동안 웨이브를 건드린다. 미니언이 적어 E를 챔피언에게 계속 쓸 수 있는 넓은 공간에서는 추격하지 않는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-cassiopeia' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-cassiopeia') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-cassiopeia' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-cassiopeia-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-cassiopeia-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-cassiopeia' AND revision = 2
  AND general = '# 미드 라인 상대법

## Q를 피하면 쌍독니의 긴 교환도 끊긴다

카시오페아는 `맹독 폭발(Q)`을 맞힌 뒤 이동 속도를 얻고 강화된 `쌍독니(E)`를 반복한다. 첫 Q를 옆으로 피하고, 맞았다면 독이 끝날 때까지 뒤로 빠진다. **독에 걸린 채 제자리에서 맞딜하는 것이 가장 나쁜 선택**이다.[* [카시오페아 라인전 디테일](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145069)][* [카시오페아 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137300)]

- `독기의 늪(W)` 위에서는 이동 기술이 막히므로 가장 가까운 가장자리로 걷는다.
- Q가 빗나가면 카시오페아가 E를 길게 이어갈 이유가 줄어든다.
- 정면에서 궁극기 동작이 보이면 카시오페아 반대쪽으로 시선을 돌린다.

## 짧게 때리고 독이 없는 시간을 쓴다

카시오페아는 긴 싸움에서 강하다. 기술 하나만 쓰고 빠지는 교환을 반복하고, Q가 없는 동안 웨이브를 건드린다. 미니언이 적어 E를 챔피언에게 계속 쓸 수 있는 넓은 공간에서는 추격하지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-cassiopeia-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 돌밭 위로 이동기를 쓰지 않는다

`대지의 파동(E)` 위에서 돌진하거나 밀려나면 바위가 폭발해 기절한다. 장판이 깔리면 이동 기술로 가로지르지 말고 걸어서 가장자리로 나온다. **탈리야의 E가 남아 있을 때 직선 진입을 시작하지 않는다.**[* [미드 탈리야 정석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=129711)]

- `지각변동(W)` 예고가 보이면 뒤가 아니라 옆으로 움직여 밀려날 방향을 비튼다.
- `파편 난사(Q)`는 첫 파편을 피한 뒤 같은 방향으로 계속 달리지 않는다.
- 다져진 땅에서는 큰 바위 한 발이 둔화를 주므로 착지 지점을 먼저 피한다.

## W와 E가 갈린 순간에 접근한다

W가 빗나가거나 E를 웨이브 정리에 썼다면 탈리야의 근거리 자기 보호가 약해진다. 그때만 짧게 압박하고, 두 기술이 다시 준비되기 전에 빠진다. 라인을 민 뒤 시야에서 사라지면 벽을 타고 빠르게 합류할 수 있으므로 바로 알린다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-taliyah' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-taliyah') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-taliyah' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-taliyah-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-taliyah-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-taliyah' AND revision = 2
  AND general = '# 미드 라인 상대법

## 돌밭 위로 이동기를 쓰지 않는다

`대지의 파동(E)` 위에서 돌진하거나 밀려나면 바위가 폭발해 기절한다. 장판이 깔리면 이동 기술로 가로지르지 말고 걸어서 가장자리로 나온다. **탈리야의 E가 남아 있을 때 직선 진입을 시작하지 않는다.**[* [미드 탈리야 정석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=129711)]

- `지각변동(W)` 예고가 보이면 뒤가 아니라 옆으로 움직여 밀려날 방향을 비튼다.
- `파편 난사(Q)`는 첫 파편을 피한 뒤 같은 방향으로 계속 달리지 않는다.
- 다져진 땅에서는 큰 바위 한 발이 둔화를 주므로 착지 지점을 먼저 피한다.

## W와 E가 갈린 순간에 접근한다

W가 빗나가거나 E를 웨이브 정리에 썼다면 탈리야의 근거리 자기 보호가 약해진다. 그때만 짧게 압박하고, 두 기술이 다시 준비되기 전에 빠진다. 라인을 민 뒤 시야에서 사라지면 벽을 타고 빠르게 합류할 수 있으므로 바로 알린다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-taliyah-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 기절 중첩이 보이면 막타 하나를 버린다

애니는 기술을 네 번 사용하면 다음 공격 기술에 기절이 붙는다. 중첩 표시가 가득 찬 동안에는 사거리 끝에서 막타를 욕심내지 않는다. **기절을 미니언 정리에 쓴 직후가 가장 안전한 교환 창**이다.[* [미드 애니 챔피언별 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144836)]

- 애니가 Q로 막타를 이어갈 때 중첩 수가 빠르게 바뀌는 것을 본다.
- `소각(W)`은 원뿔 범위이므로 미니언과 겹쳐 맞지 않게 사선으로 선다.
- `용암 방패(E)`가 켜진 동안 무의미한 기본 공격을 반복하지 않는다.

## 6레벨 뒤에는 미니언과 떨어진다

`소환: 티버(R)`는 지정 구역에 즉시 피해와 기절을 겹칠 수 있다. 기절이 준비된 애니가 전진하면 아군과 붙어 한 번에 맞지 않는다. 티버가 나온 뒤에는 애니만 쫓지 말고 주변 지속 피해 범위에서도 빠진다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-annie' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-annie') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-annie' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-annie-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-annie-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-annie' AND revision = 2
  AND general = '# 미드 라인 상대법

## 기절 중첩이 보이면 막타 하나를 버린다

애니는 기술을 네 번 사용하면 다음 공격 기술에 기절이 붙는다. 중첩 표시가 가득 찬 동안에는 사거리 끝에서 막타를 욕심내지 않는다. **기절을 미니언 정리에 쓴 직후가 가장 안전한 교환 창**이다.[* [미드 애니 챔피언별 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144836)]

- 애니가 Q로 막타를 이어갈 때 중첩 수가 빠르게 바뀌는 것을 본다.
- `소각(W)`은 원뿔 범위이므로 미니언과 겹쳐 맞지 않게 사선으로 선다.
- `용암 방패(E)`가 켜진 동안 무의미한 기본 공격을 반복하지 않는다.

## 6레벨 뒤에는 미니언과 떨어진다

`소환: 티버(R)`는 지정 구역에 즉시 피해와 기절을 겹칠 수 있다. 기절이 준비된 애니가 전진하면 아군과 붙어 한 번에 맞지 않는다. 티버가 나온 뒤에는 애니만 쫓지 말고 주변 지속 피해 범위에서도 빠진다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-annie-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## Q 정신 집중을 공짜로 이어가게 두지 않는다

아우렐리온 솔은 `빛의 숨결(Q)`을 같은 대상에게 계속 맞혀 추가 피해와 별가루를 얻는다. 숨결을 맞으면 옆으로 벗어나 시야나 사거리를 끊는다. **제자리에 멈춰 Q를 쓰는 순간이 오히려 기술을 맞히기 쉬운 창**이다.[* [아우렐리온 솔 기본 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=136613)]

- `특이점(E)` 중심으로 걸어가지 말고 가장 가까운 바깥으로 빠진다.
- 체력이 낮은 미니언이 E 안에 몰렸을 때 함께 서서 별가루를 더 주지 않는다.
- `별의 비행(W)` 방향이 정해지면 옆으로 움직여 Q 직선을 끊는다.

## 초반 웨이브에서 성장 시간을 압박한다

별가루가 적을 때는 기술 범위와 처형 기준이 작다. 무리한 처치보다 먼저 밀어 Q와 E를 미니언 정리에 쓰게 하고, 정신 집중이 끊긴 동안 짧게 교환한다. W가 빠진 뒤에는 즉시 거리를 다시 만들기 어렵다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-aurelionsol' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-aurelionsol') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-aurelionsol' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-aurelionsol-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-aurelionsol-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-aurelionsol' AND revision = 2
  AND general = '# 미드 라인 상대법

## Q 정신 집중을 공짜로 이어가게 두지 않는다

아우렐리온 솔은 `빛의 숨결(Q)`을 같은 대상에게 계속 맞혀 추가 피해와 별가루를 얻는다. 숨결을 맞으면 옆으로 벗어나 시야나 사거리를 끊는다. **제자리에 멈춰 Q를 쓰는 순간이 오히려 기술을 맞히기 쉬운 창**이다.[* [아우렐리온 솔 기본 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=136613)]

- `특이점(E)` 중심으로 걸어가지 말고 가장 가까운 바깥으로 빠진다.
- 체력이 낮은 미니언이 E 안에 몰렸을 때 함께 서서 별가루를 더 주지 않는다.
- `별의 비행(W)` 방향이 정해지면 옆으로 움직여 Q 직선을 끊는다.

## 초반 웨이브에서 성장 시간을 압박한다

별가루가 적을 때는 기술 범위와 처형 기준이 작다. 무리한 처치보다 먼저 밀어 Q와 E를 미니언 정리에 쓰게 하고, 정신 집중이 끊긴 동안 짧게 교환한다. W가 빠진 뒤에는 즉시 거리를 다시 만들기 어렵다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-aurelionsol-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 미니언과 일직선으로 서지 않는다

`얼음 파편(Q)`은 첫 대상에서 부서진 뒤 뒤쪽으로 더 뻗는다. 미니언 뒤가 안전지대가 아니므로 웨이브와 사선으로 선다. **리산드라 몸 주변의 `서릿발(W)` 범위 밖에서 교환을 시작한다.**[* [에코의 리산드라 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=134573)][* [카타리나의 리산드라 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=122233)]

- `얼음갈퀴 길(E)`이 지나가면 리산드라보다 갈퀴 끝 위치를 먼저 본다.
- E 끝에 제어 기술을 미리 두거나, 착지 범위에서 벗어난다.
- 6레벨 이후 체력이 낮을 때는 즉시 `얼음 무덤(R)`에 묶일 거리를 주지 않는다.

## 자기 궁극기를 쓴 동안 다음 위치를 잡는다

리산드라가 자신에게 R을 쓰면 무적이라 피해를 넣을 수 없다. 그 자리에 기술을 낭비하지 말고 얼음 장판 범위에서 빠져, 풀리는 순간의 퇴로를 막는다. 적에게 R을 쓴 뒤에는 확정 제어가 빠졌으므로 다음 교환 창이 열린다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-lissandra' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-lissandra') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-lissandra' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-lissandra-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-lissandra-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-lissandra' AND revision = 2
  AND general = '# 미드 라인 상대법

## 미니언과 일직선으로 서지 않는다

`얼음 파편(Q)`은 첫 대상에서 부서진 뒤 뒤쪽으로 더 뻗는다. 미니언 뒤가 안전지대가 아니므로 웨이브와 사선으로 선다. **리산드라 몸 주변의 `서릿발(W)` 범위 밖에서 교환을 시작한다.**[* [에코의 리산드라 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=134573)][* [카타리나의 리산드라 상대법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=122233)]

- `얼음갈퀴 길(E)`이 지나가면 리산드라보다 갈퀴 끝 위치를 먼저 본다.
- E 끝에 제어 기술을 미리 두거나, 착지 범위에서 벗어난다.
- 6레벨 이후 체력이 낮을 때는 즉시 `얼음 무덤(R)`에 묶일 거리를 주지 않는다.

## 자기 궁극기를 쓴 동안 다음 위치를 잡는다

리산드라가 자신에게 R을 쓰면 무적이라 피해를 넣을 수 없다. 그 자리에 기술을 낭비하지 말고 얼음 장판 범위에서 빠져, 풀리는 순간의 퇴로를 막는다. 적에게 R을 쓴 뒤에는 확정 제어가 빠졌으므로 다음 교환 창이 열린다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-lissandra-20260913');
UPDATE wiki_docs
SET general = '# 미드 라인 상대법

## 아지르가 아니라 병사 사거리를 피한다

아지르의 기본 공격은 모래 병사 위치에서 시작한다. 챔피언 본체와 거리가 있어도 병사 가까이에 서면 계속 맞는다. **병사 옆이 아니라 병사 공격선의 바깥으로 움직여야 한다.**[* [아지르 라인전 대처](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)][* [탈리야 공략의 아지르 항목](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=129711)]

- 병사가 없는 쪽으로 막타 위치를 바꾼다.
- `사막의 맹습(Q)`으로 병사들이 이동하는 순간 옆으로 비켜 추가 공격을 줄인다.
- 아지르와 병사 사이 직선에서는 `신기루(E)` 충돌 경로를 비운다.

## 밀어내기 각을 벽과 함께 본다

6레벨 이후 아지르가 E로 병사에게 접근하면 `황제의 진영(R)`으로 뒤쪽에 밀 수 있다. 포탑 방향으로 등을 보인 채 추격하지 않고, 옆으로 빠질 공간을 남긴다. 병사를 전진 배치한 뒤에는 아지르 본체 주변의 즉시 공격 범위가 줄어드니 그때 웨이브를 정리한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-azir' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-azir') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-azir' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-azir-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-azir-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-azir' AND revision = 2
  AND general = '# 미드 라인 상대법

## 아지르가 아니라 병사 사거리를 피한다

아지르의 기본 공격은 모래 병사 위치에서 시작한다. 챔피언 본체와 거리가 있어도 병사 가까이에 서면 계속 맞는다. **병사 옆이 아니라 병사 공격선의 바깥으로 움직여야 한다.**[* [아지르 라인전 대처](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137848)][* [탈리야 공략의 아지르 항목](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=129711)]

- 병사가 없는 쪽으로 막타 위치를 바꾼다.
- `사막의 맹습(Q)`으로 병사들이 이동하는 순간 옆으로 비켜 추가 공격을 줄인다.
- 아지르와 병사 사이 직선에서는 `신기루(E)` 충돌 경로를 비운다.

## 밀어내기 각을 벽과 함께 본다

6레벨 이후 아지르가 E로 병사에게 접근하면 `황제의 진영(R)`으로 뒤쪽에 밀 수 있다. 포탑 방향으로 등을 보인 채 추격하지 않고, 옆으로 빠질 공간을 남긴다. 병사를 전진 배치한 뒤에는 아지르 본체 주변의 즉시 공격 범위가 줄어드니 그때 웨이브를 정리한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-azir-20260913');
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

**정령이 지나오는 선에서 옆으로 벗어나고, 팀에 밀치기나 기절이 있다면 정령과 충돌하려는 오른에게 남긴다.** 여러 명이 같은 방향으로 도망가면 두 번째 정령에 한꺼번에 뜬다. 좁은 입구를 비우고 서로 다른 각으로 벌어지는 편이 안전하다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-ornn' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-ornn') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-ornn' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-ornn-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-ornn-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-ornn' AND revision = 2
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — 기둥과 벽을 한 줄에 두지 않는다 · 불안정 표식 뒤의 기본 공격을 끊는다 · 궁극기는 오른의 박치기 위치를 본다

## 제작 중인 시간은 압박하되 무리해서 잡으러 가지 않는다

**오른이 라인 뒤에서 제작을 시작하면 그 짧은 시간 동안 막타와 위치를 먼저 잡는다.**[* [입문자를 위한 오른 파헤치기](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=137340)] 제작을 끊겠다고 큰 웨이브를 가로질러 들어가면 미니언 피해로 교환을 진다. 대신 라인을 밀어 귀환 선택을 어렵게 만들거나, 강가 시야를 먼저 잡아 다음 웨이브의 주도권으로 바꾼다.

## `Q` 기둥이 생긴 뒤에는 옆으로 빠진다

**`용암 균열(Q)`에 맞았다면 뒤로만 달리지 않는다.**[* [오른 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=138)] 내 뒤의 자연 지형과 새로 생길 기둥이 `화염 돌진(E)` 한 번에 이어지지 않는지 본다. **벽과 기둥 사이에 서 있는 순간이 오른의 가장 단순한 띄우기 각**이다. `E`가 빠진 뒤에는 오른의 즉시 접근 수단이 줄어드니 짧게 체력이나 라인 이득을 돌려받는다.

## 불안정이 묻으면 한 대를 덜 치고 간격을 만든다

**`불꽃 풀무질(W)` 마지막 타격에 맞으면 표식이 남는다.** 이때 기본 공격 한 대를 더 욕심내면 오른이 표식을 터뜨리며 교환을 완성한다. 표식이 사라질 때까지 거리를 벌리고, `W`가 빗나갔을 때만 긴 교환을 연다.

## 궁극기의 첫 적중보다 되받아치는 오른을 방해한다

**정령이 지나오는 선에서 옆으로 벗어나고, 팀에 밀치기나 기절이 있다면 정령과 충돌하려는 오른에게 남긴다.** 여러 명이 같은 방향으로 도망가면 두 번째 정령에 한꺼번에 뜬다. 좁은 입구를 비우고 서로 다른 각으로 벌어지는 편이 안전하다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-ornn-20260913');
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

**상대 정글이 보이지 않을 때 말파이트의 궁극기 사거리 안에서 체력을 낮게 유지하지 않는다.** 한타에서는 딜러와 보조 인원이 같은 원 안에 뭉치지 않고, 말파이트가 시야에서 사라졌다면 좁은 입구를 먼저 확인한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-malphite' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-malphite') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-malphite' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-malphite-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-malphite-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-malphite' AND revision = 2
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — 작은 공격으로 보호막 재생을 막는다 · `Q`를 쓴 뒤의 마나와 거리를 본다 · 6레벨부터 정글 위치와 궁극기 각을 함께 계산한다

## 보호막을 깨는 공격과 본 교환을 나눈다

**말파이트의 화강암 방패가 켜진 상태에서 큰 기술부터 쓰면 체력에 닿는 피해가 줄어든다.**[* [다이아) 캐리형 최대추댐 탑 탱커 말파이트](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133569&vtype=pc)] 기본 공격이나 짧은 견제로 먼저 보호막을 지우고, 재생되기 전에 다음 교환을 건다. 다만 보호막을 막겠다고 매번 앞으로 걸으면 `Q` 이동 속도 차이로 되받아칠 수 있으니 웨이브가 내 편일 때만 반복한다.

## `Q`를 맞은 직후 따라가지 않는다

**`지진의 파편(Q)`은 내 이동 속도를 빼앗아 말파이트에게 준다.**[* [말파이트 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=36)] 맞은 직후 추격하면 거리는 벌어지고 적 미니언 피해만 받는다. 말파이트가 마나를 써서 막타를 먹었는지, 견제에 썼는지 구분한다. **견제만 반복해 마나가 줄었다면 라인을 밀어 선택지를 좁힌다.**

## 평타 기반 챔피언은 `E`가 빠진 뒤 길게 싸운다

**`지면 강타(E)`에 맞으면 공격 속도가 낮아진다.** 기술을 맞은 상태에서 맞딜을 이어 가지 말고 한 번 빠졌다가 감소 효과와 재사용 대기시간을 기다린다. 말파이트가 웨이브 정리에 `E`를 썼다면 그때가 긴 교환을 열기 쉬운 창이다.

## 6레벨 이후에는 일직선으로 겹치지 않는다

**상대 정글이 보이지 않을 때 말파이트의 궁극기 사거리 안에서 체력을 낮게 유지하지 않는다.** 한타에서는 딜러와 보조 인원이 같은 원 안에 뭉치지 않고, 말파이트가 시야에서 사라졌다면 좁은 입구를 먼저 확인한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-malphite-20260913');
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

**끊을 수 있는 방해 기술과 거리가 있다면 즉시 사용한다.** 끊을 수 없다면 뒤늦게 맵을 따라가기보다 웨이브를 포탑에 넣고 포탑 피해를 챙긴다. 쉔이 돌아올 경로에 시야를 남겨 복귀 후 기습까지 대비한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-shen' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-shen') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-shen' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-shen-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-shen-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-shen' AND revision = 2
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — 쉔과 기의 검 사이에 서지 않는다 · 결계가 끝난 뒤 기본 공격을 몰아친다 · 쉔이 궁을 쓰면 끊기와 웨이브 이득 중 빠른 쪽을 고른다

## 검이 내 뒤에 놓였는지 먼저 본다

**쉔 본체만 보면 `Q` 강화 공격 각을 놓친다.**[* [쉔은 절대 라인전 약캐가 아닙니다](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115811&vtype=pc)] 기의 검과 쉔 사이에 서 있으면 검이 통과하며 쉔의 다음 공격이 강해진다. 막타를 먹을 때 두 점을 한 줄로 만들지 않고 옆으로 선다. 검이 쉔 가까이에 이미 있다면 통과 강화가 어려워져 짧게 견제하기 좋다.

## `W` 안에서 기본 공격을 낭비하지 않는다

**기의 검 주변에 결계가 생기면 기본 공격을 잠시 멈추고 위치를 바꾼다.**[* [쉔 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=55)] 강화 평타나 공격 속도 증가 기술을 결계에 쏟지 않는다. `W`가 끝난 뒤에도 쉔의 `E`가 남아 있다면 바로 추격하지 말고 도발 경로를 옆으로 비튼다.

## 도발이 빗나가면 웨이브가 허락하는 만큼만 응징한다

**`그림자 돌진(E)`이 빠진 쉔은 즉시 거리를 줄일 방법이 줄어든다.** 다만 적 미니언이 많다면 긴 추격보다 체력 한 번과 라인 위치를 가져오는 것으로 끝낸다. 포탑 쪽으로 도망가는 쉔을 따라가다 다음 `Q`와 보호막까지 기다려 주지 않는다.

## 궁극기 정신 집중을 보자마자 결정을 끝낸다

**끊을 수 있는 방해 기술과 거리가 있다면 즉시 사용한다.** 끊을 수 없다면 뒤늦게 맵을 따라가기보다 웨이브를 포탑에 넣고 포탑 피해를 챙긴다. 쉔이 돌아올 경로에 시야를 남겨 복귀 후 기습까지 대비한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-shen-20260913');
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

**벽을 등진 채 `R`을 맞으면 팀과 분리된다.** 교전 전에 벽에서 떨어지고, 궁극기를 맞았다면 이동기로 더 깊은 곳에 끌려가지 않게 측면으로 빠진다. 크산테는 총공세 동안 공격성이 커지는 대신 방어 능력이 낮아지므로 아군이 가까우면 집중 공격으로 되받아칠 수 있다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-ksante' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-ksante') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-ksante' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-ksante-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-ksante-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-ksante' AND revision = 2
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — `Q` 중첩을 세며 막타 각을 바꾼다 · 충전 중인 `W` 앞에서 핵심 기술을 쓰지 않는다 · 벽을 등진 채 총공세를 맞지 않는다

## 세 번째 `Q`가 준비되면 막타 하나를 늦춘다

**크산테가 `Q`를 두 번 맞힌 뒤에는 다음 타격이 끌어당김으로 바뀐다.**[* [크산테의 핵심 정동열](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148170&vtype=pc)] 준비 상태에서 정면으로 막타를 먹으면 `Q`부터 `W`까지 연계될 수 있다. 미니언 옆으로 각도를 바꾸거나 잠시 거리를 내주고, 세 번째 `Q`가 빗나간 뒤 짧게 압박한다.

## 표식이 묻은 상태에서 기본 공격 거리를 주지 않는다

**크산테의 기술에 맞으면 표식이 생기고 다음 기본 공격이 추가 피해를 만든다.**[* [크산테 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=162)] 기술 한 번을 맞았다고 즉시 맞딜로 들어가기보다 한 걸음 빠져 표식 소비를 어렵게 한다. `E`로 따라왔다면 보호막이 끝난 뒤 되받아치되, 아군 미니언을 타고 더 멀리 움직일 수 있다는 점을 계산한다.

## 충전하는 `W`에는 기술을 겹치지 않는다

**`길을 여는 자(W)` 충전 중인 크산테는 피해를 줄여 받고 방해 효과를 버틴다.** 큰 피해나 핵심 군중 제어기를 그 시간에 쓰지 않는다. 돌진 방향을 옆으로 피한 뒤 재사용 대기시간 동안 교환한다. 벽 가까이에서는 짧은 적중만으로도 이어지는 위치가 나빠지므로 중앙 쪽으로 움직인다.

## 총공세 뒤에는 도망만 가지 말고 낮아진 방어력을 본다

**벽을 등진 채 `R`을 맞으면 팀과 분리된다.** 교전 전에 벽에서 떨어지고, 궁극기를 맞았다면 이동기로 더 깊은 곳에 끌려가지 않게 측면으로 빠진다. 크산테는 총공세 동안 공격성이 커지는 대신 방어 능력이 낮아지므로 아군이 가까우면 집중 공격으로 되받아칠 수 있다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-ksante-20260913');
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

**6레벨 이후 초가스가 가까이 있고 내 체력이 낮다면 보호막이나 회복을 너무 늦게 쓰지 않는다.** `포식(R)`은 방어력을 무시하는 고정 피해라 마지막 순간의 저항력으로 버티기 어렵다. 한타에서는 주요 오브젝트 체력이 낮을 때 초가스를 먼저 밀어내 처형 사거리 진입을 막는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-chogath' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-chogath') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-chogath' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-chogath-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-chogath-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-chogath' AND revision = 2
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — `Q`는 발밑 표시보다 이동 방향으로 피한다 · 미니언을 꾸준히 먹게 두면 체력 교환이 복구된다 · 6레벨부터 포식 처형선을 넉넉하게 본다

## `Q`를 피할 이동기를 먼저 쓰지 않는다

**초가스의 `파열(Q)`이 남아 있을 때 접근 이동기를 공격에 쓰면 발밑 파열을 피할 수단이 사라진다.**[* [정석 착취 초가스 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146725)] 지면 표시가 생기면 직선으로 뒤로 빠지기보다 가장 가까운 가장자리로 벗어난다. `Q`가 빗나간 뒤에는 초가스의 원거리 진입 차단이 줄어드니 짧게 압박한다.

## 견제 뒤에는 막타 회복까지 막아야 손해가 남는다

**초가스는 미니언을 처치하며 체력과 마나를 회복한다.**[* [초가스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=11)] 한 번 때리고 라인을 천천히 두면 다음 웨이브에서 손해를 복구한다. 체력 우위를 만들었다면 미니언 앞에 서서 안전한 막타 수를 줄이되, 큰 적 웨이브 안에서 무리해 유지력보다 더 큰 피해를 받지 않는다.

## 침묵을 맞은 상태에서는 긴 교환을 열지 않는다

**`흉포한 울부짖음(W)`에 맞으면 이동기와 방어 기술이 잠시 막힌다.** 초가스 쪽으로 계속 들어가기보다 침묵이 끝날 때까지 옆으로 빠진다. `E` 가시는 미니언을 관통하므로 낮은 체력 아군 미니언 바로 뒤에서 맞딜하지 않는다.

## 포식 표시가 보이기 전부터 체력선을 관리한다

**6레벨 이후 초가스가 가까이 있고 내 체력이 낮다면 보호막이나 회복을 너무 늦게 쓰지 않는다.** `포식(R)`은 방어력을 무시하는 고정 피해라 마지막 순간의 저항력으로 버티기 어렵다. 한타에서는 주요 오브젝트 체력이 낮을 때 초가스를 먼저 밀어내 처형 사거리 진입을 막는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-chogath-20260913');
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

**짧게 쓰는 궁극기는 즉시 띄우고, 길게 모으면 멀리 날려 교전에서 제외한다.** 뽀삐가 충전하면 한 줄로 서지 않고 옆으로 벌어진다. 한 명이 날아가면 남은 인원이 수적으로 불리한 싸움을 계속하지 않는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-poppy' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-poppy') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-poppy' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-poppy-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-poppy-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-poppy' AND revision = 2
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — 벽과 뽀삐 사이에 서지 않는다 · 돌진은 `W`가 빠진 뒤 쓴다 · 궁극기 충전이 보이면 옆으로 흩어진다

## 방패가 떨어진 자리에서 다음 교환을 읽는다

**뽀삐가 던진 방패를 주우면 보호막을 얻으므로, 안전하다면 먼저 밟아 없앨 수 있다.**[* [뽀삐 공략 게시판](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=49)] 다만 방패 하나를 지우겠다고 벽 쪽이나 큰 적 웨이브로 들어가면 `E` 각을 내준다. 방패의 착지점이 뽀삐의 `Q` 범위와 겹치는지도 확인한다.

## 벽에서 한 걸음 떨어지는 것이 기술 하나를 지우는 셈이다

**`용감한 돌진(E)`은 지형에 부딪혀야 기절한다.**[* [뽀삐 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=49)] 수풀 입구, 포탑 잔해, 협곡 벽을 등진 채 막타를 먹지 않는다. 뽀삐가 측면으로 돌아오면 같은 방향으로 도망가지 말고 중앙으로 각도를 바꾼다. 벽꿍이 실패한 뒤에는 접근기와 기절이 함께 빠지므로 짧게 되받아친다.

## `W`가 켜진 원 안에서 돌진하지 않는다

**뽀삐 주변에 `굳건한 태세(W)`가 켜지면 이동기를 공격에 쓰지 않는다.** 막힌 뒤에는 둔화와 이동 기술 제한까지 이어진다. 걸어서 원 밖으로 나오거나 지속시간을 기다리고, `W`가 빠진 다음 교환에 돌진을 남긴다.

## 궁극기는 충전 방향과 아군 위치를 함께 본다

**짧게 쓰는 궁극기는 즉시 띄우고, 길게 모으면 멀리 날려 교전에서 제외한다.** 뽀삐가 충전하면 한 줄로 서지 않고 옆으로 벌어진다. 한 명이 날아가면 남은 인원이 수적으로 불리한 싸움을 계속하지 않는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-poppy-20260913');
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

**`대자연의 마수(R)`가 넓게 다가오면 뒤로만 달릴수록 오래 같은 경로에 남는다.** 가까운 줄기 사이의 틈이나 측면으로 빠지고, 이미 아군 한 명이 맞았다면 같은 줄에 겹쳐 서지 않는다. 궁극기가 빠진 뒤에는 마오카이의 장거리 교전 개시가 줄어든다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-maokai' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-maokai') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-maokai' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-maokai-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-maokai-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-maokai' AND revision = 2
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — 수풀을 얼굴로 확인하지 않는다 · `W` 대상 지정 뒤에는 도망보다 착지 지점을 준비한다 · 패시브 회복 공격을 공짜로 주지 않는다

## 수풀 묘목은 미니언이나 시야로 먼저 확인한다

**마오카이가 오래 점유한 수풀에는 강화된 묘목이 있을 가능성이 높다.**[* [마오카이에 대한 팁들](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141364&vtype=pc)] 체력으로 확인하지 말고 미니언이 들어가게 하거나 시야를 확보한 뒤 지난다. 묘목이 달려오면 아군 웨이브로 끌고 가지 않고 빈 공간으로 빠져 폭발 범위를 분리한다.

## 패시브가 준비된 막타를 압박한다

**마오카이는 준비된 기본 공격으로 체력을 회복한다.**[* [시즌 8 마오카이 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141885&vtype=pc)] 체력이 낮은 미니언 앞에 서서 회복 대상을 쉽게 주지 않으면 유지력이 줄어든다. 다만 회복 한 번을 막으려다 `Q`로 적 웨이브 안에 밀려나지 않도록 미니언 수와 위치를 먼저 본다.

## `W`에 지정된 뒤에는 착지 후 기술을 맞힌다

**`뒤틀린 전진(W)`이 시작되면 마오카이가 잠시 대상으로 지정되지 않아 날아가는 기술이 헛돈다.** 이동기를 급히 쓰기보다 착지 위치를 보고, 나타난 순간 방어 기술이나 군중 제어기를 사용한다. 착지 직후 `Q`에 아군 쪽으로 밀리지 않도록 몸의 방향도 바꾼다.

## 궁극기 벽과 평행하게 달리지 않는다

**`대자연의 마수(R)`가 넓게 다가오면 뒤로만 달릴수록 오래 같은 경로에 남는다.** 가까운 줄기 사이의 틈이나 측면으로 빠지고, 이미 아군 한 명이 맞았다면 같은 줄에 겹쳐 서지 않는다. 궁극기가 빠진 뒤에는 마오카이의 장거리 교전 개시가 줄어든다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-maokai-20260913');
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

**`사막의 분노(R)`가 켜지면 체력과 방어 능력이 오르고 `Q`가 빨리 돌아온다.** 처음 간격을 벌인 뒤 체력이 조금 남았다는 이유로 다시 붙지 않는다. 궁극기 시간을 충분히 뺀 다음, 이동기가 없는 나서스를 여러 방향에서 느리게 압박한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-nasus' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-nasus') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-nasus' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-nasus-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-nasus-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-nasus' AND revision = 2
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — 초반 푸시 뒤 되돌아오는 웨이브를 잡는다 · `Q` 막타마다 작은 비용을 붙인다 · 궁극기가 켜지면 시간을 빼고 다시 싸운다

## 처음부터 계속 밀기보다 되돌아오는 웨이브를 이용한다

**나서스를 포탑 아래에 영원히 가두겠다고 계속 밀면 안전한 `Q` 막타와 정글의 갱 경로를 함께 준다.**[* [TOP 나서스에 대해](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133482&vtype=pc)] 초반 웨이브를 포탑에 넣었다면 다음 웨이브가 내 쪽으로 돌아오게 두고, 긴 탑 라인 중앙에서 나서스가 막타를 먹으러 나오도록 만든다.

## `Q` 막타를 먹는 순간에만 정확히 때린다

**나서스가 모든 미니언을 먹는 동안 의미 없이 기술을 쓰기보다 `Q`로 막타를 치는 고정된 순간에 견제를 맞힌다.**[* [TOP 나서스, 한 번 해보지 않을래?](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=110707)] 체력 우위를 만들었다면 대포 미니언 앞에서 압박하고, 적 웨이브가 더 많을 때는 스택 하나를 막겠다고 맞딜하지 않는다.

## `쇠약`을 맞으면 공격 속도와 이동 속도가 함께 줄어든다

**평타 기반 챔피언은 `W`가 걸린 상태에서 긴 맞딜을 시작하지 않는다.** 초반 둔화가 약해 보여도 시간이 갈수록 강해진다. 이동기나 방어 기술로 간격을 벌리고 지속시간이 끝난 뒤 되받아친다. `E` 장판 위에서는 방어력이 낮아지므로 그 자리에서 버티지 않는다.

## 궁극기를 켠 나서스에게 킬을 확인하러 돌아가지 않는다

**`사막의 분노(R)`가 켜지면 체력과 방어 능력이 오르고 `Q`가 빨리 돌아온다.** 처음 간격을 벌인 뒤 체력이 조금 남았다는 이유로 다시 붙지 않는다. 궁극기 시간을 충분히 뺀 다음, 이동기가 없는 나서스를 여러 방향에서 느리게 압박한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-nasus-20260913');
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

**자크가 네 조각으로 갈라지면 하나라도 살아남을 때 부활할 수 있다.** 체력이 낮은 채 혼자 조각을 치다가 상대 팀이 합류하면 처치 하나 때문에 교전을 뒤집힌다. 안전한 조각부터 팀과 나눠 정리하고, 위험하면 부활 위치만 기억한 채 빠진다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-zac' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-zac') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-zac' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-zac-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-zac-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-zac' AND revision = 2
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — 떨어진 조각을 먼저 밟는다 · `Q`에 맞으면 다른 유닛과 거리를 둔다 · 보이지 않는 자크의 `E` 착지선을 비운다

## 조각 하나를 지우는 것이 다음 `W`까지 늦춘다

**자크가 기술을 맞힌 뒤 떨어뜨린 조각을 안전하게 밟으면 회복과 `W` 재사용 감소를 함께 막는다.**[* [탑, 미드 자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146717)] 하지만 조각을 밟으러 적 웨이브 안으로 들어가면 자크가 원하는 긴 교환이 열린다. 내 발 가까이 떨어진 조각부터 지우고 먼 것은 포기한다.

## `Q`에 붙잡히면 미니언 곁에서 떨어진다

**`탄성 주먹(Q)` 첫 타격을 맞은 뒤 자크가 다른 대상을 공격하면 둘이 충돌한다.**[* [자크장인 탑자크 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115999)] 아군 미니언이나 소환물 옆에 그대로 서지 않고 반대 방향으로 움직인다. 자크가 두 번째 대상을 찾지 못하면 기술의 핵심 제어가 사라진다.

## 자크가 시야에서 사라지면 벽 옆 직선을 비운다

**`새총 발사(E)`는 보이지 않는 곳에서 충전할 때 대응 시간이 짧다.** 자크가 수풀이나 벽 뒤로 빠지면 같은 자리에서 막타를 계속 치지 않는다. 착지 표시를 본 뒤 옆으로 빠지고, 가까운 거리에서 충전이 보인다면 방해 기술로 끊을 수 있는지 판단한다.

## 처치 전에 패시브 유무와 주변 적을 확인한다

**자크가 네 조각으로 갈라지면 하나라도 살아남을 때 부활할 수 있다.** 체력이 낮은 채 혼자 조각을 치다가 상대 팀이 합류하면 처치 하나 때문에 교전을 뒤집힌다. 안전한 조각부터 팀과 나눠 정리하고, 위험하면 부활 위치만 기억한 채 빠진다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-zac-20260913');
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

**`두꺼운 피부(E)`로 회색 체력을 보호막으로 바꾸면 잠시 교환을 멈춘다.** 보호막이 사라진 뒤 다시 싸우고, 체력이 낮아 보여도 집어삼키기의 보호와 회복을 고려한다. 한타에서는 세 중첩을 허용한 아군이 삼켜지기 전에 탐 켄치와 거리를 벌리도록 돕는다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-tahmkench' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-tahmkench') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-tahmkench' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-tahmkench-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-tahmkench-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-tahmkench' AND revision = 2
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — 절대 미각 중첩이 쌓이면 먼저 끊는다 · 미니언으로 `Q` 선을 막는다 · 회색 체력이 보호막이 된 뒤에는 시간을 뺀다

## 두 번째 중첩에서 이미 물러날 준비를 한다

**탐 켄치에게 세 중첩이 쌓인 뒤 빠지려 하면 `Q` 기절이나 `R` 격리가 이어진다.**[* [탑 플래티넘 길라잡이](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143266)] 체력바 주변 중첩을 보고 두 번째에서 거리를 만들기 시작한다. 세 번째 기본 공격을 피하려고 적 포탑 방향으로 도망가지 않고, 내 미니언 뒤로 돌아 `Q`까지 막는다.

## `Q`와 내 몸 사이에 미니언을 둔다

**`혀 채찍(Q)`은 첫 유닛에 막힌다.**[* [탐 켄치 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=126)] 원거리 미니언 옆에서 각도를 유지하고, 탐 켄치가 옆으로 크게 돌아 선을 만들면 반대편으로 움직인다. `Q`가 미니언에 빠진 뒤에는 회복과 둔화가 모두 없으므로 짧게 압박한다.

## `W` 표시는 중심이 아니라 가장자리로 빠진다

**`심연 잠수(W)`의 도착 표시가 생기면 가장 가까운 바깥쪽으로 벗어난다.** 뒤로만 가면 탐 켄치가 퇴로를 막는 위치에 나타날 수 있다. 빗나간 뒤 탐 켄치가 아군 미니언에서 멀다면 그 짧은 시간에 체력 이득을 돌려받는다.

## 큰 보호막을 때리며 기술을 낭비하지 않는다

**`두꺼운 피부(E)`로 회색 체력을 보호막으로 바꾸면 잠시 교환을 멈춘다.** 보호막이 사라진 뒤 다시 싸우고, 체력이 낮아 보여도 집어삼키기의 보호와 회복을 고려한다. 한타에서는 세 중첩을 허용한 아군이 삼켜지기 전에 탐 켄치와 거리를 벌리도록 돕는다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-tahmkench-20260913');
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

**`최대 투여량(R)`은 긴 시간 체력을 회복하고 이동 속도를 준다.** 문도가 낮은 체력이라고 직선으로 계속 쫓으면 회복이 따라잡는다. 처치를 확정할 피해가 없다면 궁극기만 빼고 웨이브나 시야를 챙긴 뒤, 재사용 대기시간 동안 다음 교환을 준비한다.', revision = 2, updated_at = '2026-09-13T09:00:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-drmundo' AND kind = 'matchup' AND revision = 1
  AND updated_by = 'user-system'
  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = 'doc-c-drmundo') = 1
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-drmundo' AND revision = 1 AND author = 'user-system' AND status = 'accepted' AND body = wiki_docs.general)
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-drmundo-20260913');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-inline-sources-matchup-drmundo-20260913', id, NULL, 1, general, '상대법 출처를 근거 문장 인라인 각주로 정리', 'accepted', 'user-system', '2026-09-13T09:00:00.000Z', 'admin', 2
FROM wiki_docs WHERE id = 'doc-c-drmundo' AND revision = 2
  AND general = '# 탑 라인 상대법

> **한눈에 보기** — 미니언으로 `Q`를 막는다 · 첫 이동 불가 효과는 패시브를 벗기는 데 쓴다 · 궁극기가 켜지면 회복 시간을 주지 않거나 싸움을 끊는다

## 뼈톱의 빈 선을 계속 바꾼다

**`오염된 뼈톱(Q)`은 처음 맞는 유닛에 막힌다.**[* [문도 박사 연구 결과 및 분석 - 탑](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112977&vtype=pc)] 체력이 충분한 미니언 뒤에서 각도를 유지하고, 낮은 체력 미니언은 `E`에 밀려 투사체가 될 수 있으니 바로 뒤에 서지 않는다. `Q`가 미니언에 빠졌다면 둔화가 없는 시간에 막타나 짧은 견제를 챙긴다.

## 첫 군중 제어기는 처치보다 패시브 제거가 목적이다

**문도 박사는 처음 맞는 이동 불가 효과를 막고 화학 물질을 떨어뜨린다.**[* [문도 박사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=13)] 가장 긴 핵심 기술부터 쓰지 말고 짧은 제어기로 패시브를 먼저 벗긴다. 떨어진 물질을 문도가 줍기 전에 안전하게 밟을 수 있다면 회복과 패시브 재사용 감소를 함께 막는다.

## `W`가 켜졌을 때 피해를 한꺼번에 몰지 않는다

**문도는 `심장 전기 충격(W)` 동안 받은 피해 일부를 저장했다가 종료 적중으로 회복한다.** 큰 기술을 모두 겹치면 되돌리는 양도 커진다. 종료할 때 거리를 벌여 적중 대상을 주지 않거나, 회복이 끝난 뒤 남은 기술로 다시 교환한다.

## 궁극기를 빼면 끝까지 따라가기보다 다음 창을 만든다

**`최대 투여량(R)`은 긴 시간 체력을 회복하고 이동 속도를 준다.** 문도가 낮은 체력이라고 직선으로 계속 쫓으면 회복이 따라잡는다. 처치를 확정할 피해가 없다면 궁극기만 빼고 웨이브나 시야를 챙긴 뒤, 재사용 대기시간 동안 다음 교환을 준비한다.' AND updated_at = '2026-09-13T09:00:00.000Z' AND updated_by = 'user-system'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-inline-sources-matchup-drmundo-20260913');
-- 과거 리비전의 AI 제목과 요약만 중립화한다. 출처 본문은 역사 보존을 위해 고치지 않는다.
UPDATE wiki_edits
SET body = CASE
      WHEN body LIKE '# AI 작성 초안%' AND doc_id IN (SELECT id FROM wiki_docs WHERE kind = 'article')
        THEN REPLACE(body, '# AI 작성 초안', '# 미드 라인 실전 운용')
      WHEN body LIKE '# AI 작성 초안%' THEN REPLACE(body, '# AI 작성 초안', '# 미드 라인 상대법')
      ELSE body END,
    summary = CASE
      WHEN summary = 'AI 작성: 실전 라인전 초안' THEN '미드 챔피언 실전 운용 원고 작성'
      WHEN summary = 'AI 작성: 인벤 기반 실전 라인전 상대법' THEN '인벤 기반 미드 라인 상대법 작성'
      ELSE REPLACE(REPLACE(summary, 'AI 작성: ', ''), 'AI 작성', '원고 작성') END
WHERE body LIKE '%AI 작성%' OR summary LIKE '%AI 작성%';
WITH targets(doc_id, edit_id) AS (VALUES
  ('doc-a-23010eca-0af1-4ee2-a3a2-ac98f90fa9f9', 'edit-inline-sources-article-naafiri-20260913'),
  ('doc-a-67086497-75b0-4808-a001-3dddfeacc105', 'edit-inline-sources-article-ryze-20260913'),
  ('doc-a-27bd0e78-66b0-4a9b-846a-32b18365e3ef', 'edit-inline-sources-article-lux-20260913'),
  ('doc-ai-champion-leblanc-20260911', 'edit-inline-sources-article-leblanc-20260913'),
  ('doc-a-132c9ef9-8e8b-4aff-8e16-2e4098465398', 'edit-inline-sources-article-lissandra-20260913'),
  ('doc-a-077fa2c7-41b2-4620-ae2c-185b81fe54d1', 'edit-inline-sources-article-malzahar-20260913'),
  ('doc-a-5bd97d30-0917-495d-b049-bb438235d231', 'edit-inline-sources-article-mel-20260913'),
  ('doc-a-bed696ba-2310-4820-9cf4-ee5c34ae55a2', 'edit-inline-sources-article-veigar-20260913'),
  ('doc-a-80df8739-7bdf-428b-9789-58571366b198', 'edit-inline-sources-article-vex-20260913'),
  ('doc-a-f1404d69-50a3-4c61-9452-d31dd292564a', 'edit-inline-sources-article-viktor-20260913'),
  ('doc-a-908b088a-d7ea-4d7a-bdc5-3c47ada13b5e', 'edit-inline-sources-article-syndra-20260913'),
  ('doc-a-2df64efd-93e1-4656-bddf-8f305f5df8cc', 'edit-inline-sources-article-ahri-20260913'),
  ('doc-a-f1945b6e-3dee-45ee-b457-00c5384aa05c', 'edit-inline-sources-article-aurelionsol-20260913'),
  ('doc-a-5fc0f788-ca1b-4024-86b9-1d459c56490c', 'edit-inline-sources-article-azir-20260913'),
  ('doc-ai-champion-akali-20260911', 'edit-inline-sources-article-akali-20260913'),
  ('doc-a-65d0b98e-aca6-4035-a3bf-d7fd4faa29cf', 'edit-inline-sources-article-annie-20260913'),
  ('doc-a-7f7d1f23-aefd-455d-995a-3d8fbb3539e5', 'edit-inline-sources-article-anivia-20260913'),
  ('doc-a-2899fe45-3c51-4058-9487-26242464d8de', 'edit-inline-sources-article-aurora-20260913'),
  ('doc-a-0d4c7c07-b905-472f-9b4a-b4a94f0f08cb', 'edit-inline-sources-article-orianna-20260913'),
  ('doc-ai-champion-zed-20260911', 'edit-inline-sources-article-zed-20260913'),
  ('doc-a-d804656d-2129-4e55-b28c-658608efa1fd', 'edit-inline-sources-article-xerath-20260913'),
  ('doc-a-cc54cdde-cfcc-479d-9737-2b26f152b569', 'edit-inline-sources-article-zoe-20260913'),
  ('doc-a-0e9226b2-5491-42cb-b678-0d9219f200c4', 'edit-inline-sources-article-cassiopeia-20260913'),
  ('doc-ai-champion-katarina-20260911', 'edit-inline-sources-article-katarina-20260913'),
  ('doc-a-3425cc0c-770c-44fb-9e75-434bc8f27357', 'edit-inline-sources-article-qiyana-20260913'),
  ('doc-a-0b3be62a-0b48-461d-8bef-96e5057ae96d', 'edit-inline-sources-article-talon-20260913'),
  ('doc-a-6ac51090-21cb-4daf-a0c6-66e8482021c5', 'edit-inline-sources-article-taliyah-20260913'),
  ('doc-a-cfa6e563-1fcd-4407-b0f7-bf98b68fa239', 'edit-inline-sources-article-twistedfate-20260913'),
  ('doc-ai-champion-fizz-20260911', 'edit-inline-sources-article-fizz-20260913'),
  ('doc-a-12ad2a64-3bb7-489e-8ccb-459432858e90', 'edit-inline-sources-article-hwei-20260913'),
  ('doc-ai-champion-sylas-20260912', 'edit-inline-sources-article-sylas-20260913'),
  ('doc-ai-champion-yone-20260912', 'edit-inline-sources-article-yone-20260913'),
  ('doc-ai-champion-yasuo-20260912', 'edit-inline-sources-article-yasuo-20260913'),
  ('doc-ai-champion-galio-20260912', 'edit-inline-sources-article-galio-20260913'),
  ('doc-ai-champion-ekko-20260912', 'edit-inline-sources-article-ekko-20260913'),
  ('doc-ai-champion-diana-20260912', 'edit-inline-sources-article-diana-20260913'),
  ('doc-ai-champion-irelia-20260912', 'edit-inline-sources-article-irelia-20260913'),
  ('doc-ai-champion-corki-20260912', 'edit-inline-sources-article-corki-20260913'),
  ('doc-ai-champion-jayce-20260912', 'edit-inline-sources-article-jayce-20260913'),
  ('doc-ai-champion-smolder-20260912', 'edit-inline-sources-article-smolder-20260913'),
  ('doc-ai-champion-tristana-20260912', 'edit-inline-sources-article-tristana-20260913'),
  ('doc-ai-champion-akshan-20260912', 'edit-inline-sources-article-akshan-20260913'),
  ('doc-ai-champion-locke-20260912', 'edit-inline-sources-article-locke-20260913'),
  ('doc-top-tank-champion-ornn-20260913', 'edit-inline-sources-article-ornn-20260913'),
  ('doc-top-tank-champion-malphite-20260913', 'edit-inline-sources-article-malphite-20260913'),
  ('doc-top-tank-champion-shen-20260913', 'edit-inline-sources-article-shen-20260913'),
  ('doc-top-tank-champion-ksante-20260913', 'edit-inline-sources-article-ksante-20260913'),
  ('doc-ai-champion-sion-20260912', 'edit-inline-sources-article-sion-20260913'),
  ('doc-top-tank-champion-chogath-20260913', 'edit-inline-sources-article-chogath-20260913'),
  ('doc-top-tank-champion-poppy-20260913', 'edit-inline-sources-article-poppy-20260913'),
  ('doc-top-tank-champion-maokai-20260913', 'edit-inline-sources-article-maokai-20260913'),
  ('doc-top-tank-champion-nasus-20260913', 'edit-inline-sources-article-nasus-20260913'),
  ('doc-top-tank-champion-zac-20260913', 'edit-inline-sources-article-zac-20260913'),
  ('doc-top-tank-champion-tahmkench-20260913', 'edit-inline-sources-article-tahmkench-20260913'),
  ('doc-top-tank-champion-drmundo-20260913', 'edit-inline-sources-article-drmundo-20260913'),
  ('doc-c-qiyana', 'edit-inline-sources-matchup-qiyana-20260913'),
  ('doc-c-galio', 'edit-inline-sources-matchup-galio-20260913'),
  ('doc-c-ekko', 'edit-inline-sources-matchup-ekko-20260913'),
  ('doc-c-diana', 'edit-inline-sources-matchup-diana-20260913'),
  ('doc-c-irelia', 'edit-inline-sources-matchup-irelia-20260913'),
  ('doc-c-sion', 'edit-inline-sources-matchup-sion-20260913'),
  ('doc-c-corki', 'edit-inline-sources-matchup-corki-20260913'),
  ('doc-c-jayce', 'edit-inline-sources-matchup-jayce-20260913'),
  ('doc-c-tristana', 'edit-inline-sources-matchup-tristana-20260913'),
  ('doc-c-malzahar', 'edit-inline-sources-matchup-malzahar-20260913'),
  ('doc-c-viktor', 'edit-inline-sources-matchup-viktor-20260913'),
  ('doc-c-syndra', 'edit-inline-sources-matchup-syndra-20260913'),
  ('doc-c-xerath', 'edit-inline-sources-matchup-xerath-20260913'),
  ('doc-c-twistedfate', 'edit-inline-sources-matchup-twistedfate-20260913'),
  ('doc-c-lux', 'edit-inline-sources-matchup-lux-20260913'),
  ('doc-c-orianna', 'edit-inline-sources-matchup-orianna-20260913'),
  ('doc-c-anivia', 'edit-inline-sources-matchup-anivia-20260913'),
  ('doc-c-zoe', 'edit-inline-sources-matchup-zoe-20260913'),
  ('doc-c-veigar', 'edit-inline-sources-matchup-veigar-20260913'),
  ('doc-c-vex', 'edit-inline-sources-matchup-vex-20260913'),
  ('doc-c-cassiopeia', 'edit-inline-sources-matchup-cassiopeia-20260913'),
  ('doc-c-taliyah', 'edit-inline-sources-matchup-taliyah-20260913'),
  ('doc-c-annie', 'edit-inline-sources-matchup-annie-20260913'),
  ('doc-c-aurelionsol', 'edit-inline-sources-matchup-aurelionsol-20260913'),
  ('doc-c-lissandra', 'edit-inline-sources-matchup-lissandra-20260913'),
  ('doc-c-azir', 'edit-inline-sources-matchup-azir-20260913'),
  ('doc-c-ornn', 'edit-inline-sources-matchup-ornn-20260913'),
  ('doc-c-malphite', 'edit-inline-sources-matchup-malphite-20260913'),
  ('doc-c-shen', 'edit-inline-sources-matchup-shen-20260913'),
  ('doc-c-ksante', 'edit-inline-sources-matchup-ksante-20260913'),
  ('doc-c-chogath', 'edit-inline-sources-matchup-chogath-20260913'),
  ('doc-c-poppy', 'edit-inline-sources-matchup-poppy-20260913'),
  ('doc-c-maokai', 'edit-inline-sources-matchup-maokai-20260913'),
  ('doc-c-nasus', 'edit-inline-sources-matchup-nasus-20260913'),
  ('doc-c-zac', 'edit-inline-sources-matchup-zac-20260913'),
  ('doc-c-tahmkench', 'edit-inline-sources-matchup-tahmkench-20260913'),
  ('doc-c-drmundo', 'edit-inline-sources-matchup-drmundo-20260913'))
SELECT 'applied' AS result, COUNT(*) AS document_count FROM targets t
WHERE EXISTS (SELECT 1 FROM wiki_edits e WHERE e.id = t.edit_id);
WITH targets(doc_id, edit_id) AS (VALUES
  ('doc-a-23010eca-0af1-4ee2-a3a2-ac98f90fa9f9', 'edit-inline-sources-article-naafiri-20260913'),
  ('doc-a-67086497-75b0-4808-a001-3dddfeacc105', 'edit-inline-sources-article-ryze-20260913'),
  ('doc-a-27bd0e78-66b0-4a9b-846a-32b18365e3ef', 'edit-inline-sources-article-lux-20260913'),
  ('doc-ai-champion-leblanc-20260911', 'edit-inline-sources-article-leblanc-20260913'),
  ('doc-a-132c9ef9-8e8b-4aff-8e16-2e4098465398', 'edit-inline-sources-article-lissandra-20260913'),
  ('doc-a-077fa2c7-41b2-4620-ae2c-185b81fe54d1', 'edit-inline-sources-article-malzahar-20260913'),
  ('doc-a-5bd97d30-0917-495d-b049-bb438235d231', 'edit-inline-sources-article-mel-20260913'),
  ('doc-a-bed696ba-2310-4820-9cf4-ee5c34ae55a2', 'edit-inline-sources-article-veigar-20260913'),
  ('doc-a-80df8739-7bdf-428b-9789-58571366b198', 'edit-inline-sources-article-vex-20260913'),
  ('doc-a-f1404d69-50a3-4c61-9452-d31dd292564a', 'edit-inline-sources-article-viktor-20260913'),
  ('doc-a-908b088a-d7ea-4d7a-bdc5-3c47ada13b5e', 'edit-inline-sources-article-syndra-20260913'),
  ('doc-a-2df64efd-93e1-4656-bddf-8f305f5df8cc', 'edit-inline-sources-article-ahri-20260913'),
  ('doc-a-f1945b6e-3dee-45ee-b457-00c5384aa05c', 'edit-inline-sources-article-aurelionsol-20260913'),
  ('doc-a-5fc0f788-ca1b-4024-86b9-1d459c56490c', 'edit-inline-sources-article-azir-20260913'),
  ('doc-ai-champion-akali-20260911', 'edit-inline-sources-article-akali-20260913'),
  ('doc-a-65d0b98e-aca6-4035-a3bf-d7fd4faa29cf', 'edit-inline-sources-article-annie-20260913'),
  ('doc-a-7f7d1f23-aefd-455d-995a-3d8fbb3539e5', 'edit-inline-sources-article-anivia-20260913'),
  ('doc-a-2899fe45-3c51-4058-9487-26242464d8de', 'edit-inline-sources-article-aurora-20260913'),
  ('doc-a-0d4c7c07-b905-472f-9b4a-b4a94f0f08cb', 'edit-inline-sources-article-orianna-20260913'),
  ('doc-ai-champion-zed-20260911', 'edit-inline-sources-article-zed-20260913'),
  ('doc-a-d804656d-2129-4e55-b28c-658608efa1fd', 'edit-inline-sources-article-xerath-20260913'),
  ('doc-a-cc54cdde-cfcc-479d-9737-2b26f152b569', 'edit-inline-sources-article-zoe-20260913'),
  ('doc-a-0e9226b2-5491-42cb-b678-0d9219f200c4', 'edit-inline-sources-article-cassiopeia-20260913'),
  ('doc-ai-champion-katarina-20260911', 'edit-inline-sources-article-katarina-20260913'),
  ('doc-a-3425cc0c-770c-44fb-9e75-434bc8f27357', 'edit-inline-sources-article-qiyana-20260913'),
  ('doc-a-0b3be62a-0b48-461d-8bef-96e5057ae96d', 'edit-inline-sources-article-talon-20260913'),
  ('doc-a-6ac51090-21cb-4daf-a0c6-66e8482021c5', 'edit-inline-sources-article-taliyah-20260913'),
  ('doc-a-cfa6e563-1fcd-4407-b0f7-bf98b68fa239', 'edit-inline-sources-article-twistedfate-20260913'),
  ('doc-ai-champion-fizz-20260911', 'edit-inline-sources-article-fizz-20260913'),
  ('doc-a-12ad2a64-3bb7-489e-8ccb-459432858e90', 'edit-inline-sources-article-hwei-20260913'),
  ('doc-ai-champion-sylas-20260912', 'edit-inline-sources-article-sylas-20260913'),
  ('doc-ai-champion-yone-20260912', 'edit-inline-sources-article-yone-20260913'),
  ('doc-ai-champion-yasuo-20260912', 'edit-inline-sources-article-yasuo-20260913'),
  ('doc-ai-champion-galio-20260912', 'edit-inline-sources-article-galio-20260913'),
  ('doc-ai-champion-ekko-20260912', 'edit-inline-sources-article-ekko-20260913'),
  ('doc-ai-champion-diana-20260912', 'edit-inline-sources-article-diana-20260913'),
  ('doc-ai-champion-irelia-20260912', 'edit-inline-sources-article-irelia-20260913'),
  ('doc-ai-champion-corki-20260912', 'edit-inline-sources-article-corki-20260913'),
  ('doc-ai-champion-jayce-20260912', 'edit-inline-sources-article-jayce-20260913'),
  ('doc-ai-champion-smolder-20260912', 'edit-inline-sources-article-smolder-20260913'),
  ('doc-ai-champion-tristana-20260912', 'edit-inline-sources-article-tristana-20260913'),
  ('doc-ai-champion-akshan-20260912', 'edit-inline-sources-article-akshan-20260913'),
  ('doc-ai-champion-locke-20260912', 'edit-inline-sources-article-locke-20260913'),
  ('doc-top-tank-champion-ornn-20260913', 'edit-inline-sources-article-ornn-20260913'),
  ('doc-top-tank-champion-malphite-20260913', 'edit-inline-sources-article-malphite-20260913'),
  ('doc-top-tank-champion-shen-20260913', 'edit-inline-sources-article-shen-20260913'),
  ('doc-top-tank-champion-ksante-20260913', 'edit-inline-sources-article-ksante-20260913'),
  ('doc-ai-champion-sion-20260912', 'edit-inline-sources-article-sion-20260913'),
  ('doc-top-tank-champion-chogath-20260913', 'edit-inline-sources-article-chogath-20260913'),
  ('doc-top-tank-champion-poppy-20260913', 'edit-inline-sources-article-poppy-20260913'),
  ('doc-top-tank-champion-maokai-20260913', 'edit-inline-sources-article-maokai-20260913'),
  ('doc-top-tank-champion-nasus-20260913', 'edit-inline-sources-article-nasus-20260913'),
  ('doc-top-tank-champion-zac-20260913', 'edit-inline-sources-article-zac-20260913'),
  ('doc-top-tank-champion-tahmkench-20260913', 'edit-inline-sources-article-tahmkench-20260913'),
  ('doc-top-tank-champion-drmundo-20260913', 'edit-inline-sources-article-drmundo-20260913'),
  ('doc-c-qiyana', 'edit-inline-sources-matchup-qiyana-20260913'),
  ('doc-c-galio', 'edit-inline-sources-matchup-galio-20260913'),
  ('doc-c-ekko', 'edit-inline-sources-matchup-ekko-20260913'),
  ('doc-c-diana', 'edit-inline-sources-matchup-diana-20260913'),
  ('doc-c-irelia', 'edit-inline-sources-matchup-irelia-20260913'),
  ('doc-c-sion', 'edit-inline-sources-matchup-sion-20260913'),
  ('doc-c-corki', 'edit-inline-sources-matchup-corki-20260913'),
  ('doc-c-jayce', 'edit-inline-sources-matchup-jayce-20260913'),
  ('doc-c-tristana', 'edit-inline-sources-matchup-tristana-20260913'),
  ('doc-c-malzahar', 'edit-inline-sources-matchup-malzahar-20260913'),
  ('doc-c-viktor', 'edit-inline-sources-matchup-viktor-20260913'),
  ('doc-c-syndra', 'edit-inline-sources-matchup-syndra-20260913'),
  ('doc-c-xerath', 'edit-inline-sources-matchup-xerath-20260913'),
  ('doc-c-twistedfate', 'edit-inline-sources-matchup-twistedfate-20260913'),
  ('doc-c-lux', 'edit-inline-sources-matchup-lux-20260913'),
  ('doc-c-orianna', 'edit-inline-sources-matchup-orianna-20260913'),
  ('doc-c-anivia', 'edit-inline-sources-matchup-anivia-20260913'),
  ('doc-c-zoe', 'edit-inline-sources-matchup-zoe-20260913'),
  ('doc-c-veigar', 'edit-inline-sources-matchup-veigar-20260913'),
  ('doc-c-vex', 'edit-inline-sources-matchup-vex-20260913'),
  ('doc-c-cassiopeia', 'edit-inline-sources-matchup-cassiopeia-20260913'),
  ('doc-c-taliyah', 'edit-inline-sources-matchup-taliyah-20260913'),
  ('doc-c-annie', 'edit-inline-sources-matchup-annie-20260913'),
  ('doc-c-aurelionsol', 'edit-inline-sources-matchup-aurelionsol-20260913'),
  ('doc-c-lissandra', 'edit-inline-sources-matchup-lissandra-20260913'),
  ('doc-c-azir', 'edit-inline-sources-matchup-azir-20260913'),
  ('doc-c-ornn', 'edit-inline-sources-matchup-ornn-20260913'),
  ('doc-c-malphite', 'edit-inline-sources-matchup-malphite-20260913'),
  ('doc-c-shen', 'edit-inline-sources-matchup-shen-20260913'),
  ('doc-c-ksante', 'edit-inline-sources-matchup-ksante-20260913'),
  ('doc-c-chogath', 'edit-inline-sources-matchup-chogath-20260913'),
  ('doc-c-poppy', 'edit-inline-sources-matchup-poppy-20260913'),
  ('doc-c-maokai', 'edit-inline-sources-matchup-maokai-20260913'),
  ('doc-c-nasus', 'edit-inline-sources-matchup-nasus-20260913'),
  ('doc-c-zac', 'edit-inline-sources-matchup-zac-20260913'),
  ('doc-c-tahmkench', 'edit-inline-sources-matchup-tahmkench-20260913'),
  ('doc-c-drmundo', 'edit-inline-sources-matchup-drmundo-20260913'))
SELECT 'skipped' AS result, t.doc_id, d.kind, d.revision, d.updated_by
FROM targets t LEFT JOIN wiki_docs d ON d.id = t.doc_id
WHERE NOT EXISTS (SELECT 1 FROM wiki_edits e WHERE e.id = t.edit_id) ORDER BY t.doc_id;
