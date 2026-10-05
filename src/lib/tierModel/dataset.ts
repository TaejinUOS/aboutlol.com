/**
 * 패치 스냅숏 + 패치노트 라벨 → 학습 행.
 *
 * 시간 맞추기가 전부다. 스냅숏 N(패치 N 동안의 지표)에 대한 라이엇의 반응은
 * - 패치 N 도중의 **패치 중간 업데이트** (N 패치노트의 mid-patch 절)
 * - 다음 패치 **N+1 본문**의 챔피언 절
 * 이다. 반대로 N 본문의 변경은 N이 시작될 때 이미 들어간 것이라 라벨이 아니라 입력(최근 너프·버프)이다.
 * 라벨에 쓰는 변경을 입력에 섞으면 답을 보고 문제를 푸는 셈이 된다.
 */
import { MIN_GAMES, rawFeatures, type ChampionInput } from "./features";
import type { Label, TrainingRow } from "./model";
import { PATCHES, patchIndex } from "./patches";

export type PatchChange = {
  patch: string;
  line: string;
  section: "champions" | "mid-patch";
  champion: string;
  direction: "buff" | "nerf" | "adjust";
};

export type SnapshotRow = {
  champion: string;
  position: string;
  games: number;
  wins: number;
  pickRate: number | null;
  banRate: number | null;
  eliteWinRate: number | null;
  diamondWinRate: number | null;
  flexPositions: number | null;
};

/** 패치 × 티어 구간 하나의 지표. `bracket`은 brackets.ts의 slug이거나 다섯 구간을 합친 `all`. */
export type Snapshot = { line: string; bracket: string; source: string; matches: number; rows: SnapshotRow[] };

export type OperatorMetrics = Record<string, { mastery?: number; difficulty?: number; blindPick?: number }>;
/** line → champion → 0~1 */
export type ProPresence = Record<string, Record<string, number>>;
/** champion → 출시·리워크 패치 line */
export type Releases = Record<string, string>;

export type DatasetInputs = {
  snapshots: Snapshot[];
  changes: PatchChange[];
  operator: OperatorMetrics;
  pro: ProPresence;
  releases: Releases;
};

/**
 * 시즌 시작 패치는 체계 전체(치명타 피해량 등)를 바꾸며 보정 너프·버프를 대량으로 넣는다.
 * 그 변경은 "직전 패치에 강했다"는 판단이 아니라 바뀔 체계에 대한 예측이라 라벨에서 뺀다.
 */
export const SYSTEMIC_PATCHES = new Set(["25.S1.1", "26.1"]);

const DECAY = [1, 2 / 3, 1 / 3];

/** 패치 N 시작 시점까지 알려진 변경 (= 입력). 패치 순서 인덱스로 센다. */
function shippedBy(changes: PatchChange[], champion: string, index: number) {
  return changes.filter((c) => {
    if (c.champion !== champion) return false;
    const i = patchIndex(c.line);
    if (i === undefined) return false;
    // 본문: N 이하. 패치 중간: N-1 이하 (N 도중의 업데이트는 라벨이다).
    return c.section === "champions" ? i <= index : i < index;
  });
}

export function historyFor(changes: PatchChange[], champion: string, line: string) {
  const index = patchIndex(line)!;
  const known = shippedBy(changes, champion, index);
  let recentNerfs = 0;
  let recentBuffs = 0;
  let last = -1;
  for (const c of known) {
    const i = patchIndex(c.line)!;
    last = Math.max(last, i);
    const age = index - i; // 0 = 이번 패치 시작에 들어감
    if (age < DECAY.length) {
      if (c.direction === "nerf") recentNerfs += DECAY[age];
      if (c.direction === "buff") recentBuffs += DECAY[age];
    }
  }
  return { recentNerfs, recentBuffs, patchesSinceChange: last === -1 ? index + 1 : index - last };
}

/** 스냅숏 N의 라벨. 같은 구간에서 버프와 너프가 함께 나오면 방향이 없는 조정(유지)으로 본다. */
export function labelFor(changes: PatchChange[], champion: string, line: string): Label | null {
  const index = patchIndex(line);
  if (index === undefined || index + 1 >= PATCHES.length) return null; // 다음 패치노트가 아직 없다
  const next = PATCHES[index + 1];
  if (SYSTEMIC_PATCHES.has(next.name)) return null;
  const relevant = changes.filter(
    (c) =>
      c.champion === champion &&
      ((c.section === "champions" && c.line === next.line) || (c.section === "mid-patch" && c.line === line)),
  );
  const buff = relevant.some((c) => c.direction === "buff");
  const nerf = relevant.some((c) => c.direction === "nerf");
  if (buff && !nerf) return 0;
  if (nerf && !buff) return 2;
  return 1;
}

export function championInput(
  row: SnapshotRow,
  line: string,
  previous: SnapshotRow | undefined,
  inputs: Omit<DatasetInputs, "snapshots">,
): ChampionInput {
  const op = inputs.operator[row.champion] ?? {};
  const history = historyFor(inputs.changes, row.champion, line);
  const released = inputs.releases[row.champion];
  const releasedIndex = released === undefined ? undefined : patchIndex(released);
  const index = patchIndex(line)!;
  return {
    games: row.games,
    wins: row.wins,
    pickRate: row.pickRate,
    banRate: row.banRate,
    eliteWinRate: row.eliteWinRate,
    diamondWinRate: row.diamondWinRate,
    prevWinRate: previous && previous.games >= MIN_GAMES ? previous.wins / previous.games : null,
    prevPickRate: previous?.pickRate ?? null,
    flexPositions: row.flexPositions,
    mastery: op.mastery ?? null,
    proPresence: inputs.pro[line]?.[row.champion] ?? null,
    difficulty: op.difficulty ?? null,
    blindPick: op.blindPick ?? null,
    ...history,
    newChampion: releasedIndex !== undefined && index - releasedIndex >= 0 && index - releasedIndex < 4,
  };
}

/** 같은 구간의 직전 패치 스냅숏 */
export function previousSnapshot(snapshots: Snapshot[], snapshot: Snapshot): Snapshot | undefined {
  const index = patchIndex(snapshot.line);
  if (!index) return undefined;
  return snapshots.find((s) => s.bracket === snapshot.bracket && s.line === PATCHES[index - 1].line);
}

/**
 * 학습 행. 라벨(라이엇 판단)은 구간과 상관없이 챔피언당 하나라, 구간마다 학습하면 같은 라벨을
 * 다섯 번 센다. 그래서 다섯 구간을 합친 `all` 스냅숏으로만 학습하고, 구간별 점수는 그 가중치로 낸다.
 * 패치노트 변경은 챔피언 단위라 챔피언마다 가장 많이 플레이된 포지션 하나를 쓴다.
 * 표본이 MIN_GAMES 미만인 챔피언은 뺀다 — 승률을 믿을 수 없는 행이 가중치를 흔든다.
 */
export function buildTrainingRows(inputs: DatasetInputs): TrainingRow[] {
  const all = inputs.snapshots.filter((s) => s.bracket === "all");
  const rows: TrainingRow[] = [];
  for (const snapshot of all) {
    const index = patchIndex(snapshot.line);
    if (index === undefined) continue;
    const previous = previousSnapshot(all, snapshot);
    const primary = new Map<string, SnapshotRow>();
    for (const row of snapshot.rows) {
      const best = primary.get(row.champion);
      if (!best || row.games > best.games) primary.set(row.champion, row);
    }
    for (const row of primary.values()) {
      if (row.games < MIN_GAMES) continue;
      const label = labelFor(inputs.changes, row.champion, snapshot.line);
      if (label === null) continue;
      const prev = previous?.rows.find((r) => r.champion === row.champion && r.position === row.position);
      rows.push({
        patch: snapshot.line,
        champion: row.champion,
        position: row.position,
        raw: rawFeatures(championInput(row, snapshot.line, prev, inputs)),
        label,
      });
    }
  }
  return rows;
}
