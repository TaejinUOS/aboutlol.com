-- scripts/seed-jungle-ad-wiki.ts가 생성. 정글 AD 일반 위키 21개와 공통 상대법 20개.
-- 기존 공유 문서와 사용자 편집은 덮어쓰지 않으며 같은 SQL을 다시 실행해도 이력이 늘지 않는다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)
VALUES ('user-system', 'system', 'seed', '깨남.COM', NULL, 'admin', '2026-09-15T00:30:00.000Z');

-- 리 신 챔피언 위키 (944자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-leesin-20260915', 'article', '리 신', '리신', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 빠른 동선으로 먼저 움직인다 · 음파 적중 뒤에만 깊게 들어간다 · 방호를 퇴로까지 계산한다
[[분류:정글]] [[분류:AD]]

## 첫 동선은 속도보다 다음 선택지를 남긴다
**리 신은 초반 기동력과 교전 개입이 강한 대신, 근거 없이 시간을 쓰면 성장 차이를 되돌리기 어렵다.**[* [리 신 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=34)] 캠프를 먹기 전에 가까운 라인의 주도권과 강가 시야를 확인하고, 갱킹이 막히면 바로 다음 캠프로 이어지는 경로를 잡는다. `Q`는 첫 음파가 빗나가면 재진입도 사라지므로 멀리서 확률 낮은 시도를 반복하지 않는다.

## 음파는 진입 허가증으로 쓴다
**음파를 맞혔다고 곧바로 재사용하지 말고, 상대 이동기와 아군 합류를 먼저 본다.** 두 번째 사용은 잃은 체력에 비례해 마무리 힘이 커지므로 첫 기술로 쓰기보다 체력이 빠진 뒤 따라붙는 편이 좋다. 적이 포탑이나 다수의 아군 쪽으로 물러나면 표식을 포기하고 다음 기회를 남긴다.

## 방호와 발차기는 퇴로를 만드는 기술이다
**`W`로 아군이나 와드에 이동할 수 있다는 점이 리 신의 공격적인 위치 선정을 가능하게 한다.** 들어가기 전에 돌아올 대상을 확인하고, 용의 분노는 한 명을 멀리 보내는 것뿐 아니라 뒤의 적까지 띄우는 각을 찾는다. 핵심 대상을 아군 쪽으로 차는 시도보다 적 진형을 갈라 안전하게 전투를 여는 선택이 더 안정적이다.

## 중후반에는 먼저 보이는 암살자가 되지 않는다
**정면에서 음파만 던지면 리 신의 위협이 크게 줄어든다.** 측면 시야를 지우고 아군의 첫 제어에 맞춰 들어가거나, 우리 핵심 딜러에게 붙는 적을 발차기로 떼어낸다. 목표물 앞에서는 화려한 진입보다 강타 싸움에 쓸 이동기와 생존 수단을 남기는 판단이 우선이다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-leesin-20260915' OR (kind = 'article' AND title_key = '리신'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-leesin-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-leesin-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 빠른 동선으로 먼저 움직인다 · 음파 적중 뒤에만 깊게 들어간다 · 방호를 퇴로까지 계산한다
[[분류:정글]] [[분류:AD]]

## 첫 동선은 속도보다 다음 선택지를 남긴다
**리 신은 초반 기동력과 교전 개입이 강한 대신, 근거 없이 시간을 쓰면 성장 차이를 되돌리기 어렵다.**[* [리 신 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=34)] 캠프를 먹기 전에 가까운 라인의 주도권과 강가 시야를 확인하고, 갱킹이 막히면 바로 다음 캠프로 이어지는 경로를 잡는다. `Q`는 첫 음파가 빗나가면 재진입도 사라지므로 멀리서 확률 낮은 시도를 반복하지 않는다.

## 음파는 진입 허가증으로 쓴다
**음파를 맞혔다고 곧바로 재사용하지 말고, 상대 이동기와 아군 합류를 먼저 본다.** 두 번째 사용은 잃은 체력에 비례해 마무리 힘이 커지므로 첫 기술로 쓰기보다 체력이 빠진 뒤 따라붙는 편이 좋다. 적이 포탑이나 다수의 아군 쪽으로 물러나면 표식을 포기하고 다음 기회를 남긴다.

## 방호와 발차기는 퇴로를 만드는 기술이다
**`W`로 아군이나 와드에 이동할 수 있다는 점이 리 신의 공격적인 위치 선정을 가능하게 한다.** 들어가기 전에 돌아올 대상을 확인하고, 용의 분노는 한 명을 멀리 보내는 것뿐 아니라 뒤의 적까지 띄우는 각을 찾는다. 핵심 대상을 아군 쪽으로 차는 시도보다 적 진형을 갈라 안전하게 전투를 여는 선택이 더 안정적이다.

## 중후반에는 먼저 보이는 암살자가 되지 않는다
**정면에서 음파만 던지면 리 신의 위협이 크게 줄어든다.** 측면 시야를 지우고 아군의 첫 제어에 맞춰 들어가거나, 우리 핵심 딜러에게 붙는 적을 발차기로 떼어낸다. 목표물 앞에서는 화려한 진입보다 강타 싸움에 쓸 이동기와 생존 수단을 남기는 판단이 우선이다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-leesin-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-leesin-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-leesin-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-leesin-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-leesin-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-leesin-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-leesin-20260915' AND target_key = '분류:ad');

-- 비에고 챔피언 위키 (909자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-viego-20260915', 'article', '비에고', '비에고', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 첫 처치까지 무리하지 않는다 · 안개로 접근 경로를 숨긴다 · 빙의 순서를 미리 정한다
[[분류:정글]] [[분류:AD]]

## 안정적인 첫 처치가 전투 전체를 바꾼다
**비에고는 먼저 쓰러뜨린 적의 몸을 차지하는 순간부터 교전의 기술과 체력 흐름이 새로 시작된다.**[* [비에고 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=154)] 처음부터 깊게 들어가기보다 아군이 집중하는 낮은 체력 대상을 함께 노린다. `Q`로 표식을 남긴 뒤 기본 공격을 섞으면 추가 공격과 회복을 얻으므로 기술만 연달아 쓰지 않는다.

## 안개는 속도보다 정보 차단에 가치가 있다
**망령의 길을 벽에 펼치면 이동과 공격 능력이 오르는 동시에 접근 방향을 숨길 수 있다.** 상대 시야가 남은 곳에서 바로 뛰어나가기보다 안개 안에서 진입 각과 퇴로를 함께 본다. `W`는 충전할수록 기절이 길어지지만 이동이 읽히므로, 가까운 거리에서는 짧게 써 확실하게 맞히는 판단도 필요하다.

## 빙의 중에는 빌린 기술의 목적만 챙긴다
**모든 기술을 완벽하게 쓰려 하기보다 이동기·제어기·생존기 중 지금 필요한 하나를 먼저 찾는다.** 위험한 몸을 오래 붙잡지 말고 핵심 기술을 쓴 뒤 궁극기로 빠져나오며 다음 처치 대상으로 연결한다. 빙의 전에 다음 대상과 착지 위치를 정하면 화면이 바뀌어도 판단이 흔들리지 않는다.

## 목표물 전투는 측면에서 기다린다
**비에고가 먼저 시야에 잡혀 집중 공격을 받으면 빙의 연쇄가 시작되기 어렵다.** 정면을 아군에게 맡기고 벽과 안개를 이용해 낮아진 대상을 노린다. 처치가 나오기 전에는 궁극기를 단순 진입기로 낭비하지 않고, 처치 뒤에는 밀쳐낼 적과 마무리할 적을 구분해 사용한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-viego-20260915' OR (kind = 'article' AND title_key = '비에고'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-viego-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-viego-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 첫 처치까지 무리하지 않는다 · 안개로 접근 경로를 숨긴다 · 빙의 순서를 미리 정한다
[[분류:정글]] [[분류:AD]]

## 안정적인 첫 처치가 전투 전체를 바꾼다
**비에고는 먼저 쓰러뜨린 적의 몸을 차지하는 순간부터 교전의 기술과 체력 흐름이 새로 시작된다.**[* [비에고 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=154)] 처음부터 깊게 들어가기보다 아군이 집중하는 낮은 체력 대상을 함께 노린다. `Q`로 표식을 남긴 뒤 기본 공격을 섞으면 추가 공격과 회복을 얻으므로 기술만 연달아 쓰지 않는다.

## 안개는 속도보다 정보 차단에 가치가 있다
**망령의 길을 벽에 펼치면 이동과 공격 능력이 오르는 동시에 접근 방향을 숨길 수 있다.** 상대 시야가 남은 곳에서 바로 뛰어나가기보다 안개 안에서 진입 각과 퇴로를 함께 본다. `W`는 충전할수록 기절이 길어지지만 이동이 읽히므로, 가까운 거리에서는 짧게 써 확실하게 맞히는 판단도 필요하다.

## 빙의 중에는 빌린 기술의 목적만 챙긴다
**모든 기술을 완벽하게 쓰려 하기보다 이동기·제어기·생존기 중 지금 필요한 하나를 먼저 찾는다.** 위험한 몸을 오래 붙잡지 말고 핵심 기술을 쓴 뒤 궁극기로 빠져나오며 다음 처치 대상으로 연결한다. 빙의 전에 다음 대상과 착지 위치를 정하면 화면이 바뀌어도 판단이 흔들리지 않는다.

## 목표물 전투는 측면에서 기다린다
**비에고가 먼저 시야에 잡혀 집중 공격을 받으면 빙의 연쇄가 시작되기 어렵다.** 정면을 아군에게 맡기고 벽과 안개를 이용해 낮아진 대상을 노린다. 처치가 나오기 전에는 궁극기를 단순 진입기로 낭비하지 않고, 처치 뒤에는 밀쳐낼 적과 마무리할 적을 구분해 사용한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-viego-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-viego-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-viego-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-viego-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-viego-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-viego-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-viego-20260915' AND target_key = '분류:ad');

-- 그레이브즈 챔피언 위키 (884자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-graves-20260915', 'article', '그레이브즈', '그레이브즈', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 산탄 각도를 좁힌다 · 벽에 화약 역류를 터뜨린다 · 빨리 뽑기로 방어 중첩을 유지한다
[[분류:정글]] [[분류:AD]]

## 몬스터와 벽을 한 줄에 둔다
**그레이브즈의 기본 공격은 여러 탄환이 가까이 맞을수록 강하고 몬스터를 밀어내므로, 캠프를 벽 쪽에 고정하면 피해를 줄이기 쉽다.**[* [그레이브즈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=85)] 재장전 시간을 이동에 쓰고, 다음 캠프로 향하는 쪽에 서서 정리를 마친다. `Q`는 벽에 닿으면 빠르게 되돌아오므로 좁은 길과 캠프 모서리를 적극적으로 이용한다.

## 빨리 뽑기는 탄환과 방어를 함께 관리한다
**`E`는 이동기인 동시에 탄환을 보충하고 진정한 용기 중첩을 쌓는 수단이다.** 전투 시작과 동시에 거리를 좁히는 데 모두 쓰기보다 상대 핵심 기술을 피할 방향으로 남겨 둔다. 기본 공격을 이어가면 재사용 대기시간과 방어 중첩 유지에 도움이 되므로 짧게 치고 위치를 바꾸는 리듬을 만든다.

## 연막탄은 피해보다 시야를 끊는다
**연막 안의 적은 바깥 정보를 보기 어려워 합류와 표적 선택이 늦어진다.** 도망가는 한 명에게만 던지기보다 원거리 딜러와 앞선 사이, 좁은 입구, 목표물 진입로에 놓는다. 갱킹에서는 상대가 이동기를 쓰려는 방향을 가려 다음 산탄을 가까이 맞힐 시간을 번다.

## 목표물 앞에서는 탄환 두 발을 준비한다
**전투 직전에 재장전 중이면 짧은 폭발력을 살릴 수 없다.** 캠프나 시야 대상을 치며 탄환과 용기 중첩을 정돈하고, 좁은 길에서 화약 역류와 무고한 희생자를 연계한다. 궁극기의 반동으로 거리를 벌릴 수 있다는 점까지 퇴로 계산에 포함한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-graves-20260915' OR (kind = 'article' AND title_key = '그레이브즈'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-graves-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-graves-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 산탄 각도를 좁힌다 · 벽에 화약 역류를 터뜨린다 · 빨리 뽑기로 방어 중첩을 유지한다
[[분류:정글]] [[분류:AD]]

## 몬스터와 벽을 한 줄에 둔다
**그레이브즈의 기본 공격은 여러 탄환이 가까이 맞을수록 강하고 몬스터를 밀어내므로, 캠프를 벽 쪽에 고정하면 피해를 줄이기 쉽다.**[* [그레이브즈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=85)] 재장전 시간을 이동에 쓰고, 다음 캠프로 향하는 쪽에 서서 정리를 마친다. `Q`는 벽에 닿으면 빠르게 되돌아오므로 좁은 길과 캠프 모서리를 적극적으로 이용한다.

## 빨리 뽑기는 탄환과 방어를 함께 관리한다
**`E`는 이동기인 동시에 탄환을 보충하고 진정한 용기 중첩을 쌓는 수단이다.** 전투 시작과 동시에 거리를 좁히는 데 모두 쓰기보다 상대 핵심 기술을 피할 방향으로 남겨 둔다. 기본 공격을 이어가면 재사용 대기시간과 방어 중첩 유지에 도움이 되므로 짧게 치고 위치를 바꾸는 리듬을 만든다.

## 연막탄은 피해보다 시야를 끊는다
**연막 안의 적은 바깥 정보를 보기 어려워 합류와 표적 선택이 늦어진다.** 도망가는 한 명에게만 던지기보다 원거리 딜러와 앞선 사이, 좁은 입구, 목표물 진입로에 놓는다. 갱킹에서는 상대가 이동기를 쓰려는 방향을 가려 다음 산탄을 가까이 맞힐 시간을 번다.

## 목표물 앞에서는 탄환 두 발을 준비한다
**전투 직전에 재장전 중이면 짧은 폭발력을 살릴 수 없다.** 캠프나 시야 대상을 치며 탄환과 용기 중첩을 정돈하고, 좁은 길에서 화약 역류와 무고한 희생자를 연계한다. 궁극기의 반동으로 거리를 벌릴 수 있다는 점까지 퇴로 계산에 포함한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-graves-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-graves-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-graves-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-graves-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-graves-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-graves-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-graves-20260915' AND target_key = '분류:ad');

-- 킨드레드 챔피언 위키 (883자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-kindred-20260915', 'article', '킨드레드', '킨드레드', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 표식보다 라인 주도권을 먼저 본다 · 늑대 영역에서 짧게 싸운다 · 안식처 종료를 계산한다
[[분류:정글]] [[분류:AD]]

## 표식은 의무가 아니라 상대를 움직이는 정보다
**킨드레드의 표식은 성장을 돕지만, 주도권 없는 강가로 혼자 들어가면 손실이 더 크다.**[* [킨드레드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=127)] 표시된 캠프 주변 라인이 먼저 움직일 수 있는지 확인하고, 불리하면 반대편 캠프나 목표물을 취한다. 적 정글이 표식을 지키러 간다는 사실 자체를 다른 곳의 이득으로 바꾼다.

## 늑대의 광기 안에서 화살의 춤을 반복한다
**`W` 영역 안에서는 화살 세례의 재사용 대기시간이 크게 줄어 벽을 넘나들며 거리를 유지할 수 있다.** 늑대 영역을 전투가 끝날 자리보다 싸움을 이어갈 방향에 깐다. 덩치 큰 적에게는 차오르는 공포를 먼저 묻히고 세 번째 공격까지 안전하게 연결한다.

## 갱킹은 표적 지정과 둔화로 확정한다
**사냥할 챔피언을 미리 지정하되, 표식 욕심 때문에 시야에 오래 드러나지 않는다.** 아군 제어가 시작된 뒤 `E` 둔화를 넣고 도약은 상대 이동기를 따라가는 데 쓴다. 원거리라는 장점을 살려 한 번에 파고들기보다 공격 가능한 최대 거리를 계속 갱신한다.

## 양의 안식처는 종료 직후까지가 한 기술이다
**궁극기 안에서는 적도 죽지 않으므로 단순한 위기 탈출로만 쓰면 상대를 살릴 수 있다.** 종료 시점에 맞춰 차오르는 공포의 세 번째 타격과 아군 기술이 들어가도록 준비한다. 목표물 체력까지 보호할 수 있으므로 강타 싸움에서는 누가 원 안에 있는지와 종료 뒤 공격 순서를 분명히 한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-kindred-20260915' OR (kind = 'article' AND title_key = '킨드레드'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-kindred-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-kindred-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 표식보다 라인 주도권을 먼저 본다 · 늑대 영역에서 짧게 싸운다 · 안식처 종료를 계산한다
[[분류:정글]] [[분류:AD]]

## 표식은 의무가 아니라 상대를 움직이는 정보다
**킨드레드의 표식은 성장을 돕지만, 주도권 없는 강가로 혼자 들어가면 손실이 더 크다.**[* [킨드레드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=127)] 표시된 캠프 주변 라인이 먼저 움직일 수 있는지 확인하고, 불리하면 반대편 캠프나 목표물을 취한다. 적 정글이 표식을 지키러 간다는 사실 자체를 다른 곳의 이득으로 바꾼다.

## 늑대의 광기 안에서 화살의 춤을 반복한다
**`W` 영역 안에서는 화살 세례의 재사용 대기시간이 크게 줄어 벽을 넘나들며 거리를 유지할 수 있다.** 늑대 영역을 전투가 끝날 자리보다 싸움을 이어갈 방향에 깐다. 덩치 큰 적에게는 차오르는 공포를 먼저 묻히고 세 번째 공격까지 안전하게 연결한다.

## 갱킹은 표적 지정과 둔화로 확정한다
**사냥할 챔피언을 미리 지정하되, 표식 욕심 때문에 시야에 오래 드러나지 않는다.** 아군 제어가 시작된 뒤 `E` 둔화를 넣고 도약은 상대 이동기를 따라가는 데 쓴다. 원거리라는 장점을 살려 한 번에 파고들기보다 공격 가능한 최대 거리를 계속 갱신한다.

## 양의 안식처는 종료 직후까지가 한 기술이다
**궁극기 안에서는 적도 죽지 않으므로 단순한 위기 탈출로만 쓰면 상대를 살릴 수 있다.** 종료 시점에 맞춰 차오르는 공포의 세 번째 타격과 아군 기술이 들어가도록 준비한다. 목표물 체력까지 보호할 수 있으므로 강타 싸움에서는 누가 원 안에 있는지와 종료 뒤 공격 순서를 분명히 한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-kindred-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-kindred-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-kindred-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-kindred-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-kindred-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-kindred-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-kindred-20260915' AND target_key = '분류:ad');

-- 렝가 챔피언 위키 (912자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-rengar-20260915', 'article', '렝가', '렝가', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 수풀을 이동기로 쓴다 · 강화 기술을 교전 전에 정한다 · 사냥의 전율은 측면에서 연다
[[분류:정글]] [[분류:AD]]

## 수풀 사이 이동이 곧 렝가의 사거리다
**렝가는 수풀에서 기본 공격으로 도약할 수 있어, 캠프와 교전 위치를 수풀 가까이 잡을수록 선택지가 늘어난다.**[* [렝가 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=103)] 다음 캠프로 이동할 때 야성을 정돈하고, 갱킹에서는 수풀 밖을 오래 걷지 않도록 진입 경로를 고른다. `Q` 강화 기본 공격은 도약과 함께 넣어 첫 순간의 피해를 집중한다.

## 강화 기술은 눌러야 할 순간보다 목적을 먼저 고른다
**강화 Q는 마무리, 강화 W는 최근 받은 피해 회복과 방해 효과 해제, 강화 E는 속박이라는 역할이 다르다.** 싸움 전에 상대의 핵심 제어가 무엇인지 보고 어떤 강화 기술을 쓸지 정한다. 야성이 가득 찼다고 즉시 소비하지 말고, 다음 한 번의 생존이나 추격을 바꿀 때 사용한다.

## 사냥의 전율은 발견되지 않은 방향에서 시작한다
**궁극기는 가장 가까운 적을 드러내고 도약 기회를 주지만, 정면에서 켜면 상대가 뭉쳐 대응할 시간이 생긴다.** 시야 밖으로 빠진 뒤 측면을 돌아 고립된 대상을 찾는다. 표시된 한 명만 따라가기보다 적 진형과 아군 거리를 확인해 진입을 취소할 여지도 남긴다.

## 한타에서는 들어간 뒤 나올 수풀을 본다
**첫 대상을 처치해도 다음 도약 지점이 없으면 렝가가 적진에 고립된다.** 수풀과 아군 위치를 연결해 짧은 진입과 이탈을 반복하고, 우리 딜러를 노리는 적에게 강화 속박을 쓰는 선택도 준비한다. 목표물 주변 수풀 시야를 먼저 지우면 상대는 렝가의 실제 사거리를 가늠하기 어렵다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-rengar-20260915' OR (kind = 'article' AND title_key = '렝가'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-rengar-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-rengar-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 수풀을 이동기로 쓴다 · 강화 기술을 교전 전에 정한다 · 사냥의 전율은 측면에서 연다
[[분류:정글]] [[분류:AD]]

## 수풀 사이 이동이 곧 렝가의 사거리다
**렝가는 수풀에서 기본 공격으로 도약할 수 있어, 캠프와 교전 위치를 수풀 가까이 잡을수록 선택지가 늘어난다.**[* [렝가 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=103)] 다음 캠프로 이동할 때 야성을 정돈하고, 갱킹에서는 수풀 밖을 오래 걷지 않도록 진입 경로를 고른다. `Q` 강화 기본 공격은 도약과 함께 넣어 첫 순간의 피해를 집중한다.

## 강화 기술은 눌러야 할 순간보다 목적을 먼저 고른다
**강화 Q는 마무리, 강화 W는 최근 받은 피해 회복과 방해 효과 해제, 강화 E는 속박이라는 역할이 다르다.** 싸움 전에 상대의 핵심 제어가 무엇인지 보고 어떤 강화 기술을 쓸지 정한다. 야성이 가득 찼다고 즉시 소비하지 말고, 다음 한 번의 생존이나 추격을 바꿀 때 사용한다.

## 사냥의 전율은 발견되지 않은 방향에서 시작한다
**궁극기는 가장 가까운 적을 드러내고 도약 기회를 주지만, 정면에서 켜면 상대가 뭉쳐 대응할 시간이 생긴다.** 시야 밖으로 빠진 뒤 측면을 돌아 고립된 대상을 찾는다. 표시된 한 명만 따라가기보다 적 진형과 아군 거리를 확인해 진입을 취소할 여지도 남긴다.

## 한타에서는 들어간 뒤 나올 수풀을 본다
**첫 대상을 처치해도 다음 도약 지점이 없으면 렝가가 적진에 고립된다.** 수풀과 아군 위치를 연결해 짧은 진입과 이탈을 반복하고, 우리 딜러를 노리는 적에게 강화 속박을 쓰는 선택도 준비한다. 목표물 주변 수풀 시야를 먼저 지우면 상대는 렝가의 실제 사거리를 가늠하기 어렵다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-rengar-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-rengar-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-rengar-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-rengar-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-rengar-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-rengar-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-rengar-20260915' AND target_key = '분류:ad');

-- 카직스 챔피언 위키 (894자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-khazix-20260915', 'article', '카직스', '카직스', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 고립된 대상을 고른다 · 도약은 마무리 뒤에 쓴다 · 진화는 필요한 역할에 맞춘다
[[분류:정글]] [[분류:AD]]

## 고립 여부가 싸움의 허가를 결정한다
**카직스는 주변에 아군이 없는 대상에게 공포 감지의 피해가 크게 늘어나므로, 챔피언 이름보다 위치를 보고 표적을 고른다.**[* [카직스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=105)] 캠프 사이 이동 중 상대 정글을 만났을 때도 근처 몬스터와 합류 인원을 확인한다. `Q`를 빠르게 반복할 수 있는 고립 상황이 아니라면 무리하게 긴 싸움을 열지 않는다.

## 공허의 가시는 확인과 회복을 겸한다
**`W` 폭발 범위 안에 카직스가 있으면 회복하므로 캠프와 교전에서 체력 관리에 활용한다.** 시야가 없는 수풀과 좁은 입구를 먼저 확인하고, 맞힌 뒤 생긴 둔화로 거리를 좁힌다. 진화했을 때 여러 방향으로 퍼지는 가시는 흩어진 적의 이동을 늦춰 다음 고립을 만드는 데 좋다.

## 도약은 처치가 확실할 때까지 남긴다
**도약으로 먼저 들어가면 상대 이동기를 따라갈 수단과 퇴로를 동시에 잃는다.** 걸어서 접근하거나 궁극기 은신으로 거리를 줄인 뒤, 낮은 체력 대상을 마무리하거나 벽을 넘어 빠질 때 쓴다. 도약 진화의 처치 관여 초기화도 다음 착지 지점을 미리 봐야 가치가 난다.

## 진화 선택은 현재 팀에 없는 기능을 보충한다
**단일 처치가 필요하면 Q, 추격과 견제가 필요하면 W, 연속 진입이 필요하면 E, 안전한 접근이 필요하면 R의 가치가 커진다.** 정해진 순서보다 상대의 뭉침과 아군 교전 방식에 맞춘다. 후반에는 고립이 쉽게 풀리므로 시야를 지우고 양옆으로 벌어진 적을 기다린다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-khazix-20260915' OR (kind = 'article' AND title_key = '카직스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-khazix-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-khazix-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 고립된 대상을 고른다 · 도약은 마무리 뒤에 쓴다 · 진화는 필요한 역할에 맞춘다
[[분류:정글]] [[분류:AD]]

## 고립 여부가 싸움의 허가를 결정한다
**카직스는 주변에 아군이 없는 대상에게 공포 감지의 피해가 크게 늘어나므로, 챔피언 이름보다 위치를 보고 표적을 고른다.**[* [카직스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=105)] 캠프 사이 이동 중 상대 정글을 만났을 때도 근처 몬스터와 합류 인원을 확인한다. `Q`를 빠르게 반복할 수 있는 고립 상황이 아니라면 무리하게 긴 싸움을 열지 않는다.

## 공허의 가시는 확인과 회복을 겸한다
**`W` 폭발 범위 안에 카직스가 있으면 회복하므로 캠프와 교전에서 체력 관리에 활용한다.** 시야가 없는 수풀과 좁은 입구를 먼저 확인하고, 맞힌 뒤 생긴 둔화로 거리를 좁힌다. 진화했을 때 여러 방향으로 퍼지는 가시는 흩어진 적의 이동을 늦춰 다음 고립을 만드는 데 좋다.

## 도약은 처치가 확실할 때까지 남긴다
**도약으로 먼저 들어가면 상대 이동기를 따라갈 수단과 퇴로를 동시에 잃는다.** 걸어서 접근하거나 궁극기 은신으로 거리를 줄인 뒤, 낮은 체력 대상을 마무리하거나 벽을 넘어 빠질 때 쓴다. 도약 진화의 처치 관여 초기화도 다음 착지 지점을 미리 봐야 가치가 난다.

## 진화 선택은 현재 팀에 없는 기능을 보충한다
**단일 처치가 필요하면 Q, 추격과 견제가 필요하면 W, 연속 진입이 필요하면 E, 안전한 접근이 필요하면 R의 가치가 커진다.** 정해진 순서보다 상대의 뭉침과 아군 교전 방식에 맞춘다. 후반에는 고립이 쉽게 풀리므로 시야를 지우고 양옆으로 벌어진 적을 기다린다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-khazix-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-khazix-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-khazix-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-khazix-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-khazix-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-khazix-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-khazix-20260915' AND target_key = '분류:ad');

-- 헤카림 챔피언 위키 (865자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-hecarim-20260915', 'article', '헤카림', '헤카림', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 회오리 베기 중첩을 들고 싸운다 · 이동 속도를 진입 피해로 바꾼다 · 공포 방향을 설계한다
[[분류:정글]] [[분류:AD]]

## 캠프를 잇고 중첩을 끊지 않는다
**헤카림은 회오리 베기가 적중할수록 다음 사용이 빨라지고 피해가 커져, 캠프와 교전을 연결할 때 힘이 난다.**[* [헤카림 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=96)] 갱킹 직전 가까운 몬스터에 `Q` 중첩을 만들고 지속시간 안에 진입한다. 가능성이 낮은 라인에서 오래 기다리기보다 빠른 이동으로 캠프를 확보하고 다음 기회를 만든다.

## 파멸의 돌격은 밀어낼 방향까지 계산한다
**`E`는 이동 속도가 오를수록 접근과 첫 타격이 강해지지만, 잘못 밀면 상대의 탈출을 도울 수 있다.** 정면으로 달려가기보다 측면이나 뒤를 잡아 아군 쪽으로 밀어낸다. 최고 속도만 기다리다 기회를 놓치지 말고 상대 이동기가 빠진 순간 확실한 각을 택한다.

## 공포의 망령은 버티는 구간에 켠다
**주변 적이 받는 피해에 비례해 회복하므로 아군 화력이 집중되는 순간에 켜야 효율이 높다.** 진입 전에 허공에서 소비하지 않고 여러 대상 사이에 들어간 뒤 사용한다. 방어력과 마법 저항력 증가도 붙으므로 적의 첫 집중 공격을 받을 타이밍에 맞춘다.

## 그림자의 맹습은 끝 지점으로 진형을 가른다
**궁극기의 공포는 헤카림이 도착한 위치를 기준으로 적을 밀어내므로, 단순히 맞히는 것보다 착지 방향이 중요하다.** 적 딜러 뒤로 통과해 아군 쪽으로 몰거나 앞선을 옆으로 흩뜨린다. 목표물 전투에서는 벽을 넘는 진입을 준비하되 강타와 퇴로까지 함께 남긴다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-hecarim-20260915' OR (kind = 'article' AND title_key = '헤카림'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-hecarim-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-hecarim-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 회오리 베기 중첩을 들고 싸운다 · 이동 속도를 진입 피해로 바꾼다 · 공포 방향을 설계한다
[[분류:정글]] [[분류:AD]]

## 캠프를 잇고 중첩을 끊지 않는다
**헤카림은 회오리 베기가 적중할수록 다음 사용이 빨라지고 피해가 커져, 캠프와 교전을 연결할 때 힘이 난다.**[* [헤카림 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=96)] 갱킹 직전 가까운 몬스터에 `Q` 중첩을 만들고 지속시간 안에 진입한다. 가능성이 낮은 라인에서 오래 기다리기보다 빠른 이동으로 캠프를 확보하고 다음 기회를 만든다.

## 파멸의 돌격은 밀어낼 방향까지 계산한다
**`E`는 이동 속도가 오를수록 접근과 첫 타격이 강해지지만, 잘못 밀면 상대의 탈출을 도울 수 있다.** 정면으로 달려가기보다 측면이나 뒤를 잡아 아군 쪽으로 밀어낸다. 최고 속도만 기다리다 기회를 놓치지 말고 상대 이동기가 빠진 순간 확실한 각을 택한다.

## 공포의 망령은 버티는 구간에 켠다
**주변 적이 받는 피해에 비례해 회복하므로 아군 화력이 집중되는 순간에 켜야 효율이 높다.** 진입 전에 허공에서 소비하지 않고 여러 대상 사이에 들어간 뒤 사용한다. 방어력과 마법 저항력 증가도 붙으므로 적의 첫 집중 공격을 받을 타이밍에 맞춘다.

## 그림자의 맹습은 끝 지점으로 진형을 가른다
**궁극기의 공포는 헤카림이 도착한 위치를 기준으로 적을 밀어내므로, 단순히 맞히는 것보다 착지 방향이 중요하다.** 적 딜러 뒤로 통과해 아군 쪽으로 몰거나 앞선을 옆으로 흩뜨린다. 목표물 전투에서는 벽을 넘는 진입을 준비하되 강타와 퇴로까지 함께 남긴다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-hecarim-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-hecarim-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-hecarim-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-hecarim-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-hecarim-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-hecarim-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-hecarim-20260915' AND target_key = '분류:ad');

-- 자르반 4세 챔피언 위키 (852자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-jarvaniv-20260915', 'article', '자르반 4세', '자르반4세', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 깃창 적중을 서두르지 않는다 · 깃발로 아군까지 강화한다 · 대격변 탈출 수단을 확인한다
[[분류:정글]] [[분류:AD]]

## 깃발은 진입 전에 자리부터 잡는다
**자르반 4세의 깃발은 주변 아군의 공격 속도를 올리고, 용의 일격과 연결하면 이동 경로의 적을 띄운다.**[* [자르반 4세 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=24)] 캠프를 정리할 때도 다음 이동 방향에 깃발을 두고, 갱킹에서는 `E`를 먼저 맞히려 욕심내기보다 Q가 지나갈 선을 만든다.

## 깃창은 맞히는 기술이자 벽을 넘는 퇴로다
**`Q`와 깃발을 모두 쓰면 자르반의 핵심 이동기가 사라지므로, 아군 호응과 적 이동기를 확인한 뒤 연결한다.** 가까운 상대에게는 걸어서 둔화를 묻히고 이동기를 기다렸다가 깃창으로 따라간다. 방어력 감소가 먼저 적용되는 점을 살려 아군의 물리 피해가 이어질 때 집중한다.

## 황금빛 방패는 여러 명 사이에서 켠다
**근처 적 챔피언 수에 따라 보호막이 커지므로 진입 직전보다 적 한가운데 도착한 뒤 사용하는 편이 좋다.** 둔화로 대격변 안의 적을 붙잡고 기본 공격의 체력 비례 피해를 서로 다른 대상에게 나누어 활용한다. 버틸 수 없는 수적 열세라면 방패만 믿고 들어가지 않는다.

## 대격변은 가두기 전에 탈출기를 센다
**궁극기의 지형은 적뿐 아니라 아군의 이동도 막을 수 있다.** 벽을 넘는 기술이 빠진 핵심 대상을 노리고, 원거리 아군의 공격 선을 가리지 않는 위치에 원을 만든다. 상황이 나빠지면 궁극기를 다시 사용해 지형을 일찍 해제하는 판단까지 준비한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-jarvaniv-20260915' OR (kind = 'article' AND title_key = '자르반4세'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-jarvaniv-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-jarvaniv-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 깃창 적중을 서두르지 않는다 · 깃발로 아군까지 강화한다 · 대격변 탈출 수단을 확인한다
[[분류:정글]] [[분류:AD]]

## 깃발은 진입 전에 자리부터 잡는다
**자르반 4세의 깃발은 주변 아군의 공격 속도를 올리고, 용의 일격과 연결하면 이동 경로의 적을 띄운다.**[* [자르반 4세 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=24)] 캠프를 정리할 때도 다음 이동 방향에 깃발을 두고, 갱킹에서는 `E`를 먼저 맞히려 욕심내기보다 Q가 지나갈 선을 만든다.

## 깃창은 맞히는 기술이자 벽을 넘는 퇴로다
**`Q`와 깃발을 모두 쓰면 자르반의 핵심 이동기가 사라지므로, 아군 호응과 적 이동기를 확인한 뒤 연결한다.** 가까운 상대에게는 걸어서 둔화를 묻히고 이동기를 기다렸다가 깃창으로 따라간다. 방어력 감소가 먼저 적용되는 점을 살려 아군의 물리 피해가 이어질 때 집중한다.

## 황금빛 방패는 여러 명 사이에서 켠다
**근처 적 챔피언 수에 따라 보호막이 커지므로 진입 직전보다 적 한가운데 도착한 뒤 사용하는 편이 좋다.** 둔화로 대격변 안의 적을 붙잡고 기본 공격의 체력 비례 피해를 서로 다른 대상에게 나누어 활용한다. 버틸 수 없는 수적 열세라면 방패만 믿고 들어가지 않는다.

## 대격변은 가두기 전에 탈출기를 센다
**궁극기의 지형은 적뿐 아니라 아군의 이동도 막을 수 있다.** 벽을 넘는 기술이 빠진 핵심 대상을 노리고, 원거리 아군의 공격 선을 가리지 않는 위치에 원을 만든다. 상황이 나빠지면 궁극기를 다시 사용해 지형을 일찍 해제하는 판단까지 준비한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-jarvaniv-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-jarvaniv-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-jarvaniv-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-jarvaniv-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-jarvaniv-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-jarvaniv-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-jarvaniv-20260915' AND target_key = '분류:ad');

-- 바이 챔피언 위키 (861자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-vi-20260915', 'article', '바이', '바이', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 금고 부수기는 시야 밖에서 충전한다 · 폭발 보호막 중첩을 관리한다 · 궁극기로 한 명을 고정한다
[[분류:정글]] [[분류:AD]]

## 금고 부수기는 짧게 맞혀도 충분하다
**바이의 `Q`는 충전할수록 멀리 가지만, 오래 들고 있으면 느려지고 진입 방향이 읽힌다.**[* [바이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=109)] 벽이나 시야 밖에서 충전해 반응 시간을 줄이고, 가까운 거리에서는 짧게 사용해 확실히 밀어낸다. 빗나가면 깊은 위치에 멈추므로 적의 옆을 스치지 않게 중심을 노린다.

## 세 번의 타격을 한 묶음으로 본다
**찌그러뜨리기는 같은 대상을 세 번 공격하면 추가 피해와 방어력 감소, 공격 속도를 제공한다.** 금고 부수기와 과도한 힘도 중첩을 쌓으므로 평타 사이에 섞어 빠르게 발동한다. 캠프에서는 폭발 보호막 중첩을 기술 사용 시점과 맞춰 체력 손실을 줄인다.

## 궁극기는 가장 좋은 표적보다 확실한 표적을 고른다
**기동타격은 대상을 추격하며 중간 적을 밀쳐내기 때문에 도주기가 많은 핵심 챔피언을 고정하기 좋다.** 다만 아군이 닿지 못하는 거리까지 혼자 따라가지 않는다. 상대가 우리 진영으로 들어온 뒤 사용하면 고립 위험을 줄이고 후속 제어를 맞히기 쉽다.

## 목표물 앞에서는 진입 기술 하나를 남긴다
**Q와 궁극기를 모두 적 후방 진입에 쓰면 목표물로 돌아오거나 벽을 넘을 수 없다.** 강타 싸움에서는 벽 너머 시야를 확보하고 한 기술은 상대 정글을 묶는 데 쓴다. 한타에서는 과도한 힘의 원뿔 피해가 뒤쪽까지 닿도록 앞선을 때리며 방어력 감소를 공유한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-vi-20260915' OR (kind = 'article' AND title_key = '바이'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-vi-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-vi-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 금고 부수기는 시야 밖에서 충전한다 · 폭발 보호막 중첩을 관리한다 · 궁극기로 한 명을 고정한다
[[분류:정글]] [[분류:AD]]

## 금고 부수기는 짧게 맞혀도 충분하다
**바이의 `Q`는 충전할수록 멀리 가지만, 오래 들고 있으면 느려지고 진입 방향이 읽힌다.**[* [바이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=109)] 벽이나 시야 밖에서 충전해 반응 시간을 줄이고, 가까운 거리에서는 짧게 사용해 확실히 밀어낸다. 빗나가면 깊은 위치에 멈추므로 적의 옆을 스치지 않게 중심을 노린다.

## 세 번의 타격을 한 묶음으로 본다
**찌그러뜨리기는 같은 대상을 세 번 공격하면 추가 피해와 방어력 감소, 공격 속도를 제공한다.** 금고 부수기와 과도한 힘도 중첩을 쌓으므로 평타 사이에 섞어 빠르게 발동한다. 캠프에서는 폭발 보호막 중첩을 기술 사용 시점과 맞춰 체력 손실을 줄인다.

## 궁극기는 가장 좋은 표적보다 확실한 표적을 고른다
**기동타격은 대상을 추격하며 중간 적을 밀쳐내기 때문에 도주기가 많은 핵심 챔피언을 고정하기 좋다.** 다만 아군이 닿지 못하는 거리까지 혼자 따라가지 않는다. 상대가 우리 진영으로 들어온 뒤 사용하면 고립 위험을 줄이고 후속 제어를 맞히기 쉽다.

## 목표물 앞에서는 진입 기술 하나를 남긴다
**Q와 궁극기를 모두 적 후방 진입에 쓰면 목표물로 돌아오거나 벽을 넘을 수 없다.** 강타 싸움에서는 벽 너머 시야를 확보하고 한 기술은 상대 정글을 묶는 데 쓴다. 한타에서는 과도한 힘의 원뿔 피해가 뒤쪽까지 닿도록 앞선을 때리며 방어력 감소를 공유한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-vi-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-vi-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-vi-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-vi-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-vi-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-vi-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-vi-20260915' AND target_key = '분류:ad');

-- 신 짜오 챔피언 위키 (871자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-xinzhao-20260915', 'article', '신 짜오', '신짜오', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 풍전참뢰로 도전 대상을 만든다 · 세 번째 창끝을 확실히 맞힌다 · 현월수호 경계를 활용한다
[[분류:정글]] [[분류:AD]]

## 두 번째 타격이 진입 사거리를 연다
**풍전참뢰의 찌르기를 맞히면 대상이 도전 상태가 되어 무쌍돌격의 사거리가 늘어난다.**[* [신 짜오 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=75)] `W`를 멀리서 던지기보다 아군 제어와 둔화 뒤에 연결해 적중률을 높인다. 맞히지 못했다면 긴 돌진을 기대하지 말고 걸어서 압박하거나 다음 기회를 기다린다.

## 삼조격의 세 번째 공격까지 경로를 막는다
**Q를 켠 뒤 세 번째 기본 공격은 대상을 띄우므로, 첫 두 번을 치는 동안 상대가 빠질 방향을 선점해야 한다.** 무쌍돌격의 둔화와 공격 속도를 이용해 빠르게 연결하고, 재사용 대기시간 감소로 다음 기술 순환을 앞당긴다. 대상을 바꾸면 타격 수를 잃지 않도록 남은 횟수를 기억한다.

## 현월수호는 원거리 화력을 끊는 벽이다
**궁극기는 도전 대상이 아닌 주변 적을 밀어내고, 일정 거리 밖 챔피언의 피해를 막는다.** 아군 쪽으로 들어온 한 명을 도전 대상으로 남긴 뒤 나머지를 밀어 수적 우위를 만든다. 무조건 적진 깊숙이 쓰기보다 목표물 입구에서 원거리 지원을 차단하는 용도로도 활용한다.

## 오래 싸우되 퇴로 없는 추격은 피한다
**신 짜오는 기본 공격을 이어갈수록 회복과 기술 순환에서 이득을 본다.** 짧은 폭발 피해만 보고 혼자 들어가기보다 아군이 붙을 수 있는 범위에서 전선을 유지한다. 궁극기 경계가 끝날 시간을 계산하고, 종료 전에 다음 돌진 대상이나 빠질 방향을 정한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-xinzhao-20260915' OR (kind = 'article' AND title_key = '신짜오'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-xinzhao-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-xinzhao-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 풍전참뢰로 도전 대상을 만든다 · 세 번째 창끝을 확실히 맞힌다 · 현월수호 경계를 활용한다
[[분류:정글]] [[분류:AD]]

## 두 번째 타격이 진입 사거리를 연다
**풍전참뢰의 찌르기를 맞히면 대상이 도전 상태가 되어 무쌍돌격의 사거리가 늘어난다.**[* [신 짜오 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=75)] `W`를 멀리서 던지기보다 아군 제어와 둔화 뒤에 연결해 적중률을 높인다. 맞히지 못했다면 긴 돌진을 기대하지 말고 걸어서 압박하거나 다음 기회를 기다린다.

## 삼조격의 세 번째 공격까지 경로를 막는다
**Q를 켠 뒤 세 번째 기본 공격은 대상을 띄우므로, 첫 두 번을 치는 동안 상대가 빠질 방향을 선점해야 한다.** 무쌍돌격의 둔화와 공격 속도를 이용해 빠르게 연결하고, 재사용 대기시간 감소로 다음 기술 순환을 앞당긴다. 대상을 바꾸면 타격 수를 잃지 않도록 남은 횟수를 기억한다.

## 현월수호는 원거리 화력을 끊는 벽이다
**궁극기는 도전 대상이 아닌 주변 적을 밀어내고, 일정 거리 밖 챔피언의 피해를 막는다.** 아군 쪽으로 들어온 한 명을 도전 대상으로 남긴 뒤 나머지를 밀어 수적 우위를 만든다. 무조건 적진 깊숙이 쓰기보다 목표물 입구에서 원거리 지원을 차단하는 용도로도 활용한다.

## 오래 싸우되 퇴로 없는 추격은 피한다
**신 짜오는 기본 공격을 이어갈수록 회복과 기술 순환에서 이득을 본다.** 짧은 폭발 피해만 보고 혼자 들어가기보다 아군이 붙을 수 있는 범위에서 전선을 유지한다. 궁극기 경계가 끝날 시간을 계산하고, 종료 전에 다음 돌진 대상이나 빠질 방향을 정한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-xinzhao-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-xinzhao-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-xinzhao-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-xinzhao-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-xinzhao-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-xinzhao-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-xinzhao-20260915' AND target_key = '분류:ad');

-- 마스터 이 챔피언 위키 (893자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-masteryi-20260915', 'article', '마스터 이', '마스터이', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 일격 필살은 회피용으로 남긴다 · 명상으로 피해가 몰리는 순간을 넘긴다 · 처치 관여 뒤 기술을 다시 잇는다
[[분류:정글]] [[분류:AD]]

## 일격 필살은 먼저 누르는 진입기가 아니다
**마스터 이의 `Q`는 사용 중 대상으로 지정되지 않고, 기본 공격으로 재사용 대기시간이 줄어든다.**[* [마스터 이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=39)] 걸어서 닿을 수 있다면 기본 공격부터 시작하고 상대의 핵심 제어나 피해 기술이 나올 때 일격 필살로 피한다. 종료 위치를 선택해 다음 공격 거리와 퇴로도 함께 잡는다.

## 명상은 짧게 끊어도 목적을 달성한다
**명상은 집중하는 동안 회복과 피해 감소를 제공하고, 2연속 공격 중첩과 다른 강화 지속시간을 붙잡아 둔다.** 체력을 모두 채우려 고정된 채 오래 있지 말고 큰 피해 한 번을 넘긴 뒤 바로 공격을 잇는다. 상대가 제어 기술을 남겼다면 안전한 위치에서만 길게 사용한다.

## 우주류 검술과 기본 공격 시간을 확보한다
**무극검술은 일정 시간 기본 공격에 고정 피해를 더하므로 때릴 수 있는 구간에 맞춰 켠다.** 접근 전에 미리 소비하지 않고, 둔화 면역과 이동 속도를 주는 최후의 전사로 표적에 붙은 뒤 사용한다. 한 대상을 끝내기 전에 다음 이동 경로도 본다.

## 처치 관여가 기술 순환의 출발점이다
**궁극기 지속 중 처치에 관여하면 지속시간이 늘고 기본 기술의 재사용 대기시간도 크게 줄어든다.** 가장 단단한 적부터 치기보다 아군이 마무리할 수 있는 낮은 체력 대상을 함께 노린다. 첫 처치가 나오기 전에는 무리하게 깊어지지 않고, 나온 뒤에 초기화된 Q로 다음 위협을 피한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-masteryi-20260915' OR (kind = 'article' AND title_key = '마스터이'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-masteryi-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-masteryi-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 일격 필살은 회피용으로 남긴다 · 명상으로 피해가 몰리는 순간을 넘긴다 · 처치 관여 뒤 기술을 다시 잇는다
[[분류:정글]] [[분류:AD]]

## 일격 필살은 먼저 누르는 진입기가 아니다
**마스터 이의 `Q`는 사용 중 대상으로 지정되지 않고, 기본 공격으로 재사용 대기시간이 줄어든다.**[* [마스터 이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=39)] 걸어서 닿을 수 있다면 기본 공격부터 시작하고 상대의 핵심 제어나 피해 기술이 나올 때 일격 필살로 피한다. 종료 위치를 선택해 다음 공격 거리와 퇴로도 함께 잡는다.

## 명상은 짧게 끊어도 목적을 달성한다
**명상은 집중하는 동안 회복과 피해 감소를 제공하고, 2연속 공격 중첩과 다른 강화 지속시간을 붙잡아 둔다.** 체력을 모두 채우려 고정된 채 오래 있지 말고 큰 피해 한 번을 넘긴 뒤 바로 공격을 잇는다. 상대가 제어 기술을 남겼다면 안전한 위치에서만 길게 사용한다.

## 우주류 검술과 기본 공격 시간을 확보한다
**무극검술은 일정 시간 기본 공격에 고정 피해를 더하므로 때릴 수 있는 구간에 맞춰 켠다.** 접근 전에 미리 소비하지 않고, 둔화 면역과 이동 속도를 주는 최후의 전사로 표적에 붙은 뒤 사용한다. 한 대상을 끝내기 전에 다음 이동 경로도 본다.

## 처치 관여가 기술 순환의 출발점이다
**궁극기 지속 중 처치에 관여하면 지속시간이 늘고 기본 기술의 재사용 대기시간도 크게 줄어든다.** 가장 단단한 적부터 치기보다 아군이 마무리할 수 있는 낮은 체력 대상을 함께 노린다. 첫 처치가 나오기 전에는 무리하게 깊어지지 않고, 나온 뒤에 초기화된 Q로 다음 위협을 피한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-masteryi-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-masteryi-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-masteryi-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-masteryi-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-masteryi-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-masteryi-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-masteryi-20260915' AND target_key = '분류:ad');

-- 트런들 챔피언 위키 (884자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-trundle-20260915', 'article', '트런들', '트런들', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 깨물어 공격력을 빼앗는다 · 얼음 왕국 안에서 싸운다 · 기둥으로 이동 경로를 끊는다
[[분류:정글]] [[분류:AD]]

## 깨물기는 기본 공격 직후에 잇는다
**트런들의 `Q`는 강화 기본 공격으로 자신의 공격력을 높이고 상대 공격력을 낮춘다.**[* [트런들 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=65)] 기본 공격 뒤 곧바로 사용해 두 타격의 간격을 줄이고 캠프 정리와 근접 교전에서 우위를 만든다. 물리 공격이 강한 적에게 먼저 묻히면 아군이 받는 피해도 줄일 수 있다.

## 얼음 왕국이 끝나기 전에 싸움을 결정한다
**`W` 영역에서는 이동 속도와 공격 속도, 회복 효과가 커지므로 트런들의 전투력은 바닥에 깐 구역 안에 집중된다.** 상대가 밖으로 빠지면 무작정 따라가기보다 다음 기둥과 아군 합류를 기다린다. 목표물 앞에서는 오래 머물 자리에 미리 펼쳐 공격과 회복을 모두 살린다.

## 얼음 기둥은 벽보다 방향을 만드는 기술이다
**기둥은 통과할 수 없는 지형을 만들고 주변을 느리게 해, 좁은 입구와 퇴로를 바꾼다.** 상대 바로 중앙보다 도망갈 쪽 뒤에 세워 아군 방향으로 밀려나게 한다. 이동 기술이 끊길 수 있는 순간과 정신 집중을 방해할 순간을 기다리면 피해 기술 이상의 가치가 난다.

## 진압은 단단한 적을 약하게 만든다
**궁극기는 대상의 체력과 방어 능력을 시간에 걸쳐 빼앗아 트런들이 앞선을 버티게 한다.** 낮은 체력 마무리보다 저항력이 높은 적에게 먼저 사용해 아군의 집중 공격을 돕는다. 효과가 전부 들어오기 전에 너무 깊게 들어가지 말고, 약해진 앞선을 지나갈지 계속 때릴지 팀의 사거리로 결정한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-trundle-20260915' OR (kind = 'article' AND title_key = '트런들'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-trundle-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-trundle-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 깨물어 공격력을 빼앗는다 · 얼음 왕국 안에서 싸운다 · 기둥으로 이동 경로를 끊는다
[[분류:정글]] [[분류:AD]]

## 깨물기는 기본 공격 직후에 잇는다
**트런들의 `Q`는 강화 기본 공격으로 자신의 공격력을 높이고 상대 공격력을 낮춘다.**[* [트런들 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=65)] 기본 공격 뒤 곧바로 사용해 두 타격의 간격을 줄이고 캠프 정리와 근접 교전에서 우위를 만든다. 물리 공격이 강한 적에게 먼저 묻히면 아군이 받는 피해도 줄일 수 있다.

## 얼음 왕국이 끝나기 전에 싸움을 결정한다
**`W` 영역에서는 이동 속도와 공격 속도, 회복 효과가 커지므로 트런들의 전투력은 바닥에 깐 구역 안에 집중된다.** 상대가 밖으로 빠지면 무작정 따라가기보다 다음 기둥과 아군 합류를 기다린다. 목표물 앞에서는 오래 머물 자리에 미리 펼쳐 공격과 회복을 모두 살린다.

## 얼음 기둥은 벽보다 방향을 만드는 기술이다
**기둥은 통과할 수 없는 지형을 만들고 주변을 느리게 해, 좁은 입구와 퇴로를 바꾼다.** 상대 바로 중앙보다 도망갈 쪽 뒤에 세워 아군 방향으로 밀려나게 한다. 이동 기술이 끊길 수 있는 순간과 정신 집중을 방해할 순간을 기다리면 피해 기술 이상의 가치가 난다.

## 진압은 단단한 적을 약하게 만든다
**궁극기는 대상의 체력과 방어 능력을 시간에 걸쳐 빼앗아 트런들이 앞선을 버티게 한다.** 낮은 체력 마무리보다 저항력이 높은 적에게 먼저 사용해 아군의 집중 공격을 돕는다. 효과가 전부 들어오기 전에 너무 깊게 들어가지 말고, 약해진 앞선을 지나갈지 계속 때릴지 팀의 사거리로 결정한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-trundle-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-trundle-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-trundle-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-trundle-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-trundle-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-trundle-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-trundle-20260915' AND target_key = '분류:ad');

-- 니달리 챔피언 위키 (898자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-nidalee-20260915', 'article', '니달리', '니달리', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 사냥 표식을 먼저 만든다 · 인간과 쿠거 기술을 한 묶음으로 쓴다 · 긴 창을 던질 시야를 만든다
[[분류:정글]] [[분류:AD]]

## 사냥 표식이 두 형태를 연결한다
**니달리는 인간 형태의 창 투척이나 매복 덫으로 사냥을 남긴 뒤 쿠거 형태로 파고들 때 기술이 강화된다.**[* [니달리 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=44)] `Q` 창은 이동 거리가 길수록 강해지므로 시야 밖이나 아군 제어 뒤에 던진다. 표식이 없다면 무리한 급습보다 인간 형태 기본 공격과 다음 창으로 체력을 먼저 낮춘다.

## 캠프마다 두 형태의 기술을 모두 순환한다
**인간 형태의 회복과 공격 속도 증가를 사용한 뒤 쿠거의 광역 기술과 잃은 체력 비례 공격을 이어가면 정리가 매끄럽다.** 형태를 바꾸는 시간까지 동선에 포함하고, 쿠거 Q는 몬스터 체력이 낮아졌을 때 마무리한다. 다음 캠프로 움직일 방향에 급습을 써 이동 시간을 줄인다.

## 갱킹은 창 적중 뒤에도 한 번 더 확인한다
**사냥 대상에게 급습 사거리가 늘어나지만, 곧바로 뛰면 상대 이동기 뒤에서 고립될 수 있다.** 아군이 닿는 거리와 적 정글 위치를 보고 진입하고, 쿠거의 할퀴기와 숨통 끊기를 쓴 뒤 인간 형태로 돌아와 거리를 벌린다. 회복은 체력뿐 아니라 다음 기본 공격 속도까지 고려해 대상을 정한다.

## 목표물 주변 덫은 정보망이다
**매복 덫은 접근하는 적을 드러내고 사냥 표식을 남겨 니달리의 추격 경로를 연다.** 주요 입구와 벽 너머에 미리 배치하고, 정면 대치에서는 좁은 틈보다 측면 시야를 확보해 긴 창 각을 만든다. 창이 빗나간 순간에는 앞서지 말고 다음 재사용까지 거리를 유지한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-nidalee-20260915' OR (kind = 'article' AND title_key = '니달리'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-nidalee-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-nidalee-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 사냥 표식을 먼저 만든다 · 인간과 쿠거 기술을 한 묶음으로 쓴다 · 긴 창을 던질 시야를 만든다
[[분류:정글]] [[분류:AD]]

## 사냥 표식이 두 형태를 연결한다
**니달리는 인간 형태의 창 투척이나 매복 덫으로 사냥을 남긴 뒤 쿠거 형태로 파고들 때 기술이 강화된다.**[* [니달리 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=44)] `Q` 창은 이동 거리가 길수록 강해지므로 시야 밖이나 아군 제어 뒤에 던진다. 표식이 없다면 무리한 급습보다 인간 형태 기본 공격과 다음 창으로 체력을 먼저 낮춘다.

## 캠프마다 두 형태의 기술을 모두 순환한다
**인간 형태의 회복과 공격 속도 증가를 사용한 뒤 쿠거의 광역 기술과 잃은 체력 비례 공격을 이어가면 정리가 매끄럽다.** 형태를 바꾸는 시간까지 동선에 포함하고, 쿠거 Q는 몬스터 체력이 낮아졌을 때 마무리한다. 다음 캠프로 움직일 방향에 급습을 써 이동 시간을 줄인다.

## 갱킹은 창 적중 뒤에도 한 번 더 확인한다
**사냥 대상에게 급습 사거리가 늘어나지만, 곧바로 뛰면 상대 이동기 뒤에서 고립될 수 있다.** 아군이 닿는 거리와 적 정글 위치를 보고 진입하고, 쿠거의 할퀴기와 숨통 끊기를 쓴 뒤 인간 형태로 돌아와 거리를 벌린다. 회복은 체력뿐 아니라 다음 기본 공격 속도까지 고려해 대상을 정한다.

## 목표물 주변 덫은 정보망이다
**매복 덫은 접근하는 적을 드러내고 사냥 표식을 남겨 니달리의 추격 경로를 연다.** 주요 입구와 벽 너머에 미리 배치하고, 정면 대치에서는 좁은 틈보다 측면 시야를 확보해 긴 창 각을 만든다. 창이 빗나간 순간에는 앞서지 말고 다음 재사용까지 거리를 유지한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-nidalee-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-nidalee-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-nidalee-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-nidalee-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-nidalee-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-nidalee-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-nidalee-20260915' AND target_key = '분류:ad');

-- 벨베스 챔피언 위키 (888자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-belveth-20260915', 'article', '벨베스', '벨베스', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 네 방향 돌진을 따로 관리한다 · 여제의 소용돌이는 마무리에 쓴다 · 공허 산호 뒤 운영을 설계한다
[[분류:정글]] [[분류:AD]]

## 네 방향의 돌진은 각각 한 번씩 돌아온다
**벨베스의 공허 쇄도는 방향마다 재사용 대기시간이 따로 있어, 어느 방향을 썼는지가 다음 교전의 퇴로를 정한다.**[* [벨베스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=160)] 캠프 사이를 이동할 때 전투가 날 방향의 돌진은 남기고, `Q`로 공격을 통과시키며 기본 공격을 이어간다. 한 대상 주위를 돌되 모든 방향을 한꺼번에 소비하지 않는다.

## 위와 아래는 돌진을 다시 여는 기술이다
**공중으로 띄우는 W를 맞히면 적중 방향의 공허 쇄도 재사용 대기시간이 초기화된다.** 먼저 돌진해 각을 바꾼 뒤 W를 맞혀 같은 축으로 다시 움직인다. 빗나가면 추가 이동이 사라지므로 아군 제어나 상대가 좁은 길에 들어온 순간에 사용한다.

## 여제의 소용돌이는 낮은 체력에서 강하다
**`E` 동안 벨베스는 제자리에 고정되지만 피해를 줄이고 생명력 흡수를 얻으며, 가장 낮은 체력 대상을 빠르게 공격한다.** 첫 기술로 켜지 말고 상대의 큰 피해가 들어오거나 마무리가 가능한 순간을 기다린다. 제어 기술에 끊길 수 있으므로 핵심 방해 효과가 빠졌는지도 확인한다.

## 공허 산호는 다음 목표물까지 이어지는 보상이다
**챔피언이나 에픽 몬스터 처치 뒤 산호를 흡수하면 본모습으로 변해 전투 능력이 높아진다.** 에픽 산호로 공허 빨판상어를 만들 수 있을 때는 라인 압박과 다음 목표물 시간을 함께 설계한다. 산호를 먹는 순간의 폭발과 변신 시간을 고려해 안전부터 확보한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-belveth-20260915' OR (kind = 'article' AND title_key = '벨베스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-belveth-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-belveth-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 네 방향 돌진을 따로 관리한다 · 여제의 소용돌이는 마무리에 쓴다 · 공허 산호 뒤 운영을 설계한다
[[분류:정글]] [[분류:AD]]

## 네 방향의 돌진은 각각 한 번씩 돌아온다
**벨베스의 공허 쇄도는 방향마다 재사용 대기시간이 따로 있어, 어느 방향을 썼는지가 다음 교전의 퇴로를 정한다.**[* [벨베스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=160)] 캠프 사이를 이동할 때 전투가 날 방향의 돌진은 남기고, `Q`로 공격을 통과시키며 기본 공격을 이어간다. 한 대상 주위를 돌되 모든 방향을 한꺼번에 소비하지 않는다.

## 위와 아래는 돌진을 다시 여는 기술이다
**공중으로 띄우는 W를 맞히면 적중 방향의 공허 쇄도 재사용 대기시간이 초기화된다.** 먼저 돌진해 각을 바꾼 뒤 W를 맞혀 같은 축으로 다시 움직인다. 빗나가면 추가 이동이 사라지므로 아군 제어나 상대가 좁은 길에 들어온 순간에 사용한다.

## 여제의 소용돌이는 낮은 체력에서 강하다
**`E` 동안 벨베스는 제자리에 고정되지만 피해를 줄이고 생명력 흡수를 얻으며, 가장 낮은 체력 대상을 빠르게 공격한다.** 첫 기술로 켜지 말고 상대의 큰 피해가 들어오거나 마무리가 가능한 순간을 기다린다. 제어 기술에 끊길 수 있으므로 핵심 방해 효과가 빠졌는지도 확인한다.

## 공허 산호는 다음 목표물까지 이어지는 보상이다
**챔피언이나 에픽 몬스터 처치 뒤 산호를 흡수하면 본모습으로 변해 전투 능력이 높아진다.** 에픽 산호로 공허 빨판상어를 만들 수 있을 때는 라인 압박과 다음 목표물 시간을 함께 설계한다. 산호를 먹는 순간의 폭발과 변신 시간을 고려해 안전부터 확보한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-belveth-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-belveth-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-belveth-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-belveth-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-belveth-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-belveth-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-belveth-20260915' AND target_key = '분류:ad');

-- 브라이어 챔피언 위키 (899자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-briar-20260915', 'article', '브라이어', '브라이어', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 광분을 끝낼 방법부터 확보한다 · 깨물기로 마무리와 회복을 겸한다 · 궁극기 착지 뒤 공포 방향을 본다
[[분류:정글]] [[분류:AD]]

## 광분은 시작보다 종료 계획이 중요하다
**브라이어의 핏빛 광분은 강한 추격을 주지만 대상을 자동으로 쫓기 때문에, 잘못 쓰면 포탑이나 다수의 적에게 들어간다.**[* [브라이어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=165)] `W`를 누르기 전에 오싹한 비명을 사용할 수 있는지와 주변에 더 가까운 목표가 무엇인지 확인한다. 안전한 캠프에서 이동기로 쓰더라도 다음 교전까지 종료 수단을 남긴다.

## 깨물기는 체력이 낮을 때 가치가 커진다
**광분을 다시 사용하면 대상을 깨물어 잃은 체력에 비례한 피해를 주고 브라이어가 회복한다.** 시작하자마자 재사용하지 말고 상대 체력과 내 체력이 충분히 낮아진 순간에 쓴다. 머리부터 들이받기로 방어력을 낮춘 뒤 기본 공격을 이어 회복 기회를 만든다.

## 오싹한 비명은 버티기와 벽 충돌을 함께 노린다
**`E`를 충전하는 동안 피해를 줄여 받고 체력을 회복하며, 충분히 충전해 벽에 밀면 강한 제어를 만든다.** 광분을 끊는 용도만 생각하지 말고 적이 벽을 등지는 위치로 몰아간다. 다만 충전 방향이 보이므로 아군 제어와 겹치거나 좁은 길에서 사용한다.

## 불가항력적 죽음은 도착 뒤가 본체다
**궁극기는 처음 맞힌 챔피언에게 날아가 주변 적을 공포에 빠뜨리지만, 먼 거리 적중은 합류가 늦어질 위험도 크다.** 아군이 싸움을 이어갈 수 있는지 확인하고 발사한다. 착지 뒤 가장 가까운 적에게 광분하므로 핵심 대상과 주변 배치를 미리 보고, 필요하면 E로 즉시 방향을 되찾는다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-briar-20260915' OR (kind = 'article' AND title_key = '브라이어'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-briar-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-briar-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 광분을 끝낼 방법부터 확보한다 · 깨물기로 마무리와 회복을 겸한다 · 궁극기 착지 뒤 공포 방향을 본다
[[분류:정글]] [[분류:AD]]

## 광분은 시작보다 종료 계획이 중요하다
**브라이어의 핏빛 광분은 강한 추격을 주지만 대상을 자동으로 쫓기 때문에, 잘못 쓰면 포탑이나 다수의 적에게 들어간다.**[* [브라이어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=165)] `W`를 누르기 전에 오싹한 비명을 사용할 수 있는지와 주변에 더 가까운 목표가 무엇인지 확인한다. 안전한 캠프에서 이동기로 쓰더라도 다음 교전까지 종료 수단을 남긴다.

## 깨물기는 체력이 낮을 때 가치가 커진다
**광분을 다시 사용하면 대상을 깨물어 잃은 체력에 비례한 피해를 주고 브라이어가 회복한다.** 시작하자마자 재사용하지 말고 상대 체력과 내 체력이 충분히 낮아진 순간에 쓴다. 머리부터 들이받기로 방어력을 낮춘 뒤 기본 공격을 이어 회복 기회를 만든다.

## 오싹한 비명은 버티기와 벽 충돌을 함께 노린다
**`E`를 충전하는 동안 피해를 줄여 받고 체력을 회복하며, 충분히 충전해 벽에 밀면 강한 제어를 만든다.** 광분을 끊는 용도만 생각하지 말고 적이 벽을 등지는 위치로 몰아간다. 다만 충전 방향이 보이므로 아군 제어와 겹치거나 좁은 길에서 사용한다.

## 불가항력적 죽음은 도착 뒤가 본체다
**궁극기는 처음 맞힌 챔피언에게 날아가 주변 적을 공포에 빠뜨리지만, 먼 거리 적중은 합류가 늦어질 위험도 크다.** 아군이 싸움을 이어갈 수 있는지 확인하고 발사한다. 착지 뒤 가장 가까운 적에게 광분하므로 핵심 대상과 주변 배치를 미리 보고, 필요하면 E로 즉시 방향을 되찾는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-briar-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-briar-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-briar-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-briar-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-briar-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-briar-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-briar-20260915' AND target_key = '분류:ad');

-- 렉사이 챔피언 위키 (862자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-reksai-20260915', 'article', '렉사이', '렉사이', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 매복 시야의 한계를 이해한다 · 터널로 반복 가능한 경로를 만든다 · 분노를 채운 뒤 물어뜯는다
[[분류:정글]] [[분류:AD]]

## 매복 상태에서는 보이는 것보다 진동을 읽는다
**렉사이는 매복하면 시야가 좁아지는 대신 움직이는 적의 위치를 진동으로 감지한다.**[* [렉사이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=123)] `W` 상태로 강가와 정글 입구를 지나며 움직임을 확인하되, 멈춰 있는 적이나 설치물을 놓칠 수 있다는 점을 잊지 않는다. 확신 없이 돌출하면 핵심 띄우기를 허공에 쓰게 된다.

## 터널은 한 번의 이동기가 아니라 동선 자산이다
**성난 이빨로 만든 터널은 남아 있어 같은 구간을 다시 빠르게 오갈 수 있다.** 캠프와 라인, 주요 목표물을 연결하는 벽에 미리 만들어 다음 갱킹과 퇴로를 준비한다. 상대가 터널을 파괴할 수 있으므로 들어가기 전 출구가 살아 있는지 확인한다.

## 분노를 채운 물어뜯기로 교전을 끝낸다
**기본 공격과 여왕의 진노로 분노를 모은 뒤 E를 쓰면 피해가 커지고, 최대 분노에서는 고정 피해가 된다.** 돌출 직후 바로 물지 말고 Q의 세 번 강화 공격을 최대한 연결한다. 상대가 빠져나갈 때는 매복 Q로 위치를 드러내고 궁극기 표식을 준비한다.

## 공허의 돌진은 회피와 마무리를 겸한다
**궁극기는 피해를 입힌 대상을 표식으로 삼아 잠시 대상으로 지정되지 않은 채 뛰어든다.** 큰 기술이 들어오는 순간을 넘기고 낮은 체력을 마무리하는 데 맞춘다. 적진 깊숙한 대상만 보고 사용하지 말고, 도착 뒤 터널이나 아군에게 돌아갈 경로까지 계산한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-reksai-20260915' OR (kind = 'article' AND title_key = '렉사이'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-reksai-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-reksai-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 매복 시야의 한계를 이해한다 · 터널로 반복 가능한 경로를 만든다 · 분노를 채운 뒤 물어뜯는다
[[분류:정글]] [[분류:AD]]

## 매복 상태에서는 보이는 것보다 진동을 읽는다
**렉사이는 매복하면 시야가 좁아지는 대신 움직이는 적의 위치를 진동으로 감지한다.**[* [렉사이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=123)] `W` 상태로 강가와 정글 입구를 지나며 움직임을 확인하되, 멈춰 있는 적이나 설치물을 놓칠 수 있다는 점을 잊지 않는다. 확신 없이 돌출하면 핵심 띄우기를 허공에 쓰게 된다.

## 터널은 한 번의 이동기가 아니라 동선 자산이다
**성난 이빨로 만든 터널은 남아 있어 같은 구간을 다시 빠르게 오갈 수 있다.** 캠프와 라인, 주요 목표물을 연결하는 벽에 미리 만들어 다음 갱킹과 퇴로를 준비한다. 상대가 터널을 파괴할 수 있으므로 들어가기 전 출구가 살아 있는지 확인한다.

## 분노를 채운 물어뜯기로 교전을 끝낸다
**기본 공격과 여왕의 진노로 분노를 모은 뒤 E를 쓰면 피해가 커지고, 최대 분노에서는 고정 피해가 된다.** 돌출 직후 바로 물지 말고 Q의 세 번 강화 공격을 최대한 연결한다. 상대가 빠져나갈 때는 매복 Q로 위치를 드러내고 궁극기 표식을 준비한다.

## 공허의 돌진은 회피와 마무리를 겸한다
**궁극기는 피해를 입힌 대상을 표식으로 삼아 잠시 대상으로 지정되지 않은 채 뛰어든다.** 큰 기술이 들어오는 순간을 넘기고 낮은 체력을 마무리하는 데 맞춘다. 적진 깊숙한 대상만 보고 사용하지 말고, 도착 뒤 터널이나 아군에게 돌아갈 경로까지 계산한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-reksai-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-reksai-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-reksai-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-reksai-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-reksai-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-reksai-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-reksai-20260915' AND target_key = '분류:ad');

-- 샤코 챔피언 위키 (861자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-shaco-20260915', 'article', '샤코', '샤코', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 상자로 첫 동선과 도주로를 설계한다 · 속임수는 시야 밖에서 쓴다 · 환각으로 기술을 받아낸다
[[분류:정글]] [[분류:AD]]

## 깜짝 상자는 설치 시간이 곧 준비 시간이다
**샤코의 상자는 발동 전 준비가 필요하지만, 깨어나면 주변 적을 공포에 빠뜨리고 공격한다.**[* [샤코 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=54)] 첫 캠프 전에 공격이 집중될 위치에 겹치지 않게 두고, 이후에는 갱킹 퇴로와 목표물 입구에 미리 설치한다. `W`를 상대 발밑에 급히 놓기보다 도망갈 경로를 막는 데 쓴다.

## 속임수는 보이지 않는 각도에서 시작한다
**Q는 짧게 순간 이동한 뒤 은신하며, 은신 중 첫 기본 공격을 강화한다.** 정면 시야에서 사라지는 모습이 보이면 경로를 예상당하므로 벽과 수풀 뒤에서 사용한다. 도착하자마자 치기보다 상대가 이동기를 쓰거나 등을 보일 때까지 한 박자 기다린다.

## 양날 독은 마무리 전까지 손에 둔다
**E가 준비된 동안 기본 공격은 상대를 느리게 하고, 사용 피해는 체력이 낮은 대상에게 강해진다.** 갱킹 시작과 동시에 던지지 말고 둔화를 이용해 뒤에서 기본 공격을 이어간다. 상대가 공격 범위를 벗어나거나 마무리 체력이 되었을 때 투척한다.

## 환각은 분신을 만드는 동시에 피해를 피한다
**궁극기 시전 순간 샤코가 잠시 사라지므로 예고된 큰 피해와 제어를 흘릴 수 있다.** 분신을 본체와 다른 방향으로 보내 정보를 흔들고, 좁은 길이나 적 무리 안에서 터지도록 유도한다. 목표물 싸움에서는 분신으로 입구를 확인하되 본체의 강타 위치는 노출하지 않는다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-shaco-20260915' OR (kind = 'article' AND title_key = '샤코'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-shaco-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-shaco-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 상자로 첫 동선과 도주로를 설계한다 · 속임수는 시야 밖에서 쓴다 · 환각으로 기술을 받아낸다
[[분류:정글]] [[분류:AD]]

## 깜짝 상자는 설치 시간이 곧 준비 시간이다
**샤코의 상자는 발동 전 준비가 필요하지만, 깨어나면 주변 적을 공포에 빠뜨리고 공격한다.**[* [샤코 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=54)] 첫 캠프 전에 공격이 집중될 위치에 겹치지 않게 두고, 이후에는 갱킹 퇴로와 목표물 입구에 미리 설치한다. `W`를 상대 발밑에 급히 놓기보다 도망갈 경로를 막는 데 쓴다.

## 속임수는 보이지 않는 각도에서 시작한다
**Q는 짧게 순간 이동한 뒤 은신하며, 은신 중 첫 기본 공격을 강화한다.** 정면 시야에서 사라지는 모습이 보이면 경로를 예상당하므로 벽과 수풀 뒤에서 사용한다. 도착하자마자 치기보다 상대가 이동기를 쓰거나 등을 보일 때까지 한 박자 기다린다.

## 양날 독은 마무리 전까지 손에 둔다
**E가 준비된 동안 기본 공격은 상대를 느리게 하고, 사용 피해는 체력이 낮은 대상에게 강해진다.** 갱킹 시작과 동시에 던지지 말고 둔화를 이용해 뒤에서 기본 공격을 이어간다. 상대가 공격 범위를 벗어나거나 마무리 체력이 되었을 때 투척한다.

## 환각은 분신을 만드는 동시에 피해를 피한다
**궁극기 시전 순간 샤코가 잠시 사라지므로 예고된 큰 피해와 제어를 흘릴 수 있다.** 분신을 본체와 다른 방향으로 보내 정보를 흔들고, 좁은 길이나 적 무리 안에서 터지도록 유도한다. 목표물 싸움에서는 분신으로 입구를 확인하되 본체의 강타 위치는 노출하지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-shaco-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-shaco-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-shaco-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-shaco-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-shaco-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-shaco-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-shaco-20260915' AND target_key = '분류:ad');

-- 녹턴 챔피언 위키 (866자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-nocturne-20260915', 'article', '녹턴', '녹턴', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 황혼의 길 위에서 싸운다 · 어둠의 장막으로 핵심 기술을 막는다 · 피해망상은 합류 차이를 만든다
[[분류:정글]] [[분류:AD]]

## 황혼의 인도자를 먼저 맞혀 추격로를 만든다
**녹턴은 `Q`가 남긴 길 위에서 이동 속도와 공격력을 얻고 다른 유닛을 통과할 수 있다.**[* [녹턴 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=45)] 갱킹 시작 전에 상대가 달아날 방향으로 던져 길을 길게 만들고, 빗나가면 무리한 추격을 멈춘다. 캠프 사이에서도 몬스터를 관통해 다음 이동 방향까지 길을 잇는다.

## 말할 수 없는 공포는 거리를 유지해야 완성된다
**E는 대상을 연결한 뒤 일정 시간 범위 안에 있어야 공포가 발동한다.** 처음부터 상대 앞을 막아 도망가는 방향과 같은 쪽으로 움직이고, 이동기가 나올 때 황혼의 길 속도를 이용해 줄이 끊기지 않게 한다. 공포가 걸린 뒤 다음 기본 공격 시간을 확보한다.

## 어둠의 장막은 가장 큰 한 번을 기다린다
**W의 주문 방어막으로 기술을 막으면 공격 속도 증가 효과가 크게 강화된다.** 작은 견제에 먼저 쓰지 말고 진입을 멈추는 제어나 강한 단일 기술의 동작을 보고 사용한다. 방어막이 빠진 뒤에는 정면 추격보다 재사용까지 거리를 조절한다.

## 피해망상은 시야 차단과 돌진을 나눠 생각한다
**궁극기를 처음 켜면 적 팀의 시야 공유를 끊고, 다시 사용하면 선택한 적에게 돌진한다.** 아군이 다른 곳에서 진입하는 순간 먼저 어둠을 만들어 대응을 늦출 수 있다. 가장 먼 적보다 아군이 함께 마무리할 수 있는 고립 대상을 골라 첫 처치 뒤 목표물로 전환한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-nocturne-20260915' OR (kind = 'article' AND title_key = '녹턴'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-nocturne-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-nocturne-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 황혼의 길 위에서 싸운다 · 어둠의 장막으로 핵심 기술을 막는다 · 피해망상은 합류 차이를 만든다
[[분류:정글]] [[분류:AD]]

## 황혼의 인도자를 먼저 맞혀 추격로를 만든다
**녹턴은 `Q`가 남긴 길 위에서 이동 속도와 공격력을 얻고 다른 유닛을 통과할 수 있다.**[* [녹턴 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=45)] 갱킹 시작 전에 상대가 달아날 방향으로 던져 길을 길게 만들고, 빗나가면 무리한 추격을 멈춘다. 캠프 사이에서도 몬스터를 관통해 다음 이동 방향까지 길을 잇는다.

## 말할 수 없는 공포는 거리를 유지해야 완성된다
**E는 대상을 연결한 뒤 일정 시간 범위 안에 있어야 공포가 발동한다.** 처음부터 상대 앞을 막아 도망가는 방향과 같은 쪽으로 움직이고, 이동기가 나올 때 황혼의 길 속도를 이용해 줄이 끊기지 않게 한다. 공포가 걸린 뒤 다음 기본 공격 시간을 확보한다.

## 어둠의 장막은 가장 큰 한 번을 기다린다
**W의 주문 방어막으로 기술을 막으면 공격 속도 증가 효과가 크게 강화된다.** 작은 견제에 먼저 쓰지 말고 진입을 멈추는 제어나 강한 단일 기술의 동작을 보고 사용한다. 방어막이 빠진 뒤에는 정면 추격보다 재사용까지 거리를 조절한다.

## 피해망상은 시야 차단과 돌진을 나눠 생각한다
**궁극기를 처음 켜면 적 팀의 시야 공유를 끊고, 다시 사용하면 선택한 적에게 돌진한다.** 아군이 다른 곳에서 진입하는 순간 먼저 어둠을 만들어 대응을 늦출 수 있다. 가장 먼 적보다 아군이 함께 마무리할 수 있는 고립 대상을 골라 첫 처치 뒤 목표물로 전환한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-nocturne-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-nocturne-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-nocturne-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-nocturne-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-nocturne-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-nocturne-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-nocturne-20260915' AND target_key = '분류:ad');

-- 우디르 챔피언 위키 (880자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-udyr-20260915', 'article', '우디르', '우디르', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 태세 두 번의 기본 공격을 챙긴다 · 각성은 교전 목적에 맞춘다 · 곰 태세로 한 명씩 끊는다
[[분류:정글]] [[분류:AD]]

## 태세를 바꿀 때 강화 공격 두 번을 넣는다
**우디르는 태세를 사용하면 다음 두 기본 공격이 강화되므로 기술만 빠르게 돌리면 힘을 잃는다.**[* [우디르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=69)] 캠프에서는 `Q`와 R의 광역 피해를 상황에 맞게 섞고, W의 보호막과 회복 공격으로 체력을 관리한다. 다음 태세를 누르기 전에 강화 공격이 남았는지 확인한다.

## 각성은 재사용 대기시간이 긴 별도 자원이다
**같은 태세를 다시 누르면 각성 효과가 생겨 Q는 단일 피해, W는 생존, E는 방해 효과 대응, R은 추적 폭풍이 강해진다.** 습관적으로 정리 속도에 쓰지 말고 곧 일어날 갱킹과 교전에 필요한 효과를 남긴다. 각성 E는 진입을 막는 제어가 확실할 때 가치가 높다.

## 불길한 발걸음은 대상을 바꿔 가며 쓴다
**E 태세의 첫 기본 공격은 대상마다 별도 간격으로 기절시키므로 한 명만 오래 때리기보다 여러 적을 끊을 수 있다.** 갱킹에서는 이동 속도로 앞을 막은 뒤 공격하고, 한타에서는 앞선을 기절시킨 다음 핵심 대상에게 이동한다. 같은 대상의 면역 표시가 끝나기 전에는 다른 태세로 싸운다.

## 후반에는 각성 W와 E로 전선을 유지한다
**우디르는 긴 돌진이 없어 먼저 깊게 들어가면 원거리 공격에 노출된다.** 수풀과 좁은 길을 통해 접근하고, 아군이 닿는 선에서 기절과 폭풍을 반복한다. 목표물 앞에서는 각성 R로 입구를 막을지 각성 W로 집중 공격을 버틸지 미리 정한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-udyr-20260915' OR (kind = 'article' AND title_key = '우디르'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-udyr-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-udyr-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 태세 두 번의 기본 공격을 챙긴다 · 각성은 교전 목적에 맞춘다 · 곰 태세로 한 명씩 끊는다
[[분류:정글]] [[분류:AD]]

## 태세를 바꿀 때 강화 공격 두 번을 넣는다
**우디르는 태세를 사용하면 다음 두 기본 공격이 강화되므로 기술만 빠르게 돌리면 힘을 잃는다.**[* [우디르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=69)] 캠프에서는 `Q`와 R의 광역 피해를 상황에 맞게 섞고, W의 보호막과 회복 공격으로 체력을 관리한다. 다음 태세를 누르기 전에 강화 공격이 남았는지 확인한다.

## 각성은 재사용 대기시간이 긴 별도 자원이다
**같은 태세를 다시 누르면 각성 효과가 생겨 Q는 단일 피해, W는 생존, E는 방해 효과 대응, R은 추적 폭풍이 강해진다.** 습관적으로 정리 속도에 쓰지 말고 곧 일어날 갱킹과 교전에 필요한 효과를 남긴다. 각성 E는 진입을 막는 제어가 확실할 때 가치가 높다.

## 불길한 발걸음은 대상을 바꿔 가며 쓴다
**E 태세의 첫 기본 공격은 대상마다 별도 간격으로 기절시키므로 한 명만 오래 때리기보다 여러 적을 끊을 수 있다.** 갱킹에서는 이동 속도로 앞을 막은 뒤 공격하고, 한타에서는 앞선을 기절시킨 다음 핵심 대상에게 이동한다. 같은 대상의 면역 표시가 끝나기 전에는 다른 태세로 싸운다.

## 후반에는 각성 W와 E로 전선을 유지한다
**우디르는 긴 돌진이 없어 먼저 깊게 들어가면 원거리 공격에 노출된다.** 수풀과 좁은 길을 통해 접근하고, 아군이 닿는 선에서 기절과 폭풍을 반복한다. 목표물 앞에서는 각성 R로 입구를 막을지 각성 W로 집중 공격을 버틸지 미리 정한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-udyr-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-udyr-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-udyr-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-udyr-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-udyr-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-udyr-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-udyr-20260915' AND target_key = '분류:ad');

-- 워윅 챔피언 위키 (909자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-warwick-20260915', 'article', '워윅', '워윅', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 피 냄새로 전장을 읽는다 · 야수의 송곳니를 길게 눌러 이동을 따라간다 · 공포와 제압을 겹치지 않는다
[[분류:정글]] [[분류:AD]]

## 낮은 체력 표식은 정보이자 이동 경로다
**워윅은 체력이 낮은 적을 감지해 그 방향으로 빠르게 움직이고, 더 낮아지면 공격 속도도 크게 얻는다.**[* [워윅 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=74)] 멀리 보이는 피 냄새만 따라가기보다 사이의 적 시야와 합류 가능성을 확인한다. `W` 능동 효과는 근처 적을 찾아 갱킹 방향을 정하는 데 쓰되 전투 중 피해를 받으면 속도가 끊길 수 있음을 계산한다.

## 야수의 송곳니는 상대 이동을 따라붙는다
**Q를 길게 누르면 대상 뒤로 넘어가며 이동과 순간적인 위치 변화를 따라갈 수 있다.** 밀쳐내기나 이동기가 나올 타이밍에 사용해 줄을 붙잡고, 놓는 위치를 조절해 도망갈 방향을 막는다. 최대 체력 비례 피해와 회복이 있어 캠프와 근접 교전에서 체력 우위를 만든다.

## 원시의 포효는 피해 감소부터 활용한다
**E를 처음 누르면 받는 피해가 줄고, 다시 누르거나 시간이 끝나면 주변 적을 공포에 빠뜨린다.** 진입 전에 켜 집중 공격을 버틴 뒤 상대 퇴로 쪽에서 공포를 터뜨린다. 궁극기의 제압 중에도 재사용 시간을 계산하면 착지 직후 공포로 주변 적을 밀어낼 수 있다.

## 무한의 구속은 이동 속도가 사거리다
**궁극기 도약 거리는 현재 이동 속도에 따라 늘고 첫 챔피언을 제압한다.** 빠르다고 최대 거리에서 던지기보다 상대 이동기가 빠졌거나 아군 제어가 이어질 때 확실하게 맞힌다. 목표물 앞에서는 벽을 넘는 진입으로 상대 정글을 묶을지, 우리 딜러를 지키는 용도로 남길지 정한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-warwick-20260915' OR (kind = 'article' AND title_key = '워윅'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-warwick-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-warwick-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 피 냄새로 전장을 읽는다 · 야수의 송곳니를 길게 눌러 이동을 따라간다 · 공포와 제압을 겹치지 않는다
[[분류:정글]] [[분류:AD]]

## 낮은 체력 표식은 정보이자 이동 경로다
**워윅은 체력이 낮은 적을 감지해 그 방향으로 빠르게 움직이고, 더 낮아지면 공격 속도도 크게 얻는다.**[* [워윅 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=74)] 멀리 보이는 피 냄새만 따라가기보다 사이의 적 시야와 합류 가능성을 확인한다. `W` 능동 효과는 근처 적을 찾아 갱킹 방향을 정하는 데 쓰되 전투 중 피해를 받으면 속도가 끊길 수 있음을 계산한다.

## 야수의 송곳니는 상대 이동을 따라붙는다
**Q를 길게 누르면 대상 뒤로 넘어가며 이동과 순간적인 위치 변화를 따라갈 수 있다.** 밀쳐내기나 이동기가 나올 타이밍에 사용해 줄을 붙잡고, 놓는 위치를 조절해 도망갈 방향을 막는다. 최대 체력 비례 피해와 회복이 있어 캠프와 근접 교전에서 체력 우위를 만든다.

## 원시의 포효는 피해 감소부터 활용한다
**E를 처음 누르면 받는 피해가 줄고, 다시 누르거나 시간이 끝나면 주변 적을 공포에 빠뜨린다.** 진입 전에 켜 집중 공격을 버틴 뒤 상대 퇴로 쪽에서 공포를 터뜨린다. 궁극기의 제압 중에도 재사용 시간을 계산하면 착지 직후 공포로 주변 적을 밀어낼 수 있다.

## 무한의 구속은 이동 속도가 사거리다
**궁극기 도약 거리는 현재 이동 속도에 따라 늘고 첫 챔피언을 제압한다.** 빠르다고 최대 거리에서 던지기보다 상대 이동기가 빠졌거나 아군 제어가 이어질 때 확실하게 맞힌다. 목표물 앞에서는 벽을 넘는 진입으로 상대 정글을 묶을지, 우리 딜러를 지키는 용도로 남길지 정한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-warwick-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-warwick-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-warwick-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-warwick-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-warwick-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-warwick-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-warwick-20260915' AND target_key = '분류:ad');

-- 세주아니 챔피언 위키 (900자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ad-champion-sejuani-20260915', 'article', '세주아니', '세주아니', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 근접 아군과 서리 중첩을 만든다 · 혹한의 서릿발 두 타격을 맞힌다 · 빙하 감옥은 후속 거리를 본다
[[분류:정글]] [[분류:AD]]

## 근접 아군이 있는 라인에서 서리가 빨리 쌓인다
**세주아니의 E 중첩은 자신의 기술뿐 아니라 가까운 아군 근접 챔피언의 기본 공격으로도 쌓인다.**[* [세주아니 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=91)] 갱킹 전에 아군 유형과 호응 거리를 보고, 첫 공격 뒤 `W` 두 타격을 모두 맞혀 빠르게 네 중첩을 만든다. 빙결이 가능해질 때까지 무리하게 앞질러 가지 않는다.

## 혹한의 맹습은 진입과 차단 중 하나를 고른다
**`Q`는 벽을 넘고 처음 맞는 챔피언을 띄우지만, 사용 뒤에는 빠질 이동기가 없다.** 상대 이동기가 남았으면 걸어서 접근한 뒤 따라가고, 좁은 길에서는 들어오는 적을 끊기 위해 보유한다. 목표물 벽을 넘을 때도 강타 후 돌아올 경로를 먼저 확인한다.

## 혹한의 서릿발은 두 번째 휘두르기가 핵심이다
**W의 첫 공격은 좁게 밀며 둔화하고, 두 번째 공격은 넓고 강하게 서리 중첩을 쌓는다.** 상대가 피할 방향으로 몸을 움직여 두 번째 범위를 맞추고, 빙결 뒤에는 부서지는 추가 피해까지 아군과 함께 넣는다. 이미 빙결 면역인 대상에게 중첩을 낭비하지 않는다.

## 빙하 감옥은 팀이 닿는 거리에서 던진다
**궁극기는 처음 맞는 적 챔피언을 기절시키고 주변에 폭풍을 남겨 진형을 늦춘다.** 최대 거리 적중만 노리면 후속 공격이 닿지 않으므로 아군 이동기와 사거리를 기준으로 사용한다. 정면에서 맞히기 어렵다면 측면 시야를 지우고, 적 핵심 딜러보다 진입하는 적을 멈춰 전선을 지키는 선택도 한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-sejuani-20260915' OR (kind = 'article' AND title_key = '세주아니'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-champion-sejuani-20260915', id, NULL, 0, general, '정글 AD 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ad-champion-sejuani-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 근접 아군과 서리 중첩을 만든다 · 혹한의 서릿발 두 타격을 맞힌다 · 빙하 감옥은 후속 거리를 본다
[[분류:정글]] [[분류:AD]]

## 근접 아군이 있는 라인에서 서리가 빨리 쌓인다
**세주아니의 E 중첩은 자신의 기술뿐 아니라 가까운 아군 근접 챔피언의 기본 공격으로도 쌓인다.**[* [세주아니 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=91)] 갱킹 전에 아군 유형과 호응 거리를 보고, 첫 공격 뒤 `W` 두 타격을 모두 맞혀 빠르게 네 중첩을 만든다. 빙결이 가능해질 때까지 무리하게 앞질러 가지 않는다.

## 혹한의 맹습은 진입과 차단 중 하나를 고른다
**`Q`는 벽을 넘고 처음 맞는 챔피언을 띄우지만, 사용 뒤에는 빠질 이동기가 없다.** 상대 이동기가 남았으면 걸어서 접근한 뒤 따라가고, 좁은 길에서는 들어오는 적을 끊기 위해 보유한다. 목표물 벽을 넘을 때도 강타 후 돌아올 경로를 먼저 확인한다.

## 혹한의 서릿발은 두 번째 휘두르기가 핵심이다
**W의 첫 공격은 좁게 밀며 둔화하고, 두 번째 공격은 넓고 강하게 서리 중첩을 쌓는다.** 상대가 피할 방향으로 몸을 움직여 두 번째 범위를 맞추고, 빙결 뒤에는 부서지는 추가 피해까지 아군과 함께 넣는다. 이미 빙결 면역인 대상에게 중첩을 낭비하지 않는다.

## 빙하 감옥은 팀이 닿는 거리에서 던진다
**궁극기는 처음 맞는 적 챔피언을 기절시키고 주변에 폭풍을 남겨 진형을 늦춘다.** 최대 거리 적중만 노리면 후속 공격이 닿지 않으므로 아군 이동기와 사거리를 기준으로 사용한다. 정면에서 맞히기 어렵다면 측면 시야를 지우고, 적 핵심 딜러보다 진입하는 적을 멈춰 전선을 지키는 선택도 한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-champion-sejuani-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-sejuani-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-sejuani-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-sejuani-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ad-champion-sejuani-20260915', NULL, '분류:ad', '분류:AD' FROM wiki_docs WHERE id = 'doc-jungle-ad-champion-sejuani-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ad-champion-sejuani-20260915' AND target_key = '분류:ad');

-- viego 상대법 (847자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-viego', 'matchup', NULL, NULL, 'published', 'viego', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 첫 처치 대상을 내주지 않는다 · 안개 가장자리를 경계한다 · 빙의 종료 지점을 함께 노린다

## 첫 처치가 나오기 전까지 체력을 고르게 지킨다
**비에고는 쓰러진 적을 지배해 회복하고 기술을 새로 쓰므로, 낮은 체력 한 명이 교전 전체의 발판이 된다.**[* [비에고 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=154)] 불리한 아군은 일찍 빠지고 나머지는 같은 대상을 집중한다. `Q`에 맞은 뒤 기본 공격을 허용하면 추가 공격과 회복이 생기므로 표식이 보이면 잠시 거리를 둔다.

## 안개 안으로 확인 없이 들어가지 않는다
**망령의 길이 벽을 감싸면 비에고는 위장과 이동 능력을 얻어 접근 방향을 숨긴다.** 강가와 목표물 입구의 안개 가장자리를 시야로 덮고, 사라진 비에고를 좁은 길에서 쫓지 않는다. 충전한 W는 첫 대상을 기절시키므로 앞선이나 소환물로 직선을 막는다.

## 빙의 중에는 원래 몸의 위치를 기억한다
**비에고가 아군의 몸을 차지하면 잠시 대상으로 지정할 수 없지만, 빌린 기술을 쓴 뒤 궁극기로 빠져나올 가능성이 높다.** 위험한 기술을 빼는 동안 흩어지지 말고 다음 착지 지점을 둘러싼다. 빙의한 몸이 약하더라도 모든 기술을 한꺼번에 쓰지 않는다.

## 좁은 목표물 전투에서 처치 순서를 통제한다
**비에고가 벽 너머에서 낮은 체력 대상을 마무리하면 연쇄 지배가 시작된다.** 체력이 빠진 아군은 구덩이 밖 안전한 방향으로 먼저 이탈하고, 군중 제어는 비에고가 진입한 직후에 겹친다. 궁극기 착지 충격에 밀려나지 않도록 핵심 딜러끼리 지나치게 붙지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-viego' AND kind = 'matchup' AND champion_slug = 'viego'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-viego');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-viego-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-viego' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 첫 처치 대상을 내주지 않는다 · 안개 가장자리를 경계한다 · 빙의 종료 지점을 함께 노린다

## 첫 처치가 나오기 전까지 체력을 고르게 지킨다
**비에고는 쓰러진 적을 지배해 회복하고 기술을 새로 쓰므로, 낮은 체력 한 명이 교전 전체의 발판이 된다.**[* [비에고 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=154)] 불리한 아군은 일찍 빠지고 나머지는 같은 대상을 집중한다. `Q`에 맞은 뒤 기본 공격을 허용하면 추가 공격과 회복이 생기므로 표식이 보이면 잠시 거리를 둔다.

## 안개 안으로 확인 없이 들어가지 않는다
**망령의 길이 벽을 감싸면 비에고는 위장과 이동 능력을 얻어 접근 방향을 숨긴다.** 강가와 목표물 입구의 안개 가장자리를 시야로 덮고, 사라진 비에고를 좁은 길에서 쫓지 않는다. 충전한 W는 첫 대상을 기절시키므로 앞선이나 소환물로 직선을 막는다.

## 빙의 중에는 원래 몸의 위치를 기억한다
**비에고가 아군의 몸을 차지하면 잠시 대상으로 지정할 수 없지만, 빌린 기술을 쓴 뒤 궁극기로 빠져나올 가능성이 높다.** 위험한 기술을 빼는 동안 흩어지지 말고 다음 착지 지점을 둘러싼다. 빙의한 몸이 약하더라도 모든 기술을 한꺼번에 쓰지 않는다.

## 좁은 목표물 전투에서 처치 순서를 통제한다
**비에고가 벽 너머에서 낮은 체력 대상을 마무리하면 연쇄 지배가 시작된다.** 체력이 빠진 아군은 구덩이 밖 안전한 방향으로 먼저 이탈하고, 군중 제어는 비에고가 진입한 직후에 겹친다. 궁극기 착지 충격에 밀려나지 않도록 핵심 딜러끼리 지나치게 붙지 않는다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-viego-20260915');

-- graves 상대법 (822자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-graves', 'matchup', NULL, NULL, 'published', 'graves', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 산탄을 미니언과 나눠 맞는다 · 벽에서 화약 역류를 피한다 · 연막 밖으로 즉시 빠진다

## 가까운 거리에서 정면으로 맞서지 않는다
**그레이브즈의 기본 공격은 가까이서 여러 탄환이 맞을수록 강하지만 유닛에 막힐 수 있다.**[* [그레이브즈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=85)] 갱킹을 받으면 미니언이나 몬스터를 사이에 두고 한 발씩 비껴 맞게 만든다. 재장전 동작이 보일 때 이동기를 쓰거나 거리를 벌려 다음 탄환의 각을 망가뜨린다.

## 벽과 좁은 길에서 화약 역류를 경계한다
**`Q`는 잠시 뒤 되돌아오지만 벽에 닿으면 훨씬 빠르게 폭발한다.** 정글 모서리에서 그레이브즈와 같은 선에 서지 말고 열린 쪽으로 피한다. 첫 타격을 맞았더라도 되돌아오는 범위에서 즉시 벗어나 두 번의 피해를 모두 받지 않는다.

## 빨리 뽑기 중첩이 쌓인 싸움을 길게 끌지 않는다
**그레이브즈는 E와 기본 공격으로 방어 중첩을 유지해 물리 피해에 단단해진다.** 캠프를 치고 나온 직후 중첩 표시를 보고, 높다면 짧은 교환보다 제어를 겹쳐 끊거나 싸움을 미룬다. 돌진 방향을 본 뒤 남은 사거리 밖으로 이동해 다음 산탄을 피한다.

## 연막탄에서는 공격보다 탈출을 우선한다
**연막 안에 있으면 바깥 시야가 크게 제한돼 합류와 기술 방향을 알기 어렵다.** 가장 가까운 가장자리로 곧장 빠지고, 보이지 않는 대상을 향해 이동기를 낭비하지 않는다. 목표물 앞에서는 입구에 연막이 깔릴 것을 예상해 한 방향에 몰리지 않고 진입로를 나눈다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-graves' AND kind = 'matchup' AND champion_slug = 'graves'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-graves');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-graves-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-graves' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 산탄을 미니언과 나눠 맞는다 · 벽에서 화약 역류를 피한다 · 연막 밖으로 즉시 빠진다

## 가까운 거리에서 정면으로 맞서지 않는다
**그레이브즈의 기본 공격은 가까이서 여러 탄환이 맞을수록 강하지만 유닛에 막힐 수 있다.**[* [그레이브즈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=85)] 갱킹을 받으면 미니언이나 몬스터를 사이에 두고 한 발씩 비껴 맞게 만든다. 재장전 동작이 보일 때 이동기를 쓰거나 거리를 벌려 다음 탄환의 각을 망가뜨린다.

## 벽과 좁은 길에서 화약 역류를 경계한다
**`Q`는 잠시 뒤 되돌아오지만 벽에 닿으면 훨씬 빠르게 폭발한다.** 정글 모서리에서 그레이브즈와 같은 선에 서지 말고 열린 쪽으로 피한다. 첫 타격을 맞았더라도 되돌아오는 범위에서 즉시 벗어나 두 번의 피해를 모두 받지 않는다.

## 빨리 뽑기 중첩이 쌓인 싸움을 길게 끌지 않는다
**그레이브즈는 E와 기본 공격으로 방어 중첩을 유지해 물리 피해에 단단해진다.** 캠프를 치고 나온 직후 중첩 표시를 보고, 높다면 짧은 교환보다 제어를 겹쳐 끊거나 싸움을 미룬다. 돌진 방향을 본 뒤 남은 사거리 밖으로 이동해 다음 산탄을 피한다.

## 연막탄에서는 공격보다 탈출을 우선한다
**연막 안에 있으면 바깥 시야가 크게 제한돼 합류와 기술 방향을 알기 어렵다.** 가장 가까운 가장자리로 곧장 빠지고, 보이지 않는 대상을 향해 이동기를 낭비하지 않는다. 목표물 앞에서는 입구에 연막이 깔릴 것을 예상해 한 방향에 몰리지 않고 진입로를 나눈다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-graves-20260915');

-- kindred 상대법 (825자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-kindred', 'matchup', NULL, NULL, 'published', 'kindred', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 표식 캠프에 혼자 가지 않는다 · 늑대 영역 밖으로 물러난다 · 안식처 종료에 피해를 맞춘다

## 표식은 킨드레드의 위치를 예측하는 단서다
**표시된 정글 캠프는 킨드레드가 노릴 가능성이 높지만, 먼저 도착했다고 혼자 싸워야 하는 것은 아니다.**[* [킨드레드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=127)] 주변 라인 주도권이 없으면 캠프를 포기하고 반대편을 취한다. 지킬 때는 여러 명이 시야를 먼저 잡고 `Q`로 넘을 벽 양쪽을 동시에 막는다.

## 늑대의 광기 안에서는 추격하지 않는다
**W 영역 안에서 킨드레드는 화살의 춤을 더 자주 써 거리를 계속 바꾼다.** 영역 밖으로 빠져 지속시간을 소모시키고, 끝난 뒤 이동기가 길어진 순간에 접근한다. 차오르는 공포가 묻었다면 세 번째 공격 전에 시야를 끊거나 사거리 밖으로 나간다.

## 양의 안식처는 끝나는 순간이 승부다
**궁극기 안의 모든 유닛은 일정 체력 아래로 내려가지 않고 종료 시 회복하므로, 안에서 마무리 기술을 먼저 쓰면 손해다.** 종료 표시를 보고 군중 제어와 폭발 피해를 맞춘다. 킨드레드가 원 가장자리에 서면 밀치거나 끌어내 생존 효과를 잃게 만든다.

## 원거리 기본 공격 시간을 주지 않는다
**킨드레드는 한 번 거리를 잡으면 도약과 둔화로 계속 때릴 수 있다.** 진입할 때는 한 명씩 달려들지 말고 서로 다른 각에서 이동기를 맞춘다. 목표물 싸움에서는 구덩이 벽을 넘나드는 위치를 시야로 밝혀, 안전하게 표식을 쌓거나 강타 싸움을 미루지 못하게 한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-kindred' AND kind = 'matchup' AND champion_slug = 'kindred'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-kindred');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-kindred-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-kindred' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 표식 캠프에 혼자 가지 않는다 · 늑대 영역 밖으로 물러난다 · 안식처 종료에 피해를 맞춘다

## 표식은 킨드레드의 위치를 예측하는 단서다
**표시된 정글 캠프는 킨드레드가 노릴 가능성이 높지만, 먼저 도착했다고 혼자 싸워야 하는 것은 아니다.**[* [킨드레드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=127)] 주변 라인 주도권이 없으면 캠프를 포기하고 반대편을 취한다. 지킬 때는 여러 명이 시야를 먼저 잡고 `Q`로 넘을 벽 양쪽을 동시에 막는다.

## 늑대의 광기 안에서는 추격하지 않는다
**W 영역 안에서 킨드레드는 화살의 춤을 더 자주 써 거리를 계속 바꾼다.** 영역 밖으로 빠져 지속시간을 소모시키고, 끝난 뒤 이동기가 길어진 순간에 접근한다. 차오르는 공포가 묻었다면 세 번째 공격 전에 시야를 끊거나 사거리 밖으로 나간다.

## 양의 안식처는 끝나는 순간이 승부다
**궁극기 안의 모든 유닛은 일정 체력 아래로 내려가지 않고 종료 시 회복하므로, 안에서 마무리 기술을 먼저 쓰면 손해다.** 종료 표시를 보고 군중 제어와 폭발 피해를 맞춘다. 킨드레드가 원 가장자리에 서면 밀치거나 끌어내 생존 효과를 잃게 만든다.

## 원거리 기본 공격 시간을 주지 않는다
**킨드레드는 한 번 거리를 잡으면 도약과 둔화로 계속 때릴 수 있다.** 진입할 때는 한 명씩 달려들지 말고 서로 다른 각에서 이동기를 맞춘다. 목표물 싸움에서는 구덩이 벽을 넘나드는 위치를 시야로 밝혀, 안전하게 표식을 쌓거나 강타 싸움을 미루지 못하게 한다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-kindred-20260915');

-- rengar 상대법 (824자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-rengar', 'matchup', NULL, NULL, 'published', 'rengar', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 수풀과 거리를 둔다 · 야성에 맞춰 강화 기술을 예측한다 · 궁극기 표식이 뜨면 뭉친다

## 수풀은 렝가의 추가 이동기다
**렝가는 수풀에서 기본 공격으로 도약하므로, 강가와 라인 수풀 가까이 서면 보이는 거리보다 훨씬 멀리서 붙는다.**[* [렝가 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=103)] 시야만 꽂고 바로 옆에 머물지 말고 열린 쪽으로 간격을 둔다. `Q` 강화 공격 뒤 맞교환보다 첫 피해를 흘리고 수풀 반대 방향으로 빠진다.

## 야성 네 칸이 되면 다음 기술의 역할이 바뀐다
**강화 W는 최근 받은 피해를 크게 회복하고 방해 효과를 해제하며, 강화 E는 둔화가 아니라 속박이 된다.** 야성이 가득 찬 렝가에게 단일 제어 하나만 믿고 들어가지 않는다. 회복을 쓴 뒤에 피해를 집중하거나, 속박 투사체가 빠진 뒤 이동기를 사용한다.

## 사냥의 전율 경고가 뜨면 혼자 시야를 보러 가지 않는다
**궁극기 중 렝가는 가장 가까운 적을 감지하고 위장 상태로 접근해 도약할 수 있다.** 머리 위 표식이 보이면 아군과 붙고, 원거리 견제보다 보호 기술과 즉시 제어를 준비한다. 얇은 벽 너머까지 진입할 수 있으므로 포탑만 믿고 가장자리로 빠지지 않는다.

## 첫 진입 뒤 수풀 복귀를 차단한다
**렝가는 대상을 터뜨린 뒤 수풀에 닿으면 다음 도약으로 전투를 이어간다.** 목표물 주변 수풀의 시야를 유지하고 퇴로에 제어를 둔다. 낮은 체력 아군은 렝가가 보이는 방향과 반대로 일찍 이탈해 강화 공격의 연쇄 대상을 만들지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-rengar' AND kind = 'matchup' AND champion_slug = 'rengar'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-rengar');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-rengar-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-rengar' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 수풀과 거리를 둔다 · 야성에 맞춰 강화 기술을 예측한다 · 궁극기 표식이 뜨면 뭉친다

## 수풀은 렝가의 추가 이동기다
**렝가는 수풀에서 기본 공격으로 도약하므로, 강가와 라인 수풀 가까이 서면 보이는 거리보다 훨씬 멀리서 붙는다.**[* [렝가 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=103)] 시야만 꽂고 바로 옆에 머물지 말고 열린 쪽으로 간격을 둔다. `Q` 강화 공격 뒤 맞교환보다 첫 피해를 흘리고 수풀 반대 방향으로 빠진다.

## 야성 네 칸이 되면 다음 기술의 역할이 바뀐다
**강화 W는 최근 받은 피해를 크게 회복하고 방해 효과를 해제하며, 강화 E는 둔화가 아니라 속박이 된다.** 야성이 가득 찬 렝가에게 단일 제어 하나만 믿고 들어가지 않는다. 회복을 쓴 뒤에 피해를 집중하거나, 속박 투사체가 빠진 뒤 이동기를 사용한다.

## 사냥의 전율 경고가 뜨면 혼자 시야를 보러 가지 않는다
**궁극기 중 렝가는 가장 가까운 적을 감지하고 위장 상태로 접근해 도약할 수 있다.** 머리 위 표식이 보이면 아군과 붙고, 원거리 견제보다 보호 기술과 즉시 제어를 준비한다. 얇은 벽 너머까지 진입할 수 있으므로 포탑만 믿고 가장자리로 빠지지 않는다.

## 첫 진입 뒤 수풀 복귀를 차단한다
**렝가는 대상을 터뜨린 뒤 수풀에 닿으면 다음 도약으로 전투를 이어간다.** 목표물 주변 수풀의 시야를 유지하고 퇴로에 제어를 둔다. 낮은 체력 아군은 렝가가 보이는 방향과 반대로 일찍 이탈해 강화 공격의 연쇄 대상을 만들지 않는다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-rengar-20260915');

-- khazix 상대법 (828자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-khazix', 'matchup', NULL, NULL, 'published', 'khazix', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 아군이나 유닛 곁에서 고립을 푼다 · 도약이 빠진 뒤 붙는다 · 은신 사이 위치를 예측한다

## 고립 표식이 뜨는 위치에서 싸우지 않는다
**카직스는 주변에 아군이 없는 대상에게 공포 감지로 큰 추가 피해를 준다.**[* [카직스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=105)] 정글에서 마주치면 가까운 아군, 미니언, 몬스터 쪽으로 이동해 고립을 해제한다. `Q`를 한 번 버텼다고 긴 싸움을 이어가지 말고 재사용되기 전에 함께 움직인다.

## 도약을 먼저 쓴 카직스에게 퇴로를 주지 않는다
**E로 진입하면 기본적으로 즉시 다시 빠질 수 없으므로 그 순간이 제어를 집중할 때다.** 착지 지점에 기술을 두고 각자 다른 방향으로 도망치지 않는다. 진화한 도약은 처치 관여 뒤 초기화될 수 있어 낮은 체력 아군이 근처에 남지 않게 한다.

## 공허의 가시는 정면 뒤의 회복까지 막는다
**`W`는 맞은 대상을 느리게 하고 카직스가 폭발 범위에 있으면 회복시킨다.** 일직선으로 추격하지 말고 옆으로 피하며, 진화한 여러 가시가 좁은 입구를 덮을 때는 잠시 진입을 미룬다. 수풀 확인용 가시에 맞았다면 위치가 드러났다고 보고 즉시 자리를 바꾼다.

## 궁극기 은신 동안 기술을 허공에 쓰지 않는다
**카직스는 잠깐씩 은신하며 이동 속도를 얻어 위치를 바꿀 수 있다.** 마지막으로 보인 방향만 따라가지 말고 아군과 원을 좁혀 다음 기본 공격 순간에 제어한다. 목표물 체력이 낮아질수록 벽 너머 고립된 아군을 노리므로 구덩이 안팎의 간격을 유지한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-khazix' AND kind = 'matchup' AND champion_slug = 'khazix'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-khazix');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-khazix-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-khazix' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 아군이나 유닛 곁에서 고립을 푼다 · 도약이 빠진 뒤 붙는다 · 은신 사이 위치를 예측한다

## 고립 표식이 뜨는 위치에서 싸우지 않는다
**카직스는 주변에 아군이 없는 대상에게 공포 감지로 큰 추가 피해를 준다.**[* [카직스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=105)] 정글에서 마주치면 가까운 아군, 미니언, 몬스터 쪽으로 이동해 고립을 해제한다. `Q`를 한 번 버텼다고 긴 싸움을 이어가지 말고 재사용되기 전에 함께 움직인다.

## 도약을 먼저 쓴 카직스에게 퇴로를 주지 않는다
**E로 진입하면 기본적으로 즉시 다시 빠질 수 없으므로 그 순간이 제어를 집중할 때다.** 착지 지점에 기술을 두고 각자 다른 방향으로 도망치지 않는다. 진화한 도약은 처치 관여 뒤 초기화될 수 있어 낮은 체력 아군이 근처에 남지 않게 한다.

## 공허의 가시는 정면 뒤의 회복까지 막는다
**`W`는 맞은 대상을 느리게 하고 카직스가 폭발 범위에 있으면 회복시킨다.** 일직선으로 추격하지 말고 옆으로 피하며, 진화한 여러 가시가 좁은 입구를 덮을 때는 잠시 진입을 미룬다. 수풀 확인용 가시에 맞았다면 위치가 드러났다고 보고 즉시 자리를 바꾼다.

## 궁극기 은신 동안 기술을 허공에 쓰지 않는다
**카직스는 잠깐씩 은신하며 이동 속도를 얻어 위치를 바꿀 수 있다.** 마지막으로 보인 방향만 따라가지 말고 아군과 원을 좁혀 다음 기본 공격 순간에 제어한다. 목표물 체력이 낮아질수록 벽 너머 고립된 아군을 노리므로 구덩이 안팎의 간격을 유지한다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-khazix-20260915');

-- hecarim 상대법 (834자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-hecarim', 'matchup', NULL, NULL, 'published', 'hecarim', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 달려오는 방향과 직각으로 빠진다 · 회오리 중첩이 끝날 때 싸운다 · 궁극기 착지 뒤에 제어한다

## 파멸의 돌격이 밀어낼 방향을 바꾼다
**헤카림의 E는 이동 속도가 오르며 다음 공격으로 대상을 밀어내므로, 일직선으로 도망치면 적진 쪽으로 배달되기 쉽다.**[* [헤카림 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=96)] `E` 소리가 들리면 옆으로 빠져 뒤를 잡지 못하게 하고, 포탑 쪽 벽을 등진다. 진입 전 가속 구간에 둔화를 써도 한 번에 멈출 것이라 기대하지 않는다.

## 회오리 베기 중첩이 없는 순간을 고른다
**헤카림은 Q를 연속 적중하면 다음 사용이 빨라지고 피해가 커진다.** 캠프를 막 정리한 헤카림은 중첩을 들고 올 수 있으므로 표시와 시간을 확인한다. 중첩이 끊긴 뒤 짧게 싸우고, 여러 명이 가까이 서서 광역 피해를 모두 맞지 않는다.

## 공포의 망령 범위에서는 피해를 나누지 않는다
**`W`가 켜진 동안 주변 적이 받는 피해 일부로 헤카림이 회복하고 방어 능력도 오른다.** 효과가 보이면 화력이 부족한 교전을 길게 끌지 말고 범위 밖으로 빠진다. 반드시 잡아야 한다면 회복 감소보다 확실한 제어와 집중 피해로 지속시간을 주지 않는다.

## 그림자의 맹습이 끝난 위치를 노린다
**궁극기 돌진 자체를 멈추기 어렵지만 공포는 헤카림의 착지 위치에서 퍼진다.** 정면으로 뭉치지 말고 옆 간격을 벌려 한 번에 진형이 무너지지 않게 한다. 착지와 공포가 끝난 직후 퇴로에 제어를 겹치면, 이미 E를 쓴 헤카림의 이탈을 막을 수 있다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-hecarim' AND kind = 'matchup' AND champion_slug = 'hecarim'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-hecarim');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-hecarim-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-hecarim' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 달려오는 방향과 직각으로 빠진다 · 회오리 중첩이 끝날 때 싸운다 · 궁극기 착지 뒤에 제어한다

## 파멸의 돌격이 밀어낼 방향을 바꾼다
**헤카림의 E는 이동 속도가 오르며 다음 공격으로 대상을 밀어내므로, 일직선으로 도망치면 적진 쪽으로 배달되기 쉽다.**[* [헤카림 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=96)] `E` 소리가 들리면 옆으로 빠져 뒤를 잡지 못하게 하고, 포탑 쪽 벽을 등진다. 진입 전 가속 구간에 둔화를 써도 한 번에 멈출 것이라 기대하지 않는다.

## 회오리 베기 중첩이 없는 순간을 고른다
**헤카림은 Q를 연속 적중하면 다음 사용이 빨라지고 피해가 커진다.** 캠프를 막 정리한 헤카림은 중첩을 들고 올 수 있으므로 표시와 시간을 확인한다. 중첩이 끊긴 뒤 짧게 싸우고, 여러 명이 가까이 서서 광역 피해를 모두 맞지 않는다.

## 공포의 망령 범위에서는 피해를 나누지 않는다
**`W`가 켜진 동안 주변 적이 받는 피해 일부로 헤카림이 회복하고 방어 능력도 오른다.** 효과가 보이면 화력이 부족한 교전을 길게 끌지 말고 범위 밖으로 빠진다. 반드시 잡아야 한다면 회복 감소보다 확실한 제어와 집중 피해로 지속시간을 주지 않는다.

## 그림자의 맹습이 끝난 위치를 노린다
**궁극기 돌진 자체를 멈추기 어렵지만 공포는 헤카림의 착지 위치에서 퍼진다.** 정면으로 뭉치지 말고 옆 간격을 벌려 한 번에 진형이 무너지지 않게 한다. 착지와 공포가 끝난 직후 퇴로에 제어를 겹치면, 이미 E를 쓴 헤카림의 이탈을 막을 수 있다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-hecarim-20260915');

-- jarvaniv 상대법 (830자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-jarvaniv', 'matchup', NULL, NULL, 'published', 'jarvaniv', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 깃발과 자르반 사이 선을 피한다 · 깃창이 빠지면 거리를 좁힌다 · 대격변 밖 탈출 수단을 남긴다

## 깃발이 꽂힌 순간 이동 경로를 읽는다
**자르반 4세가 `E` 깃발을 세운 뒤 Q로 찌르면 깃발까지 이동하며 선상의 적을 띄운다.**[* [자르반 4세 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=24)] 깃발 자체보다 자르반과 깃발을 잇는 직선에서 옆으로 벗어난다. 첫 기술을 맞았더라도 두 번째 연계를 피하면 진입과 제어를 함께 빼낼 수 있다.

## 깃창이 빠진 뒤에는 벽 너머 퇴로가 없다
**Q와 E를 사용한 자르반은 잠시 같은 방식으로 이동할 수 없다.** 빗나간 직후 거리를 좁혀 압박하고, 기본 공격의 체력 비례 추가 피해는 같은 대상에게 연속 발동하지 않는다는 점을 이용해 짧게 대응한다. 황금빛 방패가 켜지면 둔화 범위 밖으로 잠깐 빠진다.

## 대격변 전에 이동기를 아낀다
**궁극기는 대상에게 뛰어들어 원형 지형을 만들지만 벽을 넘는 기술로 빠져나올 수 있다.** 갱킹 시작에 이동기를 모두 쓰지 말고 자르반이 궁극기를 쓴 뒤 바깥으로 빠진다. 탈출 수단이 없는 아군은 서로 겹치지 않아 광역 피해를 줄이고 바깥 아군이 지형 너머를 지원한다.

## 자르반과 후속 진입을 분리한다
**자르반 혼자 들어온 것처럼 보여도 깃발의 공격 속도와 대격변 지형이 아군 합류를 돕는다.** 본체만 쫓기보다 뒤따르는 적의 길을 끊고 원거리 화력을 차단한다. 목표물 앞에서는 깃창으로 벽을 넘을 각에 시야를 두고, 들어온 뒤 구덩이 밖 퇴로를 막는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-jarvaniv' AND kind = 'matchup' AND champion_slug = 'jarvaniv'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-jarvaniv');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-jarvaniv-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-jarvaniv' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 깃발과 자르반 사이 선을 피한다 · 깃창이 빠지면 거리를 좁힌다 · 대격변 밖 탈출 수단을 남긴다

## 깃발이 꽂힌 순간 이동 경로를 읽는다
**자르반 4세가 `E` 깃발을 세운 뒤 Q로 찌르면 깃발까지 이동하며 선상의 적을 띄운다.**[* [자르반 4세 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=24)] 깃발 자체보다 자르반과 깃발을 잇는 직선에서 옆으로 벗어난다. 첫 기술을 맞았더라도 두 번째 연계를 피하면 진입과 제어를 함께 빼낼 수 있다.

## 깃창이 빠진 뒤에는 벽 너머 퇴로가 없다
**Q와 E를 사용한 자르반은 잠시 같은 방식으로 이동할 수 없다.** 빗나간 직후 거리를 좁혀 압박하고, 기본 공격의 체력 비례 추가 피해는 같은 대상에게 연속 발동하지 않는다는 점을 이용해 짧게 대응한다. 황금빛 방패가 켜지면 둔화 범위 밖으로 잠깐 빠진다.

## 대격변 전에 이동기를 아낀다
**궁극기는 대상에게 뛰어들어 원형 지형을 만들지만 벽을 넘는 기술로 빠져나올 수 있다.** 갱킹 시작에 이동기를 모두 쓰지 말고 자르반이 궁극기를 쓴 뒤 바깥으로 빠진다. 탈출 수단이 없는 아군은 서로 겹치지 않아 광역 피해를 줄이고 바깥 아군이 지형 너머를 지원한다.

## 자르반과 후속 진입을 분리한다
**자르반 혼자 들어온 것처럼 보여도 깃발의 공격 속도와 대격변 지형이 아군 합류를 돕는다.** 본체만 쫓기보다 뒤따르는 적의 길을 끊고 원거리 화력을 차단한다. 목표물 앞에서는 깃창으로 벽을 넘을 각에 시야를 두고, 들어온 뒤 구덩이 밖 퇴로를 막는다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-jarvaniv-20260915');

-- vi 상대법 (838자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-vi', 'matchup', NULL, NULL, 'published', 'vi', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 금고 부수기 충전 방향을 본다 · 세 번째 타격 전에 거리를 둔다 · 궁극기 대상과 한 줄로 서지 않는다

## 금고 부수기는 옆으로 피한다
**바이의 `Q`는 충전 중 이동이 느려지고 첫 챔피언에 닿으면 멈추므로, 직선에서 비켜나는 것이 가장 확실하다.**[* [바이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=109)] 시야 밖이나 벽 너머에서 시작하면 반응 시간이 짧아지므로 강가 입구를 미리 밝힌다. 빗나간 바이는 깊은 위치에 멈추니 즉시 제어해 퇴로를 끊는다.

## 찌그러뜨리기 세 번째 중첩을 허용하지 않는다
**같은 대상이 세 번 맞으면 추가 피해와 방어력 감소가 발생하고 바이의 공격 속도가 오른다.** 두 중첩이 보이면 잠시 거리를 벌리거나 시야를 끊어 효과 시간을 흘린다. 과도한 힘의 원뿔 피해가 뒤까지 닿으므로 앞선 바로 뒤에 겹쳐 서지 않는다.

## 기동타격은 대상보다 경로도 위험하다
**궁극기는 선택한 적을 끝까지 추격해 띄우고, 지나가는 다른 적도 옆으로 밀며 기절시킨다.** 대상이 된 아군은 팀 한가운데로 뛰기보다 보호받을 수 있는 옆 공간으로 이동한다. 나머지는 바이의 이동선에서 빠져 같은 제어를 받지 말고 착지 지점에 기술을 준비한다.

## 보호막이 켜진 순간 피해를 나눠 넣는다
**바이는 기술로 적을 맞히면 쌓아 둔 폭발 보호막을 얻는다.** 보호막이 보일 때 작은 공격을 모두 소비하지 말고 잠시 기다렸다가 사라진 뒤 집중한다. 목표물 싸움에서는 궁극기로 정글러를 묶을 수 있으니 체력이 낮아지기 전에 바이의 위치부터 차단한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-vi' AND kind = 'matchup' AND champion_slug = 'vi'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-vi');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-vi-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-vi' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 금고 부수기 충전 방향을 본다 · 세 번째 타격 전에 거리를 둔다 · 궁극기 대상과 한 줄로 서지 않는다

## 금고 부수기는 옆으로 피한다
**바이의 `Q`는 충전 중 이동이 느려지고 첫 챔피언에 닿으면 멈추므로, 직선에서 비켜나는 것이 가장 확실하다.**[* [바이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=109)] 시야 밖이나 벽 너머에서 시작하면 반응 시간이 짧아지므로 강가 입구를 미리 밝힌다. 빗나간 바이는 깊은 위치에 멈추니 즉시 제어해 퇴로를 끊는다.

## 찌그러뜨리기 세 번째 중첩을 허용하지 않는다
**같은 대상이 세 번 맞으면 추가 피해와 방어력 감소가 발생하고 바이의 공격 속도가 오른다.** 두 중첩이 보이면 잠시 거리를 벌리거나 시야를 끊어 효과 시간을 흘린다. 과도한 힘의 원뿔 피해가 뒤까지 닿으므로 앞선 바로 뒤에 겹쳐 서지 않는다.

## 기동타격은 대상보다 경로도 위험하다
**궁극기는 선택한 적을 끝까지 추격해 띄우고, 지나가는 다른 적도 옆으로 밀며 기절시킨다.** 대상이 된 아군은 팀 한가운데로 뛰기보다 보호받을 수 있는 옆 공간으로 이동한다. 나머지는 바이의 이동선에서 빠져 같은 제어를 받지 말고 착지 지점에 기술을 준비한다.

## 보호막이 켜진 순간 피해를 나눠 넣는다
**바이는 기술로 적을 맞히면 쌓아 둔 폭발 보호막을 얻는다.** 보호막이 보일 때 작은 공격을 모두 소비하지 말고 잠시 기다렸다가 사라진 뒤 집중한다. 목표물 싸움에서는 궁극기로 정글러를 묶을 수 있으니 체력이 낮아지기 전에 바이의 위치부터 차단한다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-vi-20260915');

-- xinzhao 상대법 (830자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-xinzhao', 'matchup', NULL, NULL, 'published', 'xinzhao', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 풍전참뢰 찌르기를 피한다 · 세 번째 기본 공격 전에 끊는다 · 현월수호 안팎을 구분한다

## 풍전참뢰 두 번째 타격을 옆으로 피한다
**신 짜오는 W의 긴 찌르기를 맞힌 대상을 도전 상태로 만들어 무쌍돌격의 사거리를 늘린다.**[* [신 짜오 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=75)] 첫 휘두르기가 보이면 뒤로만 빠지지 말고 옆으로 움직여 찌르기 선을 벗어난다. `W`가 빗나가면 긴 거리에서 바로 붙기 어려우므로 그때 시야나 거리를 되찾는다.

## 삼조격의 세 번째 공격을 기다리지 않는다
**Q를 켠 신 짜오는 세 번째 기본 공격으로 대상을 띄우고 공격할 때마다 다른 기술의 재사용 대기시간도 줄인다.** 첫 두 타격을 맞았다면 이동기나 제어로 즉시 간격을 만든다. 공격 속도가 오른 상태에서 근접전을 오래 이어 주지 않는다.

## 현월수호 밖에서 공격하지 않는다
**궁극기 경계 바깥의 챔피언이 주는 피해는 신 짜오에게 닿지 않는다.** 원거리 공격을 계속 낭비하지 말고 경계 안으로 들어갈 수 있는 아군과 시간을 맞추거나 지속시간을 기다린다. 도전 대상이 아닌 주변 적은 밀려나므로 여러 명이 한 방향에서 진입하지 않는다.

## 도전 대상과 팀 사이를 벌리지 않는다
**신 짜오는 한 명을 도전 대상으로 정한 뒤 나머지를 밀어 일대일 구도를 만들기 좋다.** 표식이 묻은 아군은 적진 쪽으로 도망치지 말고 보호 기술이 닿는 방향으로 이동한다. 목표물 앞에서는 돌진 대상이 될 유닛을 입구에 내주지 말고 벽 너머 찌르기 시야를 확보한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-xinzhao' AND kind = 'matchup' AND champion_slug = 'xinzhao'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-xinzhao');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-xinzhao-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-xinzhao' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 풍전참뢰 찌르기를 피한다 · 세 번째 기본 공격 전에 끊는다 · 현월수호 안팎을 구분한다

## 풍전참뢰 두 번째 타격을 옆으로 피한다
**신 짜오는 W의 긴 찌르기를 맞힌 대상을 도전 상태로 만들어 무쌍돌격의 사거리를 늘린다.**[* [신 짜오 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=75)] 첫 휘두르기가 보이면 뒤로만 빠지지 말고 옆으로 움직여 찌르기 선을 벗어난다. `W`가 빗나가면 긴 거리에서 바로 붙기 어려우므로 그때 시야나 거리를 되찾는다.

## 삼조격의 세 번째 공격을 기다리지 않는다
**Q를 켠 신 짜오는 세 번째 기본 공격으로 대상을 띄우고 공격할 때마다 다른 기술의 재사용 대기시간도 줄인다.** 첫 두 타격을 맞았다면 이동기나 제어로 즉시 간격을 만든다. 공격 속도가 오른 상태에서 근접전을 오래 이어 주지 않는다.

## 현월수호 밖에서 공격하지 않는다
**궁극기 경계 바깥의 챔피언이 주는 피해는 신 짜오에게 닿지 않는다.** 원거리 공격을 계속 낭비하지 말고 경계 안으로 들어갈 수 있는 아군과 시간을 맞추거나 지속시간을 기다린다. 도전 대상이 아닌 주변 적은 밀려나므로 여러 명이 한 방향에서 진입하지 않는다.

## 도전 대상과 팀 사이를 벌리지 않는다
**신 짜오는 한 명을 도전 대상으로 정한 뒤 나머지를 밀어 일대일 구도를 만들기 좋다.** 표식이 묻은 아군은 적진 쪽으로 도망치지 말고 보호 기술이 닿는 방향으로 이동한다. 목표물 앞에서는 돌진 대상이 될 유닛을 입구에 내주지 말고 벽 너머 찌르기 시야를 확보한다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-xinzhao-20260915');

-- masteryi 상대법 (850자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-masteryi', 'matchup', NULL, NULL, 'published', 'masteryi', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 일격 필살이 끝날 자리를 기다린다 · 명상은 제어로 끊는다 · 첫 처치 관여를 내주지 않는다

## 일격 필살 중 기술을 허공에 쓰지 않는다
**마스터 이는 `Q` 사용 중 대상으로 지정할 수 없지만, 선택한 대상 주변에 다시 나타나 공격을 이어간다.**[* [마스터 이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=39)] 사라지는 순간 논타깃 기술을 던지지 말고 종료 위치를 예상해 제어를 둔다. 기본 공격이 Q의 재사용을 줄이므로 거리를 내준 채 오래 때리게 하지 않는다.

## 명상은 회복보다 피해 감소가 위험하다
**W를 켜면 큰 피해를 줄여 받고 체력을 회복하므로 마무리 기술을 그대로 넣으면 손해가 난다.** 밀치기, 띄우기, 기절처럼 정신 집중을 끊는 기술을 하나 남긴다. 끊을 수 없다면 지속시간을 기다린 뒤 다시 집중하고, 명상 중 너무 가까이 모이지 않는다.

## 최후의 전사에는 둔화가 통하지 않는다
**궁극기 동안 이동과 공격 속도가 오르고 둔화에 면역이므로 느리게 하는 기술만으로는 추격을 멈출 수 없다.** 속박이나 기절처럼 이동 자체를 막는 효과를 순서대로 사용한다. 한꺼번에 겹치지 말고 일격 필살이 끝난 순간부터 이어 준다.

## 첫 처치가 나오기 전에 전투를 정리한다
**처치에 관여하면 궁극기 시간이 늘고 기본 기술 재사용 대기시간이 크게 줄어 다음 대상을 바로 노릴 수 있다.** 낮은 체력 아군은 일찍 빠지고 마스터 이를 한 대상처럼 함께 집중한다. 목표물 전투에서도 딜러보다 먼저 들어온 이를 살려 두지 말되, 강타 담당이 Q로 사라질 순간을 계산한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-masteryi' AND kind = 'matchup' AND champion_slug = 'masteryi'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-masteryi');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-masteryi-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-masteryi' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 일격 필살이 끝날 자리를 기다린다 · 명상은 제어로 끊는다 · 첫 처치 관여를 내주지 않는다

## 일격 필살 중 기술을 허공에 쓰지 않는다
**마스터 이는 `Q` 사용 중 대상으로 지정할 수 없지만, 선택한 대상 주변에 다시 나타나 공격을 이어간다.**[* [마스터 이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=39)] 사라지는 순간 논타깃 기술을 던지지 말고 종료 위치를 예상해 제어를 둔다. 기본 공격이 Q의 재사용을 줄이므로 거리를 내준 채 오래 때리게 하지 않는다.

## 명상은 회복보다 피해 감소가 위험하다
**W를 켜면 큰 피해를 줄여 받고 체력을 회복하므로 마무리 기술을 그대로 넣으면 손해가 난다.** 밀치기, 띄우기, 기절처럼 정신 집중을 끊는 기술을 하나 남긴다. 끊을 수 없다면 지속시간을 기다린 뒤 다시 집중하고, 명상 중 너무 가까이 모이지 않는다.

## 최후의 전사에는 둔화가 통하지 않는다
**궁극기 동안 이동과 공격 속도가 오르고 둔화에 면역이므로 느리게 하는 기술만으로는 추격을 멈출 수 없다.** 속박이나 기절처럼 이동 자체를 막는 효과를 순서대로 사용한다. 한꺼번에 겹치지 말고 일격 필살이 끝난 순간부터 이어 준다.

## 첫 처치가 나오기 전에 전투를 정리한다
**처치에 관여하면 궁극기 시간이 늘고 기본 기술 재사용 대기시간이 크게 줄어 다음 대상을 바로 노릴 수 있다.** 낮은 체력 아군은 일찍 빠지고 마스터 이를 한 대상처럼 함께 집중한다. 목표물 전투에서도 딜러보다 먼저 들어온 이를 살려 두지 말되, 강타 담당이 Q로 사라질 순간을 계산한다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-masteryi-20260915');

-- trundle 상대법 (817자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-trundle', 'matchup', NULL, NULL, 'published', 'trundle', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 얼음 왕국 밖으로 나온다 · 기둥과 벽 사이를 피한다 · 진압 대상은 전선에서 물러난다

## 깨물기 뒤 근접 교환을 길게 하지 않는다
**트런들의 `Q`는 자신의 공격력을 높이고 대상의 공격력을 낮춰 다음 기본 공격 싸움을 유리하게 만든다.**[* [트런들 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=65)] 한 번 물렸다면 바로 맞서기보다 짧게 거리를 벌려 강화 시간을 흘린다. 기본 공격 사이에 Q가 빠르게 들어오므로 체력만 보고 같은 횟수로 교환하지 않는다.

## 얼음 왕국 밖으로 전장을 옮긴다
**W 영역 안에서 트런들은 이동과 공격 속도, 회복 효과가 모두 강해진다.** 바닥이 깔리면 그 안에서 추격전을 하지 말고 열린 방향으로 빠진다. 목표물 위에 영역이 놓이면 바로 들어가기보다 지속시간과 기둥 위치를 확인해 다른 입구를 고른다.

## 얼음 기둥과 지형 사이에 갇히지 않는다
**기둥은 순간적으로 위치를 밀고 통과할 수 없는 지형과 둔화 구역을 만든다.** 좁은 입구 중앙을 지나지 말고 벽과 간격을 두며, 정신 집중 기술은 기둥이 빠진 뒤 사용한다. 기둥이 한쪽 퇴로를 막으면 반대쪽으로 즉시 방향을 통일한다.

## 진압을 맞은 앞선은 잠시 물러난다
**궁극기는 시간에 걸쳐 체력과 방어력, 마법 저항력을 빼앗아 트런들을 단단하게 만든다.** 효과가 묻은 탱커를 믿고 전투를 계속 열지 말고 약화가 끝날 때까지 거리를 둔다. 트런들에게 화력을 낭비하기보다 뒤의 아군을 분리하고, 진압 종료 뒤 다시 앞선을 세운다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-trundle' AND kind = 'matchup' AND champion_slug = 'trundle'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-trundle');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-trundle-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-trundle' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 얼음 왕국 밖으로 나온다 · 기둥과 벽 사이를 피한다 · 진압 대상은 전선에서 물러난다

## 깨물기 뒤 근접 교환을 길게 하지 않는다
**트런들의 `Q`는 자신의 공격력을 높이고 대상의 공격력을 낮춰 다음 기본 공격 싸움을 유리하게 만든다.**[* [트런들 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=65)] 한 번 물렸다면 바로 맞서기보다 짧게 거리를 벌려 강화 시간을 흘린다. 기본 공격 사이에 Q가 빠르게 들어오므로 체력만 보고 같은 횟수로 교환하지 않는다.

## 얼음 왕국 밖으로 전장을 옮긴다
**W 영역 안에서 트런들은 이동과 공격 속도, 회복 효과가 모두 강해진다.** 바닥이 깔리면 그 안에서 추격전을 하지 말고 열린 방향으로 빠진다. 목표물 위에 영역이 놓이면 바로 들어가기보다 지속시간과 기둥 위치를 확인해 다른 입구를 고른다.

## 얼음 기둥과 지형 사이에 갇히지 않는다
**기둥은 순간적으로 위치를 밀고 통과할 수 없는 지형과 둔화 구역을 만든다.** 좁은 입구 중앙을 지나지 말고 벽과 간격을 두며, 정신 집중 기술은 기둥이 빠진 뒤 사용한다. 기둥이 한쪽 퇴로를 막으면 반대쪽으로 즉시 방향을 통일한다.

## 진압을 맞은 앞선은 잠시 물러난다
**궁극기는 시간에 걸쳐 체력과 방어력, 마법 저항력을 빼앗아 트런들을 단단하게 만든다.** 효과가 묻은 탱커를 믿고 전투를 계속 열지 말고 약화가 끝날 때까지 거리를 둔다. 트런들에게 화력을 낭비하기보다 뒤의 아군을 분리하고, 진압 종료 뒤 다시 앞선을 세운다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-trundle-20260915');

-- nidalee 상대법 (839자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-nidalee', 'matchup', NULL, NULL, 'published', 'nidalee', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 긴 창은 옆으로 피한다 · 사냥 표식이 묻으면 뒤로 빠진다 · 덫으로 열린 측면을 확인한다

## 창과 거리를 벌릴수록 더 아프다
**니달리의 인간 형태 `Q`는 날아온 거리가 길수록 피해가 커지므로, 뒤로만 달아나기보다 투사체와 직각으로 움직인다.**[* [니달리 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=44)] 미니언과 앞선을 사이에 두고 시야 없는 좁은 길을 일직선으로 걷지 않는다. 창이 빗나간 직후에는 쿠거 급습의 긴 사거리가 열리지 않으므로 전진할 수 있다.

## 사냥 표식이 묻으면 쿠거 진입을 기다린다
**창이나 덫에 맞은 대상은 드러나고, 니달리가 그쪽으로 빨라지며 쿠거 기술도 강화된다.** 표식이 끝날 때까지 아군 쪽으로 물러나고 혼자 벽 근처에 남지 않는다. 니달리가 급습으로 들어온 순간 제어를 맞춘 뒤, 인간 형태로 돌아갈 퇴로를 막는다.

## 매복 덫은 목표물 주변 경로를 제한한다
**덫을 밟으면 피해보다 위치 노출과 사냥 효과가 더 큰 문제다.** 강가 수풀과 구덩이 입구를 탐지하며 한 줄로 들어가지 않는다. 덫을 발견하면 원거리 공격이나 안전한 앞선으로 제거하고, 우회하다 긴 창의 직선에 서지 않도록 한다.

## 체력이 낮은 상태로 숨통 끊기를 받지 않는다
**쿠거 Q는 대상이 잃은 체력에 비례해 강해져 마무리력이 높다.** 체력이 빠진 아군은 니달리가 변신하기 전에 전선에서 이탈하고, 회복을 받은 대상의 공격 속도 증가까지 고려해 짧게 싸운다. 목표물 체력이 낮을 때는 창을 피할 공간을 남기고 니달리의 벽 넘기 위치를 밝힌다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-nidalee' AND kind = 'matchup' AND champion_slug = 'nidalee'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-nidalee');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-nidalee-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-nidalee' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 긴 창은 옆으로 피한다 · 사냥 표식이 묻으면 뒤로 빠진다 · 덫으로 열린 측면을 확인한다

## 창과 거리를 벌릴수록 더 아프다
**니달리의 인간 형태 `Q`는 날아온 거리가 길수록 피해가 커지므로, 뒤로만 달아나기보다 투사체와 직각으로 움직인다.**[* [니달리 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=44)] 미니언과 앞선을 사이에 두고 시야 없는 좁은 길을 일직선으로 걷지 않는다. 창이 빗나간 직후에는 쿠거 급습의 긴 사거리가 열리지 않으므로 전진할 수 있다.

## 사냥 표식이 묻으면 쿠거 진입을 기다린다
**창이나 덫에 맞은 대상은 드러나고, 니달리가 그쪽으로 빨라지며 쿠거 기술도 강화된다.** 표식이 끝날 때까지 아군 쪽으로 물러나고 혼자 벽 근처에 남지 않는다. 니달리가 급습으로 들어온 순간 제어를 맞춘 뒤, 인간 형태로 돌아갈 퇴로를 막는다.

## 매복 덫은 목표물 주변 경로를 제한한다
**덫을 밟으면 피해보다 위치 노출과 사냥 효과가 더 큰 문제다.** 강가 수풀과 구덩이 입구를 탐지하며 한 줄로 들어가지 않는다. 덫을 발견하면 원거리 공격이나 안전한 앞선으로 제거하고, 우회하다 긴 창의 직선에 서지 않도록 한다.

## 체력이 낮은 상태로 숨통 끊기를 받지 않는다
**쿠거 Q는 대상이 잃은 체력에 비례해 강해져 마무리력이 높다.** 체력이 빠진 아군은 니달리가 변신하기 전에 전선에서 이탈하고, 회복을 받은 대상의 공격 속도 증가까지 고려해 짧게 싸운다. 목표물 체력이 낮을 때는 창을 피할 공간을 남기고 니달리의 벽 넘기 위치를 밝힌다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-nidalee-20260915');

-- belveth 상대법 (816자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-belveth', 'matchup', NULL, NULL, 'published', 'belveth', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 사용한 돌진 방향을 기억한다 · 여제의 소용돌이를 제어한다 · 공허 산호를 안전하게 먹지 못하게 한다

## 네 방향 돌진을 모두 같은 기술로 보지 않는다
**벨베스의 `Q`는 방향별로 재사용 대기시간이 따로 돌아, 방금 쓴 방향으로는 곧바로 다시 움직일 수 없다.**[* [벨베스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=160)] 돌진한 반대쪽 퇴로를 막고, 남은 대각선 방향에 기술을 둔다. 한 번 피했다고 직선으로 쫓기보다 다음 돌진 가능 방향을 본다.

## 공허 산호의 위와 아래를 피한다
**W에 맞으면 공중에 뜨고 해당 방향의 돌진이 다시 준비돼 연속 이동을 허용한다.** 첫 돌진 뒤 바로 추격하지 말고 띄우기 범위를 옆으로 피한다. 빗나간 순간 벨베스의 이동 선택지가 줄어드므로 그때 제어를 집중한다.

## 여제의 소용돌이는 끊거나 범위를 벗어난다
**E 동안 벨베스는 제자리에 서서 받는 피해를 줄이고 가장 체력이 낮은 적을 빠르게 공격하며 회복한다.** 마무리 피해를 그대로 붓지 말고 끊을 수 있는 제어를 사용한다. 끊지 못한다면 사거리 밖으로 빠져 지속시간을 흘리고 종료 뒤 공격한다.

## 산호를 먹는 시간을 공짜로 주지 않는다
**챔피언과 에픽 몬스터 처치 뒤 생긴 공허 산호를 흡수하면 벨베스가 본모습으로 변하고 폭발 피해를 낸다.** 산호 주변에 바로 겹치지 말고 흡수 동작과 폭발 범위를 본다. 에픽 산호를 내주면 라인 압박이 커지므로 다음 목표물보다 생성되는 공허 생명체의 진로를 먼저 정리한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-belveth' AND kind = 'matchup' AND champion_slug = 'belveth'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-belveth');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-belveth-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-belveth' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 사용한 돌진 방향을 기억한다 · 여제의 소용돌이를 제어한다 · 공허 산호를 안전하게 먹지 못하게 한다

## 네 방향 돌진을 모두 같은 기술로 보지 않는다
**벨베스의 `Q`는 방향별로 재사용 대기시간이 따로 돌아, 방금 쓴 방향으로는 곧바로 다시 움직일 수 없다.**[* [벨베스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=160)] 돌진한 반대쪽 퇴로를 막고, 남은 대각선 방향에 기술을 둔다. 한 번 피했다고 직선으로 쫓기보다 다음 돌진 가능 방향을 본다.

## 공허 산호의 위와 아래를 피한다
**W에 맞으면 공중에 뜨고 해당 방향의 돌진이 다시 준비돼 연속 이동을 허용한다.** 첫 돌진 뒤 바로 추격하지 말고 띄우기 범위를 옆으로 피한다. 빗나간 순간 벨베스의 이동 선택지가 줄어드므로 그때 제어를 집중한다.

## 여제의 소용돌이는 끊거나 범위를 벗어난다
**E 동안 벨베스는 제자리에 서서 받는 피해를 줄이고 가장 체력이 낮은 적을 빠르게 공격하며 회복한다.** 마무리 피해를 그대로 붓지 말고 끊을 수 있는 제어를 사용한다. 끊지 못한다면 사거리 밖으로 빠져 지속시간을 흘리고 종료 뒤 공격한다.

## 산호를 먹는 시간을 공짜로 주지 않는다
**챔피언과 에픽 몬스터 처치 뒤 생긴 공허 산호를 흡수하면 벨베스가 본모습으로 변하고 폭발 피해를 낸다.** 산호 주변에 바로 겹치지 말고 흡수 동작과 폭발 범위를 본다. 에픽 산호를 내주면 라인 압박이 커지므로 다음 목표물보다 생성되는 공허 생명체의 진로를 먼저 정리한다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-belveth-20260915');

-- briar 상대법 (836자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-briar', 'matchup', NULL, NULL, 'published', 'briar', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 광분 대상을 유리한 곳으로 끌고 간다 · 깨물기 전에 거리를 둔다 · 비명 충전선에서 벗어난다

## 핏빛 광분은 브라이어도 방향을 바꾸기 어렵다
**브라이어가 `W`로 광분하면 가까운 대상을 자동으로 추격하므로, 대상이 된 쪽이 이동하면 진입 경로를 유도할 수 있다.**[* [브라이어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=165)] 포탑과 아군 제어 쪽으로 물러나고 다른 아군은 불필요하게 더 가까이 서지 않는다. 광분 종료 기술이 빠졌다면 벽을 넘거나 시야를 끊어 추격을 길게 만든다.

## 깨물기 전에 체력을 마무리 구간에 두지 않는다
**W를 다시 사용한 깨물기는 잃은 체력에 비례해 피해가 커지고 브라이어를 회복시킨다.** 체력이 낮아졌다면 맞교환을 더 하지 말고 사거리 밖으로 나간다. 회복 직전에 제어를 넣어 기본 공격과 재사용을 막으면 전투 지속력을 크게 줄일 수 있다.

## 오싹한 비명의 충전 방향을 옆으로 피한다
**E는 충전 중 피해를 줄여 받고 회복하며, 완전히 충전해 벽에 부딪히면 큰 피해와 기절을 만든다.** 벽을 등지고 서지 말고 시전 방향과 직각으로 이동한다. 충전 중 정면 피해를 계속 넣기보다 끝나는 위치에 제어를 준비한다.

## 궁극기 표식이 묻은 아군과 간격을 둔다
**불가항력적 죽음이 챔피언에게 맞으면 브라이어가 먼 거리에서도 날아와 주변을 공포에 빠뜨린다.** 투사체를 일렬로 겹쳐 맞지 말고, 적중된 아군은 팀 한가운데보다 보호 가능한 옆 공간으로 이동한다. 착지 뒤 자동 추격을 즉시 제어하고 E 방향을 피한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-briar' AND kind = 'matchup' AND champion_slug = 'briar'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-briar');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-briar-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-briar' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 광분 대상을 유리한 곳으로 끌고 간다 · 깨물기 전에 거리를 둔다 · 비명 충전선에서 벗어난다

## 핏빛 광분은 브라이어도 방향을 바꾸기 어렵다
**브라이어가 `W`로 광분하면 가까운 대상을 자동으로 추격하므로, 대상이 된 쪽이 이동하면 진입 경로를 유도할 수 있다.**[* [브라이어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=165)] 포탑과 아군 제어 쪽으로 물러나고 다른 아군은 불필요하게 더 가까이 서지 않는다. 광분 종료 기술이 빠졌다면 벽을 넘거나 시야를 끊어 추격을 길게 만든다.

## 깨물기 전에 체력을 마무리 구간에 두지 않는다
**W를 다시 사용한 깨물기는 잃은 체력에 비례해 피해가 커지고 브라이어를 회복시킨다.** 체력이 낮아졌다면 맞교환을 더 하지 말고 사거리 밖으로 나간다. 회복 직전에 제어를 넣어 기본 공격과 재사용을 막으면 전투 지속력을 크게 줄일 수 있다.

## 오싹한 비명의 충전 방향을 옆으로 피한다
**E는 충전 중 피해를 줄여 받고 회복하며, 완전히 충전해 벽에 부딪히면 큰 피해와 기절을 만든다.** 벽을 등지고 서지 말고 시전 방향과 직각으로 이동한다. 충전 중 정면 피해를 계속 넣기보다 끝나는 위치에 제어를 준비한다.

## 궁극기 표식이 묻은 아군과 간격을 둔다
**불가항력적 죽음이 챔피언에게 맞으면 브라이어가 먼 거리에서도 날아와 주변을 공포에 빠뜨린다.** 투사체를 일렬로 겹쳐 맞지 말고, 적중된 아군은 팀 한가운데보다 보호 가능한 옆 공간으로 이동한다. 착지 뒤 자동 추격을 즉시 제어하고 E 방향을 피한다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-briar-20260915');

-- reksai 상대법 (811자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-reksai', 'matchup', NULL, NULL, 'published', 'reksai', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 멈춰서 진동 감지를 끊는다 · 터널 출구를 지운다 · 돌출 뒤에 제어를 집중한다

## 매복한 렉사이는 움직임으로 위치를 읽는다
**렉사이는 땅속에서 시야가 좁아지는 대신 움직이는 적의 진동을 감지하므로, 수풀에 숨었어도 계속 움직이면 위치가 드러난다.**[* [렉사이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=123)] `W` 상태가 가까이 왔다면 잠깐 멈춰 진동 표시를 줄이고 아군 시야를 기다린다. 매복 Q에 맞으면 드러나므로 즉시 자리를 바꾼다.

## 터널 출구는 반복 갱킹의 예고다
**렉사이가 만든 터널은 남아 있어 같은 벽을 다시 빠르게 넘을 수 있다.** 라인 뒤와 목표물 옆의 출구를 발견하면 안전할 때 밟아 제거한다. 하나를 지웠다고 다른 경로까지 안전한 것은 아니므로 입구와 출구를 함께 시야에 넣는다.

## 돌출이 빠진 뒤에는 핵심 제어가 없다
**매복 해제 시 첫 대상과 주변 챔피언을 띄우지만, 같은 대상에게 연속으로 같은 띄우기를 쓰지는 못한다.** 앞선이 먼저 받아낸 뒤 뒤쪽 딜러가 거리를 좁힌다. `Q` 강화 공격으로 분노를 쌓고 E를 쓰기 전에 시야를 끊거나 이동기로 빠진다.

## 공허의 돌진 표식이 묻으면 퇴로를 준비한다
**렉사이는 피해를 준 대상을 궁극기로 추적하며 잠시 대상으로 지정되지 않은 상태로 달려든다.** 체력이 낮을수록 위험하므로 표식 대상은 아군 제어가 닿는 곳으로 이동한다. 사라진 순간 기술을 쓰지 말고 착지 직후에 맞춰, 준비된 터널로 빠져나가지 못하게 한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-reksai' AND kind = 'matchup' AND champion_slug = 'reksai'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-reksai');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-reksai-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-reksai' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 멈춰서 진동 감지를 끊는다 · 터널 출구를 지운다 · 돌출 뒤에 제어를 집중한다

## 매복한 렉사이는 움직임으로 위치를 읽는다
**렉사이는 땅속에서 시야가 좁아지는 대신 움직이는 적의 진동을 감지하므로, 수풀에 숨었어도 계속 움직이면 위치가 드러난다.**[* [렉사이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=123)] `W` 상태가 가까이 왔다면 잠깐 멈춰 진동 표시를 줄이고 아군 시야를 기다린다. 매복 Q에 맞으면 드러나므로 즉시 자리를 바꾼다.

## 터널 출구는 반복 갱킹의 예고다
**렉사이가 만든 터널은 남아 있어 같은 벽을 다시 빠르게 넘을 수 있다.** 라인 뒤와 목표물 옆의 출구를 발견하면 안전할 때 밟아 제거한다. 하나를 지웠다고 다른 경로까지 안전한 것은 아니므로 입구와 출구를 함께 시야에 넣는다.

## 돌출이 빠진 뒤에는 핵심 제어가 없다
**매복 해제 시 첫 대상과 주변 챔피언을 띄우지만, 같은 대상에게 연속으로 같은 띄우기를 쓰지는 못한다.** 앞선이 먼저 받아낸 뒤 뒤쪽 딜러가 거리를 좁힌다. `Q` 강화 공격으로 분노를 쌓고 E를 쓰기 전에 시야를 끊거나 이동기로 빠진다.

## 공허의 돌진 표식이 묻으면 퇴로를 준비한다
**렉사이는 피해를 준 대상을 궁극기로 추적하며 잠시 대상으로 지정되지 않은 상태로 달려든다.** 체력이 낮을수록 위험하므로 표식 대상은 아군 제어가 닿는 곳으로 이동한다. 사라진 순간 기술을 쓰지 말고 착지 직후에 맞춰, 준비된 터널로 빠져나가지 못하게 한다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-reksai-20260915');

-- shaco 상대법 (833자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-shaco', 'matchup', NULL, NULL, 'published', 'shaco', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 상자 설치 지점을 탐지한다 · 속임수 시작 위치를 밝힌다 · 분신과 본체의 행동을 비교한다

## 깜짝 상자는 보이기 전에 길을 바꾼다
**샤코의 상자는 준비된 뒤 가까운 적을 공포에 빠뜨리므로, 수풀과 좁은 입구에 확인 없이 들어가면 후속 공격까지 허용한다.**[* [샤코 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=54)] 탐지 수단과 원거리 공격으로 먼저 제거하고, `W`가 방금 설치된 위치는 활성화되기 전에 벗어난다. 한 방향에 몰려 공포가 번지지 않게 한다.

## 속임수는 도착점보다 출발점을 본다
**Q는 순간 이동과 은신을 함께 제공하지만 시작 동작과 연기가 보이면 대략의 접근 범위를 계산할 수 있다.** 정글 입구와 벽 뒤를 밝히면 은신 후 나타날 방향을 좁힐 수 있다. 등을 보인 기본 공격이 강하므로 한 명이 도망칠 때 나머지는 뒤쪽을 확인한다.

## 양날 독을 던지기 전에는 둔화가 계속된다
**E가 준비된 샤코의 기본 공격은 대상을 느리게 하고, 사용 피해는 낮은 체력에서 커진다.** 체력이 빠졌다면 직선 추격을 허용하지 말고 벽을 넘거나 아군 쪽으로 이동한다. 투척이 빠진 뒤에는 지속 둔화도 사라지므로 그때 거리를 되찾는다.

## 환각 분신에 큰 기술을 쓰지 않는다
**궁극기 순간 샤코는 잠시 사라지고 분신을 만들며, 분신이 죽으면 폭발과 상자들이 나온다.** 먼저 위험하게 달려오는 개체가 분신일 가능성을 보고 행동과 받은 피해를 비교한다. 분신을 팀 한가운데서 터뜨리지 말고 거리를 벌려 처리하며 본체의 퇴로를 시야로 막는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-shaco' AND kind = 'matchup' AND champion_slug = 'shaco'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-shaco');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-shaco-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-shaco' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 상자 설치 지점을 탐지한다 · 속임수 시작 위치를 밝힌다 · 분신과 본체의 행동을 비교한다

## 깜짝 상자는 보이기 전에 길을 바꾼다
**샤코의 상자는 준비된 뒤 가까운 적을 공포에 빠뜨리므로, 수풀과 좁은 입구에 확인 없이 들어가면 후속 공격까지 허용한다.**[* [샤코 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=54)] 탐지 수단과 원거리 공격으로 먼저 제거하고, `W`가 방금 설치된 위치는 활성화되기 전에 벗어난다. 한 방향에 몰려 공포가 번지지 않게 한다.

## 속임수는 도착점보다 출발점을 본다
**Q는 순간 이동과 은신을 함께 제공하지만 시작 동작과 연기가 보이면 대략의 접근 범위를 계산할 수 있다.** 정글 입구와 벽 뒤를 밝히면 은신 후 나타날 방향을 좁힐 수 있다. 등을 보인 기본 공격이 강하므로 한 명이 도망칠 때 나머지는 뒤쪽을 확인한다.

## 양날 독을 던지기 전에는 둔화가 계속된다
**E가 준비된 샤코의 기본 공격은 대상을 느리게 하고, 사용 피해는 낮은 체력에서 커진다.** 체력이 빠졌다면 직선 추격을 허용하지 말고 벽을 넘거나 아군 쪽으로 이동한다. 투척이 빠진 뒤에는 지속 둔화도 사라지므로 그때 거리를 되찾는다.

## 환각 분신에 큰 기술을 쓰지 않는다
**궁극기 순간 샤코는 잠시 사라지고 분신을 만들며, 분신이 죽으면 폭발과 상자들이 나온다.** 먼저 위험하게 달려오는 개체가 분신일 가능성을 보고 행동과 받은 피해를 비교한다. 분신을 팀 한가운데서 터뜨리지 말고 거리를 벌려 처리하며 본체의 퇴로를 시야로 막는다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-shaco-20260915');

-- nocturne 상대법 (805자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-nocturne', 'matchup', NULL, NULL, 'published', 'nocturne', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 황혼의 길에서 벗어난다 · 주문 방어막을 작은 기술로 뺀다 · 피해망상 때 서로의 위치를 지킨다

## 황혼의 인도자를 옆으로 피한다
**녹턴의 `Q`에 맞으면 흔적이 남고 녹턴이 그 길 위에서 더 빠르고 강해진다.**[* [녹턴 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=45)] 뒤로만 빠지면 길을 따라 추격당하므로 옆으로 벗어나 효과 구역을 짧게 만든다. 빗나간 뒤에는 이동 속도 이점이 줄어드니 공포 연결 거리를 주지 않는다.

## 말할 수 없는 공포의 줄을 끊는다
**E가 연결된 채 일정 시간이 지나면 공포에 걸리므로, 범위 밖으로 나가거나 녹턴을 밀어내야 한다.** 이동기를 너무 일찍 쓰지 말고 줄이 생긴 뒤 직선으로 거리를 벌린다. 아군이 대신 제어할 수 있다면 서로 반대 방향으로 도망치지 않는다.

## 어둠의 장막에는 작은 기술을 먼저 건다
**주문 방어막이 기술을 막으면 녹턴의 공격 속도 증가가 강화된다.** 핵심 제어를 바로 넣지 말고 짧은 피해 기술로 방어막을 제거한 뒤 순서대로 제어한다. 막힌 순간에는 근접 기본 공격 싸움을 이어 주지 않고 잠시 거리를 둔다.

## 피해망상 중에는 혼자 움직이지 않는다
**궁극기가 켜지면 아군 시야 공유가 제한되고 녹턴이 선택한 적에게 멀리서 돌진할 수 있다.** 어둠이 시작되면 마지막으로 확인한 아군 위치 쪽으로 모이고 각자 시야를 보러 가지 않는다. 대상이 된 아군 주변에 착지 제어를 준비하되 한 줄로 서서 광역 피해를 겹쳐 맞지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-nocturne' AND kind = 'matchup' AND champion_slug = 'nocturne'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-nocturne');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-nocturne-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-nocturne' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 황혼의 길에서 벗어난다 · 주문 방어막을 작은 기술로 뺀다 · 피해망상 때 서로의 위치를 지킨다

## 황혼의 인도자를 옆으로 피한다
**녹턴의 `Q`에 맞으면 흔적이 남고 녹턴이 그 길 위에서 더 빠르고 강해진다.**[* [녹턴 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=45)] 뒤로만 빠지면 길을 따라 추격당하므로 옆으로 벗어나 효과 구역을 짧게 만든다. 빗나간 뒤에는 이동 속도 이점이 줄어드니 공포 연결 거리를 주지 않는다.

## 말할 수 없는 공포의 줄을 끊는다
**E가 연결된 채 일정 시간이 지나면 공포에 걸리므로, 범위 밖으로 나가거나 녹턴을 밀어내야 한다.** 이동기를 너무 일찍 쓰지 말고 줄이 생긴 뒤 직선으로 거리를 벌린다. 아군이 대신 제어할 수 있다면 서로 반대 방향으로 도망치지 않는다.

## 어둠의 장막에는 작은 기술을 먼저 건다
**주문 방어막이 기술을 막으면 녹턴의 공격 속도 증가가 강화된다.** 핵심 제어를 바로 넣지 말고 짧은 피해 기술로 방어막을 제거한 뒤 순서대로 제어한다. 막힌 순간에는 근접 기본 공격 싸움을 이어 주지 않고 잠시 거리를 둔다.

## 피해망상 중에는 혼자 움직이지 않는다
**궁극기가 켜지면 아군 시야 공유가 제한되고 녹턴이 선택한 적에게 멀리서 돌진할 수 있다.** 어둠이 시작되면 마지막으로 확인한 아군 위치 쪽으로 모이고 각자 시야를 보러 가지 않는다. 대상이 된 아군 주변에 착지 제어를 준비하되 한 줄로 서서 광역 피해를 겹쳐 맞지 않는다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-nocturne-20260915');

-- udyr 상대법 (841자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-udyr', 'matchup', NULL, NULL, 'published', 'udyr', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 각성 태세를 확인한다 · 강화 공격 두 번 뒤에 싸운다 · 같은 대상 기절 면역 시간을 이용한다

## 태세 직후 기본 공격 두 번을 피한다
**우디르는 각 태세를 사용한 뒤 다음 두 기본 공격에 강화 효과를 얻으므로 기술 아이콘보다 공격 횟수를 세는 것이 중요하다.**[* [우디르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=69)] `Q` 강화 공격을 맞으며 근접 교환하지 말고 두 번이 빠진 뒤 접근한다. W에서는 보호막과 회복이 이어지므로 짧게 물러나 효과를 소모시킨다.

## 각성한 태세는 같은 기술처럼 대응하지 않는다
**같은 태세를 다시 쓰면 각성되어 Q의 단일 피해, W의 생존, E의 방해 효과 면역, R의 폭풍이 크게 강화된다.** 각성 E로 달려올 때 첫 제어를 낭비하지 말고 면역이 끝난 뒤 묶는다. 각성 W에는 화력을 잠시 멈추고, 각성 R 폭풍에서는 옆으로 빠진다.

## 불길한 발걸음의 기절은 대상별 간격이 있다
**E 기본 공격은 처음 맞는 적을 기절시키지만 같은 대상에게는 잠시 다시 발동하지 않는다.** 앞선이 한 번 받아낸 뒤 표시가 남아 있는 동안 거리를 좁힌다. 여러 명이 차례로 맞아 우디르가 전선을 통과하지 못하게 한곳에 겹치지 않는다.

## 긴 추격 대신 접근 경로를 잘라낸다
**우디르는 빠르게 달릴 수 있지만 벽을 넘는 긴 돌진은 없어 진입 방향이 지형에 묶인다.** 좁은 길에 둔화 구역과 시야를 두고 열린 공간에서 계속 뒤로만 달리지 않는다. 목표물 앞에서는 한쪽 입구를 막아 각성 자원을 접근에 쓰게 한 뒤 본 전투를 연다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-udyr' AND kind = 'matchup' AND champion_slug = 'udyr'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-udyr');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-udyr-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-udyr' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 각성 태세를 확인한다 · 강화 공격 두 번 뒤에 싸운다 · 같은 대상 기절 면역 시간을 이용한다

## 태세 직후 기본 공격 두 번을 피한다
**우디르는 각 태세를 사용한 뒤 다음 두 기본 공격에 강화 효과를 얻으므로 기술 아이콘보다 공격 횟수를 세는 것이 중요하다.**[* [우디르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=69)] `Q` 강화 공격을 맞으며 근접 교환하지 말고 두 번이 빠진 뒤 접근한다. W에서는 보호막과 회복이 이어지므로 짧게 물러나 효과를 소모시킨다.

## 각성한 태세는 같은 기술처럼 대응하지 않는다
**같은 태세를 다시 쓰면 각성되어 Q의 단일 피해, W의 생존, E의 방해 효과 면역, R의 폭풍이 크게 강화된다.** 각성 E로 달려올 때 첫 제어를 낭비하지 말고 면역이 끝난 뒤 묶는다. 각성 W에는 화력을 잠시 멈추고, 각성 R 폭풍에서는 옆으로 빠진다.

## 불길한 발걸음의 기절은 대상별 간격이 있다
**E 기본 공격은 처음 맞는 적을 기절시키지만 같은 대상에게는 잠시 다시 발동하지 않는다.** 앞선이 한 번 받아낸 뒤 표시가 남아 있는 동안 거리를 좁힌다. 여러 명이 차례로 맞아 우디르가 전선을 통과하지 못하게 한곳에 겹치지 않는다.

## 긴 추격 대신 접근 경로를 잘라낸다
**우디르는 빠르게 달릴 수 있지만 벽을 넘는 긴 돌진은 없어 진입 방향이 지형에 묶인다.** 좁은 길에 둔화 구역과 시야를 두고 열린 공간에서 계속 뒤로만 달리지 않는다. 목표물 앞에서는 한쪽 입구를 막아 각성 자원을 접근에 쓰게 한 뒤 본 전투를 연다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-udyr-20260915');

-- warwick 상대법 (808자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-warwick', 'matchup', NULL, NULL, 'published', 'warwick', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 낮은 체력으로 오래 남지 않는다 · 야수의 송곳니를 짧은 이동으로 피하지 않는다 · 공포 뒤 궁극기를 기다린다

## 피 냄새가 나면 시야 밖에서도 추적된다
**워윅은 체력이 낮은 챔피언의 방향을 감지하고 빠르게 접근하므로, 귀환을 미루며 정글 입구를 걷는 행동이 위험하다.**[* [워윅 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=74)] `W` 표식이 생기면 안전한 경로로 즉시 빠지고 아군에게 접근 방향을 알린다. 매우 낮은 체력에서는 워윅의 공격 속도도 크게 오른다.

## 야수의 송곳니는 순간 이동을 따라온다
**Q를 길게 누른 워윅은 대상에게 붙어 위치 이동을 따라가고 뒤쪽으로 넘어갈 수 있다.** 짧은 이동기로 먼저 떼려 하지 말고 물기 동작이 끝난 뒤 거리를 만든다. 뒤로 넘어올 것을 고려해 포탑과 아군 방향을 등지고 서지 않는다.

## 원시의 포효가 켜지면 폭발 피해를 아낀다
**E 첫 사용 동안 워윅은 받는 피해를 줄이고, 종료할 때 주변을 공포에 빠뜨린다.** 피해 감소가 끝날 때까지 화력을 나눠 넣고 공포 범위에서 벌어진다. 먼저 재사용해 공포를 터뜨렸다면 그 직후가 집중할 시간이다.

## 무한의 구속은 직선 착지점을 피한다
**궁극기 도약 거리는 워윅의 이동 속도에 따라 늘고 처음 부딪힌 챔피언을 제압한다.** 빠르게 달려오는 방향과 직각으로 이동하고 앞선이 투사 경로를 막는다. 빗나가면 깊게 착지하므로 즉시 제어하며, 맞은 아군에게 정화되지 않는 제압을 풀 보호 기술을 집중한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-warwick' AND kind = 'matchup' AND champion_slug = 'warwick'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-warwick');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-warwick-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-warwick' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 낮은 체력으로 오래 남지 않는다 · 야수의 송곳니를 짧은 이동으로 피하지 않는다 · 공포 뒤 궁극기를 기다린다

## 피 냄새가 나면 시야 밖에서도 추적된다
**워윅은 체력이 낮은 챔피언의 방향을 감지하고 빠르게 접근하므로, 귀환을 미루며 정글 입구를 걷는 행동이 위험하다.**[* [워윅 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=74)] `W` 표식이 생기면 안전한 경로로 즉시 빠지고 아군에게 접근 방향을 알린다. 매우 낮은 체력에서는 워윅의 공격 속도도 크게 오른다.

## 야수의 송곳니는 순간 이동을 따라온다
**Q를 길게 누른 워윅은 대상에게 붙어 위치 이동을 따라가고 뒤쪽으로 넘어갈 수 있다.** 짧은 이동기로 먼저 떼려 하지 말고 물기 동작이 끝난 뒤 거리를 만든다. 뒤로 넘어올 것을 고려해 포탑과 아군 방향을 등지고 서지 않는다.

## 원시의 포효가 켜지면 폭발 피해를 아낀다
**E 첫 사용 동안 워윅은 받는 피해를 줄이고, 종료할 때 주변을 공포에 빠뜨린다.** 피해 감소가 끝날 때까지 화력을 나눠 넣고 공포 범위에서 벌어진다. 먼저 재사용해 공포를 터뜨렸다면 그 직후가 집중할 시간이다.

## 무한의 구속은 직선 착지점을 피한다
**궁극기 도약 거리는 워윅의 이동 속도에 따라 늘고 처음 부딪힌 챔피언을 제압한다.** 빠르게 달려오는 방향과 직각으로 이동하고 앞선이 투사 경로를 막는다. 빗나가면 깊게 착지하므로 즉시 제어하며, 맞은 아군에게 정화되지 않는 제압을 풀 보호 기술을 집중한다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-warwick-20260915');

-- sejuani 상대법 (822자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-sejuani', 'matchup', NULL, NULL, 'published', 'sejuani', '', 0, '16.17.1', 'guarded', '2026-09-15T00:30:00.000Z', '2026-09-15T00:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 근접 적과 함께 올 때 서리 중첩을 센다 · 두 번째 채찍을 피한다 · 빙하 감옥에 한 줄로 서지 않는다

## 근접 챔피언과 함께 오면 빙결이 빨라진다
**세주아니 주변의 근접 아군도 기본 공격으로 서리 중첩을 쌓을 수 있어, 갱킹 호응자가 근접이면 예상보다 빨리 얼어붙는다.**[* [세주아니 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=91)] 중첩 표시를 세고 네 번이 되기 전에 거리를 끊는다. `E` 빙결이 끝난 뒤에는 잠시 같은 방식으로 다시 얼지 않으므로 그 구간에 대응한다.

## 혹한의 서릿발 두 번째 타격을 옆으로 피한다
**W의 첫 휘두르기보다 두 번째 휘두르기가 넓고 강하며 서리 중첩을 많이 쌓는다.** 첫 공격이 보이면 세주아니 정면에서 옆으로 움직여 두 번째 범위를 벗어난다. 뒤로만 빠지면 긴 채찍 끝에 맞기 쉬우므로 이동 방향을 바꾼다.

## 혹한의 맹습이 빠진 뒤 퇴로를 압박한다
**Q는 벽을 넘고 처음 맞은 챔피언을 띄우지만, 사용 뒤 세주아니에게 즉시 쓸 이동기가 남지 않는다.** 빗나가거나 진입에 쓴 순간 거리를 좁혀 집중한다. 초반 비전투 상태의 서리 갑옷이 켜져 있다면 첫 피해로 벗긴 뒤 다음 공격을 맞춘다.

## 빙하 감옥은 첫 대상 뒤까지 영향을 준다
**궁극기는 처음 맞은 챔피언을 기절시키고 주변에 폭풍을 만들어 다른 적도 느리게 한다.** 좁은 입구에서 한 줄로 서지 말고 앞선과 딜러의 각도를 벌린다. 멀리서 맞은 아군에게 모두 모여들기보다 폭풍 밖에서 세주아니의 후속 진입을 끊는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-sejuani' AND kind = 'matchup' AND champion_slug = 'sejuani'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-sejuani');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ad-matchup-sejuani-20260915', id, NULL, 0, general, '정글 AD 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-sejuani' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 근접 적과 함께 올 때 서리 중첩을 센다 · 두 번째 채찍을 피한다 · 빙하 감옥에 한 줄로 서지 않는다

## 근접 챔피언과 함께 오면 빙결이 빨라진다
**세주아니 주변의 근접 아군도 기본 공격으로 서리 중첩을 쌓을 수 있어, 갱킹 호응자가 근접이면 예상보다 빨리 얼어붙는다.**[* [세주아니 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=91)] 중첩 표시를 세고 네 번이 되기 전에 거리를 끊는다. `E` 빙결이 끝난 뒤에는 잠시 같은 방식으로 다시 얼지 않으므로 그 구간에 대응한다.

## 혹한의 서릿발 두 번째 타격을 옆으로 피한다
**W의 첫 휘두르기보다 두 번째 휘두르기가 넓고 강하며 서리 중첩을 많이 쌓는다.** 첫 공격이 보이면 세주아니 정면에서 옆으로 움직여 두 번째 범위를 벗어난다. 뒤로만 빠지면 긴 채찍 끝에 맞기 쉬우므로 이동 방향을 바꾼다.

## 혹한의 맹습이 빠진 뒤 퇴로를 압박한다
**Q는 벽을 넘고 처음 맞은 챔피언을 띄우지만, 사용 뒤 세주아니에게 즉시 쓸 이동기가 남지 않는다.** 빗나가거나 진입에 쓴 순간 거리를 좁혀 집중한다. 초반 비전투 상태의 서리 갑옷이 켜져 있다면 첫 피해로 벗긴 뒤 다음 공격을 맞춘다.

## 빙하 감옥은 첫 대상 뒤까지 영향을 준다
**궁극기는 처음 맞은 챔피언을 기절시키고 주변에 폭풍을 만들어 다른 적도 느리게 한다.** 좁은 입구에서 한 줄로 서지 말고 앞선과 딜러의 각도를 벌린다. 멀리서 맞은 아군에게 모두 모여들기보다 폭풍 밖에서 세주아니의 후속 진입을 끊는다.'
AND updated_at = '2026-09-15T00:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ad-matchup-sejuani-20260915');
