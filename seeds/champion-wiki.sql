-- scripts/seed-champion-wiki.ts가 생성. 원고는 seeds/champion-wiki/*.md.
-- 운영자의 작성 요청에 따른 시스템 이관. 새 문서와 최초 편집 이력만 추가한다.
-- 기존 문서·제안·작성자 권한은 변경하지 않는다. 시스템 계정이 없으면 FK로 실패한다.
-- 카타리나 (1130자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-katarina-20260913', 'article', '카타리나', '카타리나', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 체력을 막타와 바꾸지 않는다 · 앞순보는 정글 위치와 퇴로를 본 뒤 · Q와 단검은 상대 CS 타이밍에 겹친다

## 체력을 막타와 바꾸지 않는다

**카타리나는 초반에 근접 막타 하나 때문에 원거리 견제를 여러 번 맞으면 다음 웨이브부터 선택지가 사라진다.**[* [3500++/ M1 카타할께공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148158&vtype=pc)] `Q`로 안전하게 먹을 수 없는 CS는 버려도 된다. 포션이 있을 때는 체력이 절반 아래로 떨어질 때까지 아끼지 말고, 교전 직전에는 체력을 먼저 복구한다. 라인이 힘들수록 억지 솔로킬보다 강가나 사이드의 작은 싸움에 먼저 합류할 체력을 남긴다.

## 앞순보는 정글 위치와 퇴로를 본 뒤

**상대 정글이 보이지 않으면 적 챔피언이나 앞쪽 단검으로 먼저 순보하지 않는다.**[* [\[M1\] 간단하게 보는 카타리나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147939)] 진입 전 뒤쪽 아군 미니언과 남은 단검처럼 돌아올 대상을 함께 본다. 상대가 견제 스킬을 미니언에 썼더라도 적 미니언이 많으면 `Q`와 단검 피해만 짧게 넣고 빠진다. 킬이 확실하지 않은데 퇴로까지 써 버리는 긴 교환은 피한다.

## `Q`와 단검은 상대 CS 타이밍에 겹친다

**`Q`를 막타기로만 쓰지 말고 상대가 CS를 먹으러 움직일 때 챔피언을 맞혀 뒤쪽에 단검을 만든다.** 상대가 단검을 피해서 CS를 포기하면 그것으로 이득이다. 상대가 단검 위에 남을 때만 순보로 짧게 들어가고, 멀어졌다면 억지로 따라가지 않는다.

## 로밍은 밀고, 정글과 함께

**먼저 라인을 밀어야 움직일 권리가 생긴다.** 맵을 자주 보되 바텀에서 싸움이 날 것 같다는 이유만으로 바로 내려가지는 않는다. 상대 미드와 정글의 위치, 지나갈 길의 와드, 도착했을 때 교전이 계속될지를 확인한다. 가능하면 아군 정글과 같이 움직이고, 상대가 길을 막고 있는데 혼자 강으로 들어가지 않는다. 라인을 밀지 못한 채 실패한 로밍은 미니언과 체력을 모두 잃는 큰 손해다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-katarina-20260913' OR (kind = 'article' AND title_key = '카타리나'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-katarina-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-katarina-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 체력을 막타와 바꾸지 않는다 · 앞순보는 정글 위치와 퇴로를 본 뒤 · Q와 단검은 상대 CS 타이밍에 겹친다

## 체력을 막타와 바꾸지 않는다

**카타리나는 초반에 근접 막타 하나 때문에 원거리 견제를 여러 번 맞으면 다음 웨이브부터 선택지가 사라진다.**[* [3500++/ M1 카타할께공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148158&vtype=pc)] `Q`로 안전하게 먹을 수 없는 CS는 버려도 된다. 포션이 있을 때는 체력이 절반 아래로 떨어질 때까지 아끼지 말고, 교전 직전에는 체력을 먼저 복구한다. 라인이 힘들수록 억지 솔로킬보다 강가나 사이드의 작은 싸움에 먼저 합류할 체력을 남긴다.

## 앞순보는 정글 위치와 퇴로를 본 뒤

**상대 정글이 보이지 않으면 적 챔피언이나 앞쪽 단검으로 먼저 순보하지 않는다.**[* [\[M1\] 간단하게 보는 카타리나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147939)] 진입 전 뒤쪽 아군 미니언과 남은 단검처럼 돌아올 대상을 함께 본다. 상대가 견제 스킬을 미니언에 썼더라도 적 미니언이 많으면 `Q`와 단검 피해만 짧게 넣고 빠진다. 킬이 확실하지 않은데 퇴로까지 써 버리는 긴 교환은 피한다.

## `Q`와 단검은 상대 CS 타이밍에 겹친다

**`Q`를 막타기로만 쓰지 말고 상대가 CS를 먹으러 움직일 때 챔피언을 맞혀 뒤쪽에 단검을 만든다.** 상대가 단검을 피해서 CS를 포기하면 그것으로 이득이다. 상대가 단검 위에 남을 때만 순보로 짧게 들어가고, 멀어졌다면 억지로 따라가지 않는다.

## 로밍은 밀고, 정글과 함께

**먼저 라인을 밀어야 움직일 권리가 생긴다.** 맵을 자주 보되 바텀에서 싸움이 날 것 같다는 이유만으로 바로 내려가지는 않는다. 상대 미드와 정글의 위치, 지나갈 길의 와드, 도착했을 때 교전이 계속될지를 확인한다. 가능하면 아군 정글과 같이 움직이고, 상대가 길을 막고 있는데 혼자 강으로 들어가지 않는다. 라인을 밀지 못한 채 실패한 로밍은 미니언과 체력을 모두 잃는 큰 손해다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-katarina-20260913');

-- 제드 (1071자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-zed-20260913', 'article', '제드', '제드', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 1~2레벨은 Q로 체력을 지킨다 · 그림자는 견제와 탈출 중 하나다 · 기력까지 있어야 한 콤보다

## 1~2레벨은 `Q`로 체력을 지킨다

**원거리 상대에게 모든 막타를 기본 공격으로 먹으려 하면 그림자를 배우기 전에 체력이 먼저 무너진다.**[* [보이지 않는 검이 가장 무서운 법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=1461841&view=p)] 위험한 CS는 `Q`로 챙기고, 상대가 막타를 치느라 멈추는 순간에만 표창을 겹친다. 미니언을 먼저 맞은 `Q`는 압박이 약해지므로 챔피언과의 직선 사이에 무엇이 있는지도 본다.

## 그림자는 견제와 탈출 중 하나다

**`W`로 그림자를 앞으로 보낸 순간에는 같은 스킬이 도주로에서 빠진다.**[* [내 경험을 토대로 써보는 제드 공략글](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115630&vtype=pc)] 상대 정글이 보이지 않거나 강가 시야가 없으면 그림자 견제 뒤에 한 걸음 물러난다. 그림자가 상대 곁에 있다고 무조건 자리를 바꾸지 말고, 본체와 그림자의 `Q` 각이 모두 열릴 때만 교환한다. 빗나갔다면 추가 진입으로 손해를 만회하려 하지 않는다.

## 기력까지 있어야 한 콤보다

**본체와 그림자가 같은 대상을 맞히면 기력을 되찾지만, 하나만 맞히는 견제를 반복하면 다음 교환이 비게 된다.** 궁극기가 있어도 기력이 부족하면 착지 뒤 이어 갈 공격이 없다. 라인을 지울 때와 상대를 노릴 때 쓸 기력을 구분하고, `W`가 돌아오기 전에는 짧은 `Q` 파밍으로 다음 기회를 기다린다.

## 밀었을 때만 시야 밖으로 나간다

**제드는 라인을 먼저 정리하면 강가 합류와 로밍 두 선택을 상대에게 동시에 보여 줄 수 있다.** 반대로 웨이브를 남겨 두고 사라졌다가 성과 없이 돌아오면 경험치 손해가 크다. 이동 전에는 상대 미드가 따라올 길과 아군 정글 위치를 보고, 혼자 깊이 들어가기보다 정글과 같은 방향으로 움직인다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-zed-20260913' OR (kind = 'article' AND title_key = '제드'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-zed-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-zed-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 1~2레벨은 Q로 체력을 지킨다 · 그림자는 견제와 탈출 중 하나다 · 기력까지 있어야 한 콤보다

## 1~2레벨은 `Q`로 체력을 지킨다

**원거리 상대에게 모든 막타를 기본 공격으로 먹으려 하면 그림자를 배우기 전에 체력이 먼저 무너진다.**[* [보이지 않는 검이 가장 무서운 법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=1461841&view=p)] 위험한 CS는 `Q`로 챙기고, 상대가 막타를 치느라 멈추는 순간에만 표창을 겹친다. 미니언을 먼저 맞은 `Q`는 압박이 약해지므로 챔피언과의 직선 사이에 무엇이 있는지도 본다.

## 그림자는 견제와 탈출 중 하나다

**`W`로 그림자를 앞으로 보낸 순간에는 같은 스킬이 도주로에서 빠진다.**[* [내 경험을 토대로 써보는 제드 공략글](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=115630&vtype=pc)] 상대 정글이 보이지 않거나 강가 시야가 없으면 그림자 견제 뒤에 한 걸음 물러난다. 그림자가 상대 곁에 있다고 무조건 자리를 바꾸지 말고, 본체와 그림자의 `Q` 각이 모두 열릴 때만 교환한다. 빗나갔다면 추가 진입으로 손해를 만회하려 하지 않는다.

## 기력까지 있어야 한 콤보다

**본체와 그림자가 같은 대상을 맞히면 기력을 되찾지만, 하나만 맞히는 견제를 반복하면 다음 교환이 비게 된다.** 궁극기가 있어도 기력이 부족하면 착지 뒤 이어 갈 공격이 없다. 라인을 지울 때와 상대를 노릴 때 쓸 기력을 구분하고, `W`가 돌아오기 전에는 짧은 `Q` 파밍으로 다음 기회를 기다린다.

## 밀었을 때만 시야 밖으로 나간다

**제드는 라인을 먼저 정리하면 강가 합류와 로밍 두 선택을 상대에게 동시에 보여 줄 수 있다.** 반대로 웨이브를 남겨 두고 사라졌다가 성과 없이 돌아오면 경험치 손해가 크다. 이동 전에는 상대 미드가 따라올 길과 아군 정글 위치를 보고, 혼자 깊이 들어가기보다 정글과 같은 방향으로 움직인다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-zed-20260913');

-- 아칼리 (1078자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-akali-20260913', 'article', '아칼리', '아칼리', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 막타보다 체력과 기력을 남긴다 · 장막은 두 번째 체력처럼 아낀다 · E를 맞힌 것과 따라가는 것은 별개다

## 막타보다 체력과 기력을 남긴다

**원거리 상대 앞에서 모든 CS를 기본 공격으로 먹으려 하면 정작 진입할 레벨에 체력이 없다.**[* [\[별길잡이\] 아칼리의 모든 것!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142641)] 위험한 막타는 `Q`로 챙기고, 사거리 끝으로 상대를 맞힌 뒤 패시브 원을 빠져나갈 공간이 있을 때만 교환한다. `Q`를 맞혔다고 계속 붙지 말고 원 밖으로 나갔다가 강화 공격으로 돌아오는 리듬을 만든다.

## 장막은 두 번째 체력처럼 아낀다

**`W`는 몸을 숨기는 동시에 다음 공격에 쓸 기력을 돌려주는 핵심 수단이다.**[* [\[버프\] 마나가 안 닳는 에코!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142976&vtype=pc)] 먼저 장막을 쓰고 억지로 들어가면, 교환 뒤 상대 정글을 만났을 때 버틸 방법이 없다. 장막 안에서도 같은 자리에 머물지 말고 방향을 바꾸며 상대의 광역 스킬을 흘린다. 장막이 빠진 다음 웨이브에는 같은 강도로 싸우지 않는다.

## `E`를 맞힌 것과 따라가는 것은 별개다

**표창곡예가 맞아도 상대가 포탑이나 정글 쪽으로 빠지면 재사용하지 않는다.** `E`2는 강한 추격기지만 돌아오는 버튼은 아니다. 진입 전 상대의 주요 방해 스킬, 적 미니언 수, 장막 유무를 함께 확인한다. 상대가 견제기를 미니언에 썼을 때 짧게 `Q`와 강화 공격만 넣고 빠지는 교환도 충분하다.

## 로밍은 억지 푸시보다 좋은 웨이브에서

**아칼리는 라인을 무조건 빨리 지우기보다 체력과 기력을 보존하며 움직일 파동을 고르는 편이 안전하다.** 웨이브를 상대 포탑에 넣었거나 상대가 귀환한 순간에 강가를 본다. 먼저 사라지겠다고 큰 웨이브를 버리면 실패한 로밍 뒤 성장이 끊긴다. 가능하면 정글과 같은 방향으로 움직여 짧은 교전을 만든다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-akali-20260913' OR (kind = 'article' AND title_key = '아칼리'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-akali-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-akali-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 막타보다 체력과 기력을 남긴다 · 장막은 두 번째 체력처럼 아낀다 · E를 맞힌 것과 따라가는 것은 별개다

## 막타보다 체력과 기력을 남긴다

**원거리 상대 앞에서 모든 CS를 기본 공격으로 먹으려 하면 정작 진입할 레벨에 체력이 없다.**[* [\[별길잡이\] 아칼리의 모든 것!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142641)] 위험한 막타는 `Q`로 챙기고, 사거리 끝으로 상대를 맞힌 뒤 패시브 원을 빠져나갈 공간이 있을 때만 교환한다. `Q`를 맞혔다고 계속 붙지 말고 원 밖으로 나갔다가 강화 공격으로 돌아오는 리듬을 만든다.

## 장막은 두 번째 체력처럼 아낀다

**`W`는 몸을 숨기는 동시에 다음 공격에 쓸 기력을 돌려주는 핵심 수단이다.**[* [\[버프\] 마나가 안 닳는 에코!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142976&vtype=pc)] 먼저 장막을 쓰고 억지로 들어가면, 교환 뒤 상대 정글을 만났을 때 버틸 방법이 없다. 장막 안에서도 같은 자리에 머물지 말고 방향을 바꾸며 상대의 광역 스킬을 흘린다. 장막이 빠진 다음 웨이브에는 같은 강도로 싸우지 않는다.

## `E`를 맞힌 것과 따라가는 것은 별개다

**표창곡예가 맞아도 상대가 포탑이나 정글 쪽으로 빠지면 재사용하지 않는다.** `E`2는 강한 추격기지만 돌아오는 버튼은 아니다. 진입 전 상대의 주요 방해 스킬, 적 미니언 수, 장막 유무를 함께 확인한다. 상대가 견제기를 미니언에 썼을 때 짧게 `Q`와 강화 공격만 넣고 빠지는 교환도 충분하다.

## 로밍은 억지 푸시보다 좋은 웨이브에서

**아칼리는 라인을 무조건 빨리 지우기보다 체력과 기력을 보존하며 움직일 파동을 고르는 편이 안전하다.** 웨이브를 상대 포탑에 넣었거나 상대가 귀환한 순간에 강가를 본다. 먼저 사라지겠다고 큰 웨이브를 버리면 실패한 로밍 뒤 성장이 끊긴다. 가능하면 정글과 같은 방향으로 움직여 짧은 교전을 만든다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-akali-20260913');

-- 피즈 (1057자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-fizz-20260913', 'article', '피즈', '피즈', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 첫 웨이브는 CS보다 체력이다 · E는 먼저 들어가는 버튼이 아니다 · Q를 쓰기 전에 도착 지점을 본다

## 첫 웨이브는 CS보다 체력이다

**원거리 상대에게 막타마다 맞아 주면 스킬이 갖춰지는 3레벨에 싸울 체력이 남지 않는다.**[* [픽창 때 보면 좋을 꿀팁가득 피즈 기초 교본](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=121553)] 초반 몇 개의 CS는 내주더라도 경험치를 챙기며 라인을 받는다. 상대가 주요 견제기를 미니언에 쓴 순간에만 앞으로 나가고, 적 미니언이 많으면 긴 평타 교환을 피한다.

## `E`는 먼저 들어가는 버튼이 아니다

**재간둥이는 피해와 라인 정리뿐 아니라 상대 핵심 스킬을 흘리고 갱에서 빠져나오는 수단이다.**[* [라인전·한타 최강 극딜 피즈](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109904&vtype=pc)] 상대가 스킬을 쓰기도 전에 `E`로 진입하면 가장 중요한 안전장치를 먼저 버린다. 정글 위치가 안 보일 때는 특히 아끼고, 교환에서는 상대의 반격을 피한 뒤 착지 피해까지 넣는 순서를 노린다.

## `Q`를 쓰기 전에 도착 지점을 본다

**성게 찌르기는 대상을 통과하므로, 들어가기 전 상대 뒤에 어디로 멈출지 확인한다.** 도착 지점이 큰 적 웨이브나 포탑 쪽이면 짧은 교환이 퇴로 없는 싸움이 된다. `W` 강화 공격을 섞되 한 대를 더 치겠다고 `E`까지 공격에 쓰지 않는다. 이미 체력 이득을 봤다면 안전하게 빠지는 것으로 교환을 끝낸다.

## 로밍은 `E`로 웨이브를 민 뒤가 아니라 돌아온 뒤

**`E`로 라인을 정리하면 빠르게 움직일 수 있지만, 곧바로 강가에서 적을 만나면 피할 도구가 없다.** 웨이브를 넣은 뒤 `E`가 돌아올 시간과 상대 정글 위치를 함께 본다. 궁극기가 있으면 아군 정글과 같은 방향으로 움직여 퇴로가 좁은 적을 노리고, 궁이 빗나가면 계획대로 억지 진입하지 않는다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-fizz-20260913' OR (kind = 'article' AND title_key = '피즈'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-fizz-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-fizz-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 첫 웨이브는 CS보다 체력이다 · E는 먼저 들어가는 버튼이 아니다 · Q를 쓰기 전에 도착 지점을 본다

## 첫 웨이브는 CS보다 체력이다

**원거리 상대에게 막타마다 맞아 주면 스킬이 갖춰지는 3레벨에 싸울 체력이 남지 않는다.**[* [픽창 때 보면 좋을 꿀팁가득 피즈 기초 교본](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=121553)] 초반 몇 개의 CS는 내주더라도 경험치를 챙기며 라인을 받는다. 상대가 주요 견제기를 미니언에 쓴 순간에만 앞으로 나가고, 적 미니언이 많으면 긴 평타 교환을 피한다.

## `E`는 먼저 들어가는 버튼이 아니다

**재간둥이는 피해와 라인 정리뿐 아니라 상대 핵심 스킬을 흘리고 갱에서 빠져나오는 수단이다.**[* [라인전·한타 최강 극딜 피즈](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109904&vtype=pc)] 상대가 스킬을 쓰기도 전에 `E`로 진입하면 가장 중요한 안전장치를 먼저 버린다. 정글 위치가 안 보일 때는 특히 아끼고, 교환에서는 상대의 반격을 피한 뒤 착지 피해까지 넣는 순서를 노린다.

## `Q`를 쓰기 전에 도착 지점을 본다

**성게 찌르기는 대상을 통과하므로, 들어가기 전 상대 뒤에 어디로 멈출지 확인한다.** 도착 지점이 큰 적 웨이브나 포탑 쪽이면 짧은 교환이 퇴로 없는 싸움이 된다. `W` 강화 공격을 섞되 한 대를 더 치겠다고 `E`까지 공격에 쓰지 않는다. 이미 체력 이득을 봤다면 안전하게 빠지는 것으로 교환을 끝낸다.

## 로밍은 `E`로 웨이브를 민 뒤가 아니라 돌아온 뒤

**`E`로 라인을 정리하면 빠르게 움직일 수 있지만, 곧바로 강가에서 적을 만나면 피할 도구가 없다.** 웨이브를 넣은 뒤 `E`가 돌아올 시간과 상대 정글 위치를 함께 본다. 궁극기가 있으면 아군 정글과 같은 방향으로 움직여 퇴로가 좁은 적을 노리고, 궁이 빗나가면 계획대로 억지 진입하지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-fizz-20260913');

-- 르블랑 (1062자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-leblanc-20260913', 'article', '르블랑', '르블랑', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 평타와 앞무빙도 압박이다 · W는 들어간 자리보다 돌아갈 자리를 본다 · 사슬은 옆 각도와 정글이 만든다

## 평타와 앞무빙도 압박이다

**르블랑은 콤보를 쓸 때만 강한 것이 아니다.**[* [다5 르블랑 매니아 홍르입니다!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141589&vtype=pc)] 상대가 막타를 치는 순간 앞으로 걸어가 기본 공격과 `Q`를 섞으면, `W`를 실제로 쓰지 않아도 상대 움직임을 줄일 수 있다. 매번 `W`까지 눌러 마나와 퇴로를 함께 쓰지 말고, 상대가 물러난다면 그 공간으로 먼저 웨이브 주도권을 챙긴다.

## `W`는 들어간 자리보다 돌아갈 자리를 본다

**왜곡을 쓰기 전에 출발 지점이 안전한지 확인한다.**[* [르블랑의 모든것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112713&vtype=pc)] 상대 정글이 그 자리를 덮거나 상대가 스킬을 깔아 두면 복귀 버튼이 있어도 퇴로가 아니다. 상대와 미니언을 함께 맞히면 교환과 푸시를 동시에 얻지만 라인이 원치 않게 밀릴 수 있다. 돌아갈지 걸어서 빠질지도 매번 새로 판단한다.

## 사슬은 옆 각도와 정글이 만든다

**`E`는 미니언에 막히므로 정면에서 억지로 던지기보다 상대가 막타를 먹는 순간 옆으로 각을 바꾼다.** 상대 이동기가 빠졌다면 아군 정글을 부르고, 먼저 사슬을 맞혀 갱 호응을 만든다. 연결을 유지하겠다고 적 정글 쪽까지 따라가지 말고, 속박 전에 위험해지면 짧은 피해만 얻고 빠진다.

## 로밍 전에는 양쪽 정글부터 본다

**르블랑은 먼저 움직이면 사이드에 큰 압박을 주지만, 라인전이 강한 만큼 상대 정글의 집중 대상도 되기 쉽다.** `W`로 웨이브를 넣은 뒤 아군과 적 정글 위치, 강가 시야를 확인한다. 혼자 깊이 들어가기보다 정글과 함께 적 정글 입구나 사이드를 압박하고, 웨이브를 끝까지 못 밀었다면 무리한 로밍 대신 라인을 당겨 갱 각을 만든다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-leblanc-20260913' OR (kind = 'article' AND title_key = '르블랑'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-leblanc-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-leblanc-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 평타와 앞무빙도 압박이다 · W는 들어간 자리보다 돌아갈 자리를 본다 · 사슬은 옆 각도와 정글이 만든다

## 평타와 앞무빙도 압박이다

**르블랑은 콤보를 쓸 때만 강한 것이 아니다.**[* [다5 르블랑 매니아 홍르입니다!](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141589&vtype=pc)] 상대가 막타를 치는 순간 앞으로 걸어가 기본 공격과 `Q`를 섞으면, `W`를 실제로 쓰지 않아도 상대 움직임을 줄일 수 있다. 매번 `W`까지 눌러 마나와 퇴로를 함께 쓰지 말고, 상대가 물러난다면 그 공간으로 먼저 웨이브 주도권을 챙긴다.

## `W`는 들어간 자리보다 돌아갈 자리를 본다

**왜곡을 쓰기 전에 출발 지점이 안전한지 확인한다.**[* [르블랑의 모든것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112713&vtype=pc)] 상대 정글이 그 자리를 덮거나 상대가 스킬을 깔아 두면 복귀 버튼이 있어도 퇴로가 아니다. 상대와 미니언을 함께 맞히면 교환과 푸시를 동시에 얻지만 라인이 원치 않게 밀릴 수 있다. 돌아갈지 걸어서 빠질지도 매번 새로 판단한다.

## 사슬은 옆 각도와 정글이 만든다

**`E`는 미니언에 막히므로 정면에서 억지로 던지기보다 상대가 막타를 먹는 순간 옆으로 각을 바꾼다.** 상대 이동기가 빠졌다면 아군 정글을 부르고, 먼저 사슬을 맞혀 갱 호응을 만든다. 연결을 유지하겠다고 적 정글 쪽까지 따라가지 말고, 속박 전에 위험해지면 짧은 피해만 얻고 빠진다.

## 로밍 전에는 양쪽 정글부터 본다

**르블랑은 먼저 움직이면 사이드에 큰 압박을 주지만, 라인전이 강한 만큼 상대 정글의 집중 대상도 되기 쉽다.** `W`로 웨이브를 넣은 뒤 아군과 적 정글 위치, 강가 시야를 확인한다. 혼자 깊이 들어가기보다 정글과 함께 적 정글 입구나 사이드를 압박하고, 웨이브를 끝까지 못 밀었다면 무리한 로밍 대신 라인을 당겨 갱 각을 만든다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-leblanc-20260913');

-- 나피리 (1104자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-naafiri-20260913', 'article', '나피리', '나피리', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — Q 한 번보다 두 번째 적중을 설계한다 · 무리는 공짜 피해가 아니라 라인 자원이다 · 들어갈 때는 상대의 반격부터 뺀다

## `Q` 한 번보다 두 번째 적중을 설계한다

**다르킨 단검의 첫 타는 출혈을 만들고, 두 번째 타가 같은 대상을 맞혀야 추가 피해와 회복을 얻는다.**[* [에메랄드가 쓰는 개쉬운 베이가 승리법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148095&vtype=pc)] 첫 `Q`가 빗나갔다면 두 번째까지 급하게 던져 마나를 비우지 말고 막타나 다음 압박에 쓴다. 상대가 CS를 먹으러 멈추는 순간 첫 단검을 맞히고, 퇴로를 읽어 두 번째 방향을 조정한다.

## 무리는 공짜 피해가 아니라 라인 자원이다

**무리는 스킬을 맞힌 대상을 따라가 견제를 보태지만 광역 공격과 근접 기본 공격에 정리될 수 있다.**[* [4년 연속 마스터 카타리나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148155&view=a)] 상대의 범위 스킬이 남아 있는데 무리부터 웨이브 안으로 보내면 다음 교환이 약해진다. 적출(`E`)은 나피리가 이동하면서 흩어진 무리를 다시 불러 회복시키므로, 교환을 끝내고 무리를 보존하는 용도로도 쓴다.

## 들어갈 때는 상대의 반격부터 뺀다

**나피리의 추격은 직선적이라 상대가 준비한 방해 스킬을 정면으로 받기 쉽다.** `Q`로 먼저 체력을 깎고 이동기나 핵심 CC가 빠진 뒤 진입한다. 상대 체력이 낮아도 적 정글이 안 보이거나 큰 적 웨이브가 남았다면 한 번 더 기다린다. 진입을 시작한 뒤에는 방향을 바꾸기 어려우므로, 퇴로와 아군 위치를 먼저 확인한다.

## 빠른 푸시는 로밍 성공률과 함께 본다

**나피리는 `Q`와 무리로 라인을 밀고 먼저 움직이기 좋지만, 밀었다는 이유만으로 매번 사이드로 달리면 동선이 읽힌다.** 상대 미드와 정글 위치, 강가 시야, 도착할 때 교전이 계속될지를 확인한다. 확실한 로밍이 아니면 시야에서 잠깐 사라져 압박만 주고 미드로 돌아와 다음 웨이브를 챙긴다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-naafiri-20260913' OR (kind = 'article' AND title_key = '나피리'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-naafiri-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-naafiri-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q 한 번보다 두 번째 적중을 설계한다 · 무리는 공짜 피해가 아니라 라인 자원이다 · 들어갈 때는 상대의 반격부터 뺀다

## `Q` 한 번보다 두 번째 적중을 설계한다

**다르킨 단검의 첫 타는 출혈을 만들고, 두 번째 타가 같은 대상을 맞혀야 추가 피해와 회복을 얻는다.**[* [에메랄드가 쓰는 개쉬운 베이가 승리법](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148095&vtype=pc)] 첫 `Q`가 빗나갔다면 두 번째까지 급하게 던져 마나를 비우지 말고 막타나 다음 압박에 쓴다. 상대가 CS를 먹으러 멈추는 순간 첫 단검을 맞히고, 퇴로를 읽어 두 번째 방향을 조정한다.

## 무리는 공짜 피해가 아니라 라인 자원이다

**무리는 스킬을 맞힌 대상을 따라가 견제를 보태지만 광역 공격과 근접 기본 공격에 정리될 수 있다.**[* [4년 연속 마스터 카타리나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148155&view=a)] 상대의 범위 스킬이 남아 있는데 무리부터 웨이브 안으로 보내면 다음 교환이 약해진다. 적출(`E`)은 나피리가 이동하면서 흩어진 무리를 다시 불러 회복시키므로, 교환을 끝내고 무리를 보존하는 용도로도 쓴다.

## 들어갈 때는 상대의 반격부터 뺀다

**나피리의 추격은 직선적이라 상대가 준비한 방해 스킬을 정면으로 받기 쉽다.** `Q`로 먼저 체력을 깎고 이동기나 핵심 CC가 빠진 뒤 진입한다. 상대 체력이 낮아도 적 정글이 안 보이거나 큰 적 웨이브가 남았다면 한 번 더 기다린다. 진입을 시작한 뒤에는 방향을 바꾸기 어려우므로, 퇴로와 아군 위치를 먼저 확인한다.

## 빠른 푸시는 로밍 성공률과 함께 본다

**나피리는 `Q`와 무리로 라인을 밀고 먼저 움직이기 좋지만, 밀었다는 이유만으로 매번 사이드로 달리면 동선이 읽힌다.** 상대 미드와 정글 위치, 강가 시야, 도착할 때 교전이 계속될지를 확인한다. 확실한 로밍이 아니면 시야에서 잠깐 사라져 압박만 주고 미드로 돌아와 다음 웨이브를 챙긴다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-naafiri-20260913');

-- 탈론 (1085자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-talon-20260913', 'article', '탈론', '탈론', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 갈퀴손은 돌아오는 칼날까지 본다 · Q의 거리는 진입 위험을 바꾼다 · 패시브 한 스택에 목숨 걸지 않는다

## 갈퀴손은 돌아오는 칼날까지 본다

**`W`는 나갈 때보다 돌아올 때까지 맞아야 다음 교환이 열린다.**[* [\[D1\] 영감 탈론과 마법 탈론의 장단점](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141475&vtype=pc)] 상대가 막타를 치러 멈추는 순간 던지고, 옆으로 빠질 길을 미리 막는다. 첫 타만 맞았는데 `Q`로 곧장 들어가면 상대는 복귀 칼날을 피하면서 반격할 수 있다. 두 번째 타가 빗나갔다면 패시브를 억지로 완성하려 하지 않는다.

## `Q`의 거리는 진입 위험을 바꾼다

**가까운 거리의 `Q`는 강하지만, 먼 거리에서 쓰면 탈론이 눈에 보이게 상대 쪽으로 이동한다.**[* [부패물약 아지르](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139602)] 적 미니언이 많거나 상대 정글이 안 보일 때 원거리 `Q`로 먼저 들어가지 않는다. `W` 두 타와 기본 공격까지 이어질 상황인지 확인하고, 짧은 체력 이득을 봤다면 한 대를 더 치기보다 다시 웨이브 뒤로 빠진다.

## 패시브 한 스택에 목숨 걸지 않는다

**탈론의 큰 피해는 스킬로 표식을 쌓고 기본 공격으로 마무리할 때 나온다.** 하지만 세 번째 표식을 만들겠다고 상대 포탑이나 큰 웨이브까지 따라가면 교환을 이겨도 라인을 잃는다. 상대가 핵심 스킬을 미니언에 썼거나 `W` 복귀를 맞은 순간에만 완성하고, 조건이 어긋나면 다음 `W`를 기다린다.

## 로밍은 벽을 넘기 전에 웨이브부터

**탈론은 벽을 넘어 빠르게 합류할 수 있지만, 이동 속도가 빠른 것과 로밍 비용이 없는 것은 다르다.** 먼저 웨이브를 상대 포탑에 넣고 아군 정글과 같은 방향으로 움직인다. 갈 길과 돌아올 길을 다르게 잡으면 동선이 덜 읽히고, 실패해도 다음 웨이브에 복귀하기 쉽다. 라인을 못 밀었다면 사라지는 척만 하고 미드 압박을 이어 간다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-talon-20260913' OR (kind = 'article' AND title_key = '탈론'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-talon-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-talon-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 갈퀴손은 돌아오는 칼날까지 본다 · Q의 거리는 진입 위험을 바꾼다 · 패시브 한 스택에 목숨 걸지 않는다

## 갈퀴손은 돌아오는 칼날까지 본다

**`W`는 나갈 때보다 돌아올 때까지 맞아야 다음 교환이 열린다.**[* [\[D1\] 영감 탈론과 마법 탈론의 장단점](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141475&vtype=pc)] 상대가 막타를 치러 멈추는 순간 던지고, 옆으로 빠질 길을 미리 막는다. 첫 타만 맞았는데 `Q`로 곧장 들어가면 상대는 복귀 칼날을 피하면서 반격할 수 있다. 두 번째 타가 빗나갔다면 패시브를 억지로 완성하려 하지 않는다.

## `Q`의 거리는 진입 위험을 바꾼다

**가까운 거리의 `Q`는 강하지만, 먼 거리에서 쓰면 탈론이 눈에 보이게 상대 쪽으로 이동한다.**[* [부패물약 아지르](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139602)] 적 미니언이 많거나 상대 정글이 안 보일 때 원거리 `Q`로 먼저 들어가지 않는다. `W` 두 타와 기본 공격까지 이어질 상황인지 확인하고, 짧은 체력 이득을 봤다면 한 대를 더 치기보다 다시 웨이브 뒤로 빠진다.

## 패시브 한 스택에 목숨 걸지 않는다

**탈론의 큰 피해는 스킬로 표식을 쌓고 기본 공격으로 마무리할 때 나온다.** 하지만 세 번째 표식을 만들겠다고 상대 포탑이나 큰 웨이브까지 따라가면 교환을 이겨도 라인을 잃는다. 상대가 핵심 스킬을 미니언에 썼거나 `W` 복귀를 맞은 순간에만 완성하고, 조건이 어긋나면 다음 `W`를 기다린다.

## 로밍은 벽을 넘기 전에 웨이브부터

**탈론은 벽을 넘어 빠르게 합류할 수 있지만, 이동 속도가 빠른 것과 로밍 비용이 없는 것은 다르다.** 먼저 웨이브를 상대 포탑에 넣고 아군 정글과 같은 방향으로 움직인다. 갈 길과 돌아올 길을 다르게 잡으면 동선이 덜 읽히고, 실패해도 다음 웨이브에 복귀하기 쉽다. 라인을 못 밀었다면 사라지는 척만 하고 미드 압박을 이어 간다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-talon-20260913');

-- 키아나 (1079자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-qiyana-20260913', 'article', '키아나', '키아나', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 1레벨은 CS보다 체력을 지킨다 · 싸우기 전에는 원소부터 들고 있다 · E 진입 뒤 빠질 장면까지 본다

## 1레벨은 CS보다 체력을 지킨다

**키아나는 원거리 상대에게 1레벨부터 무리해 막타를 먹으면 3레벨 교환을 시작할 체력이 남지 않는다.**[* [M1 누구나 쉽게 키아나로 점수올리기](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144987)] `Q`로 안전하게 먹을 수 있는 CS와 버릴 CS를 나누고 경험치 범위는 지킨다. 상대가 견제기를 미니언에 쓴 순간에만 앞으로 나간다. 초반 손해를 한 번에 복구하려 긴 교환을 열지 않는다.

## 싸우기 전에는 원소부터 들고 있다

**딜교가 끝난 직후가 아니라면 `W`로 원소를 준비해 둔다.**[* [키아나 A to Z](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147203&vtype=pc)] 강 원소는 상대의 퇴로를 묶고, 수풀 원소는 반격을 흘리며, 벽 원소는 체력이 빠진 상대를 마무리하는 데 유리하다. 원소 없이 `E`로 먼저 들어가면 두 번째 `Q`와 탈출 선택이 함께 사라진다. 주변 지형이 무엇을 줄 수 있는지 보고 라인 위치를 잡는다.

## `E` 진입 뒤 빠질 장면까지 본다

**`E`는 상대에게 붙는 기술이지 자동으로 안전하게 돌아오는 기술이 아니다.** 상대의 핵심 스킬이 두 개 이상 빠졌거나 적 미니언 수가 적을 때 짧게 들어간다. 수풀 `Q`로 시야를 끊거나 `W` 이동으로 옆으로 빠질 길을 남겨 두고, `Q` 두 번을 다 쓴 뒤에도 적 정글 위치가 보이지 않으면 추격하지 않는다.

## 로밍은 라인을 정리하고 정글과 함께

**키아나는 강과 벽 근처 소규모 교전이 강하지만, 로밍에 집착해 미드 웨이브를 계속 버리면 다음 싸움의 피해가 부족해진다.** 라인을 상대 포탑에 넣은 뒤 아군 정글과 같은 방향으로 움직인다. 상대가 먼저 사라졌다면 무작정 따라가기보다 위험 핑을 찍고 반대쪽 시야나 웨이브에서 확실한 이득을 고른다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-qiyana-20260913' OR (kind = 'article' AND title_key = '키아나'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-qiyana-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-qiyana-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 1레벨은 CS보다 체력을 지킨다 · 싸우기 전에는 원소부터 들고 있다 · E 진입 뒤 빠질 장면까지 본다

## 1레벨은 CS보다 체력을 지킨다

**키아나는 원거리 상대에게 1레벨부터 무리해 막타를 먹으면 3레벨 교환을 시작할 체력이 남지 않는다.**[* [M1 누구나 쉽게 키아나로 점수올리기](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144987)] `Q`로 안전하게 먹을 수 있는 CS와 버릴 CS를 나누고 경험치 범위는 지킨다. 상대가 견제기를 미니언에 쓴 순간에만 앞으로 나간다. 초반 손해를 한 번에 복구하려 긴 교환을 열지 않는다.

## 싸우기 전에는 원소부터 들고 있다

**딜교가 끝난 직후가 아니라면 `W`로 원소를 준비해 둔다.**[* [키아나 A to Z](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147203&vtype=pc)] 강 원소는 상대의 퇴로를 묶고, 수풀 원소는 반격을 흘리며, 벽 원소는 체력이 빠진 상대를 마무리하는 데 유리하다. 원소 없이 `E`로 먼저 들어가면 두 번째 `Q`와 탈출 선택이 함께 사라진다. 주변 지형이 무엇을 줄 수 있는지 보고 라인 위치를 잡는다.

## `E` 진입 뒤 빠질 장면까지 본다

**`E`는 상대에게 붙는 기술이지 자동으로 안전하게 돌아오는 기술이 아니다.** 상대의 핵심 스킬이 두 개 이상 빠졌거나 적 미니언 수가 적을 때 짧게 들어간다. 수풀 `Q`로 시야를 끊거나 `W` 이동으로 옆으로 빠질 길을 남겨 두고, `Q` 두 번을 다 쓴 뒤에도 적 정글 위치가 보이지 않으면 추격하지 않는다.

## 로밍은 라인을 정리하고 정글과 함께

**키아나는 강과 벽 근처 소규모 교전이 강하지만, 로밍에 집착해 미드 웨이브를 계속 버리면 다음 싸움의 피해가 부족해진다.** 라인을 상대 포탑에 넣은 뒤 아군 정글과 같은 방향으로 움직인다. 상대가 먼저 사라졌다면 무작정 따라가기보다 위험 핑을 찍고 반대쪽 시야나 웨이브에서 확실한 이득을 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-qiyana-20260913');

-- 아리 (1025자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-ahri-20260913', 'article', '아리', '아리', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 돌아오는 길까지 맞혀야 한다 · 매혹은 먼저 던지기보다 남겨 둘 때 강하다 · W의 이동 속도로 교환을 끊는다

## `Q`는 돌아오는 길까지 맞혀야 한다

**현혹의 구슬은 나갈 때보다 돌아올 때의 궤적을 맞히는 것이 중요하다.**[* [아리 기초 중의 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147001&vtype=pc)] 상대가 막타를 치느라 멈추는 순간 던지고, 구슬이 돌아올 때 옆으로 움직여 귀환 경로가 상대를 다시 지나게 만든다. 첫 타만 맞았는데 무리해서 앞으로 따라가면 되레 상대의 반격 거리로 들어가므로, 돌아오는 각이 없으면 짧은 이득으로 끝낸다.

## 매혹은 먼저 던지기보다 남겨 둘 때 강하다

**매혹은 미니언에 막히므로 정면에서 습관적으로 사용하지 않는다.**[* [아리 기본 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=134209&vtype=pc)] 상대의 이동기가 빠졌거나 막타 동작으로 움직임이 고정됐을 때 쓰면 적중률이 높다. 시야가 없거나 돌진형 상대가 접근할 수 있는 상황에서는 매혹을 견제에 소모하지 않고, 진입을 끊는 용도로 보유하는 편이 라인 유지에 도움이 된다.

## `W`의 이동 속도로 교환을 끊는다

**여우불은 추가 피해뿐 아니라 잠깐의 이동 속도를 주는 기술이다.** 평타나 `Q`로 교환을 시작한 뒤 `W`의 속도로 상대 사거리 밖으로 빠지면 일방적인 짧은 교환을 만들기 쉽다. 반대로 `W`를 켜고 오래 추격하면 미니언 피해와 정글 개입에 노출된다.

## 라인을 밀 때와 싸울 때의 `Q`를 구분한다

**초반부터 모든 `Q`를 미니언과 챔피언에게 동시에 맞히려 하면 마나와 체력을 함께 잃기 쉽다.** 라인을 밀 목적이라면 먼저 강가 시야와 상대 위치를 확인하고, 싸울 목적이라면 미니언 체력이 낮아 상대가 막타를 치는 순간을 노린다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-ahri-20260913' OR (kind = 'article' AND title_key = '아리'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-ahri-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-ahri-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 돌아오는 길까지 맞혀야 한다 · 매혹은 먼저 던지기보다 남겨 둘 때 강하다 · W의 이동 속도로 교환을 끊는다

## `Q`는 돌아오는 길까지 맞혀야 한다

**현혹의 구슬은 나갈 때보다 돌아올 때의 궤적을 맞히는 것이 중요하다.**[* [아리 기초 중의 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147001&vtype=pc)] 상대가 막타를 치느라 멈추는 순간 던지고, 구슬이 돌아올 때 옆으로 움직여 귀환 경로가 상대를 다시 지나게 만든다. 첫 타만 맞았는데 무리해서 앞으로 따라가면 되레 상대의 반격 거리로 들어가므로, 돌아오는 각이 없으면 짧은 이득으로 끝낸다.

## 매혹은 먼저 던지기보다 남겨 둘 때 강하다

**매혹은 미니언에 막히므로 정면에서 습관적으로 사용하지 않는다.**[* [아리 기본 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=134209&vtype=pc)] 상대의 이동기가 빠졌거나 막타 동작으로 움직임이 고정됐을 때 쓰면 적중률이 높다. 시야가 없거나 돌진형 상대가 접근할 수 있는 상황에서는 매혹을 견제에 소모하지 않고, 진입을 끊는 용도로 보유하는 편이 라인 유지에 도움이 된다.

## `W`의 이동 속도로 교환을 끊는다

**여우불은 추가 피해뿐 아니라 잠깐의 이동 속도를 주는 기술이다.** 평타나 `Q`로 교환을 시작한 뒤 `W`의 속도로 상대 사거리 밖으로 빠지면 일방적인 짧은 교환을 만들기 쉽다. 반대로 `W`를 켜고 오래 추격하면 미니언 피해와 정글 개입에 노출된다.

## 라인을 밀 때와 싸울 때의 `Q`를 구분한다

**초반부터 모든 `Q`를 미니언과 챔피언에게 동시에 맞히려 하면 마나와 체력을 함께 잃기 쉽다.** 라인을 밀 목적이라면 먼저 강가 시야와 상대 위치를 확인하고, 싸울 목적이라면 미니언 체력이 낮아 상대가 막타를 치는 순간을 노린다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-ahri-20260913');

-- 말자하 (1015자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-malzahar-20260913', 'article', '말자하', '말자하', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — E가 옮겨갈 다음 대상을 먼저 본다 · 공허충은 E가 붙은 대상이 있을 때 부른다 · Q는 침묵뿐 아니라 E 지속시간을 잇는 기술이다

## `E`가 옮겨갈 다음 대상을 먼저 본다

**재앙의 환상은 대상이 죽으면 가까운 적에게 옮겨간다.**[* [9.1 미드 말자하 정석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143585)] 상대 챔피언 가까이에 체력이 낮은 미니언이 있다면 그 미니언에 `E`를 붙여 막타와 견제를 함께 노릴 수 있다. 반대로 옮겨갈 대상이 없는데 무작정 `E`를 쓰면 마나만 쓰고 라인도 원하는 만큼 밀리지 않는다.

## 공허충은 `E`가 붙은 대상이 있을 때 부른다

**공허충은 광역기에 쉽게 정리되므로 습관적으로 먼저 소환하지 않는다.**[* [말자하 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138980&view=a)] `E`가 붙은 대상이 있고 상대의 광역 정리기가 빠진 뒤 사용해야 미니언 정리와 압박에 제대로 기여한다. 공허충으로 라인을 빠르게 밀면 자연스럽게 앞으로 나가게 되므로 강가 시야가 없을 때는 수를 아낀다.

## `Q`는 침묵뿐 아니라 `E` 지속시간을 잇는 기술이다

**상대가 `E`를 달고 물러나는 경로에 `Q`를 놓으면 침묵과 함께 `E`의 지속시간을 갱신할 수 있다.** 다만 맞히기 어려운 거리에서 계속 `Q`를 쓰면 정글러가 왔을 때 끊을 기술이 남지 않는다. 상대가 스킬을 쓰거나 막타를 치는 고정 동작을 기다린다.

## 궁극기는 혼자 잡기보다 함께 때릴 시간을 만든다

**제압은 정글러의 접근과 피해를 확정하는 데 특히 강하다.** 라인이 아군 쪽에 있고 정글러가 가까울 때가 가장 단순한 킬 각이다. 반대로 큰 미니언 웨이브를 적 포탑에 넣은 상태에서 혼자 궁을 시작하면 주변 적에게 쉽게 끊기므로 위치부터 확인한다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-malzahar-20260913' OR (kind = 'article' AND title_key = '말자하'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-malzahar-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-malzahar-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — E가 옮겨갈 다음 대상을 먼저 본다 · 공허충은 E가 붙은 대상이 있을 때 부른다 · Q는 침묵뿐 아니라 E 지속시간을 잇는 기술이다

## `E`가 옮겨갈 다음 대상을 먼저 본다

**재앙의 환상은 대상이 죽으면 가까운 적에게 옮겨간다.**[* [9.1 미드 말자하 정석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143585)] 상대 챔피언 가까이에 체력이 낮은 미니언이 있다면 그 미니언에 `E`를 붙여 막타와 견제를 함께 노릴 수 있다. 반대로 옮겨갈 대상이 없는데 무작정 `E`를 쓰면 마나만 쓰고 라인도 원하는 만큼 밀리지 않는다.

## 공허충은 `E`가 붙은 대상이 있을 때 부른다

**공허충은 광역기에 쉽게 정리되므로 습관적으로 먼저 소환하지 않는다.**[* [말자하 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=138980&view=a)] `E`가 붙은 대상이 있고 상대의 광역 정리기가 빠진 뒤 사용해야 미니언 정리와 압박에 제대로 기여한다. 공허충으로 라인을 빠르게 밀면 자연스럽게 앞으로 나가게 되므로 강가 시야가 없을 때는 수를 아낀다.

## `Q`는 침묵뿐 아니라 `E` 지속시간을 잇는 기술이다

**상대가 `E`를 달고 물러나는 경로에 `Q`를 놓으면 침묵과 함께 `E`의 지속시간을 갱신할 수 있다.** 다만 맞히기 어려운 거리에서 계속 `Q`를 쓰면 정글러가 왔을 때 끊을 기술이 남지 않는다. 상대가 스킬을 쓰거나 막타를 치는 고정 동작을 기다린다.

## 궁극기는 혼자 잡기보다 함께 때릴 시간을 만든다

**제압은 정글러의 접근과 피해를 확정하는 데 특히 강하다.** 라인이 아군 쪽에 있고 정글러가 가까울 때가 가장 단순한 킬 각이다. 반대로 큰 미니언 웨이브를 적 포탑에 넣은 상태에서 혼자 궁을 시작하면 주변 적에게 쉽게 끊기므로 위치부터 확인한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-malzahar-20260913');

-- 빅토르 (956자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-viktor-20260913', 'article', '빅토르', '빅토르', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 한 번의 E에 푸시와 견제를 모두 욕심내지 않는다 · Q 강화 공격은 걸어갈 가치가 있을 때만 쓴다 · W는 즉시 기절이 아니라 이동 경로를 막는 장판이다

## 한 번의 `E`에 푸시와 견제를 모두 욕심내지 않는다

**죽음의 광선은 미니언을 정리하면서 상대를 맞히기 좋지만, 매번 두 가지를 동시에 노리면 예측하기 쉬운 직선이 된다.**[* [미드 빅토르 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144393)] 상대가 막타를 먹는 위치와 웨이브를 가르는 각이 겹칠 때만 둘을 함께 노리고, 그렇지 않으면 라인 관리와 체력 압박 중 하나를 선택한다.

## `Q` 강화 공격은 걸어갈 가치가 있을 때만 쓴다

**`Q` 보호막 덕분에 짧은 교환은 강하지만 강화 기본 공격을 넣으려고 앞으로 걸으면 상대의 핵심 기술 사거리에 들어갈 수 있다.**[* [빅토르의 교과서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133858&vtype=pc)] 상대 스킬이 빠졌거나 미니언 수가 비슷할 때만 강화 공격까지 연결하고, 위험하면 보호막으로 받은 이득만 챙겨 물러난다.

## `W`는 즉시 기절이 아니라 이동 경로를 막는 장판이다

**중력장은 상대 발밑보다 퇴로 또는 자신의 도주로에 걸쳐 놓는 편이 효과적이다.** 돌진기가 남아 있는 상대에게 먼저 쓰면 쉽게 벗어나므로, 이동기가 빠지거나 정글러가 접근해 진행 방향이 정해진 뒤 사용한다.

## 초반의 승리는 첫 귀환까지 쓰러지지 않는 것이다

**초반 재사용 대기시간이 길 때 무리한 연속 교환을 하면 빈 시간이 크다.** 사거리로 체력을 조금씩 깎되, 킬을 위해 앞으로 나가기보다 체력과 미니언을 보존해 안정적으로 성장하는 것을 우선한다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-viktor-20260913' OR (kind = 'article' AND title_key = '빅토르'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-viktor-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-viktor-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 한 번의 E에 푸시와 견제를 모두 욕심내지 않는다 · Q 강화 공격은 걸어갈 가치가 있을 때만 쓴다 · W는 즉시 기절이 아니라 이동 경로를 막는 장판이다

## 한 번의 `E`에 푸시와 견제를 모두 욕심내지 않는다

**죽음의 광선은 미니언을 정리하면서 상대를 맞히기 좋지만, 매번 두 가지를 동시에 노리면 예측하기 쉬운 직선이 된다.**[* [미드 빅토르 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144393)] 상대가 막타를 먹는 위치와 웨이브를 가르는 각이 겹칠 때만 둘을 함께 노리고, 그렇지 않으면 라인 관리와 체력 압박 중 하나를 선택한다.

## `Q` 강화 공격은 걸어갈 가치가 있을 때만 쓴다

**`Q` 보호막 덕분에 짧은 교환은 강하지만 강화 기본 공격을 넣으려고 앞으로 걸으면 상대의 핵심 기술 사거리에 들어갈 수 있다.**[* [빅토르의 교과서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=133858&vtype=pc)] 상대 스킬이 빠졌거나 미니언 수가 비슷할 때만 강화 공격까지 연결하고, 위험하면 보호막으로 받은 이득만 챙겨 물러난다.

## `W`는 즉시 기절이 아니라 이동 경로를 막는 장판이다

**중력장은 상대 발밑보다 퇴로 또는 자신의 도주로에 걸쳐 놓는 편이 효과적이다.** 돌진기가 남아 있는 상대에게 먼저 쓰면 쉽게 벗어나므로, 이동기가 빠지거나 정글러가 접근해 진행 방향이 정해진 뒤 사용한다.

## 초반의 승리는 첫 귀환까지 쓰러지지 않는 것이다

**초반 재사용 대기시간이 길 때 무리한 연속 교환을 하면 빈 시간이 크다.** 사거리로 체력을 조금씩 깎되, 킬을 위해 앞으로 나가기보다 체력과 미니언을 보존해 안정적으로 성장하는 것을 우선한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-viktor-20260913');

-- 멜 (760자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-mel-20260913', 'article', '멜', '멜', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — W는 평범한 견제보다 결정적인 투사체에 남긴다 · E는 중심부가 맞아야 속박된다 · Q는 멈춘 적에게 써야 피해가 남는다

## `W`는 평범한 견제보다 결정적인 투사체에 남긴다

**반박은 모든 피해를 지우는 기술이 아니다.**[* [멜 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=170)] 반사할 수 있는 투사체와 막지 못하는 비투사체·지속 공격을 구분해야 한다. 작은 견제 하나에 먼저 쓰면 상대의 핵심 투사체나 정글러의 진입을 받아낼 방법이 사라지므로, 어떤 기술을 돌려보낼지 라인 시작 전에 정해 둔다.

## `E`는 중심부가 맞아야 속박된다

**태양 올가미의 바깥 부분은 둔화에 그치므로, 멀리서 무작정 던지기보다 상대가 막타를 치는 순간이나 좁은 통로에 들어온 순간을 노린다.**[* [멜 단점과 카운터에 대한 유저 경험](https://www.inven.co.kr/board/lol/3370/571366)] 돌진형 상대에게는 먼저 소모하지 않고 진입 경로에 사용하면 `Q`의 반복 피해를 넣을 시간을 벌 수 있다.

## `Q`는 멈춘 적에게 써야 피해가 남는다

**빛의 세례는 한 지점에 피해가 반복되는 기술이라 자유롭게 움직이는 상대에게는 효율이 떨어진다.** `E`의 속박·둔화나 아군의 제어가 확인된 뒤 사용하고, `Q`와 `E`를 동시에 빗맞힌 상태에서는 강화 공격을 넣겠다고 앞으로 나가지 않는다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-mel-20260913' OR (kind = 'article' AND title_key = '멜'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-mel-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-mel-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — W는 평범한 견제보다 결정적인 투사체에 남긴다 · E는 중심부가 맞아야 속박된다 · Q는 멈춘 적에게 써야 피해가 남는다

## `W`는 평범한 견제보다 결정적인 투사체에 남긴다

**반박은 모든 피해를 지우는 기술이 아니다.**[* [멜 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=170)] 반사할 수 있는 투사체와 막지 못하는 비투사체·지속 공격을 구분해야 한다. 작은 견제 하나에 먼저 쓰면 상대의 핵심 투사체나 정글러의 진입을 받아낼 방법이 사라지므로, 어떤 기술을 돌려보낼지 라인 시작 전에 정해 둔다.

## `E`는 중심부가 맞아야 속박된다

**태양 올가미의 바깥 부분은 둔화에 그치므로, 멀리서 무작정 던지기보다 상대가 막타를 치는 순간이나 좁은 통로에 들어온 순간을 노린다.**[* [멜 단점과 카운터에 대한 유저 경험](https://www.inven.co.kr/board/lol/3370/571366)] 돌진형 상대에게는 먼저 소모하지 않고 진입 경로에 사용하면 `Q`의 반복 피해를 넣을 시간을 벌 수 있다.

## `Q`는 멈춘 적에게 써야 피해가 남는다

**빛의 세례는 한 지점에 피해가 반복되는 기술이라 자유롭게 움직이는 상대에게는 효율이 떨어진다.** `E`의 속박·둔화나 아군의 제어가 확인된 뒤 사용하고, `Q`와 `E`를 동시에 빗맞힌 상태에서는 강화 공격을 넣겠다고 앞으로 나가지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-mel-20260913');

-- 신드라 (945자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-syndra-20260913', 'article', '신드라', '신드라', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 움직이면서 던지고 막타 동작을 노린다 · 남아 있는 구체와 E의 직선을 계속 본다 · W의 둔화로 다음 기술을 맞힌다

## `Q`는 움직이면서 던지고 막타 동작을 노린다

**신드라는 `Q`를 사용하는 동안 이동을 멈출 필요가 없다.**[* [초보를 위한 신드라 공략서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=119807&vtype=pc)] 상대가 미니언을 치려고 잠깐 멈추는 순간 구체를 놓고 곧바로 옆으로 움직여 반격 각을 줄인다. 기본 공격을 섞을 수는 있지만, 한 대를 더 치기 위해 상대 미니언 한가운데까지 걷지 않는다.

## 남아 있는 구체와 `E`의 직선을 계속 본다

**바닥의 구체는 잠시 남고 `E`에 밀리면 직선상의 적을 기절시킨다.**[* [신드라 간단 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=123417)] 상대 정면의 구체만 볼 것이 아니라 살짝 옆에 남은 구체와 상대를 잇는 선을 찾아야 예측하기 어려운 각이 나온다. 시야가 없거나 암살자가 진입할 수 있을 때 `E`를 단순 견제에 쓰면 생존 수단이 사라진다.

## `W`의 둔화로 다음 기술을 맞힌다

**미니언이나 구체를 던지는 `W`는 피해만 넣는 기술이 아니다.** 상대의 막타 경로에 던져 둔화를 만든 뒤 `Q`나 `E`를 연결하면 적중이 쉬워진다. 구체를 집어 들 때는 기존 `E` 각을 없애는지 함께 확인한다.

## 한 번 빗나가면 연계를 억지로 완성하지 않는다

**신드라의 긴 연계는 첫 제어기가 적중했을 때 강하다.** `Q`나 `W`가 빗나갔는데도 `E`를 추가로 소모하면 상대가 들어올 긴 빈틈만 생긴다. 실패한 교환은 즉시 끊고 다음 구체 배치를 준비한다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-syndra-20260913' OR (kind = 'article' AND title_key = '신드라'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-syndra-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-syndra-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 움직이면서 던지고 막타 동작을 노린다 · 남아 있는 구체와 E의 직선을 계속 본다 · W의 둔화로 다음 기술을 맞힌다

## `Q`는 움직이면서 던지고 막타 동작을 노린다

**신드라는 `Q`를 사용하는 동안 이동을 멈출 필요가 없다.**[* [초보를 위한 신드라 공략서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=119807&vtype=pc)] 상대가 미니언을 치려고 잠깐 멈추는 순간 구체를 놓고 곧바로 옆으로 움직여 반격 각을 줄인다. 기본 공격을 섞을 수는 있지만, 한 대를 더 치기 위해 상대 미니언 한가운데까지 걷지 않는다.

## 남아 있는 구체와 `E`의 직선을 계속 본다

**바닥의 구체는 잠시 남고 `E`에 밀리면 직선상의 적을 기절시킨다.**[* [신드라 간단 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=123417)] 상대 정면의 구체만 볼 것이 아니라 살짝 옆에 남은 구체와 상대를 잇는 선을 찾아야 예측하기 어려운 각이 나온다. 시야가 없거나 암살자가 진입할 수 있을 때 `E`를 단순 견제에 쓰면 생존 수단이 사라진다.

## `W`의 둔화로 다음 기술을 맞힌다

**미니언이나 구체를 던지는 `W`는 피해만 넣는 기술이 아니다.** 상대의 막타 경로에 던져 둔화를 만든 뒤 `Q`나 `E`를 연결하면 적중이 쉬워진다. 구체를 집어 들 때는 기존 `E` 각을 없애는지 함께 확인한다.

## 한 번 빗나가면 연계를 억지로 완성하지 않는다

**신드라의 긴 연계는 첫 제어기가 적중했을 때 강하다.** `Q`나 `W`가 빗나갔는데도 `E`를 추가로 소모하면 상대가 들어올 긴 빈틈만 생긴다. 실패한 교환은 즉시 끊고 다음 구체 배치를 준비한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-syndra-20260913');

-- 라이즈 (973자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-ryze-20260913', 'article', '라이즈', '라이즈', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — E는 체력이 낮은 미니언을 통해 상대에게 번진다 · W를 단독으로 쓸지 E와 묶을지 결정한다 · Q 앞의 첫 대상을 확인한다

## `E`는 체력이 낮은 미니언을 통해 상대에게 번진다

**주문 전이는 주변 대상에게 표식을 퍼뜨린다.**[* [라이즈 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139359)] 상대 가까이에 체력이 낮은 미니언이 있다면 그 미니언에 `E`를 쓰고 `Q`로 정리해 파밍과 견제를 함께 노릴 수 있다. 이 과정은 웨이브를 빠르게 밀기 때문에 강가 시야가 없을 때 반복하지 않는다.

## `W`를 단독으로 쓸지 `E`와 묶을지 결정한다

**`W`만 사용하면 둔화지만 `E` 표식이 있는 대상에게 쓰면 속박이 된다.**[* [라이즈 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140641)] 상대가 단순히 막타를 먹는 상황에는 둔화로 짧게 압박할 수 있고, 이동기를 끊거나 정글러와 잡아야 할 때는 `E`-`W`를 보존한다. 모든 교환을 속박으로 시작하면 마나와 핵심 기술이 동시에 비게 된다.

## `Q` 앞의 첫 대상을 확인한다

**과부하 투사체는 앞에 선 대상에 막힌다.** 상대가 미니언 뒤에 있을 때 정면에서 계속 던지지 말고, 웨이브 옆으로 한두 걸음 이동하거나 `E`가 번진 미니언을 이용한다. 각을 만들겠다고 너무 옆으로 나가면 강가에서 오는 적에게 노출되므로 시야가 있는 쪽으로 움직인다.

## 연계 뒤의 이동 속도로 빠져나온다

**다른 기본 기술은 `Q`의 재사용을 초기화하며, 두 개의 룬을 모은 뒤 `Q`를 쓰면 이동 속도를 얻는다.** 긴 맞대결을 계속하기보다 필요한 주문을 순서대로 사용하고 이 속도로 상대 사거리 밖으로 나가 짧은 교환을 완성한다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-ryze-20260913' OR (kind = 'article' AND title_key = '라이즈'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-ryze-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-ryze-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — E는 체력이 낮은 미니언을 통해 상대에게 번진다 · W를 단독으로 쓸지 E와 묶을지 결정한다 · Q 앞의 첫 대상을 확인한다

## `E`는 체력이 낮은 미니언을 통해 상대에게 번진다

**주문 전이는 주변 대상에게 표식을 퍼뜨린다.**[* [라이즈 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139359)] 상대 가까이에 체력이 낮은 미니언이 있다면 그 미니언에 `E`를 쓰고 `Q`로 정리해 파밍과 견제를 함께 노릴 수 있다. 이 과정은 웨이브를 빠르게 밀기 때문에 강가 시야가 없을 때 반복하지 않는다.

## `W`를 단독으로 쓸지 `E`와 묶을지 결정한다

**`W`만 사용하면 둔화지만 `E` 표식이 있는 대상에게 쓰면 속박이 된다.**[* [라이즈 기초 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140641)] 상대가 단순히 막타를 먹는 상황에는 둔화로 짧게 압박할 수 있고, 이동기를 끊거나 정글러와 잡아야 할 때는 `E`-`W`를 보존한다. 모든 교환을 속박으로 시작하면 마나와 핵심 기술이 동시에 비게 된다.

## `Q` 앞의 첫 대상을 확인한다

**과부하 투사체는 앞에 선 대상에 막힌다.** 상대가 미니언 뒤에 있을 때 정면에서 계속 던지지 말고, 웨이브 옆으로 한두 걸음 이동하거나 `E`가 번진 미니언을 이용한다. 각을 만들겠다고 너무 옆으로 나가면 강가에서 오는 적에게 노출되므로 시야가 있는 쪽으로 움직인다.

## 연계 뒤의 이동 속도로 빠져나온다

**다른 기본 기술은 `Q`의 재사용을 초기화하며, 두 개의 룬을 모은 뒤 `Q`를 쓰면 이동 속도를 얻는다.** 긴 맞대결을 계속하기보다 필요한 주문을 순서대로 사용하고 이 속도로 상대 사거리 밖으로 나가 짧은 교환을 완성한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-ryze-20260913');

-- 제라스 (965자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-xerath-20260913', 'article', '제라스', '제라스', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 첫 몇 발은 피해보다 무빙 습관을 알아보는 데 쓴다 · W의 중심 둔화가 다음 기술의 출발점이다 · Q를 충전하는 위치부터 숨긴다

## 첫 몇 발은 피해보다 무빙 습관을 알아보는 데 쓴다

**상대가 `Q`를 피할 때 늘 같은 방향으로 움직이는지, 막타 직전에 멈추는지 먼저 본다.**[* [제라스 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132556)] 처음부터 최대 사거리 예측 사격만 반복하기보다 상대의 회피 방향을 확인한 뒤 다음 기술을 그쪽에 놓는다. 미니언을 먹는 순간은 이동 선택지가 가장 적다.

## `W`의 중심 둔화가 다음 기술의 출발점이다

**`W` 중심부를 맞히면 강한 둔화가 걸려 `Q`나 `E`를 잇기 쉬워진다.**[* [제라스 스킬 활용 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112649&vtype=pc)] 반대로 움직임이 자유로운 상대에게 `E`부터 멀리 던지면 생존 기술까지 함께 잃는다. 돌진기가 있는 상대에게는 `E`를 견제에 쓰지 않고 진입을 끊는 용도로 남겨 둔다.

## `Q`를 충전하는 위치부터 숨긴다

**시야 밖이나 미니언 뒤에서 충전을 시작하면 상대가 방향과 시점을 읽기 어렵다.** 하지만 최대 사거리만 고집하며 같은 자리에서 충전하면 정글러에게 움직임이 그대로 노출된다. 시야가 확보된 쪽으로 자리를 바꾸고, 위험하면 짧게 충전해 바로 이동한다.

## 빠른 라인 정리는 안전한 위치와 함께 만든다

**스킬로 웨이브를 지우면 자연스럽게 라인이 상대 쪽으로 간다.** 도주기가 없는 제라스는 한쪽 강가에 시야를 만들고 그쪽에 가깝게 서야 한다. 양쪽이 모두 보이지 않으면 상대 체력을 깎는 것보다 웨이브가 돌아오도록 기다리는 편이 낫다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-xerath-20260913' OR (kind = 'article' AND title_key = '제라스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-xerath-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-xerath-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 첫 몇 발은 피해보다 무빙 습관을 알아보는 데 쓴다 · W의 중심 둔화가 다음 기술의 출발점이다 · Q를 충전하는 위치부터 숨긴다

## 첫 몇 발은 피해보다 무빙 습관을 알아보는 데 쓴다

**상대가 `Q`를 피할 때 늘 같은 방향으로 움직이는지, 막타 직전에 멈추는지 먼저 본다.**[* [제라스 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=132556)] 처음부터 최대 사거리 예측 사격만 반복하기보다 상대의 회피 방향을 확인한 뒤 다음 기술을 그쪽에 놓는다. 미니언을 먹는 순간은 이동 선택지가 가장 적다.

## `W`의 중심 둔화가 다음 기술의 출발점이다

**`W` 중심부를 맞히면 강한 둔화가 걸려 `Q`나 `E`를 잇기 쉬워진다.**[* [제라스 스킬 활용 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=112649&vtype=pc)] 반대로 움직임이 자유로운 상대에게 `E`부터 멀리 던지면 생존 기술까지 함께 잃는다. 돌진기가 있는 상대에게는 `E`를 견제에 쓰지 않고 진입을 끊는 용도로 남겨 둔다.

## `Q`를 충전하는 위치부터 숨긴다

**시야 밖이나 미니언 뒤에서 충전을 시작하면 상대가 방향과 시점을 읽기 어렵다.** 하지만 최대 사거리만 고집하며 같은 자리에서 충전하면 정글러에게 움직임이 그대로 노출된다. 시야가 확보된 쪽으로 자리를 바꾸고, 위험하면 짧게 충전해 바로 이동한다.

## 빠른 라인 정리는 안전한 위치와 함께 만든다

**스킬로 웨이브를 지우면 자연스럽게 라인이 상대 쪽으로 간다.** 도주기가 없는 제라스는 한쪽 강가에 시야를 만들고 그쪽에 가깝게 서야 한다. 양쪽이 모두 보이지 않으면 상대 체력을 깎는 것보다 웨이브가 돌아오도록 기다리는 편이 낫다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-xerath-20260913');

-- 트위스티드 페이트 (944자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-twistedfate-20260913', 'article', '트위스티드 페이트', '트위스티드페이트', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 골드 카드의 위협은 뽑기 전에도 존재한다 · 평타 견제는 미니언 어그로와 라인을 바꾼다 · 카드는 다음 행동에 맞춰 고른다

## 골드 카드(`W`)의 위협은 뽑기 전에도 존재한다

**골드 카드를 너무 일찍 확정하면 상대는 카드가 사라질 때까지 물러나면 된다.**[* [도파 트페 분석 9.21](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143990&vtype=pc)] 상대가 막타를 치러 들어오거나 정글러가 접근할 때 카드를 돌리기 시작해야 선택지를 압박할 수 있다. 카드를 들고 앞으로 걷는 동안 다른 적의 위치도 함께 확인한다.

## 평타 견제는 미니언 어그로와 라인을 바꾼다

**상대를 기본 공격하면 적 미니언이 트위스티드 페이트를 공격하고 웨이브가 밀리기 쉽다.**[* [도파 트페 분석 10.10](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145528&vtype=pc)] 한 대를 때린 뒤 수풀이나 거리 밖으로 빠져 어그로를 끊고, 라인을 당겨야 하는 상황에서는 무리한 평타 견제를 줄인다.

## 카드는 다음 행동에 맞춰 고른다

**웨이브를 빠르게 정리할 때는 레드 카드의 범위를 활용하고, 정글러가 오거나 상대가 접근할 때는 골드 카드를 준비한다.** 카드를 먼저 고른 뒤 목적을 찾는 습관보다 라인을 밀지, 잡을지를 먼저 결정해야 불필요하게 웨이브를 망치지 않는다.

## 궁극기 전에 현재 웨이브를 끝낸다

**다른 라인에 기회가 보여도 미니언을 포탑에 넣지 않고 이동하면 상대 미드가 손쉽게 경험치와 포탑 피해를 챙긴다.** 먼저 웨이브를 밀고 상대 위치를 확인한 뒤 이동한다. 도착 지점도 적 바로 위보다 퇴로나 아군과 합류할 수 있는 쪽이 안전하다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-twistedfate-20260913' OR (kind = 'article' AND title_key = '트위스티드페이트'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-twistedfate-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-twistedfate-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 골드 카드의 위협은 뽑기 전에도 존재한다 · 평타 견제는 미니언 어그로와 라인을 바꾼다 · 카드는 다음 행동에 맞춰 고른다

## 골드 카드(`W`)의 위협은 뽑기 전에도 존재한다

**골드 카드를 너무 일찍 확정하면 상대는 카드가 사라질 때까지 물러나면 된다.**[* [도파 트페 분석 9.21](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143990&vtype=pc)] 상대가 막타를 치러 들어오거나 정글러가 접근할 때 카드를 돌리기 시작해야 선택지를 압박할 수 있다. 카드를 들고 앞으로 걷는 동안 다른 적의 위치도 함께 확인한다.

## 평타 견제는 미니언 어그로와 라인을 바꾼다

**상대를 기본 공격하면 적 미니언이 트위스티드 페이트를 공격하고 웨이브가 밀리기 쉽다.**[* [도파 트페 분석 10.10](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145528&vtype=pc)] 한 대를 때린 뒤 수풀이나 거리 밖으로 빠져 어그로를 끊고, 라인을 당겨야 하는 상황에서는 무리한 평타 견제를 줄인다.

## 카드는 다음 행동에 맞춰 고른다

**웨이브를 빠르게 정리할 때는 레드 카드의 범위를 활용하고, 정글러가 오거나 상대가 접근할 때는 골드 카드를 준비한다.** 카드를 먼저 고른 뒤 목적을 찾는 습관보다 라인을 밀지, 잡을지를 먼저 결정해야 불필요하게 웨이브를 망치지 않는다.

## 궁극기 전에 현재 웨이브를 끝낸다

**다른 라인에 기회가 보여도 미니언을 포탑에 넣지 않고 이동하면 상대 미드가 손쉽게 경험치와 포탑 피해를 챙긴다.** 먼저 웨이브를 밀고 상대 위치를 확인한 뒤 이동한다. 도착 지점도 적 바로 위보다 퇴로나 아군과 합류할 수 있는 쪽이 안전하다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-twistedfate-20260913');

-- 럭스 (906자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-lux-20260913', 'article', '럭스', '럭스', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — E는 바로 터뜨리지 않아도 된다 · Q는 미니언 하나 뒤의 상대도 묶는다 · 표식 기본 공격은 안전할 때만 회수한다

## `E`는 바로 터뜨리지 않아도 된다

**광휘의 특이점은 남아 있는 동안 상대를 둔화하고 공간을 막는다.**[* [11.5 럭스 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143095&vtype=pc)] 상대 발밑에 던진 뒤 즉시 폭발시키는 것보다, 이동 방향이 정해질 때까지 잠시 유지하면 `Q`를 피할 길을 좁힐 수 있다. 수풀이나 강가 입구를 확인할 때도 `E`의 시야를 활용한다.

## `Q`는 미니언 하나 뒤의 상대도 묶는다

**빛의 속박은 최대 두 대상을 맞힐 수 있다.**[* [간편 럭스 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=117471&vtype=pc)] 상대와 럭스 사이에 미니언이 하나뿐인 순간은 미니언을 관통해 속박할 수 있는 각이다. 반대로 미니언이 겹겹이 있을 때 정면으로 던지면 쉽게 막히므로 웨이브 옆 각도를 만든다.

## 표식 기본 공격은 안전할 때만 회수한다

**스킬 적중 뒤 기본 공격으로 추가 피해를 낼 수 있지만, 표식 하나를 터뜨리려고 상대의 반격 사거리까지 걸어갈 필요는 없다.** 상대 핵심 기술이 빠졌거나 `W`의 왕복 보호막을 받을 수 있을 때만 짧게 치고 빠진다.

## 라인에 쓴 `E`는 잠시 생존기가 아니다

**`E`로 웨이브를 밀면 둔화와 시야 확인 수단이 동시에 사라진다.** 상대 정글러 위치가 보이지 않을 때는 미니언 전체를 맞히겠다고 앞으로 던지지 말고, 라인이 안전한 위치로 돌아올 여지를 남긴다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-lux-20260913' OR (kind = 'article' AND title_key = '럭스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-lux-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-lux-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — E는 바로 터뜨리지 않아도 된다 · Q는 미니언 하나 뒤의 상대도 묶는다 · 표식 기본 공격은 안전할 때만 회수한다

## `E`는 바로 터뜨리지 않아도 된다

**광휘의 특이점은 남아 있는 동안 상대를 둔화하고 공간을 막는다.**[* [11.5 럭스 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143095&vtype=pc)] 상대 발밑에 던진 뒤 즉시 폭발시키는 것보다, 이동 방향이 정해질 때까지 잠시 유지하면 `Q`를 피할 길을 좁힐 수 있다. 수풀이나 강가 입구를 확인할 때도 `E`의 시야를 활용한다.

## `Q`는 미니언 하나 뒤의 상대도 묶는다

**빛의 속박은 최대 두 대상을 맞힐 수 있다.**[* [간편 럭스 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=117471&vtype=pc)] 상대와 럭스 사이에 미니언이 하나뿐인 순간은 미니언을 관통해 속박할 수 있는 각이다. 반대로 미니언이 겹겹이 있을 때 정면으로 던지면 쉽게 막히므로 웨이브 옆 각도를 만든다.

## 표식 기본 공격은 안전할 때만 회수한다

**스킬 적중 뒤 기본 공격으로 추가 피해를 낼 수 있지만, 표식 하나를 터뜨리려고 상대의 반격 사거리까지 걸어갈 필요는 없다.** 상대 핵심 기술이 빠졌거나 `W`의 왕복 보호막을 받을 수 있을 때만 짧게 치고 빠진다.

## 라인에 쓴 `E`는 잠시 생존기가 아니다

**`E`로 웨이브를 밀면 둔화와 시야 확인 수단이 동시에 사라진다.** 상대 정글러 위치가 보이지 않을 때는 미니언 전체를 맞히겠다고 앞으로 던지지 말고, 라인이 안전한 위치로 돌아올 여지를 남긴다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-lux-20260913');

-- 오로라 (890자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-aurora-20260913', 'article', '오로라', '오로라', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 회수 경로까지 보고 다시 누른다 · W는 진입기이자 이탈기다 · E의 뒤로 뛰는 거리를 계산한다

## `Q`는 회수 경로까지 보고 다시 누른다

**첫 `Q`로 표식을 묻힌 뒤 바로 회수하기보다, 한두 걸음 옆으로 움직여 돌아오는 투사체가 상대와 미니언을 함께 지나게 만든다.**[* [미드 오로라 완벽 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148099)] 상대가 회수 경로를 피하려 움직이는 것 자체로 막타 위치를 제한할 수 있다. 회수 각이 없으면 더 깊이 따라가지 않는다.

## `W`는 진입기이자 이탈기다

**`W`의 도약과 투명화는 핵심 기술 하나를 피하거나 짧은 교환 뒤 시야를 끊는 데 유용하다.**[* [오로라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=168)] 피해를 더 넣기 위해 먼저 사용하면 돌아올 수단이 없어지며, 투명화가 광역 피해까지 막아 주는 것은 아니다. 상대의 위치와 남은 기술을 확인하고 사용한다.

## `E`의 뒤로 뛰는 거리를 계산한다

**`E`는 피해와 둔화를 주면서 오로라를 뒤로 이동시켜 짧은 교환을 끝내기 좋다.** 다만 등을 강가나 적 정글 쪽으로 두고 사용하면 위험한 방향으로 넘어갈 수 있다. 교환을 시작하기 전에 `E` 사용 뒤 도착할 지점을 먼저 본다.

## 세 번째 적중을 위해 무리하지 않는다

**지속 효과를 완성하면 이득이 크지만 마지막 한 번을 넣으려고 미니언을 넘어가면 상대의 전체 연계를 맞을 수 있다.** 안전한 `Q` 회수나 기본 공격 각이 아니면 교환을 끊고 다음 주기를 기다린다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-aurora-20260913' OR (kind = 'article' AND title_key = '오로라'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-aurora-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-aurora-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 회수 경로까지 보고 다시 누른다 · W는 진입기이자 이탈기다 · E의 뒤로 뛰는 거리를 계산한다

## `Q`는 회수 경로까지 보고 다시 누른다

**첫 `Q`로 표식을 묻힌 뒤 바로 회수하기보다, 한두 걸음 옆으로 움직여 돌아오는 투사체가 상대와 미니언을 함께 지나게 만든다.**[* [미드 오로라 완벽 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148099)] 상대가 회수 경로를 피하려 움직이는 것 자체로 막타 위치를 제한할 수 있다. 회수 각이 없으면 더 깊이 따라가지 않는다.

## `W`는 진입기이자 이탈기다

**`W`의 도약과 투명화는 핵심 기술 하나를 피하거나 짧은 교환 뒤 시야를 끊는 데 유용하다.**[* [오로라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=168)] 피해를 더 넣기 위해 먼저 사용하면 돌아올 수단이 없어지며, 투명화가 광역 피해까지 막아 주는 것은 아니다. 상대의 위치와 남은 기술을 확인하고 사용한다.

## `E`의 뒤로 뛰는 거리를 계산한다

**`E`는 피해와 둔화를 주면서 오로라를 뒤로 이동시켜 짧은 교환을 끝내기 좋다.** 다만 등을 강가나 적 정글 쪽으로 두고 사용하면 위험한 방향으로 넘어갈 수 있다. 교환을 시작하기 전에 `E` 사용 뒤 도착할 지점을 먼저 본다.

## 세 번째 적중을 위해 무리하지 않는다

**지속 효과를 완성하면 이득이 크지만 마지막 한 번을 넣으려고 미니언을 넘어가면 상대의 전체 연계를 맞을 수 있다.** 안전한 `Q` 회수나 기본 공격 각이 아니면 교환을 끊고 다음 주기를 기다린다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-aurora-20260913');

-- 오리아나 (930자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-orianna-20260913', 'article', '오리아나', '오리아나', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 공의 위치가 실제 사거리다 · Q는 여러 대상을 통과할수록 피해가 줄어든다 · W는 공을 먼저 놓은 뒤 사용한다

## 공의 위치가 실제 사거리다

**`Q` 사거리 밖을 클릭하면 공만 가는 것이 아니라 오리아나가 앞으로 걸어갈 수 있다.**[* [11.2 오리아나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144290&vtype=pc)] 최대 거리 견제를 시도하다 상대의 제어기 안으로 들어가는 실수가 잦으므로, 공과 상대 사이의 거리를 기준으로 명령한다. 위험한 쪽에 공을 오래 두면 자신을 지킬 `E`도 늦어진다.

## `Q`는 여러 대상을 통과할수록 피해가 줄어든다

**웨이브 전체를 관통해 상대를 맞히는 `Q`는 견제 피해가 낮아진다.**[* [오리아나 완벽 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140796&vtype=pc)] 상대 체력을 깎을 때는 미니언 옆에서 공이 직접 닿는 각을 만들고, 웨이브를 밀 때는 챔피언 적중을 억지로 욕심내지 않는다.

## `W`는 공을 먼저 놓은 뒤 사용한다

**`W`의 둔화와 피해는 공 주변에서 발생한다.** `Q`가 빗나갔는데 `W`까지 바로 누르면 마나만 쓰고 두 기술이 함께 빈다. 공이 상대의 이동 경로에 놓였거나 `E`로 돌아오는 길에 상대를 지나갈 때 사용해 교환을 확정한다.

## `E`로 교환을 끝내며 공을 회수한다

**`E`는 보호막을 주고 공이 돌아오는 경로의 적에게 피해를 준다.** `Q`-`W` 견제 뒤 상대가 반격할 때 `E`로 보호막을 받으며 공을 회수하면 손해를 줄일 수 있다. 공이 돌아온 뒤에는 압박 가능한 위치가 달라졌다는 점을 잊지 않는다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-orianna-20260913' OR (kind = 'article' AND title_key = '오리아나'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-orianna-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-orianna-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 공의 위치가 실제 사거리다 · Q는 여러 대상을 통과할수록 피해가 줄어든다 · W는 공을 먼저 놓은 뒤 사용한다

## 공의 위치가 실제 사거리다

**`Q` 사거리 밖을 클릭하면 공만 가는 것이 아니라 오리아나가 앞으로 걸어갈 수 있다.**[* [11.2 오리아나 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144290&vtype=pc)] 최대 거리 견제를 시도하다 상대의 제어기 안으로 들어가는 실수가 잦으므로, 공과 상대 사이의 거리를 기준으로 명령한다. 위험한 쪽에 공을 오래 두면 자신을 지킬 `E`도 늦어진다.

## `Q`는 여러 대상을 통과할수록 피해가 줄어든다

**웨이브 전체를 관통해 상대를 맞히는 `Q`는 견제 피해가 낮아진다.**[* [오리아나 완벽 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=140796&vtype=pc)] 상대 체력을 깎을 때는 미니언 옆에서 공이 직접 닿는 각을 만들고, 웨이브를 밀 때는 챔피언 적중을 억지로 욕심내지 않는다.

## `W`는 공을 먼저 놓은 뒤 사용한다

**`W`의 둔화와 피해는 공 주변에서 발생한다.** `Q`가 빗나갔는데 `W`까지 바로 누르면 마나만 쓰고 두 기술이 함께 빈다. 공이 상대의 이동 경로에 놓였거나 `E`로 돌아오는 길에 상대를 지나갈 때 사용해 교환을 확정한다.

## `E`로 교환을 끝내며 공을 회수한다

**`E`는 보호막을 주고 공이 돌아오는 경로의 적에게 피해를 준다.** `Q`-`W` 견제 뒤 상대가 반격할 때 `E`로 보호막을 받으며 공을 회수하면 손해를 줄일 수 있다. 공이 돌아온 뒤에는 압박 가능한 위치가 달라졌다는 점을 잊지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-orianna-20260913');

-- 애니비아 (922자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-anivia-20260913', 'article', '애니비아', '애니비아', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 지나갈 때와 폭발할 때 두 번 맞힌다 · Q는 견제기이면서 생존기다 · 벽은 적을 맞히는 기술보다 길을 줄이는 기술이다

## `Q`는 지나갈 때와 폭발할 때 두 번 맞힌다

**냉기 폭발은 적을 통과할 때 피해를 주고 재사용해 터뜨릴 수 있다.**[* [초심자를 위한 애니비아](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=120543&vtype=pc)] 무조건 최대 거리까지 보내기보다 상대 몸을 지난 직후 폭발시켜 두 번의 피해와 기절을 노린다. 투사체가 느리므로 상대가 막타를 치거나 벽 때문에 이동 방향이 제한된 순간이 좋다.

## `Q`는 견제기이면서 생존기다

**돌진형 상대나 정글러가 보이지 않을 때 `Q`를 멀리 던지면 되돌아올 때까지 자신을 지킬 방법이 적다.**[* [쉽고 빠른 애니비아](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142233)] 먼저 던져 맞히려 하기보다 상대가 들어오는 방향으로 사용하면 적중도 쉽고 `E`를 연결할 시간도 생긴다.

## 벽은 적을 맞히는 기술보다 길을 줄이는 기술이다

**상대 바로 아래에 벽을 세우려 하면 방향을 잘못 밀어낼 수 있다.** 먼저 벽으로 퇴로 한쪽을 막고, 남은 길에 `Q`를 보내는 방식이 안정적이다. 아군 정글러의 진입로까지 막을 수 있으므로 어느 쪽으로 밀릴지 확인한다.

## 강화 `E`는 냉기가 묻은 뒤 사용한다

**동상은 `Q` 기절이나 충분히 형성된 궁극기로 냉기가 묻은 대상에게 강해진다.** 냉기 없이 `E`부터 던지는 교환은 마나 대비 효율이 낮다. 궁극기를 라인에 오래 유지할 때는 상대 정글러가 들어올 경로와 남은 마나를 함께 본다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-anivia-20260913' OR (kind = 'article' AND title_key = '애니비아'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-anivia-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-anivia-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 지나갈 때와 폭발할 때 두 번 맞힌다 · Q는 견제기이면서 생존기다 · 벽은 적을 맞히는 기술보다 길을 줄이는 기술이다

## `Q`는 지나갈 때와 폭발할 때 두 번 맞힌다

**냉기 폭발은 적을 통과할 때 피해를 주고 재사용해 터뜨릴 수 있다.**[* [초심자를 위한 애니비아](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=120543&vtype=pc)] 무조건 최대 거리까지 보내기보다 상대 몸을 지난 직후 폭발시켜 두 번의 피해와 기절을 노린다. 투사체가 느리므로 상대가 막타를 치거나 벽 때문에 이동 방향이 제한된 순간이 좋다.

## `Q`는 견제기이면서 생존기다

**돌진형 상대나 정글러가 보이지 않을 때 `Q`를 멀리 던지면 되돌아올 때까지 자신을 지킬 방법이 적다.**[* [쉽고 빠른 애니비아](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142233)] 먼저 던져 맞히려 하기보다 상대가 들어오는 방향으로 사용하면 적중도 쉽고 `E`를 연결할 시간도 생긴다.

## 벽은 적을 맞히는 기술보다 길을 줄이는 기술이다

**상대 바로 아래에 벽을 세우려 하면 방향을 잘못 밀어낼 수 있다.** 먼저 벽으로 퇴로 한쪽을 막고, 남은 길에 `Q`를 보내는 방식이 안정적이다. 아군 정글러의 진입로까지 막을 수 있으므로 어느 쪽으로 밀릴지 확인한다.

## 강화 `E`는 냉기가 묻은 뒤 사용한다

**동상은 `Q` 기절이나 충분히 형성된 궁극기로 냉기가 묻은 대상에게 강해진다.** 냉기 없이 `E`부터 던지는 교환은 마나 대비 효율이 낮다. 궁극기를 라인에 오래 유지할 때는 상대 정글러가 들어올 경로와 남은 마나를 함께 본다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-anivia-20260913');

-- 조이 (954자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-zoe-20260913', 'article', '조이', '조이', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 첫 방향보다 전체 이동 거리가 중요하다 · 수면은 정면보다 벽과 시야 밖에서 강하다 · 궁극기의 출발 지점이 곧 돌아올 자리다

## `Q`는 첫 방향보다 전체 이동 거리가 중요하다

**통통별은 방향을 한 번 바꿀 수 있고 이동한 거리가 길수록 강해진다.**[* [조이 초보자 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145204)] 첫 시전을 뒤로 보내는 습관만 고집하면 상대가 앞으로 들어올 때 도주 공간이 사라진다. 옆으로 보내 각도를 만들거나, 상대가 막타를 치는 순간 짧고 확실하게 맞히는 선택도 필요하다.

## 수면은 정면보다 벽과 시야 밖에서 강하다

**헤롱헤롱쿨쿨방울은 지형을 통과하면 긴 각을 만들 수 있다.**[* [조이 스킬 콤보의 모든 것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139114)] 라인을 민 뒤 강가나 측면 시야에서 던지면 상대가 출발점을 늦게 본다. 정면에서 계속 사용해 빗나가면 상대가 들어올 동안 막을 기술이 없으므로, 시야가 없을 때는 보유한다.

## 궁극기의 출발 지점이 곧 돌아올 자리다

**차원 넘기는 잠깐 앞으로 이동할 뿐 반드시 원래 위치로 돌아온다.** 상대 제어기를 피하지 못한 채 앞으로 쓰면 복귀 지점에 기술이 예약된다. 출발 자리가 안전한지 확인하고, 수면이나 아군 제어가 적중한 뒤 `Q` 각을 늘리는 용도로 사용한다.

## 라인에만 붙어 있기보다 먼저 시야를 잡는다

**조이는 좁은 길과 벽 너머에서 위협이 커진다.** 웨이브를 먼저 정리했다면 상대 포탑 앞에서 무리한 견제를 반복하기보다 정글러와 함께 강가 시야를 잡아 다음 수면 각을 만든다. 라인이 밀려 있는데 먼저 움직이면 경험치 손해가 더 크다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-zoe-20260913' OR (kind = 'article' AND title_key = '조이'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-zoe-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-zoe-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 첫 방향보다 전체 이동 거리가 중요하다 · 수면은 정면보다 벽과 시야 밖에서 강하다 · 궁극기의 출발 지점이 곧 돌아올 자리다

## `Q`는 첫 방향보다 전체 이동 거리가 중요하다

**통통별은 방향을 한 번 바꿀 수 있고 이동한 거리가 길수록 강해진다.**[* [조이 초보자 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145204)] 첫 시전을 뒤로 보내는 습관만 고집하면 상대가 앞으로 들어올 때 도주 공간이 사라진다. 옆으로 보내 각도를 만들거나, 상대가 막타를 치는 순간 짧고 확실하게 맞히는 선택도 필요하다.

## 수면은 정면보다 벽과 시야 밖에서 강하다

**헤롱헤롱쿨쿨방울은 지형을 통과하면 긴 각을 만들 수 있다.**[* [조이 스킬 콤보의 모든 것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139114)] 라인을 민 뒤 강가나 측면 시야에서 던지면 상대가 출발점을 늦게 본다. 정면에서 계속 사용해 빗나가면 상대가 들어올 동안 막을 기술이 없으므로, 시야가 없을 때는 보유한다.

## 궁극기의 출발 지점이 곧 돌아올 자리다

**차원 넘기는 잠깐 앞으로 이동할 뿐 반드시 원래 위치로 돌아온다.** 상대 제어기를 피하지 못한 채 앞으로 쓰면 복귀 지점에 기술이 예약된다. 출발 자리가 안전한지 확인하고, 수면이나 아군 제어가 적중한 뒤 `Q` 각을 늘리는 용도로 사용한다.

## 라인에만 붙어 있기보다 먼저 시야를 잡는다

**조이는 좁은 길과 벽 너머에서 위협이 커진다.** 웨이브를 먼저 정리했다면 상대 포탑 앞에서 무리한 견제를 반복하기보다 정글러와 함께 강가 시야를 잡아 다음 수면 각을 만든다. 라인이 밀려 있는데 먼저 움직이면 경험치 손해가 더 크다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-zoe-20260913');

-- 베이가 (915자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-veigar-20260913', 'article', '베이가', '베이가', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — Q로 미니언 두 마리를 한 줄에 세운다 · E는 기절보다 우리 안에 가두는 것만으로도 성공이다 · W는 움직일 곳이 줄었을 때 떨어뜨린다

## `Q`로 미니언 두 마리를 한 줄에 세운다

**사악한 일격은 앞의 두 대상을 맞힐 수 있다.**[* [베이가는 졸렬한 플레이](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=131611)] 체력이 낮은 미니언 두 마리를 일렬로 두고 마지막 타격을 하면 성장과 마나 사용을 함께 챙길 수 있다. 상대를 맞히겠다고 웨이브 옆으로 깊게 나가기보다 안정적인 막타를 먼저 확보한다.

## `E`는 기절보다 우리 안에 가두는 것만으로도 성공이다

**사건의 지평선 가장자리를 정확히 맞히려다 빗나가는 것보다, 상대의 퇴로나 진입로를 잘라 우리 안에 머물게 하는 편이 안정적이다.**[* [미드 베이가 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=118725)] 상대가 이동기를 가진 경우 먼저 쓰지 않고, 진입한 뒤 돌아갈 길을 막으면 생존에도 도움이 된다.

## `W`는 움직일 곳이 줄었을 때 떨어뜨린다

**암흑 물질은 떨어지기까지 시간이 있어 자유롭게 움직이는 상대에게 맞히기 어렵다.** `E`로 공간을 제한하거나 상대가 막타를 치는 위치가 정해진 뒤 사용한다. 아무 근거 없이 `W`를 반복하면 마나가 줄고 웨이브만 밀린다.

## 초반에는 킬보다 안전한 성장을 우선한다

**견제 한 번을 위해 `Q` 막타와 좋은 라인 위치를 동시에 잃지 않는다.** 상대가 기술을 미니언에 사용했을 때만 짧게 압박하고, 위협적인 진입기가 남아 있으면 `E`를 보존한 채 포탑 쪽에서 성장한다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-veigar-20260913' OR (kind = 'article' AND title_key = '베이가'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-veigar-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-veigar-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q로 미니언 두 마리를 한 줄에 세운다 · E는 기절보다 우리 안에 가두는 것만으로도 성공이다 · W는 움직일 곳이 줄었을 때 떨어뜨린다

## `Q`로 미니언 두 마리를 한 줄에 세운다

**사악한 일격은 앞의 두 대상을 맞힐 수 있다.**[* [베이가는 졸렬한 플레이](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=131611)] 체력이 낮은 미니언 두 마리를 일렬로 두고 마지막 타격을 하면 성장과 마나 사용을 함께 챙길 수 있다. 상대를 맞히겠다고 웨이브 옆으로 깊게 나가기보다 안정적인 막타를 먼저 확보한다.

## `E`는 기절보다 우리 안에 가두는 것만으로도 성공이다

**사건의 지평선 가장자리를 정확히 맞히려다 빗나가는 것보다, 상대의 퇴로나 진입로를 잘라 우리 안에 머물게 하는 편이 안정적이다.**[* [미드 베이가 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=118725)] 상대가 이동기를 가진 경우 먼저 쓰지 않고, 진입한 뒤 돌아갈 길을 막으면 생존에도 도움이 된다.

## `W`는 움직일 곳이 줄었을 때 떨어뜨린다

**암흑 물질은 떨어지기까지 시간이 있어 자유롭게 움직이는 상대에게 맞히기 어렵다.** `E`로 공간을 제한하거나 상대가 막타를 치는 위치가 정해진 뒤 사용한다. 아무 근거 없이 `W`를 반복하면 마나가 줄고 웨이브만 밀린다.

## 초반에는 킬보다 안전한 성장을 우선한다

**견제 한 번을 위해 `Q` 막타와 좋은 라인 위치를 동시에 잃지 않는다.** 상대가 기술을 미니언에 사용했을 때만 짧게 압박하고, 위협적인 진입기가 남아 있으면 `E`를 보존한 채 포탑 쪽에서 성장한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-veigar-20260913');

-- 벡스 (917자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-vex-20260913', 'article', '벡스', '벡스', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 공포는 기술이 아니라 자원으로 관리한다 · E로 움직임을 늦춘 뒤 Q를 잇는다 · W는 다가오는 상대에게 남긴다

## 공포는 기술이 아니라 자원으로 관리한다

**파멸 중첩이 준비된 상태에서 스킬을 웨이브에 쓰면 잠시 돌진을 끊을 수단이 사라진다.**[* [벡스 라인전 및 교전 상세 팁](https://www.inven.co.kr/board/lol/3370/548883)] 상대가 들어올 수 있는 구도에서는 라인 정리를 조금 늦추더라도 공포를 보유한다. 안전하게 밀 수 있거나 상대 이동기가 빠졌을 때만 웨이브에 사용한다.

## `E`로 움직임을 늦춘 뒤 `Q`를 잇는다

**커지는 어둠은 범위를 만들고 상대를 둔화해 다음 `Q`를 맞히기 쉽게 한다.**[* [미드 벡스 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147487)] 상대가 막타를 치는 자리에 `E`를 놓고 이동 방향을 본 뒤 `Q`를 보내면 단독 `Q`보다 안정적이다. 두 기술이 모두 빗나가면 앞으로 걸어 추가 공격을 시도하지 않는다.

## `W`는 다가오는 상대에게 남긴다

**거리 유지가 필요한 벡스에게 `W`의 보호막과 주변 피해는 중요한 방어 수단이다.** 돌진형 상대가 있는 라인에서 단순 막타나 작은 견제에 쓰지 않고, 상대가 몸 안쪽으로 들어오는 순간 공포와 함께 끊는 용도로 사용한다.

## 긴 사거리 상대에게는 라인 안에서 억지로 싸우지 않는다

**더 먼 거리에서 웨이브와 체력을 동시에 압박하는 상대에게 계속 정면 교환을 걸면 손해가 누적된다.** 안전한 순간에 라인을 정리하고 시야 밖으로 사라져 정글러와 움직이면 벡스의 진입 위협을 살릴 수 있다. 궁극기가 맞아도 불리한 위치라면 재사용하지 않는다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-vex-20260913' OR (kind = 'article' AND title_key = '벡스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-vex-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-vex-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 공포는 기술이 아니라 자원으로 관리한다 · E로 움직임을 늦춘 뒤 Q를 잇는다 · W는 다가오는 상대에게 남긴다

## 공포는 기술이 아니라 자원으로 관리한다

**파멸 중첩이 준비된 상태에서 스킬을 웨이브에 쓰면 잠시 돌진을 끊을 수단이 사라진다.**[* [벡스 라인전 및 교전 상세 팁](https://www.inven.co.kr/board/lol/3370/548883)] 상대가 들어올 수 있는 구도에서는 라인 정리를 조금 늦추더라도 공포를 보유한다. 안전하게 밀 수 있거나 상대 이동기가 빠졌을 때만 웨이브에 사용한다.

## `E`로 움직임을 늦춘 뒤 `Q`를 잇는다

**커지는 어둠은 범위를 만들고 상대를 둔화해 다음 `Q`를 맞히기 쉽게 한다.**[* [미드 벡스 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=147487)] 상대가 막타를 치는 자리에 `E`를 놓고 이동 방향을 본 뒤 `Q`를 보내면 단독 `Q`보다 안정적이다. 두 기술이 모두 빗나가면 앞으로 걸어 추가 공격을 시도하지 않는다.

## `W`는 다가오는 상대에게 남긴다

**거리 유지가 필요한 벡스에게 `W`의 보호막과 주변 피해는 중요한 방어 수단이다.** 돌진형 상대가 있는 라인에서 단순 막타나 작은 견제에 쓰지 않고, 상대가 몸 안쪽으로 들어오는 순간 공포와 함께 끊는 용도로 사용한다.

## 긴 사거리 상대에게는 라인 안에서 억지로 싸우지 않는다

**더 먼 거리에서 웨이브와 체력을 동시에 압박하는 상대에게 계속 정면 교환을 걸면 손해가 누적된다.** 안전한 순간에 라인을 정리하고 시야 밖으로 사라져 정글러와 움직이면 벡스의 진입 위협을 살릴 수 있다. 궁극기가 맞아도 불리한 위치라면 재사용하지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-vex-20260913');

-- 카시오페아 (947자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-cassiopeia-20260913', 'article', '카시오페아', '카시오페아', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — Q를 맞힌 뒤에 E를 반복한다 · W는 현재 위치보다 도착할 길에 깐다 · E 막타로 라인 유지 비용을 줄인다

## `Q`를 맞힌 뒤에 `E`를 반복한다

**쌍독니는 중독된 대상에게 사용할 때 비로소 강한 지속 피해와 회복을 만든다.**[* [카시오페아의 모든 것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141308)] `Q`가 빗나갔는데도 `E`를 연속으로 쓰면 마나만 빠지고 상대의 반격 시간을 길게 준다. 상대가 막타를 치는 순간 `Q`를 노리고, 적중을 확인한 뒤 앞으로 움직일지 결정한다.

## `W`는 현재 위치보다 도착할 길에 깐다

**독기의 늪은 상대를 둔화하고 이동기를 막지만 이미 벗어나는 적의 뒤에 쓰면 의미가 적다.**[* [카시오페아 1000게임 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142456&vtype=pc)] 돌진한 상대의 퇴로나 자신에게 접근하는 길목에 놓아 움직임을 제한한다. 좁은 강가 입구와 미니언 옆길처럼 피할 방향이 적은 곳에서 특히 안정적이다.

## `E` 막타로 라인 유지 비용을 줄인다

**쌍독니로 미니언을 처치하면 마나를 돌려받는다.** 평타와 `E`의 피해를 익혀 막타에 사용하면 라인을 유지하기 쉽다. 모든 미니언에 독을 묻혀 빠르게 밀기보다, 상대 정글러 위치가 보이지 않을 때는 라인이 아군 쪽에 남도록 조절한다.

## 궁극기는 기절하지 않아도 거리를 벌 수 있다

**정면을 보는 적은 기절하지만 등을 돌린 적에게도 둔화가 걸린다.** 완벽한 정면 기절만 기다리다 죽기보다, 상대가 달라붙었을 때 즉시 공간을 만들고 `W`와 `Q`를 이어가는 판단도 필요하다. 여러 방향에서 적이 오는 위치는 피한다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-cassiopeia-20260913' OR (kind = 'article' AND title_key = '카시오페아'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-cassiopeia-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-cassiopeia-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q를 맞힌 뒤에 E를 반복한다 · W는 현재 위치보다 도착할 길에 깐다 · E 막타로 라인 유지 비용을 줄인다

## `Q`를 맞힌 뒤에 `E`를 반복한다

**쌍독니는 중독된 대상에게 사용할 때 비로소 강한 지속 피해와 회복을 만든다.**[* [카시오페아의 모든 것](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=141308)] `Q`가 빗나갔는데도 `E`를 연속으로 쓰면 마나만 빠지고 상대의 반격 시간을 길게 준다. 상대가 막타를 치는 순간 `Q`를 노리고, 적중을 확인한 뒤 앞으로 움직일지 결정한다.

## `W`는 현재 위치보다 도착할 길에 깐다

**독기의 늪은 상대를 둔화하고 이동기를 막지만 이미 벗어나는 적의 뒤에 쓰면 의미가 적다.**[* [카시오페아 1000게임 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142456&vtype=pc)] 돌진한 상대의 퇴로나 자신에게 접근하는 길목에 놓아 움직임을 제한한다. 좁은 강가 입구와 미니언 옆길처럼 피할 방향이 적은 곳에서 특히 안정적이다.

## `E` 막타로 라인 유지 비용을 줄인다

**쌍독니로 미니언을 처치하면 마나를 돌려받는다.** 평타와 `E`의 피해를 익혀 막타에 사용하면 라인을 유지하기 쉽다. 모든 미니언에 독을 묻혀 빠르게 밀기보다, 상대 정글러 위치가 보이지 않을 때는 라인이 아군 쪽에 남도록 조절한다.

## 궁극기는 기절하지 않아도 거리를 벌 수 있다

**정면을 보는 적은 기절하지만 등을 돌린 적에게도 둔화가 걸린다.** 완벽한 정면 기절만 기다리다 죽기보다, 상대가 달라붙었을 때 즉시 공간을 만들고 `W`와 `Q`를 이어가는 판단도 필요하다. 여러 방향에서 적이 오는 위치는 피한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-cassiopeia-20260913');

-- 탈리야 (982자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-taliyah-20260913', 'article', '탈리야', '탈리야', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 움직이며 쓰되 미니언에 막히는 각을 계산한다 · 돌진 경로에는 E를 먼저 놓는다 · 기본 연계는 E로 길을 만들고 W로 밀어 넣는다

## `Q`는 움직이며 쓰되 미니언에 막히는 각을 계산한다

**파편 난사 중에도 자유롭게 움직일 수 있지만, 바위는 앞의 대상에 먼저 닿는다.**[* [미드 탈리야 정석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=129711&vtype=pc)] 상대가 미니언 뒤에 있으면 정면에서 전부 던지지 말고 웨이브 옆으로 각도를 만들거나 체력이 낮은 미니언이 사라지는 순간을 노린다. 시야가 없는 쪽으로 옆걸음하지 않는다.

## 돌진 경로에는 `E`를 먼저 놓는다

**대지의 파동 위로 상대가 돌진하거나 밀려나면 바위가 폭발해 기절한다.**[* [도파 트페 공략의 탈리야 상대 분석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143990&vtype=pc)] 이동기가 있는 상대에게 `W`부터 맞히려 하기보다 진입 예상 경로에 `E`를 깔아 선택지를 줄인다. 상대가 밭을 피하려 멈추거나 돌아갈 때 `Q`를 맞히기 쉬워진다.

## 기본 연계는 `E`로 길을 만들고 `W`로 밀어 넣는다

**움직이는 상대에게 `W`를 먼저 맞히고 뒤늦게 `E`를 까는 방식은 실패하기 쉽다.** `E`로 둔화와 위험 구역을 만든 뒤, 상대가 빠질 방향을 예상해 `W`로 그 안에 밀어 넣는 편이 안정적이다. `W`가 빗나가면 `Q`까지 무리하게 쫓아가지 않는다.

## 라인을 민 뒤에만 벽과 이동 속도를 활용한다

**탈리야는 웨이브를 정리하고 벽을 따라 먼저 움직일 때 강하다.** 미니언이 남아 있는데 시야에서 사라지면 로밍이 실패했을 때 손해가 크다. 먼저 웨이브를 포탑에 넣고 정글러 위치를 확인한 뒤 강가로 움직인다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-taliyah-20260913' OR (kind = 'article' AND title_key = '탈리야'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-taliyah-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-taliyah-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 움직이며 쓰되 미니언에 막히는 각을 계산한다 · 돌진 경로에는 E를 먼저 놓는다 · 기본 연계는 E로 길을 만들고 W로 밀어 넣는다

## `Q`는 움직이며 쓰되 미니언에 막히는 각을 계산한다

**파편 난사 중에도 자유롭게 움직일 수 있지만, 바위는 앞의 대상에 먼저 닿는다.**[* [미드 탈리야 정석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=129711&vtype=pc)] 상대가 미니언 뒤에 있으면 정면에서 전부 던지지 말고 웨이브 옆으로 각도를 만들거나 체력이 낮은 미니언이 사라지는 순간을 노린다. 시야가 없는 쪽으로 옆걸음하지 않는다.

## 돌진 경로에는 `E`를 먼저 놓는다

**대지의 파동 위로 상대가 돌진하거나 밀려나면 바위가 폭발해 기절한다.**[* [도파 트페 공략의 탈리야 상대 분석](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=143990&vtype=pc)] 이동기가 있는 상대에게 `W`부터 맞히려 하기보다 진입 예상 경로에 `E`를 깔아 선택지를 줄인다. 상대가 밭을 피하려 멈추거나 돌아갈 때 `Q`를 맞히기 쉬워진다.

## 기본 연계는 `E`로 길을 만들고 `W`로 밀어 넣는다

**움직이는 상대에게 `W`를 먼저 맞히고 뒤늦게 `E`를 까는 방식은 실패하기 쉽다.** `E`로 둔화와 위험 구역을 만든 뒤, 상대가 빠질 방향을 예상해 `W`로 그 안에 밀어 넣는 편이 안정적이다. `W`가 빗나가면 `Q`까지 무리하게 쫓아가지 않는다.

## 라인을 민 뒤에만 벽과 이동 속도를 활용한다

**탈리야는 웨이브를 정리하고 벽을 따라 먼저 움직일 때 강하다.** 미니언이 남아 있는데 시야에서 사라지면 로밍이 실패했을 때 손해가 크다. 먼저 웨이브를 포탑에 넣고 정글러 위치를 확인한 뒤 강가로 움직인다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-taliyah-20260913');

-- 애니 (850자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-annie-20260913', 'article', '애니', '애니', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — Q 막타로 마나와 기절 중첩을 함께 관리한다 · 세 중첩에서 E로 기절을 숨긴다 · 긴 기본 공격 사거리는 상대 기술이 빠졌을 때 활용한다

## `Q` 막타로 마나와 기절 중첩을 함께 관리한다

**붕괴로 미니언을 처치하면 사용한 마나를 돌려받는다.**[* [마스터 티어 애니 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145212)] 평타로 체력을 맞춘 뒤 `Q`로 막타를 챙기면 큰 비용 없이 방화광 중첩을 쌓을 수 있다. 상대를 맞히기 위해 `Q`를 남발해 막타와 마나를 동시에 잃지 않는다.

## 세 중첩에서 `E`로 기절을 숨긴다

**기절이 완전히 준비된 상태로 오래 서 있으면 상대는 거리를 벌린다.** 세 중첩을 유지하다 상대가 막타를 치러 들어오는 순간 `E`를 사용해 네 번째 중첩을 만들면 갑자기 기절 위협을 만들 수 있다. 다만 `E`가 필요한 생존 상황이라면 이 공격에 먼저 소모하지 않는다.

## 긴 기본 공격 사거리는 상대 기술이 빠졌을 때 활용한다

**애니는 기본 공격으로 견제하기 좋지만, 적 챔피언을 때리면 미니언 어그로가 붙는다.** 상대의 핵심 기술이 빠진 순간 한 대를 치고 즉시 뒤로 빠져 어그로를 끊는다. 한 번 더 치려고 웨이브 안에 남으면 받은 피해가 더 커질 수 있다.

## 사거리가 긴 상대에게 억지로 먼저 걸지 않는다

**애니보다 긴 거리에서 견제하는 상대에게 정면으로 걸어가면 체력을 잃고 시작한다.** 기절을 보유한 채 미니언을 챙기고, 상대가 라인 정리 기술을 쓴 순간이나 정글러가 도착했을 때 확정 제어를 연결한다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-annie-20260913' OR (kind = 'article' AND title_key = '애니'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-annie-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-annie-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q 막타로 마나와 기절 중첩을 함께 관리한다 · 세 중첩에서 E로 기절을 숨긴다 · 긴 기본 공격 사거리는 상대 기술이 빠졌을 때 활용한다

## `Q` 막타로 마나와 기절 중첩을 함께 관리한다

**붕괴로 미니언을 처치하면 사용한 마나를 돌려받는다.**[* [마스터 티어 애니 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=145212)] 평타로 체력을 맞춘 뒤 `Q`로 막타를 챙기면 큰 비용 없이 방화광 중첩을 쌓을 수 있다. 상대를 맞히기 위해 `Q`를 남발해 막타와 마나를 동시에 잃지 않는다.

## 세 중첩에서 `E`로 기절을 숨긴다

**기절이 완전히 준비된 상태로 오래 서 있으면 상대는 거리를 벌린다.** 세 중첩을 유지하다 상대가 막타를 치러 들어오는 순간 `E`를 사용해 네 번째 중첩을 만들면 갑자기 기절 위협을 만들 수 있다. 다만 `E`가 필요한 생존 상황이라면 이 공격에 먼저 소모하지 않는다.

## 긴 기본 공격 사거리는 상대 기술이 빠졌을 때 활용한다

**애니는 기본 공격으로 견제하기 좋지만, 적 챔피언을 때리면 미니언 어그로가 붙는다.** 상대의 핵심 기술이 빠진 순간 한 대를 치고 즉시 뒤로 빠져 어그로를 끊는다. 한 번 더 치려고 웨이브 안에 남으면 받은 피해가 더 커질 수 있다.

## 사거리가 긴 상대에게 억지로 먼저 걸지 않는다

**애니보다 긴 거리에서 견제하는 상대에게 정면으로 걸어가면 체력을 잃고 시작한다.** 기절을 보유한 채 미니언을 챙기고, 상대가 라인 정리 기술을 쓴 순간이나 정글러가 도착했을 때 확정 제어를 연결한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-annie-20260913');

-- 아우렐리온 솔 (991자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-aurelionsol-20260913', 'article', '아우렐리온 솔', '아우렐리온솔', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 라인 정리와 챔피언 견제를 한 번에 욕심내지 않는다 · Q 정신 집중은 상대 핵심 기술이 빠진 뒤에 한다 · 앞 W는 견제가 아니라 맞대결을 여는 선택이다

## 라인 정리와 챔피언 견제를 한 번에 욕심내지 않는다

**아우렐리온 솔은 `Q`를 미니언에 쓰는 동안 같은 기술로 상대를 견제하기 어렵다.**[* [아우솔 라인전 상대법 및 라인전 개념](https://www.inven.co.kr/board/lol/3370/568546?my=chu)] 상대와 웨이브를 억지로 한 줄에 세우려다 앞으로 나가기보다, 라인을 정리할지 체력을 압박할지 먼저 고른다. 상대가 두 일을 동시에 하는 기술로 압박하면 미니언을 우선 챙긴다.

## `Q` 정신 집중은 상대 핵심 기술이 빠진 뒤에 한다

**빛의 숨결을 오래 유지하는 동안 아우렐리온 솔은 자리에 멈춰 표적이 된다.**[* [아우렐리온 솔 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=130)] 상대의 제어기나 강한 견제기가 남아 있을 때 폭발 피해 한 번을 더 보겠다고 버티지 않는다. 기술이 빠졌거나 `E`로 이동 경로가 제한된 순간에만 길게 유지한다.

## 앞 `W`는 견제가 아니라 맞대결을 여는 선택이다

**상대 쪽으로 별의 비행을 쓰며 `Q`를 이어가면 강한 지속 교환이 가능하지만, 짧게 때리고 바로 빠지는 기술은 아니다.** 상대 체력이 충분하거나 제어기가 남았으면 오히려 도착 경로에서 끊긴다. 먼저 원거리에서 체력을 줄이고 상대의 핵심 기술이 빠진 뒤 사용한다.

## 별가루보다 체력과 웨이브를 먼저 지킨다

**`E` 안의 미니언과 `Q` 적중으로 별가루를 얻더라도, 그 과정에서 체력을 크게 잃으면 다음 웨이브를 먹지 못한다.** 위험한 미니언 몇 개는 포기하고 라인을 아군 쪽으로 받아 성장 시간을 확보한다. 초반에 쓰러지지 않는 것이 가장 안정적인 성장 수단이다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-aurelionsol-20260913' OR (kind = 'article' AND title_key = '아우렐리온솔'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-aurelionsol-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-aurelionsol-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 라인 정리와 챔피언 견제를 한 번에 욕심내지 않는다 · Q 정신 집중은 상대 핵심 기술이 빠진 뒤에 한다 · 앞 W는 견제가 아니라 맞대결을 여는 선택이다

## 라인 정리와 챔피언 견제를 한 번에 욕심내지 않는다

**아우렐리온 솔은 `Q`를 미니언에 쓰는 동안 같은 기술로 상대를 견제하기 어렵다.**[* [아우솔 라인전 상대법 및 라인전 개념](https://www.inven.co.kr/board/lol/3370/568546?my=chu)] 상대와 웨이브를 억지로 한 줄에 세우려다 앞으로 나가기보다, 라인을 정리할지 체력을 압박할지 먼저 고른다. 상대가 두 일을 동시에 하는 기술로 압박하면 미니언을 우선 챙긴다.

## `Q` 정신 집중은 상대 핵심 기술이 빠진 뒤에 한다

**빛의 숨결을 오래 유지하는 동안 아우렐리온 솔은 자리에 멈춰 표적이 된다.**[* [아우렐리온 솔 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=130)] 상대의 제어기나 강한 견제기가 남아 있을 때 폭발 피해 한 번을 더 보겠다고 버티지 않는다. 기술이 빠졌거나 `E`로 이동 경로가 제한된 순간에만 길게 유지한다.

## 앞 `W`는 견제가 아니라 맞대결을 여는 선택이다

**상대 쪽으로 별의 비행을 쓰며 `Q`를 이어가면 강한 지속 교환이 가능하지만, 짧게 때리고 바로 빠지는 기술은 아니다.** 상대 체력이 충분하거나 제어기가 남았으면 오히려 도착 경로에서 끊긴다. 먼저 원거리에서 체력을 줄이고 상대의 핵심 기술이 빠진 뒤 사용한다.

## 별가루보다 체력과 웨이브를 먼저 지킨다

**`E` 안의 미니언과 `Q` 적중으로 별가루를 얻더라도, 그 과정에서 체력을 크게 잃으면 다음 웨이브를 먹지 못한다.** 위험한 미니언 몇 개는 포기하고 라인을 아군 쪽으로 받아 성장 시간을 확보한다. 초반에 쓰러지지 않는 것이 가장 안정적인 성장 수단이다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-aurelionsol-20260913');

-- 흐웨이 (996자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-hwei-20260913', 'article', '흐웨이', '흐웨이', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 파멸 기술을 라인에 쓰면 잠시 견제도 사라진다 · 고통 계열은 생존 자원으로 남긴다 · `WE`는 안전한 막타와 함께 회수한다

## 파멸 기술을 라인에 쓰면 잠시 견제도 사라진다

**흐웨이의 세 파멸 기술은 같은 계열의 재사용 대기시간을 공유한다.**[* [흐웨이 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148025)] `QE`로 웨이브를 정리한 직후에는 `QQ`로 상대를 때릴 수 없으므로, 라인을 밀 목적과 체력을 깎을 목적을 한 번의 선택으로 구분한다. 상대가 막타를 치는 순간 두 목적이 겹칠 때만 함께 노린다.

## 고통 계열은 생존 자원으로 남긴다

**`EQ`의 공포, `EW`의 감시와 속박, `EE`의 끌어당김은 모두 같은 계열이다.**[* [흐웨이 연구 제대로 했다](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148026&vtype=pc)] 돌진형 상대가 들어올 수 있는데 원거리 견제용으로 하나를 먼저 쓰면 나머지도 사용할 수 없다. 정면으로 달려오는 적에게는 `EQ`, 좁은 진입로나 수풀 확인에는 `EW`, 여러 대상의 경로를 모을 때는 `EE`처럼 상황을 먼저 정한다.

## `WE`는 안전한 막타와 함께 회수한다

**요동치는 빛은 다음 기본 공격이나 스킬에 추가 피해를 주고 적중 시 마나를 돌려준다.** 활성화만 하고 물러나면 마나 회복을 충분히 받지 못한다. 안전하게 칠 수 있는 미니언과 상대 위치를 확인한 뒤 사용해 세 번의 적중을 차분히 소비한다.

## 긴 사거리만 믿고 제어기를 함께 소모하지 않는다

**흐웨이는 멀리서 라인을 건드릴 수 있지만 이동기가 없다.** 파멸과 고통 기술을 한 번에 빗맞히면 상대가 들어오는 동안 막을 방법이 적다. 첫 제어가 빗나가면 추가 기술을 억지로 잇지 않고 거리를 다시 만든다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-hwei-20260913' OR (kind = 'article' AND title_key = '흐웨이'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-hwei-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-hwei-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 파멸 기술을 라인에 쓰면 잠시 견제도 사라진다 · 고통 계열은 생존 자원으로 남긴다 · `WE`는 안전한 막타와 함께 회수한다

## 파멸 기술을 라인에 쓰면 잠시 견제도 사라진다

**흐웨이의 세 파멸 기술은 같은 계열의 재사용 대기시간을 공유한다.**[* [흐웨이 연구](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148025)] `QE`로 웨이브를 정리한 직후에는 `QQ`로 상대를 때릴 수 없으므로, 라인을 밀 목적과 체력을 깎을 목적을 한 번의 선택으로 구분한다. 상대가 막타를 치는 순간 두 목적이 겹칠 때만 함께 노린다.

## 고통 계열은 생존 자원으로 남긴다

**`EQ`의 공포, `EW`의 감시와 속박, `EE`의 끌어당김은 모두 같은 계열이다.**[* [흐웨이 연구 제대로 했다](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=148026&vtype=pc)] 돌진형 상대가 들어올 수 있는데 원거리 견제용으로 하나를 먼저 쓰면 나머지도 사용할 수 없다. 정면으로 달려오는 적에게는 `EQ`, 좁은 진입로나 수풀 확인에는 `EW`, 여러 대상의 경로를 모을 때는 `EE`처럼 상황을 먼저 정한다.

## `WE`는 안전한 막타와 함께 회수한다

**요동치는 빛은 다음 기본 공격이나 스킬에 추가 피해를 주고 적중 시 마나를 돌려준다.** 활성화만 하고 물러나면 마나 회복을 충분히 받지 못한다. 안전하게 칠 수 있는 미니언과 상대 위치를 확인한 뒤 사용해 세 번의 적중을 차분히 소비한다.

## 긴 사거리만 믿고 제어기를 함께 소모하지 않는다

**흐웨이는 멀리서 라인을 건드릴 수 있지만 이동기가 없다.** 파멸과 고통 기술을 한 번에 빗맞히면 상대가 들어오는 동안 막을 방법이 적다. 첫 제어가 빗나가면 추가 기술을 억지로 잇지 않고 거리를 다시 만든다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-hwei-20260913');

-- 리산드라 (994자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-lissandra-20260913', 'article', '리산드라', '리산드라', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 앞의 미니언을 이용해 사거리를 늘린다 · E를 던졌다고 반드시 따라갈 필요는 없다 · W와 궁극기의 제어 시간을 겹치지 않는다

## `Q`는 앞의 미니언을 이용해 사거리를 늘린다

**얼음 파편은 첫 대상에 맞은 뒤 뒤쪽으로 갈라져 나간다.**[* [리산드라 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142572&vtype=pc)] 상대가 미니언 뒤에서 막타를 치는 순간 앞 미니언에 `Q`를 맞히면 직접 던질 때보다 먼 거리에서 견제할 수 있다. 라인을 당기고 싶다면 광역 파편이 여러 미니언을 건드리지 않도록 각도를 좁힌다.

## `E`를 던졌다고 반드시 따라갈 필요는 없다

**얼음갈퀴 길은 이동이 느리고 재사용할 때 현재 위치로 순간이동한다.**[* [미드 리산드라 기본 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109060&vtype=pc)] 먼저 던져 상대가 뒤로 빠지게 한 뒤 라인을 밀거나 정글러를 기다리는 것만으로도 이득이다. 적 정글러가 보이지 않거나 상대 제어기가 남아 있으면 끝까지 보내고도 이동하지 않는다.

## `W`와 궁극기의 제어 시간을 겹치지 않는다

**정글러와 상대를 잡을 때 `W`와 적 대상 궁극기를 동시에 쓰면 제어 시간 일부가 낭비된다.** 첫 속박이 끝날 즈음 다음 기절을 이어 상대가 움직이지 못하는 시간을 늘린다. 급하게 자신을 지켜야 하면 적에게 궁을 쓰는 것보다 자신에게 사용해 시간을 버는 선택도 있다.

## 광역기로 라인이 저절로 밀리는 것을 계산한다

**`Q`, `W`, `E`가 여러 미니언을 건드리기 쉬워 짧은 견제도 웨이브를 밀 수 있다.** 로밍하려면 빠르게 끝까지 밀고 움직이고, 정글러 갱을 받으려면 챔피언만 맞는 `Q` 각을 사용해 라인이 아군 쪽에 남도록 한다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-lissandra-20260913' OR (kind = 'article' AND title_key = '리산드라'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-lissandra-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-lissandra-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — Q는 앞의 미니언을 이용해 사거리를 늘린다 · E를 던졌다고 반드시 따라갈 필요는 없다 · W와 궁극기의 제어 시간을 겹치지 않는다

## `Q`는 앞의 미니언을 이용해 사거리를 늘린다

**얼음 파편은 첫 대상에 맞은 뒤 뒤쪽으로 갈라져 나간다.**[* [리산드라 실전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=142572&vtype=pc)] 상대가 미니언 뒤에서 막타를 치는 순간 앞 미니언에 `Q`를 맞히면 직접 던질 때보다 먼 거리에서 견제할 수 있다. 라인을 당기고 싶다면 광역 파편이 여러 미니언을 건드리지 않도록 각도를 좁힌다.

## `E`를 던졌다고 반드시 따라갈 필요는 없다

**얼음갈퀴 길은 이동이 느리고 재사용할 때 현재 위치로 순간이동한다.**[* [미드 리산드라 기본 가이드](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=109060&vtype=pc)] 먼저 던져 상대가 뒤로 빠지게 한 뒤 라인을 밀거나 정글러를 기다리는 것만으로도 이득이다. 적 정글러가 보이지 않거나 상대 제어기가 남아 있으면 끝까지 보내고도 이동하지 않는다.

## `W`와 궁극기의 제어 시간을 겹치지 않는다

**정글러와 상대를 잡을 때 `W`와 적 대상 궁극기를 동시에 쓰면 제어 시간 일부가 낭비된다.** 첫 속박이 끝날 즈음 다음 기절을 이어 상대가 움직이지 못하는 시간을 늘린다. 급하게 자신을 지켜야 하면 적에게 궁을 쓰는 것보다 자신에게 사용해 시간을 버는 선택도 있다.

## 광역기로 라인이 저절로 밀리는 것을 계산한다

**`Q`, `W`, `E`가 여러 미니언을 건드리기 쉬워 짧은 견제도 웨이브를 밀 수 있다.** 로밍하려면 빠르게 끝까지 밀고 움직이고, 정글러 갱을 받으려면 챔피언만 맞는 `Q` 각을 사용해 라인이 아군 쪽에 남도록 한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-lissandra-20260913');

-- 아지르 (988자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-azir-20260913', 'article', '아지르', '아지르', 'published', NULL, '# 미드 라인 실전 운용

> **한눈에 보기** — 병사를 상대가 막타를 칠 자리에 둔다 · Q는 피해 기술이면서 병사 전체의 위치 변경이다 · 돌진 상대와 병사를 일직선으로 둔다

## 병사를 상대가 막타를 칠 자리에 둔다

**모래 병사는 소환한 위치 주변을 공격한다.**[* [아지르 기본·라인전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139602)] 상대 몸에 바로 붙이기보다 체력이 낮은 미니언 옆에 두면 상대가 막타와 견제 회피 중 하나를 선택하게 만들 수 있다. 병사의 공격은 일직선으로 관통하므로 미니언과 상대를 같은 선에 두는 각을 찾는다.

## `Q`는 피해 기술이면서 병사 전체의 위치 변경이다

**`W`-`Q`-공격은 짧은 견제에 좋지만, `Q`를 사용하면 모든 병사가 이동해 기존 압박 구역과 `E`의 도착점이 바뀐다.**[* [아지르 라인전 콤보와 운영](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144745&vtype=pc)] 상대 이동기가 남았거나 정글러 위치가 보이지 않을 때 `Q`를 먼저 쓰지 않고 병사 기본 공격으로 압박한다. 상대가 물러날 때 마지막으로 `Q`를 사용하면 퇴로를 지키기 쉽다.

## 돌진 상대와 병사를 일직선으로 둔다

**상대가 들어올 때 아지르와 병사 사이에 상대가 놓이도록 서면, 병사 공격을 이어가면서 `E`의 보호막과 충돌 피해도 활용할 수 있다.** 다만 `E`는 적 챔피언과 부딪히면 이동이 멈추므로, 도주 목적으로 쓸 때 적이 경로를 막는지 확인한다.

## 병사 범위 밖까지 추격하지 않는다

**아지르의 강한 지속 피해는 상대가 병사 공격 범위에 머물 때 나온다.** 체력이 조금 남았다고 병사를 뒤에 두고 본체만 앞으로 걸으면 평범한 원거리 챔피언이 된다. 상대가 범위를 벗어나면 라인 주도권과 체력 이득을 챙기고 멈춘다.', 1, '16.17.1', 'guarded', '2026-09-13T00:00:00.000Z', '2026-09-13T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-azir-20260913' OR (kind = 'article' AND title_key = '아지르'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-azir-20260913', id, NULL, 0, general, '미드 챔피언 문서 마크다운 조판 반영', 'accepted', 'user-system', '2026-09-13T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-azir-20260913' AND revision = 1 AND general = '# 미드 라인 실전 운용

> **한눈에 보기** — 병사를 상대가 막타를 칠 자리에 둔다 · Q는 피해 기술이면서 병사 전체의 위치 변경이다 · 돌진 상대와 병사를 일직선으로 둔다

## 병사를 상대가 막타를 칠 자리에 둔다

**모래 병사는 소환한 위치 주변을 공격한다.**[* [아지르 기본·라인전 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=139602)] 상대 몸에 바로 붙이기보다 체력이 낮은 미니언 옆에 두면 상대가 막타와 견제 회피 중 하나를 선택하게 만들 수 있다. 병사의 공격은 일직선으로 관통하므로 미니언과 상대를 같은 선에 두는 각을 찾는다.

## `Q`는 피해 기술이면서 병사 전체의 위치 변경이다

**`W`-`Q`-공격은 짧은 견제에 좋지만, `Q`를 사용하면 모든 병사가 이동해 기존 압박 구역과 `E`의 도착점이 바뀐다.**[* [아지르 라인전 콤보와 운영](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=144745&vtype=pc)] 상대 이동기가 남았거나 정글러 위치가 보이지 않을 때 `Q`를 먼저 쓰지 않고 병사 기본 공격으로 압박한다. 상대가 물러날 때 마지막으로 `Q`를 사용하면 퇴로를 지키기 쉽다.

## 돌진 상대와 병사를 일직선으로 둔다

**상대가 들어올 때 아지르와 병사 사이에 상대가 놓이도록 서면, 병사 공격을 이어가면서 `E`의 보호막과 충돌 피해도 활용할 수 있다.** 다만 `E`는 적 챔피언과 부딪히면 이동이 멈추므로, 도주 목적으로 쓸 때 적이 경로를 막는지 확인한다.

## 병사 범위 밖까지 추격하지 않는다

**아지르의 강한 지속 피해는 상대가 병사 공격 범위에 머물 때 나온다.** 체력이 조금 남았다고 병사를 뒤에 두고 본체만 앞으로 걸으면 평범한 원거리 챔피언이 된다. 상대가 범위를 벗어나면 라인 주도권과 체력 이득을 챙기고 멈춘다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-azir-20260913');

-- 사일러스 (1223자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-sylas-20260912', 'article', '사일러스', '사일러스', 'published', NULL, '# 미드 라인 실전 운용

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

이 글은 인벤 사일러스 공략 게시판과 미드 공략의 스킬 구조·라인 클리어 설명을 참고해, 현재 Data Dragon 스킬 설명과 맞는 내용만 남겼다.[* [사일러스 공략 게시판](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=143)][* [미드 사일러스 설명서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146557)]', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-sylas-20260912' OR (kind = 'article' AND title_key = '사일러스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-sylas-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-sylas-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

이 글은 인벤 사일러스 공략 게시판과 미드 공략의 스킬 구조·라인 클리어 설명을 참고해, 현재 Data Dragon 스킬 설명과 맞는 내용만 남겼다.[* [사일러스 공략 게시판](https://lol.inven.co.kr/dataninfo/champion/manualTool.php?champnum=143)][* [미드 사일러스 설명서](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=146557)]'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-sylas-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-sylas-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-sylas-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-sylas-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-sylas-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-sylas-20260912', NULL, '다이애나', '다이애나' FROM wiki_docs WHERE id = 'doc-ai-champion-sylas-20260912';

-- 요네 (967자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-yone-20260912', 'article', '요네', '요네', 'published', NULL, '# 미드 라인 실전 운용

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

`Q3` 준비와 미니언 돌진 경로를 함께 관리한다는 점은 [[야스오]]와 닮았다. 차이는 요네가 `E`의 복귀점을, 야스오가 `질풍검(E)`에 남겨 둘 미니언을 더 먼저 계산한다는 데 있다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-yone-20260912' OR (kind = 'article' AND title_key = '요네'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-yone-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-yone-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

`Q3` 준비와 미니언 돌진 경로를 함께 관리한다는 점은 [[야스오]]와 닮았다. 차이는 요네가 `E`의 복귀점을, 야스오가 `질풍검(E)`에 남겨 둘 미니언을 더 먼저 계산한다는 데 있다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-yone-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-yone-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-yone-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-yone-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-yone-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-yone-20260912', NULL, '야스오', '야스오' FROM wiki_docs WHERE id = 'doc-ai-champion-yone-20260912';

-- 야스오 (1036자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-yasuo-20260912', 'article', '야스오', '야스오', 'published', NULL, '# 미드 라인 실전 운용

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

미니언을 연속 돌진 경로로 쓰는 [[이렐리아]]를 상대할 때는 낮은 체력 미니언을 내 퇴로로 착각하지 않는다. 이렐리아가 먼저 처치하며 따라올 수 있다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-yasuo-20260912' OR (kind = 'article' AND title_key = '야스오'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-yasuo-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-yasuo-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

미니언을 연속 돌진 경로로 쓰는 [[이렐리아]]를 상대할 때는 낮은 체력 미니언을 내 퇴로로 착각하지 않는다. 이렐리아가 먼저 처치하며 따라올 수 있다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-yasuo-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-yasuo-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-yasuo-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-yasuo-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-yasuo-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-yasuo-20260912', NULL, '이렐리아', '이렐리아' FROM wiki_docs WHERE id = 'doc-ai-champion-yasuo-20260912';

-- 갈리오 (1015자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-galio-20260912', 'article', '갈리오', '갈리오', 'published', NULL, '# 미드 라인 실전 운용

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

[[사일러스]]가 갈리오의 궁극기를 훔칠 수 있는 구도라면 아군만 보고 착지하지 않는다. 사일러스가 같은 범위 싸움을 뒤집을 수 있는지 함께 확인한다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-galio-20260912' OR (kind = 'article' AND title_key = '갈리오'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-galio-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-galio-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

[[사일러스]]가 갈리오의 궁극기를 훔칠 수 있는 구도라면 아군만 보고 착지하지 않는다. 사일러스가 같은 범위 싸움을 뒤집을 수 있는지 함께 확인한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-galio-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-galio-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-galio-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-galio-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-galio-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-galio-20260912', NULL, '사일러스', '사일러스' FROM wiki_docs WHERE id = 'doc-ai-champion-galio-20260912';

-- 에코 (1079자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-ekko-20260912', 'article', '에코', '에코', 'published', NULL, '# 미드 라인 실전 운용

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

[[다이애나]]처럼 한 번에 붙는 챔피언을 상대할 때는 `W`를 내 발밑보다 **상대가 추격해 들어올 한 걸음 뒤**에 두어 재진입을 막는다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-ekko-20260912' OR (kind = 'article' AND title_key = '에코'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-ekko-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-ekko-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

[[다이애나]]처럼 한 번에 붙는 챔피언을 상대할 때는 `W`를 내 발밑보다 **상대가 추격해 들어올 한 걸음 뒤**에 두어 재진입을 막는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-ekko-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-ekko-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-ekko-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-ekko-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-ekko-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-ekko-20260912', NULL, '다이애나', '다이애나' FROM wiki_docs WHERE id = 'doc-ai-champion-ekko-20260912';

-- 다이애나 (1083자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-diana-20260912', 'article', '다이애나', '다이애나', 'published', NULL, '# 미드 라인 실전 운용

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

같은 근접 AP 챔피언인 [[사일러스]]는 낮은 체력에서 회복하며 교환을 늘이고, 다이애나는 보호막과 표식 재사용으로 짧은 시간에 두 번 붙는다. 상대할 때도 둘의 두 번째 진입 조건을 다르게 본다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-diana-20260912' OR (kind = 'article' AND title_key = '다이애나'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-diana-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-diana-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

같은 근접 AP 챔피언인 [[사일러스]]는 낮은 체력에서 회복하며 교환을 늘이고, 다이애나는 보호막과 표식 재사용으로 짧은 시간에 두 번 붙는다. 상대할 때도 둘의 두 번째 진입 조건을 다르게 본다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-diana-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-diana-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-diana-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-diana-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-diana-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-diana-20260912', NULL, '사일러스', '사일러스' FROM wiki_docs WHERE id = 'doc-ai-champion-diana-20260912';

-- 이렐리아 (1015자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-irelia-20260912', 'article', '이렐리아', '이렐리아', 'published', NULL, '# 미드 라인 실전 운용

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

[[야스오]]와 맞붙을 때 E와 궁극기 중 어느 투사체에 장막을 쓰게 할지 나눠 생각한다. 장막이 빠진 뒤 다음 표식을 노리는 편이 한 번에 모든 스킬을 던지는 것보다 안전하다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-irelia-20260912' OR (kind = 'article' AND title_key = '이렐리아'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-irelia-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-irelia-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

[[야스오]]와 맞붙을 때 E와 궁극기 중 어느 투사체에 장막을 쓰게 할지 나눠 생각한다. 장막이 빠진 뒤 다음 표식을 노리는 편이 한 번에 모든 스킬을 던지는 것보다 안전하다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-irelia-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-irelia-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-irelia-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-irelia-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-irelia-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-irelia-20260912', NULL, '야스오', '야스오' FROM wiki_docs WHERE id = 'doc-ai-champion-irelia-20260912';

-- 코르키 (1041자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-corki-20260912', 'article', '코르키', '코르키', 'published', NULL, '# 미드 라인 실전 운용

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

[[스몰더]]와 달리 코르키는 Q 막타로 영구 중첩을 모으지 않는다. 성장 욕심 때문에 라인을 오래 붙잡기보다, 빠르게 민 뒤 안전한 위치에서 다음 웨이브를 기다리는 것이 낫다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-corki-20260912' OR (kind = 'article' AND title_key = '코르키'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-corki-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-corki-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

[[스몰더]]와 달리 코르키는 Q 막타로 영구 중첩을 모으지 않는다. 성장 욕심 때문에 라인을 오래 붙잡기보다, 빠르게 민 뒤 안전한 위치에서 다음 웨이브를 기다리는 것이 낫다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-corki-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-corki-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-corki-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-corki-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-corki-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-corki-20260912', NULL, '스몰더', '스몰더' FROM wiki_docs WHERE id = 'doc-ai-champion-corki-20260912';

-- 제이스 (998자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-jayce-20260912', 'article', '제이스', '제이스', 'published', NULL, '# 미드 라인 실전 운용

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

[[사이온]]의 Q 충전은 해머 E로 끊거나 밀어낼 수 있지만, 이미 사거리 밖이라면 캐논 견제를 유지한다. 끊겠다고 먼저 들어가 다른 스킬을 전부 맞지 않는다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-jayce-20260912' OR (kind = 'article' AND title_key = '제이스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-jayce-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-jayce-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

[[사이온]]의 Q 충전은 해머 E로 끊거나 밀어낼 수 있지만, 이미 사거리 밖이라면 캐논 견제를 유지한다. 끊겠다고 먼저 들어가 다른 스킬을 전부 맞지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-jayce-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-jayce-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-jayce-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-jayce-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-jayce-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-jayce-20260912', NULL, '사이온', '사이온' FROM wiki_docs WHERE id = 'doc-ai-champion-jayce-20260912';

-- 스몰더 (1011자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-smolder-20260912', 'article', '스몰더', '스몰더', 'published', NULL, '# 미드 라인 실전 운용

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

[[코르키]]는 미사일을 저장해 순간 압박을 만들고, 스몰더는 Q 사용마다 미래의 힘을 쌓는다. 둘 다 원거리라고 같은 속도로 웨이브를 지우면 스몰더가 챙길 Q 막타가 사라질 수 있다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-smolder-20260912' OR (kind = 'article' AND title_key = '스몰더'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-smolder-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-smolder-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

[[코르키]]는 미사일을 저장해 순간 압박을 만들고, 스몰더는 Q 사용마다 미래의 힘을 쌓는다. 둘 다 원거리라고 같은 속도로 웨이브를 지우면 스몰더가 챙길 Q 막타가 사라질 수 있다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-smolder-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-smolder-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-smolder-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-smolder-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-smolder-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-smolder-20260912', NULL, '코르키', '코르키' FROM wiki_docs WHERE id = 'doc-ai-champion-smolder-20260912';

-- 트리스타나 (1029자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-tristana-20260912', 'article', '트리스타나', '트리스타나', 'published', NULL, '# 미드 라인 실전 운용

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

[[아크샨]]처럼 낮은 레벨부터 기본 공격 중첩으로 압박하지만, 트리스타나는 앞으로 점프한 뒤 돌아올 벽 기술이 없다. 같은 킬각이라도 정글 위치 확인을 더 엄격하게 한다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-tristana-20260912' OR (kind = 'article' AND title_key = '트리스타나'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-tristana-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-tristana-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

[[아크샨]]처럼 낮은 레벨부터 기본 공격 중첩으로 압박하지만, 트리스타나는 앞으로 점프한 뒤 돌아올 벽 기술이 없다. 같은 킬각이라도 정글 위치 확인을 더 엄격하게 한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-tristana-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-tristana-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-tristana-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-tristana-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-tristana-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-tristana-20260912', NULL, '아크샨', '아크샨' FROM wiki_docs WHERE id = 'doc-ai-champion-tristana-20260912';

-- 아크샨 (1028자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-akshan-20260912', 'article', '아크샨', '아크샨', 'published', NULL, '# 미드 라인 실전 운용

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

[[트리스타나]]와 맞라인에서는 서로 낮은 레벨부터 강하다. 트리스타나가 E를 붙였을 때 갈고리로 큰 원을 돌려 시간을 끌 수 있는지, 충돌할 미니언이 많은지를 먼저 본다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-akshan-20260912' OR (kind = 'article' AND title_key = '아크샨'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-akshan-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-akshan-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

[[트리스타나]]와 맞라인에서는 서로 낮은 레벨부터 강하다. 트리스타나가 E를 붙였을 때 갈고리로 큰 원을 돌려 시간을 끌 수 있는지, 충돌할 미니언이 많은지를 먼저 본다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-akshan-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-akshan-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-akshan-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-akshan-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-akshan-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-akshan-20260912', NULL, '트리스타나', '트리스타나' FROM wiki_docs WHERE id = 'doc-ai-champion-akshan-20260912';

-- 로크 (1164자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-locke-20260912', 'article', '로크', '로크', 'published', NULL, '# 미드 라인 실전 운용

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

[[아크샨]]처럼 기본 공격을 이어야 기술의 가치가 완성되는 원거리 챔피언이다. 다만 아크샨은 두 번째 탄을 취소해 이동하고, 로크는 W가 자기 체력을 소모하므로 같은 거리에서도 교환 비용이 다르다.', 1, '16.17.1', 'guarded', '2026-09-12T00:00:00.000Z', '2026-09-12T00:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-locke-20260912' OR (kind = 'article' AND title_key = '로크'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-locke-20260912', id, NULL, 0, general, '미드 챔피언 실전 운용 원고 작성', 'accepted', 'user-system', '2026-09-12T00:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-locke-20260912' AND revision = 1 AND general = '# 미드 라인 실전 운용

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

[[아크샨]]처럼 기본 공격을 이어야 기술의 가치가 완성되는 원거리 챔피언이다. 다만 아크샨은 두 번째 탄을 취소해 이동하고, 로크는 W가 자기 체력을 소모하므로 같은 거리에서도 교환 비용이 다르다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-locke-20260912');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-locke-20260912', NULL, '분류:미드', '분류:미드' FROM wiki_docs WHERE id = 'doc-ai-champion-locke-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-locke-20260912', NULL, '분류:브루저/원딜', '분류:브루저/원딜' FROM wiki_docs WHERE id = 'doc-ai-champion-locke-20260912';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-locke-20260912', NULL, '아크샨', '아크샨' FROM wiki_docs WHERE id = 'doc-ai-champion-locke-20260912';

-- 오른 (1133자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-ornn-20260913', 'article', '오른', '오른', 'published', NULL, '# 탑 라인 실전 운용

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
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-ornn-20260913' OR (kind = 'article' AND title_key = '오른'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-ornn-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-ornn-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-ornn-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-ornn-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-ornn-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-ornn-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-ornn-20260913';

-- 말파이트 (1089자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-malphite-20260913', 'article', '말파이트', '말파이트', 'published', NULL, '# 탑 라인 실전 운용

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
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-malphite-20260913' OR (kind = 'article' AND title_key = '말파이트'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-malphite-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-malphite-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-malphite-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-malphite-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-malphite-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-malphite-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-malphite-20260913';

-- 쉔 (1082자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-shen-20260913', 'article', '쉔', '쉔', 'published', NULL, '# 탑 라인 실전 운용

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
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-shen-20260913' OR (kind = 'article' AND title_key = '쉔'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-shen-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-shen-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-shen-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-shen-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-shen-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-shen-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-shen-20260913';

-- 크산테 (1113자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-ksante-20260913', 'article', '크산테', '크산테', 'published', NULL, '# 탑 라인 실전 운용

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
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-ksante-20260913' OR (kind = 'article' AND title_key = '크산테'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-ksante-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-ksante-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-ksante-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-ksante-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-ksante-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-ksante-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-ksante-20260913';

-- 사이온 (1084자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-sion-20260913', 'article', '사이온', '사이온', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`는 적중보다 이동을 강요한다 · 낮은 체력 미니언은 `E` 투사체다 · 궁극기 출발 전에 도착할 웨이브를 계산한다

[[분류:탑]] [[분류:탱커]]

## `Q`는 오래 모으는 기술이 아니라 길을 닫는 기술이다

**`대량 학살 강타(Q)`를 끝까지 맞히는 것보다 상대가 피할 방향을 제한하는 일이 먼저다.**[* [M1 탑사이온 공략](https://lol.inven.co.kr/dataninfo/champion/manualToolView.php?idx=114749&vtype=pc)] 시야가 열린 중앙에서는 짧게 끊어 피해와 막타를 확정하고, 수풀이나 `E` 둔화 뒤에만 길게 모은다. 상대가 범위를 벗어나느라 CS를 포기했다면 이미 이득이므로 끝까지 추격해 내 위치를 망치지 않는다.

## 낮은 체력 미니언으로 교환을 시작한다

**`학살자의 포효(E)`가 미니언을 밀어내면 뒤의 상대까지 둔화하고 방어력을 낮춘다.**[* [사이온 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=57)] 상대가 자기 미니언 뒤에 숨는 순간, 체력이 낮고 진행선이 곧은 미니언을 고른다. `E`가 맞으면 퇴로에 `Q`를 놓고, 빗나가면 마나를 더 쓰지 않고 다음 웨이브를 기다린다.

## `W`는 보호막과 폭발을 모두 쓸 거리에서 켠다

**`영혼의 용광로(W)`는 미니언 처치로 최대 체력을 쌓고, 사용 시 보호막 뒤 범위 피해를 만든다.** 멀리서 견제 하나만 막으려고 켜면 폭발을 쓰지 못한다. 서로 막타를 먹으러 가까워지기 직전에 켜고, 보호막이 깨지기 전에 상대와 미니언에 폭발을 함께 맞힐 자리를 잡는다.

## 궁극기와 사망 후 시간을 공짜로 보지 않는다

**`멈출 수 없는 맹공(R)`으로 복귀하거나 다른 라인에 합류하기 전, 출발하는 웨이브와 도착 후 돌아올 방법을 본다.** 실패한 장거리 궁은 탑 경험치까지 잃는다. 죽은 뒤 패시브로 웨이브를 정리할 수 있어도 **죽음을 먼저 선택하는 운영은 상대에게 처치 보상과 다음 움직임을 함께 준다.** 살아서 앞선을 만들 수 있다면 그쪽이 우선이다.', 1, '16.17.1', 'guarded', '2026-09-13T06:00:00.000Z', '2026-09-13T06:00:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-sion-20260913' OR (kind = 'article' AND title_key = '사이온'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-sion-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-sion-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-sion-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-sion-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-sion-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-sion-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-sion-20260913';

-- 초가스 (1016자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-chogath-20260913', 'article', '초가스', '초가스', 'published', NULL, '# 탑 라인 실전 운용

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
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-chogath-20260913' OR (kind = 'article' AND title_key = '초가스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-chogath-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-chogath-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-chogath-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-chogath-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-chogath-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-chogath-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-chogath-20260913';

-- 뽀삐 (1060자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-poppy-20260913', 'article', '뽀삐', '뽀삐', 'published', NULL, '# 탑 라인 실전 운용

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
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-poppy-20260913' OR (kind = 'article' AND title_key = '뽀삐'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-poppy-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-poppy-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-poppy-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-poppy-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-poppy-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-poppy-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-poppy-20260913';

-- 마오카이 (1082자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-maokai-20260913', 'article', '마오카이', '마오카이', 'published', NULL, '# 탑 라인 실전 운용

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
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-maokai-20260913' OR (kind = 'article' AND title_key = '마오카이'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-maokai-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-maokai-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-maokai-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-maokai-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-maokai-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-maokai-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-maokai-20260913';

-- 나서스 (1142자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-nasus-20260913', 'article', '나서스', '나서스', 'published', NULL, '# 탑 라인 실전 운용

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
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-nasus-20260913' OR (kind = 'article' AND title_key = '나서스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-nasus-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-nasus-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-nasus-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-nasus-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-nasus-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-nasus-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-nasus-20260913';

-- 자크 (1006자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-zac-20260913', 'article', '자크', '자크', 'published', NULL, '# 탑 라인 실전 운용

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
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-zac-20260913' OR (kind = 'article' AND title_key = '자크'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-zac-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-zac-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-zac-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-zac-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-zac-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-zac-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-zac-20260913';

-- 탐 켄치 (1052자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-tahmkench-20260913', 'article', '탐 켄치', '탐켄치', 'published', NULL, '# 탑 라인 실전 운용

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
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-tahmkench-20260913' OR (kind = 'article' AND title_key = '탐켄치'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-tahmkench-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-tahmkench-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-tahmkench-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-tahmkench-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-tahmkench-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-tahmkench-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-tahmkench-20260913';

-- 문도 박사 (1083자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-ai-champion-drmundo-20260913', 'article', '문도 박사', '문도박사', 'published', NULL, '# 탑 라인 실전 운용

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
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-ai-champion-drmundo-20260913' OR (kind = 'article' AND title_key = '문도박사'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-ai-champion-drmundo-20260913', id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-13T06:00:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-ai-champion-drmundo-20260913' AND revision = 1 AND general = '# 탑 라인 실전 운용

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
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-drmundo-20260913');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-drmundo-20260913', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-ai-champion-drmundo-20260913';
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-ai-champion-drmundo-20260913', NULL, '분류:탱커', '분류:탱커' FROM wiki_docs WHERE id = 'doc-ai-champion-drmundo-20260913';

