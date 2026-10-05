/**
 * 공식 패치노트를 받아 챔피언 버프·너프 라벨을 만든다.
 *
 *   npx tsx scripts/tier-model/fetch-patch-notes.ts            # 캐시가 없는 패치만 받는다
 *   npx tsx scripts/tier-model/fetch-patch-notes.ts --refresh  # 전부 다시 받는다
 *
 * 결과
 * - data/tier-model/patch-changes.json  라벨 (커밋한다)
 * - .cache/patch-notes/*.html           원문 캐시 (커밋하지 않는다 — 라이엇 저작물)
 * - .cache/patch-notes/review.md        자동 판정이 불확실한 변경의 의도 문장
 *
 * 불확실한 변경은 data/tier-model/label-overrides.json에 사람이 판정을 적는다.
 */
import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import path from "node:path";

import catalog from "../../src/data/generated/champions.json";
import { PATCHES } from "../../src/lib/tierModel/patches";
import { classifyChange, extractChampionChanges, isCancellation, type Direction } from "../../src/lib/tierModel/patchNotes";

const ROOT = path.resolve(__dirname, "../..");
const CACHE = path.join(ROOT, ".cache/patch-notes");
const OUT = path.join(ROOT, "data/tier-model/patch-changes.json");
const OVERRIDES = path.join(ROOT, "data/tier-model/label-overrides.json");

type Override = { direction: Direction; reason: string };

const refresh = process.argv.includes("--refresh");
const slugById = new Map(catalog.champions.map((c) => [c.id, c.slug]));

async function load(url: string, file: string): Promise<string> {
  if (!refresh && existsSync(file)) return readFileSync(file, "utf8");
  const response = await fetch(url, { headers: { "user-agent": "Mozilla/5.0 (ABOUTLOL tier model)" } });
  if (!response.ok) throw new Error(`${url} → HTTP ${response.status}`);
  const html = await response.text();
  writeFileSync(file, html);
  await new Promise((resolve) => setTimeout(resolve, 500));
  return html;
}

async function main() {
  mkdirSync(CACHE, { recursive: true });
  mkdirSync(path.dirname(OUT), { recursive: true });
  const overrides: Record<string, Override> = existsSync(OVERRIDES)
    ? JSON.parse(readFileSync(OVERRIDES, "utf8"))
    : {};

  const rows: Record<string, unknown>[] = [];
  const review: string[] = [];
  const unknown = new Set<string>();

  for (const patch of PATCHES) {
    const html = await load(patch.notesUrl, path.join(CACHE, `${patch.name}.html`));
    const extracted = extractChampionChanges(html);
    // 취소 공지가 붙은 챔피언은 그 패치의 본문 변경이 실제로 적용되지 않았다. 라벨에서 뺀다.
    const cancelled = new Set(extracted.filter(isCancellation).map((c) => c.ddragonId));
    for (const id of cancelled) console.log(`  ${patch.name}: ${id} 변경 미적용 공지 → 라벨 제외`);
    const changes = extracted.filter((c) => !cancelled.has(c.ddragonId)).map(classifyChange);
    if (!changes.length) console.warn(`! ${patch.name}: 챔피언 변경을 찾지 못함 — 문서 구조를 확인할 것`);

    for (const change of changes) {
      const slug = slugById.get(change.ddragonId);
      if (!slug) {
        unknown.add(change.ddragonId);
        continue;
      }
      const key = `${patch.name}/${change.section}/${slug}`;
      const override = overrides[key];
      if (!override && change.confidence === "review") {
        review.push(
          `### ${key}\n- 자동: ${change.direction} (의도 ${change.contextScore}, 수치 ${change.numericScore.toFixed(2)})\n` +
            `- 의도: ${change.context || "(없음)"}\n${change.lines.map((l) => `  - ${l}`).join("\n")}\n`,
        );
      }
      rows.push({
        patch: patch.name,
        line: patch.line,
        section: change.section,
        champion: slug,
        direction: override?.direction ?? change.direction,
        method: override ? "manual" : change.confidence,
        ...(override ? { reason: override.reason } : {}),
        contextScore: change.contextScore,
        numericScore: Number(change.numericScore.toFixed(3)),
        lines: change.lines.length,
        source: patch.notesUrl,
      });
    }
  }

  // 같은 패치에서 한 챔피언이 두 블록으로 나뉘는 경우가 있다(본문 + 패치 중간). 둘 다 남긴다.
  writeFileSync(OUT, `${JSON.stringify(rows, null, 1)}\n`);
  writeFileSync(path.join(CACHE, "review.md"), review.join("\n"));

  const count = (d: Direction) => rows.filter((r) => r.direction === d).length;
  console.log(`패치 ${PATCHES.length}개, 변경 ${rows.length}건 — 버프 ${count("buff")}, 너프 ${count("nerf")}, 조정 ${count("adjust")}`);
  console.log(`검토 필요 ${review.length}건 → .cache/patch-notes/review.md`);
  if (unknown.size) console.warn(`카탈로그에 없는 챔피언 ID: ${[...unknown].join(", ")} — npm run data:sync 확인`);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
