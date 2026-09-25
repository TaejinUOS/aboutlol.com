-- 2026-09-26: 라이엇 공식 자료와 원문 연구를 반영한 티어표 작성 근거 문서.
-- 편집 기록과 위키링크 그래프까지 함께 갱신한다.
-- 현재 리비전이 1일 때만 반영되며, 다른 편집이 먼저 들어왔다면 수동 병합한다.
UPDATE wiki_docs
SET general = '이 문서는 ABOUTLOL의 **포지션별 S~F 티어표를 어떻게 판단하고 수정할지** 기록한다. 2026년 9월 26일 현재 챔피언 등급은 아직 배정되지 않았다. 아래는 앞으로 배정할 때 적용할 원칙이며, 라이엇의 공식 티어 산식이 아니다.

## 라이엇 자료에서 확인한 점

- 라이엇의 2019년 챔피언 밸런스 프레임워크는 일반·상위·최상위 솔로 랭크와 프로 경기를 나눠 본다. 일반/상위 구간에서는 승률과 밴율을 함께 보고, 프로에서는 패치별 경기 수가 적어 승률보다 픽·밴 비중(presence)을 중시한다. 이는 **한 구간의 승률을 모든 이용자의 챔피언 성능으로 일반화하면 안 된다**는 근거다. [라이엇: Champion Balance Framework (2019)](https://www.leagueoflegends.com/en-us/news/dev/dev-champion-balance-framework/) · [라이엇: Balancing for Pro Play (2020)](https://www.leagueoflegends.com/en-us/news/dev/dev-balancing-for-pro-play/)
- 라이엇은 2020년 프레임워크를 수정하면서 최상위 구간을 넓혀 승률을 볼 표본을 확보하고, 높은 밴율과 승률의 결합을 살폈다. 예전 글의 수치 경계는 당시 **패치 조정 대상을 찾기 위한 기준**이지 ABOUTLOL의 S~F 경계가 아니다. [라이엇: Balance Framework Update (2020)](https://www.leagueoflegends.com/en-us/news/dev/dev-balance-framework-update/)
- 신챔피언·대규모 개편 챔피언은 이용자가 익숙해지는 동안 승률이 움직인다. 라이엇은 숙련도 곡선을 고려하며 출시 직후 승률만으로 장기 성능을 판단하지 않는다. 따라서 새 패치 첫 며칠의 수치로 등급을 확정하지 않는다. [라이엇: Balancing New Champions (2020)](https://www.leagueoflegends.com/en-us/news/dev/dev-balancing-new-champions/)

## 연구에서 얻은 주의점

- Lin 등의 2024년 연구는 리그 오브 레전드를 포함한 PvP 게임에서 **단순 전체 승률만으로 조합 사이의 카운터 관계를 설명하기 어렵다**고 보고, 조합 간 강약 관계를 따로 분석했다. 이 논문이 챔피언별 S~F 등급을 검증한 것은 아니다. ABOUTLOL에는 단일 순위와 함께 상대 조합·매치업 문서를 보라는 교훈으로 적용한다. [Lin 등, 2024, 게임 조합의 카운터 관계 연구](https://arxiv.org/abs/2408.17180)
- Brown·Cai·DasGupta의 이항비율 연구는 적은 표본에서 관측 비율의 불확실성을 무시하면 판단이 흔들릴 수 있음을 보이고, Wilson 구간 등을 검토한다. 승률을 근거로 쓸 때는 경기 수와 불확실성을 함께 적고, 표본이 적으면 **미배정 또는 판단 보류**로 둔다. 이 통계 원칙을 티어표에 적용하는 것은 ABOUTLOL의 해석이다. [Brown·Cai·DasGupta, 2001, 이항비율 구간 추정](https://projecteuclid.org/journals/statistical-science/volume-16/issue-2/Interval-Estimation-for-a-Binomial-Proportion/10.1214/ss/1009213286.pdf)

## ABOUTLOL 배정 절차

1. **비교 범위를 먼저 고정한다.** 포지션, 게임 모드, 서버, 실력 구간, 패치와 집계 기간을 밝힌다. 서로 다른 범위의 승률을 한 표에서 직접 비교하지 않는다.
2. **근거의 출처와 크기를 남긴다.** 공개 통계를 쓴다면 원본 링크, 집계일, 경기 수, 승률·픽률·밴율과 불확실성을 적는다. ABOUTLOL의 현재 전적 기능은 *개인별 최근 20경기 조회*이므로 전체 챔피언 승률의 근거로 쓰지 않는다.
3. **새 패치와 낮은 픽률은 보수적으로 본다.** 표본이 적거나 숙련도 곡선이 크게 작용할 때는 등급 확정을 미룬다. 패치가 바뀌면 이전 근거의 유효성을 다시 확인한다.
4. **포지션과 상대를 함께 본다.** 같은 챔피언도 포지션별로 별도 판단한다. 특정 카운터나 조합에 성능이 크게 갈리면 전체 등급 옆에 그 조건을 기록하고 상대법 위키를 연결한다.
5. **운영자가 이유를 기록하고 배정한다.** 수치만으로 자동 배정하지 않는다. 변경할 때는 이전 등급, 새 등급, 패치, 근거 자료와 판단 이유를 이 문서에 덧붙인다. 이용자는 [[티어표 건의]]에서 반례나 다른 해석을 제안할 수 있다.

## S~F의 의미

S는 정해진 비교 범위에서 폭넓게 강한 선택, A는 대체로 강한 선택, B는 안정적인 선택, C는 조건에 따라 좋은 선택, D는 뚜렷한 제약이 있는 선택, E는 유리한 조건이 좁은 선택, F는 충분한 근거가 있을 때만 쓰는 최하위 선택이다. 이는 **ABOUTLOL의 편집용 설명**이며 라이엇의 공식 등급이 아니다. 등급 간 고정 승률 경계는 아직 정하지 않았다. 근거가 부족한 챔피언은 F에 넣지 않고 미배정으로 둔다.

이 티어표는 이용자의 숙련도·상대 조합·패치에 따른 개인 경기 결과를 보장하지 않는다. 등급보다 구체적인 상대법이 필요하면 챔피언 위키를 함께 읽어야 한다.',
    revision = 2,
    updated_at = strftime('%Y-%m-%dT%H:%M:%fZ', 'now'),
    updated_by = 'system-tier-docs'
WHERE id = 'doc-tier-basis' AND kind = 'article' AND revision = 1;

INSERT INTO wiki_edits (
  id, doc_id, me_slug, base_revision, body, summary, status, author,
  created_at, accepted_via, revision
)
SELECT 'edit-tier-basis-research-20260926', id, NULL, 1, general,
       '라이엇 밸런스 자료와 연구를 바탕으로 작성 근거 정리', 'accepted',
       'system-tier-docs', updated_at, 'admin', 2
FROM wiki_docs
WHERE id = 'doc-tier-basis' AND revision = 2 AND updated_by = 'system-tier-docs'
  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-tier-basis-research-20260926');

DELETE FROM wiki_links
WHERE source_doc = 'doc-tier-basis' AND source_key IS NULL
  AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-tier-basis-research-20260926');

INSERT INTO wiki_links (source_doc, source_key, target_key, target_title)
SELECT 'doc-tier-basis', NULL, '티어표건의', '티어표 건의'
WHERE EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-tier-basis-research-20260926');
