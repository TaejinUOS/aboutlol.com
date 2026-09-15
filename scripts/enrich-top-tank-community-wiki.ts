/**
 * MOBAFire → Onetricks.gg → 챔피언 Mains Reddit 순서로 조사한 탑 탱커 위키 보강 SQL.
 * 2026-09-15 운영 D1에서 확인한 리비전·본문 길이·편집 이력이 모두 같을 때만 갱신한다.
 * 실행: npx tsx scripts/enrich-top-tank-community-wiki.ts
 * 적용: npx wrangler d1 execute kkaenam-gg --remote --file seeds/top-tank-community-enrichment.sql
 */
import assert from "node:assert/strict";
import { readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

import catalog from "../src/data/generated/champions.json";
import { classifications } from "../src/data/taxonomy";
import { MAX_BODY_LENGTH, SYSTEM_USER_ID } from "../src/data/wiki";
import { buildOutline, collectWikiLinkTitles } from "../src/lib/wikiMarkup";
import { validateSourceFootnotes } from "./wiki-manuscript-validation";

const CREATED_AT = "2026-09-15T12:00:00.000Z";
const EXPECTED_UPDATED_AT = "2026-09-13T09:00:00.000Z";
const PATCH = catalog.patch;

type SourceTier = "MOBAFire" | "Onetricks.gg" | "Mains Reddit";

type TargetState = {
  docId: string;
  revision: number;
  bodyLength: number;
  editCount: number;
  latestEdit: string;
};

type Target = {
  slug: string;
  name: string;
  sourceTier: SourceTier;
  sourceUrl: string;
  article: TargetState;
  matchup: TargetState;
};

const targets: readonly Target[] = [
  target("ornn", "오른", "Mains Reddit", "https://www.reddit.com/r/ornnmains/comments/1p0q6gt/ornn_laning_phase/", 1133, 985),
  target("malphite", "말파이트", "MOBAFire", "https://www.mobafire.com/league-of-legends/build/raens-malphite-tips-amp-build-569913", 1089, 978),
  target("shen", "쉔", "MOBAFire", "https://www.mobafire.com/league-of-legends/build/25-23-xpetus-challenger-shen-guide-582399", 1082, 935),
  target("ksante", "크산테", "MOBAFire", "https://www.mobafire.com/league-of-legends/build/ksante-2026-653162", 1113, 1022),
  {
    ...target("sion", "사이온", "MOBAFire", "https://www.mobafire.com/league-of-legends/build/unstoppable-sion-guide-in-depth-sion-masterclass-643094", 1084, 984),
    article: state("doc-ai-champion-sion-20260912", 3, 1084, 3, "edit-inline-sources-article-sion-20260913"),
    matchup: state("doc-c-sion", 3, 984, 3, "edit-inline-sources-matchup-sion-20260913"),
  },
  target("chogath", "초가스", "MOBAFire", "https://www.mobafire.com/league-of-legends/build/comprehensive-tank-chogath-top-guide-info-on-every-toplane-matchup-633617", 1016, 978),
  target("poppy", "뽀삐", "Onetricks.gg", "https://www.onetricks.gg/guide/xd7cxmv/2617-rank-1-poppy-top-guide", 1060, 898),
  target("maokai", "마오카이", "MOBAFire", "https://www.mobafire.com/league-of-legends/build/the-inmortal-tree-12-8-maokai-top-amp-supp-guide-561758", 1082, 969),
  target("nasus", "나서스", "Onetricks.gg", "https://www.onetricks.gg/guide/gmdjt64/challenger-eune-nasus-q-max-guide", 1142, 989),
  target("zac", "자크", "Mains Reddit", "https://www.reddit.com/r/thesecretweapon/comments/1tgi5qm/toplane_zac/", 1006, 942),
  target("tahmkench", "탐 켄치", "Mains Reddit", "https://www.reddit.com/r/Tahmkenchmains/comments/1swm84r/new_to_kench_any_tips/", 1052, 924),
  target("drmundo", "문도 박사", "MOBAFire", "https://www.mobafire.com/league-of-legends/build/too-big-to-fail-na-challenger-mundo-main-guide-check-notes-matchup-update-revamp-632678", 1083, 974),
] as const;

const quote = (value: string | number) => `'${String(value).replace(/'/g, "''")}'`;
const lines = [
  "-- scripts/enrich-top-tank-community-wiki.ts가 생성.",
  "-- MOBAFire → Onetricks.gg → 챔피언 Mains Reddit 순서로 조사한 경험 팁 보강.",
  "-- 운영 조사 시점의 리비전·본문 길이·수정자·수정 시각·편집 이력이 모두 같을 때만 갱신한다.",
  "INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)",
  `VALUES (${quote(SYSTEM_USER_ID)}, 'system', 'seed', '깨남.COM', NULL, 'admin', ${quote(CREATED_AT)});`,
  "",
];

for (const entry of targets) {
  const champion = catalog.champions.find((item) => item.slug === entry.slug);
  assert(champion, `카탈로그에 없는 챔피언: ${entry.slug}`);
  assert.equal(champion.name, entry.name);
  assert(
    classifications.some(
      (item) =>
        item.positionSlug === "top" &&
        item.categorySlug === "tank" &&
        item.championName === entry.name,
    ),
    `탑/탱커 분류에 없는 챔피언: ${entry.name}`,
  );

  const article = manuscript("seeds/champion-wiki", entry.slug);
  const matchup = manuscript("seeds/top-tank-matchup-wiki", entry.slug);
  validateArticle(entry, article);
  validateMatchup(entry, matchup);

  appendUpdate(entry, "article", article, entry.article);
  appendUpdate(entry, "matchup", matchup, entry.matchup);
  console.log(
    `${entry.name}: ${entry.sourceTier} · 위키 ${article.length}자 · 상대법 ${matchup.length}자`,
  );
}

writeFileSync("seeds/top-tank-community-enrichment.sql", `${lines.join("\n").trimEnd()}\n`);
console.log("생성: seeds/top-tank-community-enrichment.sql (조건부 보강 24개)");

function target(
  slug: string,
  name: string,
  sourceTier: SourceTier,
  sourceUrl: string,
  articleLength: number,
  matchupLength: number,
): Target {
  return {
    slug,
    name,
    sourceTier,
    sourceUrl,
    article: state(
      `doc-top-tank-champion-${slug}-20260913`,
      2,
      articleLength,
      2,
      `edit-inline-sources-article-${slug}-20260913`,
    ),
    matchup: state(
      `doc-c-${slug}`,
      2,
      matchupLength,
      2,
      `edit-inline-sources-matchup-${slug}-20260913`,
    ),
  };
}

function state(
  docId: string,
  revision: number,
  bodyLength: number,
  editCount: number,
  latestEdit: string,
): TargetState {
  return { docId, revision, bodyLength, editCount, latestEdit };
}

function manuscript(root: string, slug: string) {
  return readFileSync(join(root, `${slug}.md`), "utf8").replace(/\r\n?/g, "\n").trim();
}

function validateArticle(entry: Target, body: string) {
  assert(body.startsWith("# 탑 라인 실전 운용\n\n> **한눈에 보기** — "));
  assert(body.includes("[[분류:탑]] [[분류:탱커]]"));
  assert.equal(collectWikiLinkTitles(body).length, 2);
  validateBody(entry, body, "챔피언 위키");
}

function validateMatchup(entry: Target, body: string) {
  assert(body.startsWith("# 탑 라인 상대법\n\n> **한눈에 보기** — "));
  validateBody(entry, body, "상대법");
}

function validateBody(entry: Target, body: string, kind: string) {
  const label = `${entry.name} ${kind}`;
  assert(body.length <= MAX_BODY_LENGTH, `${label}: 본문 길이 초과`);
  assert(/`[QWER]`/u.test(body), `${label}: 기술 키 누락`);
  assert(body.includes(entry.sourceUrl), `${label}: 조사 출처 누락`);
  assert(!/(?:^|\s)(?:룬|아이템|소환사 주문)(?:\s|$)/mu.test(body), `${label}: 제외 주제 포함`);
  validateSourceFootnotes(body, label);
  const outline = buildOutline(body, `${entry.slug}-${kind}`, 2, new Set());
  assert.equal(outline.children.length, 1);
  assert(outline.children[0].children.length >= 5, `${label}: 보강 문단 누락`);
}

function appendUpdate(entry: Target, kind: "article" | "matchup", body: string, current: TargetState) {
  const nextRevision = current.revision + 1;
  const editId = `edit-top-tank-community-${kind}-${entry.slug}-20260915`;
  const label = kind === "article" ? "챔피언 위키" : "상대법";
  const summary = kind === "article" ? "영어권 커뮤니티 경험 팁 보강" : "영어권 커뮤니티 상대 팁 보강";

  lines.push(
    `-- ${entry.name} ${label}: ${entry.sourceTier} (${body.length}자)`,
    "UPDATE wiki_docs",
    `SET general = ${quote(body)}, revision = ${nextRevision}, patch = ${quote(PATCH)}, updated_at = ${quote(CREATED_AT)}, updated_by = ${quote(SYSTEM_USER_ID)}`,
    `WHERE id = ${quote(current.docId)} AND kind = ${quote(kind)}`,
    `AND revision = ${current.revision} AND LENGTH(general) = ${current.bodyLength}`,
    `AND updated_at = ${quote(EXPECTED_UPDATED_AT)} AND updated_by = ${quote(SYSTEM_USER_ID)}`,
    `AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = ${quote(current.docId)}) = ${current.editCount}`,
    `AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(current.latestEdit)} AND doc_id = ${quote(current.docId)} AND status = 'accepted' AND revision = ${current.revision})`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
    "INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)",
    `SELECT ${quote(editId)}, id, NULL, ${current.revision}, general, ${quote(summary)}, 'accepted', ${quote(SYSTEM_USER_ID)}, ${quote(CREATED_AT)}, 'admin', ${nextRevision} FROM wiki_docs`,
    `WHERE id = ${quote(current.docId)} AND revision = ${nextRevision} AND general = ${quote(body)}`,
    `AND updated_at = ${quote(CREATED_AT)} AND updated_by = ${quote(SYSTEM_USER_ID)}`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
    "",
  );
}
