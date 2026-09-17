/** 위키 원고의 제목과 허용 출처 링크 전용 인라인 각주를 한 번에 점검한다. */
import assert from "node:assert/strict";
import { readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";

import { validateSourceFootnotes } from "./wiki-manuscript-validation";

const groups = [
  { root: "seeds/champion-wiki", count: 167 },
  { root: "seeds/mid-matchup-wiki", count: 26 },
  { root: "seeds/top-tank-matchup-wiki", count: 12 },
  { root: "seeds/top-bruiser-matchup-wiki", count: 22 },
  { root: "seeds/top-damage-matchup-wiki", count: 9 },
  { root: "seeds/jungle-ad-matchup-wiki", count: 20 },
  { root: "seeds/jungle-ap-matchup-wiki", count: 11 },
  { root: "seeds/adc-matchup-wiki", count: 23 },
  { root: "seeds/non-adc-matchup-wiki", count: 9 },
  { root: "seeds/support-mom-matchup-wiki", count: 8 },
  { root: "seeds/support-dad-matchup-wiki", count: 8 },
  { root: "seeds/support-wtf-matchup-wiki", count: 3 },
] as const;

let documents = 0;
let sources = 0;

for (const group of groups) {
  const filenames = readdirSync(group.root).filter((name) => name.endsWith(".md")).sort();
  assert.equal(filenames.length, group.count, `${group.root}: 원고 수가 달라졌다`);

  for (const filename of filenames) {
    const path = join(group.root, filename);
    const body = readFileSync(path, "utf8").replace(/\r\n?/g, "\n").trim();
    if (group.root === "seeds/champion-wiki") {
      assert(
        body.startsWith("# 미드 라인 실전 운용\n") ||
          body.startsWith("# 탑 라인 실전 운용\n") ||
          body.startsWith("# 정글 실전 운용\n") ||
          body.startsWith("# 원딜 실전 운용\n") ||
          body.startsWith("# 서폿 실전 운용\n"),
        `${path}: 챔피언 문서 제목이 올바르지 않다`,
      );
    } else if (group.root === "seeds/mid-matchup-wiki") {
      assert(body.startsWith("# 미드 라인 상대법\n"), `${path}: 미드 상대법 제목이 올바르지 않다`);
    } else if (
      group.root === "seeds/jungle-ad-matchup-wiki" ||
      group.root === "seeds/jungle-ap-matchup-wiki"
    ) {
      assert(body.startsWith("# 정글 상대법\n"), `${path}: 정글 상대법 제목이 올바르지 않다`);
    } else if (
      group.root === "seeds/adc-matchup-wiki" ||
      group.root === "seeds/non-adc-matchup-wiki"
    ) {
      assert(body.startsWith("# 원딜 상대법\n"), `${path}: 원딜 상대법 제목이 올바르지 않다`);
    } else if (
      group.root === "seeds/support-mom-matchup-wiki" ||
      group.root === "seeds/support-dad-matchup-wiki" ||
      group.root === "seeds/support-wtf-matchup-wiki"
    ) {
      assert(body.startsWith("# 서폿 상대법\n"), `${path}: 서폿 상대법 제목이 올바르지 않다`);
    } else {
      assert(body.startsWith("# 탑 라인 상대법\n"), `${path}: 탑 상대법 제목이 올바르지 않다`);
    }

    sources += validateSourceFootnotes(body, path);
    documents += 1;
  }
}

assert.equal(documents, 318);
assert.equal(sources, 482, "출처 링크 수가 예상과 달라졌다");
console.log(`위키 원고 검증 통과: ${documents}개 · 링크 전용 출처 각주 ${sources}개`);
