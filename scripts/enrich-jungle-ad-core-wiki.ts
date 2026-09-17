/**
 * 정글 / AD 선두 8명의 장문 챔피언 위키·공통 상대법을 운영 D1에 반영할 조건부 SQL 생성기.
 * 2026-09-17 운영 조회에서 확인한 리비전·본문 길이·편집 이력이 모두 같을 때만 갱신한다.
 * 실행: npx tsx scripts/enrich-jungle-ad-core-wiki.ts
 * 적용: npx wrangler d1 execute kkaenam-gg --remote --file seeds/jungle-ad-core-enrichment.sql
 */
import assert from "node:assert/strict";
import { readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

import catalog from "../src/data/generated/champions.json";
import { classifications } from "../src/data/taxonomy";
import { MAX_BODY_LENGTH, SYSTEM_USER_ID } from "../src/data/wiki";
import { unresolvedWikiTitles } from "../src/lib/wikiLink";
import { buildOutline } from "../src/lib/wikiMarkup";
import { titleKey } from "../src/lib/wikiTitle";
import { validateSourceFootnotes } from "./wiki-manuscript-validation";

const CREATED_AT = "2026-09-17T08:30:00.000Z";
const JUNGLE_AD_UPDATED_AT = "2026-09-15T00:30:00.000Z";
const PATCH = catalog.patch;

type TargetState = {
  docId: string;
  revision: number;
  bodyLength: number;
  updatedAt: string;
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
  {
    ...standard("leesin", "리 신", "https://www.mobafire.com/league-of-legends/build/the-god-fist-lee-sin-in-depth-jungle-guide-season-16-patch-26-6-561026", 944, 374),
    matchup: state("doc-jungle-leesin", 1, 374, "2026-09-02T00:00:00+09:00", 1, "edit-doc-jungle-leesin-general"),
  },
  standard("viego", "비에고", "https://www.mobafire.com/league-of-legends/build/viegonicron-jungle-viego-v26-16-best-viego-amp-lore-master-in-the-world-simple-words-depth-infos-649683", 909, 847),
  standard("graves", "그레이브즈", "https://www.mobafire.com/league-of-legends/build/comprehensive-graves-jungle-guide-for-season-16-master-the-outlaw-649226", 884, 822),
  standard("kindred", "킨드레드", "https://www.mobafire.com/league-of-legends/build/kindred/jungle", 883, 825),
  standard("rengar", "렝가", "https://www.mobafire.com/league-of-legends/build/rengar/jungle", 912, 824),
  standard("khazix", "카직스", "https://www.mobafire.com/league-of-legends/build/tinjus-ultimate-khazix-jungle-guide-for-season-16-455163", 894, 828),
  standard("hecarim", "헤카림", "https://www.mobafire.com/league-of-legends/build/the-grave-calls-hecarim-jungle-guide-season-16-updated-patch-16-15-653186", 865, 834),
  standard("jarvaniv", "자르반 4세", "https://www.mobafire.com/league-of-legends/build/jarvan-iv/jungle", 852, 830),
] as const;

const quote = (value: string | number) => `'${String(value).replace(/'/g, "''")}'`;
const lines = [
  "-- scripts/enrich-jungle-ad-core-wiki.ts가 생성.",
  "-- 정글/AD 리 신부터 자르반 4세까지 8명의 국내 솔랭 용어 장문 원고.",
  "-- 2026-09-17 운영 조회 상태와 정확히 같을 때만 갱신하고 이후 편집은 보존한다.",
  "INSERT OR IGNORE INTO users (id, provider, provider_id, name, email, role, created_at)",
  `VALUES (${quote(SYSTEM_USER_ID)}, 'system', 'seed', '깨남.COM', NULL, 'admin', ${quote(CREATED_AT)});`,
  "",
];

for (const target of targets) {
  const champion = catalog.champions.find((entry) => entry.slug === target.slug);
  assert(champion, `카탈로그에 없는 챔피언: ${target.slug}`);
  assert.equal(champion.name, target.name);
  assert(
    classifications.some(
      (entry) =>
        entry.positionSlug === "jungle" &&
        entry.categorySlug === "ad" &&
        entry.championName === target.name,
    ),
    `정글/AD 분류에 없는 챔피언: ${target.name}`,
  );

  const article = manuscript("seeds/champion-wiki", target.slug);
  const matchup = manuscript("seeds/jungle-ad-matchup-wiki", target.slug);
  validate(target, article, "article");
  validate(target, matchup, "matchup");
  appendUpdate(target, "article", article, target.article);
  appendUpdate(target, "matchup", matchup, target.matchup);
  console.log(`${target.name}: 위키 ${codePointLength(article)}자 · 상대법 ${codePointLength(matchup)}자`);
}

writeFileSync("seeds/jungle-ad-core-enrichment.sql", `${lines.join("\n").trimEnd()}\n`);
console.log("생성: seeds/jungle-ad-core-enrichment.sql (조건부 보강 16개)");

function standard(
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
      `doc-jungle-ad-champion-${slug}-20260915`,
      1,
      articleLength,
      JUNGLE_AD_UPDATED_AT,
      1,
      `edit-jungle-ad-champion-${slug}-20260915`,
    ),
    matchup: state(
      `doc-c-${slug}`,
      1,
      matchupLength,
      JUNGLE_AD_UPDATED_AT,
      1,
      `edit-jungle-ad-matchup-${slug}-20260915`,
    ),
  };
}

function state(
  docId: string,
  revision: number,
  bodyLength: number,
  updatedAt: string,
  editCount: number,
  latestEdit: string,
): TargetState {
  return { docId, revision, bodyLength, updatedAt, editCount, latestEdit };
}

function manuscript(root: string, slug: string) {
  return readFileSync(join(root, `${slug}.md`), "utf8").replace(/\r\n?/g, "\n").trim();
}

function codePointLength(value: string) {
  return Array.from(value).length;
}

function validate(target: Target, body: string, kind: "article" | "matchup") {
  const label = `${target.name} ${kind === "article" ? "챔피언 위키" : "상대법"}`;
  assert(body.length >= 2_000, `${label}: 장문 기준 미달`);
  assert(body.length <= MAX_BODY_LENGTH, `${label}: 본문 길이 초과`);
  assert(body.includes(target.sourceUrl), `${label}: 채택 출처 누락`);
  assert(body.includes("## 솔랭에서 바로 쓰는 정글 운영"), `${label}: 보강 문단 누락`);
  assert(/`[QWER]`/u.test(body), `${label}: 스킬 키 누락`);
  assert(!body.includes("기본 공격"), `${label}: 딱딱한 기본 공격 용어가 남아 있다`);
  assert(!body.includes("궁극기"), `${label}: 딱딱한 궁극기 용어가 남아 있다`);
  assert(!body.includes("재사용 대기시간"), `${label}: 딱딱한 쿨타임 용어가 남아 있다`);
  assert(!/(?:^|\s)(?:룬|아이템|소환사 주문)(?:\s|$)/mu.test(body), `${label}: 제외 주제 포함`);
  validateSourceFootnotes(body, label);
  if (kind === "article") {
    assert(body.includes("[[분류:정글]] [[분류:AD]]"), `${label}: 정글/AD 분류 누락`);
  }
  const outline = buildOutline(body, `${target.slug}-${kind}`, 2, new Set());
  assert.equal(outline.children.length, 1);
  assert(outline.children[0].children.length >= 10, `${label}: 문단 수 부족`);
}

function appendUpdate(
  target: Target,
  kind: "article" | "matchup",
  body: string,
  current: TargetState,
) {
  const nextRevision = current.revision + 1;
  const editId = `edit-jungle-ad-core-${kind}-${target.slug}-20260917`;
  const label = kind === "article" ? "챔피언 위키" : "상대법";
  const summary = kind === "article" ? "국내 솔랭 용어로 정글 위키 장문 보강" : "국내 솔랭 용어로 정글 상대법 장문 보강";
  const updatedDoc = [
    `id = ${quote(current.docId)}`,
    `revision = ${nextRevision}`,
    `general = ${quote(body)}`,
    `updated_at = ${quote(CREATED_AT)}`,
    `updated_by = ${quote(SYSTEM_USER_ID)}`,
    `NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)})`,
  ].join(" AND ");

  lines.push(
    `-- ${target.name} ${label}: MOBAFire (${codePointLength(body)}자)`,
    "UPDATE wiki_docs",
    `SET general = ${quote(body)}, revision = ${nextRevision}, patch = ${quote(PATCH)}, updated_at = ${quote(CREATED_AT)}, updated_by = ${quote(SYSTEM_USER_ID)}`,
    `WHERE id = ${quote(current.docId)} AND kind = ${quote(kind)}`,
    `AND revision = ${current.revision} AND LENGTH(general) = ${current.bodyLength}`,
    `AND updated_at = ${quote(current.updatedAt)} AND updated_by = ${quote(SYSTEM_USER_ID)}`,
    `AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = ${quote(current.docId)}) = ${current.editCount}`,
    `AND EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(current.latestEdit)} AND doc_id = ${quote(current.docId)} AND status = 'accepted' AND revision = ${current.revision})`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
  );

  if (kind === "article") {
    lines.push(
      `DELETE FROM wiki_links WHERE source_doc = ${quote(current.docId)}`,
      `AND EXISTS (SELECT 1 FROM wiki_docs WHERE ${updatedDoc});`,
    );
    for (const title of unresolvedWikiTitles([body])) {
      lines.push(
        "INSERT OR IGNORE INTO wiki_links (source_doc, source_key, target_key, target_title)",
        `SELECT ${quote(current.docId)}, NULL, ${quote(titleKey(title))}, ${quote(title)} FROM wiki_docs`,
        `WHERE ${updatedDoc};`,
      );
    }
  }

  lines.push(
    "INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)",
    `SELECT ${quote(editId)}, id, NULL, ${current.revision}, general, ${quote(summary)}, 'accepted', ${quote(SYSTEM_USER_ID)}, ${quote(CREATED_AT)}, 'admin', ${nextRevision} FROM wiki_docs`,
    `WHERE id = ${quote(current.docId)} AND revision = ${nextRevision} AND general = ${quote(body)}`,
    `AND updated_at = ${quote(CREATED_AT)} AND updated_by = ${quote(SYSTEM_USER_ID)}`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
    "",
  );
}
