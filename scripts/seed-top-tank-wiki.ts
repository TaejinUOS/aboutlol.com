/**
 * 인벤 공략을 현재 스킬 구조와 대조해 작성한 탑 탱커 12명의 챔피언 위키·상대법 시드.
 * 새 문서는 비어 있을 때만 채우고, 기존 사이온 시스템 초안은 조사한 리비전과 이력이
 * 정확히 일치할 때만 보강한다.
 * 실행: npx tsx scripts/seed-top-tank-wiki.ts
 * 적용: npx wrangler d1 execute kkaenam-gg --local --file seeds/top-tank-wiki.sql
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

const CREATED_AT = "2026-09-13T06:00:00.000Z";
const PATCH = catalog.patch;
const slugs = [
  "ornn",
  "malphite",
  "shen",
  "ksante",
  "sion",
  "chogath",
  "poppy",
  "maokai",
  "nasus",
  "zac",
  "tahmkench",
  "drmundo",
] as const;

const quote = (value: string | number) => `'${String(value).replace(/'/g, "''")}'`;
const lines = [
  "-- scripts/seed-top-tank-wiki.ts가 생성. 원고는 seeds/champion-wiki와 seeds/top-tank-matchup-wiki.",
  "-- 기존 사용자 편집을 보존하고, 조사 시점과 상태가 정확히 같은 시스템 초안만 갱신한다.",
  "INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)",
  `VALUES (${quote(SYSTEM_USER_ID)}, 'system', 'seed', '깨남.COM', NULL, 'admin', ${quote(CREATED_AT)});`,
  "",
];

for (const slug of slugs) {
  const champion = catalog.champions.find((entry) => entry.slug === slug);
  assert(champion, `카탈로그에 없는 챔피언: ${slug}`);
  assert.equal(checkArticleTitle(champion.name), null);
  assert(
    classifications.some(
      (entry) =>
        entry.positionSlug === "top" &&
        entry.categorySlug === "tank" &&
        entry.championName === champion.name,
    ),
    `탑 탱커 초기 분류에 없는 챔피언: ${champion.name}`,
  );

  const article = readFileSync(join("seeds/champion-wiki", `${slug}.md`), "utf8")
    .replace(/\r\n?/g, "\n")
    .trim();
  const matchup = readFileSync(join("seeds/top-tank-matchup-wiki", `${slug}.md`), "utf8")
    .replace(/\r\n?/g, "\n")
    .trim();

  validateArticle(slug, article);
  validateMatchup(slug, matchup);

  if (slug === "sion") {
    appendSionUpgrade(article, matchup);
  } else {
    appendNewArticle(slug, champion.name, article);
    appendNewMatchup(slug, matchup);
  }

  console.log(`${champion.name}: 위키 ${article.length}자 · 상대법 ${matchup.length}자, 검증 통과`);
}

writeFileSync("seeds/top-tank-wiki.sql", `${lines.join("\n").trimEnd()}\n`);
console.log(`생성: seeds/top-tank-wiki.sql (챔피언 위키 ${slugs.length}개 + 상대법 ${slugs.length}개)`);

function validateArticle(slug: string, body: string) {
  assert(body.startsWith("# 탑 라인 실전 운용\n\n> **한눈에 보기** — "));
  assert(body.length <= MAX_BODY_LENGTH, `${slug}: 챔피언 위키 길이 초과`);
  assert(body.includes("[[분류:탑]] [[분류:탱커]]"), `${slug}: 분류 누락`);
  assert(/`[QWER]`/u.test(body), `${slug}: 기술 키 누락`);
  assert((body.match(/\*\*/gu) ?? []).length >= 6, `${slug}: 강조 부족`);
  assert((body.match(/^- \[.+\]\(https?:\/\//gmu) ?? []).length >= 2, `${slug}: 출처 링크 부족`);
  assert(!/(?:^|\s)(?:룬|아이템|소환사 주문)(?:\s|$)/mu.test(body), `${slug}: 제외 주제 포함`);
  assert.equal(collectWikiLinkTitles(body).length, 2, `${slug}: 분류 위키링크 수`);
  const outline = buildOutline(body, "article-body", 2, new Set());
  assert.equal(outline.children.length, 1);
  assert(outline.children[0].children.length >= 5);
}

function validateMatchup(slug: string, body: string) {
  assert(body.startsWith("# 탑 라인 상대법\n\n> **한눈에 보기** — "));
  assert(body.length <= MAX_BODY_LENGTH, `${slug}: 상대법 길이 초과`);
  assert(/`[QWER]`/u.test(body), `${slug}: 상대법 기술 키 누락`);
  assert((body.match(/\*\*/gu) ?? []).length >= 4, `${slug}: 상대법 강조 부족`);
  assert((body.match(/^- \[.+\]\(https?:\/\//gmu) ?? []).length >= 2, `${slug}: 상대법 출처 링크 부족`);
  assert(!/(?:^|\s)(?:룬|아이템|소환사 주문)(?:\s|$)/mu.test(body), `${slug}: 상대법 제외 주제 포함`);
  const outline = buildOutline(body, "matchup-body", 2, new Set());
  assert.equal(outline.children.length, 1);
  assert(outline.children[0].children.length >= 5);
}

function appendNewArticle(slug: string, name: string, body: string) {
  const docId = `doc-top-tank-champion-${slug}-20260913`;
  const editId = `edit-top-tank-champion-${slug}-20260913`;
  lines.push(
    `-- ${name} 챔피언 위키 (${body.length}자)`,
    "INSERT INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)",
    `SELECT ${quote(docId)}, 'article', ${quote(name)}, ${quote(titleKey(name))}, 'published', NULL, ${quote(body)}, 1, ${quote(PATCH)}, 'guarded', ${quote(CREATED_AT)}, ${quote(CREATED_AT)}, ${quote(SYSTEM_USER_ID)}`,
    `WHERE NOT EXISTS (SELECT 1 FROM wiki_docs WHERE id = ${quote(docId)} OR (kind = 'article' AND title_key = ${quote(titleKey(name))}));`,
    "INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)",
    `SELECT ${quote(editId)}, id, NULL, 0, general, '탑 탱커 챔피언 위키 작성', 'accepted', ${quote(SYSTEM_USER_ID)}, ${quote(CREATED_AT)}, 'admin', 1 FROM wiki_docs`,
    `WHERE id = ${quote(docId)} AND revision = 1 AND general = ${quote(body)}`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
  );
  appendArticleLinks(docId, body);
  lines.push("");
}

function appendNewMatchup(slug: string, body: string) {
  const docId = `doc-c-${slug}`;
  const editId = `edit-top-tank-matchup-${slug}-20260913`;
  lines.push(
    `-- ${slug} 상대법 (${body.length}자)`,
    "INSERT OR IGNORE INTO wiki_docs (id, kind, title, title_key, doc_status, champion_slug, general, revision, patch, edit_policy, created_at, updated_at, updated_by)",
    `VALUES (${quote(docId)}, 'matchup', NULL, NULL, 'published', ${quote(slug)}, '', 0, ${quote(PATCH)}, 'guarded', ${quote(CREATED_AT)}, ${quote(CREATED_AT)}, ${quote(SYSTEM_USER_ID)});`,
    "UPDATE wiki_docs",
    `SET general = ${quote(body)}, revision = 1, patch = ${quote(PATCH)}, updated_at = ${quote(CREATED_AT)}, updated_by = ${quote(SYSTEM_USER_ID)}`,
    `WHERE id = ${quote(docId)} AND kind = 'matchup' AND champion_slug = ${quote(slug)}`,
    `AND revision = 0 AND TRIM(general) = '' AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = ${quote(docId)});`,
    "INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)",
    `SELECT ${quote(editId)}, id, NULL, 0, general, '탑 탱커 상대법 작성', 'accepted', ${quote(SYSTEM_USER_ID)}, ${quote(CREATED_AT)}, 'admin', 1 FROM wiki_docs`,
    `WHERE id = ${quote(docId)} AND revision = 1 AND general = ${quote(body)}`,
    `AND updated_at = ${quote(CREATED_AT)} AND updated_by = ${quote(SYSTEM_USER_ID)}`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
    "",
  );
}

function appendSionUpgrade(article: string, matchup: string) {
  const articleId = "doc-ai-champion-sion-20260912";
  const articleEdit = "edit-top-tank-champion-sion-20260913";
  const matchupId = "doc-c-sion";
  const matchupEdit = "edit-top-tank-matchup-sion-20260913";
  lines.push(
    "-- 사이온 챔피언 위키: 기존 시스템 초안만 보강",
    "UPDATE wiki_docs",
    `SET general = ${quote(article)}, revision = 2, patch = ${quote(PATCH)}, updated_at = ${quote(CREATED_AT)}, updated_by = ${quote(SYSTEM_USER_ID)}`,
    `WHERE id = ${quote(articleId)} AND kind = 'article' AND revision = 1 AND updated_by = ${quote(SYSTEM_USER_ID)}`,
    `AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = ${quote(articleId)}) = 1`,
    `AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-champion-sion-20260912' AND doc_id = ${quote(articleId)} AND status = 'accepted')`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(articleEdit)});`,
    "INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)",
    `SELECT ${quote(articleEdit)}, id, NULL, 1, general, '탑 탱커 챔피언 위키 보강', 'accepted', ${quote(SYSTEM_USER_ID)}, ${quote(CREATED_AT)}, 'admin', 2 FROM wiki_docs`,
    `WHERE id = ${quote(articleId)} AND revision = 2 AND general = ${quote(article)}`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(articleEdit)});`,
    `DELETE FROM wiki_links WHERE source_doc = ${quote(articleId)} AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(articleEdit)});`,
  );
  appendArticleLinks(articleId, article, articleEdit);
  lines.push(
    "",
    "-- 사이온 상대법: 기존 시스템 초안만 보강",
    "UPDATE wiki_docs",
    `SET general = ${quote(matchup)}, revision = 2, patch = ${quote(PATCH)}, updated_at = ${quote(CREATED_AT)}, updated_by = ${quote(SYSTEM_USER_ID)}`,
    `WHERE id = ${quote(matchupId)} AND kind = 'matchup' AND revision = 1 AND updated_by = ${quote(SYSTEM_USER_ID)}`,
    `AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = ${quote(matchupId)}) = 1`,
    `AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = 'edit-ai-mid-matchup-sion-20260912' AND doc_id = ${quote(matchupId)} AND status = 'accepted')`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(matchupEdit)});`,
    "INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)",
    `SELECT ${quote(matchupEdit)}, id, NULL, 1, general, '탑 탱커 상대법 보강', 'accepted', ${quote(SYSTEM_USER_ID)}, ${quote(CREATED_AT)}, 'admin', 2 FROM wiki_docs`,
    `WHERE id = ${quote(matchupId)} AND revision = 2 AND general = ${quote(matchup)}`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(matchupEdit)});`,
    "",
  );
}

function appendArticleLinks(docId: string, body: string, guardEditId?: string) {
  const guard = guardEditId
    ? ` AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(guardEditId)})`
    : "";
  for (const title of unresolvedWikiTitles([body])) {
    lines.push(
      "INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)",
      `SELECT ${quote(docId)}, NULL, ${quote(titleKey(title))}, ${quote(title)} FROM wiki_docs WHERE id = ${quote(docId)}${guard};`,
    );
  }
}
