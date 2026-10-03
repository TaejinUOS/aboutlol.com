# 챔피언 빌드 통계

챔피언의 첫 화면은 빌드다. 통계 정의는 PRD 5.3.2, 구현은 `buildStats.ts`·`buildStore.ts`,
수집기는 `scripts/sync-builds.ts`, 스키마는 `0014_champion_builds.sql`이다.

## 로컬 실행

```bash
npx wrangler d1 migrations apply DB --local
# .dev.vars에 유효한 RIOT_API_KEY 설정
npm run builds:sync
npm run dev
```

`--matches 500 --players 50`으로 수집 상한을 늘린다. 기본은 신규 경기 100개·표본 계정 20개다.
`--patch 16.19.1`은 Data Dragon 버전을 고정한다. 기본은 Riot versions.json의 최신 버전이며,
경기의 major.minor 패치가 일치해야 한다. 정적 카탈로그(Aside)와 빌드 통계 패치는 독립이라
각각 버전을 표시한다. 키가 만료됐을 때 새 키를 채팅·로그·커밋에 남기지 않는다.

래더의 한 페이지에서 매 시간 계정 추출 시작점을 바꾼다. 전체 모집단의 무작위 표본이 아니다.
선택한 계정의 최근 경기마다 모든 참가자의 빌드를 추출하며 참가자 티어는 검증하지 않는다.
경기는 중복 저장하지 않는다. 역할 미확인 참가자, 조기 항복과 10분 미만 경기는 제외한다.
완성 코어는 Data Dragon의 구매 가능 상위 아이템 관계, 맵·가격·Boots 태그로 판단하며
특수 아이템/구매 아닌 자동 변신은 표본에서 누락될 수 있다. 추천은 인과 효과가 아니라
표본 내 자주 선택한 빌드다. 표본 확대와 특수 아이템 규칙은 실제 경기 검증 후 조정한다.

## 운영 수집

```bash
npx wrangler d1 migrations apply DB --remote
npm run builds:sync -- --remote --matches 300 --players 40
```

키는 로컬 `.dev.vars` 또는 `RIOT_API_KEY` 환경 변수에서 읽는다. Worker의 secret을 추출하지 않는다.
페이지는 D1만 읽으므로 빌드 표시 자체에 Worker의 Riot 키는 필요하지 않다.
원격 모드는 수집을 끝낸 뒤 익명 SQL을 `.wrangler/build-sync/`에 남겨 Wrangler로 반영한다.
원격 반영이 실패하면 저장한 SQL을 `wrangler d1 execute DB --remote --file 경로 --yes`로 재적용할 수 있다.
로컬 모드는 경기마다 D1 batch로 기록해 중단 후 재실행할 때 이어갈 수 있다.
공통 갱신 시각은 성공한 수집만 갱신한다. 14일 이전 경기와 연결 관측값을 삭제한다.
페이지는 최근 14일과 최신 수집 패치만 집계하고, 24시간 미갱신은 화면에 표시한다.

## 정기 실행

`.github/workflows/sync-builds.yml`은 6시간마다 실행하며 수동 실행도 가능하다.
저장소 Actions secrets에 아래 값을 설정해야 한다.

- `RIOT_API_KEY`: 운영 수집에 사용할 유효한 Riot 키
- `CLOUDFLARE_API_TOKEN`: 해당 계정의 D1 접근 권한이 있는 토큰
- `CLOUDFLARE_ACCOUNT_ID`: D1 계정 ID

설정 전에는 통계가 자동으로 쌓이지 않는다. 로컬 키를 운영 secret으로 자동 복사하지 않는다.
정기 실행을 켜려면 저장소 Actions variable `BUILD_STATS_SYNC_ENABLED`를 `true`로 설정한다.
설정 전에는 예약 작업이 건너뛰어지며 수동 실행으로 secrets 설정을 먼저 확인할 수 있다.
라이엇 공개 서비스 키 기준은 [공식 안내](https://developer.riotgames.com/docs/portal#production-api-keys)를 따른다.
workflow는 schema를 먼저 적용하고 수집한다. 기본 페이지 요청은 API를 추가 호출하지 않는다.

수집은 순차 요청과 app/method 제한 헤더, `Retry-After`를 지킨다. 같은 키를 쓰는 다른 프로세스의
전적 호출은 별도이므로 429 대기는 발생할 수 있다. Actions는 concurrency로 중복 실행을 막는다.
수집 중 `db:pull`은 실행하지 않는다. 두 명령은 서로의 잠금을 확인한다. 강제 중단으로 잠금이
남았다면 관련 프로세스가 종료됐는지 확인한 뒤 해당 빈 `running.lock` 디렉터리만 제거한다.

## 검증

```bash
npx tsx scripts/check-build-stats.ts
npm run typecheck
npm run lint
npm run build
```

실경기 긍정 경로는 유효한 키가 필요하다. 2026-10-03 기존 키의 401을 확인한 뒤 사용자 키
갱신 후 정상 인증과 실제 경기 수집을 확인했다. 검증용 표본은 실제 통계로 남기지 않는다.
