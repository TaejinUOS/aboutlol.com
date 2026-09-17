/**
 * 탑 / 딜러 10명의 장문 챔피언 위키·공통 상대법을 운영 D1에 반영할 조건부 SQL 생성기.
 * 2026-09-17 운영 조회에서 확인한 리비전·본문 길이·편집 이력이 모두 같을 때만 갱신한다.
 * 이후 사용자 편집이 있으면 해당 문서만 건너뛴다.
 * 실행: npx tsx scripts/enrich-top-damage-community-wiki.ts
 * 적용: npx wrangler d1 execute kkaenam-gg --remote --file seeds/top-damage-community-enrichment.sql
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

const CREATED_AT = "2026-09-17T06:30:00.000Z";
const TOP_DAMAGE_UPDATED_AT = "2026-09-14T14:50:00.000Z";
const SHARED_UPDATED_AT = "2026-09-13T09:00:00.000Z";
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
  standard("teemo", "티모", "https://www.mobafire.com/league-of-legends/build/the-passionate-guide-to-teemo-456667", 918, 850),
  standard("quinn", "퀸", "https://www.mobafire.com/league-of-legends/build/challenger-1000lp-quinnads-patch-26-18-quinn-guide-568972", 899, 831),
  standard("kennen", "케넨", "https://www.mobafire.com/league-of-legends/build/kennen-top-mid-600k-points-emerald-insights-make-sure-to-read-notes-for-every-item-matchup-652087", 889, 789),
  standard("vladimir", "블라디미르", "https://www.mobafire.com/league-of-legends/build/lord-and-master-of-all-evil-vladimir-645487", 912, 819),
  standard("rumble", "럼블", "https://www.mobafire.com/league-of-legends/build/diamond-rumble-otp-guide-653101", 889, 820),
  standard("kayle", "케일", "https://www.mobafire.com/league-of-legends/build/kayle-1v9s-season-16-challenger-kayle-guide-updated-for-26-09-625593", 887, 801),
  {
    slug: "akshan",
    name: "아크샨",
    sourceUrl: "https://www.mobafire.com/league-of-legends/build/26-13-the-only-akshan-guide-youll-need-matchups-included-652317",
    article: state("doc-ai-champion-akshan-20260912", 2, 1028, SHARED_UPDATED_AT, 2, "edit-inline-sources-article-akshan-20260913"),
    matchup: state("doc-c-akshan", 1, 861, TOP_DAMAGE_UPDATED_AT, 1, "edit-top-damage-matchup-akshan-20260914"),
  },
  standard("heimerdinger", "하이머딩거", "https://www.mobafire.com/league-of-legends/build/season-13-former-pros-guide-to-heimerdinger-toplane-compendium-583499", 910, 835),
  standard("singed", "신지드", "https://www.mobafire.com/league-of-legends/build/patch-26-3-hofs-high-elo-singed-guide-runes-masteries-matchups-how-to-troll-effectively-625704", 879, 825),
  {
    slug: "lissandra",
    name: "리산드라",
    sourceUrl: "https://www.mobafire.com/league-of-legends/build/rank-1-world-lissandra-best-build-mid-top-lane-644490",
    article: state("doc-a-132c9ef9-8e8b-4aff-8e16-2e4098465398", 4, 994, SHARED_UPDATED_AT, 4, "edit-inline-sources-article-lissandra-20260913"),
    matchup: state("doc-c-lissandra", 2, 613, SHARED_UPDATED_AT, 2, "edit-inline-sources-matchup-lissandra-20260913"),
  },
] as const;

const quote = (value: string | number) => `'${String(value).replace(/'/g, "''")}'`;
const lines = [
  "-- scripts/enrich-top-damage-community-wiki.ts가 생성.",
  "-- MOBAFire → Onetricks.gg → 챔피언 Mains Reddit 순서로 조사한 탑/딜러 장문 원고.",
  "-- 이번 배치는 10명 모두 MOBAFire에서 본문 근거를 확인했다.",
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
        entry.positionSlug === "top" &&
        entry.categorySlug === "damage" &&
        entry.championName === target.name,
    ),
    `탑/딜러 분류에 없는 챔피언: ${target.name}`,
  );

  const article = manuscript("seeds/champion-wiki", target.slug);
  const matchup = manuscript("seeds/top-damage-matchup-wiki", target.slug);
  validate(target, article, "article");
  validate(target, matchup, "matchup");
  appendUpdate(target, "article", article, target.article);
  appendUpdate(target, "matchup", matchup, target.matchup);
  console.log(`${target.name}: 위키 ${codePointLength(article)}자 · 상대법 ${codePointLength(matchup)}자`);
}

writeFileSync(
  "seeds/top-damage-community-enrichment.sql",
  `${lines.join("\n").trimEnd()}\n`,
);
console.log("생성: seeds/top-damage-community-enrichment.sql (조건부 보강 20개)");

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
      `doc-top-damage-champion-${slug}-20260914`,
      1,
      articleLength,
      TOP_DAMAGE_UPDATED_AT,
      1,
      `edit-top-damage-champion-${slug}-20260914`,
    ),
    matchup: state(
      `doc-c-${slug}`,
      1,
      matchupLength,
      TOP_DAMAGE_UPDATED_AT,
      1,
      `edit-top-damage-matchup-${slug}-20260914`,
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
  assert(body.length <= MAX_BODY_LENGTH, `${label}: 본문 길이 초과`);
  assert(body.length >= 2_000, `${label}: 장문 기준 미달`);
  assert(body.includes(target.sourceUrl), `${label}: 채택 출처 누락`);
  assert(body.includes("## 커뮤니티에서 반복되는 실전 기준"), `${label}: 보강 문단 누락`);
  assert(/`[QWER]`/u.test(body), `${label}: 스킬 키 누락`);
  assert(!/(?:^|\s)(?:룬|아이템|소환사 주문)(?:\s|$)/mu.test(body), `${label}: 제외 주제 포함`);
  validateSourceFootnotes(body, label);
  if (kind === "article") {
    assert(body.includes("[[분류:탑]] [[분류:딜러]]"), `${label}: 탑/딜러 분류 누락`);
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
  const editId = `edit-top-damage-community-${kind}-${target.slug}-20260917`;
  const label = kind === "article" ? "챔피언 위키" : "상대법";
  const summary = kind === "article" ? "영어권 커뮤니티 장문 위키 보강" : "영어권 커뮤니티 장문 상대법 보강";
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
