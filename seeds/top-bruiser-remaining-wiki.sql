-- scripts/seed-top-bruiser-remaining-wiki.ts가 생성. 탑 딜탱 나머지 12명의 위키·상대법.
-- 기존 문서와 사용자 편집은 덮어쓰지 않으며 같은 SQL을 다시 실행해도 이력이 늘지 않는다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)
VALUES ('user-system', 'system', 'seed', '깨남.COM', NULL, 'admin', '2026-09-14T14:30:00.000Z');

-- 갱플랭크 챔피언 위키 (932자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-gangplank-20260914', 'article', '갱플랭크', '갱플랭크', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 통의 마지막 체력을 먼저 친다 · `W`는 핵심 제어에 남긴다 · `R`은 합류보다 퇴로를 자른다

[[분류:탑]] [[분류:딜탱]]

## 화약통은 폭발보다 선점이 먼저다

**`화약통(E)`은 갱플랭크와 적 모두 공격할 수 있으므로 마지막 체력을 누가 먼저 치는지가 교환의 시작이다.**[* [갱플랭크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=18)] 첫 통을 수풀이나 내 이동 경로 가까이에 두고, 상대가 막타를 노리러 들어올 때 기본 공격이나 `혀어어어업상(Q)`으로 터뜨린다. 연쇄 통은 상대 뒤가 아니라 첫 통이 안전하게 연결되는 범위부터 잡는다.

## `Q` 막타와 견제의 목적을 나눈다

**`Q`를 매번 챔피언에게 쓰면 안전한 막타와 통 제어에 쓸 기회를 함께 잃는다.** 상대가 통을 건드릴 수 없는 위치라면 미니언 막타로 성장하고, 상대가 통 사거리 안에 들어왔을 때만 `Q`를 교환에 묶는다. 웨이브가 밀리는 동안에는 통 하나를 퇴로에 남겨 추격을 끊는다.

## 귤은 첫 제어가 아니라 결정적인 제어에 쓴다

**`괴혈병 치료(W)`는 군중 제어를 제거하므로 짧은 둔화보다 후속 속박이나 제압 직전까지 아낄 가치가 크다.** 체력이 조금 빠졌다는 이유로 먼저 사용하면 다음 진입을 끊을 수 없다. 상대의 핵심 제어가 빠진 뒤에는 회복용으로 전환해 라인에 더 오래 남는다.

## 포탄은 싸움 한가운데보다 출구에 깐다

**`포탄 세례(R)`는 전장을 가로질러 쓸 수 있지만 이미 맞붙은 중앙보다 적이 빠질 통로를 덮을 때 오래 맞힌다.** 아군 제어가 시작되는 순간 뒤쪽에 깔아 퇴로를 좁히고, 내 라인에서 통 압박을 이어 갈 수 있는지도 함께 본다. 단순 지원 피해보다 적의 이동 선택을 줄이는 것이 먼저다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-gangplank-20260914' OR (kind = 'article' AND title_key = '갱플랭크'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-gangplank-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-gangplank-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 통의 마지막 체력을 먼저 친다 · `W`는 핵심 제어에 남긴다 · `R`은 합류보다 퇴로를 자른다

[[분류:탑]] [[분류:딜탱]]

## 화약통은 폭발보다 선점이 먼저다

**`화약통(E)`은 갱플랭크와 적 모두 공격할 수 있으므로 마지막 체력을 누가 먼저 치는지가 교환의 시작이다.**[* [갱플랭크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=18)] 첫 통을 수풀이나 내 이동 경로 가까이에 두고, 상대가 막타를 노리러 들어올 때 기본 공격이나 `혀어어어업상(Q)`으로 터뜨린다. 연쇄 통은 상대 뒤가 아니라 첫 통이 안전하게 연결되는 범위부터 잡는다.

## `Q` 막타와 견제의 목적을 나눈다

**`Q`를 매번 챔피언에게 쓰면 안전한 막타와 통 제어에 쓸 기회를 함께 잃는다.** 상대가 통을 건드릴 수 없는 위치라면 미니언 막타로 성장하고, 상대가 통 사거리 안에 들어왔을 때만 `Q`를 교환에 묶는다. 웨이브가 밀리는 동안에는 통 하나를 퇴로에 남겨 추격을 끊는다.

## 귤은 첫 제어가 아니라 결정적인 제어에 쓴다

**`괴혈병 치료(W)`는 군중 제어를 제거하므로 짧은 둔화보다 후속 속박이나 제압 직전까지 아낄 가치가 크다.** 체력이 조금 빠졌다는 이유로 먼저 사용하면 다음 진입을 끊을 수 없다. 상대의 핵심 제어가 빠진 뒤에는 회복용으로 전환해 라인에 더 오래 남는다.

## 포탄은 싸움 한가운데보다 출구에 깐다

**`포탄 세례(R)`는 전장을 가로질러 쓸 수 있지만 이미 맞붙은 중앙보다 적이 빠질 통로를 덮을 때 오래 맞힌다.** 아군 제어가 시작되는 순간 뒤쪽에 깔아 퇴로를 좁히고, 내 라인에서 통 압박을 이어 갈 수 있는지도 함께 본다. 단순 지원 피해보다 적의 이동 선택을 줄이는 것이 먼저다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-gangplank-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-gangplank-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-gangplank-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-gangplank-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-gangplank-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-gangplank-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-gangplank-20260914' AND target_key = '분류:딜탱');

-- gangplank 상대법 (869자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-gangplank', 'matchup', NULL, NULL, 'published', 'gangplank', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 통의 체력을 직접 친다 · 통 연쇄선 옆으로 선다 · `W`가 빠진 뒤 제어를 건다

## 통 막타 싸움을 피하지 않는다

**갱플랭크의 `화약통(E)`은 적도 공격해 파괴할 수 있으므로 마지막 체력이 되는 순간을 먼저 준비한다.**[* [갱플랭크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=18)] 통만 보며 급히 들어가면 `Q` 견제를 함께 맞으니 내 공격 속도와 투사체 시간을 계산해 한 번만 친다. 실패했다면 폭발 범위 밖으로 빠지고 다음 통에 다시 접근한다.

## 첫 통과 다음 통 사이의 옆 공간을 쓴다

**연쇄 폭발은 겹친 통을 따라 이어지므로 일직선 뒤로만 물러나면 새 통의 범위에 계속 남는다.** 첫 통 바깥쪽 옆으로 움직여 연결 각도를 크게 만들고, 갱플랭크가 새 통을 놓으러 앞으로 오면 그 순간 짧게 공격한다. 수풀 안 통이 보이지 않을 때는 미니언과 같은 선에 오래 서지 않는다.

## 귤을 뺀 다음 교환을 길게 만든다

**`괴혈병 치료(W)`가 남아 있으면 첫 군중 제어와 손실 체력을 함께 복구할 수 있다.** 약한 둔화나 짧은 견제로 먼저 사용하게 만든 뒤 핵심 제어를 건다. 반대로 귤이 있는 상태에서 모든 기술을 한 번에 쓰면 통 둔화를 맞고 역으로 빠질 길이 막힌다.

## 전역 포격이 깔리면 중앙을 가로지르지 않는다

**`포탄 세례(R)`는 넓은 지역을 오래 막으므로 가장 가까운 가장자리로 즉시 빠지는 편이 낫다.** 아군에게 붙으려고 포격 중앙을 통과하지 말고 서로 다른 출구로 흩어진다. 갱플랭크가 다른 전투에 궁극기를 쓴 직후가 탑에서 압박을 되돌릴 가장 분명한 시간이다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-gangplank' AND kind = 'matchup' AND champion_slug = 'gangplank'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-gangplank');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-gangplank-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-gangplank' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 통의 체력을 직접 친다 · 통 연쇄선 옆으로 선다 · `W`가 빠진 뒤 제어를 건다

## 통 막타 싸움을 피하지 않는다

**갱플랭크의 `화약통(E)`은 적도 공격해 파괴할 수 있으므로 마지막 체력이 되는 순간을 먼저 준비한다.**[* [갱플랭크 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=18)] 통만 보며 급히 들어가면 `Q` 견제를 함께 맞으니 내 공격 속도와 투사체 시간을 계산해 한 번만 친다. 실패했다면 폭발 범위 밖으로 빠지고 다음 통에 다시 접근한다.

## 첫 통과 다음 통 사이의 옆 공간을 쓴다

**연쇄 폭발은 겹친 통을 따라 이어지므로 일직선 뒤로만 물러나면 새 통의 범위에 계속 남는다.** 첫 통 바깥쪽 옆으로 움직여 연결 각도를 크게 만들고, 갱플랭크가 새 통을 놓으러 앞으로 오면 그 순간 짧게 공격한다. 수풀 안 통이 보이지 않을 때는 미니언과 같은 선에 오래 서지 않는다.

## 귤을 뺀 다음 교환을 길게 만든다

**`괴혈병 치료(W)`가 남아 있으면 첫 군중 제어와 손실 체력을 함께 복구할 수 있다.** 약한 둔화나 짧은 견제로 먼저 사용하게 만든 뒤 핵심 제어를 건다. 반대로 귤이 있는 상태에서 모든 기술을 한 번에 쓰면 통 둔화를 맞고 역으로 빠질 길이 막힌다.

## 전역 포격이 깔리면 중앙을 가로지르지 않는다

**`포탄 세례(R)`는 넓은 지역을 오래 막으므로 가장 가까운 가장자리로 즉시 빠지는 편이 낫다.** 아군에게 붙으려고 포격 중앙을 통과하지 말고 서로 다른 출구로 흩어진다. 갱플랭크가 다른 전투에 궁극기를 쓴 직후가 탑에서 압박을 되돌릴 가장 분명한 시간이다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-gangplank-20260914');

-- 우르곳 챔피언 위키 (906자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-urgot-20260914', 'article', '우르곳', '우르곳', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 다리 방향을 바꿔 산탄을 터뜨린다 · 표식을 묻힌 뒤 `W`를 켠다 · `E`는 도주 경로를 넘겨짚는다

[[분류:탑]] [[분류:딜탱]]

## 한쪽에 서서 같은 다리만 쓰지 않는다

**우르곳의 기본 지속 효과는 적을 향한 다리마다 따로 산탄을 발사하므로 대상 주위를 돌아야 화력이 이어진다.**[* [우르곳 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=70)] 첫 산탄 뒤 곧장 반대편으로 가려 하지 말고, `부식성 폭약(Q)` 둔화나 `경멸(E)`로 위치를 바꿀 시간을 만든다. 준비되지 않은 다리 쪽으로 몸을 돌리면 짧은 교환에서도 확실한 피해를 남긴다.

## 표식이 생긴 뒤 심판의 원을 연다

**`심판의 원(W)`은 최근 다른 기술을 맞힌 챔피언을 우선하므로 먼저 `Q`나 `E`를 적중시켜야 한다.** 표식 없이 미니언 사이에서 켜면 원하는 대상을 때리지 못하고 이동 속도만 잃는다. 상대가 웨이브에서 떨어지는 순간 표식을 묻혀 산탄과 연속 사격을 한 대상에 모은다.

## `E`는 현재 위치보다 한 걸음 뒤를 노린다

**`경멸(E)`은 준비 동작 뒤 돌진해 충돌한 챔피언을 뒤로 넘긴다.** 상대의 현재 발밑보다 퇴로 쪽으로 몸을 맞추고, 보호막으로 첫 반격을 받아낸다. 빗나가면 탈출 수단도 함께 사라지므로 시야가 없거나 여러 명이 기다릴 수 있는 방향으로는 먼저 쓰지 않는다.

## 처형 표식 뒤에는 당기는 공간을 확보한다

**`불사의 공포(R)`는 맞힌 대상을 체력 기준 아래에서 끌어와 처형한다.** 섬광탄만 맞히고 벽이나 적진 깊숙이 들어가면 재사용할 자리가 없다. 표식이 박힌 뒤에는 산탄을 더 터뜨리되, 처형이 열리는 순간 방해받지 않을 거리를 남긴다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-urgot-20260914' OR (kind = 'article' AND title_key = '우르곳'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-urgot-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-urgot-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 다리 방향을 바꿔 산탄을 터뜨린다 · 표식을 묻힌 뒤 `W`를 켠다 · `E`는 도주 경로를 넘겨짚는다

[[분류:탑]] [[분류:딜탱]]

## 한쪽에 서서 같은 다리만 쓰지 않는다

**우르곳의 기본 지속 효과는 적을 향한 다리마다 따로 산탄을 발사하므로 대상 주위를 돌아야 화력이 이어진다.**[* [우르곳 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=70)] 첫 산탄 뒤 곧장 반대편으로 가려 하지 말고, `부식성 폭약(Q)` 둔화나 `경멸(E)`로 위치를 바꿀 시간을 만든다. 준비되지 않은 다리 쪽으로 몸을 돌리면 짧은 교환에서도 확실한 피해를 남긴다.

## 표식이 생긴 뒤 심판의 원을 연다

**`심판의 원(W)`은 최근 다른 기술을 맞힌 챔피언을 우선하므로 먼저 `Q`나 `E`를 적중시켜야 한다.** 표식 없이 미니언 사이에서 켜면 원하는 대상을 때리지 못하고 이동 속도만 잃는다. 상대가 웨이브에서 떨어지는 순간 표식을 묻혀 산탄과 연속 사격을 한 대상에 모은다.

## `E`는 현재 위치보다 한 걸음 뒤를 노린다

**`경멸(E)`은 준비 동작 뒤 돌진해 충돌한 챔피언을 뒤로 넘긴다.** 상대의 현재 발밑보다 퇴로 쪽으로 몸을 맞추고, 보호막으로 첫 반격을 받아낸다. 빗나가면 탈출 수단도 함께 사라지므로 시야가 없거나 여러 명이 기다릴 수 있는 방향으로는 먼저 쓰지 않는다.

## 처형 표식 뒤에는 당기는 공간을 확보한다

**`불사의 공포(R)`는 맞힌 대상을 체력 기준 아래에서 끌어와 처형한다.** 섬광탄만 맞히고 벽이나 적진 깊숙이 들어가면 재사용할 자리가 없다. 표식이 박힌 뒤에는 산탄을 더 터뜨리되, 처형이 열리는 순간 방해받지 않을 거리를 남긴다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-urgot-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-urgot-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-urgot-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-urgot-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-urgot-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-urgot-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-urgot-20260914' AND target_key = '분류:딜탱');

-- urgot 상대법 (842자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-urgot', 'matchup', NULL, NULL, 'published', 'urgot', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 우르곳 주위를 한 바퀴 돌지 않는다 · `E` 준비 동작을 옆으로 피한다 · 처형 표식이 박히면 시야를 끊는다

## 준비된 다리 앞에서만 싸우지 않는다

**우르곳은 몸 둘레의 다리마다 산탄을 따로 발사하므로 주위를 크게 돌수록 여러 방향의 피해를 연달아 맞는다.**[* [우르곳 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=70)] 이미 터진 다리 쪽에 머물다가 짧게 빠지고, 새 다리 방향으로 억지로 통과하지 않는다. 산탄이 준비된 쪽은 다리의 밝은 표시로 먼저 확인한다.

## `E`의 짧은 준비 동작에 옆으로 움직인다

**`경멸(E)`에 정면으로 잡히면 우르곳 뒤로 넘어가며 보호막과 `W` 추격을 함께 허용한다.** 뒤로만 달리기보다 돌진 축의 옆으로 한 걸음 비켜서고, 빗나간 뒤에만 긴 교환을 연다. 이동기를 먼저 쓰면 우르곳이 도착 지점을 향해 몸을 맞추기 쉽다.

## 표식이 사라질 때까지 미니언 뒤로 빠진다

**`Q`나 `E`를 맞은 뒤에는 `심판의 원(W)`이 챔피언을 우선 공격한다.** 표식이 묻은 채로 웨이브 안에 버티지 말고 사거리 밖으로 끊었다가 돌아온다. 표식이 없을 때는 미니언이 사격을 나누므로 우르곳이 함부로 `W`를 오래 켜기 어렵다.

## 궁극기 투사체와 재사용을 따로 막는다

**`불사의 공포(R)`가 적중해도 즉시 처형되는 것은 아니지만 체력이 낮아지면 끌려간다.** 섬광탄은 옆으로 피하고, 맞았다면 우르곳과 거리를 벌리거나 지형 뒤로 들어가 후속 피해를 줄인다. 처형 기준 근처에서 한 대 더 욕심내는 것이 가장 위험하다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-urgot' AND kind = 'matchup' AND champion_slug = 'urgot'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-urgot');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-urgot-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-urgot' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 우르곳 주위를 한 바퀴 돌지 않는다 · `E` 준비 동작을 옆으로 피한다 · 처형 표식이 박히면 시야를 끊는다

## 준비된 다리 앞에서만 싸우지 않는다

**우르곳은 몸 둘레의 다리마다 산탄을 따로 발사하므로 주위를 크게 돌수록 여러 방향의 피해를 연달아 맞는다.**[* [우르곳 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=70)] 이미 터진 다리 쪽에 머물다가 짧게 빠지고, 새 다리 방향으로 억지로 통과하지 않는다. 산탄이 준비된 쪽은 다리의 밝은 표시로 먼저 확인한다.

## `E`의 짧은 준비 동작에 옆으로 움직인다

**`경멸(E)`에 정면으로 잡히면 우르곳 뒤로 넘어가며 보호막과 `W` 추격을 함께 허용한다.** 뒤로만 달리기보다 돌진 축의 옆으로 한 걸음 비켜서고, 빗나간 뒤에만 긴 교환을 연다. 이동기를 먼저 쓰면 우르곳이 도착 지점을 향해 몸을 맞추기 쉽다.

## 표식이 사라질 때까지 미니언 뒤로 빠진다

**`Q`나 `E`를 맞은 뒤에는 `심판의 원(W)`이 챔피언을 우선 공격한다.** 표식이 묻은 채로 웨이브 안에 버티지 말고 사거리 밖으로 끊었다가 돌아온다. 표식이 없을 때는 미니언이 사격을 나누므로 우르곳이 함부로 `W`를 오래 켜기 어렵다.

## 궁극기 투사체와 재사용을 따로 막는다

**`불사의 공포(R)`가 적중해도 즉시 처형되는 것은 아니지만 체력이 낮아지면 끌려간다.** 섬광탄은 옆으로 피하고, 맞았다면 우르곳과 거리를 벌리거나 지형 뒤로 들어가 후속 피해를 줄인다. 처형 기준 근처에서 한 대 더 욕심내는 것이 가장 위험하다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-urgot-20260914');

-- 요릭 챔피언 위키 (888자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-yorick-20260914', 'article', '요릭', '요릭', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 막타로 무덤을 준비한다 · `E`를 맞힌 뒤 망령을 보낸다 · 마녀와 다른 길을 고집하지 않는다

[[분류:탑]] [[분류:딜탱]]

## 교환 전에 무덤 수부터 만든다

**`최후의 의식(Q)`으로 대상을 처치하면 무덤이 생기고, 무덤이 있어야 안개 망령을 한꺼번에 깨울 수 있다.**[* [요릭 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=81)] 아무 준비 없이 `애도의 안개(E)`만 맞혀도 압박이 짧다. 웨이브 막타로 무덤을 모으고 상대가 앞으로 나오는 순간 망령을 일으켜 `E` 표식과 함께 보낸다.

## 벽은 가두기보다 이동기를 확인하는 데 쓴다

**`망자의 진(W)`은 공격해 부술 수 있는 벽이라 상대의 이동기가 남아 있으면 즉시 빠져나간다.** 먼저 `E` 둔화와 망령으로 걸음을 재촉하게 하고, 이동기가 빠진 뒤 퇴로에 벽을 세운다. 벽 안에서 공격만 하기보다 상대가 어느 칸을 먼저 치는지 보고 몸으로 출구를 막는다.

## 망령과 직접 공격의 시간을 겹친다

**표식이 있는 대상으로 소환물이 빠르게 접근하므로 요릭도 같은 순간에 들어가야 피해가 분산되지 않는다.** 너무 먼저 걸으면 상대가 요릭만 때리고, 너무 늦으면 망령이 정리된다. 망령이 첫 공격을 시작할 때 `Q` 강화 공격을 맞히고 짧게 물러난다.

## 안개 마녀가 만든 웨이브를 기준으로 움직인다

**`군도의 장송곡(R)`의 안개 마녀는 쓰러진 적을 망령으로 일으켜 지속 압박을 만든다.** 마녀와 반대쪽으로 무리하게 이동하기보다 밀리는 라인을 먼저 깊게 보내고 시야를 확보한다. 마녀가 집중 공격을 받으면 챔피언을 쫓기보다 살려서 다음 웨이브까지 연결한다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-yorick-20260914' OR (kind = 'article' AND title_key = '요릭'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-yorick-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-yorick-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 막타로 무덤을 준비한다 · `E`를 맞힌 뒤 망령을 보낸다 · 마녀와 다른 길을 고집하지 않는다

[[분류:탑]] [[분류:딜탱]]

## 교환 전에 무덤 수부터 만든다

**`최후의 의식(Q)`으로 대상을 처치하면 무덤이 생기고, 무덤이 있어야 안개 망령을 한꺼번에 깨울 수 있다.**[* [요릭 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=81)] 아무 준비 없이 `애도의 안개(E)`만 맞혀도 압박이 짧다. 웨이브 막타로 무덤을 모으고 상대가 앞으로 나오는 순간 망령을 일으켜 `E` 표식과 함께 보낸다.

## 벽은 가두기보다 이동기를 확인하는 데 쓴다

**`망자의 진(W)`은 공격해 부술 수 있는 벽이라 상대의 이동기가 남아 있으면 즉시 빠져나간다.** 먼저 `E` 둔화와 망령으로 걸음을 재촉하게 하고, 이동기가 빠진 뒤 퇴로에 벽을 세운다. 벽 안에서 공격만 하기보다 상대가 어느 칸을 먼저 치는지 보고 몸으로 출구를 막는다.

## 망령과 직접 공격의 시간을 겹친다

**표식이 있는 대상으로 소환물이 빠르게 접근하므로 요릭도 같은 순간에 들어가야 피해가 분산되지 않는다.** 너무 먼저 걸으면 상대가 요릭만 때리고, 너무 늦으면 망령이 정리된다. 망령이 첫 공격을 시작할 때 `Q` 강화 공격을 맞히고 짧게 물러난다.

## 안개 마녀가 만든 웨이브를 기준으로 움직인다

**`군도의 장송곡(R)`의 안개 마녀는 쓰러진 적을 망령으로 일으켜 지속 압박을 만든다.** 마녀와 반대쪽으로 무리하게 이동하기보다 밀리는 라인을 먼저 깊게 보내고 시야를 확보한다. 마녀가 집중 공격을 받으면 챔피언을 쫓기보다 살려서 다음 웨이브까지 연결한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-yorick-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-yorick-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-yorick-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-yorick-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-yorick-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-yorick-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-yorick-20260914' AND target_key = '분류:딜탱');

-- yorick 상대법 (827자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-yorick', 'matchup', NULL, NULL, 'published', 'yorick', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 무덤이 적을 때 싸운다 · `E`를 옆으로 피한다 · 벽의 한 칸을 함께 친다

## 무덤 없는 웨이브에서 먼저 압박한다

**요릭은 `최후의 의식(Q)` 막타로 무덤을 만들고 그 무덤에서 안개 망령을 일으킨다.**[* [요릭 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=81)] 무덤이 세 개 이상 쌓인 뒤에 교환을 열지 말고, 새 웨이브가 도착해 준비가 적을 때 앞으로 선다. 무덤이 많다면 요릭보다 망령을 먼저 정리해 후속 표식의 가치를 낮춘다.

## `E`는 뒤보다 옆으로 피한다

**`애도의 안개(E)`를 맞으면 둔화와 표식 때문에 망령이 빠르게 달라붙는다.** 뒤로만 빠지면 투사체와 같은 선에서 맞기 쉬우므로 시전 방향의 옆으로 움직인다. 빗나간 직후에는 요릭이 망령의 목표를 강제로 바꾸기 어려워 짧은 교환을 되돌릴 수 있다.

## 벽에 갇히면 출구 하나를 정해 친다

**`망자의 진(W)`은 공격으로 파괴할 수 있으므로 벽 전체를 돌며 시간을 쓰지 않는다.** 요릭과 반대쪽 한 칸을 아군과 함께 공격하고, 이동기가 있다면 벽이 생긴 뒤 사용한다. 벽 안에서 요릭을 때리려다 망령과 강화 공격을 모두 맞는 선택을 피한다.

## 안개 마녀를 공짜로 두지 않는다

**안개 마녀가 살아 있으면 웨이브마다 망령이 생겨 요릭의 압박이 계속된다.** 요릭을 바로 잡기 어려운 거리라면 마녀의 체력을 먼저 줄이고, 포탑 아래까지 따라가 무리하지 않는다. 마녀가 없는 동안에는 요릭의 지속 압박이 크게 줄어 다른 전투에 합류할 여유가 생긴다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-yorick' AND kind = 'matchup' AND champion_slug = 'yorick'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-yorick');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-yorick-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-yorick' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 무덤이 적을 때 싸운다 · `E`를 옆으로 피한다 · 벽의 한 칸을 함께 친다

## 무덤 없는 웨이브에서 먼저 압박한다

**요릭은 `최후의 의식(Q)` 막타로 무덤을 만들고 그 무덤에서 안개 망령을 일으킨다.**[* [요릭 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=81)] 무덤이 세 개 이상 쌓인 뒤에 교환을 열지 말고, 새 웨이브가 도착해 준비가 적을 때 앞으로 선다. 무덤이 많다면 요릭보다 망령을 먼저 정리해 후속 표식의 가치를 낮춘다.

## `E`는 뒤보다 옆으로 피한다

**`애도의 안개(E)`를 맞으면 둔화와 표식 때문에 망령이 빠르게 달라붙는다.** 뒤로만 빠지면 투사체와 같은 선에서 맞기 쉬우므로 시전 방향의 옆으로 움직인다. 빗나간 직후에는 요릭이 망령의 목표를 강제로 바꾸기 어려워 짧은 교환을 되돌릴 수 있다.

## 벽에 갇히면 출구 하나를 정해 친다

**`망자의 진(W)`은 공격으로 파괴할 수 있으므로 벽 전체를 돌며 시간을 쓰지 않는다.** 요릭과 반대쪽 한 칸을 아군과 함께 공격하고, 이동기가 있다면 벽이 생긴 뒤 사용한다. 벽 안에서 요릭을 때리려다 망령과 강화 공격을 모두 맞는 선택을 피한다.

## 안개 마녀를 공짜로 두지 않는다

**안개 마녀가 살아 있으면 웨이브마다 망령이 생겨 요릭의 압박이 계속된다.** 요릭을 바로 잡기 어려운 거리라면 마녀의 체력을 먼저 줄이고, 포탑 아래까지 따라가 무리하지 않는다. 마녀가 없는 동안에는 요릭의 지속 압박이 크게 줄어 다른 전투에 합류할 여유가 생긴다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-yorick-20260914');

-- 모데카이저 챔피언 위키 (895자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-mordekaiser-20260914', 'article', '모데카이저', '모데카이저', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`를 한 대상에게 맞힌다 · 보호막은 큰 피해 뒤에 쓴다 · `R`로 전투의 핵심 한 명을 분리한다

[[분류:탑]] [[분류:딜탱]]

## 말살은 미니언 밖에서 맞힌다

**`말살(Q)`은 한 대상만 맞힐 때 피해가 커지므로 상대와 미니언을 한 범위에 넣지 않는 각도가 중요하다.**[* [모데카이저 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=41)] `죽음의 손아귀(E)`로 상대를 웨이브 옆으로 끌어낸 뒤 철퇴 중심을 맞힌다. 막타와 견제를 동시에 노리다가 여러 대상을 치면 가장 강한 단일 타격을 잃는다.

## 지속 효과 세 번째 적중을 계획한다

**기본 공격과 기본 기술을 세 번 맞혀야 주변 피해와 이동 속도가 켜진다.** 첫 두 번을 쓰고 상대가 빠질 수 있다면 무리하게 쫓지 말고, `E`가 적중할 때 세 번째 타격이 이어지도록 순서를 바꾼다. 지속 효과가 켜진 뒤에는 상대 옆을 따라 걸으며 기본 공격 간격을 유지한다.

## 보호막 충전량을 보고 두 번째 사용을 고른다

**`불멸(W)`은 주고받은 피해로 충전한 값을 보호막으로 바꾸고 다시 사용하면 회복한다.** 교환 시작과 동시에 누르면 작은 보호막만 생긴다. 큰 피해를 받은 직후 보호막으로 다음 타격을 막고, 전투가 끝났을 때 남은 값을 회복으로 바꾼다.

## 죽음의 세계에서 얻을 승리를 먼저 계산한다

**`죽음의 세계(R)`는 대상 하나를 분리하고 능력치 일부를 훔치지만, 들어간 뒤에는 외부 도움을 기대할 수 없다.** 이동기가 빠진 핵심 적이나 아군을 방해하는 앞선 적을 고른다. 단순히 체력이 낮은 대상보다 제한된 공간에서 `Q`와 `E`를 맞힐 수 있는 대상을 데려간다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-mordekaiser-20260914' OR (kind = 'article' AND title_key = '모데카이저'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-mordekaiser-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-mordekaiser-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q`를 한 대상에게 맞힌다 · 보호막은 큰 피해 뒤에 쓴다 · `R`로 전투의 핵심 한 명을 분리한다

[[분류:탑]] [[분류:딜탱]]

## 말살은 미니언 밖에서 맞힌다

**`말살(Q)`은 한 대상만 맞힐 때 피해가 커지므로 상대와 미니언을 한 범위에 넣지 않는 각도가 중요하다.**[* [모데카이저 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=41)] `죽음의 손아귀(E)`로 상대를 웨이브 옆으로 끌어낸 뒤 철퇴 중심을 맞힌다. 막타와 견제를 동시에 노리다가 여러 대상을 치면 가장 강한 단일 타격을 잃는다.

## 지속 효과 세 번째 적중을 계획한다

**기본 공격과 기본 기술을 세 번 맞혀야 주변 피해와 이동 속도가 켜진다.** 첫 두 번을 쓰고 상대가 빠질 수 있다면 무리하게 쫓지 말고, `E`가 적중할 때 세 번째 타격이 이어지도록 순서를 바꾼다. 지속 효과가 켜진 뒤에는 상대 옆을 따라 걸으며 기본 공격 간격을 유지한다.

## 보호막 충전량을 보고 두 번째 사용을 고른다

**`불멸(W)`은 주고받은 피해로 충전한 값을 보호막으로 바꾸고 다시 사용하면 회복한다.** 교환 시작과 동시에 누르면 작은 보호막만 생긴다. 큰 피해를 받은 직후 보호막으로 다음 타격을 막고, 전투가 끝났을 때 남은 값을 회복으로 바꾼다.

## 죽음의 세계에서 얻을 승리를 먼저 계산한다

**`죽음의 세계(R)`는 대상 하나를 분리하고 능력치 일부를 훔치지만, 들어간 뒤에는 외부 도움을 기대할 수 없다.** 이동기가 빠진 핵심 적이나 아군을 방해하는 앞선 적을 고른다. 단순히 체력이 낮은 대상보다 제한된 공간에서 `Q`와 `E`를 맞힐 수 있는 대상을 데려간다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-mordekaiser-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-mordekaiser-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-mordekaiser-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-mordekaiser-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-mordekaiser-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-mordekaiser-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-mordekaiser-20260914' AND target_key = '분류:딜탱');

-- mordekaiser 상대법 (837자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-mordekaiser', 'matchup', NULL, NULL, 'published', 'mordekaiser', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — `Q`를 미니언과 함께 맞는다 · 세 번째 적중 전에 끊는다 · 큰 보호막에는 공격을 멈춘다

## 혼자 철퇴를 맞지 않는다

**모데카이저의 `말살(Q)`은 한 대상에게만 적중하면 피해가 증가한다.**[* [모데카이저 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=41)] 완전히 피할 수 없다면 미니언과 같은 범위에 서서 단일 대상 보너스를 막는다. 다만 웨이브 옆으로 끌려 나가지 않도록 `죽음의 손아귀(E)` 시전 범위를 계속 옆으로 벗어난다.

## 지속 효과가 켜지기 전에 교환을 끝낸다

**기본 공격과 기본 기술 세 번이 맞으면 모데카이저 주변에 지속 피해가 생기고 추격도 빨라진다.** 두 번째 적중까지 허용했다면 한 대를 더 욕심내지 말고 거리를 초기화한다. 이미 켜졌다면 가까이 원을 그리기보다 사거리 밖으로 완전히 빠져 유지 시간을 끊는다.

## 충전된 `W`를 그대로 때리지 않는다

**모데카이저는 주고받은 피해를 `불멸(W)` 보호막으로 바꿀 수 있다.** 막대가 충분히 찬 상태에서 모든 기술을 쓰면 보호막에 흡수된다. 먼저 짧게 사용을 유도하고 보호막이 줄어드는 동안 거리를 둔 뒤, 회복까지 끝난 다음 다시 교환한다.

## 죽음의 세계에서는 좁은 중앙을 내주지 않는다

**`죽음의 세계(R)`에 들어가면 제한된 공간에서 일대일이 강제된다.** 모데카이저와 반대 방향 가장자리로 움직여 `E`와 `Q`를 옆으로 피할 공간을 만들고, 지속 효과를 켜 줄 기본 공격을 쉽게 내주지 않는다. 궁극기가 끝날 때 아군과 합류할 방향도 미리 잡는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-mordekaiser' AND kind = 'matchup' AND champion_slug = 'mordekaiser'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-mordekaiser');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-mordekaiser-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-mordekaiser' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — `Q`를 미니언과 함께 맞는다 · 세 번째 적중 전에 끊는다 · 큰 보호막에는 공격을 멈춘다

## 혼자 철퇴를 맞지 않는다

**모데카이저의 `말살(Q)`은 한 대상에게만 적중하면 피해가 증가한다.**[* [모데카이저 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=41)] 완전히 피할 수 없다면 미니언과 같은 범위에 서서 단일 대상 보너스를 막는다. 다만 웨이브 옆으로 끌려 나가지 않도록 `죽음의 손아귀(E)` 시전 범위를 계속 옆으로 벗어난다.

## 지속 효과가 켜지기 전에 교환을 끝낸다

**기본 공격과 기본 기술 세 번이 맞으면 모데카이저 주변에 지속 피해가 생기고 추격도 빨라진다.** 두 번째 적중까지 허용했다면 한 대를 더 욕심내지 말고 거리를 초기화한다. 이미 켜졌다면 가까이 원을 그리기보다 사거리 밖으로 완전히 빠져 유지 시간을 끊는다.

## 충전된 `W`를 그대로 때리지 않는다

**모데카이저는 주고받은 피해를 `불멸(W)` 보호막으로 바꿀 수 있다.** 막대가 충분히 찬 상태에서 모든 기술을 쓰면 보호막에 흡수된다. 먼저 짧게 사용을 유도하고 보호막이 줄어드는 동안 거리를 둔 뒤, 회복까지 끝난 다음 다시 교환한다.

## 죽음의 세계에서는 좁은 중앙을 내주지 않는다

**`죽음의 세계(R)`에 들어가면 제한된 공간에서 일대일이 강제된다.** 모데카이저와 반대 방향 가장자리로 움직여 `E`와 `Q`를 옆으로 피할 공간을 만들고, 지속 효과를 켜 줄 기본 공격을 쉽게 내주지 않는다. 궁극기가 끝날 때 아군과 합류할 방향도 미리 잡는다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-mordekaiser-20260914');

-- 클레드 챔피언 위키 (914자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-kled-20260914', 'article', '클레드', '클레드', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 밧줄이 유지될 거리로 붙는다 · `W` 네 번째 공격을 챔피언에게 쓴다 · 스칼에서 내려도 공격으로 용기를 번다

[[분류:탑]] [[분류:딜탱]]

## 덫을 맞힌 뒤 거리를 직접 지킨다

**`덫날리기(Q)`는 적에게 꽂힌 뒤 가까운 거리를 유지해야 추가 피해와 끌어당김이 발생한다.**[* [클레드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=132)] 적중만 확인하고 멈추지 말고 상대의 퇴로를 따라 비스듬히 걸어 밧줄을 유지한다. 상대 이동기가 남았으면 `이랴!(E)`를 먼저 쓰지 않고 밧줄이 끊기려는 순간 따라간다.

## 버럭버럭의 네 타를 낭비하지 않는다

**`버럭버럭(W)`은 다음 네 번의 기본 공격을 빠르게 만들고 네 번째 공격을 강화한다.** 자동으로 발동하는 구간에 미니언을 치면 가장 강한 타격을 교환 전에 잃는다. 활성 가능 시간을 보고 막타를 잠시 미루고, `Q`로 붙잡은 챔피언에게 네 타를 연결한다.

## 내렸을 때는 도망만 가지 않는다

**스칼 미탑승 상태의 `빵야!(Q)`와 챔피언 공격은 용기를 회복하고, 다시 탑승하면 전투를 뒤집을 체력이 생긴다.** 무조건 포탑으로만 달리면 용기를 채울 기회가 없다. 상대 핵심 기술이 빠졌을 때 사거리를 유지하며 `Q`와 기본 공격으로 마지막 용기를 채우고, 재탑승 직후 다시 거리를 좁힌다.

## 궁극기 경로를 아군 진입선으로 만든다

**`돌겨어어억!!!(R)`은 목표 지점으로 달리며 경로의 아군을 가속하고 첫 적 챔피언에게 돌진한다.** 적 한 명만 쫓는 직선보다 아군이 함께 들어올 수 있는 길을 고른다. 도착 지점 뒤에 적 포탑이나 막힌 지형이 없는지 보고, 보호막이 남아 있을 때 첫 제어를 받아낸다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-kled-20260914' OR (kind = 'article' AND title_key = '클레드'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-kled-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-kled-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `Q` 밧줄이 유지될 거리로 붙는다 · `W` 네 번째 공격을 챔피언에게 쓴다 · 스칼에서 내려도 공격으로 용기를 번다

[[분류:탑]] [[분류:딜탱]]

## 덫을 맞힌 뒤 거리를 직접 지킨다

**`덫날리기(Q)`는 적에게 꽂힌 뒤 가까운 거리를 유지해야 추가 피해와 끌어당김이 발생한다.**[* [클레드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=132)] 적중만 확인하고 멈추지 말고 상대의 퇴로를 따라 비스듬히 걸어 밧줄을 유지한다. 상대 이동기가 남았으면 `이랴!(E)`를 먼저 쓰지 않고 밧줄이 끊기려는 순간 따라간다.

## 버럭버럭의 네 타를 낭비하지 않는다

**`버럭버럭(W)`은 다음 네 번의 기본 공격을 빠르게 만들고 네 번째 공격을 강화한다.** 자동으로 발동하는 구간에 미니언을 치면 가장 강한 타격을 교환 전에 잃는다. 활성 가능 시간을 보고 막타를 잠시 미루고, `Q`로 붙잡은 챔피언에게 네 타를 연결한다.

## 내렸을 때는 도망만 가지 않는다

**스칼 미탑승 상태의 `빵야!(Q)`와 챔피언 공격은 용기를 회복하고, 다시 탑승하면 전투를 뒤집을 체력이 생긴다.** 무조건 포탑으로만 달리면 용기를 채울 기회가 없다. 상대 핵심 기술이 빠졌을 때 사거리를 유지하며 `Q`와 기본 공격으로 마지막 용기를 채우고, 재탑승 직후 다시 거리를 좁힌다.

## 궁극기 경로를 아군 진입선으로 만든다

**`돌겨어어억!!!(R)`은 목표 지점으로 달리며 경로의 아군을 가속하고 첫 적 챔피언에게 돌진한다.** 적 한 명만 쫓는 직선보다 아군이 함께 들어올 수 있는 길을 고른다. 도착 지점 뒤에 적 포탑이나 막힌 지형이 없는지 보고, 보호막이 남아 있을 때 첫 제어를 받아낸다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-kled-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-kled-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-kled-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-kled-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-kled-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-kled-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-kled-20260914' AND target_key = '분류:딜탱');

-- kled 상대법 (822자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-kled', 'matchup', NULL, NULL, 'published', 'kled', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — `Q` 밧줄을 즉시 끊는다 · `W` 네 타 뒤에 싸운다 · 재탑승 직전의 용기를 계산한다

## 밧줄이 꽂히면 가장 짧은 탈출선을 고른다

**클레드의 `덫날리기(Q)`는 가까운 거리가 유지되면 추가 피해와 끌어당김이 발생한다.**[* [클레드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=132)] 뒤로만 달리기보다 밧줄 범위의 가까운 가장자리로 이동하고, 이동기는 `이랴!(E)`가 따라온 뒤 사용한다. 밧줄을 끊었다면 즉시 되돌아가기보다 `Q` 재사용 전까지 짧게 압박한다.

## 빠른 네 번째 공격이 끝난 뒤 교환한다

**`버럭버럭(W)`이 켜진 클레드는 네 번의 공격을 빠르게 이어 가며 마지막 타격이 특히 강하다.** 미니언을 치며 발동했는지 보고 네 타가 소모될 때까지 거리를 둔다. 반대로 `W`가 준비된 상태에서 가까이 붙으면 짧은 교환을 길게 빼앗긴다.

## 스칼에서 내렸다고 무조건 추격하지 않는다

**미탑승 클레드는 공격과 `빵야!(Q)`로 용기를 채워 스칼에 다시 탈 수 있다.** 용기 막대가 거의 찼다면 마지막 한 대를 욕심내지 말고 재탑승 거리를 벗어난다. 용기가 낮고 `Q` 탄환을 쓴 직후가 확실하게 압박할 구간이다.

## 궁극기 경로의 옆으로 빠진다

**`돌겨어어억!!!(R)`은 정한 경로를 따라 달려 첫 적 챔피언에게 붙는다.** 직선 앞에서 도망치지 말고 경로 옆 지형으로 비켜 표적이 되는 시간을 줄인다. 클레드 뒤의 아군도 가속된다는 점을 보고 첫 충돌만 막은 뒤 더 깊게 추격하지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-kled' AND kind = 'matchup' AND champion_slug = 'kled'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-kled');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-kled-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-kled' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — `Q` 밧줄을 즉시 끊는다 · `W` 네 타 뒤에 싸운다 · 재탑승 직전의 용기를 계산한다

## 밧줄이 꽂히면 가장 짧은 탈출선을 고른다

**클레드의 `덫날리기(Q)`는 가까운 거리가 유지되면 추가 피해와 끌어당김이 발생한다.**[* [클레드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=132)] 뒤로만 달리기보다 밧줄 범위의 가까운 가장자리로 이동하고, 이동기는 `이랴!(E)`가 따라온 뒤 사용한다. 밧줄을 끊었다면 즉시 되돌아가기보다 `Q` 재사용 전까지 짧게 압박한다.

## 빠른 네 번째 공격이 끝난 뒤 교환한다

**`버럭버럭(W)`이 켜진 클레드는 네 번의 공격을 빠르게 이어 가며 마지막 타격이 특히 강하다.** 미니언을 치며 발동했는지 보고 네 타가 소모될 때까지 거리를 둔다. 반대로 `W`가 준비된 상태에서 가까이 붙으면 짧은 교환을 길게 빼앗긴다.

## 스칼에서 내렸다고 무조건 추격하지 않는다

**미탑승 클레드는 공격과 `빵야!(Q)`로 용기를 채워 스칼에 다시 탈 수 있다.** 용기 막대가 거의 찼다면 마지막 한 대를 욕심내지 말고 재탑승 거리를 벗어난다. 용기가 낮고 `Q` 탄환을 쓴 직후가 확실하게 압박할 구간이다.

## 궁극기 경로의 옆으로 빠진다

**`돌겨어어억!!!(R)`은 정한 경로를 따라 달려 첫 적 챔피언에게 붙는다.** 직선 앞에서 도망치지 말고 경로 옆 지형으로 비켜 표적이 되는 시간을 줄인다. 클레드 뒤의 아군도 가속된다는 점을 보고 첫 충돌만 막은 뒤 더 깊게 추격하지 않는다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-kled-20260914');

-- 그웬 챔피언 위키 (893자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-gwen-20260914', 'article', '그웬', '그웬', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 기본 공격으로 `Q` 가위질을 준비한다 · 중앙선을 맞힌다 · 안개 경계에서 원거리 공격을 흘린다

[[분류:탑]] [[분류:딜탱]]

## 가위질 횟수를 채운 뒤 앞으로 선다

**`싹둑싹둑!(Q)`은 최대 여섯 번 가위질하고 중앙에 있는 적에게 고정 피해를 주므로 준비 없이 쓰면 압박이 작다.**[* [그웬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=155)] 미니언 기본 공격으로 가위질을 쌓고, 상대가 막타를 치는 순간 `돌격가위(E)`로 각도를 맞춘다. 넓은 끝보다 중앙선에 대상을 오래 두는 데 집중한다.

## 안개는 공격 직전보다 반격 직전에 편다

**`신성한 안개(W)` 밖의 적은 그웬을 대상으로 지정할 수 없으므로 원거리 핵심 기술이 날아오는 순간 가치가 크다.** 먼저 켜고 걸어가면 상대가 경계 밖에서 기다린다. 짧게 진입해 공격을 유도한 뒤 안개를 펼치고, 경계 가까이 움직여 상대가 안으로 들어올지 포기할지 선택하게 한다.

## `E` 강화 시간을 기본 공격으로 회수한다

**`돌격가위(E)` 뒤에는 공격 속도와 사거리가 늘고, 적을 공격하면 재사용 대기시간 일부를 돌려받는다.** 단순 이동기로만 쓰고 바로 빠지면 다음 진입이 늦어진다. 안전한 미니언이나 챔피언을 한 번 이상 공격해 회수한 뒤, 상대의 반격 방향과 반대로 빠진다.

## 바늘 세 번을 한 교환에 묶는다

**`바느질(R)`은 최대 세 번 사용할 수 있고 재사용할수록 더 많은 바늘을 던진다.** 첫 바늘의 둔화만 쓰고 거리가 끊기지 않도록 `E`와 기본 공격을 사이에 넣는다. 상대가 좌우로 피하면 곧장 다음 바늘을 던지지 말고 이동 방향이 정해진 순간 겨눈다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-gwen-20260914' OR (kind = 'article' AND title_key = '그웬'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-gwen-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-gwen-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 기본 공격으로 `Q` 가위질을 준비한다 · 중앙선을 맞힌다 · 안개 경계에서 원거리 공격을 흘린다

[[분류:탑]] [[분류:딜탱]]

## 가위질 횟수를 채운 뒤 앞으로 선다

**`싹둑싹둑!(Q)`은 최대 여섯 번 가위질하고 중앙에 있는 적에게 고정 피해를 주므로 준비 없이 쓰면 압박이 작다.**[* [그웬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=155)] 미니언 기본 공격으로 가위질을 쌓고, 상대가 막타를 치는 순간 `돌격가위(E)`로 각도를 맞춘다. 넓은 끝보다 중앙선에 대상을 오래 두는 데 집중한다.

## 안개는 공격 직전보다 반격 직전에 편다

**`신성한 안개(W)` 밖의 적은 그웬을 대상으로 지정할 수 없으므로 원거리 핵심 기술이 날아오는 순간 가치가 크다.** 먼저 켜고 걸어가면 상대가 경계 밖에서 기다린다. 짧게 진입해 공격을 유도한 뒤 안개를 펼치고, 경계 가까이 움직여 상대가 안으로 들어올지 포기할지 선택하게 한다.

## `E` 강화 시간을 기본 공격으로 회수한다

**`돌격가위(E)` 뒤에는 공격 속도와 사거리가 늘고, 적을 공격하면 재사용 대기시간 일부를 돌려받는다.** 단순 이동기로만 쓰고 바로 빠지면 다음 진입이 늦어진다. 안전한 미니언이나 챔피언을 한 번 이상 공격해 회수한 뒤, 상대의 반격 방향과 반대로 빠진다.

## 바늘 세 번을 한 교환에 묶는다

**`바느질(R)`은 최대 세 번 사용할 수 있고 재사용할수록 더 많은 바늘을 던진다.** 첫 바늘의 둔화만 쓰고 거리가 끊기지 않도록 `E`와 기본 공격을 사이에 넣는다. 상대가 좌우로 피하면 곧장 다음 바늘을 던지지 말고 이동 방향이 정해진 순간 겨눈다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-gwen-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-gwen-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-gwen-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-gwen-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-gwen-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-gwen-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-gwen-20260914' AND target_key = '분류:딜탱');

-- gwen 상대법 (852자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-gwen', 'matchup', NULL, NULL, 'published', 'gwen', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — `Q` 중앙선에서 옆으로 빠진다 · 안개 안에 들어갈지 완전히 물러날지 고른다 · 세 번째 바늘까지 거리를 유지한다

## 가위 끝보다 중앙을 먼저 피한다

**그웬의 `싹둑싹둑!(Q)`은 중앙에 있는 대상에게 고정 피해를 주고 준비된 가위질이 많을수록 오래 이어진다.**[* [그웬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=155)] 뒤로만 빠지면 원뿔 중앙에 계속 남으므로 시전 방향의 옆으로 움직인다. 그웬이 미니언을 여러 번 친 뒤에는 막타 하나를 포기해서라도 `Q` 사거리를 내준다.

## 안개 경계에서 공격을 낭비하지 않는다

**`신성한 안개(W)` 밖에서는 그웬을 대상으로 지정할 수 없다.** 원거리 기술을 경계 밖에서 던지지 말고, 들어가서 짧게 때릴 수 있으면 안쪽으로 붙고 아니면 완전히 물러난다. 안개가 끝난 직후에는 그웬의 가장 큰 방어 선택지가 없어 다시 견제할 수 있다.

## `E` 뒤 기본 공격을 쉽게 내주지 않는다

**`돌격가위(E)` 뒤 그웬이 공격을 적중시키면 다음 사용이 빨리 돌아온다.** 돌진 지점에서 한 대 맞교환하기보다 강화 사거리 밖으로 먼저 빠져 재사용 회수를 막는다. `E`가 돌아오기 전에 이동기를 쓰게 만들면 다음 `Q` 중앙을 피하기도 쉬워진다.

## 바늘 사이마다 방향을 바꾼다

**`바느질(R)`은 세 번에 걸쳐 바늘 수가 늘고 둔화로 다음 적중을 돕는다.** 첫 투사체를 맞았다고 직선으로 달리지 말고 미니언이나 지형을 기준으로 좌우 방향을 바꾼다. 마지막 바늘을 피한 뒤가 그웬의 추격 압력이 가장 크게 줄어드는 순간이다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-gwen' AND kind = 'matchup' AND champion_slug = 'gwen'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-gwen');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-gwen-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-gwen' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — `Q` 중앙선에서 옆으로 빠진다 · 안개 안에 들어갈지 완전히 물러날지 고른다 · 세 번째 바늘까지 거리를 유지한다

## 가위 끝보다 중앙을 먼저 피한다

**그웬의 `싹둑싹둑!(Q)`은 중앙에 있는 대상에게 고정 피해를 주고 준비된 가위질이 많을수록 오래 이어진다.**[* [그웬 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=155)] 뒤로만 빠지면 원뿔 중앙에 계속 남으므로 시전 방향의 옆으로 움직인다. 그웬이 미니언을 여러 번 친 뒤에는 막타 하나를 포기해서라도 `Q` 사거리를 내준다.

## 안개 경계에서 공격을 낭비하지 않는다

**`신성한 안개(W)` 밖에서는 그웬을 대상으로 지정할 수 없다.** 원거리 기술을 경계 밖에서 던지지 말고, 들어가서 짧게 때릴 수 있으면 안쪽으로 붙고 아니면 완전히 물러난다. 안개가 끝난 직후에는 그웬의 가장 큰 방어 선택지가 없어 다시 견제할 수 있다.

## `E` 뒤 기본 공격을 쉽게 내주지 않는다

**`돌격가위(E)` 뒤 그웬이 공격을 적중시키면 다음 사용이 빨리 돌아온다.** 돌진 지점에서 한 대 맞교환하기보다 강화 사거리 밖으로 먼저 빠져 재사용 회수를 막는다. `E`가 돌아오기 전에 이동기를 쓰게 만들면 다음 `Q` 중앙을 피하기도 쉬워진다.

## 바늘 사이마다 방향을 바꾼다

**`바느질(R)`은 세 번에 걸쳐 바늘 수가 늘고 둔화로 다음 적중을 돕는다.** 첫 투사체를 맞았다고 직선으로 달리지 말고 미니언이나 지형을 기준으로 좌우 방향을 바꾼다. 마지막 바늘을 피한 뒤가 그웬의 추격 압력이 가장 크게 줄어드는 순간이다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-gwen-20260914');

-- 볼리베어 챔피언 위키 (887자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-volibear-20260914', 'article', '볼리베어', '볼리베어', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — `E` 번개를 먼저 예약한다 · `Q` 기절로 폭발 안에 묶는다 · 두 번째 `W`까지 같은 대상을 놓치지 않는다

[[분류:탑]] [[분류:딜탱]]

## 번개가 떨어질 자리에 먼저 달려든다

**`천공 분열(E)`은 잠시 뒤 지정 위치에 떨어지고 볼리베어가 범위 안에 있으면 보호막을 준다.**[* [볼리베어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=88)] 상대 발밑에 바로 쓰기보다 퇴로 쪽에 예약하고 `번개 강타(Q)`로 밀어 넣는다. 폭발과 기절이 겹치면 피해와 보호막을 함께 챙겨 반격까지 받아낼 수 있다.

## 첫 상처는 다음 교환의 약속이다

**`광란의 상처(W)`는 표식이 남은 대상에게 다시 쓰면 피해와 회복이 커진다.** 첫 사용 뒤 무조건 추격하기보다 표식이 유지되는 거리에서 다음 재사용을 기다린다. 상대가 완전히 빠질 수 있다면 짧은 이득으로 끝내고, 이동기가 빠졌다면 두 번째 `W`까지 압박을 이어 간다.

## `Q`는 접근과 퇴로 중 하나에 쓴다

**`번개 강타(Q)`는 적을 향할 때 빨라지고 첫 기본 공격을 기절로 바꾼다.** 매번 진입에 쓰면 갱킹이나 역추격에서 벗어날 수 없다. `E`가 적중할 확률이 높은 때만 먼저 달려들고, 시야가 없을 때는 기절을 들고 웨이브를 짧게 정리한다.

## 궁극기 착지 뒤 목표를 미리 정한다

**`폭풍을 부르는 자(R)`는 도약 지점에 피해와 둔화를 주고 근처 포탑을 잠시 비활성화한다.** 포탑만 끈다는 이유로 깊게 뛰지 말고, 착지 직후 두 번째 `W`를 넣을 대상과 빠질 방향을 먼저 정한다. 적이 흩어지면 체력이 낮은 한 명보다 아군과 같은 방향의 대상을 고른다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-volibear-20260914' OR (kind = 'article' AND title_key = '볼리베어'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-volibear-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-volibear-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — `E` 번개를 먼저 예약한다 · `Q` 기절로 폭발 안에 묶는다 · 두 번째 `W`까지 같은 대상을 놓치지 않는다

[[분류:탑]] [[분류:딜탱]]

## 번개가 떨어질 자리에 먼저 달려든다

**`천공 분열(E)`은 잠시 뒤 지정 위치에 떨어지고 볼리베어가 범위 안에 있으면 보호막을 준다.**[* [볼리베어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=88)] 상대 발밑에 바로 쓰기보다 퇴로 쪽에 예약하고 `번개 강타(Q)`로 밀어 넣는다. 폭발과 기절이 겹치면 피해와 보호막을 함께 챙겨 반격까지 받아낼 수 있다.

## 첫 상처는 다음 교환의 약속이다

**`광란의 상처(W)`는 표식이 남은 대상에게 다시 쓰면 피해와 회복이 커진다.** 첫 사용 뒤 무조건 추격하기보다 표식이 유지되는 거리에서 다음 재사용을 기다린다. 상대가 완전히 빠질 수 있다면 짧은 이득으로 끝내고, 이동기가 빠졌다면 두 번째 `W`까지 압박을 이어 간다.

## `Q`는 접근과 퇴로 중 하나에 쓴다

**`번개 강타(Q)`는 적을 향할 때 빨라지고 첫 기본 공격을 기절로 바꾼다.** 매번 진입에 쓰면 갱킹이나 역추격에서 벗어날 수 없다. `E`가 적중할 확률이 높은 때만 먼저 달려들고, 시야가 없을 때는 기절을 들고 웨이브를 짧게 정리한다.

## 궁극기 착지 뒤 목표를 미리 정한다

**`폭풍을 부르는 자(R)`는 도약 지점에 피해와 둔화를 주고 근처 포탑을 잠시 비활성화한다.** 포탑만 끈다는 이유로 깊게 뛰지 말고, 착지 직후 두 번째 `W`를 넣을 대상과 빠질 방향을 먼저 정한다. 적이 흩어지면 체력이 낮은 한 명보다 아군과 같은 방향의 대상을 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-volibear-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-volibear-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-volibear-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-volibear-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-volibear-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-volibear-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-volibear-20260914' AND target_key = '분류:딜탱');

-- volibear 상대법 (856자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-volibear', 'matchup', NULL, NULL, 'published', 'volibear', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — `E` 표시에서 먼저 나온다 · 첫 `W` 표식이 사라질 때까지 끊는다 · 궁극기 다이브 때 포탑만 믿지 않는다

## 번개 표시와 볼리베어 사이에서 벗어난다

**볼리베어의 `천공 분열(E)`은 잠시 뒤 폭발하고 자신이 안에 있으면 보호막까지 얻는다.**[* [볼리베어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=88)] 원의 뒤쪽으로 빠지면 `번개 강타(Q)`에 밀려 다시 들어갈 수 있으니 옆 가장자리로 나간다. 기절을 맞더라도 번개와 겹치지 않게 만드는 것이 먼저다.

## 첫 상처 뒤에는 교환을 초기화한다

**`광란의 상처(W)` 표식 대상에게 두 번째로 사용하면 피해와 회복이 함께 커진다.** 표식이 남은 동안 한 대 더 치겠다고 붙지 말고 사거리 밖으로 끊는다. 두 번째 사용을 막으면 볼리베어가 긴 교환에서 얻을 회복을 크게 줄일 수 있다.

## `Q`가 켜졌을 때 이동기를 먼저 쓰지 않는다

**`번개 강타(Q)`는 첫 기본 공격으로 기절시키므로 단순히 뒤로 달리면 따라잡히기 쉽다.** 미니언 사이를 돌아 접근 시간을 늘리고, 볼리베어가 공격 거리까지 들어온 순간 이동기로 빠진다. 기절이 소모된 뒤에는 `E`가 없을 때 짧게 되받아친다.

## 포탑 비활성화 시간을 버티는 방향으로 빠진다

**`폭풍을 부르는 자(R)`는 착지 근처 포탑을 잠시 끄므로 포탑 아래가 즉시 안전지대가 되지 않는다.** 착지 중심을 피하고 반대편 출구로 움직여 비활성화 시간이 끝날 때까지 거리를 번다. 볼리베어에게 첫 `W` 표식까지 묻었다면 포탑 쪽 재진입보다 더 깊은 안전 지점으로 빠진다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-volibear' AND kind = 'matchup' AND champion_slug = 'volibear'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-volibear');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-volibear-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-volibear' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — `E` 표시에서 먼저 나온다 · 첫 `W` 표식이 사라질 때까지 끊는다 · 궁극기 다이브 때 포탑만 믿지 않는다

## 번개 표시와 볼리베어 사이에서 벗어난다

**볼리베어의 `천공 분열(E)`은 잠시 뒤 폭발하고 자신이 안에 있으면 보호막까지 얻는다.**[* [볼리베어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=88)] 원의 뒤쪽으로 빠지면 `번개 강타(Q)`에 밀려 다시 들어갈 수 있으니 옆 가장자리로 나간다. 기절을 맞더라도 번개와 겹치지 않게 만드는 것이 먼저다.

## 첫 상처 뒤에는 교환을 초기화한다

**`광란의 상처(W)` 표식 대상에게 두 번째로 사용하면 피해와 회복이 함께 커진다.** 표식이 남은 동안 한 대 더 치겠다고 붙지 말고 사거리 밖으로 끊는다. 두 번째 사용을 막으면 볼리베어가 긴 교환에서 얻을 회복을 크게 줄일 수 있다.

## `Q`가 켜졌을 때 이동기를 먼저 쓰지 않는다

**`번개 강타(Q)`는 첫 기본 공격으로 기절시키므로 단순히 뒤로 달리면 따라잡히기 쉽다.** 미니언 사이를 돌아 접근 시간을 늘리고, 볼리베어가 공격 거리까지 들어온 순간 이동기로 빠진다. 기절이 소모된 뒤에는 `E`가 없을 때 짧게 되받아친다.

## 포탑 비활성화 시간을 버티는 방향으로 빠진다

**`폭풍을 부르는 자(R)`는 착지 근처 포탑을 잠시 끄므로 포탑 아래가 즉시 안전지대가 되지 않는다.** 착지 중심을 피하고 반대편 출구로 움직여 비활성화 시간이 끝날 때까지 거리를 번다. 볼리베어에게 첫 `W` 표식까지 묻었다면 포탑 쪽 재진입보다 더 깊은 안전 지점으로 빠진다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-volibear-20260914');

-- 트린다미어 챔피언 위키 (914자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-tryndamere-20260914', 'article', '트린다미어', '트린다미어', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 분노가 높을 때 교환한다 · `Q` 회복과 공격력을 맞바꾼다 · `R`이 끝날 퇴로를 남긴다

[[분류:탑]] [[분류:딜탱]]

## 분노가 찬 웨이브에서 앞으로 선다

**트린다미어는 분노가 쌓일수록 치명타 압박이 커지고 `피의 갈망(Q)`으로 회복할 수도 있다.**[* [트린다미어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=66)] 분노가 낮을 때 억지로 싸우기보다 미니언을 공격해 자원을 만든 뒤 상대의 막타에 맞춰 접근한다. 회복에 분노를 쓰면 다음 교환의 위력이 줄어드니 라인 유지와 압박 중 하나를 분명히 고른다.

## 외침은 상대의 등을 확인하고 쓴다

**`조롱의 외침(W)`은 주변 적의 공격력을 낮추고 등을 돌린 대상은 추가로 둔화한다.** 상대가 이미 도망치는 순간에 쓰면 추격이 길어지고, 서로 마주 본 채 싸울 때도 공격력 감소로 맞교환을 유리하게 만든다. 사거리 밖에서 미리 누르지 않고 아이콘이 활성화되는 거리까지 기다린다.

## 회전 베기는 진입보다 재배치에 남긴다

**`회전 베기(E)`는 경로를 가르며 이동하므로 벽을 넘거나 상대 퇴로를 선점할 수 있다.** 첫 접근에 전부 쓰면 군중 제어를 맞은 뒤 빠질 수 없다. 걸어서 닿을 수 있는 상대에게는 기본 공격부터 시작하고, 거리가 벌어지거나 위험한 기술을 피할 때 회전한다.

## 불사가 끝나는 순간을 먼저 설계한다

**`불사의 분노(R)`는 잠시 체력이 일정 수치 아래로 내려가지 않게 하지만 끝난 뒤의 안전까지 보장하지 않는다.** 마지막까지 공격만 하기보다 종료 전에 `E`로 나갈 방향을 확보한다. 상대 핵심 제어가 남아 있다면 더 일찍 궁극기를 사용해 행동 불가 상태에서 쓰지 못하는 실수를 줄인다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-tryndamere-20260914' OR (kind = 'article' AND title_key = '트린다미어'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-tryndamere-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-tryndamere-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 분노가 높을 때 교환한다 · `Q` 회복과 공격력을 맞바꾼다 · `R`이 끝날 퇴로를 남긴다

[[분류:탑]] [[분류:딜탱]]

## 분노가 찬 웨이브에서 앞으로 선다

**트린다미어는 분노가 쌓일수록 치명타 압박이 커지고 `피의 갈망(Q)`으로 회복할 수도 있다.**[* [트린다미어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=66)] 분노가 낮을 때 억지로 싸우기보다 미니언을 공격해 자원을 만든 뒤 상대의 막타에 맞춰 접근한다. 회복에 분노를 쓰면 다음 교환의 위력이 줄어드니 라인 유지와 압박 중 하나를 분명히 고른다.

## 외침은 상대의 등을 확인하고 쓴다

**`조롱의 외침(W)`은 주변 적의 공격력을 낮추고 등을 돌린 대상은 추가로 둔화한다.** 상대가 이미 도망치는 순간에 쓰면 추격이 길어지고, 서로 마주 본 채 싸울 때도 공격력 감소로 맞교환을 유리하게 만든다. 사거리 밖에서 미리 누르지 않고 아이콘이 활성화되는 거리까지 기다린다.

## 회전 베기는 진입보다 재배치에 남긴다

**`회전 베기(E)`는 경로를 가르며 이동하므로 벽을 넘거나 상대 퇴로를 선점할 수 있다.** 첫 접근에 전부 쓰면 군중 제어를 맞은 뒤 빠질 수 없다. 걸어서 닿을 수 있는 상대에게는 기본 공격부터 시작하고, 거리가 벌어지거나 위험한 기술을 피할 때 회전한다.

## 불사가 끝나는 순간을 먼저 설계한다

**`불사의 분노(R)`는 잠시 체력이 일정 수치 아래로 내려가지 않게 하지만 끝난 뒤의 안전까지 보장하지 않는다.** 마지막까지 공격만 하기보다 종료 전에 `E`로 나갈 방향을 확보한다. 상대 핵심 제어가 남아 있다면 더 일찍 궁극기를 사용해 행동 불가 상태에서 쓰지 못하는 실수를 줄인다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-tryndamere-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-tryndamere-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-tryndamere-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-tryndamere-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-tryndamere-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-tryndamere-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-tryndamere-20260914' AND target_key = '분류:딜탱');

-- tryndamere 상대법 (824자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-tryndamere', 'matchup', NULL, NULL, 'published', 'tryndamere', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 높은 분노에는 막타를 양보한다 · 등을 보인 채 `W`를 맞지 않는다 · `R` 동안 거리를 벌리고 끝을 센다

## 분노가 낮을 때만 긴 교환을 연다

**트린다미어는 분노가 높을수록 치명타 압박과 `피의 갈망(Q)` 회복 선택지가 함께 커진다.**[* [트린다미어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=66)] 가득 찬 상태에서 운에 기대 맞서지 말고 웨이브가 초기화되거나 회복에 분노를 쓴 뒤 싸운다. 분노가 낮다면 미니언을 자유롭게 치지 못하게 짧은 견제를 반복한다.

## 외침을 맞을 때 몸을 돌린다

**`조롱의 외침(W)`은 등을 돌린 챔피언을 둔화시키므로 직선으로 도망칠 때 추격이 쉬워진다.** 시전 순간 잠깐 트린다미어를 바라본 뒤 옆으로 빠져 둔화를 막는다. 공격력 감소는 남으므로 곧장 맞싸우기보다 효과가 끝날 때까지 거리를 유지한다.

## `E` 도착 지점에 기술을 남긴다

**`회전 베기(E)`는 벽과 미니언을 가로질러 접근할 수 있다.** 현재 위치에 기술을 먼저 쓰지 말고 회전이 끝나는 지점을 겨눈다. 트린다미어가 `E`를 진입에 사용했다면 다음 회전 전까지 퇴로가 제한되므로 짧은 제어를 이어 간다.

## 불사 시간에는 처치 피해를 쏟지 않는다

**`불사의 분노(R)` 동안 체력이 바닥 아래로 내려가지 않으므로 큰 피해를 반복해도 처치할 수 없다.** 둔화와 이동기로 기본 공격 거리를 끊고 지속시간을 센다. 끝나기 직전에 제어와 마지막 피해를 맞추되, 트린다미어가 `E`로 빠질 벽 방향도 막는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-tryndamere' AND kind = 'matchup' AND champion_slug = 'tryndamere'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-tryndamere');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-tryndamere-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-tryndamere' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 높은 분노에는 막타를 양보한다 · 등을 보인 채 `W`를 맞지 않는다 · `R` 동안 거리를 벌리고 끝을 센다

## 분노가 낮을 때만 긴 교환을 연다

**트린다미어는 분노가 높을수록 치명타 압박과 `피의 갈망(Q)` 회복 선택지가 함께 커진다.**[* [트린다미어 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=66)] 가득 찬 상태에서 운에 기대 맞서지 말고 웨이브가 초기화되거나 회복에 분노를 쓴 뒤 싸운다. 분노가 낮다면 미니언을 자유롭게 치지 못하게 짧은 견제를 반복한다.

## 외침을 맞을 때 몸을 돌린다

**`조롱의 외침(W)`은 등을 돌린 챔피언을 둔화시키므로 직선으로 도망칠 때 추격이 쉬워진다.** 시전 순간 잠깐 트린다미어를 바라본 뒤 옆으로 빠져 둔화를 막는다. 공격력 감소는 남으므로 곧장 맞싸우기보다 효과가 끝날 때까지 거리를 유지한다.

## `E` 도착 지점에 기술을 남긴다

**`회전 베기(E)`는 벽과 미니언을 가로질러 접근할 수 있다.** 현재 위치에 기술을 먼저 쓰지 말고 회전이 끝나는 지점을 겨눈다. 트린다미어가 `E`를 진입에 사용했다면 다음 회전 전까지 퇴로가 제한되므로 짧은 제어를 이어 간다.

## 불사 시간에는 처치 피해를 쏟지 않는다

**`불사의 분노(R)` 동안 체력이 바닥 아래로 내려가지 않으므로 큰 피해를 반복해도 처치할 수 없다.** 둔화와 이동기로 기본 공격 거리를 끊고 지속시간을 센다. 끝나기 직전에 제어와 마지막 피해를 맞추되, 트린다미어가 `E`로 빠질 벽 방향도 막는다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-tryndamere-20260914');

-- 암베사 챔피언 위키 (920자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-ambessa-20260914', 'article', '암베사', '암베사', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 기술 뒤 이동 명령으로 돌진한다 · 강화 공격으로 기력을 돌려받는다 · `Q` 두 모양의 강한 지점을 구분한다

[[분류:탑]] [[분류:딜탱]]

## 기술과 이동 명령을 한 동작으로 묶는다

**암베사는 기술 사용 중 기본 공격이나 이동 명령을 내리면 끝난 뒤 그 방향으로 돌진한다.**[* [암베사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=169)] 피해만 보고 기술을 연속 사용하면 원치 않는 방향으로 들어가거나 돌진을 잃는다. 한 번 쓸 때마다 다음 위치를 먼저 찍고, 상대의 옆을 지나 퇴로를 막을지 뒤로 빠질지 정한다.

## 강화 공격으로 기력 순환을 잇는다

**돌진이 개시될 때 쌓이는 충전은 다음 기본 공격의 사거리와 속도를 높이고 적중하면 기력을 회복한다.** 기술만 빠르게 누르면 기력이 먼저 바닥난다. 돌진 뒤 강화 공격을 한 번씩 섞고, 상대가 사거리 밖으로 빠지면 미니언에 쓸지 추격을 멈출지 즉시 고른다.

## 첫 `Q`와 두 번째 `Q`의 선을 바꾼다

**`교활한 휩쓸기(Q)`는 반원의 날에 맞히면 강하고, 적중 뒤의 `파멸의 일격(Q)`은 일직선 첫 대상에게 추가 피해를 준다.** 첫 타는 옆으로 돌진해 바깥 날을 맞히고, 두 번째는 미니언에 막히지 않는 선을 만든다. 같은 자리에서 두 번 쓰면 상대가 한 방향으로 모두 피하기 쉽다.

## 방패와 궁극기는 반격을 읽고 쓴다

**`배척(W)`은 준비 중 챔피언 피해를 막으면 반격 피해가 커지고, `공개 처형(R)`은 선상 가장 먼 챔피언을 제압한다.** 상대 핵심 공격 직전에 `W`로 받아내고, 도주기가 빠진 뒤 궁극기로 뒤를 잡는다. 여러 명이 한 선에 있으면 원하지 않는 후방 대상을 잡지 않도록 각도를 좁힌다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-ambessa-20260914' OR (kind = 'article' AND title_key = '암베사'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-ambessa-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-ambessa-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 기술 뒤 이동 명령으로 돌진한다 · 강화 공격으로 기력을 돌려받는다 · `Q` 두 모양의 강한 지점을 구분한다

[[분류:탑]] [[분류:딜탱]]

## 기술과 이동 명령을 한 동작으로 묶는다

**암베사는 기술 사용 중 기본 공격이나 이동 명령을 내리면 끝난 뒤 그 방향으로 돌진한다.**[* [암베사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=169)] 피해만 보고 기술을 연속 사용하면 원치 않는 방향으로 들어가거나 돌진을 잃는다. 한 번 쓸 때마다 다음 위치를 먼저 찍고, 상대의 옆을 지나 퇴로를 막을지 뒤로 빠질지 정한다.

## 강화 공격으로 기력 순환을 잇는다

**돌진이 개시될 때 쌓이는 충전은 다음 기본 공격의 사거리와 속도를 높이고 적중하면 기력을 회복한다.** 기술만 빠르게 누르면 기력이 먼저 바닥난다. 돌진 뒤 강화 공격을 한 번씩 섞고, 상대가 사거리 밖으로 빠지면 미니언에 쓸지 추격을 멈출지 즉시 고른다.

## 첫 `Q`와 두 번째 `Q`의 선을 바꾼다

**`교활한 휩쓸기(Q)`는 반원의 날에 맞히면 강하고, 적중 뒤의 `파멸의 일격(Q)`은 일직선 첫 대상에게 추가 피해를 준다.** 첫 타는 옆으로 돌진해 바깥 날을 맞히고, 두 번째는 미니언에 막히지 않는 선을 만든다. 같은 자리에서 두 번 쓰면 상대가 한 방향으로 모두 피하기 쉽다.

## 방패와 궁극기는 반격을 읽고 쓴다

**`배척(W)`은 준비 중 챔피언 피해를 막으면 반격 피해가 커지고, `공개 처형(R)`은 선상 가장 먼 챔피언을 제압한다.** 상대 핵심 공격 직전에 `W`로 받아내고, 도주기가 빠진 뒤 궁극기로 뒤를 잡는다. 여러 명이 한 선에 있으면 원하지 않는 후방 대상을 잡지 않도록 각도를 좁힌다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-ambessa-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-ambessa-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-ambessa-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-ambessa-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-ambessa-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-ambessa-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-ambessa-20260914' AND target_key = '분류:딜탱');

-- ambessa 상대법 (832자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-ambessa', 'matchup', NULL, NULL, 'published', 'ambessa', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 돌진 방향의 반대로 꺾는다 · 강화 공격을 끊어 기력을 말린다 · `W` 보호막이 빠진 뒤 피해를 넣는다

## 기술보다 뒤따르는 돌진을 본다

**암베사는 기술 사용 뒤 이동 명령 방향으로 짧게 돌진하므로 첫 범위만 피했다고 교환이 끝나지 않는다.**[* [암베사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=169)] 기술 시전 방향과 반대쪽으로 한 번 더 꺾어 강화 공격 거리를 내주지 않는다. 벽 가까이에서는 돌진 선택지가 줄어드니 열린 공간보다 측면 지형을 끼고 맞선다.

## 강화 공격을 못 치게 거리를 끊는다

**돌진 뒤 충전된 기본 공격이 적중하면 암베사는 기력을 회복해 다음 기술을 이어 간다.** 한 대씩 맞교환하기보다 강화 사거리 밖으로 완전히 빠져 순환을 끊는다. 기력이 낮고 충전도 소모된 순간에는 연속 돌진이 어려워 앞으로 압박할 수 있다.

## 두 `Q`의 강한 선을 다르게 피한다

**첫 `Q`는 반원 바깥 날이, 적중 뒤 두 번째 `Q`는 일직선의 첫 대상이 더 위협적이다.** 첫 타는 암베사 안쪽이나 옆으로 붙고, 두 번째는 미니언 뒤 또는 직선 옆으로 이동한다. 두 번 모두 뒤로만 피하면 돌진과 함께 끝 사거리에 계속 걸린다.

## 보호막에 큰 피해를 겹치지 않는다

**`배척(W)`은 보호막으로 챔피언 피해를 막으면 뒤따르는 공격이 강해진다.** 준비 동작을 보면 큰 기술을 멈추고 보호막이 사라진 뒤 다시 공격한다. `공개 처형(R)`은 선상 가장 먼 챔피언을 노리므로 아군과 일렬로 서지 않고 옆으로 흩어진다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-ambessa' AND kind = 'matchup' AND champion_slug = 'ambessa'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-ambessa');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-ambessa-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-ambessa' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 돌진 방향의 반대로 꺾는다 · 강화 공격을 끊어 기력을 말린다 · `W` 보호막이 빠진 뒤 피해를 넣는다

## 기술보다 뒤따르는 돌진을 본다

**암베사는 기술 사용 뒤 이동 명령 방향으로 짧게 돌진하므로 첫 범위만 피했다고 교환이 끝나지 않는다.**[* [암베사 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=169)] 기술 시전 방향과 반대쪽으로 한 번 더 꺾어 강화 공격 거리를 내주지 않는다. 벽 가까이에서는 돌진 선택지가 줄어드니 열린 공간보다 측면 지형을 끼고 맞선다.

## 강화 공격을 못 치게 거리를 끊는다

**돌진 뒤 충전된 기본 공격이 적중하면 암베사는 기력을 회복해 다음 기술을 이어 간다.** 한 대씩 맞교환하기보다 강화 사거리 밖으로 완전히 빠져 순환을 끊는다. 기력이 낮고 충전도 소모된 순간에는 연속 돌진이 어려워 앞으로 압박할 수 있다.

## 두 `Q`의 강한 선을 다르게 피한다

**첫 `Q`는 반원 바깥 날이, 적중 뒤 두 번째 `Q`는 일직선의 첫 대상이 더 위협적이다.** 첫 타는 암베사 안쪽이나 옆으로 붙고, 두 번째는 미니언 뒤 또는 직선 옆으로 이동한다. 두 번 모두 뒤로만 피하면 돌진과 함께 끝 사거리에 계속 걸린다.

## 보호막에 큰 피해를 겹치지 않는다

**`배척(W)`은 보호막으로 챔피언 피해를 막으면 뒤따르는 공격이 강해진다.** 준비 동작을 보면 큰 기술을 멈추고 보호막이 사라진 뒤 다시 공격한다. `공개 처형(R)`은 선상 가장 먼 챔피언을 노리므로 아군과 일렬로 서지 않고 옆으로 흩어진다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-ambessa-20260914');

-- 나르 챔피언 위키 (892자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-gnar-20260914', 'article', '나르', '나르', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 미니 나르는 세 번째 타격을 만든다 · 분노가 차기 전에 진입 위치를 잡는다 · 메가 나르는 벽을 등진 적을 노린다

[[분류:탑]] [[분류:딜탱]]

## 부메랑을 받는 자리까지 설계한다

**미니 나르의 `부메랑 던지기(Q)`는 돌아오는 부메랑을 받으면 재사용 대기시간이 줄어든다.**[* [나르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=120)] 맞히는 선만 보지 말고 다음에 서고 싶은 위치로 몸을 움직여 회수한다. 상대 퇴로 쪽에서 받으면 `슝슝(W)` 세 번째 타격을 이어 가고, 위험하면 뒤쪽으로 유도해 교환을 끝낸다.

## 세 번째 타격 뒤 이동 속도로 빠진다

**미니 나르는 기본 공격과 기술의 세 번째 적중으로 추가 피해와 이동 속도를 얻는다.** 첫 표식부터 오래 붙기보다 막타와 `Q`로 두 번을 준비하고, 상대가 앞으로 올 때 세 번째를 터뜨린 뒤 거리를 벌린다. 몸이 약한 상태에서 이동 속도가 끝난 뒤까지 싸움을 늘리지 않는다.

## 분노가 가득 차기 전에 착지점을 고른다

**`폴짝(E)`은 유닛 위에 착지하면 한 번 더 튀므로 변신 진입 거리를 크게 바꿀 수 있다.** 분노가 거의 찼을 때 앞 미니언을 발판으로 삼아 적 뒤나 옆에 착지한다. 단순히 정면으로 뛰면 상대가 벽에서 멀어져 메가 나르의 제어를 피하기 쉽다.

## 메가 나르의 제어를 벽과 묶는다

**메가 나르의 `나르!(R)`는 적을 밀치고 벽에 부딪히면 기절과 추가 피해를 준다.** 변신하자마자 쓰기보다 `우지끈(E)`이나 `쿵쾅(W)`으로 벽 쪽 이동을 강요한다. 궁극기 뒤 돌덩이를 주워 `Q` 재사용을 당기고, 변신이 끝나기 전에 빠질 길을 남긴다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-gnar-20260914' OR (kind = 'article' AND title_key = '나르'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-gnar-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-gnar-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 미니 나르는 세 번째 타격을 만든다 · 분노가 차기 전에 진입 위치를 잡는다 · 메가 나르는 벽을 등진 적을 노린다

[[분류:탑]] [[분류:딜탱]]

## 부메랑을 받는 자리까지 설계한다

**미니 나르의 `부메랑 던지기(Q)`는 돌아오는 부메랑을 받으면 재사용 대기시간이 줄어든다.**[* [나르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=120)] 맞히는 선만 보지 말고 다음에 서고 싶은 위치로 몸을 움직여 회수한다. 상대 퇴로 쪽에서 받으면 `슝슝(W)` 세 번째 타격을 이어 가고, 위험하면 뒤쪽으로 유도해 교환을 끝낸다.

## 세 번째 타격 뒤 이동 속도로 빠진다

**미니 나르는 기본 공격과 기술의 세 번째 적중으로 추가 피해와 이동 속도를 얻는다.** 첫 표식부터 오래 붙기보다 막타와 `Q`로 두 번을 준비하고, 상대가 앞으로 올 때 세 번째를 터뜨린 뒤 거리를 벌린다. 몸이 약한 상태에서 이동 속도가 끝난 뒤까지 싸움을 늘리지 않는다.

## 분노가 가득 차기 전에 착지점을 고른다

**`폴짝(E)`은 유닛 위에 착지하면 한 번 더 튀므로 변신 진입 거리를 크게 바꿀 수 있다.** 분노가 거의 찼을 때 앞 미니언을 발판으로 삼아 적 뒤나 옆에 착지한다. 단순히 정면으로 뛰면 상대가 벽에서 멀어져 메가 나르의 제어를 피하기 쉽다.

## 메가 나르의 제어를 벽과 묶는다

**메가 나르의 `나르!(R)`는 적을 밀치고 벽에 부딪히면 기절과 추가 피해를 준다.** 변신하자마자 쓰기보다 `우지끈(E)`이나 `쿵쾅(W)`으로 벽 쪽 이동을 강요한다. 궁극기 뒤 돌덩이를 주워 `Q` 재사용을 당기고, 변신이 끝나기 전에 빠질 길을 남긴다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-gnar-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-gnar-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-gnar-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-gnar-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-gnar-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-gnar-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-gnar-20260914' AND target_key = '분류:딜탱');

-- gnar 상대법 (812자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-gnar', 'matchup', NULL, NULL, 'published', 'gnar', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 세 번째 표식을 내주지 않는다 · 분노가 높으면 벽에서 떨어진다 · 변신이 끝난 직후 압박한다

## 부메랑 회수 지점을 먼저 막는다

**나르는 돌아오는 `부메랑 던지기(Q)`를 받으면 재사용 대기시간이 줄어든다.**[* [나르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=120)] 투사체만 피하고 끝내지 말고 나르와 귀환 경로 사이에 압박을 넣어 쉽게 받지 못하게 한다. 받으러 옆으로 움직이는 순간이 이동 방향을 읽고 접근할 기회다.

## `W` 세 번째 적중 전에 거리를 끊는다

**미니 나르는 기본 공격과 기술 세 번째 적중으로 추가 피해와 이동 속도를 얻는다.** 표식이 두 번 쌓였다면 막타 하나를 포기하고 사거리 밖으로 나간다. 세 번째를 허용한 뒤에는 빨라진 나르를 직선으로 쫓지 말고 효과가 끝날 때까지 미니언 뒤에서 기다린다.

## 분노가 높을 때 벽과 미니언을 함께 피한다

**분노가 가득 차면 메가 나르로 변하며 `폴짝(E)`은 유닛을 밟아 더 멀리 들어올 수 있다.** 내 뒤의 미니언을 발판으로 주지 않도록 옆으로 서고 벽에서 떨어진다. 변신 직전 나르에게 이동기를 쓰면 착지와 궁극기를 연달아 맞기 쉽다.

## 메가 나르가 끝난 직후 되받아친다

**메가 나르는 강한 제어를 갖지만 변신이 끝나면 다시 사거리가 짧고 몸이 약한 미니 나르로 돌아온다.** 돌덩이와 `쿵쾅(W)`을 피하며 시간을 보낸 뒤 종료 직후 교환을 연다. 다음 분노가 쌓이기 전에 라인 주도권을 되찾는 것이 중요하다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-gnar' AND kind = 'matchup' AND champion_slug = 'gnar'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-gnar');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-gnar-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-gnar' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 세 번째 표식을 내주지 않는다 · 분노가 높으면 벽에서 떨어진다 · 변신이 끝난 직후 압박한다

## 부메랑 회수 지점을 먼저 막는다

**나르는 돌아오는 `부메랑 던지기(Q)`를 받으면 재사용 대기시간이 줄어든다.**[* [나르 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=120)] 투사체만 피하고 끝내지 말고 나르와 귀환 경로 사이에 압박을 넣어 쉽게 받지 못하게 한다. 받으러 옆으로 움직이는 순간이 이동 방향을 읽고 접근할 기회다.

## `W` 세 번째 적중 전에 거리를 끊는다

**미니 나르는 기본 공격과 기술 세 번째 적중으로 추가 피해와 이동 속도를 얻는다.** 표식이 두 번 쌓였다면 막타 하나를 포기하고 사거리 밖으로 나간다. 세 번째를 허용한 뒤에는 빨라진 나르를 직선으로 쫓지 말고 효과가 끝날 때까지 미니언 뒤에서 기다린다.

## 분노가 높을 때 벽과 미니언을 함께 피한다

**분노가 가득 차면 메가 나르로 변하며 `폴짝(E)`은 유닛을 밟아 더 멀리 들어올 수 있다.** 내 뒤의 미니언을 발판으로 주지 않도록 옆으로 서고 벽에서 떨어진다. 변신 직전 나르에게 이동기를 쓰면 착지와 궁극기를 연달아 맞기 쉽다.

## 메가 나르가 끝난 직후 되받아친다

**메가 나르는 강한 제어를 갖지만 변신이 끝나면 다시 사거리가 짧고 몸이 약한 미니 나르로 돌아온다.** 돌덩이와 `쿵쾅(W)`을 피하며 시간을 보낸 뒤 종료 직후 교환을 연다. 다음 분노가 쌓이기 전에 라인 주도권을 되찾는 것이 중요하다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-gnar-20260914');

-- 올라프 챔피언 위키 (922자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-olaf-20260914', 'article', '올라프', '올라프', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 도끼를 주울 경로로 던진다 · 낮은 체력의 힘을 보호막으로 지킨다 · `R` 동안 계속 적중해 시간을 늘린다

[[분류:탑]] [[분류:딜탱]]

## 도끼의 착지점이 다음 발걸음이다

**`역류(Q)`는 도끼를 다시 주우면 재사용 대기시간을 크게 돌려받으므로 적중보다 착지 경로가 중요하다.**[* [올라프 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=47)] 상대 뒤쪽으로 던져 둔화를 건 뒤 도끼를 향해 걸으며 다음 투척을 준비한다. 너무 멀리 던져 위험한 위치까지 들어가야 한다면 짧게 던져 회수와 퇴로를 함께 잡는다.

## 낮은 체력을 무조건 위험으로 보지 않는다

**올라프는 체력을 잃을수록 공격 속도와 생명력 흡수가 커지므로 낮은 체력에서도 교환을 뒤집을 수 있다.** 한 번에 처치할 수 없다면 미니언을 공격할 공간을 남기지 않고, `버티기(W)` 보호막이 필요한 순간까지 피해를 계산한다. 보호막은 큰 공격 직전에 써 강화된 공격 속도로 회복 시간을 번다.

## 고정 피해와 기본 공격을 번갈아 넣는다

**`무모한 강타(E)`는 고정 피해를 주고 기본 공격으로 재사용 대기시간을 줄일 수 있다.** 기술만 기다리지 말고 둔화된 대상에게 기본 공격을 이어 다음 `E`를 앞당긴다. 대상을 처치하면 소모 체력을 돌려받으므로 미니언 막타와 챔피언 압박이 겹치는 순간을 활용한다.

## 라그나로크는 제어를 맞은 뒤에도 쓸 수 있다

**`라그나로크(R)`는 방해 효과를 정화하고 면역을 주며, 기본 공격이나 `E`로 챔피언을 맞히면 지속시간이 늘어난다.** 너무 일찍 켜고 걸어가며 시간을 버리지 말고 핵심 제어가 들어온 순간 해제한다. 활성 중에는 가장 가까운 적을 계속 적중해 면역 시간을 유지한다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-olaf-20260914' OR (kind = 'article' AND title_key = '올라프'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-olaf-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-olaf-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 도끼를 주울 경로로 던진다 · 낮은 체력의 힘을 보호막으로 지킨다 · `R` 동안 계속 적중해 시간을 늘린다

[[분류:탑]] [[분류:딜탱]]

## 도끼의 착지점이 다음 발걸음이다

**`역류(Q)`는 도끼를 다시 주우면 재사용 대기시간을 크게 돌려받으므로 적중보다 착지 경로가 중요하다.**[* [올라프 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=47)] 상대 뒤쪽으로 던져 둔화를 건 뒤 도끼를 향해 걸으며 다음 투척을 준비한다. 너무 멀리 던져 위험한 위치까지 들어가야 한다면 짧게 던져 회수와 퇴로를 함께 잡는다.

## 낮은 체력을 무조건 위험으로 보지 않는다

**올라프는 체력을 잃을수록 공격 속도와 생명력 흡수가 커지므로 낮은 체력에서도 교환을 뒤집을 수 있다.** 한 번에 처치할 수 없다면 미니언을 공격할 공간을 남기지 않고, `버티기(W)` 보호막이 필요한 순간까지 피해를 계산한다. 보호막은 큰 공격 직전에 써 강화된 공격 속도로 회복 시간을 번다.

## 고정 피해와 기본 공격을 번갈아 넣는다

**`무모한 강타(E)`는 고정 피해를 주고 기본 공격으로 재사용 대기시간을 줄일 수 있다.** 기술만 기다리지 말고 둔화된 대상에게 기본 공격을 이어 다음 `E`를 앞당긴다. 대상을 처치하면 소모 체력을 돌려받으므로 미니언 막타와 챔피언 압박이 겹치는 순간을 활용한다.

## 라그나로크는 제어를 맞은 뒤에도 쓸 수 있다

**`라그나로크(R)`는 방해 효과를 정화하고 면역을 주며, 기본 공격이나 `E`로 챔피언을 맞히면 지속시간이 늘어난다.** 너무 일찍 켜고 걸어가며 시간을 버리지 말고 핵심 제어가 들어온 순간 해제한다. 활성 중에는 가장 가까운 적을 계속 적중해 면역 시간을 유지한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-olaf-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-olaf-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-olaf-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-olaf-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-olaf-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-olaf-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-olaf-20260914' AND target_key = '분류:딜탱');

-- olaf 상대법 (799자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-olaf', 'matchup', NULL, NULL, 'published', 'olaf', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 도끼 착지점에서 멀어진다 · 낮은 체력에 근접전을 늘리지 않는다 · `R` 동안 적중을 내주지 않는다

## 도끼보다 착지 지점을 피한다

**올라프는 `역류(Q)` 도끼를 주우면 다시 빠르게 던질 수 있다.**[* [올라프 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=47)] 첫 투사체를 피한 뒤 도끼가 떨어진 방향과 반대로 움직여 회수를 어렵게 한다. 맞았더라도 도끼 너머로 도망치지 말고 옆으로 빠져 올라프가 추격과 회수 중 하나를 고르게 한다.

## 체력이 낮을수록 짧게 끊는다

**올라프는 잃은 체력에 비례해 공격 속도와 생명력 흡수가 늘어난다.** 서로 체력이 낮다고 기본 공격 싸움을 계속하면 더 빠르게 회복하며 역전한다. 확실한 마무리가 없다면 사거리를 끊고, 미니언을 공격해 회복할 공간도 주지 않는다.

## 보호막에 큰 공격을 쓰지 않는다

**`버티기(W)`는 공격 속도와 보호막을 함께 주므로 켜진 순간 맞교환 효율이 높다.** 보호막이 보이면 이동기로 거리를 벌리고 끝난 뒤 다시 공격한다. `무모한 강타(E)`는 고정 피해라 방어 수치만 믿고 오래 버티지 않는다.

## 궁극기 동안에는 제어보다 거리다

**`라그나로크(R)` 중 올라프는 이동 방해에 면역이고 챔피언을 공격하면 지속시간을 늘린다.** 제어 기술을 연달아 낭비하지 말고 벽 넘기와 이동기로 적중 자체를 거부한다. 면역이 끝난 뒤 남겨 둔 제어를 사용하고, 아군끼리 가까이 서서 다음 대상을 내주지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-olaf' AND kind = 'matchup' AND champion_slug = 'olaf'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-olaf');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-olaf-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-olaf' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 도끼 착지점에서 멀어진다 · 낮은 체력에 근접전을 늘리지 않는다 · `R` 동안 적중을 내주지 않는다

## 도끼보다 착지 지점을 피한다

**올라프는 `역류(Q)` 도끼를 주우면 다시 빠르게 던질 수 있다.**[* [올라프 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=47)] 첫 투사체를 피한 뒤 도끼가 떨어진 방향과 반대로 움직여 회수를 어렵게 한다. 맞았더라도 도끼 너머로 도망치지 말고 옆으로 빠져 올라프가 추격과 회수 중 하나를 고르게 한다.

## 체력이 낮을수록 짧게 끊는다

**올라프는 잃은 체력에 비례해 공격 속도와 생명력 흡수가 늘어난다.** 서로 체력이 낮다고 기본 공격 싸움을 계속하면 더 빠르게 회복하며 역전한다. 확실한 마무리가 없다면 사거리를 끊고, 미니언을 공격해 회복할 공간도 주지 않는다.

## 보호막에 큰 공격을 쓰지 않는다

**`버티기(W)`는 공격 속도와 보호막을 함께 주므로 켜진 순간 맞교환 효율이 높다.** 보호막이 보이면 이동기로 거리를 벌리고 끝난 뒤 다시 공격한다. `무모한 강타(E)`는 고정 피해라 방어 수치만 믿고 오래 버티지 않는다.

## 궁극기 동안에는 제어보다 거리다

**`라그나로크(R)` 중 올라프는 이동 방해에 면역이고 챔피언을 공격하면 지속시간을 늘린다.** 제어 기술을 연달아 낭비하지 말고 벽 넘기와 이동기로 적중 자체를 거부한다. 면역이 끝난 뒤 남겨 둔 제어를 사용하고, 아군끼리 가까이 서서 다음 대상을 내주지 않는다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-olaf-20260914');

-- 일라오이 챔피언 위키 (926자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-top-bruiser-remaining-champion-illaoi-20260914', 'article', '일라오이', '일라오이', 'published', NULL, '# 탑 라인 실전 운용

> **한눈에 보기** — 촉수가 있는 구역에서 싸운다 · `E` 영혼을 먼저 뽑는다 · `R` 뒤에는 이동보다 `W` 적중을 반복한다

[[분류:탑]] [[분류:딜탱]]

## 촉수 사이에 전투 구역을 만든다

**일라오이의 촉수는 공격할 때 피해와 회복을 함께 만들므로 벽 근처의 배치가 교환의 기반이다.**[* [일라오이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=128)] 촉수 하나만 있는 곳에서 억지로 싸우기보다 웨이브가 오는 길에 여러 촉수가 닿는 구역을 만든다. 상대가 촉수를 지우러 다가오면 `영혼의 시험(E)` 투사체가 미니언에 막히지 않는 각도를 잡는다.

## 영혼을 뽑은 뒤 본체와 겹쳐 때린다

**`영혼의 시험(E)`은 분리한 영혼이 받은 피해 일부를 원래 대상에게 전달한다.** 영혼만 바라보고 서 있기보다 상대 본체가 함께 맞는 위치에서 `촉수 강타(Q)`와 촉수 공격을 겹친다. 대상이 범위를 벗어나면 숙주가 되어 촉수를 피해야 하므로 무리한 추격 없이 라인 주도권을 얻는다.

## `W`로 원하는 촉수의 공격을 부른다

**`혹독한 가르침(W)`은 대상에게 도약하고 근처 촉수도 같은 대상을 공격하게 한다.** 촉수가 없는 곳에서 단순 접근기로 쓰면 반격을 그대로 맞는다. 영혼이나 챔피언이 여러 촉수 범위에 겹친 순간에 사용하고, 후려치기 선을 피하려는 방향을 보고 다음 `Q`를 겨눈다.

## 궁극기 뒤에는 생성된 촉수를 믿고 버틴다

**`믿음의 도약(R)`은 맞힌 챔피언 수만큼 촉수를 만들고 잠시 `W` 재사용을 크게 줄인다.** 여러 명이 들어온 순간 중앙에서 사용한 뒤 한 대상에게 `W`를 반복해 촉수 공격과 회복을 이어 간다. 궁극기 직후 바깥으로 걸어 나가면 새 촉수의 범위를 스스로 버리게 된다.', 1, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-illaoi-20260914' OR (kind = 'article' AND title_key = '일라오이'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-champion-illaoi-20260914', id, NULL, 0, general, '탑 딜탱 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-top-bruiser-remaining-champion-illaoi-20260914' AND revision = 1 AND general = '# 탑 라인 실전 운용

> **한눈에 보기** — 촉수가 있는 구역에서 싸운다 · `E` 영혼을 먼저 뽑는다 · `R` 뒤에는 이동보다 `W` 적중을 반복한다

[[분류:탑]] [[분류:딜탱]]

## 촉수 사이에 전투 구역을 만든다

**일라오이의 촉수는 공격할 때 피해와 회복을 함께 만들므로 벽 근처의 배치가 교환의 기반이다.**[* [일라오이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=128)] 촉수 하나만 있는 곳에서 억지로 싸우기보다 웨이브가 오는 길에 여러 촉수가 닿는 구역을 만든다. 상대가 촉수를 지우러 다가오면 `영혼의 시험(E)` 투사체가 미니언에 막히지 않는 각도를 잡는다.

## 영혼을 뽑은 뒤 본체와 겹쳐 때린다

**`영혼의 시험(E)`은 분리한 영혼이 받은 피해 일부를 원래 대상에게 전달한다.** 영혼만 바라보고 서 있기보다 상대 본체가 함께 맞는 위치에서 `촉수 강타(Q)`와 촉수 공격을 겹친다. 대상이 범위를 벗어나면 숙주가 되어 촉수를 피해야 하므로 무리한 추격 없이 라인 주도권을 얻는다.

## `W`로 원하는 촉수의 공격을 부른다

**`혹독한 가르침(W)`은 대상에게 도약하고 근처 촉수도 같은 대상을 공격하게 한다.** 촉수가 없는 곳에서 단순 접근기로 쓰면 반격을 그대로 맞는다. 영혼이나 챔피언이 여러 촉수 범위에 겹친 순간에 사용하고, 후려치기 선을 피하려는 방향을 보고 다음 `Q`를 겨눈다.

## 궁극기 뒤에는 생성된 촉수를 믿고 버틴다

**`믿음의 도약(R)`은 맞힌 챔피언 수만큼 촉수를 만들고 잠시 `W` 재사용을 크게 줄인다.** 여러 명이 들어온 순간 중앙에서 사용한 뒤 한 대상에게 `W`를 반복해 촉수 공격과 회복을 이어 간다. 궁극기 직후 바깥으로 걸어 나가면 새 촉수의 범위를 스스로 버리게 된다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-champion-illaoi-20260914');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-illaoi-20260914', NULL, '분류:탑', '분류:탑' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-illaoi-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-illaoi-20260914' AND target_key = '분류:탑');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-top-bruiser-remaining-champion-illaoi-20260914', NULL, '분류:딜탱', '분류:딜탱' FROM wiki_docs WHERE id = 'doc-top-bruiser-remaining-champion-illaoi-20260914'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-top-bruiser-remaining-champion-illaoi-20260914' AND target_key = '분류:딜탱');

-- illaoi 상대법 (850자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-illaoi', 'matchup', NULL, NULL, 'published', 'illaoi', '', 0, '16.17.1', 'guarded', '2026-09-14T14:30:00.000Z', '2026-09-14T14:30:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 탑 라인 상대법

> **한눈에 보기** — 촉수를 먼저 지운다 · 미니언 뒤에서 `E`를 피한다 · 궁극기를 쓰면 범위 밖으로 나간다

## 싸우기 전에 촉수 수를 줄인다

**일라오이는 주변 촉수의 공격으로 피해와 회복을 함께 얻으므로 챔피언만 보고 들어가면 교환을 진다.**[* [일라오이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=128)] 새 웨이브가 오기 전 안전한 촉수부터 지우고, 여러 촉수가 겹치는 벽 사이에서는 싸우지 않는다. 촉수를 치는 동안 일라오이의 `E` 선에 몸이 노출되지 않게 미니언을 둔다.

## 영혼의 시험이 빗나간 뒤 교환한다

**`영혼의 시험(E)`이 적중하면 영혼과 본체를 동시에 압박받고 범위를 벗어나도 촉수가 따라온다.** 미니언 뒤에서 투사체를 옆으로 피하고, 빗나간 직후 일라오이가 다음 영혼을 뽑기 전에 짧게 공격한다. 맞았다면 영혼 옆에서 끝까지 싸우기보다 촉수 선을 보며 범위 밖으로 빠진다.

## `W` 대상에서 옆으로 벗어난다

**`혹독한 가르침(W)`이 적중하면 근처 촉수도 같은 대상을 공격한다.** 도약 자체보다 뒤따르는 후려치기 선을 옆으로 피하고, 일라오이 발밑에 오래 머물지 않는다. 촉수가 없는 쪽으로 유도하면 `W`의 지속 압박을 크게 줄일 수 있다.

## 궁극기에는 맞서지 말고 공간을 버린다

**`믿음의 도약(R)`은 맞힌 챔피언 수만큼 촉수를 만들고 `W`를 빠르게 반복하게 한다.** 여러 명이 한꺼번에 들어가 촉수를 늘려 주지 말고, 사용 즉시 서로 다른 방향으로 범위를 벗어난다. 생성된 촉수가 사라지거나 일라오이가 그 구역을 떠난 뒤 다시 싸운다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-14T14:30:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-illaoi' AND kind = 'matchup' AND champion_slug = 'illaoi'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-illaoi');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-top-bruiser-remaining-matchup-illaoi-20260914', id, NULL, 0, general, '탑 딜탱 상대법 작성', 'accepted', 'user-system', '2026-09-14T14:30:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-illaoi' AND revision = 1 AND general = '# 탑 라인 상대법

> **한눈에 보기** — 촉수를 먼저 지운다 · 미니언 뒤에서 `E`를 피한다 · 궁극기를 쓰면 범위 밖으로 나간다

## 싸우기 전에 촉수 수를 줄인다

**일라오이는 주변 촉수의 공격으로 피해와 회복을 함께 얻으므로 챔피언만 보고 들어가면 교환을 진다.**[* [일라오이 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=128)] 새 웨이브가 오기 전 안전한 촉수부터 지우고, 여러 촉수가 겹치는 벽 사이에서는 싸우지 않는다. 촉수를 치는 동안 일라오이의 `E` 선에 몸이 노출되지 않게 미니언을 둔다.

## 영혼의 시험이 빗나간 뒤 교환한다

**`영혼의 시험(E)`이 적중하면 영혼과 본체를 동시에 압박받고 범위를 벗어나도 촉수가 따라온다.** 미니언 뒤에서 투사체를 옆으로 피하고, 빗나간 직후 일라오이가 다음 영혼을 뽑기 전에 짧게 공격한다. 맞았다면 영혼 옆에서 끝까지 싸우기보다 촉수 선을 보며 범위 밖으로 빠진다.

## `W` 대상에서 옆으로 벗어난다

**`혹독한 가르침(W)`이 적중하면 근처 촉수도 같은 대상을 공격한다.** 도약 자체보다 뒤따르는 후려치기 선을 옆으로 피하고, 일라오이 발밑에 오래 머물지 않는다. 촉수가 없는 쪽으로 유도하면 `W`의 지속 압박을 크게 줄일 수 있다.

## 궁극기에는 맞서지 말고 공간을 버린다

**`믿음의 도약(R)`은 맞힌 챔피언 수만큼 촉수를 만들고 `W`를 빠르게 반복하게 한다.** 여러 명이 한꺼번에 들어가 촉수를 늘려 주지 말고, 사용 즉시 서로 다른 방향으로 범위를 벗어난다. 생성된 촉수가 사라지거나 일라오이가 그 구역을 떠난 뒤 다시 싸운다.'
AND updated_at = '2026-09-14T14:30:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-top-bruiser-remaining-matchup-illaoi-20260914');
