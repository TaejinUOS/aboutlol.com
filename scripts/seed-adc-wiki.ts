/**
 * 인벤 챔피언 정보와 현재 스킬 구조를 대조해 작성한 원딜 위키·공통 상대법 시드.
 * 트리스타나·스몰더·코르키 일반 위키와 트리스타나·코르키 상대법은 기존 공유 문서와
 * 편집 이력을 보존한다.
 * 실행: npx tsx scripts/seed-adc-wiki.ts
 * 적용: npx wrangler d1 execute kkaenam-gg --local --file seeds/adc-wiki.sql
 */
import assert from "node:assert/strict";
import { readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

import catalog from "../src/data/generated/champions.json";
import { classifications } from "../src/data/taxonomy";
import { MAX_BODY_LENGTH, SYSTEM_USER_ID } from "../src/data/wiki";
import { buildOutline, collectWikiLinkTitles } from "../src/lib/wikiMarkup";
import { unresolvedWikiTitles } from "../src/lib/wikiLink";
import { checkArticleTitle, titleKey } from "../src/lib/wikiTitle";
import { validateSourceFootnotes } from "./wiki-manuscript-validation";

const CREATED_AT = "2026-09-15T09:00:00.000Z";
const PATCH = catalog.patch;
const articleSlugs = [
  "caitlyn", "jinx", "ezreal", "jhin", "xayah", "missfortune", "ashe", "varus",
  "kaisa", "aphelios", "sivir", "lucian", "draven", "kogmaw", "twitch", "vayne",
  "samira", "zeri", "kalista", "nilah", "senna", "yunara",
] as const;
const matchupSlugs = [
  "caitlyn", "jinx", "ezreal", "jhin", "xayah", "missfortune", "ashe", "varus",
  "kaisa", "aphelios", "sivir", "lucian", "draven", "kogmaw", "twitch", "vayne",
  "samira", "zeri", "kalista", "nilah", "smolder", "senna", "yunara",
] as const;

const quote = (value: string | number) => `'${String(value).replace(/'/g, "''")}'`;
const lines = [
  "-- scripts/seed-adc-wiki.ts가 생성. 원딜 일반 위키 22개와 공통 상대법 23개.",
  "-- 기존 공유 문서와 사용자 편집은 덮어쓰지 않으며 같은 SQL을 다시 실행해도 이력이 늘지 않는다.",
  "INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)",
  `VALUES (${quote(SYSTEM_USER_ID)}, 'system', 'seed', '깨남.COM', NULL, 'admin', ${quote(CREATED_AT)});`,
  "",
];

for (const slug of articleSlugs) {
  const champion = championFor(slug);
  const body = readManuscript("seeds/champion-wiki", slug);
  validateArticle(slug, body);
  appendNewArticle(slug, champion.name, body);
  console.log(`${champion.name}: 위키 ${body.length}자, 검증 통과`);
}

for (const slug of matchupSlugs) {
  const champion = championFor(slug);
  const body = readManuscript("seeds/adc-matchup-wiki", slug);
  validateMatchup(slug, body);
  appendNewMatchup(slug, body);
  console.log(`${champion.name}: 상대법 ${body.length}자, 검증 통과`);
}

writeFileSync("seeds/adc-wiki.sql", `${lines.join("\n").trimEnd()}\n`);
console.log(
  `생성: seeds/adc-wiki.sql (챔피언 위키 ${articleSlugs.length}개 + 상대법 ${matchupSlugs.length}개)`,
);

function championFor(slug: (typeof articleSlugs)[number] | (typeof matchupSlugs)[number]) {
  const champion = catalog.champions.find((entry) => entry.slug === slug);
  assert(champion, `카탈로그에 없는 챔피언: ${slug}`);
  assert.equal(checkArticleTitle(champion.name), null);
  assert(
    classifications.some(
      (entry) =>
        entry.positionSlug === "adc" &&
        entry.categorySlug === "adc" &&
        entry.championName === champion.name,
    ),
    `원딜 초기 분류에 없는 챔피언: ${champion.name}`,
  );
  return champion;
}

function readManuscript(root: string, slug: string) {
  return readFileSync(join(root, `${slug}.md`), "utf8").replace(/\r\n?/g, "\n").trim();
}

function validateArticle(slug: string, body: string) {
  assert(body.startsWith("# 원딜 실전 운용\n\n> **한눈에 보기** — "));
  assert(body.length <= MAX_BODY_LENGTH, `${slug}: 챔피언 위키 길이 초과`);
  assert(body.includes("[[분류:원딜]]"), `${slug}: 분류 누락`);
  assert(/`[QWER]`/u.test(body), `${slug}: 기술 키 누락`);
  assert((body.match(/\*\*/gu) ?? []).length >= 6, `${slug}: 강조 부족`);
  validateSourceFootnotes(body, `${slug} 챔피언 문서`);
  assert(!/(?:^|\s)(?:룬|아이템|소환사 주문)(?:\s|$)/mu.test(body), `${slug}: 제외 주제 포함`);
  assert.equal(collectWikiLinkTitles(body).length, 1, `${slug}: 분류 위키링크 수`);
  const outline = buildOutline(body, "article-body", 2, new Set());
  assert.equal(outline.children.length, 1);
  assert(outline.children[0].children.length >= 4);
}

function validateMatchup(slug: string, body: string) {
  assert(body.startsWith("# 원딜 상대법\n\n> **한눈에 보기** — "));
  assert(body.length <= MAX_BODY_LENGTH, `${slug}: 상대법 길이 초과`);
  assert(/`[QWER]`/u.test(body), `${slug}: 상대법 기술 키 누락`);
  assert((body.match(/\*\*/gu) ?? []).length >= 4, `${slug}: 상대법 강조 부족`);
  validateSourceFootnotes(body, `${slug} 상대법`);
  assert(!/(?:^|\s)(?:룬|아이템|소환사 주문)(?:\s|$)/mu.test(body), `${slug}: 상대법 제외 주제 포함`);
  const outline = buildOutline(body, "matchup-body", 2, new Set());
  assert.equal(outline.children.length, 1);
  assert(outline.children[0].children.length >= 4);
}

function appendNewArticle(slug: string, name: string, body: string) {
  const docId = `doc-adc-champion-${slug}-20260915`;
  const editId = `edit-adc-champion-${slug}-20260915`;
  lines.push(
    `-- ${name} 챔피언 위키 (${body.length}자)`,
    "INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)",
    `SELECT ${quote(docId)}, 'article', ${quote(name)}, ${quote(titleKey(name))}, 'published', NULL, ${quote(body)}, 1, ${quote(PATCH)}, 'guarded', ${quote(CREATED_AT)}, ${quote(CREATED_AT)}, ${quote(SYSTEM_USER_ID)}`,
    `WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = ${quote(docId)} OR (kind = 'article' AND title_key = ${quote(titleKey(name))}));`,
    "INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)",
    `SELECT ${quote(editId)}, id, NULL, 0, general, '원딜 챔피언 위키 작성', 'accepted', ${quote(SYSTEM_USER_ID)}, ${quote(CREATED_AT)}, 'admin', 1 FROM wiki_docs`,
    `WHERE id = ${quote(docId)} AND revision = 1 AND general = ${quote(body)}`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
  );
  appendArticleLinks(docId, body);
  lines.push("");
}

function appendNewMatchup(slug: string, body: string) {
  const docId = `doc-c-${slug}`;
  const editId = `edit-adc-matchup-${slug}-20260915`;
  lines.push(
    `-- ${slug} 상대법 (${body.length}자)`,
    "INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)",
    `VALUES (${quote(docId)}, 'matchup', NULL, NULL, 'published', ${quote(slug)}, '', 0, ${quote(PATCH)}, 'guarded', ${quote(CREATED_AT)}, ${quote(CREATED_AT)}, ${quote(SYSTEM_USER_ID)});`,
    "UPDATE wiki_docs",
    `SET general = ${quote(body)}, revision = 1, patch = ${quote(PATCH)}, updated_at = ${quote(CREATED_AT)}, updated_by = ${quote(SYSTEM_USER_ID)}`,
    `WHERE id = ${quote(docId)} AND kind = 'matchup' AND champion_slug = ${quote(slug)}`,
    `AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = ${quote(docId)});`,
    "INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)",
    `SELECT ${quote(editId)}, id, NULL, 0, general, '원딜 상대법 작성', 'accepted', ${quote(SYSTEM_USER_ID)}, ${quote(CREATED_AT)}, 'admin', 1 FROM wiki_docs`,
    `WHERE id = ${quote(docId)} AND revision = 1 AND general = ${quote(body)}`,
    `AND updated_at = ${quote(CREATED_AT)} AND updated_by = ${quote(SYSTEM_USER_ID)}`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
    "",
  );
}

function appendArticleLinks(docId: string, body: string) {
  for (const title of unresolvedWikiTitles([body])) {
    const targetKey = titleKey(title);
    lines.push(
      "INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)",
      `SELECT ${quote(docId)}, NULL, ${quote(targetKey)}, ${quote(title)} FROM wiki_docs WHERE id = ${quote(docId)}`,
      `AND NOT EXISTS (SELECT 1 FROM wiki_links WHERE source_doc = ${quote(docId)} AND target_key = ${quote(targetKey)});`,
    );
  }
}
