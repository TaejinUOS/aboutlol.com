/**
 * 탑 / 탱커 12명의 사용자 친화적 장문 원고를 운영 D1에 반영할 조건부 SQL 생성기.
 * 2026-09-17 운영 조회의 리비전·본문 길이·편집 이력이 모두 같을 때만 갱신한다.
 * 실행: npx tsx scripts/enrich-top-tank-friendly-wiki.ts
 * 적용: npx wrangler d1 execute kkaenam-gg --remote --file seeds/top-tank-friendly-enrichment.sql
 */
import assert from "node:assert/strict";
import { readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

import catalog from "../src/data/generated/champions.json";
import { classifications } from "../src/data/taxonomy";
import { MAX_BODY_LENGTH, SYSTEM_USER_ID } from "../src/data/wiki";
import { buildOutline, collectWikiLinkTitles } from "../src/lib/wikiMarkup";
import { validateSourceFootnotes } from "./wiki-manuscript-validation";

const CREATED_AT = "2026-09-17T07:15:00.000Z";
const EXPECTED_UPDATED_AT = "2026-09-15T12:00:00.000Z";
const PATCH = catalog.patch;

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
  sourceUrl: string;
  article: TargetState;
  matchup: TargetState;
};

const targets: readonly Target[] = [
  target("ornn", "오른", "https://www.reddit.com/r/ornnmains/comments/1p0q6gt/ornn_laning_phase/", 1451, 1304),
  target("malphite", "말파이트", "https://www.mobafire.com/league-of-legends/build/raens-malphite-tips-amp-build-569913", 1423, 1310),
  target("shen", "쉔", "https://www.mobafire.com/league-of-legends/build/25-23-xpetus-challenger-shen-guide-582399", 1444, 1278),
  target("ksante", "크산테", "https://www.mobafire.com/league-of-legends/build/ksante-2026-653162", 1416, 1322),
  {
    ...target("sion", "사이온", "https://www.mobafire.com/league-of-legends/build/unstoppable-sion-guide-in-depth-sion-masterclass-643094", 1450, 1347),
    article: state("doc-ai-champion-sion-20260912", 4, 1450, 4, "edit-top-tank-community-article-sion-20260915"),
    matchup: state("doc-c-sion", 4, 1347, 4, "edit-top-tank-community-matchup-sion-20260915"),
  },
  target("chogath", "초가스", "https://www.mobafire.com/league-of-legends/build/comprehensive-tank-chogath-top-guide-info-on-every-toplane-matchup-633617", 1408, 1355),
  target("poppy", "뽀삐", "https://www.onetricks.gg/guide/xd7cxmv/2617-rank-1-poppy-top-guide", 1375, 1194),
  target("maokai", "마오카이", "https://www.mobafire.com/league-of-legends/build/the-inmortal-tree-12-8-maokai-top-amp-supp-guide-561758", 1462, 1340),
  target("nasus", "나서스", "https://www.onetricks.gg/guide/gmdjt64/challenger-eune-nasus-q-max-guide", 1475, 1307),
  target("zac", "자크", "https://www.reddit.com/r/thesecretweapon/comments/1tgi5qm/toplane_zac/", 1318, 1243),
  target("tahmkench", "탐 켄치", "https://www.reddit.com/r/Tahmkenchmains/comments/1swm84r/new_to_kench_any_tips/", 1380, 1222),
  target("drmundo", "문도 박사", "https://www.mobafire.com/league-of-legends/build/too-big-to-fail-na-challenger-mundo-main-guide-check-notes-matchup-update-revamp-632678", 1476, 1369),
] as const;

const quote = (value: string | number) => `'${String(value).replace(/'/g, "''")}'`;
const lines = [
  "-- scripts/enrich-top-tank-friendly-wiki.ts가 생성.",
  "-- 탑/탱커 12명의 기존 커뮤니티 원고를 국내 솔랭 용어로 다듬고 장문 보강한다.",
  "-- 2026-09-17 운영 조회 상태와 정확히 같을 때만 갱신하고 이후 편집은 보존한다.",
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
  validate(entry, article, "article");
  validate(entry, matchup, "matchup");
  appendUpdate(entry, "article", article, entry.article);
  appendUpdate(entry, "matchup", matchup, entry.matchup);
  console.log(`${entry.name}: 위키 ${article.length}자 · 상대법 ${matchup.length}자`);
}

writeFileSync(
  "seeds/top-tank-friendly-enrichment.sql",
  `${lines.join("\n").trimEnd()}\n`,
);
console.log("생성: seeds/top-tank-friendly-enrichment.sql (조건부 보강 24개)");

function target(
  slug: string,
  name: string,
  sourceUrl: string,
  articleLength: number,
  matchupLength: number,
): Target {
  return {
    slug,
    name,
    sourceUrl,
    article: state(
      `doc-top-tank-champion-${slug}-20260913`,
      3,
      articleLength,
      3,
      `edit-top-tank-community-article-${slug}-20260915`,
    ),
    matchup: state(
      `doc-c-${slug}`,
      3,
      matchupLength,
      3,
      `edit-top-tank-community-matchup-${slug}-20260915`,
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

function validate(entry: Target, body: string, kind: "article" | "matchup") {
  const label = `${entry.name} ${kind === "article" ? "챔피언 위키" : "상대법"}`;
  assert(body.length >= 2_000, `${label}: 장문 기준 미달`);
  assert(body.length <= MAX_BODY_LENGTH, `${label}: 본문 길이 초과`);
  assert(body.includes(entry.sourceUrl), `${label}: 기존 커뮤니티 출처 누락`);
  assert(body.includes("## 솔랭에서 바로 쓰는 운영 기준"), `${label}: 보강 문단 누락`);
  assert(/`[QWER]`/u.test(body), `${label}: 스킬 키 누락`);
  assert(!body.includes("기본 공격"), `${label}: 딱딱한 기본 공격 용어가 남아 있다`);
  assert(!body.includes("궁극기"), `${label}: 딱딱한 궁극기 용어가 남아 있다`);
  assert(!body.includes("재사용 대기시간"), `${label}: 딱딱한 쿨타임 용어가 남아 있다`);
  assert(!/(?:^|\s)(?:룬|아이템|소환사 주문)(?:\s|$)/mu.test(body), `${label}: 제외 주제 포함`);
  validateSourceFootnotes(body, label);
  if (kind === "article") {
    assert(body.includes("[[분류:탑]] [[분류:탱커]]"), `${label}: 분류 누락`);
    assert.equal(collectWikiLinkTitles(body).length, 2, `${label}: 분류 링크 수`);
  }
  const outline = buildOutline(body, `${entry.slug}-${kind}`, 2, new Set());
  assert.equal(outline.children.length, 1);
  assert(outline.children[0].children.length >= 10, `${label}: 문단 수 부족`);
}

function appendUpdate(
  entry: Target,
  kind: "article" | "matchup",
  body: string,
  current: TargetState,
) {
  const nextRevision = current.revision + 1;
  const editId = `edit-top-tank-friendly-${kind}-${entry.slug}-20260917`;
  const label = kind === "article" ? "챔피언 위키" : "상대법";
  const summary = kind === "article" ? "국내 솔랭 용어로 장문 위키 보강" : "국내 솔랭 용어로 장문 상대법 보강";

  lines.push(
    `-- ${entry.name} ${label} (${body.length}자)`,
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
