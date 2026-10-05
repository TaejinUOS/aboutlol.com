/**
 * 티어 모델이 다루는 패치 목록.
 *
 * 게임 패치 이름(`26.19`)과 Data Dragon·수집기가 쓰는 줄(`16.19`)이 다르다. 2025년
 * 패치는 `25.x` ↔ `15.x`, 2026년 패치는 `26.x` ↔ `16.x`이고, 2025년 첫 세 패치는
 * `25.S1.1~3`이라는 다른 이름을 썼다. 학습 자료는 수집기 기준 `line`으로 잇는다.
 */

export type PatchInfo = {
  /** 패치노트의 이름. 화면과 문서에 보인다. */
  name: string;
  /** Data Dragon major.minor. `build_matches.patch`와 같은 값이다. */
  line: string;
  /** 영문 공식 패치노트. 라벨의 출처다. */
  notesUrl: string;
};

const NOTES = "https://www.leagueoflegends.com/en-us/news/game-updates";

function season2025(): PatchInfo[] {
  const early: PatchInfo[] = [
    { name: "25.S1.1", line: "15.1", notesUrl: `${NOTES}/patch-25-s1-1-notes/` },
    { name: "25.S1.2", line: "15.2", notesUrl: `${NOTES}/patch-25-s1-2-notes/` },
    { name: "25.S1.3", line: "15.3", notesUrl: `${NOTES}/patch-2025-s1-3-notes/` },
  ];
  const rest = Array.from({ length: 21 }, (_, i) => {
    const minor = i + 4;
    return {
      name: `25.${minor}`,
      line: `15.${minor}`,
      notesUrl: `${NOTES}/patch-25-${String(minor).padStart(2, "0")}-notes/`,
    };
  });
  return [...early, ...rest];
}

function season2026(last: number): PatchInfo[] {
  return Array.from({ length: last }, (_, i) => {
    const minor = i + 1;
    // 26.4부터 주소 앞에 `league-of-legends-`가 붙었다.
    const slug = minor <= 3 ? `patch-26-${minor}-notes` : `league-of-legends-patch-26-${minor}-notes`;
    return { name: `26.${minor}`, line: `16.${minor}`, notesUrl: `${NOTES}/${slug}/` };
  });
}

/** 오래된 것부터. 새 패치노트가 나오면 `season2026`의 마지막 번호를 올린다. */
export const PATCHES: readonly PatchInfo[] = [...season2025(), ...season2026(19)];

const BY_LINE = new Map(PATCHES.map((patch, index) => [patch.line, index]));

export function patchIndex(line: string): number | undefined {
  return BY_LINE.get(line);
}

/** 바로 다음 패치. 스냅숏 N의 라벨은 N+1 패치노트에서 온다. */
export function nextPatch(line: string): PatchInfo | undefined {
  const index = BY_LINE.get(line);
  return index === undefined ? undefined : PATCHES[index + 1];
}
