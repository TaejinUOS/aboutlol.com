# ABOUTLOL

상대법부터 기본기까지, 롤을 깨우치다.

포지션별로 상대 챔피언을 고르고, 보편 상대법 `공통`과 내 챔피언 전용 상대법 `Me`를 함께 보는
리그 오브 레전드 상대법 커뮤니티입니다.

## 기준 문서

| 문서 | 역할 |
| --- | --- |
| [`docs/PRD.md`](./docs/PRD.md) | 기능 범위와 사용자 흐름의 기준 |
| [`docs/DESIGN_BLUEPRINT.md`](./docs/DESIGN_BLUEPRINT.md) | 시각 기준 — GLOWING MATCHUP ZINE |
| [`docs/HANDOFF.md`](./docs/HANDOFF.md) | **남은 작업, 임시 구현, 알아 두어야 할 것** |
| [`AGENTS.md`](./AGENTS.md) | 제품·디자인 규칙, 명령어, 아키텍처 — 코딩 에이전트가 읽는 지침 |
| [`docs/DEPLOY.md`](./docs/DEPLOY.md) | 배포 방법과 자동 배포 설정 |

## 실행

```bash
npm install
npm run dev          # http://localhost:3000
```

| 명령 | 설명 |
| --- | --- |
| `npm run dev` | 개발 서버 |
| `npm run build` | 프로덕션 빌드 |
| `npm run typecheck` | 타입 검사 |
| `npm run lint` | 린트 |
| `npm run data:sync` | Data Dragon 챔피언·스킬 동기화 |
| `npm run db:pull` | 전체 운영 D1을 검증·백업 후 로컬 D1로 가져오기 |
| `npx tsx scripts/check-taxonomy.ts` | 포지션·카테고리 분류 점검 |
| `npm run shots` | 주요 화면을 모바일·태블릿·데스크톱 뷰포트로 캡처 |
| `npm run cf:preview` | Cloudflare Workers 런타임으로 로컬 실행 (http://127.0.0.1:8788) |
| `npm run cf:deploy` | Cloudflare Workers에 수동 배포 |

> `npm run build`와 `npm run dev`는 같은 `.next` 디렉터리를 사용합니다. dev 서버를 켠 채로
> build를 돌리면 dev 서버 응답이 깨지니 한 번에 하나만 실행하세요.

## 화면

| 경로 | 화면 |
| --- | --- |
| `/` | Riot ID 검색, 즐겨찾는 소환사, 최근 전적과 패배 상대 위키 추천 |
| `/champions?position=&category=&q=` | 포지션·카테고리 선택과 챔피언 Contact Sheet |
| `/matchup/[position]/[champion]?tab=&me=` | 챔피언 상대법 위키 (Aside + 상대법·영상) |
| `/records?riotId=게임이름%23태그` | 기존 전적 주소. 같은 검색어를 유지하며 `/`로 이동 |
| `/tier-list?position=mid` | 포지션별 S~F 티어표와 작성 근거 위키 문서 |
| `/stats` | 기존 통계 주소. 티어표로 이동 |
| `/lessons` | `추후 개발` 안내 화면 |

화면 상태는 모두 URL 질의 문자열에 반영되어 새로고침과 뒤로 가기 후에도 복원됩니다.
포지션이 없으면 `미드`가 기본 선택됩니다.

## 구조

```
docs/                      기획 · 디자인 문서
  PRD.md                   제품 요구사항
  DESIGN_BLUEPRINT.md      시각 기준
  HANDOFF.md               남은 작업과 임시 구현
  design/blueprints/       승인된 목업과 생성 프롬프트
  archive/plan1.txt        최초 기획 메모 (PRD로 대체됨)

src/
  app/                     라우트 (App Router)
  components/
    selection/             포지션·카테고리 선택 화면
    matchup/               상대법 화면과 위키 문서 열람
  data/
    generated/             Data Dragon 동기화 결과 (스크립트가 생성)
    taxonomy.ts            포지션 · 카테고리 정의와 초기 챔피언 분류
    champions.ts           Data Dragon과 분류를 합치는 조인 계층
    tips.ts                시드 Tip (위키 이관 원본. 화면은 더 이상 읽지 않는다)
    wiki.ts                위키 도메인 타입
  lib/
    wikiStore.ts           D1 조회 (server-only)
    josa.ts                한국어 조사 선택
    url.ts  motion.ts      URL·모션 유틸

migrations/                D1 스키마
seeds/                     시드 Tip → 위키 문서 이관 SQL (생성물)

public/images/             PRD 5.1이 지정한 카테고리 대표 이미지
scripts/
  sync-ddragon.ts          챔피언·스킬 동기화
  check-taxonomy.ts        분류 점검
  seed-wiki.ts             시드 Tip을 위키 문서 SQL로 변환
```

### 챔피언 분류 갱신

포지션·카테고리 정의는 [`src/data/taxonomy.ts`](./src/data/taxonomy.ts)에 있고, 실제 챔피언
배정·운영 상태는 D1의 `champion_placements`·`champion_ops`에서 관리합니다.
운영의 `/admin/taxonomy`에서 수정한 데이터는 로컬 DB에 자동 반영되지 않으며,
`git pull`도 DB를 갱신하지 않습니다. 운영 데이터를 로컬에서 확인하려면 아래 명령을 사용합니다.

### 운영 DB를 로컬로 가져오기

```bash
# 실행 중인 모든 dev/preview 서버와 빌드를 종료한 뒤
npm run db:pull
npm run dev

# 로컬 DB를 교체하지 않고 가져오기·검증만 수행
npm run db:pull -- --dry-run

# 명령이 출력한 실행 ID의 로컬 백업으로 복구 (서버 종료 후)
npm run db:pull -- --restore <실행-ID>
```

Cloudflare 로그인 권한이 필요합니다 (`npx wrangler login`). 운영 DB에는 읽기 전용 export만
실행합니다. 전체 스키마·데이터·마이그레이션 이력을 별도 로컬 DB에 가져오고, 남은 로컬
마이그레이션을 적용한 뒤 무결성·외래키·필수 테이블을 검사합니다. 검증이 성공하면 현재
로컬 DB를 백업하고 교체합니다. 로컬에서만 작성한 문서·계정·분류도 운영 데이터로 바뀝니다.
복구할 때도 남은 로컬 마이그레이션을 적용하므로 현재 코드가 요구하는 스키마를 유지합니다.

덤프·SQL 백업·교체 전 D1 파일은 `.wrangler/db-pull/<실행-ID>/`에 남습니다. 전체 덤프에는
계정 이메일·소셜 식별자 등이 포함되므로 이 폴더를 공유하거나 커밋하지 마세요 (`.gitignore` 대상).
내려받기에 실패하거나 가져온 DB 검증에 실패하면 기존 로컬 DB를 교체하지 않습니다.
동기화 중 빌드도 실행하지 마세요. 개발 서버의 기본 포트 3000·preview 포트 8788이 열려 있으면 중단합니다. 사용자 지정 포트로
띄운 서버도 직접 종료해야 합니다. 서버를 다시 시작하고 브라우저를 새로고침해 결과를 확인하세요.

명령은 동시 실행을 막기 위해 `.wrangler/db-pull/running.lock/`을 사용합니다. 강제 종료 후
잠금이 남았다면 다른 `db:pull` 프로세스가 없는지 확인하고 **그 빈 잠금 폴더만** 삭제하세요.
새 로컬 환경도 별도 DB를 생성한 뒤 같은 방식으로 가져올 수 있습니다.

구현은 [`scripts/pull-db.ts`](./scripts/pull-db.ts), D1 내보내기 형식은
[Cloudflare 공식 문서](https://developers.cloudflare.com/d1/best-practices/import-export-data/)를 따릅니다.

### 위키 본문에 유튜브 영상 넣기

편집기의 본문에 아래 문법을 한 줄로 적습니다. 괄호 안에는 실제 유튜브 주소 또는
11자 영상 ID를 넣습니다. 일반 문서와 공통·Me 상대법에서 같은 문법을 사용합니다.

```text
[youtube(https://youtu.be/M7lc1UVf-VE)]
[youtube(https://youtu.be/M7lc1UVf-VE?t=90)]
```

두 번째 줄은 90초부터 시작합니다 (`t=1m30s`, `start=90`도 지원).
「본문 미리보기」에서 저장 전 확인할 수 있고, 실제 문서에서는 재생 버튼을 눌러 플레이어를
불러옵니다. 일반 유튜브 링크는 링크로 남습니다. 코드 블록 속 문법은 예제로 표시되고,
잘못된 주소·일반 이미지·원시 HTML을 임의의 외부 임베드로 해석하지 않습니다.
유튜브에서 임베드를 허용하지 않은 영상은 「유튜브에서 보기」 링크로 확인합니다.
영상은 위키 편집·검토 규칙을 따르며, 운영자가 선별하는 영상 탭에 자동 등록되지는 않습니다.

문법 검사는 `npx tsx scripts/check-wiki-videos.ts`로 실행합니다. 시작 시간 설정은
[YouTube 플레이어 공식 문서](https://developers.google.com/youtube/player_parameters#start)를 따릅니다.

### 패치 갱신

```bash
DDRAGON_PATCH=16.17.1 npm run data:sync
```

패치 버전과 갱신 시각은 `src/data/generated/champions.json`에 저장되고 사이트 하단에 표시됩니다.

## 현재 상태

구현 완료 (PRD 7장 P0 기준):

- FR-01~07 포지션·카테고리·챔피언 선택, 검색, 선택 애니메이션, URL 상태
- FR-08~09 정적 2D 일러스트와 로딩 실패 대체 UI, Q/W/E/R 스킬과 공략 쪽지
- FR-10, 12, 13 상대법·영상 탭, Me 콤보박스, 공통/Me 노출 규칙
- FR-18~20 반응형, 상태·오류 안내, 추후 개발 메뉴
- FR-23 위키 문서 열람 (D1)

**진행 중: Tip 게시판 → 매치업 위키 전환** (PRD v0.8). 설계는
[`docs/WIKI_MODEL.md`](./docs/WIKI_MODEL.md)입니다.

| 단계 | 내용 | 상태 |
| --- | --- | --- |
| 1 | D1 스키마와 시드 이관 | 완료 |
| 2 | 위키 문서 열람 화면 | 완료 |
| 3 | 구글·카카오 로그인 (FR-22) | 예정 |
| 4 | 편집 제안과 검토 (FR-24~33) | 예정 |

관리자 챔피언 분류(FR-34~43)도 v0.8에서 범위에 들어왔습니다. 분류를 코드에서 D1로
옮기는 작업이며 로그인이 선행 조건입니다. 배경은
[`docs/HANDOFF.md`](./docs/HANDOFF.md) 4장에 있습니다.

**지금은 편집할 수 없습니다.** 옛 Tip 작성 화면은 2단계에서 제거했고 위키 편집은
4단계에 붙습니다. 좋아요·정렬·페이지네이션·작성자 소유권(구 FR-11, 14~17)은
위키 전환으로 삭제되었습니다.

나머지 남은 것은 **[`docs/HANDOFF.md`](./docs/HANDOFF.md)** 에 정리했습니다.

## 데이터 출처

챔피언 이미지와 스킬 정보는 Riot Games의 Data Dragon(`16.17.1`, `ko_KR`)을 사용합니다.
ABOUTLOL은 Riot Games가 승인하거나 후원하지 않은 비공식 프로젝트입니다.

## 배포

운영 주소는 <https://aboutlol.com>이고, Cloudflare Workers에서 돌아갑니다.
`main`에 push하면 자동 배포됩니다. 설정 방법과 롤백은 [`docs/DEPLOY.md`](./docs/DEPLOY.md)를 보세요.
