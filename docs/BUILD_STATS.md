# 챔피언 빌드 통계

KR 솔로 랭크 다이아몬드 이상 계정에서 **현재 패치 전체**를 누적한다.
`src/lib/buildCollector.ts`를 CLI와 독립 Cloudflare Cron Worker가 공유한다.
스키마는 `0014_champion_builds.sql` + `0015_build_collector.sql`이다.

같은 수집기가 **티어 구간 표본**(`src/lib/tierSampler.ts`, 마이그레이션 0017)도 진행할 수 있다.
빌드와 달리 아이언~챌린저 다섯 구간에서 계정을 뽑고, 타임라인 없이 경기 정보만 받아 열 명을 모두
기록한다. 기본 예산은 0이라 켜기 전에는 호출하지 않는다 — `--tier-requests N`(CLI) 또는
`TIER_SAMPLE_REQUESTS`(Worker 변수)로 켠다. 설계는 [TIER_MODEL.md](./TIER_MODEL.md) 8장.

## 범위와 표본

- 다이아몬드 I–IV는 마지막 래더 페이지까지, 마스터·그랜드마스터·챌린저는 전체 래더를
  순환한다. 큰 응답은 400계정씩 진행 위치를 저장한다. 발견한 모든 계정을 대상으로 삼는다.
- 최초 경기 목록은 날짜 하한 없이 100개씩 이전 패치 경계까지 역탐색한다. 고정된 조회 종료
  시각과 페이지 위치를 DB에 저장해 재실행 후 이어 읽는다. 완료 후 1시간 중첩 watermark로
  새 경기를 누적한다. 현재 패치의 14일 이전 경기도 유지한다. 수집 중 전수 통계를 주장하지 않는다.
- 경기 상세의 `gameVersion` major.minor가 Data Dragon 패치와 일치해야 한다. 새 패치가
  감지되면 계정별 cursor를 새로 만들고 이전 패치와 합산하지 않는다. Data Dragon 갱신이
  늦으면 새 패치 감지도 늦어질 수 있다. 시간/호출 제한 때문에 완전 수집을 보장하지 않는다.
- 수집 시점에 최근 48시간 내 해당 래더에서 확인된 계정의 참가자 빌드만 포함한다.
  다른 참가자를 무조건 다이아+ 표본에 넣지 않는다. 티어는 래더 확인 시점 기준이며 경기 당시
  역사적 티어가 아니다. 래더 순환·승강급 때문에 누락/지연 가능성이 있다. 나중에 확인된
  다이아+ 참가자는 경기 재조회 시 기존 관측에 추가할 수 있다.
- 솔로 랭크(420)·협곡(11)만 포함하고 10분 미만·조기 항복·불명 포지션을 제외한다.
  시작 아이템 첫 90초 구매 조합, 첫 업그레이드 신발, 신발 제외 첫 3코어 구매 순서,
  레벨 1–9 스킬 순서를 실제 타임라인에서 추출한다. 취소 구매를 반영한다.
- 항목별 유효 표본을 분모로 선택률을 계산한다. 조합당 30판 이상 중 최다 선택을 추천하고
  그 미만은 참고용이다. 3코어 완성/경기 길이 편향을 표시한다.
- 기존 에메랄드 I 기반 혼합 티어 자료는 `legacy` cohort이며 새 `diamond-plus`에 포함하지 않는다.

## 로컬과 수동 실행

```bash
npx wrangler d1 migrations apply DB --local
# .dev.vars에 RIOT_API_KEY 설정 (키는 출력/커밋하지 않는다)
npm run builds:sync
npm run builds:sync -- --cycles 20
npm run builds:sync -- --status
```

한 묶음의 기본 예산은 Riot 호출 36회·history 6페이지·경기 검사 12개다.
`--players 12 --matches 20 --requests 80 --cycles 20`으로 조정할 수 있다. 이는 전체 누적
표본의 상한이 아니다. `--patch 16.19.1`로 버전을 고정하되 활성 패치보다 이전으로 되돌릴 수는 없다.
개발 키는 로컬 prototype 검증용이며 24시간마다 만료된다. `--help`로 옵션을 확인한다.

```bash
npx wrangler d1 migrations apply DB --remote
# 승인된 Production 키만 운영 수집에 사용한다
RIOT_KEY_TYPE=production npm run builds:sync -- --remote --cycles 20
npm run builds:sync -- --status --remote
```

PowerShell에서는 먼저 `$env:RIOT_KEY_TYPE='production'`을 설정한다. `--remote`에서만
원격 D1 바인딩을 만든다. 로컬/원격 모두 경기마다 원자적 batch로 기록해 중단 전 성공한 자료를
보존한다. 상태 명령은 키 없이 패치·티어별 계정 수·backfill·대기 경기·오류를 확인하며 계정
식별자를 출력하지 않는다. 키는 환경 변수 또는 로컬 `.dev.vars`에서 읽는다.

## 상시 운영 — 독립 Cron Worker

`wrangler.collector.jsonc`의 `aboutlol-build-collector`는 앱과 별개로 매분 실행한다.
공개 HTTP 실행/상태 경로와 커스텀 도메인은 없다. PC가 꺼져도 Cloudflare에서 작동한다.
페이지는 D1만 조회하므로 방문자 수가 Riot 호출을 늘리지 않는다.

2026-10-04 사용자가 현재 키를 **24시간 개발 키**라고 확인했다. 현재 배포 기본값은
`COLLECTOR_ENABLED=false`다. Production 키를 확보하면 아래 순서로 활성화한다.

```bash
# 비활성 수집 Worker 배포 (기존 앱 Worker에는 영향 없음)
npm run builds:collector:deploy
# 터미널 프롬프트에 Production 키 입력 — 채팅/명령 인자에 키를 넣지 않는다
npx wrangler secret put RIOT_API_KEY --config wrangler.collector.jsonc --env production
# 활성 환경 배포 (이후 활성 상태의 코드 갱신에도 이 명령 사용)
npm run builds:collector:enable
# 몇 분 뒤 진행 확인
npm run builds:sync -- --status --remote
```

중지할 때는 `npm run builds:collector:deploy`로 비활성 기본 설정을 배포한다. 트리거 전파는
최대 15분이 걸릴 수 있다. Workers 로그의 `discovered/players/inspected/matches/requests`와
상태 명령으로 처리량을 확인한다. 초기에는 과거 경기 대기열이 길어질 수 있다. 처리량은 Riot
키 한도, 래더 규모, Worker/D1 요금제 한도에 따라 달라지며 특정 표본 수를 보장하지 않는다.

CLI/Cron은 D1 임대로 동시 실행을 막는다. 강제 종료된 임대는 최대 16분 뒤 만료된다.
Riot 요청은 최소 1.3초 간격이고 app/method 제한 및 429 `Retry-After`를 DB에 보존한다.
호출/작업 예산이 끝나면 다음 실행이 이어받는다. 새 관측이 저장된 경우만 화면의 자료 갱신
시각을 갱신하고 24시간 경과 시 갱신 지연을 표시한다. 로컬 CLI와 `db:pull`은 파일 잠금도 공유한다.

GitHub Actions `sync-builds.yml`은 예약 실행을 제거하고 **수동 보충 실행**으로 유지한다.
사용하려면 Actions secrets `RIOT_API_KEY`(Production), `CLOUDFLARE_API_TOKEN`,
`CLOUDFLARE_ACCOUNT_ID`를 설정한다. Cron 운영 자체에는 GitHub secrets가 필요하지 않다.

## 보존과 검증

PUUID·래더 티어·확인 시각·cursor는 서버 전용 표에만 보관한다. 30일간 래더에서 미확인된
계정 정보는 정리한다. Riot ID·원본 경기 응답은 보관하지 않는다. 빌드 관측에는 PUUID를
넣지 않는다. 이전 패치 익명 관측은 별도 patch로 보존하며 화면은 활성 패치만 읽는다.

```bash
npx tsx scripts/check-build-stats.ts
npx tsx scripts/check-build-collector.ts
npm run typecheck
npm run lint
npm run build
```

collector 검증은 `.wrangler/collector-check-*`의 격리 로컬 D1과 외부 API 검증 응답을 사용한다.
앱/운영 DB에 검증 표본을 넣지 않는다. pagination·재개·14일 초과 누적·대상 티어·패치 분리·
중복·429 보존·임대·패치 전환을 확인한다.

2026-10-04 로컬 실제 API 검증: 7구간 계정 2,320개, 현재 패치 19경기·166개 빌드 관측.
0015 마이그레이션은 로컬·운영에 적용했고 Cron Worker는 비활성 상태로 배포했다.
개발 키로 가져온 새 로컬 검증 자료는 운영 DB에 복사하지 않았다.

공식 자료: [Riot 키](https://developer.riotgames.com/docs/portal),
[Riot API](https://developer.riotgames.com/apis),
[Cloudflare Cron](https://developers.cloudflare.com/workers/configuration/cron-triggers/),
[Workers 한도](https://developers.cloudflare.com/workers/platform/limits/).
