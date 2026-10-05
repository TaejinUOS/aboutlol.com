/**
 * 공식 패치노트에서 챔피언 밸런스 변경을 꺼내 버프·너프 라벨을 붙인다.
 *
 * 티어 모델의 정답은 다른 사이트의 티어가 아니라 **라이엇 밸런스 팀이 실제로 내린 판단**
 * 이다. 너프는 "이 챔피언이 지나치게 강했다", 버프는 "지나치게 약했다"는 사후 판정으로
 * 읽는다 (`docs/TIER_MODEL.md` "라벨").
 *
 * 패치노트는 변경마다 버프·너프 표시를 달지 않는다. 그래서 두 단서를 함께 본다.
 * 1. 개발자 의도 문장(context) — "too strong", "struggling" 같은 표현.
 * 2. 수치 변경 `이전 ⇒ 이후` — 재사용 대기시간이 줄면 버프, 피해량이 줄면 너프.
 * 둘이 엇갈리거나 둘 다 약하면 `review`로 남기고 사람이 `label-overrides.json`에서 정한다.
 */

export type ChangeSection = "champions" | "mid-patch";
export type Direction = "buff" | "nerf" | "adjust";

export type ChampionChange = {
  /** Data Dragon 챔피언 ID (`KhaZix`). 패치노트 이미지 주소에서 읽는다. */
  ddragonId: string;
  section: ChangeSection;
  context: string;
  /** `이름: 이전 ⇒ 이후` 한 줄씩. 새 효과·삭제처럼 수치가 없는 줄도 담는다. */
  lines: string[];
};

export type ClassifiedChange = ChampionChange & {
  direction: Direction;
  /** 자동 판정이 확실하면 auto, 사람이 봐야 하면 review. */
  confidence: "auto" | "review";
  contextScore: number;
  numericScore: number;
};

// ---------------------------------------------------------------- HTML 추출

function text(html: string): string {
  return html
    .replace(/<[^>]+>/g, " ")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&#x27;|&#39;|&rsquo;/g, "'")
    .replace(/&quot;/g, '"')
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/\s+/g, " ")
    .trim();
}

/** `<h2 id=...>`로 문서를 자르고, 첫 챔피언 절과 패치 중간 업데이트 절만 남긴다. */
function sections(html: string): { section: ChangeSection; body: string }[] {
  const heads = [...html.matchAll(/<h2 id="([^"]*)"/g)];
  const out: { section: ChangeSection; body: string }[] = [];
  let championsSeen = false;
  heads.forEach((head, i) => {
    const id = head[1].toLowerCase();
    const body = html.slice(head.index!, heads[i + 1]?.index ?? html.length);
    if (/mid-?patch/.test(id)) out.push({ section: "mid-patch", body });
    // 아레나·칼바람 절에도 `patch-champions`가 다시 나온다. 소환사의 협곡은 첫 번째다.
    else if (id === "patch-champions" && !championsSeen) {
      championsSeen = true;
      out.push({ section: "champions", body });
    }
  });
  return out;
}

const listItems = (html: string) => [...html.matchAll(/<li>([\s\S]*?)<\/li>/g)].map((m) => text(m[1])).filter(Boolean);

/**
 * 패치 중간 업데이트는 의도 문장 없이 챔피언 아이콘 뒤에 수치를 나열한다. 형식이 패치마다 달라
 * (아이콘이 머리글 안·밖, 스킬 소제목 유무) 아이콘 위치로 자른다. 다음 아이콘이나 날짜·아레나 같은
 * 일반 머리글(`change-detail-title`만 있는 h4)에서 끝난다.
 */
function midPatchEntries(body: string): ChampionChange[] {
  const icons = [...body.matchAll(/<img[^>]*\/img\/champion\/([A-Za-z0-9]+)\.png[^>]*>/g)];
  return icons.map((icon, i) => {
    let part = body.slice(icon.index!, icons[i + 1]?.index ?? body.length);
    const end = part.search(/<h4 class="change-detail-title">/);
    if (end !== -1) part = part.slice(0, end);
    return { ddragonId: icon[1], section: "mid-patch" as const, context: "", lines: listItems(part) };
  });
}

export function extractChampionChanges(html: string): ChampionChange[] {
  const changes: ChampionChange[] = [];
  for (const { section, body } of sections(html)) {
    const blocks = body.split(/<div class="patch-change-block/).slice(1);
    for (const block of blocks) {
      const id = block.match(/\/img\/champion\/([A-Za-z0-9]+)\.png/)?.[1];
      if (!id) continue; // 아이템·룬 블록
      const context = [...block.matchAll(/<blockquote[^>]*>([\s\S]*?)<\/blockquote>/g)]
        .map((m) => text(m[1]))
        .join(" ");
      changes.push({ ddragonId: id, section, context, lines: listItems(block) });
    }
    if (section === "mid-patch" && !blocks.length) changes.push(...midPatchEntries(body));
  }
  return changes;
}

/** "이번 패치의 X 변경은 오류로 적용되지 않았다" — 본문 라벨을 무효로 만드는 공지. */
export function isCancellation(change: ChampionChange): boolean {
  return change.lines.some((line) => /did not ship|delayed to a future patch/i.test(line));
}

// ---------------------------------------------------------------- 판정

/** 의도 문장의 단서. 가중치는 표현의 확실함이다 ("nerf"는 "strong"보다 확실하다). */
const BUFF_CUES: [RegExp, number][] = [
  [/\bbuff/i, 3],
  [/\bbump\b/i, 2],
  [/\bstruggl/i, 2],
  [/underperform/i, 3],
  [/\bweak(er)?\b/i, 1],
  [/\b(more|some|extra|additional) (power|strength|damage|love)\b/i, 2],
  [/\b(help|boost|empower|compensat)/i, 1],
  [/\b(low|lower|lackluster|lacking|behind)\b/i, 1],
  [/\bnot (been )?(performing|doing) (well|great)/i, 2],
  [/power (back|up)\b/i, 2],
  [/\b(not|isn't|aren't|haven't been|hasn't been) (quite )?(performing|doing)/i, 2],
  [/underwhelm|falling behind|lagging|up to par|could use|in a (bit of a )?rough (spot|place)/i, 2],
  [/\bgiv(e|ing) (him|her|them|it) (a|some|more|a bit)/i, 1],
  [/\b(raise|raising|bring(ing)? (him|her|them|it) up)\b/i, 1],
];

const NERF_CUES: [RegExp, number][] = [
  [/\bnerf/i, 3],
  [/too (strong|good|much|powerful|oppressive|dominant)/i, 3],
  [/overperform/i, 3],
  [/\btone[sd]? (it |him |her |them |things )?down|toning down/i, 3],
  [/\b(dial|pull|bring|rein)(ing|ed)? (it |him |her |them |things |power )?(back|down|in)\b/i, 2],
  [/\boppressive|dominat|run(ning)? rampant|out of hand|frustrat/i, 2],
  [/\b(high|higher) (win ?rate|pick ?rate|ban ?rate|presence)/i, 2],
  [/\b(take|taking|remove|removing|trim|trimming|shave|shaving) (some |a bit of )?(power|strength|damage)/i, 2],
  [/\breduc/i, 1],
  [/\bstrong\b/i, 1],
  [/\bcutting|disproportionate|over-?tuned|outlier|excessive|a (bit|little) (too )?much\b/i, 2],
  [/\bin line\b/i, 1],
];

/** 숫자가 작아질수록 좋은 항목. "Cooldown Refund"처럼 반대인 것을 먼저 거른다. */
function lowerIsBetter(name: string): boolean {
  if (/refund|reduction|reduced/i.test(name)) return false;
  return /cooldown|\bcost\b|mana cost|energy cost|cast time|delay|wind-?up|lockout|recharge|channel time|\bcd\b/i.test(name);
}

function mean(values: number[]): number {
  return values.reduce((sum, v) => sum + v, 0) / values.length;
}

/** `35-75 (레벨에 따라)`의 `-`는 구간이지 음수가 아니다. 숫자 바로 뒤의 `-`는 부호로 읽지 않는다. */
function numbers(segment: string): number[] {
  return [...segment.matchAll(/(?<![\d.])-?(?:\d+(?:\.\d+)?|\.\d+)/g)].map((m) => Number(m[0]));
}

/** 수치 줄 하나의 방향: +1 버프, -1 너프, 0 판단 불가. */
export function lineDirection(line: string): number {
  const [name, rest] = line.includes(":") ? [line.slice(0, line.indexOf(":")), line.slice(line.indexOf(":") + 1)] : ["", line];
  const parts = rest.split("⇒");
  if (parts.length !== 2) {
    if (/^\s*new\b|\badded\b/i.test(line)) return 1;
    if (/\bremoved\b/i.test(line)) return -1;
    return 0;
  }
  const before = numbers(parts[0]);
  const after = numbers(parts[1]);
  if (!before.length || !after.length) return 0;
  const a = mean(before);
  const b = mean(after);
  if (a === b) return 0;
  const up = b > a ? 1 : -1;
  return lowerIsBetter(name) ? -up : up;
}

function cueScore(context: string, cues: [RegExp, number][]): number {
  return cues.reduce((sum, [pattern, weight]) => sum + (pattern.test(context) ? weight : 0), 0);
}

export function classifyChange(change: ChampionChange): ClassifiedChange {
  const contextScore = cueScore(change.context, BUFF_CUES) - cueScore(change.context, NERF_CUES);
  const signs = change.lines.map(lineDirection).filter((s) => s !== 0);
  const numericScore = signs.length ? mean(signs) : 0;

  const contextSign = Math.sign(contextScore);
  // 수치가 한쪽으로 확실히 쏠린 경우만 수치의 방향으로 본다. 섞이면 조정(adjust)이다.
  const numericSign = Math.abs(numericScore) >= 0.5 ? Math.sign(numericScore) : 0;

  let direction: Direction = "adjust";
  let confidence: ClassifiedChange["confidence"] = "review";
  if (contextSign !== 0 && (numericSign === 0 || numericSign === contextSign)) {
    direction = contextSign > 0 ? "buff" : "nerf";
    // 의도 문장이 확실하거나 수치가 같은 쪽을 가리키면 자동 확정한다.
    confidence = Math.abs(contextScore) >= 2 || numericSign === contextSign ? "auto" : "review";
  } else if (contextSign === 0 && numericSign !== 0) {
    direction = numericSign > 0 ? "buff" : "nerf";
    confidence = Math.abs(numericScore) === 1 && signs.length >= 2 ? "auto" : "review";
  } else if (contextSign === 0 && signs.length === 0) {
    // 의도 단서도 수치 변경도 없다 — 버그 수정·툴팁 정리 같은 조정이다.
    confidence = "auto";
  } else if (contextSign !== 0 && numericSign !== 0) {
    // 의도와 수치가 엇갈린다 — 대개 한쪽을 깎고 다른 쪽을 올린 조정이다.
    direction = "adjust";
  }
  return { ...change, direction, confidence, contextScore, numericScore };
}
