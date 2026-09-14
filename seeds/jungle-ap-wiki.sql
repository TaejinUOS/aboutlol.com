-- scripts/seed-jungle-ap-wiki.ts가 생성. 정글 AP 일반 위키 11개와 공통 상대법 11개.
-- 기존 공유 문서와 사용자 편집은 덮어쓰지 않으며 같은 SQL을 다시 실행해도 이력이 늘지 않는다.
INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)
VALUES ('user-system', 'system', 'seed', '깨남.COM', NULL, 'admin', '2026-09-15T00:50:00.000Z');

-- 릴리아 챔피언 위키 (897자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ap-champion-lillia-20260915', 'article', '릴리아', '릴리아', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 스킬 적중으로 이동 속도를 유지한다 · Q 가장자리를 맞힌다 · 꿈가루를 묻힌 뒤 자장가를 건다
[[분류:정글]] [[분류:AP]]

## 캠프 사이에도 꿈가루 중첩을 이어 간다
**릴리아는 스킬을 적에게 맞힐 때 이동 속도가 중첩되므로, 캠프를 끊김 없이 연결할수록 정리와 합류가 빨라진다.**[* [릴리아 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=149)] 몬스터를 다음 이동 방향으로 끌며 `Q` 가장자리를 맞히고, 중첩이 끝나기 전에 다음 캠프에 닿는다. 체력 회복도 꿈가루 적중에서 나오므로 무리한 맞딜보다 계속 움직이며 간격을 지킨다.

## 뾰로롱 강타는 원 바깥쪽을 스친다
**Q 가장자리는 추가 고정 피해를 주기 때문에 대상 중심에 붙기보다 원 끝에 걸치는 거리를 반복해야 한다.** 빠른 이동으로 들어갔다가 바로 빠지는 리듬을 만들고, 상대의 직선 기술과 같은 방향으로 달리지 않는다. 여러 명을 동시에 스치면 궁극기로 이어질 꿈가루 대상도 늘어난다.

## 이익 쿵의 중심은 잠든 적에게 맞춘다
**W 중심은 피해가 크지만 동작이 느려 움직이는 적에게 먼저 쓰기 어렵다.** 아군 제어나 감미로운 자장가로 잠든 대상의 깨어날 시점에 맞춰 중심을 찍는다. 일반 교전에서는 가장자리라도 확실히 맞히는 편이 낫고, 깊게 뛰어든 뒤에는 이동 속도로 빠질 길을 남긴다.

## 자장가는 많이 맞히기보다 후속을 본다
**궁극기는 꿈가루가 묻은 적만 졸리게 한 뒤 잠들게 한다.** 데굴데굴 씨앗으로 먼 적에게 표식을 묻히거나 Q로 여러 명을 스친 다음, 아군 피해가 이어질 대상을 골라 사용한다. 잠들기 전에 무작정 기술을 쏟지 말고 깨어날 때 추가 피해를 집중한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-lillia-20260915' OR (kind = 'article' AND title_key = '릴리아'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-champion-lillia-20260915', id, NULL, 0, general, '정글 AP 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ap-champion-lillia-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 스킬 적중으로 이동 속도를 유지한다 · Q 가장자리를 맞힌다 · 꿈가루를 묻힌 뒤 자장가를 건다
[[분류:정글]] [[분류:AP]]

## 캠프 사이에도 꿈가루 중첩을 이어 간다
**릴리아는 스킬을 적에게 맞힐 때 이동 속도가 중첩되므로, 캠프를 끊김 없이 연결할수록 정리와 합류가 빨라진다.**[* [릴리아 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=149)] 몬스터를 다음 이동 방향으로 끌며 `Q` 가장자리를 맞히고, 중첩이 끝나기 전에 다음 캠프에 닿는다. 체력 회복도 꿈가루 적중에서 나오므로 무리한 맞딜보다 계속 움직이며 간격을 지킨다.

## 뾰로롱 강타는 원 바깥쪽을 스친다
**Q 가장자리는 추가 고정 피해를 주기 때문에 대상 중심에 붙기보다 원 끝에 걸치는 거리를 반복해야 한다.** 빠른 이동으로 들어갔다가 바로 빠지는 리듬을 만들고, 상대의 직선 기술과 같은 방향으로 달리지 않는다. 여러 명을 동시에 스치면 궁극기로 이어질 꿈가루 대상도 늘어난다.

## 이익 쿵의 중심은 잠든 적에게 맞춘다
**W 중심은 피해가 크지만 동작이 느려 움직이는 적에게 먼저 쓰기 어렵다.** 아군 제어나 감미로운 자장가로 잠든 대상의 깨어날 시점에 맞춰 중심을 찍는다. 일반 교전에서는 가장자리라도 확실히 맞히는 편이 낫고, 깊게 뛰어든 뒤에는 이동 속도로 빠질 길을 남긴다.

## 자장가는 많이 맞히기보다 후속을 본다
**궁극기는 꿈가루가 묻은 적만 졸리게 한 뒤 잠들게 한다.** 데굴데굴 씨앗으로 먼 적에게 표식을 묻히거나 Q로 여러 명을 스친 다음, 아군 피해가 이어질 대상을 골라 사용한다. 잠들기 전에 무작정 기술을 쏟지 말고 깨어날 때 추가 피해를 집중한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-champion-lillia-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-lillia-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-lillia-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-lillia-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-lillia-20260915', NULL, '분류:ap', '분류:AP' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-lillia-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-lillia-20260915' AND target_key = '분류:ap');

-- 엘리스 챔피언 위키 (868자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ap-champion-elise-20260915', 'article', '엘리스', '엘리스', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 인간 형태로 먼저 묶는다 · 현재 체력과 잃은 체력 피해 순서를 지킨다 · 줄타기로 핵심 기술을 피한다
[[분류:정글]] [[분류:AP]]

## 인간 형태에서 교전의 문을 연다
**엘리스는 인간 형태의 고치로 첫 대상을 기절시킨 뒤 새끼 거미와 신경독을 연결할 때 안전하게 접근한다.**[* [엘리스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=106)] `E`는 처음 맞는 적 유닛에 막히므로 미니언과 챔피언 사이의 각을 먼저 만든다. 빗나가면 거미 형태로 무리하게 뛰지 말고 다음 기회를 기다린다.

## 체력이 높을 때 신경독, 낮을 때 독이빨을 쓴다
**인간 Q는 현재 체력에 비례하고 거미 Q는 잃은 체력에 비례해 강해지므로 형태 전환 순서가 피해를 좌우한다.** 인간 기술로 체력을 먼저 깎고 거미로 변해 덮친다. 캠프에서도 새끼 거미가 공격을 나눠 받게 하며 두 형태의 기술을 모두 순환한다.

## 줄타기는 진입보다 회피 가치가 크다
**거미 형태 E는 공중으로 올라가 잠시 공격을 피하고 지정한 적에게 내려갈 수 있다.** 갱킹 시작부터 쓰면 상대 이동기를 따라갈 수 없으므로 걸어서 닿은 뒤 핵심 피해나 제어를 피할 때 사용한다. 내려갈 대상이 없다면 착지 위치와 퇴로가 제한된다는 점도 계산한다.

## 짧은 전투를 반복해 초반 주도권을 만든다
**엘리스는 여러 기본 기술로 빠른 교전을 만들지만 모든 기술이 빠지면 지속 싸움이 약해진다.** 한 번의 고치 연계 뒤 처치가 안 되면 새끼 거미와 줄타기로 빠져나온다. 목표물 앞에서는 고치로 입구를 확인하고 상대 정글이 보일 때만 거미 형태로 가까이 붙는다.', 1, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-elise-20260915' OR (kind = 'article' AND title_key = '엘리스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-champion-elise-20260915', id, NULL, 0, general, '정글 AP 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ap-champion-elise-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 인간 형태로 먼저 묶는다 · 현재 체력과 잃은 체력 피해 순서를 지킨다 · 줄타기로 핵심 기술을 피한다
[[분류:정글]] [[분류:AP]]

## 인간 형태에서 교전의 문을 연다
**엘리스는 인간 형태의 고치로 첫 대상을 기절시킨 뒤 새끼 거미와 신경독을 연결할 때 안전하게 접근한다.**[* [엘리스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=106)] `E`는 처음 맞는 적 유닛에 막히므로 미니언과 챔피언 사이의 각을 먼저 만든다. 빗나가면 거미 형태로 무리하게 뛰지 말고 다음 기회를 기다린다.

## 체력이 높을 때 신경독, 낮을 때 독이빨을 쓴다
**인간 Q는 현재 체력에 비례하고 거미 Q는 잃은 체력에 비례해 강해지므로 형태 전환 순서가 피해를 좌우한다.** 인간 기술로 체력을 먼저 깎고 거미로 변해 덮친다. 캠프에서도 새끼 거미가 공격을 나눠 받게 하며 두 형태의 기술을 모두 순환한다.

## 줄타기는 진입보다 회피 가치가 크다
**거미 형태 E는 공중으로 올라가 잠시 공격을 피하고 지정한 적에게 내려갈 수 있다.** 갱킹 시작부터 쓰면 상대 이동기를 따라갈 수 없으므로 걸어서 닿은 뒤 핵심 피해나 제어를 피할 때 사용한다. 내려갈 대상이 없다면 착지 위치와 퇴로가 제한된다는 점도 계산한다.

## 짧은 전투를 반복해 초반 주도권을 만든다
**엘리스는 여러 기본 기술로 빠른 교전을 만들지만 모든 기술이 빠지면 지속 싸움이 약해진다.** 한 번의 고치 연계 뒤 처치가 안 되면 새끼 거미와 줄타기로 빠져나온다. 목표물 앞에서는 고치로 입구를 확인하고 상대 정글이 보일 때만 거미 형태로 가까이 붙는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-champion-elise-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-elise-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-elise-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-elise-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-elise-20260915', NULL, '분류:ap', '분류:AP' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-elise-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-elise-20260915' AND target_key = '분류:ap');

-- 이블린 챔피언 위키 (910자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ap-champion-evelynn-20260915', 'article', '이블린', '이블린', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 위장으로 시야 가장자리를 돈다 · 저주가 완성된 뒤 진입한다 · 최후의 포옹으로 마무리와 이탈을 함께 한다
[[분류:정글]] [[분류:AP]]

## 6레벨 전후의 동선 목적을 구분한다
**이블린은 6레벨부터 악의 장막이 위장을 제공하므로 그전에는 안정적인 성장과 확실한 갱킹만 고른다.**[* [이블린 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=14)] 위장을 얻은 뒤에는 일반 시야의 바깥을 크게 돌아 상대가 물러날 방향을 선점한다. 전투가 끝나면 피해를 받지 않는 시간을 확보해 다시 숨고 체력을 회복한다.

## 황홀한 저주는 완성 여부에 따라 역할이 다르다
**`W` 표식이 충분히 차면 다음 공격이 매혹과 마법 저항력 감소를 만들지만, 일찍 터뜨리면 둔화만 얻는다.** 상대가 이동기를 쓰기 전에 확실히 붙을 수 있으면 완성을 기다리고, 도주를 재촉하거나 위치만 흔들 때는 짧게 터뜨린다. 표식 소리로 접근이 알려지므로 뒤가 아닌 옆 경로도 준비한다.

## 증오의 가시 첫 투사체를 신중히 맞힌다
**Q 첫 가시에 맞은 대상은 이어지는 공격에서 추가 피해를 받으므로, 암살 시작의 정확도가 중요하다.** 미니언에 막힐 각이라면 가까이 접근해 채찍유린부터 시작하거나 아군 제어를 기다린다. 가시 재사용을 이동 사이에 섞되 한곳에 멈춰 연타하지 않는다.

## 최후의 포옹은 도착 위치까지 계산한다
**궁극기는 낮은 체력 적에게 강한 피해를 주며 이블린을 뒤쪽으로 이동시키고 잠시 대상으로 지정되지 않게 한다.** 처치만 보고 누르지 말고 벽을 넘거나 적 화력에서 빠질 방향을 맞춘다. 목표물 싸움에서는 강타 순간까지 궁극기를 남겨 상대 정글을 마무리하고 구덩이 밖으로 빠지는 선택도 만든다.', 1, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-evelynn-20260915' OR (kind = 'article' AND title_key = '이블린'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-champion-evelynn-20260915', id, NULL, 0, general, '정글 AP 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ap-champion-evelynn-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 위장으로 시야 가장자리를 돈다 · 저주가 완성된 뒤 진입한다 · 최후의 포옹으로 마무리와 이탈을 함께 한다
[[분류:정글]] [[분류:AP]]

## 6레벨 전후의 동선 목적을 구분한다
**이블린은 6레벨부터 악의 장막이 위장을 제공하므로 그전에는 안정적인 성장과 확실한 갱킹만 고른다.**[* [이블린 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=14)] 위장을 얻은 뒤에는 일반 시야의 바깥을 크게 돌아 상대가 물러날 방향을 선점한다. 전투가 끝나면 피해를 받지 않는 시간을 확보해 다시 숨고 체력을 회복한다.

## 황홀한 저주는 완성 여부에 따라 역할이 다르다
**`W` 표식이 충분히 차면 다음 공격이 매혹과 마법 저항력 감소를 만들지만, 일찍 터뜨리면 둔화만 얻는다.** 상대가 이동기를 쓰기 전에 확실히 붙을 수 있으면 완성을 기다리고, 도주를 재촉하거나 위치만 흔들 때는 짧게 터뜨린다. 표식 소리로 접근이 알려지므로 뒤가 아닌 옆 경로도 준비한다.

## 증오의 가시 첫 투사체를 신중히 맞힌다
**Q 첫 가시에 맞은 대상은 이어지는 공격에서 추가 피해를 받으므로, 암살 시작의 정확도가 중요하다.** 미니언에 막힐 각이라면 가까이 접근해 채찍유린부터 시작하거나 아군 제어를 기다린다. 가시 재사용을 이동 사이에 섞되 한곳에 멈춰 연타하지 않는다.

## 최후의 포옹은 도착 위치까지 계산한다
**궁극기는 낮은 체력 적에게 강한 피해를 주며 이블린을 뒤쪽으로 이동시키고 잠시 대상으로 지정되지 않게 한다.** 처치만 보고 누르지 말고 벽을 넘거나 적 화력에서 빠질 방향을 맞춘다. 목표물 싸움에서는 강타 순간까지 궁극기를 남겨 상대 정글을 마무리하고 구덩이 밖으로 빠지는 선택도 만든다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-champion-evelynn-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-evelynn-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-evelynn-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-evelynn-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-evelynn-20260915', NULL, '분류:ap', '분류:AP' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-evelynn-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-evelynn-20260915' AND target_key = '분류:ap');

-- 피들스틱 챔피언 위키 (890자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ap-champion-fiddlesticks-20260915', 'article', '피들스틱', '피들스틱', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 시야에서 사라져 공포 조건을 만든다 · 풍작을 끝까지 유지한다 · 까마귀 폭풍 착지 지점을 숨긴다
[[분류:정글]] [[분류:AP]]

## 허수아비로 시야를 지우고 가짜 정보를 만든다
**피들스틱의 장신구를 대신하는 허수아비는 시야를 제공하고, 성장하면 주변 와드까지 드러낸다.**[* [피들스틱 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=16)] 궁극기를 쓸 벽 너머와 정글 입구를 먼저 확인해 적 시야에 보이지 않는 상태를 만든다. 허수아비를 몸처럼 보이는 위치에 세워 상대의 확인 기술을 빼는 활용도 가능하다.

## 풍작은 여러 대상을 묶고 마지막 틱까지 본다
**`W`는 주변 적의 체력을 동시에 흡수하며 정신 집중이 끝날 때 잃은 체력 비례 피해를 더한다.** 캠프를 서로 가까이 모아 여러 대상을 잡고, 교전에서는 이동기가 빠진 적 사이에서 사용한다. 끝나기 전에 직접 끊으면 회복과 마무리 피해를 잃으므로 위험한 제어가 빠졌는지 확인한다.

## 공포는 시야 밖 첫 피해로 광역 적용한다
**적에게 보이지 않은 상태에서 기술로 피해를 주면 공포 기본 지속 효과가 발동한다.** 단일 Q를 먼저 쓰기보다 벽 너머 궁극기나 수확으로 여러 명에게 첫 피해를 넣는다. 이미 공포에 걸린 대상에게 Q를 쓰면 현재 체력 비례 피해가 강해지는 점까지 연계한다.

## 까마귀 폭풍은 채널 시작 위치가 핵심이다
**궁극기는 정신 집중 뒤 이동해 주변에 지속 광역 피해를 만든다.** 적이 볼 수 있는 수풀에서 억지로 시작하지 말고 허수아비로 시야를 제거한 벽 뒤를 고른다. 착지 뒤 바로 풍작을 쓸지 수확 침묵으로 이동기를 끊을지 상대 기술 상태에 따라 결정한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-fiddlesticks-20260915' OR (kind = 'article' AND title_key = '피들스틱'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-champion-fiddlesticks-20260915', id, NULL, 0, general, '정글 AP 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ap-champion-fiddlesticks-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 시야에서 사라져 공포 조건을 만든다 · 풍작을 끝까지 유지한다 · 까마귀 폭풍 착지 지점을 숨긴다
[[분류:정글]] [[분류:AP]]

## 허수아비로 시야를 지우고 가짜 정보를 만든다
**피들스틱의 장신구를 대신하는 허수아비는 시야를 제공하고, 성장하면 주변 와드까지 드러낸다.**[* [피들스틱 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=16)] 궁극기를 쓸 벽 너머와 정글 입구를 먼저 확인해 적 시야에 보이지 않는 상태를 만든다. 허수아비를 몸처럼 보이는 위치에 세워 상대의 확인 기술을 빼는 활용도 가능하다.

## 풍작은 여러 대상을 묶고 마지막 틱까지 본다
**`W`는 주변 적의 체력을 동시에 흡수하며 정신 집중이 끝날 때 잃은 체력 비례 피해를 더한다.** 캠프를 서로 가까이 모아 여러 대상을 잡고, 교전에서는 이동기가 빠진 적 사이에서 사용한다. 끝나기 전에 직접 끊으면 회복과 마무리 피해를 잃으므로 위험한 제어가 빠졌는지 확인한다.

## 공포는 시야 밖 첫 피해로 광역 적용한다
**적에게 보이지 않은 상태에서 기술로 피해를 주면 공포 기본 지속 효과가 발동한다.** 단일 Q를 먼저 쓰기보다 벽 너머 궁극기나 수확으로 여러 명에게 첫 피해를 넣는다. 이미 공포에 걸린 대상에게 Q를 쓰면 현재 체력 비례 피해가 강해지는 점까지 연계한다.

## 까마귀 폭풍은 채널 시작 위치가 핵심이다
**궁극기는 정신 집중 뒤 이동해 주변에 지속 광역 피해를 만든다.** 적이 볼 수 있는 수풀에서 억지로 시작하지 말고 허수아비로 시야를 제거한 벽 뒤를 고른다. 착지 뒤 바로 풍작을 쓸지 수확 침묵으로 이동기를 끊을지 상대 기술 상태에 따라 결정한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-champion-fiddlesticks-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-fiddlesticks-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-fiddlesticks-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-fiddlesticks-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-fiddlesticks-20260915', NULL, '분류:ap', '분류:AP' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-fiddlesticks-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-fiddlesticks-20260915' AND target_key = '분류:ap');

-- 카서스 챔피언 위키 (901자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ap-champion-karthus-20260915', 'article', '카서스', '카서스', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 황폐화를 단일 대상에 맞힌다 · 부패 범위를 필요한 때만 켠다 · 진혼곡은 다른 전투까지 함께 본다
[[분류:정글]] [[분류:AP]]

## 황폐화는 몬스터 하나만 맞도록 놓는다
**카서스의 `Q`는 폭발 범위에 대상이 하나뿐이면 더 큰 피해를 주므로 큰 몬스터를 작은 몬스터와 분리해 맞힌다.**[* [카서스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=27)] 기본 공격 사이에 황폐화를 일정한 리듬으로 넣고 다음 캠프 방향으로 끌며 정리한다. 갱킹에서는 발밑보다 상대가 움직일 다음 칸에 놓는다.

## 고통의 벽은 피해보다 길을 바꾼다
**W를 지난 적은 느려지고 마법 저항력이 낮아져 이어지는 황폐화를 피하기 어려워진다.** 상대 정면보다 퇴로와 좁은 입구를 가로질러 세우고, 벽을 우회하는 움직임까지 예상해 Q를 둔다. 아군 제어가 있다면 먼저 벽을 깔아 마법 피해가 집중될 시간을 만든다.

## 부패는 마나와 위치를 동시에 관리한다
**E를 켜면 주변에 계속 피해를 주지만 마나가 빠르게 소모되고, 적을 처치하면 기본 지속 효과로 마나를 회복한다.** 작은 몬스터가 모였거나 여러 챔피언이 붙은 순간에만 켜고 이동 중에는 즉시 끈다. 교전에서 너무 깊게 들어가 죽는 것보다 Q 사거리를 유지하며 범위 끝을 걸친다.

## 진혼곡은 전장의 체력을 모두 확인한다
**궁극기는 정신 집중 뒤 모든 적 챔피언에게 피해를 주므로 내 교전 밖의 마무리와 동시 압박을 만든다.** 안전한 위치와 상대 방해 기술을 확인하고 시작한다. 죽은 뒤에도 잠시 기술을 쓸 수 있지만 이를 진입 근거로 삼지 말고, 쓰러졌다면 황폐화와 고통의 벽을 먼저 배치한 뒤 마지막에 진혼곡 시간을 확보한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-karthus-20260915' OR (kind = 'article' AND title_key = '카서스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-champion-karthus-20260915', id, NULL, 0, general, '정글 AP 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ap-champion-karthus-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 황폐화를 단일 대상에 맞힌다 · 부패 범위를 필요한 때만 켠다 · 진혼곡은 다른 전투까지 함께 본다
[[분류:정글]] [[분류:AP]]

## 황폐화는 몬스터 하나만 맞도록 놓는다
**카서스의 `Q`는 폭발 범위에 대상이 하나뿐이면 더 큰 피해를 주므로 큰 몬스터를 작은 몬스터와 분리해 맞힌다.**[* [카서스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=27)] 기본 공격 사이에 황폐화를 일정한 리듬으로 넣고 다음 캠프 방향으로 끌며 정리한다. 갱킹에서는 발밑보다 상대가 움직일 다음 칸에 놓는다.

## 고통의 벽은 피해보다 길을 바꾼다
**W를 지난 적은 느려지고 마법 저항력이 낮아져 이어지는 황폐화를 피하기 어려워진다.** 상대 정면보다 퇴로와 좁은 입구를 가로질러 세우고, 벽을 우회하는 움직임까지 예상해 Q를 둔다. 아군 제어가 있다면 먼저 벽을 깔아 마법 피해가 집중될 시간을 만든다.

## 부패는 마나와 위치를 동시에 관리한다
**E를 켜면 주변에 계속 피해를 주지만 마나가 빠르게 소모되고, 적을 처치하면 기본 지속 효과로 마나를 회복한다.** 작은 몬스터가 모였거나 여러 챔피언이 붙은 순간에만 켜고 이동 중에는 즉시 끈다. 교전에서 너무 깊게 들어가 죽는 것보다 Q 사거리를 유지하며 범위 끝을 걸친다.

## 진혼곡은 전장의 체력을 모두 확인한다
**궁극기는 정신 집중 뒤 모든 적 챔피언에게 피해를 주므로 내 교전 밖의 마무리와 동시 압박을 만든다.** 안전한 위치와 상대 방해 기술을 확인하고 시작한다. 죽은 뒤에도 잠시 기술을 쓸 수 있지만 이를 진입 근거로 삼지 말고, 쓰러졌다면 황폐화와 고통의 벽을 먼저 배치한 뒤 마지막에 진혼곡 시간을 확보한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-champion-karthus-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-karthus-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-karthus-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-karthus-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-karthus-20260915', NULL, '분류:ap', '분류:AP' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-karthus-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-karthus-20260915' AND target_key = '분류:ap');

-- 아무무 챔피언 위키 (893자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ap-champion-amumu-20260915', 'article', '아무무', '아무무', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 붕대 두 번의 용도를 나눈다 · 절망과 짜증내기로 캠프를 묶는다 · 궁극기는 아군 후속 범위에서 쓴다
[[분류:정글]] [[분류:AP]]

## 캠프를 모아 광역 기술을 겹친다
**아무무는 주변 적에게 계속 피해를 주는 절망과 공격받을수록 빨리 돌아오는 짜증내기로 여러 몬스터를 함께 정리하기 좋다.**[* [아무무 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=3)] `W`는 캠프가 흩어지거나 이동할 때 꺼 마나를 아끼고, 큰 몬스터에 기본 공격을 섞어 저주 피해를 이어간다. 다음 캠프 쪽으로 몬스터를 끌어 동선을 짧게 만든다.

## 붕대 던지기 두 충전을 한 번에 쓰지 않는다
**Q는 첫 적을 기절시키며 아무무를 끌어당기므로 진입과 추격을 모두 담당한다.** 첫 붕대로 붙은 뒤 상대 이동기를 기다리고 두 번째 붕대로 따라간다. 미니언에 막힐 수 있는 라인에서는 각을 옆으로 만들고, 빗나가면 궁극기만 믿고 걸어 들어가지 않는다.

## 슬픈 미라의 저주는 많이 맞히는 것보다 후속이 중요하다
**궁극기는 주변 적을 한꺼번에 기절시키지만, 아군이 닿지 않는 곳에서 혼자 쓰면 지속시간을 살리지 못한다.** 아군 광역 피해와 이동 거리를 확인하고 진입한다. 핵심 대상 한두 명만 확실히 묶어 전투를 끝낼 수 있다면 더 많은 적이 모일 때까지 기다리지 않는다.

## 진입 뒤에는 저주를 묻히며 전선을 유지한다
**아무무의 기본 공격은 대상이 받는 마법 피해에 추가 효과를 주므로 여러 적에게 번갈아 묻히면 팀 화력을 돕는다.** 궁극기 뒤 한 명만 쫓기보다 아군이 공격하는 대상을 함께 친다. 목표물 앞에서는 붕대 하나를 벽 너머 진입이나 상대 정글 차단에 남긴다.', 1, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-amumu-20260915' OR (kind = 'article' AND title_key = '아무무'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-champion-amumu-20260915', id, NULL, 0, general, '정글 AP 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ap-champion-amumu-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 붕대 두 번의 용도를 나눈다 · 절망과 짜증내기로 캠프를 묶는다 · 궁극기는 아군 후속 범위에서 쓴다
[[분류:정글]] [[분류:AP]]

## 캠프를 모아 광역 기술을 겹친다
**아무무는 주변 적에게 계속 피해를 주는 절망과 공격받을수록 빨리 돌아오는 짜증내기로 여러 몬스터를 함께 정리하기 좋다.**[* [아무무 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=3)] `W`는 캠프가 흩어지거나 이동할 때 꺼 마나를 아끼고, 큰 몬스터에 기본 공격을 섞어 저주 피해를 이어간다. 다음 캠프 쪽으로 몬스터를 끌어 동선을 짧게 만든다.

## 붕대 던지기 두 충전을 한 번에 쓰지 않는다
**Q는 첫 적을 기절시키며 아무무를 끌어당기므로 진입과 추격을 모두 담당한다.** 첫 붕대로 붙은 뒤 상대 이동기를 기다리고 두 번째 붕대로 따라간다. 미니언에 막힐 수 있는 라인에서는 각을 옆으로 만들고, 빗나가면 궁극기만 믿고 걸어 들어가지 않는다.

## 슬픈 미라의 저주는 많이 맞히는 것보다 후속이 중요하다
**궁극기는 주변 적을 한꺼번에 기절시키지만, 아군이 닿지 않는 곳에서 혼자 쓰면 지속시간을 살리지 못한다.** 아군 광역 피해와 이동 거리를 확인하고 진입한다. 핵심 대상 한두 명만 확실히 묶어 전투를 끝낼 수 있다면 더 많은 적이 모일 때까지 기다리지 않는다.

## 진입 뒤에는 저주를 묻히며 전선을 유지한다
**아무무의 기본 공격은 대상이 받는 마법 피해에 추가 효과를 주므로 여러 적에게 번갈아 묻히면 팀 화력을 돕는다.** 궁극기 뒤 한 명만 쫓기보다 아군이 공격하는 대상을 함께 친다. 목표물 앞에서는 붕대 하나를 벽 너머 진입이나 상대 정글 차단에 남긴다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-champion-amumu-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-amumu-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-amumu-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-amumu-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-amumu-20260915', NULL, '분류:ap', '분류:AP' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-amumu-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-amumu-20260915' AND target_key = '분류:ap');

-- 그라가스 챔피언 위키 (875자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ap-champion-gragas-20260915', 'article', '그라가스', '그라가스', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 술통을 익혀 길을 막는다 · 몸통 박치기는 첫 충돌 대상을 고른다 · 궁극기 밀치는 방향을 설계한다
[[분류:정글]] [[분류:AP]]

## 술통은 즉시 터뜨릴지 기다릴지 먼저 정한다
**그라가스의 `Q`는 오래 놓을수록 강해지고 둔화도 커지지만, 상대가 범위를 벗어나면 아무 의미가 없다.**[* [그라가스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=20)] 캠프에서는 몬스터가 머물 위치에 미리 굴리고, 갱킹에서는 퇴로 쪽에 놓아 움직임을 제한한다. 아군 제어가 없으면 피해 최대치보다 확실한 즉시 폭발을 고른다.

## 취중 분노는 이동 전에 준비한다
**W는 짧은 정신 집중 뒤 받는 피해를 줄이고 다음 기본 공격에 광역 피해를 더한다.** 갱킹 직전 시야 밖에서 마셔 진입 중 멈추지 않고, 몸통 박치기 뒤 강화 공격까지 빠르게 연결한다. 방어 효과가 있는 동안 상대의 첫 반격을 받아내되 끝난 뒤 긴 싸움은 피한다.

## 몸통 박치기는 미니언과 앞선에 막힌다
**`E`는 처음 부딪힌 적과 주변을 기절시키고 챔피언에 적중하면 재사용 대기시간이 줄어든다.** 원하는 대상 앞의 유닛을 확인하고 벽을 넘어 옆 각을 만든다. 빗나가면 핵심 이동기와 제어를 모두 잃으므로 최대 거리보다 넓은 몸 판정을 확실히 맞힌다.

## 술통 폭발은 흩뜨리기와 배달을 구분한다
**궁극기는 폭발 중심에서 바깥으로 적을 밀어내므로 투척 위치가 곧 이동 방향이다.** 핵심 적 뒤에 던져 아군 쪽으로 보내거나, 진입하는 여러 적 사이에 던져 전선을 갈라놓는다. 목표물 구덩이에서는 상대를 밖으로 밀지 안으로 밀지 강타 담당 위치까지 보고 결정한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-gragas-20260915' OR (kind = 'article' AND title_key = '그라가스'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-champion-gragas-20260915', id, NULL, 0, general, '정글 AP 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ap-champion-gragas-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 술통을 익혀 길을 막는다 · 몸통 박치기는 첫 충돌 대상을 고른다 · 궁극기 밀치는 방향을 설계한다
[[분류:정글]] [[분류:AP]]

## 술통은 즉시 터뜨릴지 기다릴지 먼저 정한다
**그라가스의 `Q`는 오래 놓을수록 강해지고 둔화도 커지지만, 상대가 범위를 벗어나면 아무 의미가 없다.**[* [그라가스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=20)] 캠프에서는 몬스터가 머물 위치에 미리 굴리고, 갱킹에서는 퇴로 쪽에 놓아 움직임을 제한한다. 아군 제어가 없으면 피해 최대치보다 확실한 즉시 폭발을 고른다.

## 취중 분노는 이동 전에 준비한다
**W는 짧은 정신 집중 뒤 받는 피해를 줄이고 다음 기본 공격에 광역 피해를 더한다.** 갱킹 직전 시야 밖에서 마셔 진입 중 멈추지 않고, 몸통 박치기 뒤 강화 공격까지 빠르게 연결한다. 방어 효과가 있는 동안 상대의 첫 반격을 받아내되 끝난 뒤 긴 싸움은 피한다.

## 몸통 박치기는 미니언과 앞선에 막힌다
**`E`는 처음 부딪힌 적과 주변을 기절시키고 챔피언에 적중하면 재사용 대기시간이 줄어든다.** 원하는 대상 앞의 유닛을 확인하고 벽을 넘어 옆 각을 만든다. 빗나가면 핵심 이동기와 제어를 모두 잃으므로 최대 거리보다 넓은 몸 판정을 확실히 맞힌다.

## 술통 폭발은 흩뜨리기와 배달을 구분한다
**궁극기는 폭발 중심에서 바깥으로 적을 밀어내므로 투척 위치가 곧 이동 방향이다.** 핵심 적 뒤에 던져 아군 쪽으로 보내거나, 진입하는 여러 적 사이에 던져 전선을 갈라놓는다. 목표물 구덩이에서는 상대를 밖으로 밀지 안으로 밀지 강타 담당 위치까지 보고 결정한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-champion-gragas-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-gragas-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-gragas-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-gragas-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-gragas-20260915', NULL, '분류:ap', '분류:AP' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-gragas-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-gragas-20260915' AND target_key = '분류:ap');

-- 니코 챔피언 위키 (876자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ap-champion-neeko-20260915', 'article', '니코', '니코', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 유닛 변신으로 동선을 숨긴다 · 칭칭올가미를 유닛에 관통시킨다 · 만개 준비 동작을 감춘다
[[분류:정글]] [[분류:AP]]

## 변신은 모습보다 정보량을 줄이는 데 쓴다
**니코는 아군 챔피언뿐 아니라 저장한 아군·중립 유닛 모습으로 변신해 정글러라는 정보를 숨길 수 있다.**[* [니코 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=142)] 라인에 부족한 미니언처럼 접근하거나 작은 몬스터로 이동하되, 실제 무리의 수와 이동 속도가 어색하지 않게 한다. 피해를 받으면 속임수가 풀릴 수 있으므로 적 시야를 통과하는 시간을 짧게 만든다.

## 칭칭올가미는 첫 대상을 관통시킨다
**`E`가 적을 맞힌 뒤에는 더 크고 빠르게 날아가며 속박 시간도 길어지므로 미니언이나 몬스터 뒤의 챔피언을 노린다.** 옆 각보다 정면 유닛을 이용한 확실한 강화가 나을 때가 많다. 속박된 자리에 꽃망울 폭발을 놓아 추가 폭발까지 연결한다.

## 형상 분리로 진입 방향을 둘로 만든다
**W는 분신을 보내고 니코를 잠시 숨기며, 세 번째 기본 공격에는 추가 피해와 이동 속도가 붙는다.** 캠프에서 세 번째 공격을 준비한 뒤 갱킹에 들어가고, 분신은 예상 퇴로와 다른 방향으로 보낸다. 재사용으로 분신 방향을 바꿔 수풀과 좁은 길을 먼저 확인한다.

## 만개는 변신과 시야 밖에서 준비한다
**궁극기는 잠시 준비한 뒤 주변 적을 띄우고 착지하며 기절시키며, 변신 중에는 준비 동작이 감춰진다.** 유닛 모습으로 가까이 접근하거나 W 은신과 연결해 반응 시간을 줄인다. 많이 맞히려 깊게 들어가기보다 아군이 후속할 수 있는 거리에서 핵심 둘을 묶는다.', 1, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-neeko-20260915' OR (kind = 'article' AND title_key = '니코'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-champion-neeko-20260915', id, NULL, 0, general, '정글 AP 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ap-champion-neeko-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 유닛 변신으로 동선을 숨긴다 · 칭칭올가미를 유닛에 관통시킨다 · 만개 준비 동작을 감춘다
[[분류:정글]] [[분류:AP]]

## 변신은 모습보다 정보량을 줄이는 데 쓴다
**니코는 아군 챔피언뿐 아니라 저장한 아군·중립 유닛 모습으로 변신해 정글러라는 정보를 숨길 수 있다.**[* [니코 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=142)] 라인에 부족한 미니언처럼 접근하거나 작은 몬스터로 이동하되, 실제 무리의 수와 이동 속도가 어색하지 않게 한다. 피해를 받으면 속임수가 풀릴 수 있으므로 적 시야를 통과하는 시간을 짧게 만든다.

## 칭칭올가미는 첫 대상을 관통시킨다
**`E`가 적을 맞힌 뒤에는 더 크고 빠르게 날아가며 속박 시간도 길어지므로 미니언이나 몬스터 뒤의 챔피언을 노린다.** 옆 각보다 정면 유닛을 이용한 확실한 강화가 나을 때가 많다. 속박된 자리에 꽃망울 폭발을 놓아 추가 폭발까지 연결한다.

## 형상 분리로 진입 방향을 둘로 만든다
**W는 분신을 보내고 니코를 잠시 숨기며, 세 번째 기본 공격에는 추가 피해와 이동 속도가 붙는다.** 캠프에서 세 번째 공격을 준비한 뒤 갱킹에 들어가고, 분신은 예상 퇴로와 다른 방향으로 보낸다. 재사용으로 분신 방향을 바꿔 수풀과 좁은 길을 먼저 확인한다.

## 만개는 변신과 시야 밖에서 준비한다
**궁극기는 잠시 준비한 뒤 주변 적을 띄우고 착지하며 기절시키며, 변신 중에는 준비 동작이 감춰진다.** 유닛 모습으로 가까이 접근하거나 W 은신과 연결해 반응 시간을 줄인다. 많이 맞히려 깊게 들어가기보다 아군이 후속할 수 있는 거리에서 핵심 둘을 묶는다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-champion-neeko-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-neeko-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-neeko-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-neeko-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-neeko-20260915', NULL, '분류:ap', '분류:AP' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-neeko-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-neeko-20260915' AND target_key = '분류:ap');

-- 아이번 챔피언 위키 (896자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ap-champion-ivern-20260915', 'article', '아이번', '아이번', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 숲의 친구로 캠프 시간을 설계한다 · 덩굴뿌리로 아군 진입을 연다 · 데이지와 보호막을 한 묶음으로 운용한다
[[분류:정글]] [[분류:AP]]

## 수풀 친구는 표시와 회수 시간을 함께 계산한다
**아이번은 몬스터와 싸우는 대신 숲을 만든 뒤 시간이 지나면 캠프를 해방하므로, 표시 순서가 다음 동선을 결정한다.**[* [아이번 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=133)] 여러 캠프를 표시하고 라인 상황을 본 뒤 완성된 곳을 돌아 회수한다. 상대가 침입할 가능성이 있으면 먼 캠프를 욕심내지 말고 주도권 있는 쪽부터 안전하게 챙긴다.

## 덩굴뿌리는 피해보다 아군 이동을 연다
**`Q`에 묶인 대상에게 아이번과 아군이 돌진할 수 있어 짧은 사거리 근접 챔피언의 진입을 돕는다.** 미니언에 막힐 선을 피하고 아군이 실제로 따라갈 준비가 됐을 때 던진다. 맞힌 뒤 무조건 직접 들어가기보다 보호막을 줄 거리와 상대 역습을 확인한다.

## 수풀은 시야와 기본 공격을 동시에 바꾼다
**W로 만든 수풀은 시야를 끊고, 아이번과 아군이 안에서 공격할 때 추가 마법 피해를 준다.** 목표물 입구와 원거리 딜러 주변에 놓아 안전한 공격 공간을 만들되 적 암살자의 접근까지 가리지 않게 한다. 수풀을 심은 뒤 그 안을 다시 확인하는 습관을 둔다.

## 데이지에게 보호의 씨앗을 실어 보낸다
**데이지는 앞에서 공격하며 같은 대상을 연속 타격하면 띄우기를 만들 수 있다.** `E` 보호막을 데이지에게 주고 적 가까이 보내 폭발 둔화를 묻힌 뒤 덩굴뿌리를 맞힌다. 본체는 뒤에서 지키며 데이지의 이동 명령을 계속 갱신하고, 목표물 앞에서는 입구를 막는 앞선으로 쓴다.', 1, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-ivern-20260915' OR (kind = 'article' AND title_key = '아이번'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-champion-ivern-20260915', id, NULL, 0, general, '정글 AP 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ap-champion-ivern-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 숲의 친구로 캠프 시간을 설계한다 · 덩굴뿌리로 아군 진입을 연다 · 데이지와 보호막을 한 묶음으로 운용한다
[[분류:정글]] [[분류:AP]]

## 수풀 친구는 표시와 회수 시간을 함께 계산한다
**아이번은 몬스터와 싸우는 대신 숲을 만든 뒤 시간이 지나면 캠프를 해방하므로, 표시 순서가 다음 동선을 결정한다.**[* [아이번 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=133)] 여러 캠프를 표시하고 라인 상황을 본 뒤 완성된 곳을 돌아 회수한다. 상대가 침입할 가능성이 있으면 먼 캠프를 욕심내지 말고 주도권 있는 쪽부터 안전하게 챙긴다.

## 덩굴뿌리는 피해보다 아군 이동을 연다
**`Q`에 묶인 대상에게 아이번과 아군이 돌진할 수 있어 짧은 사거리 근접 챔피언의 진입을 돕는다.** 미니언에 막힐 선을 피하고 아군이 실제로 따라갈 준비가 됐을 때 던진다. 맞힌 뒤 무조건 직접 들어가기보다 보호막을 줄 거리와 상대 역습을 확인한다.

## 수풀은 시야와 기본 공격을 동시에 바꾼다
**W로 만든 수풀은 시야를 끊고, 아이번과 아군이 안에서 공격할 때 추가 마법 피해를 준다.** 목표물 입구와 원거리 딜러 주변에 놓아 안전한 공격 공간을 만들되 적 암살자의 접근까지 가리지 않게 한다. 수풀을 심은 뒤 그 안을 다시 확인하는 습관을 둔다.

## 데이지에게 보호의 씨앗을 실어 보낸다
**데이지는 앞에서 공격하며 같은 대상을 연속 타격하면 띄우기를 만들 수 있다.** `E` 보호막을 데이지에게 주고 적 가까이 보내 폭발 둔화를 묻힌 뒤 덩굴뿌리를 맞힌다. 본체는 뒤에서 지키며 데이지의 이동 명령을 계속 갱신하고, 목표물 앞에서는 입구를 막는 앞선으로 쓴다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-champion-ivern-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-ivern-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-ivern-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-ivern-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-ivern-20260915', NULL, '분류:ap', '분류:AP' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-ivern-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-ivern-20260915' AND target_key = '분류:ap');

-- 스카너 챔피언 위키 (874자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ap-champion-skarner-20260915', 'article', '스카너', '스카너', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 바위 세 타격을 관리한다 · 지형을 통과해 벽 충돌을 만든다 · 꿰뚫기로 여러 명의 위치를 바꾼다
[[분류:정글]] [[분류:AP]]

## 부서진 대지는 세 공격과 투척 중 하나를 고른다
**스카너의 `Q`는 바위를 들어 다음 기본 공격 세 번을 강화하고, 다시 사용하면 멀리 던져 광역 피해와 둔화를 준다.**[* [스카너 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=82)] 캠프에서는 세 번째 체력 비례 공격까지 넣고, 달아나는 적에게 닿지 않으면 남은 바위를 투척한다. 바위를 든 시간 안에 다음 행동을 결정한다.

## 이쉬탈의 격돌은 벽 안에서 방향을 바꾼다
**E는 지형을 통과하며 챔피언이나 대형 몬스터를 붙잡아 다음 벽에 부딪히면 기절시킨다.** 정면에서 멀리 달리기보다 시야 밖 벽 안으로 들어가 짧은 반응 시간을 만든다. 잡은 뒤 벽까지 닿지 못할 거리라면 단순 이동기로 끝나므로 착지 지형을 먼저 본다.

## 대지의 수호자는 진입 직전보다 적중 순간에 쓴다
**W는 보호막을 얻고 주변에 피해와 둔화를 주므로 여러 대상 사이에서 버틸 시간을 만든다.** E로 붙기 전에 허공에서 쓰지 말고 벽 충돌 뒤 상대가 모인 순간에 사용한다. 기본 공격과 Q로 전율 세 중첩을 만들며 한 대상을 오래 붙잡는다.

## 꿰뚫기는 끌고 갈 방향이 본체다
**궁극기는 전방의 적 챔피언들을 제압해 스카너의 이동에 따라 끌고 간다.** 적 뒤에서 아군 쪽으로 당기거나, 목표물 입구에서 상대 정글과 앞선을 함께 구덩이 밖으로 옮긴다. 정신 집중 중 방해받지 않도록 아군 제어와 겹치고, 너무 많은 적보다 핵심 위치 변경을 우선한다.', 1, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-skarner-20260915' OR (kind = 'article' AND title_key = '스카너'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-champion-skarner-20260915', id, NULL, 0, general, '정글 AP 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ap-champion-skarner-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 바위 세 타격을 관리한다 · 지형을 통과해 벽 충돌을 만든다 · 꿰뚫기로 여러 명의 위치를 바꾼다
[[분류:정글]] [[분류:AP]]

## 부서진 대지는 세 공격과 투척 중 하나를 고른다
**스카너의 `Q`는 바위를 들어 다음 기본 공격 세 번을 강화하고, 다시 사용하면 멀리 던져 광역 피해와 둔화를 준다.**[* [스카너 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=82)] 캠프에서는 세 번째 체력 비례 공격까지 넣고, 달아나는 적에게 닿지 않으면 남은 바위를 투척한다. 바위를 든 시간 안에 다음 행동을 결정한다.

## 이쉬탈의 격돌은 벽 안에서 방향을 바꾼다
**E는 지형을 통과하며 챔피언이나 대형 몬스터를 붙잡아 다음 벽에 부딪히면 기절시킨다.** 정면에서 멀리 달리기보다 시야 밖 벽 안으로 들어가 짧은 반응 시간을 만든다. 잡은 뒤 벽까지 닿지 못할 거리라면 단순 이동기로 끝나므로 착지 지형을 먼저 본다.

## 대지의 수호자는 진입 직전보다 적중 순간에 쓴다
**W는 보호막을 얻고 주변에 피해와 둔화를 주므로 여러 대상 사이에서 버틸 시간을 만든다.** E로 붙기 전에 허공에서 쓰지 말고 벽 충돌 뒤 상대가 모인 순간에 사용한다. 기본 공격과 Q로 전율 세 중첩을 만들며 한 대상을 오래 붙잡는다.

## 꿰뚫기는 끌고 갈 방향이 본체다
**궁극기는 전방의 적 챔피언들을 제압해 스카너의 이동에 따라 끌고 간다.** 적 뒤에서 아군 쪽으로 당기거나, 목표물 입구에서 상대 정글과 앞선을 함께 구덩이 밖으로 옮긴다. 정신 집중 중 방해받지 않도록 아군 제어와 겹치고, 너무 많은 적보다 핵심 위치 변경을 우선한다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-champion-skarner-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-skarner-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-skarner-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-skarner-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-skarner-20260915', NULL, '분류:ap', '분류:AP' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-skarner-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-skarner-20260915' AND target_key = '분류:ap');

-- 자헨 챔피언 위키 (901자)
INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
SELECT 'doc-jungle-ap-champion-zaahen-20260915', 'article', '자헨', '자헨', 'published', NULL, '# 정글 실전 운용

> **한눈에 보기** — 다르킨의 글레이브 두 공격을 모두 쓴다 · 끌어당긴 뒤 가장자리 쇄도를 맞힌다 · 장기전에서 결의를 쌓는다
[[분류:정글]] [[분류:AP]]

## 다르킨의 글레이브는 두 단계로 순환한다
**자헨의 `Q`는 다음 기본 공격을 두 번 치며 회복하고, 다시 사용한 다음 공격은 대상을 띄운다.**[* [자헨 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=172)] 캠프와 교전에서 첫 공격 뒤 바로 다음 대상을 찾지 말고 두 번째 강화 공격까지 연결한다. 띄우기는 상대 이동기가 빠진 뒤 써 아군 후속 기술을 확정한다.

## 공포의 귀환으로 쇄도 가장자리를 맞춘다
**W는 전방 적을 끌어당겨 자헨이 원하는 거리에 모으는 기술이다.** 먼저 끌어 상대 위치를 고정한 뒤 찬란한 쇄도로 가르고, 원 범위 가장자리에 맞혀 최대 체력 비례 마법 피해를 노린다. W가 빗나가면 깊은 돌진을 미루고 걸어서 전선을 유지한다.

## 결의는 긴 싸움에서 부활 가능성을 만든다
**자헨은 챔피언에게 기본 공격과 기술을 맞혀 결의를 쌓고, 가득 찬 상태에서 쓰러지면 다시 일어날 수 있다.** 한 번에 끝내려 하기보다 여러 대상을 스치며 중첩을 유지한다. 부활이 준비되지 않은 때에는 전면 진입을 아끼고, 준비됐다면 아군이 계속 싸울 수 있는 자리에서 쓰러질 각까지 계산한다.

## 단호한 판결은 피해 감소와 회복을 겸한다
**궁극기 사용 중 받는 피해가 줄고 착지 피해 일부만큼 체력을 회복하므로 적의 집중 공격을 넘길 수 있다.** 첫 기술로 쓰지 말고 체력이 빠지며 큰 피해가 들어오는 순간에 사용한다. 착지 뒤 강화 Q와 끌어당기기를 이어갈 수 있도록 적 중앙보다 아군과 연결되는 지점을 고른다.', 1, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system'
WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-zaahen-20260915' OR (kind = 'article' AND title_key = '자헨'));
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-champion-zaahen-20260915', id, NULL, 0, general, '정글 AP 챔피언 위키 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-jungle-ap-champion-zaahen-20260915' AND revision = 1 AND general = '# 정글 실전 운용

> **한눈에 보기** — 다르킨의 글레이브 두 공격을 모두 쓴다 · 끌어당긴 뒤 가장자리 쇄도를 맞힌다 · 장기전에서 결의를 쌓는다
[[분류:정글]] [[분류:AP]]

## 다르킨의 글레이브는 두 단계로 순환한다
**자헨의 `Q`는 다음 기본 공격을 두 번 치며 회복하고, 다시 사용한 다음 공격은 대상을 띄운다.**[* [자헨 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=172)] 캠프와 교전에서 첫 공격 뒤 바로 다음 대상을 찾지 말고 두 번째 강화 공격까지 연결한다. 띄우기는 상대 이동기가 빠진 뒤 써 아군 후속 기술을 확정한다.

## 공포의 귀환으로 쇄도 가장자리를 맞춘다
**W는 전방 적을 끌어당겨 자헨이 원하는 거리에 모으는 기술이다.** 먼저 끌어 상대 위치를 고정한 뒤 찬란한 쇄도로 가르고, 원 범위 가장자리에 맞혀 최대 체력 비례 마법 피해를 노린다. W가 빗나가면 깊은 돌진을 미루고 걸어서 전선을 유지한다.

## 결의는 긴 싸움에서 부활 가능성을 만든다
**자헨은 챔피언에게 기본 공격과 기술을 맞혀 결의를 쌓고, 가득 찬 상태에서 쓰러지면 다시 일어날 수 있다.** 한 번에 끝내려 하기보다 여러 대상을 스치며 중첩을 유지한다. 부활이 준비되지 않은 때에는 전면 진입을 아끼고, 준비됐다면 아군이 계속 싸울 수 있는 자리에서 쓰러질 각까지 계산한다.

## 단호한 판결은 피해 감소와 회복을 겸한다
**궁극기 사용 중 받는 피해가 줄고 착지 피해 일부만큼 체력을 회복하므로 적의 집중 공격을 넘길 수 있다.** 첫 기술로 쓰지 말고 체력이 빠지며 큰 피해가 들어오는 순간에 사용한다. 착지 뒤 강화 Q와 끌어당기기를 이어갈 수 있도록 적 중앙보다 아군과 연결되는 지점을 고른다.'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-champion-zaahen-20260915');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-zaahen-20260915', NULL, '분류:정글', '분류:정글' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-zaahen-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-zaahen-20260915' AND target_key = '분류:정글');
INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-jungle-ap-champion-zaahen-20260915', NULL, '분류:ap', '분류:AP' FROM wiki_docs WHERE id = 'doc-jungle-ap-champion-zaahen-20260915'
AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = 'doc-jungle-ap-champion-zaahen-20260915' AND target_key = '분류:ap');

-- lillia 상대법 (834자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-lillia', 'matchup', NULL, NULL, 'published', 'lillia', '', 0, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — Q 가장자리에서 벗어난다 · 이동 속도 중첩이 끝날 때 붙는다 · 꿈가루가 묻으면 자장가를 대비한다

## 뾰로롱 강타의 원 안쪽으로 붙거나 완전히 빠진다
**릴리아의 `Q`는 바깥 가장자리에 추가 고정 피해가 있어 어중간한 거리에서 가장 강하다.**[* [릴리아 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=149)] 피할 공간이 없으면 릴리아 쪽으로 한 걸음 붙어 가장자리를 벗어나고, 추격할 때는 원 밖에서 재사용을 기다린다. 여러 명이 한 번에 맞아 이동 속도 중첩을 주지 않는다.

## 이동 속도 중첩이 높은 릴리아를 직선으로 쫓지 않는다
**스킬을 계속 맞힌 릴리아는 빠르게 들어왔다 빠지며 짧은 교환을 반복한다.** 캠프에서 나온 직후 중첩 표시를 보고, 높다면 좁은 길을 막거나 지속시간이 끝날 때까지 기다린다. 둔화만 차례로 쓰기보다 확실한 속박과 기절을 Q 사용 직후에 맞춘다.

## 이익 쿵의 중심을 옆으로 피한다
**W는 내려찍는 중앙의 피해가 크게 높지만 동작이 분명하다.** 수면이나 아군 제어에 걸렸다면 중심에서 벗어날 이동기를 남기고, 깨어 있는 상태에서는 뒤보다 옆으로 이동한다. 릴리아가 깊게 뛰어든 순간에는 착지 뒤 퇴로를 먼저 막는다.

## 꿈가루가 묻으면 궁극기 순서를 계산한다
**감미로운 자장가는 꿈가루가 묻은 모든 적을 졸리게 한 뒤 잠들게 한다.** 표식이 있는 아군끼리 뭉쳐 추가 광역 피해를 받지 말고 안전한 방향으로 흩어진다. 잠들기 전 보호 기술을 쓰고, 깨어나는 첫 피해 뒤 릴리아가 가까이 오면 즉시 제어한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-lillia' AND kind = 'matchup' AND champion_slug = 'lillia'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-lillia');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-matchup-lillia-20260915', id, NULL, 0, general, '정글 AP 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-lillia' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — Q 가장자리에서 벗어난다 · 이동 속도 중첩이 끝날 때 붙는다 · 꿈가루가 묻으면 자장가를 대비한다

## 뾰로롱 강타의 원 안쪽으로 붙거나 완전히 빠진다
**릴리아의 `Q`는 바깥 가장자리에 추가 고정 피해가 있어 어중간한 거리에서 가장 강하다.**[* [릴리아 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=149)] 피할 공간이 없으면 릴리아 쪽으로 한 걸음 붙어 가장자리를 벗어나고, 추격할 때는 원 밖에서 재사용을 기다린다. 여러 명이 한 번에 맞아 이동 속도 중첩을 주지 않는다.

## 이동 속도 중첩이 높은 릴리아를 직선으로 쫓지 않는다
**스킬을 계속 맞힌 릴리아는 빠르게 들어왔다 빠지며 짧은 교환을 반복한다.** 캠프에서 나온 직후 중첩 표시를 보고, 높다면 좁은 길을 막거나 지속시간이 끝날 때까지 기다린다. 둔화만 차례로 쓰기보다 확실한 속박과 기절을 Q 사용 직후에 맞춘다.

## 이익 쿵의 중심을 옆으로 피한다
**W는 내려찍는 중앙의 피해가 크게 높지만 동작이 분명하다.** 수면이나 아군 제어에 걸렸다면 중심에서 벗어날 이동기를 남기고, 깨어 있는 상태에서는 뒤보다 옆으로 이동한다. 릴리아가 깊게 뛰어든 순간에는 착지 뒤 퇴로를 먼저 막는다.

## 꿈가루가 묻으면 궁극기 순서를 계산한다
**감미로운 자장가는 꿈가루가 묻은 모든 적을 졸리게 한 뒤 잠들게 한다.** 표식이 있는 아군끼리 뭉쳐 추가 광역 피해를 받지 말고 안전한 방향으로 흩어진다. 잠들기 전 보호 기술을 쓰고, 깨어나는 첫 피해 뒤 릴리아가 가까이 오면 즉시 제어한다.'
AND updated_at = '2026-09-15T00:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-matchup-lillia-20260915');

-- elise 상대법 (817자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-elise', 'matchup', NULL, NULL, 'published', 'elise', '', 0, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 고치를 유닛으로 막는다 · 인간 Q를 높은 체력에 맞지 않는다 · 줄타기 착지 대상을 제한한다

## 고치의 첫 적중 대상을 대신 세운다
**엘리스의 인간 형태 `E`는 처음 맞는 적 유닛을 기절시키므로 미니언이나 소환물을 사이에 두면 갱킹 연계를 끊을 수 있다.**[* [엘리스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=106)] 직선으로 뒤로 빠지기보다 유닛 뒤에서 옆으로 움직인다. 고치가 빗나가면 거미 형태 진입을 서두르기 어려우므로 그때 거리를 되찾는다.

## 현재 체력이 높을 때 인간 Q 교환을 피한다
**신경독은 현재 체력에 비례해 강하고 독이빨은 잃은 체력에 비례해 마무리 힘이 커진다.** 첫 기술을 공짜로 맞지 말고, 체력이 낮아진 뒤에는 거미 Q 사거리 밖으로 빠진다. 두 형태를 모두 쓸 시간을 주지 않도록 짧게 제어하고 이탈한다.

## 줄타기 중 기술을 허공에 쓰지 않는다
**거미 형태 줄타기는 엘리스를 공중으로 올려 잠시 공격할 수 없게 만들고 선택한 대상에게 내려오게 한다.** 올라간 순간 큰 기술을 쓰지 말고 주변 착지 가능한 유닛과 챔피언을 본다. 아군이 서로 벌어져 착지 대상을 제한하고 내려온 지점에 제어를 맞춘다.

## 짧은 폭발 뒤 긴 싸움으로 바꾼다
**엘리스는 인간과 거미 기술을 한 차례 모두 쓰면 다음 순환까지 공백이 생긴다.** 첫 연계를 생존한 뒤에 반격하고 새끼 거미에 단일 기술을 낭비하지 않는다. 목표물 앞에서는 벽 너머 줄타기 진입보다 고치 직선을 먼저 시야로 확인한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-elise' AND kind = 'matchup' AND champion_slug = 'elise'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-elise');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-matchup-elise-20260915', id, NULL, 0, general, '정글 AP 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-elise' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 고치를 유닛으로 막는다 · 인간 Q를 높은 체력에 맞지 않는다 · 줄타기 착지 대상을 제한한다

## 고치의 첫 적중 대상을 대신 세운다
**엘리스의 인간 형태 `E`는 처음 맞는 적 유닛을 기절시키므로 미니언이나 소환물을 사이에 두면 갱킹 연계를 끊을 수 있다.**[* [엘리스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=106)] 직선으로 뒤로 빠지기보다 유닛 뒤에서 옆으로 움직인다. 고치가 빗나가면 거미 형태 진입을 서두르기 어려우므로 그때 거리를 되찾는다.

## 현재 체력이 높을 때 인간 Q 교환을 피한다
**신경독은 현재 체력에 비례해 강하고 독이빨은 잃은 체력에 비례해 마무리 힘이 커진다.** 첫 기술을 공짜로 맞지 말고, 체력이 낮아진 뒤에는 거미 Q 사거리 밖으로 빠진다. 두 형태를 모두 쓸 시간을 주지 않도록 짧게 제어하고 이탈한다.

## 줄타기 중 기술을 허공에 쓰지 않는다
**거미 형태 줄타기는 엘리스를 공중으로 올려 잠시 공격할 수 없게 만들고 선택한 대상에게 내려오게 한다.** 올라간 순간 큰 기술을 쓰지 말고 주변 착지 가능한 유닛과 챔피언을 본다. 아군이 서로 벌어져 착지 대상을 제한하고 내려온 지점에 제어를 맞춘다.

## 짧은 폭발 뒤 긴 싸움으로 바꾼다
**엘리스는 인간과 거미 기술을 한 차례 모두 쓰면 다음 순환까지 공백이 생긴다.** 첫 연계를 생존한 뒤에 반격하고 새끼 거미에 단일 기술을 낭비하지 않는다. 목표물 앞에서는 벽 너머 줄타기 진입보다 고치 직선을 먼저 시야로 확인한다.'
AND updated_at = '2026-09-15T00:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-matchup-elise-20260915');

-- evelynn 상대법 (844자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-evelynn', 'matchup', NULL, NULL, 'published', 'evelynn', '', 0, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 일반 시야보다 위장 감지선을 관리한다 · 저주 방향을 역추적한다 · 최후의 포옹 뒤 착지점을 막는다

## 6레벨 이후에는 캠프보다 진입 경로를 밝힌다
**이블린은 악의 장막으로 위장해 일반 와드 바깥을 돌아올 수 있으므로 라인 가까운 감지 지점이 중요하다.**[* [이블린 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=14)] 강가 한가운데보다 내 뒤쪽 입구와 깊은 캠프 길목을 확인한다. `Q` 첫 가시에 맞으면 이어지는 공격이 강해지므로 미니언을 사이에 두고 즉시 위치를 바꾼다.

## 황홀한 저주 표식이 생기면 접근 방향을 찾는다
**W가 완성된 뒤 공격받으면 매혹과 마법 저항력 감소가 이어지지만, 이블린은 표식을 건 뒤 가까이 와야 한다.** 표식 화살과 소리를 보고 예상 반대편으로 무작정 달리지 말고 포탑과 아군 쪽으로 이동한다. 완성 전 작은 공격에 맞으면 둔화만 생기므로 바로 거리를 벌린다.

## 낮은 체력으로 혼자 남지 않는다
**이블린의 궁극기는 체력이 낮은 적에게 강한 마무리 피해를 주고 본체를 뒤로 이동시킨다.** 처치 표시가 보이면 전선에서 일찍 빠지고 한 명씩 수풀을 확인하지 않는다. 보호 기술은 첫 채찍보다 궁극기 피해가 들어올 순간에 맞춘다.

## 최후의 포옹 착지 방향을 추적한다
**궁극기 시전 중 이블린은 잠시 대상으로 지정할 수 없지만 정해진 뒤쪽으로 이동한다.** 사라진 자리에 기술을 겹치지 말고 예상 착지점과 다음 위장 경로를 시야로 막는다. 목표물 싸움에서는 체력이 낮아진 정글러에게 접근하지 못하도록 구덩이 바깥을 먼저 확인한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-evelynn' AND kind = 'matchup' AND champion_slug = 'evelynn'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-evelynn');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-matchup-evelynn-20260915', id, NULL, 0, general, '정글 AP 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-evelynn' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 일반 시야보다 위장 감지선을 관리한다 · 저주 방향을 역추적한다 · 최후의 포옹 뒤 착지점을 막는다

## 6레벨 이후에는 캠프보다 진입 경로를 밝힌다
**이블린은 악의 장막으로 위장해 일반 와드 바깥을 돌아올 수 있으므로 라인 가까운 감지 지점이 중요하다.**[* [이블린 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=14)] 강가 한가운데보다 내 뒤쪽 입구와 깊은 캠프 길목을 확인한다. `Q` 첫 가시에 맞으면 이어지는 공격이 강해지므로 미니언을 사이에 두고 즉시 위치를 바꾼다.

## 황홀한 저주 표식이 생기면 접근 방향을 찾는다
**W가 완성된 뒤 공격받으면 매혹과 마법 저항력 감소가 이어지지만, 이블린은 표식을 건 뒤 가까이 와야 한다.** 표식 화살과 소리를 보고 예상 반대편으로 무작정 달리지 말고 포탑과 아군 쪽으로 이동한다. 완성 전 작은 공격에 맞으면 둔화만 생기므로 바로 거리를 벌린다.

## 낮은 체력으로 혼자 남지 않는다
**이블린의 궁극기는 체력이 낮은 적에게 강한 마무리 피해를 주고 본체를 뒤로 이동시킨다.** 처치 표시가 보이면 전선에서 일찍 빠지고 한 명씩 수풀을 확인하지 않는다. 보호 기술은 첫 채찍보다 궁극기 피해가 들어올 순간에 맞춘다.

## 최후의 포옹 착지 방향을 추적한다
**궁극기 시전 중 이블린은 잠시 대상으로 지정할 수 없지만 정해진 뒤쪽으로 이동한다.** 사라진 자리에 기술을 겹치지 말고 예상 착지점과 다음 위장 경로를 시야로 막는다. 목표물 싸움에서는 체력이 낮아진 정글러에게 접근하지 못하도록 구덩이 바깥을 먼저 확인한다.'
AND updated_at = '2026-09-15T00:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-matchup-evelynn-20260915');

-- fiddlesticks 상대법 (824자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-fiddlesticks', 'matchup', NULL, NULL, 'published', 'fiddlesticks', '', 0, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 벽 너머 시야를 먼저 지운다 · 풍작을 끊는다 · 까마귀 폭풍 착지 뒤 흩어진다

## 피들스틱이 보이지 않을 때 전투를 열지 않는다
**피들스틱은 적 시야 밖에서 기술로 처음 피해를 주면 공포를 걸 수 있어, 벽 너머 궁극기가 진입과 제어를 동시에 만든다.**[* [피들스틱 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=16)] 목표물 주변 벽과 수풀을 원거리로 확인하고 허수아비인지 본체인지 직접 가까이 가서 시험하지 않는다. `Q`가 준비된 정면에서도 같은 대상에게 두 번 공포를 기대하지 않는다.

## 풍작은 끝나기 전에 끊는다
**W 정신 집중이 완료되면 잃은 체력에 비례한 추가 피해와 큰 회복이 들어간다.** 밀치기, 기절, 침묵 중 하나를 끝까지 남겨 즉시 끊고, 여러 아군이 동시에 범위에 들어가 회복량을 늘리지 않는다. 끊을 기술이 없다면 사거리 밖으로 빠져 연결을 끊는다.

## 수확 중앙의 침묵을 피한다
**E는 넓은 범위를 베어 느리게 하고 중앙에 맞은 적을 침묵시킨다.** 까마귀 폭풍 뒤 한 방향으로만 달아나 중앙선을 겹쳐 맞지 말고 옆으로 흩어진다. 이동기와 보호 기술을 써야 하는 아군은 피들스틱과 직선으로 서지 않는다.

## 까마귀 폭풍 채널 위치를 압박한다
**궁극기는 정신 집중이 필요하므로 시작 위치를 발견하면 이동하거나 방해해 진입 자체를 막을 수 있다.** 허수아비가 지우는 시야를 다시 확보하고 의심되는 벽 너머에 견제 기술을 보낸다. 이미 착지했다면 피들스틱을 가운데 두고 뭉치지 말고 풍작부터 끊는다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-fiddlesticks' AND kind = 'matchup' AND champion_slug = 'fiddlesticks'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-fiddlesticks');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-matchup-fiddlesticks-20260915', id, NULL, 0, general, '정글 AP 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-fiddlesticks' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 벽 너머 시야를 먼저 지운다 · 풍작을 끊는다 · 까마귀 폭풍 착지 뒤 흩어진다

## 피들스틱이 보이지 않을 때 전투를 열지 않는다
**피들스틱은 적 시야 밖에서 기술로 처음 피해를 주면 공포를 걸 수 있어, 벽 너머 궁극기가 진입과 제어를 동시에 만든다.**[* [피들스틱 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=16)] 목표물 주변 벽과 수풀을 원거리로 확인하고 허수아비인지 본체인지 직접 가까이 가서 시험하지 않는다. `Q`가 준비된 정면에서도 같은 대상에게 두 번 공포를 기대하지 않는다.

## 풍작은 끝나기 전에 끊는다
**W 정신 집중이 완료되면 잃은 체력에 비례한 추가 피해와 큰 회복이 들어간다.** 밀치기, 기절, 침묵 중 하나를 끝까지 남겨 즉시 끊고, 여러 아군이 동시에 범위에 들어가 회복량을 늘리지 않는다. 끊을 기술이 없다면 사거리 밖으로 빠져 연결을 끊는다.

## 수확 중앙의 침묵을 피한다
**E는 넓은 범위를 베어 느리게 하고 중앙에 맞은 적을 침묵시킨다.** 까마귀 폭풍 뒤 한 방향으로만 달아나 중앙선을 겹쳐 맞지 말고 옆으로 흩어진다. 이동기와 보호 기술을 써야 하는 아군은 피들스틱과 직선으로 서지 않는다.

## 까마귀 폭풍 채널 위치를 압박한다
**궁극기는 정신 집중이 필요하므로 시작 위치를 발견하면 이동하거나 방해해 진입 자체를 막을 수 있다.** 허수아비가 지우는 시야를 다시 확보하고 의심되는 벽 너머에 견제 기술을 보낸다. 이미 착지했다면 피들스틱을 가운데 두고 뭉치지 말고 풍작부터 끊는다.'
AND updated_at = '2026-09-15T00:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-matchup-fiddlesticks-20260915');

-- karthus 상대법 (844자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-karthus', 'matchup', NULL, NULL, 'published', 'karthus', '', 0, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 황폐화를 계속 움직여 피한다 · 한 명만 폭발 범위에 남지 않는다 · 진혼곡 정신 집중을 방해한다

## 황폐화가 놓인 자리에서 즉시 한 걸음 옮긴다
**카서스의 `Q`는 잠시 뒤 폭발하며 범위 안에 대상이 하나뿐이면 피해가 더 커진다.**[* [카서스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=27)] 같은 방향으로만 달리지 말고 좌우 이동 간격을 바꿔 다음 예측을 어렵게 한다. 아군이나 미니언 가까이에서 맞으면 단일 추가 피해를 피할 수 있지만 여러 폭발을 함께 맞지 않도록 간격을 둔다.

## 고통의 벽을 통과한 뒤 바로 맞서지 않는다
**W를 지나면 이동 속도와 마법 저항력이 낮아져 후속 황폐화를 피하기 어려워진다.** 다른 입구가 있으면 우회하고, 반드시 지나야 한다면 이동기를 벽 통과 뒤에 사용한다. 느려진 아군을 버리고 앞으로 달리기보다 카서스의 접근을 함께 끊는다.

## 죽은 카서스 위에서 전투를 계속하지 않는다
**카서스는 쓰러진 뒤에도 잠시 기술을 사용할 수 있어 부패 범위와 황폐화를 계속 남긴다.** 처치 직후 시체에서 흩어지고 좁은 목표물 안에서 머무르지 않는다. 죽었다고 모든 방해 기술을 다른 적에게 써 버리면 진혼곡 정신 집중을 막을 수 없다.

## 진혼곡은 체력과 정신 집중을 함께 본다
**궁극기는 모든 적에게 피해를 주지만 긴 정신 집중이 필요하다.** 카서스가 보이는 곳이면 즉시 방해하고, 보이지 않으면 체력이 낮은 아군에게 보호와 회복 시간을 알린다. 목표물 교전 뒤 전원이 낮아진 상태로 흩어지지 말고 진혼곡 가능 여부를 확인한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-karthus' AND kind = 'matchup' AND champion_slug = 'karthus'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-karthus');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-matchup-karthus-20260915', id, NULL, 0, general, '정글 AP 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-karthus' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 황폐화를 계속 움직여 피한다 · 한 명만 폭발 범위에 남지 않는다 · 진혼곡 정신 집중을 방해한다

## 황폐화가 놓인 자리에서 즉시 한 걸음 옮긴다
**카서스의 `Q`는 잠시 뒤 폭발하며 범위 안에 대상이 하나뿐이면 피해가 더 커진다.**[* [카서스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=27)] 같은 방향으로만 달리지 말고 좌우 이동 간격을 바꿔 다음 예측을 어렵게 한다. 아군이나 미니언 가까이에서 맞으면 단일 추가 피해를 피할 수 있지만 여러 폭발을 함께 맞지 않도록 간격을 둔다.

## 고통의 벽을 통과한 뒤 바로 맞서지 않는다
**W를 지나면 이동 속도와 마법 저항력이 낮아져 후속 황폐화를 피하기 어려워진다.** 다른 입구가 있으면 우회하고, 반드시 지나야 한다면 이동기를 벽 통과 뒤에 사용한다. 느려진 아군을 버리고 앞으로 달리기보다 카서스의 접근을 함께 끊는다.

## 죽은 카서스 위에서 전투를 계속하지 않는다
**카서스는 쓰러진 뒤에도 잠시 기술을 사용할 수 있어 부패 범위와 황폐화를 계속 남긴다.** 처치 직후 시체에서 흩어지고 좁은 목표물 안에서 머무르지 않는다. 죽었다고 모든 방해 기술을 다른 적에게 써 버리면 진혼곡 정신 집중을 막을 수 없다.

## 진혼곡은 체력과 정신 집중을 함께 본다
**궁극기는 모든 적에게 피해를 주지만 긴 정신 집중이 필요하다.** 카서스가 보이는 곳이면 즉시 방해하고, 보이지 않으면 체력이 낮은 아군에게 보호와 회복 시간을 알린다. 목표물 교전 뒤 전원이 낮아진 상태로 흩어지지 말고 진혼곡 가능 여부를 확인한다.'
AND updated_at = '2026-09-15T00:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-matchup-karthus-20260915');

-- amumu 상대법 (831자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-amumu', 'matchup', NULL, NULL, 'published', 'amumu', '', 0, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 붕대를 유닛으로 막는다 · 두 번째 충전까지 센다 · 궁극기에 한꺼번에 묶이지 않는다

## 붕대 던지기 직선에 앞선을 둔다
**아무무의 `Q`는 처음 맞은 적을 기절시키고 그 위치로 이동하므로 미니언과 단단한 아군이 진입 대상을 바꿀 수 있다.**[* [아무무 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=3)] 뒤로만 빠지기보다 투사체와 직각으로 움직이고, 첫 붕대가 빠진 뒤에도 남은 충전을 기억한다. 두 번 모두 빗나가면 추격 수단이 크게 줄어든다.

## 절망 범위에서 오래 싸우지 않는다
**W는 주변 적의 최대 체력에 비례한 피해를 계속 주고 저주 효과를 갱신한다.** 아무무와 붙은 채 앞선끼리 오래 버티지 말고 밀어내거나 범위 밖으로 이동한다. 기본 공격으로 저주가 묻은 상태에서는 이어지는 마법 피해도 강해지므로 짧은 교환 뒤 끊는다.

## 짜증내기는 기본 공격을 많이 받을수록 빨리 돌아온다
**E는 받는 물리 피해를 줄이며 아무무가 공격받을 때 재사용 대기시간이 감소한다.** 여러 명이 약한 기본 공격을 계속 넣기보다 제어와 집중 피해를 맞춘다. 작은 몬스터나 미니언 사이에서는 짜증내기 횟수가 늘어나므로 그 자리에서 싸우지 않는다.

## 슬픈 미라의 저주에 한 줄로 들어가지 않는다
**궁극기는 아무무 주변 적을 모두 기절시키므로 목표물 입구와 좁은 길에서 팀 전체가 묶일 수 있다.** 앞선과 후열의 간격을 벌리고 아무무가 붕대로 들어온 착지점에서 흩어진다. 첫 진입을 받은 아군에게 보호를 주되 나머지는 궁극기 범위 밖에서 반격한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-amumu' AND kind = 'matchup' AND champion_slug = 'amumu'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-amumu');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-matchup-amumu-20260915', id, NULL, 0, general, '정글 AP 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-amumu' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 붕대를 유닛으로 막는다 · 두 번째 충전까지 센다 · 궁극기에 한꺼번에 묶이지 않는다

## 붕대 던지기 직선에 앞선을 둔다
**아무무의 `Q`는 처음 맞은 적을 기절시키고 그 위치로 이동하므로 미니언과 단단한 아군이 진입 대상을 바꿀 수 있다.**[* [아무무 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=3)] 뒤로만 빠지기보다 투사체와 직각으로 움직이고, 첫 붕대가 빠진 뒤에도 남은 충전을 기억한다. 두 번 모두 빗나가면 추격 수단이 크게 줄어든다.

## 절망 범위에서 오래 싸우지 않는다
**W는 주변 적의 최대 체력에 비례한 피해를 계속 주고 저주 효과를 갱신한다.** 아무무와 붙은 채 앞선끼리 오래 버티지 말고 밀어내거나 범위 밖으로 이동한다. 기본 공격으로 저주가 묻은 상태에서는 이어지는 마법 피해도 강해지므로 짧은 교환 뒤 끊는다.

## 짜증내기는 기본 공격을 많이 받을수록 빨리 돌아온다
**E는 받는 물리 피해를 줄이며 아무무가 공격받을 때 재사용 대기시간이 감소한다.** 여러 명이 약한 기본 공격을 계속 넣기보다 제어와 집중 피해를 맞춘다. 작은 몬스터나 미니언 사이에서는 짜증내기 횟수가 늘어나므로 그 자리에서 싸우지 않는다.

## 슬픈 미라의 저주에 한 줄로 들어가지 않는다
**궁극기는 아무무 주변 적을 모두 기절시키므로 목표물 입구와 좁은 길에서 팀 전체가 묶일 수 있다.** 앞선과 후열의 간격을 벌리고 아무무가 붕대로 들어온 착지점에서 흩어진다. 첫 진입을 받은 아군에게 보호를 주되 나머지는 궁극기 범위 밖에서 반격한다.'
AND updated_at = '2026-09-15T00:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-matchup-amumu-20260915');

-- gragas 상대법 (833자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-gragas', 'matchup', NULL, NULL, 'published', 'gragas', '', 0, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 익는 술통에서 벗어난다 · 몸통 박치기를 유닛으로 막는다 · 궁극기 중심과 같은 선에 서지 않는다

## 술통이 오래 놓일수록 범위를 포기한다
**그라가스의 `Q`는 바닥에서 익을수록 피해와 둔화가 강해지므로 이미 놓인 지역에서 교전을 이어 주지 않는다.**[* [그라가스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=20)] 즉시 폭발은 반응하기 어렵지만 약하므로 첫 피해 뒤 익은 술통 쪽으로 달아나지 않는다. 목표물 안에 깔리면 반대편으로 자리를 옮겨 선택을 강요한다.

## 몸통 박치기의 첫 충돌 대상을 바꾼다
**`E`는 처음 부딪힌 적과 주변을 기절시키므로 미니언, 소환물, 앞선이 핵심 대상을 가릴 수 있다.** 벽 너머에서 오는 각에 시야를 두고 정면으로 한 줄 서지 않는다. 빗나가면 이동기와 제어가 함께 빠지므로 술통 둔화가 끝난 뒤 거리를 좁힌다.

## 취중 분노가 켜진 동안 짧게 물러난다
**W 이후 그라가스는 받는 피해가 줄고 다음 기본 공격이 강화된다.** 마시는 동작을 보면 바로 근접 교환을 열지 말고 강화 공격이 다른 대상에 빠지게 한다. 정신 집중 중에는 움직이지 못하지만 짧으므로 위험한 위치까지 쫓아가 끊으려 하지 않는다.

## 술통 폭발의 중심과 아군 사이를 피한다
**궁극기는 폭발 중심에서 바깥으로 밀어내므로 그라가스가 원하는 방향에 따라 아군에게서 분리될 수 있다.** 벽과 적 진영을 등지지 말고 옆 간격을 둔다. 한 명이 배달되면 모두 따라 들어가기보다 그라가스의 다음 E를 끊고 밀려난 아군이 돌아올 시간을 번다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-gragas' AND kind = 'matchup' AND champion_slug = 'gragas'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-gragas');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-matchup-gragas-20260915', id, NULL, 0, general, '정글 AP 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-gragas' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 익는 술통에서 벗어난다 · 몸통 박치기를 유닛으로 막는다 · 궁극기 중심과 같은 선에 서지 않는다

## 술통이 오래 놓일수록 범위를 포기한다
**그라가스의 `Q`는 바닥에서 익을수록 피해와 둔화가 강해지므로 이미 놓인 지역에서 교전을 이어 주지 않는다.**[* [그라가스 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=20)] 즉시 폭발은 반응하기 어렵지만 약하므로 첫 피해 뒤 익은 술통 쪽으로 달아나지 않는다. 목표물 안에 깔리면 반대편으로 자리를 옮겨 선택을 강요한다.

## 몸통 박치기의 첫 충돌 대상을 바꾼다
**`E`는 처음 부딪힌 적과 주변을 기절시키므로 미니언, 소환물, 앞선이 핵심 대상을 가릴 수 있다.** 벽 너머에서 오는 각에 시야를 두고 정면으로 한 줄 서지 않는다. 빗나가면 이동기와 제어가 함께 빠지므로 술통 둔화가 끝난 뒤 거리를 좁힌다.

## 취중 분노가 켜진 동안 짧게 물러난다
**W 이후 그라가스는 받는 피해가 줄고 다음 기본 공격이 강화된다.** 마시는 동작을 보면 바로 근접 교환을 열지 말고 강화 공격이 다른 대상에 빠지게 한다. 정신 집중 중에는 움직이지 못하지만 짧으므로 위험한 위치까지 쫓아가 끊으려 하지 않는다.

## 술통 폭발의 중심과 아군 사이를 피한다
**궁극기는 폭발 중심에서 바깥으로 밀어내므로 그라가스가 원하는 방향에 따라 아군에게서 분리될 수 있다.** 벽과 적 진영을 등지지 말고 옆 간격을 둔다. 한 명이 배달되면 모두 따라 들어가기보다 그라가스의 다음 E를 끊고 밀려난 아군이 돌아올 시간을 번다.'
AND updated_at = '2026-09-15T00:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-matchup-gragas-20260915');

-- neeko 상대법 (834자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-neeko', 'matchup', NULL, NULL, 'published', 'neeko', '', 0, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 유닛 수와 행동으로 변신을 찾는다 · 강화 올가미 직선을 피한다 · 만개 착지 전에 흩어진다

## 평소와 다른 유닛 하나를 의심한다
**니코는 아군 챔피언과 여러 유닛 모습으로 변할 수 있어 미니언 수, 이동 속도, 체력 표시의 어색함이 단서가 된다.**[* [니코 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=142)] 라인에 유닛이 하나 더 있거나 정글 몬스터가 길을 벗어나 움직이면 가까이 가지 말고 원거리로 확인한다. `W` 분신까지 섞이면 먼저 달리는 개체에 큰 기술을 쓰지 않는다.

## 칭칭올가미 앞에 유닛을 두지 않는다
**E는 첫 적을 관통한 뒤 더 크고 빠르게 날아가며 속박도 길어지므로 미니언 뒤가 오히려 위험할 수 있다.** 유닛과 같은 직선에서 옆으로 벗어나고, 강화된 투사체가 된 뒤에는 뒤로만 피하지 않는다. 올가미가 빠지면 꽃망울 추가 폭발 자리에서 이동한다.

## 형상 분리의 두 갈래를 끝까지 본다
**W 사용 시 니코와 분신이 잠시 구분하기 어려워지고 분신 방향도 다시 바뀔 수 있다.** 피해 숫자와 기술 반응을 보고 본체를 판단하며 한쪽에 제어를 모두 쓰지 않는다. 수풀로 들어간 두 개체를 직접 쫓기보다 출구를 나눠 막는다.

## 만개 준비가 보이지 않아도 착지 범위를 예상한다
**변신한 니코는 궁극기 준비 동작을 숨길 수 있고, 도약 뒤 주변을 띄운 다음 착지하며 기절시킨다.** 수상한 유닛이 가까워지면 팀 전체가 한쪽으로 모이지 않는다. 공중에 뜬 순간 이동기로 범위를 벗어나고, 착지 뒤 보호막이 끝날 때 집중한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-neeko' AND kind = 'matchup' AND champion_slug = 'neeko'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-neeko');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-matchup-neeko-20260915', id, NULL, 0, general, '정글 AP 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-neeko' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 유닛 수와 행동으로 변신을 찾는다 · 강화 올가미 직선을 피한다 · 만개 착지 전에 흩어진다

## 평소와 다른 유닛 하나를 의심한다
**니코는 아군 챔피언과 여러 유닛 모습으로 변할 수 있어 미니언 수, 이동 속도, 체력 표시의 어색함이 단서가 된다.**[* [니코 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=142)] 라인에 유닛이 하나 더 있거나 정글 몬스터가 길을 벗어나 움직이면 가까이 가지 말고 원거리로 확인한다. `W` 분신까지 섞이면 먼저 달리는 개체에 큰 기술을 쓰지 않는다.

## 칭칭올가미 앞에 유닛을 두지 않는다
**E는 첫 적을 관통한 뒤 더 크고 빠르게 날아가며 속박도 길어지므로 미니언 뒤가 오히려 위험할 수 있다.** 유닛과 같은 직선에서 옆으로 벗어나고, 강화된 투사체가 된 뒤에는 뒤로만 피하지 않는다. 올가미가 빠지면 꽃망울 추가 폭발 자리에서 이동한다.

## 형상 분리의 두 갈래를 끝까지 본다
**W 사용 시 니코와 분신이 잠시 구분하기 어려워지고 분신 방향도 다시 바뀔 수 있다.** 피해 숫자와 기술 반응을 보고 본체를 판단하며 한쪽에 제어를 모두 쓰지 않는다. 수풀로 들어간 두 개체를 직접 쫓기보다 출구를 나눠 막는다.

## 만개 준비가 보이지 않아도 착지 범위를 예상한다
**변신한 니코는 궁극기 준비 동작을 숨길 수 있고, 도약 뒤 주변을 띄운 다음 착지하며 기절시킨다.** 수상한 유닛이 가까워지면 팀 전체가 한쪽으로 모이지 않는다. 공중에 뜬 순간 이동기로 범위를 벗어나고, 착지 뒤 보호막이 끝날 때 집중한다.'
AND updated_at = '2026-09-15T00:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-matchup-neeko-20260915');

-- ivern 상대법 (830자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-ivern', 'matchup', NULL, NULL, 'published', 'ivern', '', 0, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 표시한 캠프 회수 시간을 노린다 · 덩굴뿌리 뒤 아군 돌진을 경계한다 · 보호막 폭발에서 벗어난다

## 숲이 완성되기 전 캠프 동선을 압박한다
**아이번은 몬스터와 직접 싸우지 않고 숲을 만든 뒤 돌아와 캠프를 해방하므로 표시와 회수 사이에 시간이 생긴다.**[* [아이번 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=133)] 깊은 시야로 표시한 캠프를 확인하고 라인 주도권이 있을 때만 침입한다. 아이번 본체를 쫓느라 완성된 다른 캠프와 반대편 목표물을 모두 내주지 않는다.

## 덩굴뿌리에 맞으면 아이번만 오는 것이 아니다
**`Q`로 속박된 대상에게 아이번과 아군이 돌진할 수 있어 근접 챔피언의 진입 거리가 늘어난다.** 미니언을 방패로 쓰고 옆으로 피하며, 맞았다면 뒤따를 적의 위치부터 확인한다. 속박이 끝난 뒤 한 방향으로 모두 달아나 보호막 폭발을 겹쳐 맞지 않는다.

## 보호의 씨앗은 폭발 시점에 거리를 둔다
**E 보호막은 잠시 뒤 폭발해 주변 적에게 피해와 둔화를 주며, 적을 맞히지 않으면 다시 생길 수 있다.** 보호막 대상과 붙어 싸우지 말고 폭발 범위 밖으로 잠깐 빠진다. 데이지에게 걸렸다면 본체보다 데이지의 접근을 먼저 끊는다.

## 데이지의 세 번째 타격을 세고 본체를 압박한다
**데이지가 같은 대상을 연속 공격하면 띄우기를 만들 수 있어 앞선이 오래 묶인다.** 두 번 맞은 아군은 자리를 바꾸고 데이지와 아이번 사이를 벌린다. 데이지만 끝없이 때리기보다 아이번이 보호막과 Q를 쓰지 못하도록 시야와 거리를 압박한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-ivern' AND kind = 'matchup' AND champion_slug = 'ivern'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-ivern');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-matchup-ivern-20260915', id, NULL, 0, general, '정글 AP 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-ivern' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 표시한 캠프 회수 시간을 노린다 · 덩굴뿌리 뒤 아군 돌진을 경계한다 · 보호막 폭발에서 벗어난다

## 숲이 완성되기 전 캠프 동선을 압박한다
**아이번은 몬스터와 직접 싸우지 않고 숲을 만든 뒤 돌아와 캠프를 해방하므로 표시와 회수 사이에 시간이 생긴다.**[* [아이번 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=133)] 깊은 시야로 표시한 캠프를 확인하고 라인 주도권이 있을 때만 침입한다. 아이번 본체를 쫓느라 완성된 다른 캠프와 반대편 목표물을 모두 내주지 않는다.

## 덩굴뿌리에 맞으면 아이번만 오는 것이 아니다
**`Q`로 속박된 대상에게 아이번과 아군이 돌진할 수 있어 근접 챔피언의 진입 거리가 늘어난다.** 미니언을 방패로 쓰고 옆으로 피하며, 맞았다면 뒤따를 적의 위치부터 확인한다. 속박이 끝난 뒤 한 방향으로 모두 달아나 보호막 폭발을 겹쳐 맞지 않는다.

## 보호의 씨앗은 폭발 시점에 거리를 둔다
**E 보호막은 잠시 뒤 폭발해 주변 적에게 피해와 둔화를 주며, 적을 맞히지 않으면 다시 생길 수 있다.** 보호막 대상과 붙어 싸우지 말고 폭발 범위 밖으로 잠깐 빠진다. 데이지에게 걸렸다면 본체보다 데이지의 접근을 먼저 끊는다.

## 데이지의 세 번째 타격을 세고 본체를 압박한다
**데이지가 같은 대상을 연속 공격하면 띄우기를 만들 수 있어 앞선이 오래 묶인다.** 두 번 맞은 아군은 자리를 바꾸고 데이지와 아이번 사이를 벌린다. 데이지만 끝없이 때리기보다 아이번이 보호막과 Q를 쓰지 못하도록 시야와 거리를 압박한다.'
AND updated_at = '2026-09-15T00:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-matchup-ivern-20260915');

-- skarner 상대법 (800자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-skarner', 'matchup', NULL, NULL, 'published', 'skarner', '', 0, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 바위 세 공격을 센다 · 지형 통과 경로에서 벗어난다 · 꿰뚫기 앞에 한 줄로 서지 않는다

## 부서진 대지의 세 번째 공격을 피한다
**스카너의 `Q`는 다음 세 기본 공격을 강화하고 마지막 공격에 큰 체력 비례 피해와 둔화를 더한다.**[* [스카너 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=82)] 두 번 맞았다면 거리를 벌려 마지막 타격을 허용하지 않는다. 스카너가 바위를 던질 수도 있으므로 직선으로 도망치지 말고 투척 동작에 옆으로 움직인다.

## 벽 가까이에서 이쉬탈의 격돌을 맞지 않는다
**E는 지형을 통과하고 챔피언을 붙잡은 뒤 벽에 충돌시키면 기절시킨다.** 스카너가 사라졌다면 긴 벽과 평행하게 걷지 말고 열린 공간으로 이동한다. 잡혔을 때 벽까지 거리가 멀면 충돌 전에 아군이 이동을 방해할 시간을 만들 수 있다.

## 대지의 수호자 보호막 뒤 화력을 나눈다
**W는 스카너에게 보호막을 주며 주변에 피해와 둔화를 적용한다.** 진입 직후 보호막에 모든 공격을 쓰지 말고 사라진 뒤 집중한다. 전율 세 중첩이 쌓이면 최대 체력 비례 지속 피해가 생기므로 중첩이 완성되기 전에 거리를 끊는다.

## 꿰뚫기 범위에 여러 명이 서지 않는다
**궁극기는 전방의 여러 챔피언을 제압해 스카너와 함께 끌고 갈 수 있다.** 좁은 입구에서 일렬로 겹치지 말고 핵심 딜러는 앞선과 각도를 벌린다. 끌린 아군만 쫓아가기보다 스카너의 이동 경로에 제어를 준비해 적 진영까지 배달되지 않게 한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-skarner' AND kind = 'matchup' AND champion_slug = 'skarner'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-skarner');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-matchup-skarner-20260915', id, NULL, 0, general, '정글 AP 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-skarner' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 바위 세 공격을 센다 · 지형 통과 경로에서 벗어난다 · 꿰뚫기 앞에 한 줄로 서지 않는다

## 부서진 대지의 세 번째 공격을 피한다
**스카너의 `Q`는 다음 세 기본 공격을 강화하고 마지막 공격에 큰 체력 비례 피해와 둔화를 더한다.**[* [스카너 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=82)] 두 번 맞았다면 거리를 벌려 마지막 타격을 허용하지 않는다. 스카너가 바위를 던질 수도 있으므로 직선으로 도망치지 말고 투척 동작에 옆으로 움직인다.

## 벽 가까이에서 이쉬탈의 격돌을 맞지 않는다
**E는 지형을 통과하고 챔피언을 붙잡은 뒤 벽에 충돌시키면 기절시킨다.** 스카너가 사라졌다면 긴 벽과 평행하게 걷지 말고 열린 공간으로 이동한다. 잡혔을 때 벽까지 거리가 멀면 충돌 전에 아군이 이동을 방해할 시간을 만들 수 있다.

## 대지의 수호자 보호막 뒤 화력을 나눈다
**W는 스카너에게 보호막을 주며 주변에 피해와 둔화를 적용한다.** 진입 직후 보호막에 모든 공격을 쓰지 말고 사라진 뒤 집중한다. 전율 세 중첩이 쌓이면 최대 체력 비례 지속 피해가 생기므로 중첩이 완성되기 전에 거리를 끊는다.

## 꿰뚫기 범위에 여러 명이 서지 않는다
**궁극기는 전방의 여러 챔피언을 제압해 스카너와 함께 끌고 갈 수 있다.** 좁은 입구에서 일렬로 겹치지 말고 핵심 딜러는 앞선과 각도를 벌린다. 끌린 아군만 쫓아가기보다 스카너의 이동 경로에 제어를 준비해 적 진영까지 배달되지 않게 한다.'
AND updated_at = '2026-09-15T00:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-matchup-skarner-20260915');

-- zaahen 상대법 (812자)
INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)
VALUES ('doc-c-zaahen', 'matchup', NULL, NULL, 'published', 'zaahen', '', 0, '16.17.1', 'guarded', '2026-09-15T00:50:00.000Z', '2026-09-15T00:50:00.000Z', 'user-system');
UPDATE wiki_docs
SET general = '# 정글 상대법

> **한눈에 보기** — 강화 Q 두 단계를 센다 · 공포의 귀환 직선을 피한다 · 결의가 차기 전에 교전을 끊는다

## 다르킨의 글레이브 두 번째 공격을 기다린다
**자헨의 `Q`는 첫 강화 공격에서 두 번 타격하고 회복하며, 재사용 뒤 다음 공격은 대상을 띄운다.**[* [자헨 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=172)] 첫 공격을 맞았다고 끝난 것이 아니므로 공중에 띄우는 후속 전에 거리를 둔다. 강화 공격이 미니언이나 앞선에 빠진 뒤 핵심 딜러가 접근한다.

## 공포의 귀환과 쇄도 가장자리를 함께 피한다
**W는 전방 적을 끌어당겨 찬란한 쇄도의 범위에 모으기 좋다.** 투사 방향과 직각으로 이동하고, 끌렸다면 자헨 중심에 어중간하게 서지 말고 쇄도 가장자리에서 벗어난다. W가 빗나간 뒤에는 깊은 돌진을 제어할 기회가 생긴다.

## 결의 중첩이 가득 차기 전에 싸움을 끝낸다
**자헨은 챔피언을 계속 공격하면 결의를 쌓고, 완전히 쌓인 상태에서 쓰러지면 부활할 수 있다.** 여러 앞선을 번갈아 치게 두지 말고 짧게 집중하거나 전투를 끊어 중첩을 초기화한다. 부활 표시가 켜졌다면 시체 주변에 모두 모이지 말고 다시 일어날 위치를 둘러싼다.

## 단호한 판결 중에는 마무리 피해를 아낀다
**궁극기 사용 중 자헨은 받는 피해가 줄고 착지 후 챔피언에게 준 피해 일부를 회복한다.** 공중에 뜬 동안 큰 기술을 낭비하지 말고 착지 범위에서 빠진다. 내려온 직후 제어를 겹쳐 다음 Q 회복과 W 끌어당기기를 쓰지 못하게 한다.', revision = 1, patch = '16.17.1', updated_at = '2026-09-15T00:50:00.000Z', updated_by = 'user-system'
WHERE id = 'doc-c-zaahen' AND kind = 'matchup' AND champion_slug = 'zaahen'
AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = 'doc-c-zaahen');
INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)
SELECT 'edit-jungle-ap-matchup-zaahen-20260915', id, NULL, 0, general, '정글 AP 상대법 작성', 'accepted', 'user-system', '2026-09-15T00:50:00.000Z', 'admin', 1 FROM wiki_docs
WHERE id = 'doc-c-zaahen' AND revision = 1 AND general = '# 정글 상대법

> **한눈에 보기** — 강화 Q 두 단계를 센다 · 공포의 귀환 직선을 피한다 · 결의가 차기 전에 교전을 끊는다

## 다르킨의 글레이브 두 번째 공격을 기다린다
**자헨의 `Q`는 첫 강화 공격에서 두 번 타격하고 회복하며, 재사용 뒤 다음 공격은 대상을 띄운다.**[* [자헨 챔피언 정보](https://lol.inven.co.kr/dataninfo/champion/detail.php?code=172)] 첫 공격을 맞았다고 끝난 것이 아니므로 공중에 띄우는 후속 전에 거리를 둔다. 강화 공격이 미니언이나 앞선에 빠진 뒤 핵심 딜러가 접근한다.

## 공포의 귀환과 쇄도 가장자리를 함께 피한다
**W는 전방 적을 끌어당겨 찬란한 쇄도의 범위에 모으기 좋다.** 투사 방향과 직각으로 이동하고, 끌렸다면 자헨 중심에 어중간하게 서지 말고 쇄도 가장자리에서 벗어난다. W가 빗나간 뒤에는 깊은 돌진을 제어할 기회가 생긴다.

## 결의 중첩이 가득 차기 전에 싸움을 끝낸다
**자헨은 챔피언을 계속 공격하면 결의를 쌓고, 완전히 쌓인 상태에서 쓰러지면 부활할 수 있다.** 여러 앞선을 번갈아 치게 두지 말고 짧게 집중하거나 전투를 끊어 중첩을 초기화한다. 부활 표시가 켜졌다면 시체 주변에 모두 모이지 말고 다시 일어날 위치를 둘러싼다.

## 단호한 판결 중에는 마무리 피해를 아낀다
**궁극기 사용 중 자헨은 받는 피해가 줄고 착지 후 챔피언에게 준 피해 일부를 회복한다.** 공중에 뜬 동안 큰 기술을 낭비하지 말고 착지 범위에서 빠진다. 내려온 직후 제어를 겹쳐 다음 Q 회복과 W 끌어당기기를 쓰지 못하게 한다.'
AND updated_at = '2026-09-15T00:50:00.000Z' AND updated_by = 'user-system'
AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-jungle-ap-matchup-zaahen-20260915');
