/** 위키 원고 93개의 제목과 인벤 링크 전용 인라인 각주를 한 번에 점검한다. */
import assert from "node:assert/strict";
import { readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";

import { validateSourceFootnotes } from "./wiki-manuscript-validation";

const groups = [
  { root: "seeds/champion-wiki", count: 55 },
  { root: "seeds/mid-matchup-wiki", count: 26 },
  { root: "seeds/top-tank-matchup-wiki", count: 12 },
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
        body.startsWith("# 미드 라인 실전 운용\n") || body.startsWith("# 탑 라인 실전 운용\n"),
        `${path}: 챔피언 문서 제목이 올바르지 않다`,
      );
    } else if (group.root === "seeds/mid-matchup-wiki") {
      assert(body.startsWith("# 미드 라인 상대법\n"), `${path}: 미드 상대법 제목이 올바르지 않다`);
    } else {
      assert(body.startsWith("# 탑 라인 상대법\n"), `${path}: 탑 상대법 제목이 올바르지 않다`);
    }

    sources += validateSourceFootnotes(body, path);
    documents += 1;
  }
}

assert.equal(documents, 93);
assert.equal(sources, 169, "인벤 링크 수가 정규화 전과 달라졌다");
console.log(`위키 원고 검증 통과: ${documents}개 · 링크 전용 인벤 각주 ${sources}개`);
