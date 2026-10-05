/**
 * 위키 관문 — 커버가 붙는 최상위 분류.
 *
 * 설계 근거는 `docs/WIKI_EXPANSION.md`의 "관문은 분류가 아니다"와 "관문은 한 축에서
 * 고른다". 분류는 편집자가 본문에 `[[분류:…]]`를 적으면 생기지만, 커버가 붙는 관문은
 * 운영자만 정한다. 이미지를 붙여야 하는 집합은 열려 있을 수 없기 때문이다.
 *
 * 그래서 이 목록은 코드에 있다 — `taxonomy.ts`가 운영 분류의 단일 원본인 것과 같은
 * 이유다. `wiki_portals` 표와 관리 화면은 4단계에서 붙이고, 그때 이 파일이 시드가 된다.
 *
 * 관문은 챔피언과 무관한 **일반 지식**만 나눈다. 챔피언 문서와 매치업은 사이트 첫
 * 화면(챔피언)에서 들어가므로 관문에 두지 않는다 (2026-10-05 개편).
 *
 * 순서는 게임 시간축이다: 라인전 → 운영 → 한타가 판 안의 흐름이다. `정글`은 라인전이
 * 없어 시간축 어디에도 깔끔히 안 들어가므로 따로 서고, `기타`는 룬·아이템·용어처럼
 * 시점과 무관한 문서가 모이는 자리다.
 */

export type Portal = {
  /**
   * 분류 이름의 title_key. `[[분류:라인전]]`이 이 값에 닿는다.
   * 주소에도 그대로 쓴다: `/wiki?분류=라인전`.
   */
  key: string;
  label: string;
  /**
   * 커버 이미지.
   *
   * 챔피언 포스터와 달리 이 커버는 **그림이 아니라 도해**다 (선·화살표·표·글리프).
   * 지금은 래스터지만 나중에 SVG 컴포넌트로 갈아끼울 수 있고, 그때 바뀌는 것은
   * 이 열의 뜻뿐이다 (`docs/WIKI_EXPANSION.md`).
   */
  coverImage: string;
  coverAlt: string;
  /** 표지에 걸렸을 때 라벨 아래 붙는 한 줄. 무엇이 들어가는 분류인지 말한다. */
  blurb: string;
  /** 낮을수록 앞. 상위 셋만 표지에 걸린다. */
  order: number;
};

/**
 * 관문을 평면 포스터로 나란히 거는 최대 수.
 *
 * 이 수까지는 전부 한 줄에 펼쳐 보인다. 관문이 이보다 많아지면 한 줄에 다 걸면 커버가
 * 너무 좁아지므로, 위키 첫 화면은 원통형 회전 진열(`PortalCylinder`)로 바꿔 건다
 * (2026-10-05, "회전이 아니라 편성" 번복). 어느 쪽이든 관문은 아래 분류 나무에도
 * 이름으로 모두 남는다.
 *
 * 관문 다섯이 처음부터 원통으로 걸리도록 4로 둔다 (2026-10-05). 이 값은
 * `WikiIndexScreen.tsx`의 `POSTER_WEIGHTS` 조판이 4장까지 있는 것과 짝을 이룬다.
 */
export const FLAT_PORTAL_LIMIT = 4;

export const portals: Portal[] = [
  {
    key: "라인전",
    label: "라인전",
    coverImage: "/images/portal/lane-phase.webp",
    coverAlt: "미니언 웨이브와 교전 거리를 표시한 라인전 도해",
    blurb: "CS · 웨이브 · 견제 · 갱 대비",
    order: 1,
  },
  {
    key: "운영",
    label: "운영",
    coverImage: "/images/portal/macro-play.webp",
    coverAlt: "오브젝트 타이머와 시야·동선을 표시한 운영 도해",
    blurb: "시야 · 오브젝트 · 로밍 · 스플릿",
    order: 2,
  },
  {
    key: "한타",
    label: "한타",
    coverImage: "/images/portal/teamfight-clash.webp",
    coverAlt: "진입 각도와 포지셔닝을 표시한 한타 도해",
    blurb: "포지셔닝 · 진입 · 궁 순서",
    order: 3,
  },
  {
    key: "정글",
    label: "정글",
    /*
     * 2026-09-06: 운영자가 직접 준비해 `public/images/portal/jungle-pathing.webp`에
     * 넣기로 했다. 다른 관문과 같은 규격(1536×1024 webp, 챔피언 아트가 아니라 도해)이다.
     */
    coverImage: "/images/portal/jungle-pathing.webp",
    coverAlt: "동선과 갱 타이밍을 표시한 정글 도해",
    blurb: "동선 · 클리어 · 갱 타이밍 · 오브젝트",
    order: 4,
  },
  {
    key: "기타",
    label: "기타",
    /* 전용 커버가 나오기 전까지 룬·아이템 도표를 늘어놓은 사전 도해를 쓴다. */
    coverImage: "/images/portal/reference-guide.webp",
    coverAlt: "룬과 아이템 도표를 늘어놓은 도해",
    blurb: "룬 · 아이템 · 용어 · 그 밖의 문서",
    order: 5,
  },
];

const byOrder = [...portals].sort((a, b) => a.order - b.order);

/** 관문 전부를 `order` 순으로. 위키 첫 화면 표지와 분류 나무가 같은 순서를 쓴다. */
export function orderedPortals(): Portal[] {
  return byOrder;
}

export function getPortal(key: string): Portal | undefined {
  return portals.find((p) => p.key === key);
}
