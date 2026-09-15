-- scripts/seed-support-wtf-wiki.ts가 생성. 서폿 Wtf?! 일반 위키 3개와 공통 상대법 3개.
-- 기존 공유 문서와 사용자 편집은 덮어쓰지 않으며 같은 SQL을 다시 실행해도 이력이 늘지 않는다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)
VALUES ('user-system', 'system', 'seed', '깨남.COM', NULL, 'admin', '2026-09-15T10:56:39.000Z');

-- 모르가나 챔피언 위키 (896자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-wtf-champion-morgana-20260915', 'article', '모르가나', '모르가나', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 미니언 사이로 `Q` 각을 만든다 · `E`는 제어가 닿기 직전에 건다 · `R` 사슬이 끊기지 않을 거리를 유지한다

[[분류:서폿]] [[분류:Wtf?!]]

## 어둠의 속박은 이동할 자리를 먼저 막는다

**`어둠의 속박(Q)`은 처음 맞은 적을 오래 묶으므로 현재 위치보다 다음 발걸음을 겨냥한다.**[* [모르가나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=42)] 미니언에 막히는 투사체라서 옆으로 각을 넓히거나 아군이 미니언을 정리한 순간에 던진다. 맞히지 못했을 때는 앞으로 더 나가지 않고 다음 재사용 시간을 기다린다.

## 고통의 그림자는 속박 뒤에 겹친다

**`고통의 그림자(W)`는 대상의 잃은 체력에 따라 피해가 커지므로 혼자 먼저 깔기보다 `Q`나 아군 제어 뒤에 둔다.** 적이 머무를 시간이 보장된 자리에 사용하고, 이동 경로를 좁혀 다음 속박 각까지 만든다. 단순 견제로 남발해 라인 위치를 뜻하지 않게 바꾸지 않는다.

## 칠흑의 방패는 제어가 닿는 순간을 막는다

**`칠흑의 방패(E)`는 마법 피해를 흡수하는 동안 이동 불가 효과도 차단한다.** 교전 시작부터 습관적으로 두르지 말고 적의 핵심 제어 투사체나 진입 동작을 확인한 뒤 대상에게 건다. 방패가 먼저 깨지면 제어 면역도 사라지므로 남은 흡수량을 믿고 무리하지 않는다.

## 영혼의 족쇄는 퇴로를 따라 걷는다

**`영혼의 족쇄(R)`는 가까운 적과 사슬을 잇고 끝까지 유지되면 기절시킨다.** 여러 명에게 걸었다는 이유로 중앙에 멈추지 말고 가장 중요한 대상의 퇴로를 따라 이동한다. 사슬이 끊길 것 같다면 전부 붙잡으려 하기보다 한 명의 기절을 확정할 위치를 고른다.', 1, '16.17.1', 'guarded', '2026-09-15T10:56:39.000Z', '2026-09-15T10:56:39.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-wtf-champion-morgana-20260915' OR (kind = 'article' AND title_key = '모르가나'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-wtf-champion-morgana-20260915', id, NULL, 0, general, '서폿 Wtf?! 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:56:39.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-wtf-champion-morgana-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 미니언 사이로 `Q` 각을 만든다 · `E`는 제어가 닿기 직전에 건다 · `R` 사슬이 끊기지 않을 거리를 유지한다

[[분류:서폿]] [[분류:Wtf?!]]

## 어둠의 속박은 이동할 자리를 먼저 막는다

**`어둠의 속박(Q)`은 처음 맞은 적을 오래 묶으므로 현재 위치보다 다음 발걸음을 겨냥한다.**[* [모르가나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=42)] 미니언에 막히는 투사체라서 옆으로 각을 넓히거나 아군이 미니언을 정리한 순간에 던진다. 맞히지 못했을 때는 앞으로 더 나가지 않고 다음 재사용 시간을 기다린다.

## 고통의 그림자는 속박 뒤에 겹친다

**`고통의 그림자(W)`는 대상의 잃은 체력에 따라 피해가 커지므로 혼자 먼저 깔기보다 `Q`나 아군 제어 뒤에 둔다.** 적이 머무를 시간이 보장된 자리에 사용하고, 이동 경로를 좁혀 다음 속박 각까지 만든다. 단순 견제로 남발해 라인 위치를 뜻하지 않게 바꾸지 않는다.

## 칠흑의 방패는 제어가 닿는 순간을 막는다

**`칠흑의 방패(E)`는 마법 피해를 흡수하는 동안 이동 불가 효과도 차단한다.** 교전 시작부터 습관적으로 두르지 말고 적의 핵심 제어 투사체나 진입 동작을 확인한 뒤 대상에게 건다. 방패가 먼저 깨지면 제어 면역도 사라지므로 남은 흡수량을 믿고 무리하지 않는다.

## 영혼의 족쇄는 퇴로를 따라 걷는다

**`영혼의 족쇄(R)`는 가까운 적과 사슬을 잇고 끝까지 유지되면 기절시킨다.** 여러 명에게 걸었다는 이유로 중앙에 멈추지 말고 가장 중요한 대상의 퇴로를 따라 이동한다. 사슬이 끊길 것 같다면 전부 붙잡으려 하기보다 한 명의 기절을 확정할 위치를 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-wtf-champion-morgana-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-wtf-champion-morgana-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-wtf-champion-morgana-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-wtf-champion-morgana-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-wtf-champion-morgana-20260915', NULL, '분류:wtf?!', '분류:Wtf?!' FROM wiki_docs WHERE id = 'doc-support-wtf-champion-morgana-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-wtf-champion-morgana-20260915' AND target_key = '분류:wtf?!');

-- 질리언 챔피언 위키 (930자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-wtf-champion-zilean-20260915', 'article', '질리언', '질리언', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 첫 `Q`가 붙은 자리에 두 번째 폭탄을 겹친다 · `W` 뒤에 무엇을 반복할지 먼저 정한다 · `R`은 치명타 전에 건다

[[분류:서폿]] [[분류:Wtf?!]]

## 시한 폭탄 두 개로 기절 지점을 만든다

**`시한 폭탄(Q)`은 같은 대상에게 두 번째 폭탄을 붙이면 첫 폭탄이 즉시 터지며 주변을 기절시킨다.**[* [질리언 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=76)] 적이 직접 맞지 않아도 미니언이나 아군에게 붙은 폭탄이 이동하는 범위를 계산한다. 첫 폭탄을 던진 뒤에는 대상의 이동을 보고 두 번째 투척 지점을 보정한다.

## 되감기 전에 반복할 기술을 정한다

**`되감기(W)`는 기본 기술의 재사용 대기시간을 줄이므로 누르기 전에 두 번째 `Q`와 두 번째 `E` 중 무엇이 필요한지 결정한다.** 공격할 때는 `Q-W-Q`의 기절을, 추격이나 후퇴에서는 `E-W-E`의 긴 속도 차이를 노린다. 목적 없이 먼저 사용해 필요한 기술을 되돌리지 못하는 일을 피한다.

## 시간 왜곡은 가장 급한 이동을 바꾼다

**`시간 왜곡(E)`은 아군에게는 이동 속도를 주고 적에게는 둔화를 건다.** 멀리 있는 적을 무리하게 늦추기보다 위험한 아군의 탈출을 돕거나 확실히 닿는 적의 발을 묶는다. 두 번 쓸 수 있을 때는 아군 가속으로 거리를 좁힌 뒤 적 둔화로 이어 간다.

## 시간 역행은 죽을 대상을 미리 고른다

**`시간 역행(R)`은 표식이 유지되는 동안 치명적인 피해를 받은 아군을 되살린다.** 체력이 모두 사라진 뒤에는 걸 수 없으므로 집중 공격이 시작되는 순간 대상에게 사용한다. 표식이 걸린 아군이 위험에서 너무 멀리 벗어나면 적이 기다릴 수 있으니, 교전을 계속할지 함께 빠질지 즉시 맞춘다.', 1, '16.17.1', 'guarded', '2026-09-15T10:56:39.000Z', '2026-09-15T10:56:39.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-wtf-champion-zilean-20260915' OR (kind = 'article' AND title_key = '질리언'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-wtf-champion-zilean-20260915', id, NULL, 0, general, '서폿 Wtf?! 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:56:39.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-wtf-champion-zilean-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 첫 `Q`가 붙은 자리에 두 번째 폭탄을 겹친다 · `W` 뒤에 무엇을 반복할지 먼저 정한다 · `R`은 치명타 전에 건다

[[분류:서폿]] [[분류:Wtf?!]]

## 시한 폭탄 두 개로 기절 지점을 만든다

**`시한 폭탄(Q)`은 같은 대상에게 두 번째 폭탄을 붙이면 첫 폭탄이 즉시 터지며 주변을 기절시킨다.**[* [질리언 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=76)] 적이 직접 맞지 않아도 미니언이나 아군에게 붙은 폭탄이 이동하는 범위를 계산한다. 첫 폭탄을 던진 뒤에는 대상의 이동을 보고 두 번째 투척 지점을 보정한다.

## 되감기 전에 반복할 기술을 정한다

**`되감기(W)`는 기본 기술의 재사용 대기시간을 줄이므로 누르기 전에 두 번째 `Q`와 두 번째 `E` 중 무엇이 필요한지 결정한다.** 공격할 때는 `Q-W-Q`의 기절을, 추격이나 후퇴에서는 `E-W-E`의 긴 속도 차이를 노린다. 목적 없이 먼저 사용해 필요한 기술을 되돌리지 못하는 일을 피한다.

## 시간 왜곡은 가장 급한 이동을 바꾼다

**`시간 왜곡(E)`은 아군에게는 이동 속도를 주고 적에게는 둔화를 건다.** 멀리 있는 적을 무리하게 늦추기보다 위험한 아군의 탈출을 돕거나 확실히 닿는 적의 발을 묶는다. 두 번 쓸 수 있을 때는 아군 가속으로 거리를 좁힌 뒤 적 둔화로 이어 간다.

## 시간 역행은 죽을 대상을 미리 고른다

**`시간 역행(R)`은 표식이 유지되는 동안 치명적인 피해를 받은 아군을 되살린다.** 체력이 모두 사라진 뒤에는 걸 수 없으므로 집중 공격이 시작되는 순간 대상에게 사용한다. 표식이 걸린 아군이 위험에서 너무 멀리 벗어나면 적이 기다릴 수 있으니, 교전을 계속할지 함께 빠질지 즉시 맞춘다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-wtf-champion-zilean-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-wtf-champion-zilean-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-wtf-champion-zilean-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-wtf-champion-zilean-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-wtf-champion-zilean-20260915', NULL, '분류:wtf?!', '분류:Wtf?!' FROM wiki_docs WHERE id = 'doc-support-wtf-champion-zilean-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-wtf-champion-zilean-20260915' AND target_key = '분류:wtf?!');

-- 바드 챔피언 위키 (906자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-support-wtf-champion-bard-20260915', 'article', '바드', '바드', 'published', NULL, '# 서폿 실전 운용

> **한눈에 보기** — 종은 복귀 동선에서 줍는다 · `Q`의 두 번째 충돌 지점을 본다 · `R` 종료 시점에 다음 행동을 맞춘다

[[분류:서폿]] [[분류:Wtf?!]]

## 종은 라인을 버리지 않는 동선으로 줍는다

**바드의 종은 이동에 힘을 보태지만, 모든 종을 즉시 줍는 것보다 아군이 안전한 시간을 고르는 일이 먼저다.**[* [바드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=124)] 시야를 놓거나 라인으로 복귀하는 길에 가까운 종을 연결해 먹는다. 떠나기 전에는 아군에게 움직임을 알리고 상대의 진입 기술이 남았는지 확인한다.

## 우주의 결속은 두 번째 충돌을 설계한다

**`우주의 결속(Q)`은 첫 대상 뒤에 다른 대상이나 벽이 있으면 기절을 만든다.** 적 하나만 바라보지 말고 그 뒤의 미니언, 챔피언, 지형을 한 줄로 맞춘다. 벽 가까이에서 각이 나오지 않으면 먼저 둔화를 묻힌 뒤 위치를 바꿔 두 번째 충돌을 만든다.

## 수호자의 성소는 싸우기 전에 키운다

**`수호자의 성소(W)`는 바닥에서 시간이 지나면 회복량이 커지고, 밟은 아군에게 잠시 이동 속도도 준다.** 교전이 열린 뒤 급히 하나만 놓기보다 안전한 후방에 미리 여러 개를 준비한다. 당장 구해야 하는 아군에게는 완성될 때까지 기다리지 말고 즉시 사용한다.

## 차원문과 소용돌이의 끝을 준비한다

**`신비한 차원문(E)`은 아군과 적 모두 사용할 수 있고, `운명의 소용돌이(R)`는 범위 안의 유닛과 포탑을 정지시킨다.** 차원문은 출구를 아군이 먼저 점유할 수 있을 때 열고 추격자가 따라올 가능성까지 계산한다. 소용돌이를 맞힌 뒤에는 정지가 풀리는 순간에 `Q`와 아군 제어가 겹치도록 시간을 맞춘다.', 1, '16.17.1', 'guarded', '2026-09-15T10:56:39.000Z', '2026-09-15T10:56:39.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-support-wtf-champion-bard-20260915' OR (kind = 'article' AND title_key = '바드'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-wtf-champion-bard-20260915', id, NULL, 0, general, '서폿 Wtf?! 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T10:56:39.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-support-wtf-champion-bard-20260915' AND revision = 1 AND general = '# 서폿 실전 운용

> **한눈에 보기** — 종은 복귀 동선에서 줍는다 · `Q`의 두 번째 충돌 지점을 본다 · `R` 종료 시점에 다음 행동을 맞춘다

[[분류:서폿]] [[분류:Wtf?!]]

## 종은 라인을 버리지 않는 동선으로 줍는다

**바드의 종은 이동에 힘을 보태지만, 모든 종을 즉시 줍는 것보다 아군이 안전한 시간을 고르는 일이 먼저다.**[* [바드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=124)] 시야를 놓거나 라인으로 복귀하는 길에 가까운 종을 연결해 먹는다. 떠나기 전에는 아군에게 움직임을 알리고 상대의 진입 기술이 남았는지 확인한다.

## 우주의 결속은 두 번째 충돌을 설계한다

**`우주의 결속(Q)`은 첫 대상 뒤에 다른 대상이나 벽이 있으면 기절을 만든다.** 적 하나만 바라보지 말고 그 뒤의 미니언, 챔피언, 지형을 한 줄로 맞춘다. 벽 가까이에서 각이 나오지 않으면 먼저 둔화를 묻힌 뒤 위치를 바꿔 두 번째 충돌을 만든다.

## 수호자의 성소는 싸우기 전에 키운다

**`수호자의 성소(W)`는 바닥에서 시간이 지나면 회복량이 커지고, 밟은 아군에게 잠시 이동 속도도 준다.** 교전이 열린 뒤 급히 하나만 놓기보다 안전한 후방에 미리 여러 개를 준비한다. 당장 구해야 하는 아군에게는 완성될 때까지 기다리지 말고 즉시 사용한다.

## 차원문과 소용돌이의 끝을 준비한다

**`신비한 차원문(E)`은 아군과 적 모두 사용할 수 있고, `운명의 소용돌이(R)`는 범위 안의 유닛과 포탑을 정지시킨다.** 차원문은 출구를 아군이 먼저 점유할 수 있을 때 열고 추격자가 따라올 가능성까지 계산한다. 소용돌이를 맞힌 뒤에는 정지가 풀리는 순간에 `Q`와 아군 제어가 겹치도록 시간을 맞춘다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-wtf-champion-bard-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-wtf-champion-bard-20260915', NULL, '분류:서폿', '분류:서폿' FROM wiki_docs WHERE id = 'doc-support-wtf-champion-bard-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-wtf-champion-bard-20260915' AND target_key = '분류:서폿');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-support-wtf-champion-bard-20260915', NULL, '분류:wtf?!', '분류:Wtf?!' FROM wiki_docs WHERE id = 'doc-support-wtf-champion-bard-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-support-wtf-champion-bard-20260915' AND target_key = '분류:wtf?!');

-- morgana 상대법 (850자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-morgana', 'matchup', NULL, NULL, 'published', 'morgana', '', 0, '16.17.1', 'guarded', '2026-09-15T10:56:39.000Z', '2026-09-15T10:56:39.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 미니언 뒤에서 `Q`를 끊는다 · `E`가 깨지거나 끝난 뒤 제어한다 · `R` 사슬은 먼저 거리로 끊는다

## 어둠의 속박에 열린 직선을 주지 않는다

**`어둠의 속박(Q)`은 처음 닿은 대상에게 멈추므로 미니언을 사이에 두고 모르가나와 비스듬히 선다.**[* [모르가나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=42)] 미니언이 사라지는 순간과 수풀에서 옆각을 잡는 움직임을 함께 경계한다. 빗나간 뒤에는 다음 속박이 돌아오기 전까지 짧게 압박하고 다시 엄폐물을 잡는다.

## 고통의 그림자 위에 머물지 않는다

**`고통의 그림자(W)`는 체력이 낮을수록 더 아프므로 속박이 풀린 뒤에도 장판에서 곧바로 나온다.** 뒤로만 빠져 장판을 길게 밟지 말고 가장 가까운 가장자리로 이동한다. 모르가나가 라인을 밀기 위해 사용했다면 그동안 직접 견제 수단 하나가 비었다고 판단한다.

## 칠흑의 방패부터 소모한다

**`칠흑의 방패(E)`는 마법 피해를 흡수하는 동안 이동 불가 효과를 막는다.** 방패가 보이면 핵심 제어를 즉시 겹치지 말고 마법 피해로 먼저 깨거나 지속 시간이 끝날 때까지 기다린다. 다른 대상에게 방패가 들어간 순간에는 보호받지 못한 모르가나 쪽도 선택지가 된다.

## 영혼의 족쇄 사슬을 거리로 끊는다

**`영혼의 족쇄(R)`는 연결이 유지되어야 마지막 기절이 발생한다.** 사슬이 생기면 한곳에 뭉쳐 모르가나가 여러 명을 따라가게 하지 말고 서로 다른 방향으로 벌어진다. 가장 가까운 경계로 이동해 연결부터 끊은 뒤, 모르가나가 깊이 들어왔다면 되돌아 공격한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:56:39.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-morgana' AND kind = 'matchup' AND champion_slug = 'morgana'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-morgana');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-wtf-matchup-morgana-20260915', id, NULL, 0, general, '서폿 Wtf?! 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:56:39.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-morgana' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 미니언 뒤에서 `Q`를 끊는다 · `E`가 깨지거나 끝난 뒤 제어한다 · `R` 사슬은 먼저 거리로 끊는다

## 어둠의 속박에 열린 직선을 주지 않는다

**`어둠의 속박(Q)`은 처음 닿은 대상에게 멈추므로 미니언을 사이에 두고 모르가나와 비스듬히 선다.**[* [모르가나 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=42)] 미니언이 사라지는 순간과 수풀에서 옆각을 잡는 움직임을 함께 경계한다. 빗나간 뒤에는 다음 속박이 돌아오기 전까지 짧게 압박하고 다시 엄폐물을 잡는다.

## 고통의 그림자 위에 머물지 않는다

**`고통의 그림자(W)`는 체력이 낮을수록 더 아프므로 속박이 풀린 뒤에도 장판에서 곧바로 나온다.** 뒤로만 빠져 장판을 길게 밟지 말고 가장 가까운 가장자리로 이동한다. 모르가나가 라인을 밀기 위해 사용했다면 그동안 직접 견제 수단 하나가 비었다고 판단한다.

## 칠흑의 방패부터 소모한다

**`칠흑의 방패(E)`는 마법 피해를 흡수하는 동안 이동 불가 효과를 막는다.** 방패가 보이면 핵심 제어를 즉시 겹치지 말고 마법 피해로 먼저 깨거나 지속 시간이 끝날 때까지 기다린다. 다른 대상에게 방패가 들어간 순간에는 보호받지 못한 모르가나 쪽도 선택지가 된다.

## 영혼의 족쇄 사슬을 거리로 끊는다

**`영혼의 족쇄(R)`는 연결이 유지되어야 마지막 기절이 발생한다.** 사슬이 생기면 한곳에 뭉쳐 모르가나가 여러 명을 따라가게 하지 말고 서로 다른 방향으로 벌어진다. 가장 가까운 경계로 이동해 연결부터 끊은 뒤, 모르가나가 깊이 들어왔다면 되돌아 공격한다.'
AND updated_at = '2026-09-15T10:56:39.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-wtf-matchup-morgana-20260915');

-- zilean 상대법 (872자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-zilean', 'matchup', NULL, NULL, 'published', 'zilean', '', 0, '16.17.1', 'guarded', '2026-09-15T10:56:39.000Z', '2026-09-15T10:56:39.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 첫 `Q`가 붙은 대상과 떨어진다 · `W` 뒤의 두 번째 기술을 센다 · `R` 표식이 끝날 때까지 처치를 미룬다

## 시한 폭탄이 붙은 대상에게 모이지 않는다

**`시한 폭탄(Q)`은 유닛에 붙어 폭발하고 같은 대상에 두 번째 폭탄이 붙으면 즉시 터지며 기절시킨다.**[* [질리언 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=76)] 첫 폭탄을 맞은 아군과 거리를 벌려 광역 피해와 두 번째 투척을 함께 피한다. 바닥의 폭탄 근처를 지나야 한다면 다른 유닛보다 자신이 가까워지는 경로도 피한다.

## 되감기 뒤에는 같은 기술을 한 번 더 본다

**`되감기(W)`를 사용하면 질리언의 기본 기술이 빠르게 다시 준비된다.** 첫 `Q`나 `E`를 피했다고 바로 직선으로 추격하지 말고 두 번째 사용까지 확인한다. `Q-W-Q`가 실패한 뒤에는 광역 기절 위협이 줄어드는 짧은 시간을 활용한다.

## 시간 왜곡의 대상에 맞춰 거리를 바꾼다

**`시간 왜곡(E)`은 적을 느리게 하거나 아군을 빠르게 하므로 어느 쪽에 걸렸는지 먼저 본다.** 아군이 둔화되면 서로 붙어 함께 묶이지 말고 보호할 거리만 유지한다. 질리언의 아군이 가속되면 정면으로 달아나기보다 지형을 끼고 접근 경로를 길게 만든다.

## 시간 역행 표식이 끝난 뒤 마무리한다

**`시간 역행(R)` 표식이 있는 대상은 지속 시간 안에 치명적인 피해를 받으면 되살아난다.** 표식이 보이면 가능한 한 공격을 멈추고 다른 적을 압박하거나 퇴로를 막는다. 이미 되살아나기 시작했다면 부활 위치 주변을 무리하게 둘러싸기보다 질리언의 후속 기절을 피할 간격부터 만든다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:56:39.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-zilean' AND kind = 'matchup' AND champion_slug = 'zilean'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-zilean');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-wtf-matchup-zilean-20260915', id, NULL, 0, general, '서폿 Wtf?! 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:56:39.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-zilean' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 첫 `Q`가 붙은 대상과 떨어진다 · `W` 뒤의 두 번째 기술을 센다 · `R` 표식이 끝날 때까지 처치를 미룬다

## 시한 폭탄이 붙은 대상에게 모이지 않는다

**`시한 폭탄(Q)`은 유닛에 붙어 폭발하고 같은 대상에 두 번째 폭탄이 붙으면 즉시 터지며 기절시킨다.**[* [질리언 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=76)] 첫 폭탄을 맞은 아군과 거리를 벌려 광역 피해와 두 번째 투척을 함께 피한다. 바닥의 폭탄 근처를 지나야 한다면 다른 유닛보다 자신이 가까워지는 경로도 피한다.

## 되감기 뒤에는 같은 기술을 한 번 더 본다

**`되감기(W)`를 사용하면 질리언의 기본 기술이 빠르게 다시 준비된다.** 첫 `Q`나 `E`를 피했다고 바로 직선으로 추격하지 말고 두 번째 사용까지 확인한다. `Q-W-Q`가 실패한 뒤에는 광역 기절 위협이 줄어드는 짧은 시간을 활용한다.

## 시간 왜곡의 대상에 맞춰 거리를 바꾼다

**`시간 왜곡(E)`은 적을 느리게 하거나 아군을 빠르게 하므로 어느 쪽에 걸렸는지 먼저 본다.** 아군이 둔화되면 서로 붙어 함께 묶이지 말고 보호할 거리만 유지한다. 질리언의 아군이 가속되면 정면으로 달아나기보다 지형을 끼고 접근 경로를 길게 만든다.

## 시간 역행 표식이 끝난 뒤 마무리한다

**`시간 역행(R)` 표식이 있는 대상은 지속 시간 안에 치명적인 피해를 받으면 되살아난다.** 표식이 보이면 가능한 한 공격을 멈추고 다른 적을 압박하거나 퇴로를 막는다. 이미 되살아나기 시작했다면 부활 위치 주변을 무리하게 둘러싸기보다 질리언의 후속 기절을 피할 간격부터 만든다.'
AND updated_at = '2026-09-15T10:56:39.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-wtf-matchup-zilean-20260915');

-- bard 상대법 (860자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-bard', 'matchup', NULL, NULL, 'published', 'bard', '', 0, '16.17.1', 'guarded', '2026-09-15T10:56:39.000Z', '2026-09-15T10:56:39.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 서폿 상대법

> **한눈에 보기** — 벽과 아군을 등지고 `Q`를 맞지 않는다 · `E` 출구를 먼저 본다 · `R` 정지가 풀리는 순간의 연계를 피한다

## 우주의 결속에 두 번째 충돌을 주지 않는다

**`우주의 결속(Q)`은 첫 대상을 지난 뒤 다른 대상이나 벽에 닿으면 기절시킨다.**[* [바드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=124)] 바드와 일직선에 아군·미니언·벽을 함께 두지 말고 열린 쪽으로 비켜선다. 첫 대상이 된 아군에게서도 떨어져 관통한 투사체의 두 번째 충돌을 막는다.

## 수호자의 성소를 완성되기 전에 지운다

**`수호자의 성소(W)`는 오래 놓일수록 회복량이 커지지만 적이 밟으면 사라진다.** 바드와 상대 원거리 공격의 위치를 확인한 뒤 안전하게 닿는 성소만 미리 지운다. 성소 하나를 없애려다 제어 범위 안으로 깊게 들어가지는 않는다.

## 신비한 차원문은 출구에서 판단한다

**`신비한 차원문(E)`은 바드의 아군뿐 아니라 적도 탈 수 있으므로 입구만 보고 추격 여부를 정하지 않는다.** 출구에 적이 먼저 모여 있거나 `Q`가 벽 기절을 만들 자리라면 따라가지 않는다. 바드가 들어간 뒤에는 출구를 지키면서 다른 적의 합류 경로도 확인한다.

## 운명의 소용돌이 종료 직후를 대비한다

**`운명의 소용돌이(R)`는 범위 안의 챔피언·유닛·포탑을 잠시 정지시키지만 피해를 직접 주지는 않는다.** 바닥의 범위를 보고 옆으로 벗어나고, 맞았다면 정지가 풀릴 때 바드의 `Q`가 날아올 직선을 예상한다. 아군 여러 명이 함께 정지됐을 때는 같은 방향으로 움직여 후속 광역 효과를 겹쳐 맞지 않는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T10:56:39.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-bard' AND kind = 'matchup' AND champion_slug = 'bard'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-bard');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-support-wtf-matchup-bard-20260915', id, NULL, 0, general, '서폿 Wtf?! 상대법 작성', 'accepted', 'user-system', '2026-09-15T10:56:39.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-bard' AND revision = 1 AND general = '# 서폿 상대법

> **한눈에 보기** — 벽과 아군을 등지고 `Q`를 맞지 않는다 · `E` 출구를 먼저 본다 · `R` 정지가 풀리는 순간의 연계를 피한다

## 우주의 결속에 두 번째 충돌을 주지 않는다

**`우주의 결속(Q)`은 첫 대상을 지난 뒤 다른 대상이나 벽에 닿으면 기절시킨다.**[* [바드 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=124)] 바드와 일직선에 아군·미니언·벽을 함께 두지 말고 열린 쪽으로 비켜선다. 첫 대상이 된 아군에게서도 떨어져 관통한 투사체의 두 번째 충돌을 막는다.

## 수호자의 성소를 완성되기 전에 지운다

**`수호자의 성소(W)`는 오래 놓일수록 회복량이 커지지만 적이 밟으면 사라진다.** 바드와 상대 원거리 공격의 위치를 확인한 뒤 안전하게 닿는 성소만 미리 지운다. 성소 하나를 없애려다 제어 범위 안으로 깊게 들어가지는 않는다.

## 신비한 차원문은 출구에서 판단한다

**`신비한 차원문(E)`은 바드의 아군뿐 아니라 적도 탈 수 있으므로 입구만 보고 추격 여부를 정하지 않는다.** 출구에 적이 먼저 모여 있거나 `Q`가 벽 기절을 만들 자리라면 따라가지 않는다. 바드가 들어간 뒤에는 출구를 지키면서 다른 적의 합류 경로도 확인한다.

## 운명의 소용돌이 종료 직후를 대비한다

**`운명의 소용돌이(R)`는 범위 안의 챔피언·유닛·포탑을 잠시 정지시키지만 피해를 직접 주지는 않는다.** 바닥의 범위를 보고 옆으로 벗어나고, 맞았다면 정지가 풀릴 때 바드의 `Q`가 날아올 직선을 예상한다. 아군 여러 명이 함께 정지됐을 때는 같은 방향으로 움직여 후속 광역 효과를 겹쳐 맞지 않는다.'
AND updated_at = '2026-09-15T10:56:39.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-support-wtf-matchup-bard-20260915');
