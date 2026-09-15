-- scripts/seed-non-adc-wiki.ts가 생성. 비원딜 일반 위키 8개와 공통 상대법 9개.
-- 기존 공유 문서와 사용자 편집은 덮어쓰지 않으며 같은 SQL을 다시 실행해도 이력이 늘지 않는다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)
VALUES ('user-system', 'system', 'seed', '깨남.COM', NULL, 'admin', '2026-09-15T09:50:00.000Z');

-- 직스 챔피언 위키 (935자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-non-adc-champion-ziggs-20260915', 'article', '직스', '직스', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 튕기는 `Q`로 막타와 견제를 겹친다 · `W`는 생존과 포탑 마무리 중 하나로 쓴다 · 좁은 길을 `E`로 닫는다

[[분류:원딜]] [[분류:비원딜]]

## 반동 폭탄의 첫 착지점을 설계한다

**`반동 폭탄(Q)`은 바닥을 튕기며 멀리 나아가므로 상대 발보다 이동할 길 앞에 던진다.**[* [직스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=92)] 막타를 치려는 원거리 미니언과 챔피언을 한 선에 두면 웨이브 정리와 견제를 함께 할 수 있다. 첫 착지가 빗나가도 다음 바운드가 닿도록 상대 뒤쪽에 여유 공간을 남긴다.

## 짧은 도화선을 구조물에 돌려준다

**스킬을 사용할수록 강화 기본 공격의 대기시간이 줄어든다.** 준비된 공격은 안전한 거리의 챔피언 견제나 포탑 압박에 사용하고, 의미 없는 미니언 공격으로 소모하지 않는다. 포탑을 칠 때는 `Q`와 `E`로 다음 강화 공격을 빠르게 준비하되 상대의 진입 기술이 보이지 않으면 앞으로 오래 서 있지 않는다.

## 휴대용 폭약의 역할을 먼저 정한다

**`휴대용 폭약(W)`은 적과 직스를 밀어내며, 체력이 낮은 포탑을 마무리할 수 있다.** 갱킹 위험이 있으면 발밑이나 퇴로 쪽에 두어 생존 수단으로 남긴다. 상대 이동기가 빠졌고 아군 쪽으로 밀어낼 각이 분명할 때만 공격적으로 설치한다. 한 교전에서 탈출과 포탑 마무리를 동시에 기대하지 않는다.

## 지뢰밭으로 다음 전장을 좁힌다

**`마법공학 지뢰밭(E)`은 밟은 적을 둔화하므로 강 입구와 포탑 옆 통로를 오래 막는다.** 한가운데 피해만 노리기보다 상대가 피해야 할 방향에 깔아 `Q` 착지점을 예측한다. `지옥 화염 폭탄(R)`은 중심부 피해가 더 크므로 아군의 제어가 끝나는 자리나 도주 경로 중앙을 겨냥한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-non-adc-champion-ziggs-20260915' OR (kind = 'article' AND title_key = '직스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-champion-ziggs-20260915', id, NULL, 0, general, '비원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-non-adc-champion-ziggs-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 튕기는 `Q`로 막타와 견제를 겹친다 · `W`는 생존과 포탑 마무리 중 하나로 쓴다 · 좁은 길을 `E`로 닫는다

[[분류:원딜]] [[분류:비원딜]]

## 반동 폭탄의 첫 착지점을 설계한다

**`반동 폭탄(Q)`은 바닥을 튕기며 멀리 나아가므로 상대 발보다 이동할 길 앞에 던진다.**[* [직스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=92)] 막타를 치려는 원거리 미니언과 챔피언을 한 선에 두면 웨이브 정리와 견제를 함께 할 수 있다. 첫 착지가 빗나가도 다음 바운드가 닿도록 상대 뒤쪽에 여유 공간을 남긴다.

## 짧은 도화선을 구조물에 돌려준다

**스킬을 사용할수록 강화 기본 공격의 대기시간이 줄어든다.** 준비된 공격은 안전한 거리의 챔피언 견제나 포탑 압박에 사용하고, 의미 없는 미니언 공격으로 소모하지 않는다. 포탑을 칠 때는 `Q`와 `E`로 다음 강화 공격을 빠르게 준비하되 상대의 진입 기술이 보이지 않으면 앞으로 오래 서 있지 않는다.

## 휴대용 폭약의 역할을 먼저 정한다

**`휴대용 폭약(W)`은 적과 직스를 밀어내며, 체력이 낮은 포탑을 마무리할 수 있다.** 갱킹 위험이 있으면 발밑이나 퇴로 쪽에 두어 생존 수단으로 남긴다. 상대 이동기가 빠졌고 아군 쪽으로 밀어낼 각이 분명할 때만 공격적으로 설치한다. 한 교전에서 탈출과 포탑 마무리를 동시에 기대하지 않는다.

## 지뢰밭으로 다음 전장을 좁힌다

**`마법공학 지뢰밭(E)`은 밟은 적을 둔화하므로 강 입구와 포탑 옆 통로를 오래 막는다.** 한가운데 피해만 노리기보다 상대가 피해야 할 방향에 깔아 `Q` 착지점을 예측한다. `지옥 화염 폭탄(R)`은 중심부 피해가 더 크므로 아군의 제어가 끝나는 자리나 도주 경로 중앙을 겨냥한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-champion-ziggs-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-ziggs-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-ziggs-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-ziggs-20260915' AND target_key = '분류:원딜');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-ziggs-20260915', NULL, '분류:비원딜', '분류:비원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-ziggs-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-ziggs-20260915' AND target_key = '분류:비원딜');

-- 세라핀 챔피언 위키 (904자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-non-adc-champion-seraphine-20260915', 'article', '세라핀', '세라핀', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 세 번째 기본 스킬의 메아리를 계산한다 · 아군과 함께 음표를 모은다 · `R`이 챔피언을 타고 늘어나는 각을 본다

[[분류:원딜]] [[분류:비원딜]]

## 메아리를 교전 전에 준비한다

**세라핀은 세 번째 기본 스킬을 두 번 사용하므로 자원 표시를 보고 다음 강화 효과를 정한다.**[* [세라핀 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=152)] 라인을 밀 때 메아리를 무심코 소모하지 말고, 상대가 앞으로 나올 때 `고음(Q)` 두 번으로 피해를 집중할지 `비트 발사(E)` 두 번으로 이동을 묶을지 먼저 선택한다.

## 음표는 아군 곁에서 안전하게 회수한다

**주변 아군과 함께 스킬을 쓰면 음표가 쌓여 다음 기본 공격의 사거리와 피해가 늘어난다.** 서포터와 너무 멀리 떨어지면 이 장점이 줄어든다. 음표 공격은 긴 사거리에서 마무리 견제로 쓰고, 한 번 더 때리려고 상대의 돌진 범위에 들어가지는 않는다.

## 소리 장막의 회복 조건을 만든다

**`소리 장막(W)`은 주변 아군에게 보호막과 이동 속도를 주며, 세라핀이 이미 보호막을 가진 상태라면 회복까지 이어진다.** 메아리 `W`는 첫 시전의 보호막 덕분에 회복 조건을 스스로 갖출 수 있다. 작은 견제에 바로 쓰기보다 여러 아군이 함께 피해를 받거나 추격과 이탈 속도가 필요한 순간을 기다린다.

## 앙코르는 앞사람을 경유한다

**`앙코르(R)`는 아군이나 적 챔피언에게 닿을 때마다 사거리가 다시 늘어난다.** 가장 먼 적을 직접 겨누기보다 앞에 선 아군을 통과해 후방까지 닿는 직선을 찾는다. 매혹 뒤에는 `E`의 이동 방해와 `Q`를 겹치고, 아군 대열이 갈라졌다면 억지로 긴 각을 만들지 않는다.', 1, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-non-adc-champion-seraphine-20260915' OR (kind = 'article' AND title_key = '세라핀'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-champion-seraphine-20260915', id, NULL, 0, general, '비원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-non-adc-champion-seraphine-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 세 번째 기본 스킬의 메아리를 계산한다 · 아군과 함께 음표를 모은다 · `R`이 챔피언을 타고 늘어나는 각을 본다

[[분류:원딜]] [[분류:비원딜]]

## 메아리를 교전 전에 준비한다

**세라핀은 세 번째 기본 스킬을 두 번 사용하므로 자원 표시를 보고 다음 강화 효과를 정한다.**[* [세라핀 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=152)] 라인을 밀 때 메아리를 무심코 소모하지 말고, 상대가 앞으로 나올 때 `고음(Q)` 두 번으로 피해를 집중할지 `비트 발사(E)` 두 번으로 이동을 묶을지 먼저 선택한다.

## 음표는 아군 곁에서 안전하게 회수한다

**주변 아군과 함께 스킬을 쓰면 음표가 쌓여 다음 기본 공격의 사거리와 피해가 늘어난다.** 서포터와 너무 멀리 떨어지면 이 장점이 줄어든다. 음표 공격은 긴 사거리에서 마무리 견제로 쓰고, 한 번 더 때리려고 상대의 돌진 범위에 들어가지는 않는다.

## 소리 장막의 회복 조건을 만든다

**`소리 장막(W)`은 주변 아군에게 보호막과 이동 속도를 주며, 세라핀이 이미 보호막을 가진 상태라면 회복까지 이어진다.** 메아리 `W`는 첫 시전의 보호막 덕분에 회복 조건을 스스로 갖출 수 있다. 작은 견제에 바로 쓰기보다 여러 아군이 함께 피해를 받거나 추격과 이탈 속도가 필요한 순간을 기다린다.

## 앙코르는 앞사람을 경유한다

**`앙코르(R)`는 아군이나 적 챔피언에게 닿을 때마다 사거리가 다시 늘어난다.** 가장 먼 적을 직접 겨누기보다 앞에 선 아군을 통과해 후방까지 닿는 직선을 찾는다. 매혹 뒤에는 `E`의 이동 방해와 `Q`를 겹치고, 아군 대열이 갈라졌다면 억지로 긴 각을 만들지 않는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-champion-seraphine-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-seraphine-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-seraphine-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-seraphine-20260915' AND target_key = '분류:원딜');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-seraphine-20260915', NULL, '분류:비원딜', '분류:비원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-seraphine-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-seraphine-20260915' AND target_key = '분류:비원딜');

-- 스웨인 챔피언 위키 (888자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-non-adc-champion-swain-20260915', 'article', '스웨인', '스웨인', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 돌아오는 `E`로 속박한다 · 가까운 거리에서 `Q` 번개를 겹친다 · `R`은 적 챔피언 곁에서 유지한다

[[분류:원딜]] [[분류:비원딜]]

## 속박명령의 귀환 경로를 맞힌다

**`속박명령(E)`은 앞으로 나갔다 돌아오며 적을 속박하고, 다시 사용하면 붙잡은 챔피언을 끌어당긴다.**[* [스웨인 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=61)] 상대 몸에 직접 던지기보다 뒤쪽 미니언이나 퇴로까지 보내 귀환 파동이 걸치게 한다. 속박에 성공하면 즉시 당기기보다 아군 기술이 닿을 위치를 확인한다.

## 죽음의 손길은 가까울수록 겹친다

**`죽음의 손길(Q)`은 여러 갈래 번개가 같은 대상에 맞을수록 피해가 커지고, 처치한 유닛을 관통한다.** 안전한 원거리에서는 웨이브를 정리하고, 상대 핵심 기술이 빠진 뒤에는 짧게 거리를 좁혀 여러 갈래를 겹친다. 체력이 낮은 미니언 뒤에 숨은 상대에게 관통 각도 함께 본다.

## 제국의 눈으로 합류 전에 개입한다

**`제국의 눈(W)`은 먼 지역을 잠시 드러낸 뒤 피해와 둔화를 주고 영혼 조각을 만든다.** 다른 라인의 제어 기술이나 좁은 길에 맞춰 이동을 강요한다. 시전 지연이 길어 단독 적중만 노리기보다, 도망갈 방향을 막거나 시야가 끊긴 수풀을 확인하는 데 쓴다.

## 악의 승천은 붙어 있을 이유가 있을 때 연다

**`악의 승천(R)`은 주변 적에게서 생명력을 흡수하고 적 챔피언을 흡수하는 동안 형태를 유지한다.** 상대가 바로 빠져나갈 수 있는 거리에서 먼저 켜지 않는다. `E` 속박과 아군 제어 뒤에 진입하고, 상대가 범위를 벗어나면 무작정 추격하기보다 다음 속박을 준비한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-non-adc-champion-swain-20260915' OR (kind = 'article' AND title_key = '스웨인'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-champion-swain-20260915', id, NULL, 0, general, '비원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-non-adc-champion-swain-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 돌아오는 `E`로 속박한다 · 가까운 거리에서 `Q` 번개를 겹친다 · `R`은 적 챔피언 곁에서 유지한다

[[분류:원딜]] [[분류:비원딜]]

## 속박명령의 귀환 경로를 맞힌다

**`속박명령(E)`은 앞으로 나갔다 돌아오며 적을 속박하고, 다시 사용하면 붙잡은 챔피언을 끌어당긴다.**[* [스웨인 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=61)] 상대 몸에 직접 던지기보다 뒤쪽 미니언이나 퇴로까지 보내 귀환 파동이 걸치게 한다. 속박에 성공하면 즉시 당기기보다 아군 기술이 닿을 위치를 확인한다.

## 죽음의 손길은 가까울수록 겹친다

**`죽음의 손길(Q)`은 여러 갈래 번개가 같은 대상에 맞을수록 피해가 커지고, 처치한 유닛을 관통한다.** 안전한 원거리에서는 웨이브를 정리하고, 상대 핵심 기술이 빠진 뒤에는 짧게 거리를 좁혀 여러 갈래를 겹친다. 체력이 낮은 미니언 뒤에 숨은 상대에게 관통 각도 함께 본다.

## 제국의 눈으로 합류 전에 개입한다

**`제국의 눈(W)`은 먼 지역을 잠시 드러낸 뒤 피해와 둔화를 주고 영혼 조각을 만든다.** 다른 라인의 제어 기술이나 좁은 길에 맞춰 이동을 강요한다. 시전 지연이 길어 단독 적중만 노리기보다, 도망갈 방향을 막거나 시야가 끊긴 수풀을 확인하는 데 쓴다.

## 악의 승천은 붙어 있을 이유가 있을 때 연다

**`악의 승천(R)`은 주변 적에게서 생명력을 흡수하고 적 챔피언을 흡수하는 동안 형태를 유지한다.** 상대가 바로 빠져나갈 수 있는 거리에서 먼저 켜지 않는다. `E` 속박과 아군 제어 뒤에 진입하고, 상대가 범위를 벗어나면 무작정 추격하기보다 다음 속박을 준비한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-champion-swain-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-swain-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-swain-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-swain-20260915' AND target_key = '분류:원딜');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-swain-20260915', NULL, '분류:비원딜', '분류:비원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-swain-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-swain-20260915' AND target_key = '분류:비원딜');

-- 벨코즈 챔피언 위키 (897자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-non-adc-champion-velkoz-20260915', 'article', '벨코즈', '벨코즈', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — `Q` 분열 각을 양옆으로 만든다 · `W` 두 타격과 `E`를 겹친다 · 연구 완료 뒤 `R`을 집중한다

[[분류:원딜]] [[분류:비원딜]]

## 플라즈마 분열을 옆에서 맞힌다

**`플라즈마 분열(Q)`은 적중하거나 다시 사용하면 좌우 두 갈래로 갈라진다.**[* [벨코즈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=118)] 미니언 정면이 막혔을 때 대각선으로 쏜 뒤 분열시켜 옆구리를 노린다. 첫 투사체를 끝까지 보내는 것보다 상대 이동에 맞춰 일찍 갈라지게 하면 반응할 시간을 줄일 수 있다.

## 유기물 분해 세 번째 적중을 센다

**벨코즈의 스킬은 분해 중첩을 남기고 세 번째 적중에서 고정 피해를 준다.** 한 번 맞힌 뒤 급하게 모든 기술을 던지지 말고 중첩이 사라지기 전에 확실한 다음 적중을 준비한다. 기본 공격은 중첩 시간을 이어 주지만 새 중첩을 만들지는 않으므로 안전한 거리에서만 사용한다.

## 공허 균열의 두 번째 폭발을 묶는다

**`공허 균열(W)`은 같은 자리를 두 번 공격하고 이동 중에도 시전할 수 있다.** 첫 피해 뒤 `지각 붕괴(E)`로 띄우면 두 번째 폭발과 분해 중첩을 함께 맞히기 쉽다. `E`는 가까운 적을 밀어내는 생존 수단이기도 하므로 상대 돌진이 남았을 때 먼저 소비하지 않는다.

## 연구 완료 표적에 광선을 고정한다

**`생물 분해 광선(R)`은 정신 집중 동안 적을 둔화하고, 연구가 완료된 챔피언에게 고정 피해를 준다.** 분해 중첩을 터뜨린 대상을 우선해 광선의 효율을 높인다. 적의 끊는 기술과 측면 진입을 확인한 뒤 사용하고, 한 명을 끝까지 따라가기보다 여러 적의 퇴로를 가르는 각도 고려한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-non-adc-champion-velkoz-20260915' OR (kind = 'article' AND title_key = '벨코즈'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-champion-velkoz-20260915', id, NULL, 0, general, '비원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-non-adc-champion-velkoz-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — `Q` 분열 각을 양옆으로 만든다 · `W` 두 타격과 `E`를 겹친다 · 연구 완료 뒤 `R`을 집중한다

[[분류:원딜]] [[분류:비원딜]]

## 플라즈마 분열을 옆에서 맞힌다

**`플라즈마 분열(Q)`은 적중하거나 다시 사용하면 좌우 두 갈래로 갈라진다.**[* [벨코즈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=118)] 미니언 정면이 막혔을 때 대각선으로 쏜 뒤 분열시켜 옆구리를 노린다. 첫 투사체를 끝까지 보내는 것보다 상대 이동에 맞춰 일찍 갈라지게 하면 반응할 시간을 줄일 수 있다.

## 유기물 분해 세 번째 적중을 센다

**벨코즈의 스킬은 분해 중첩을 남기고 세 번째 적중에서 고정 피해를 준다.** 한 번 맞힌 뒤 급하게 모든 기술을 던지지 말고 중첩이 사라지기 전에 확실한 다음 적중을 준비한다. 기본 공격은 중첩 시간을 이어 주지만 새 중첩을 만들지는 않으므로 안전한 거리에서만 사용한다.

## 공허 균열의 두 번째 폭발을 묶는다

**`공허 균열(W)`은 같은 자리를 두 번 공격하고 이동 중에도 시전할 수 있다.** 첫 피해 뒤 `지각 붕괴(E)`로 띄우면 두 번째 폭발과 분해 중첩을 함께 맞히기 쉽다. `E`는 가까운 적을 밀어내는 생존 수단이기도 하므로 상대 돌진이 남았을 때 먼저 소비하지 않는다.

## 연구 완료 표적에 광선을 고정한다

**`생물 분해 광선(R)`은 정신 집중 동안 적을 둔화하고, 연구가 완료된 챔피언에게 고정 피해를 준다.** 분해 중첩을 터뜨린 대상을 우선해 광선의 효율을 높인다. 적의 끊는 기술과 측면 진입을 확인한 뒤 사용하고, 한 명을 끝까지 따라가기보다 여러 적의 퇴로를 가르는 각도 고려한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-champion-velkoz-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-velkoz-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-velkoz-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-velkoz-20260915' AND target_key = '분류:원딜');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-velkoz-20260915', NULL, '분류:비원딜', '분류:비원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-velkoz-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-velkoz-20260915' AND target_key = '분류:비원딜');

-- 카르마 챔피언 위키 (907자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-non-adc-champion-karma-20260915', 'article', '카르마', '카르마', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 교전마다 만트라 대상을 먼저 정한다 · `Q` 폭발로 이동 공간을 줄인다 · `W` 연결이 끊기지 않게 움직인다

[[분류:원딜]] [[분류:비원딜]]

## 만트라를 쓰기 전에 다음 장면을 고른다

**`만트라(R)`는 처음부터 사용할 수 있고 다음 기본 스킬 하나를 강화한다.**[* [카르마 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=26)] 피해가 필요한지, 속박과 회복이 필요한지, 여러 아군의 이동과 보호가 필요한지를 먼저 판단한다. 교전이 열렸다는 이유만으로 즉시 누르면 정작 필요한 강화 효과가 남지 않는다.

## 영혼의 불꽃으로 퇴로를 닫는다

**`내면의 열정(Q)`은 처음 맞은 유닛에서 폭발하고, 만트라로 강화하면 잠시 뒤 다시 터지는 영역을 남긴다.** 미니언에 막히더라도 폭발 범위가 챔피언까지 닿는 각을 찾는다. 강화 `Q`는 현재 위치보다 상대가 빠질 방향에 맞혀 두 번째 폭발을 피하느라 동선을 잃게 한다.

## 굳은 결의는 발보다 퇴로로 유지한다

**`굳은 결의(W)`의 연결이 끝까지 이어지면 대상을 속박하며, 강화하면 카르마의 체력도 회복한다.** 연결 직후 상대만 따라가지 말고 이동기와 수풀을 피해 비스듬히 걷는다. 상대가 끈을 끊으려고 물러나면 무리하게 끝까지 쫓기보다 확보한 공간으로 웨이브를 정리한다.

## 고무로 공격과 후퇴의 박자를 맞춘다

**`고무(E)`는 보호막과 이동 속도를 함께 주고, 강화하면 주변 아군에게 효과가 퍼진다.** 피해를 받은 뒤 늦게 누르기보다 투사체가 날아오거나 진입이 시작되는 순간 사용한다. 여러 명을 살려야 할 때는 아군이 모일 때까지 만트라를 남기고, 혼자 떨어진 상태에서는 기본 `E`로 거리를 유지한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-non-adc-champion-karma-20260915' OR (kind = 'article' AND title_key = '카르마'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-champion-karma-20260915', id, NULL, 0, general, '비원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-non-adc-champion-karma-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 교전마다 만트라 대상을 먼저 정한다 · `Q` 폭발로 이동 공간을 줄인다 · `W` 연결이 끊기지 않게 움직인다

[[분류:원딜]] [[분류:비원딜]]

## 만트라를 쓰기 전에 다음 장면을 고른다

**`만트라(R)`는 처음부터 사용할 수 있고 다음 기본 스킬 하나를 강화한다.**[* [카르마 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=26)] 피해가 필요한지, 속박과 회복이 필요한지, 여러 아군의 이동과 보호가 필요한지를 먼저 판단한다. 교전이 열렸다는 이유만으로 즉시 누르면 정작 필요한 강화 효과가 남지 않는다.

## 영혼의 불꽃으로 퇴로를 닫는다

**`내면의 열정(Q)`은 처음 맞은 유닛에서 폭발하고, 만트라로 강화하면 잠시 뒤 다시 터지는 영역을 남긴다.** 미니언에 막히더라도 폭발 범위가 챔피언까지 닿는 각을 찾는다. 강화 `Q`는 현재 위치보다 상대가 빠질 방향에 맞혀 두 번째 폭발을 피하느라 동선을 잃게 한다.

## 굳은 결의는 발보다 퇴로로 유지한다

**`굳은 결의(W)`의 연결이 끝까지 이어지면 대상을 속박하며, 강화하면 카르마의 체력도 회복한다.** 연결 직후 상대만 따라가지 말고 이동기와 수풀을 피해 비스듬히 걷는다. 상대가 끈을 끊으려고 물러나면 무리하게 끝까지 쫓기보다 확보한 공간으로 웨이브를 정리한다.

## 고무로 공격과 후퇴의 박자를 맞춘다

**`고무(E)`는 보호막과 이동 속도를 함께 주고, 강화하면 주변 아군에게 효과가 퍼진다.** 피해를 받은 뒤 늦게 누르기보다 투사체가 날아오거나 진입이 시작되는 순간 사용한다. 여러 명을 살려야 할 때는 아군이 모일 때까지 만트라를 남기고, 혼자 떨어진 상태에서는 기본 `E`로 거리를 유지한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-champion-karma-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-karma-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-karma-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-karma-20260915' AND target_key = '분류:원딜');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-karma-20260915', NULL, '분류:비원딜', '분류:비원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-karma-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-karma-20260915' AND target_key = '분류:비원딜');

-- 판테온 챔피언 위키 (897자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-non-adc-champion-pantheon-20260915', 'article', '판테온', '판테온', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 다섯 번째 행동 뒤 강화 스킬을 고른다 · 짧은 `Q`로 재사용 시간을 줄인다 · `E`의 정면 방어 방향을 지킨다

[[분류:원딜]] [[분류:비원딜]]

## 필멸자의 의지를 목적에 맞게 쓴다

**판테온은 공격과 스킬을 다섯 번 사용하면 다음 기본 스킬을 강화한다.**[* [판테온 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=48)] 진입할 때는 강화 `방호의 도약(W)`의 연속 타격, 마무리에는 강화 `혜성의 창(Q)`, 버티며 빠질 때는 강화 `방패 돌격(E)`을 준비한다. 중첩이 찼다고 가장 먼저 닿는 기술에 쓰지 않는다.

## 혜성의 창은 짧게 찌르는 선택이 기본이다

**`혜성의 창(Q)`은 짧게 누르면 전방을 찌르고 재사용 대기시간이 크게 줄며, 길게 누르면 멀리 던진다.** 라인 안에서는 짧은 창으로 미니언과 챔피언을 함께 맞혀 압박을 이어간다. 긴 창은 체력이 낮은 적의 이동이 읽히거나 안전한 거리에서 마무리할 때 사용한다.

## 방호의 도약 뒤 퇴로를 계산한다

**`방호의 도약(W)`은 대상을 지정해 돌진하고 기절시키므로 교전 시작이 확실하다.** 아군이 바로 호응할 거리인지, 상대 서포터의 제어가 남았는지 확인한다. 강화 `W`의 연속 공격은 다음 필멸자의 의지를 빠르게 준비하므로 이어 쓸 강화 스킬까지 정해 둔다.

## 방패 방향을 상대 화력에 고정한다

**`방패 돌격(E)`은 방패를 든 방향에서 오는 피해를 막으며 전진한다.** 피해를 더 넣으려고 몸을 돌리면 방어가 끊기므로 핵심 공격을 쓰는 적을 정면에 둔다. `거대 유성(R)`은 착지 지점이 보이므로 퇴로 뒤를 막거나 이미 시작된 아군 제어에 합류하는 용도로 사용한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-non-adc-champion-pantheon-20260915' OR (kind = 'article' AND title_key = '판테온'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-champion-pantheon-20260915', id, NULL, 0, general, '비원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-non-adc-champion-pantheon-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 다섯 번째 행동 뒤 강화 스킬을 고른다 · 짧은 `Q`로 재사용 시간을 줄인다 · `E`의 정면 방어 방향을 지킨다

[[분류:원딜]] [[분류:비원딜]]

## 필멸자의 의지를 목적에 맞게 쓴다

**판테온은 공격과 스킬을 다섯 번 사용하면 다음 기본 스킬을 강화한다.**[* [판테온 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=48)] 진입할 때는 강화 `방호의 도약(W)`의 연속 타격, 마무리에는 강화 `혜성의 창(Q)`, 버티며 빠질 때는 강화 `방패 돌격(E)`을 준비한다. 중첩이 찼다고 가장 먼저 닿는 기술에 쓰지 않는다.

## 혜성의 창은 짧게 찌르는 선택이 기본이다

**`혜성의 창(Q)`은 짧게 누르면 전방을 찌르고 재사용 대기시간이 크게 줄며, 길게 누르면 멀리 던진다.** 라인 안에서는 짧은 창으로 미니언과 챔피언을 함께 맞혀 압박을 이어간다. 긴 창은 체력이 낮은 적의 이동이 읽히거나 안전한 거리에서 마무리할 때 사용한다.

## 방호의 도약 뒤 퇴로를 계산한다

**`방호의 도약(W)`은 대상을 지정해 돌진하고 기절시키므로 교전 시작이 확실하다.** 아군이 바로 호응할 거리인지, 상대 서포터의 제어가 남았는지 확인한다. 강화 `W`의 연속 공격은 다음 필멸자의 의지를 빠르게 준비하므로 이어 쓸 강화 스킬까지 정해 둔다.

## 방패 방향을 상대 화력에 고정한다

**`방패 돌격(E)`은 방패를 든 방향에서 오는 피해를 막으며 전진한다.** 피해를 더 넣으려고 몸을 돌리면 방어가 끊기므로 핵심 공격을 쓰는 적을 정면에 둔다. `거대 유성(R)`은 착지 지점이 보이므로 퇴로 뒤를 막거나 이미 시작된 아군 제어에 합류하는 용도로 사용한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-champion-pantheon-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-pantheon-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-pantheon-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-pantheon-20260915' AND target_key = '분류:원딜');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-pantheon-20260915', NULL, '분류:비원딜', '분류:비원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-pantheon-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-pantheon-20260915' AND target_key = '분류:비원딜');

-- 자이라 챔피언 위키 (877자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-non-adc-champion-zyra-20260915', 'article', '자이라', '자이라', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 씨앗과 스킬을 겹쳐 식물을 만든다 · `E`는 여러 유닛을 관통한다 · `R` 안의 식물을 함께 강화한다

[[분류:원딜]] [[분류:비원딜]]

## 씨앗은 다음 스킬의 역할에 맞춰 심는다

**`맹렬한 성장(W)`의 씨앗 근처에 `치명적인 가시(Q)`를 쓰면 원거리 식물, `휘감는 뿌리(E)`를 쓰면 둔화하는 근거리 식물이 자란다.**[* [자이라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=101)] 무조건 두 씨앗을 붙이지 말고 견제와 추격 중 필요한 식물을 골라 서로 다른 각도에 심는다.

## 치명적인 가시로 웨이브와 식물을 함께 깨운다

**`치명적인 가시(Q)`는 지정 지역을 빠르게 공격하므로 막타를 치는 상대에게 맞히기 좋다.** 씨앗 바로 위가 아니라 가장자리까지 범위에 넣으면 상대 발밑과 씨앗을 동시에 덮을 수 있다. 식물이 미니언만 공격하지 않도록 챔피언에게 기술이나 기본 공격을 맞혀 표적을 잡아 준다.

## 휘감는 뿌리의 관통 경로를 숨긴다

**`휘감는 뿌리(E)`는 미니언을 지나 계속 전진하며 맞은 적의 발을 묶는다.** 미니언 뒤가 안전하다고 믿는 상대에게 웨이브를 가로질러 사용한다. 빗나가면 즉시 들어오는 상대를 막기 어려우므로 씨앗에서 자란 둔화 식물이나 거리로 빈틈을 보완한다.

## 올가미 덩굴은 식물이 있는 곳에 펼친다

**`올가미 덩굴(R)`은 잠시 뒤 적을 띄우고 범위 안의 식물을 격분시킨다.** 적 숫자만 보고 쓰기보다 이미 식물이 공격 중인 지역과 아군 제어가 겹치는 순간을 고른다. 공중에 뜨기 전 빠져나갈 수 있으므로 `E` 속박을 먼저 맞히거나 퇴로 쪽으로 넓게 배치한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-non-adc-champion-zyra-20260915' OR (kind = 'article' AND title_key = '자이라'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-champion-zyra-20260915', id, NULL, 0, general, '비원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-non-adc-champion-zyra-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 씨앗과 스킬을 겹쳐 식물을 만든다 · `E`는 여러 유닛을 관통한다 · `R` 안의 식물을 함께 강화한다

[[분류:원딜]] [[분류:비원딜]]

## 씨앗은 다음 스킬의 역할에 맞춰 심는다

**`맹렬한 성장(W)`의 씨앗 근처에 `치명적인 가시(Q)`를 쓰면 원거리 식물, `휘감는 뿌리(E)`를 쓰면 둔화하는 근거리 식물이 자란다.**[* [자이라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=101)] 무조건 두 씨앗을 붙이지 말고 견제와 추격 중 필요한 식물을 골라 서로 다른 각도에 심는다.

## 치명적인 가시로 웨이브와 식물을 함께 깨운다

**`치명적인 가시(Q)`는 지정 지역을 빠르게 공격하므로 막타를 치는 상대에게 맞히기 좋다.** 씨앗 바로 위가 아니라 가장자리까지 범위에 넣으면 상대 발밑과 씨앗을 동시에 덮을 수 있다. 식물이 미니언만 공격하지 않도록 챔피언에게 기술이나 기본 공격을 맞혀 표적을 잡아 준다.

## 휘감는 뿌리의 관통 경로를 숨긴다

**`휘감는 뿌리(E)`는 미니언을 지나 계속 전진하며 맞은 적의 발을 묶는다.** 미니언 뒤가 안전하다고 믿는 상대에게 웨이브를 가로질러 사용한다. 빗나가면 즉시 들어오는 상대를 막기 어려우므로 씨앗에서 자란 둔화 식물이나 거리로 빈틈을 보완한다.

## 올가미 덩굴은 식물이 있는 곳에 펼친다

**`올가미 덩굴(R)`은 잠시 뒤 적을 띄우고 범위 안의 식물을 격분시킨다.** 적 숫자만 보고 쓰기보다 이미 식물이 공격 중인 지역과 아군 제어가 겹치는 순간을 고른다. 공중에 뜨기 전 빠져나갈 수 있으므로 `E` 속박을 먼저 맞히거나 퇴로 쪽으로 넓게 배치한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-champion-zyra-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-zyra-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-zyra-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-zyra-20260915' AND target_key = '분류:원딜');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-zyra-20260915', NULL, '분류:비원딜', '분류:비원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-zyra-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-zyra-20260915' AND target_key = '분류:비원딜');

-- 브랜드 챔피언 위키 (889자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-non-adc-champion-brand-20260915', 'article', '브랜드', '브랜드', 'published', NULL, '# 원딜 실전 운용

> **한눈에 보기** — 불길이 묻은 대상에게 추가 효과를 잇는다 · `Q` 기절 순서를 지킨다 · 적이 모였을 때 `R`을 튕긴다

[[분류:원딜]] [[분류:비원딜]]

## 불길 중첩을 다음 기술의 조건으로 쓴다

**브랜드의 스킬은 대상을 불태우고, 다른 기술은 불타는 대상에게 강화 효과를 낸다.**[* [브랜드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=8)] 한 번에 아무 순서로 던지기보다 기절, 넓은 전파, 추가 피해 중 필요한 결과를 정한다. 같은 챔피언에게 중첩을 이어 붙이면 폭발까지 만들 수 있으므로 첫 적중 뒤 거리를 유지한다.

## 불태우기 전에 기절 조건을 만든다

**`불태우기(Q)`는 대상이 이미 불타는 상태일 때 기절시킨다.** 먼저 `발화(E)`나 `화염 기둥(W)`을 맞힌 뒤 투사체 경로를 확보한다. 미니언이 `Q`를 막을 수 있으므로 웨이브 옆으로 한 걸음 이동하고, 조건이 없을 때 생존용 `Q`를 성급히 던지지 않는다.

## 화염 기둥과 발화의 강화 효과를 나눈다

**`화염 기둥(W)`은 불타는 적에게 더 큰 피해를 주고, `발화(E)`는 불타는 대상에서 더 넓게 퍼진다.** 단일 대상을 강하게 압박할 때는 먼저 다른 기술 뒤 `W`, 미니언을 통해 뒤의 챔피언까지 불길을 옮길 때는 먼저 불태운 대상에 `E`를 사용한다.

## 파멸의 불덩이가 튈 간격을 확인한다

**`파멸의 불덩이(R)`는 브랜드와 주변 적 사이를 여러 번 튕기며 불타는 적을 둔화한다.** 적 하나만 멀리 떨어져 있으면 반사 횟수를 살리기 어렵다. 두 챔피언이나 챔피언과 미니언이 적당히 모인 순간에 사용하고, 자신에게 튕겨 돌아올 수 있는 거리도 유지한다.', 1, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-non-adc-champion-brand-20260915' OR (kind = 'article' AND title_key = '브랜드'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-champion-brand-20260915', id, NULL, 0, general, '비원딜 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-non-adc-champion-brand-20260915' AND revision = 1 AND general = '# 원딜 실전 운용

> **한눈에 보기** — 불길이 묻은 대상에게 추가 효과를 잇는다 · `Q` 기절 순서를 지킨다 · 적이 모였을 때 `R`을 튕긴다

[[분류:원딜]] [[분류:비원딜]]

## 불길 중첩을 다음 기술의 조건으로 쓴다

**브랜드의 스킬은 대상을 불태우고, 다른 기술은 불타는 대상에게 강화 효과를 낸다.**[* [브랜드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=8)] 한 번에 아무 순서로 던지기보다 기절, 넓은 전파, 추가 피해 중 필요한 결과를 정한다. 같은 챔피언에게 중첩을 이어 붙이면 폭발까지 만들 수 있으므로 첫 적중 뒤 거리를 유지한다.

## 불태우기 전에 기절 조건을 만든다

**`불태우기(Q)`는 대상이 이미 불타는 상태일 때 기절시킨다.** 먼저 `발화(E)`나 `화염 기둥(W)`을 맞힌 뒤 투사체 경로를 확보한다. 미니언이 `Q`를 막을 수 있으므로 웨이브 옆으로 한 걸음 이동하고, 조건이 없을 때 생존용 `Q`를 성급히 던지지 않는다.

## 화염 기둥과 발화의 강화 효과를 나눈다

**`화염 기둥(W)`은 불타는 적에게 더 큰 피해를 주고, `발화(E)`는 불타는 대상에서 더 넓게 퍼진다.** 단일 대상을 강하게 압박할 때는 먼저 다른 기술 뒤 `W`, 미니언을 통해 뒤의 챔피언까지 불길을 옮길 때는 먼저 불태운 대상에 `E`를 사용한다.

## 파멸의 불덩이가 튈 간격을 확인한다

**`파멸의 불덩이(R)`는 브랜드와 주변 적 사이를 여러 번 튕기며 불타는 적을 둔화한다.** 적 하나만 멀리 떨어져 있으면 반사 횟수를 살리기 어렵다. 두 챔피언이나 챔피언과 미니언이 적당히 모인 순간에 사용하고, 자신에게 튕겨 돌아올 수 있는 거리도 유지한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-champion-brand-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-brand-20260915', NULL, '분류:원딜', '분류:원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-brand-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-brand-20260915' AND target_key = '분류:원딜');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-non-adc-champion-brand-20260915', NULL, '분류:비원딜', '분류:비원딜' FROM wiki_docs WHERE id = 'doc-non-adc-champion-brand-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-non-adc-champion-brand-20260915' AND target_key = '분류:비원딜');

-- ziggs 상대법 (782자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-ziggs', 'matchup', NULL, NULL, 'published', 'ziggs', '', 0, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — `Q`의 첫 착지점 옆으로 걷는다 · `W`가 빠진 뒤 거리를 좁힌다 · `R` 중심에서 먼저 벗어난다

## 반동 폭탄의 다음 바운드까지 본다
**`반동 폭탄(Q)`은 땅을 튕기며 앞으로 진행한다.**[* [직스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=92)] 뒤로만 피하면 다음 바운드에 맞기 쉬우므로 첫 착지점의 옆으로 움직인다. 막타를 칠 때 미니언과 일직선에 오래 서지 않아 웨이브와 함께 맞는 상황을 줄인다.

## 휴대용 폭약이 남아 있으면 억지로 붙지 않는다
**`휴대용 폭약(W)`은 직스와 적을 서로 밀어내며 직스의 탈출 수단이 된다.** 먼저 이동기를 쓰지 말고 폭약 설치 위치에서 비껴선다. 직스가 포탑이나 웨이브에 `W`를 사용한 뒤에는 다시 준비되기 전이 거리를 좁힐 기회다.

## 지뢰밭을 가로질러 추격하지 않는다
**`마법공학 지뢰밭(E)`은 밟을 때마다 피해와 둔화를 준다.** 좁은 통로가 막혔다면 여러 지뢰를 밟아 직선으로 쫓지 말고 다른 입구로 돈다. 라인에서는 지뢰가 사라질 때까지 안전한 쪽 미니언을 먹으며 이동 공간을 남긴다.

## 지옥 화염 폭탄의 중심 표시를 피한다
**`지옥 화염 폭탄(R)`은 폭발 중심의 피해가 더 크다.** 먼 거리에서 표시가 보이면 가장 짧은 방향으로 중심부터 벗어나고, 체력이 낮을 때 같은 위치에 아군과 모이지 않는다. 직스가 다른 교전에 지원할 수 있으므로 시야 밖으로 사라지면 신호를 보낸다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-ziggs' AND kind = 'matchup' AND champion_slug = 'ziggs'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-ziggs');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-matchup-ziggs-20260915', id, NULL, 0, general, '비원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-ziggs' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — `Q`의 첫 착지점 옆으로 걷는다 · `W`가 빠진 뒤 거리를 좁힌다 · `R` 중심에서 먼저 벗어난다

## 반동 폭탄의 다음 바운드까지 본다
**`반동 폭탄(Q)`은 땅을 튕기며 앞으로 진행한다.**[* [직스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=92)] 뒤로만 피하면 다음 바운드에 맞기 쉬우므로 첫 착지점의 옆으로 움직인다. 막타를 칠 때 미니언과 일직선에 오래 서지 않아 웨이브와 함께 맞는 상황을 줄인다.

## 휴대용 폭약이 남아 있으면 억지로 붙지 않는다
**`휴대용 폭약(W)`은 직스와 적을 서로 밀어내며 직스의 탈출 수단이 된다.** 먼저 이동기를 쓰지 말고 폭약 설치 위치에서 비껴선다. 직스가 포탑이나 웨이브에 `W`를 사용한 뒤에는 다시 준비되기 전이 거리를 좁힐 기회다.

## 지뢰밭을 가로질러 추격하지 않는다
**`마법공학 지뢰밭(E)`은 밟을 때마다 피해와 둔화를 준다.** 좁은 통로가 막혔다면 여러 지뢰를 밟아 직선으로 쫓지 말고 다른 입구로 돈다. 라인에서는 지뢰가 사라질 때까지 안전한 쪽 미니언을 먹으며 이동 공간을 남긴다.

## 지옥 화염 폭탄의 중심 표시를 피한다
**`지옥 화염 폭탄(R)`은 폭발 중심의 피해가 더 크다.** 먼 거리에서 표시가 보이면 가장 짧은 방향으로 중심부터 벗어나고, 체력이 낮을 때 같은 위치에 아군과 모이지 않는다. 직스가 다른 교전에 지원할 수 있으므로 시야 밖으로 사라지면 신호를 보낸다.'
AND updated_at = '2026-09-15T09:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-matchup-ziggs-20260915');

-- seraphine 상대법 (809자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-seraphine', 'matchup', NULL, NULL, 'published', 'seraphine', '', 0, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 세 번째 기본 스킬의 메아리를 확인한다 · 보호막 뒤 회복까지 기다린다 · `R`이 챔피언을 타고 늘어난다

## 메아리가 준비된 스킬과 정면으로 싸우지 않는다
**세라핀은 세 번째 기본 스킬을 자동으로 두 번 사용한다.**[* [세라핀 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=152)] 자원 표시가 찬 상태에서는 `Q`의 반복 피해와 `E`의 강화된 이동 방해를 모두 경계한다. 먼저 한 번 소모하게 만든 뒤 다음 세 번째 스킬이 오기 전에 짧게 압박한다.

## 비트 발사 전에 걸린 둔화를 확인한다
**`비트 발사(E)`는 이미 이동이 방해된 대상에게 더 강한 제어로 이어질 수 있다.** 아군이나 미니언을 관통해 날아오므로 뒤에 숨기보다 옆으로 피한다. 다른 둔화에 걸렸다면 같은 방향으로 계속 도망치지 말고 `E` 투사체부터 피한다.

## 소리 장막의 긴 공백을 사용한다
**`소리 장막(W)`은 주변 아군에게 보호막과 이동 속도를 주고 조건이 맞으면 회복까지 제공한다.** 첫 보호막만 보고 피해 교환을 끝내지 말고 회복 발동 여부를 확인한다. `W`가 끝난 뒤에는 세라핀과 아군이 동시에 약해지는 시간이므로 그때 웨이브 주도권을 되찾는다.

## 앙코르의 연장선을 비운다
**`앙코르(R)`은 아군과 적 챔피언을 통과할 때마다 사거리가 늘어난다.** 앞의 아군 뒤에 일렬로 서면 보이지 않던 거리에서도 매혹될 수 있다. 교전이 시작되면 대각선으로 흩어지고, 세라핀이 정면을 바라보는 동안 측면에서 압박한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-seraphine' AND kind = 'matchup' AND champion_slug = 'seraphine'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-seraphine');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-matchup-seraphine-20260915', id, NULL, 0, general, '비원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-seraphine' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 세 번째 기본 스킬의 메아리를 확인한다 · 보호막 뒤 회복까지 기다린다 · `R`이 챔피언을 타고 늘어난다

## 메아리가 준비된 스킬과 정면으로 싸우지 않는다
**세라핀은 세 번째 기본 스킬을 자동으로 두 번 사용한다.**[* [세라핀 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=152)] 자원 표시가 찬 상태에서는 `Q`의 반복 피해와 `E`의 강화된 이동 방해를 모두 경계한다. 먼저 한 번 소모하게 만든 뒤 다음 세 번째 스킬이 오기 전에 짧게 압박한다.

## 비트 발사 전에 걸린 둔화를 확인한다
**`비트 발사(E)`는 이미 이동이 방해된 대상에게 더 강한 제어로 이어질 수 있다.** 아군이나 미니언을 관통해 날아오므로 뒤에 숨기보다 옆으로 피한다. 다른 둔화에 걸렸다면 같은 방향으로 계속 도망치지 말고 `E` 투사체부터 피한다.

## 소리 장막의 긴 공백을 사용한다
**`소리 장막(W)`은 주변 아군에게 보호막과 이동 속도를 주고 조건이 맞으면 회복까지 제공한다.** 첫 보호막만 보고 피해 교환을 끝내지 말고 회복 발동 여부를 확인한다. `W`가 끝난 뒤에는 세라핀과 아군이 동시에 약해지는 시간이므로 그때 웨이브 주도권을 되찾는다.

## 앙코르의 연장선을 비운다
**`앙코르(R)`은 아군과 적 챔피언을 통과할 때마다 사거리가 늘어난다.** 앞의 아군 뒤에 일렬로 서면 보이지 않던 거리에서도 매혹될 수 있다. 교전이 시작되면 대각선으로 흩어지고, 세라핀이 정면을 바라보는 동안 측면에서 압박한다.'
AND updated_at = '2026-09-15T09:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-matchup-seraphine-20260915');

-- swain 상대법 (816자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-swain', 'matchup', NULL, NULL, 'published', 'swain', '', 0, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 돌아오는 `E` 경로에서 옆으로 빠진다 · 가까운 `Q` 교환을 피한다 · `R`이 켜지면 범위를 벗어난다

## 속박명령은 돌아올 때까지 피한다
**`속박명령(E)`은 전진한 파동이 스웨인에게 돌아오며 적을 속박하고, 붙잡힌 챔피언을 끌어당길 수 있다.**[* [스웨인 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=61)] 첫 파동을 피했다고 멈추지 말고 귀환 경로의 옆으로 빠진다. 미니언 뒤에 붙어 있으면 돌아오는 폭발에 함께 걸리기 쉬워 간격을 둔다.

## 죽음의 손길은 거리가 피해를 가른다
**`죽음의 손길(Q)`은 여러 갈래 번개가 겹쳐 맞을수록 피해가 커진다.** 스웨인이 걸어 들어올 때 같은 자리에서 기본 공격을 이어가지 말고 최대 사거리를 유지한다. 체력이 낮은 미니언은 번개가 관통할 수 있으므로 그 뒤를 안전지대로 여기지 않는다.

## 제국의 눈 표시에서 즉시 나온다
**`제국의 눈(W)`은 잠시 뒤 넓은 지역을 공격해 둔화시키고 적중한 챔피언의 모습을 드러낸다.** 다른 제어에 걸렸을 때 이어지는 경우가 많으므로 가장자리까지 짧은 방향으로 움직인다. 수풀에서 맞았다면 위치가 드러난 동안 같은 길로 도망치지 않는다.

## 악의 승천과 오래 싸워 주지 않는다
**`악의 승천(R)`은 주변 적의 생명력을 흡수하고 챔피언이 범위 안에 있는 동안 오래 유지된다.** 켜진 직후 화력을 맞대기보다 이동기를 아껴 범위 밖으로 빠진다. 변신이 끝난 뒤 다시 접근하고, 여러 아군이 한꺼번에 흡수당하지 않게 흩어진다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-swain' AND kind = 'matchup' AND champion_slug = 'swain'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-swain');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-matchup-swain-20260915', id, NULL, 0, general, '비원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-swain' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 돌아오는 `E` 경로에서 옆으로 빠진다 · 가까운 `Q` 교환을 피한다 · `R`이 켜지면 범위를 벗어난다

## 속박명령은 돌아올 때까지 피한다
**`속박명령(E)`은 전진한 파동이 스웨인에게 돌아오며 적을 속박하고, 붙잡힌 챔피언을 끌어당길 수 있다.**[* [스웨인 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=61)] 첫 파동을 피했다고 멈추지 말고 귀환 경로의 옆으로 빠진다. 미니언 뒤에 붙어 있으면 돌아오는 폭발에 함께 걸리기 쉬워 간격을 둔다.

## 죽음의 손길은 거리가 피해를 가른다
**`죽음의 손길(Q)`은 여러 갈래 번개가 겹쳐 맞을수록 피해가 커진다.** 스웨인이 걸어 들어올 때 같은 자리에서 기본 공격을 이어가지 말고 최대 사거리를 유지한다. 체력이 낮은 미니언은 번개가 관통할 수 있으므로 그 뒤를 안전지대로 여기지 않는다.

## 제국의 눈 표시에서 즉시 나온다
**`제국의 눈(W)`은 잠시 뒤 넓은 지역을 공격해 둔화시키고 적중한 챔피언의 모습을 드러낸다.** 다른 제어에 걸렸을 때 이어지는 경우가 많으므로 가장자리까지 짧은 방향으로 움직인다. 수풀에서 맞았다면 위치가 드러난 동안 같은 길로 도망치지 않는다.

## 악의 승천과 오래 싸워 주지 않는다
**`악의 승천(R)`은 주변 적의 생명력을 흡수하고 챔피언이 범위 안에 있는 동안 오래 유지된다.** 켜진 직후 화력을 맞대기보다 이동기를 아껴 범위 밖으로 빠진다. 변신이 끝난 뒤 다시 접근하고, 여러 아군이 한꺼번에 흡수당하지 않게 흩어진다.'
AND updated_at = '2026-09-15T09:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-matchup-swain-20260915');

-- velkoz 상대법 (795자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-velkoz', 'matchup', NULL, NULL, 'published', 'velkoz', '', 0, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — `Q`가 갈라질 옆 각도를 본다 · 분해 중첩 세 번째 적중을 피한다 · `R` 정신 집중을 끊거나 범위를 벗어난다

## 플라즈마 분열의 직각을 예상한다
**`플라즈마 분열(Q)`은 멈춘 자리에서 좌우로 갈라지므로 정면 투사체를 피한 뒤에도 안전하지 않다.**[* [벨코즈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=118)] 벨코즈가 대각선으로 쐈다면 분열선과 평행하게 움직이고, 미니언 옆 좁은 틈에 오래 서지 않는다.

## 공허 균열의 두 번째 폭발에서 나온다
**`공허 균열(W)`은 같은 지역을 잠시 뒤 다시 공격한다.** 첫 피해를 맞았더라도 반격하려고 멈추지 말고 표시 밖으로 빠져 두 번째 타격을 끊는다. 벨코즈가 `지각 붕괴(E)`를 이어 띄우려 하므로 직선보다 비스듬히 이동한다.

## 유기물 분해 중첩을 세기 전에 쉬어 간다
**벨코즈의 스킬을 세 번 맞으면 유기물 분해의 고정 피해가 터진다.** 두 중첩이 보일 때는 다음 기술 하나를 맞교환하지 말고 사라질 시간을 번다. 기본 공격은 중첩 지속시간을 갱신할 수 있으므로 가까이 걸어가서 막타를 억지로 먹지 않는다.

## 생물 분해 광선의 시작 위치를 압박한다
**`생물 분해 광선(R)`은 정신 집중 동안 방향을 바꾸며 둔화시킨다.** 끊을 수 있는 제어 기술이 있다면 시전을 확인한 뒤 사용하고, 없다면 광선과 직각으로 이동해 범위를 벗어난다. 연구 완료 표식이 있다면 앞에 서서 피해를 대신 맞아 주려 하지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-velkoz' AND kind = 'matchup' AND champion_slug = 'velkoz'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-velkoz');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-matchup-velkoz-20260915', id, NULL, 0, general, '비원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-velkoz' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — `Q`가 갈라질 옆 각도를 본다 · 분해 중첩 세 번째 적중을 피한다 · `R` 정신 집중을 끊거나 범위를 벗어난다

## 플라즈마 분열의 직각을 예상한다
**`플라즈마 분열(Q)`은 멈춘 자리에서 좌우로 갈라지므로 정면 투사체를 피한 뒤에도 안전하지 않다.**[* [벨코즈 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=118)] 벨코즈가 대각선으로 쐈다면 분열선과 평행하게 움직이고, 미니언 옆 좁은 틈에 오래 서지 않는다.

## 공허 균열의 두 번째 폭발에서 나온다
**`공허 균열(W)`은 같은 지역을 잠시 뒤 다시 공격한다.** 첫 피해를 맞았더라도 반격하려고 멈추지 말고 표시 밖으로 빠져 두 번째 타격을 끊는다. 벨코즈가 `지각 붕괴(E)`를 이어 띄우려 하므로 직선보다 비스듬히 이동한다.

## 유기물 분해 중첩을 세기 전에 쉬어 간다
**벨코즈의 스킬을 세 번 맞으면 유기물 분해의 고정 피해가 터진다.** 두 중첩이 보일 때는 다음 기술 하나를 맞교환하지 말고 사라질 시간을 번다. 기본 공격은 중첩 지속시간을 갱신할 수 있으므로 가까이 걸어가서 막타를 억지로 먹지 않는다.

## 생물 분해 광선의 시작 위치를 압박한다
**`생물 분해 광선(R)`은 정신 집중 동안 방향을 바꾸며 둔화시킨다.** 끊을 수 있는 제어 기술이 있다면 시전을 확인한 뒤 사용하고, 없다면 광선과 직각으로 이동해 범위를 벗어난다. 연구 완료 표식이 있다면 앞에 서서 피해를 대신 맞아 주려 하지 않는다.'
AND updated_at = '2026-09-15T09:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-matchup-velkoz-20260915');

-- karma 상대법 (779자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-karma', 'matchup', NULL, NULL, 'published', 'karma', '', 0, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 만트라로 강화할 스킬을 확인한다 · 미니언과 거리를 둬 `Q` 폭발을 피한다 · `W` 연결을 끊는다

## 영혼의 불꽃이 터질 미니언에서 떨어진다
**`내면의 열정(Q)`은 처음 맞은 유닛에서 폭발하므로 미니언 뒤에 딱 붙으면 함께 피해를 받는다.**[* [카르마 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=26)] 막타를 칠 때 옆 간격을 두고, 만트라로 강화한 투사체가 만든 원형 지역에서는 두 번째 폭발 전에 빠져나온다.

## 굳은 결의의 끈을 거리로 끊는다
**`굳은 결의(W)`는 연결이 유지되면 속박하고 강화 상태에서는 카르마가 회복한다.** 카르마와 맞서며 끝까지 공격하기보다 즉시 연결 범위 밖으로 움직인다. 수풀로 들어가도 위치가 드러나므로 시야 숨기기보다 거리를 우선한다.

## 만트라 선택이 끝난 뒤 다른 약점을 친다
**`만트라(R)`는 다음 기본 스킬 하나만 강화한다.** 강화 `Q`가 빠지면 광역 압박이, 강화 `W`가 빠지면 버티기가, 강화 `E`가 빠지면 팀 전체 보호가 약해진다. 사용한 강화 효과를 확인하고 남지 않은 기능을 기준으로 다음 교환을 연다.

## 고무의 보호막을 먼저 소모시킨다
**`고무(E)`는 보호막과 이동 속도를 함께 제공한다.** 보호막 위에 모든 피해를 한꺼번에 쓰지 말고 짧은 견제로 먼저 빼낸다. 이동 속도가 끝난 뒤 거리를 좁히며, 강화 `E`가 여러 명에게 퍼질 때는 한곳에 화력을 낭비하지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-karma' AND kind = 'matchup' AND champion_slug = 'karma'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-karma');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-matchup-karma-20260915', id, NULL, 0, general, '비원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-karma' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 만트라로 강화할 스킬을 확인한다 · 미니언과 거리를 둬 `Q` 폭발을 피한다 · `W` 연결을 끊는다

## 영혼의 불꽃이 터질 미니언에서 떨어진다
**`내면의 열정(Q)`은 처음 맞은 유닛에서 폭발하므로 미니언 뒤에 딱 붙으면 함께 피해를 받는다.**[* [카르마 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=26)] 막타를 칠 때 옆 간격을 두고, 만트라로 강화한 투사체가 만든 원형 지역에서는 두 번째 폭발 전에 빠져나온다.

## 굳은 결의의 끈을 거리로 끊는다
**`굳은 결의(W)`는 연결이 유지되면 속박하고 강화 상태에서는 카르마가 회복한다.** 카르마와 맞서며 끝까지 공격하기보다 즉시 연결 범위 밖으로 움직인다. 수풀로 들어가도 위치가 드러나므로 시야 숨기기보다 거리를 우선한다.

## 만트라 선택이 끝난 뒤 다른 약점을 친다
**`만트라(R)`는 다음 기본 스킬 하나만 강화한다.** 강화 `Q`가 빠지면 광역 압박이, 강화 `W`가 빠지면 버티기가, 강화 `E`가 빠지면 팀 전체 보호가 약해진다. 사용한 강화 효과를 확인하고 남지 않은 기능을 기준으로 다음 교환을 연다.

## 고무의 보호막을 먼저 소모시킨다
**`고무(E)`는 보호막과 이동 속도를 함께 제공한다.** 보호막 위에 모든 피해를 한꺼번에 쓰지 말고 짧은 견제로 먼저 빼낸다. 이동 속도가 끝난 뒤 거리를 좁히며, 강화 `E`가 여러 명에게 퍼질 때는 한곳에 화력을 낭비하지 않는다.'
AND updated_at = '2026-09-15T09:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-matchup-karma-20260915');

-- hwei 상대법 (860자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-hwei', 'matchup', NULL, NULL, 'published', 'hwei', '', 0, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 선택한 주문서 색으로 다음 기술을 읽는다 · 고립된 상태로 `QW`를 맞지 않는다 · `R`이 붙으면 아군과 떨어진다

## 한 주제의 기술이 빠지면 같은 주제를 잠시 잊는다
**흐웨이는 `Q` 참사, `W` 평온, `E` 고통에서 각각 하나의 기술을 고르며 같은 주제 기술은 재사용 대기시간을 공유한다.**[* [흐웨이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=166)] 붉은 공격 기술이 빠지면 추가 화력이, 보라색 제어 기술이 빠지면 진입 저지가 약해진다. 시전 색과 모양을 보고 짧은 공백에 압박한다.

## 고립된 자리와 긴 직선을 피한다
**멀리 떨어진 위치를 때리는 `절단의 번개(QW)`는 이동 불가 또는 고립된 대상에게 더 위협적이다.** 아군과 웨이브에서 홀로 떨어져 귀환하거나 막타를 치지 않는다. 직선으로 날아오는 불덩이와 바닥에 남는 용암은 미니언 옆 공간을 이용해 서로 다른 방향으로 피한다.

## 고통 주제가 보이면 진입을 늦춘다
**`E` 고통 기술들은 공포, 속박, 끌어당김으로 접근 경로를 막는다.** 흐웨이가 제어 기술을 고른 동안 정면 이동기를 먼저 쓰지 않는다. 기술이 빗나간 뒤에는 같은 주제의 다른 제어가 바로 나오지 않으므로 그때 거리를 좁힌다.

## 절망의 소용돌이를 아군에게 옮기지 않는다
**`절망의 소용돌이(R)`는 처음 맞은 챔피언을 중심으로 커지며 주변 적을 둔화시키고 끝에 폭발한다.** 적중했다면 아군 대열 밖으로 움직여 범위가 겹치지 않게 한다. 맞지 않은 아군은 표식이 붙은 사람과 반대쪽에서 흐웨이를 압박해 후속 기술을 자유롭게 쓰지 못하게 한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-hwei' AND kind = 'matchup' AND champion_slug = 'hwei'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-hwei');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-matchup-hwei-20260915', id, NULL, 0, general, '비원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-hwei' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 선택한 주문서 색으로 다음 기술을 읽는다 · 고립된 상태로 `QW`를 맞지 않는다 · `R`이 붙으면 아군과 떨어진다

## 한 주제의 기술이 빠지면 같은 주제를 잠시 잊는다
**흐웨이는 `Q` 참사, `W` 평온, `E` 고통에서 각각 하나의 기술을 고르며 같은 주제 기술은 재사용 대기시간을 공유한다.**[* [흐웨이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=166)] 붉은 공격 기술이 빠지면 추가 화력이, 보라색 제어 기술이 빠지면 진입 저지가 약해진다. 시전 색과 모양을 보고 짧은 공백에 압박한다.

## 고립된 자리와 긴 직선을 피한다
**멀리 떨어진 위치를 때리는 `절단의 번개(QW)`는 이동 불가 또는 고립된 대상에게 더 위협적이다.** 아군과 웨이브에서 홀로 떨어져 귀환하거나 막타를 치지 않는다. 직선으로 날아오는 불덩이와 바닥에 남는 용암은 미니언 옆 공간을 이용해 서로 다른 방향으로 피한다.

## 고통 주제가 보이면 진입을 늦춘다
**`E` 고통 기술들은 공포, 속박, 끌어당김으로 접근 경로를 막는다.** 흐웨이가 제어 기술을 고른 동안 정면 이동기를 먼저 쓰지 않는다. 기술이 빗나간 뒤에는 같은 주제의 다른 제어가 바로 나오지 않으므로 그때 거리를 좁힌다.

## 절망의 소용돌이를 아군에게 옮기지 않는다
**`절망의 소용돌이(R)`는 처음 맞은 챔피언을 중심으로 커지며 주변 적을 둔화시키고 끝에 폭발한다.** 적중했다면 아군 대열 밖으로 움직여 범위가 겹치지 않게 한다. 맞지 않은 아군은 표식이 붙은 사람과 반대쪽에서 흐웨이를 압박해 후속 기술을 자유롭게 쓰지 못하게 한다.'
AND updated_at = '2026-09-15T09:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-matchup-hwei-20260915');

-- pantheon 상대법 (787자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-pantheon', 'matchup', NULL, NULL, 'published', 'pantheon', '', 0, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 필멸자의 의지 중첩을 본다 · `W` 사거리 안에 혼자 서지 않는다 · `E` 정면에 화력을 쓰지 않는다

## 다섯 번째 행동 뒤의 강화 스킬을 기다린다
**판테온은 공격과 스킬을 다섯 번 사용하면 다음 기본 스킬을 강화한다.**[* [판테온 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=48)] 중첩이 찼을 때 막타를 욕심내면 강화 `방호의 도약(W)`으로 교전이 열린다. 강화 스킬이 미니언이나 다른 대상에 소모된 뒤 앞으로 나간다.

## 방호의 도약 사거리를 선으로 관리한다
**`방호의 도약(W)`은 대상을 지정해 돌진하고 기절시킨다.** 투사체처럼 피할 수 없으므로 사거리 밖을 유지하거나 아군이 즉시 반격할 위치에 선다. 판테온이 수풀로 들어가면 경계선이 보이지 않으므로 그쪽 막타를 잠시 양보한다.

## 혜성의 창을 피한 뒤에도 체력을 확인한다
**`혜성의 창(Q)`은 짧게 찌르거나 멀리 던질 수 있고 체력이 낮은 대상에게 위협적이다.** 긴 창은 앞의 유닛을 지난 뒤 위력이 줄어들 수 있으므로 미니언을 사이에 둔다. 체력이 낮다면 직선으로 귀환하지 말고 시야 밖에서 경로를 바꾼다.

## 방패 돌격의 옆이나 뒤로 이동한다
**`방패 돌격(E)`은 판테온이 바라보는 방향의 피해를 막는다.** 정면에서 주요 공격을 계속 쓰지 말고 지속시간을 기다리거나 측면으로 이동한다. `거대 유성(R)` 착지 표시가 보이면 판테온 쪽이 아니라 가장자리의 짧은 방향으로 빠진다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-pantheon' AND kind = 'matchup' AND champion_slug = 'pantheon'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-pantheon');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-matchup-pantheon-20260915', id, NULL, 0, general, '비원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-pantheon' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 필멸자의 의지 중첩을 본다 · `W` 사거리 안에 혼자 서지 않는다 · `E` 정면에 화력을 쓰지 않는다

## 다섯 번째 행동 뒤의 강화 스킬을 기다린다
**판테온은 공격과 스킬을 다섯 번 사용하면 다음 기본 스킬을 강화한다.**[* [판테온 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=48)] 중첩이 찼을 때 막타를 욕심내면 강화 `방호의 도약(W)`으로 교전이 열린다. 강화 스킬이 미니언이나 다른 대상에 소모된 뒤 앞으로 나간다.

## 방호의 도약 사거리를 선으로 관리한다
**`방호의 도약(W)`은 대상을 지정해 돌진하고 기절시킨다.** 투사체처럼 피할 수 없으므로 사거리 밖을 유지하거나 아군이 즉시 반격할 위치에 선다. 판테온이 수풀로 들어가면 경계선이 보이지 않으므로 그쪽 막타를 잠시 양보한다.

## 혜성의 창을 피한 뒤에도 체력을 확인한다
**`혜성의 창(Q)`은 짧게 찌르거나 멀리 던질 수 있고 체력이 낮은 대상에게 위협적이다.** 긴 창은 앞의 유닛을 지난 뒤 위력이 줄어들 수 있으므로 미니언을 사이에 둔다. 체력이 낮다면 직선으로 귀환하지 말고 시야 밖에서 경로를 바꾼다.

## 방패 돌격의 옆이나 뒤로 이동한다
**`방패 돌격(E)`은 판테온이 바라보는 방향의 피해를 막는다.** 정면에서 주요 공격을 계속 쓰지 말고 지속시간을 기다리거나 측면으로 이동한다. `거대 유성(R)` 착지 표시가 보이면 판테온 쪽이 아니라 가장자리의 짧은 방향으로 빠진다.'
AND updated_at = '2026-09-15T09:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-matchup-pantheon-20260915');

-- zyra 상대법 (786자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-zyra', 'matchup', NULL, NULL, 'published', 'zyra', '', 0, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 씨앗 옆에 오래 서지 않는다 · 관통하는 `E`는 옆으로 피한다 · `R`이 식물까지 강화한다

## 씨앗과 내 위치를 한 화면에서 본다
**자이라의 씨앗 근처에 `Q`나 `E`가 닿으면 공격하는 식물이 자란다.**[* [자이라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=101)] 씨앗 바로 옆에서 막타를 치면 기술과 식물 공격을 함께 받는다. 안전하게 밟아 없앨 수 있을 때만 접근하고, 자이라가 사거리에 있으면 씨앗 하나보다 체력을 지킨다.

## 휘감는 뿌리는 미니언을 방패로 삼지 않는다
**`휘감는 뿌리(E)`는 여러 유닛을 관통하며 맞은 대상을 속박한다.** 웨이브 뒤에 일직선으로 서지 말고 옆 공간을 확보한다. 자이라가 씨앗 두 개와 함께 전진하면 `E` 뒤 둔화 식물이 이어질 수 있으므로 먼저 거리를 벌린다.

## 식물의 표적을 끊고 본체를 압박한다
**자이라가 챔피언에게 기술이나 기본 공격을 맞히면 식물이 그 대상을 노리기 쉽다.** 표적이 됐다면 식물 사거리 밖으로 잠깐 빠져 공격을 끊는다. 식물을 모두 정리하느라 자이라의 다음 기술을 맞지 말고, 본체가 기술을 소모한 순간에만 되받아친다.

## 올가미 덩굴의 수축 전에 나온다
**`올가미 덩굴(R)`은 넓게 펼쳐진 뒤 수축하며 적을 띄우고 범위 안 식물을 강화한다.** 첫 피해 뒤 그대로 싸우지 말고 가장자리로 이동한다. 이미 `E`에 묶였다면 추가 이동기를 아껴 공중에 뜨기 전 범위를 벗어난다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-zyra' AND kind = 'matchup' AND champion_slug = 'zyra'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-zyra');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-matchup-zyra-20260915', id, NULL, 0, general, '비원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-zyra' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 씨앗 옆에 오래 서지 않는다 · 관통하는 `E`는 옆으로 피한다 · `R`이 식물까지 강화한다

## 씨앗과 내 위치를 한 화면에서 본다
**자이라의 씨앗 근처에 `Q`나 `E`가 닿으면 공격하는 식물이 자란다.**[* [자이라 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=101)] 씨앗 바로 옆에서 막타를 치면 기술과 식물 공격을 함께 받는다. 안전하게 밟아 없앨 수 있을 때만 접근하고, 자이라가 사거리에 있으면 씨앗 하나보다 체력을 지킨다.

## 휘감는 뿌리는 미니언을 방패로 삼지 않는다
**`휘감는 뿌리(E)`는 여러 유닛을 관통하며 맞은 대상을 속박한다.** 웨이브 뒤에 일직선으로 서지 말고 옆 공간을 확보한다. 자이라가 씨앗 두 개와 함께 전진하면 `E` 뒤 둔화 식물이 이어질 수 있으므로 먼저 거리를 벌린다.

## 식물의 표적을 끊고 본체를 압박한다
**자이라가 챔피언에게 기술이나 기본 공격을 맞히면 식물이 그 대상을 노리기 쉽다.** 표적이 됐다면 식물 사거리 밖으로 잠깐 빠져 공격을 끊는다. 식물을 모두 정리하느라 자이라의 다음 기술을 맞지 말고, 본체가 기술을 소모한 순간에만 되받아친다.

## 올가미 덩굴의 수축 전에 나온다
**`올가미 덩굴(R)`은 넓게 펼쳐진 뒤 수축하며 적을 띄우고 범위 안 식물을 강화한다.** 첫 피해 뒤 그대로 싸우지 말고 가장자리로 이동한다. 이미 `E`에 묶였다면 추가 이동기를 아껴 공중에 뜨기 전 범위를 벗어난다.'
AND updated_at = '2026-09-15T09:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-matchup-zyra-20260915');

-- brand 상대법 (795자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-brand', 'matchup', NULL, NULL, 'published', 'brand', '', 0, '16.17.1', 'guarded', '2026-09-15T09:50:00.000Z', '2026-09-15T09:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 원딜 상대법

> **한눈에 보기** — 불길이 묻으면 `Q` 기절을 먼저 피한다 · 미니언과 거리를 둬 `E` 전파를 막는다 · `R`이 튈 대상을 줄인다

## 불타는 상태에서는 불태우기를 최우선으로 피한다
**`불태우기(Q)`는 이미 불타는 대상을 기절시킨다.**[* [브랜드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=8)] `E`나 `W`를 맞은 뒤 반격하려고 멈추지 말고 미니언 뒤나 투사체 옆으로 이동한다. 기절 조건이 끝난 뒤에야 짧게 피해를 돌려준다.

## 화염 기둥의 중심보다 가장자리에서 나온다
**`화염 기둥(W)`은 표시 후 폭발하고 불타는 대상에게 더 큰 피해를 준다.** 막타 동작 중 발밑에 표시가 생길 수 있으므로 이동 명령을 먼저 내린다. 이미 불길 중첩이 있다면 미니언 하나보다 체력을 우선해 범위를 완전히 벗어난다.

## 발화가 번질 미니언에서 떨어진다
**`발화(E)`는 주변 적에게 퍼지고, 불타는 대상에서 시작하면 전파 범위가 더 넓어진다.** 체력이 낮은 미니언 무리와 붙어 있으면 대상 지정 기술을 직접 맞지 않아도 불길이 닿는다. 웨이브 옆으로 서서 브랜드가 정리와 견제를 동시에 하지 못하게 한다.

## 파멸의 불덩이 반사 대상을 없앤다
**`파멸의 불덩이(R)`는 브랜드와 주변 적 사이를 여러 번 튕긴다.** 아군과 포개지지 말고 미니언 무리에서도 벗어나 반사 횟수를 줄인다. 브랜드에게 다시 튈 거리에서 근접전을 이어가지 않으며, 불길 중첩이 쌓였다면 폭발하기 전에 간격을 벌린다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T09:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-brand' AND kind = 'matchup' AND champion_slug = 'brand'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-brand');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-non-adc-matchup-brand-20260915', id, NULL, 0, general, '비원딜 상대법 작성', 'accepted', 'user-system', '2026-09-15T09:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-brand' AND revision = 1 AND general = '# 원딜 상대법

> **한눈에 보기** — 불길이 묻으면 `Q` 기절을 먼저 피한다 · 미니언과 거리를 둬 `E` 전파를 막는다 · `R`이 튈 대상을 줄인다

## 불타는 상태에서는 불태우기를 최우선으로 피한다
**`불태우기(Q)`는 이미 불타는 대상을 기절시킨다.**[* [브랜드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=8)] `E`나 `W`를 맞은 뒤 반격하려고 멈추지 말고 미니언 뒤나 투사체 옆으로 이동한다. 기절 조건이 끝난 뒤에야 짧게 피해를 돌려준다.

## 화염 기둥의 중심보다 가장자리에서 나온다
**`화염 기둥(W)`은 표시 후 폭발하고 불타는 대상에게 더 큰 피해를 준다.** 막타 동작 중 발밑에 표시가 생길 수 있으므로 이동 명령을 먼저 내린다. 이미 불길 중첩이 있다면 미니언 하나보다 체력을 우선해 범위를 완전히 벗어난다.

## 발화가 번질 미니언에서 떨어진다
**`발화(E)`는 주변 적에게 퍼지고, 불타는 대상에서 시작하면 전파 범위가 더 넓어진다.** 체력이 낮은 미니언 무리와 붙어 있으면 대상 지정 기술을 직접 맞지 않아도 불길이 닿는다. 웨이브 옆으로 서서 브랜드가 정리와 견제를 동시에 하지 못하게 한다.

## 파멸의 불덩이 반사 대상을 없앤다
**`파멸의 불덩이(R)`는 브랜드와 주변 적 사이를 여러 번 튕긴다.** 아군과 포개지지 말고 미니언 무리에서도 벗어나 반사 횟수를 줄인다. 브랜드에게 다시 튈 거리에서 근접전을 이어가지 않으며, 불길 중첩이 쌓였다면 폭발하기 전에 간격을 벌린다.'
AND updated_at = '2026-09-15T09:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-non-adc-matchup-brand-20260915');
