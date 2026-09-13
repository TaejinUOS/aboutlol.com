/**
 * 위키 원고의 인벤 출처를 근거 문장 바로 뒤의 링크 전용 인라인 각주로 통일한다.
 *
 * 이 스크립트는 2026-09-13 원고 이관을 위한 일회성 정규화 도구다. 재실행해도
 * 링크 수나 각주 수가 늘지 않도록 멱등적으로 작성했다.
 * 실행: npx tsx scripts/normalize-wiki-source-footnotes.ts
 */
import assert from "node:assert/strict";
import { readdirSync, readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const ROOTS = [
  "seeds/champion-wiki",
  "seeds/mid-matchup-wiki",
  "seeds/top-tank-matchup-wiki",
] as const;
const INVEN_URL = /https?:\/\/(?:[a-z0-9-]+\.)?inven\.co\.kr\/[^)\s]+/giu;
const MARKDOWN_LINK = /\[([^\n]*?)\]\((https?:\/\/[^)\s]+)\)/gu;
const SOURCE_SECTION = /\n\n(?:---\n\n)?## 출처\n[\s\S]*$/u;

let documentCount = 0;
let beforeLinkCount = 0;
let afterLinkCount = 0;

for (const root of ROOTS) {
  for (const filename of readdirSync(root).filter((name) => name.endsWith(".md")).sort()) {
    const path = join(root, filename);
    const before = readFileSync(path, "utf8").replace(/\r\n?/g, "\n").trim();
    const linkCount = before.match(INVEN_URL)?.length ?? 0;
    assert(linkCount > 0, `${path}: 인벤 링크가 없다`);

    let body = normalizeExistingFootnotes(before, path);
    const source = body.match(SOURCE_SECTION)?.[0];
    if (source) {
      const links = markdownLinks(source);
      assert.equal(links.length, linkCount, `${path}: 출처 섹션 링크 파싱 실패`);
      body = body.replace(SOURCE_SECTION, "");
      body = attachLinksToEvidenceSentences(body, links, path);
    }

    if (root === "seeds/champion-wiki" && !body.startsWith("# 탑 라인 실전 운용\n")) {
      body = body.replace(/^#[^\n]+/u, "# 미드 라인 실전 운용");
    } else if (root === "seeds/mid-matchup-wiki") {
      body = body.replace(/^#[^\n]+/u, "# 미드 라인 상대법");
    }

    const normalized = `${body.trim()}\n`;
    const nextLinkCount = normalized.match(INVEN_URL)?.length ?? 0;
    assert.equal(nextLinkCount, linkCount, `${path}: 인벤 링크 수가 달라졌다`);
    assert(!normalized.includes("# AI 작성 초안"), `${path}: AI 제목이 남았다`);
    assert(!normalized.includes("## 출처"), `${path}: 출처 섹션이 남았다`);
    assertNoInvenLinksOutsideLinkOnlyFootnotes(normalized, path);

    writeFileSync(path, normalized);
    documentCount += 1;
    beforeLinkCount += linkCount;
    afterLinkCount += nextLinkCount;
  }
}

assert.equal(documentCount, 93);
assert.equal(afterLinkCount, beforeLinkCount);
console.log(`정규화: 원고 ${documentCount}개 · 인벤 링크 ${afterLinkCount}개 보존`);

function markdownLinks(source: string) {
  return [...source.matchAll(MARKDOWN_LINK)].map((match) => {
    const label = match[1]
      .replace(/(?<!\\)\[/gu, "\\[")
      .replace(/(?<!\\)\]/gu, "\\]");
    return `[${label}](${match[2]})`;
  });
}

function normalizeExistingFootnotes(source: string, path: string) {
  let out = "";
  let cursor = 0;

  while (cursor < source.length) {
    const open = source.indexOf("[*", cursor);
    if (open < 0) return out + source.slice(cursor);
    out += source.slice(cursor, open);

    let depth = 1;
    let close = open + 2;
    for (; close < source.length && depth > 0; close += 1) {
      if (source[close] === "\\") {
        close += 1;
      } else if (source[close] === "[") {
        depth += 1;
      } else if (source[close] === "]") {
        depth -= 1;
      } else if (source[close] === "\n") {
        break;
      }
    }

    assert.equal(depth, 0, `${path}: 닫히지 않은 각주`);
    const content = source.slice(open + 2, close - 1).trim();
    const links = markdownLinks(content);
    assert(links.length > 0, `${path}: 링크가 없는 기존 각주`);
    out += links.map((link) => `[* ${link}]`).join("");
    cursor = close;
  }

  return out;
}

function attachLinksToEvidenceSentences(body: string, links: string[], path: string) {
  const blocks = body.split("\n\n");
  const candidates = blocks
    .map((block, index) => ({ block, index }))
    .filter(({ block }) =>
      !block.startsWith("#") &&
      !block.startsWith(">") &&
      !block.startsWith("[[") &&
      !block.startsWith("-") &&
      block !== "---" &&
      /[.!?](?:\*\*)?/u.test(block),
    );
  assert(candidates.length >= links.length, `${path}: 각주를 붙일 근거 문장이 부족하다`);

  links.forEach((link, index) => {
    const target = candidates[index];
    blocks[target.index] = target.block.replace(
      /[.!?](?:\*\*)?/u,
      (sentenceEnd) => `${sentenceEnd}[* ${link}]`,
    );
  });
  return blocks.join("\n\n");
}

function assertNoInvenLinksOutsideLinkOnlyFootnotes(source: string, path: string) {
  const withoutFootnotes = source.replace(/\[\* \[(?:\\.|[^\]])+\]\(https?:\/\/(?:[a-z0-9-]+\.)?inven\.co\.kr\/[^)\s]+\)\]/giu, "");
  assert(!INVEN_URL.test(withoutFootnotes), `${path}: 각주 밖 인벤 링크가 남았다`);
}
