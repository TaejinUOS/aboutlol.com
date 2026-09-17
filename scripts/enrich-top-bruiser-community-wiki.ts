/**
 * 탑 / 딜탱 22명의 장문 챔피언 위키·공통 상대법을 운영 D1에 반영할 조건부 SQL 생성기.
 * 2026-09-15 운영 백업에서 확인한 리비전·본문 길이·편집 이력이 모두 같을 때만 갱신한다.
 * 이후 사용자 편집이 있으면 해당 문서만 건너뛴다.
 * 실행: npx tsx scripts/enrich-top-bruiser-community-wiki.ts
 * 적용: npx wrangler d1 execute kkaenam-gg --remote --file seeds/top-bruiser-community-enrichment.sql
 */
import assert from "node:assert/strict";
import { readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

import catalog from "../src/data/generated/champions.json";
import { classifications } from "../src/data/taxonomy";
import { MAX_BODY_LENGTH, SYSTEM_USER_ID } from "../src/data/wiki";
import { buildOutline, collectWikiLinkTitles } from "../src/lib/wikiMarkup";
import { validateSourceFootnotes } from "./wiki-manuscript-validation";

const CREATED_AT = "2026-09-17T05:30:00.000Z";
const INITIAL_UPDATED_AT = "2026-09-14T06:00:00.000Z";
const REMAINING_UPDATED_AT = "2026-09-14T14:30:00.000Z";
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
  initial("aatrox", "아트록스", "https://www.mobafire.com/league-of-legends/build/aatrox-guide-with-matchups-updated-every-patch-584077", 1124, 361, {
    matchup: state("doc-top-aatrox", 1, 361, "2026-09-02T00:00:00+09:00", 1, "edit-doc-top-aatrox-general"),
  }),
  initial("darius", "다리우스", "https://www.mobafire.com/league-of-legends/build/darius-in-depth-build-every-matchup-explained-642445", 1013, 938),
  initial("garen", "가렌", "https://www.mobafire.com/league-of-legends/build/garen-in-depth-1v9-build-s13-patch-13-4-complete-matchup-top-mid-and-also-lots-of-tips-for-laning-phase-620122", 993, 966),
  initial("renekton", "레넥톤", "https://www.mobafire.com/league-of-legends/build/top-lane-renekton-208385", 1076, 962),
  initial("sett", "세트", "https://www.mobafire.com/league-of-legends/build/26-18-autolykuss-challenger-sett-guide-594869", 1031, 971),
  initial("riven", "리븐", "https://www.mobafire.com/league-of-legends/build/26-18-molinas-riven-top-mid-guide-619423", 1063, 1001),
  initial("irelia", "이렐리아", "https://www.mobafire.com/league-of-legends/build/patch-26-09-definitive-irelia-top-mid-guide-632085", 992, 973, {
    article: state("doc-ai-champion-irelia-20260912", 3, 992, INITIAL_UPDATED_AT, 3, "edit-top-bruiser-champion-irelia-20260914"),
    matchup: state("doc-c-irelia", 3, 973, INITIAL_UPDATED_AT, 3, "edit-top-bruiser-matchup-irelia-20260914"),
  }),
  initial("fiora", "피오라", "https://www.mobafire.com/league-of-legends/build/rank-1-fiora-guide-by-draco-26-03-651248", 1062, 1011),
  initial("jax", "잭스", "https://www.mobafire.com/league-of-legends/build/26-18-thisispatriks-in-depth-jax-guide-503356", 1036, 924),
  initial("camille", "카밀", "https://www.mobafire.com/league-of-legends/build/styllees-challenger-camille-top-jng-540100", 1044, 958),
  remaining("gangplank", "갱플랭크", "https://www.mobafire.com/league-of-legends/build/new-gp-build-guide-top-updated-all-matchups-650003", 932, 869),
  remaining("urgot", "우르곳", "https://www.mobafire.com/league-of-legends/build/goliathgames-ultimate-guide-to-urgot-tips-on-every-matchup-8m-mastery-554383", 906, 842),
  remaining("yorick", "요릭", "https://www.mobafire.com/league-of-legends/build/14-17-how-to-win-with-yorick-635126", 888, 827),
  remaining("mordekaiser", "모데카이저", "https://www.mobafire.com/league-of-legends/build/patch-13-21-my-mordekaisers-build-top-jungle-mid-matchups-616062", 895, 837),
  remaining("kled", "클레드", "https://www.mobafire.com/league-of-legends/build/the-holy-scripts-of-kled-toplane-650760", 914, 822),
  remaining("gwen", "그웬", "https://www.mobafire.com/league-of-legends/build/master-gwen-guide-quot-snip-snip-quot-by-lukajs-625913", 893, 852),
  remaining("volibear", "볼리베어", "https://www.mobafire.com/league-of-legends/build/26-17-challenger-volibear-top-guide-609641", 887, 856),
  remaining("tryndamere", "트린다미어", "https://www.mobafire.com/league-of-legends/build/raens-tryndamere-tips-amp-build-569493", 914, 824),
  remaining("ambessa", "암베사", "https://www.mobafire.com/league-of-legends/build/25-13-in-depth-guide-for-top-amp-jg-ambessa-ambessa-build-lol-extra-details-for-all-items-listed-643789", 920, 832),
  remaining("gnar", "나르", "https://www.mobafire.com/league-of-legends/build/26-16-diamond-gnar-guide-thing-in-the-ice-546377", 892, 812),
  remaining("olaf", "올라프", "https://www.mobafire.com/league-of-legends/build/26-17-challenger-olaf-top-guide-632382", 922, 799),
  remaining("illaoi", "일라오이", "https://www.mobafire.com/league-of-legends/build/26-15-illaoi-otp-advanced-guide-618052", 926, 850),
] as const;

const quote = (value: string | number) => `'${String(value).replace(/'/g, "''")}'`;
const lines = [
  "-- scripts/enrich-top-bruiser-community-wiki.ts가 생성.",
  "-- MOBAFire → Onetricks.gg → 챔피언 Mains Reddit 순서로 조사한 탑/딜탱 장문 원고.",
  "-- 이번 배치는 22명 모두 MOBAFire에서 본문 근거를 확인했다.",
  "-- 2026-09-15 운영 백업의 상태와 정확히 같을 때만 갱신하고 이후 편집은 보존한다.",
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
        entry.categorySlug === "bruiser" &&
        entry.championName === target.name,
    ),
    `탑/딜탱 분류에 없는 챔피언: ${target.name}`,
  );

  const article = manuscript("seeds/champion-wiki", target.slug);
  const matchup = manuscript("seeds/top-bruiser-matchup-wiki", target.slug);
  validate(target, article, "article");
  validate(target, matchup, "matchup");
  appendUpdate(target, "article", article, target.article);
  appendUpdate(target, "matchup", matchup, target.matchup);
  console.log(`${target.name}: 위키 ${codePointLength(article)}자 · 상대법 ${codePointLength(matchup)}자`);
}

writeFileSync(
  "seeds/top-bruiser-community-enrichment.sql",
  `${lines.join("\n").trimEnd()}\n`,
);
console.log("생성: seeds/top-bruiser-community-enrichment.sql (조건부 보강 44개)");

function initial(
  slug: string,
  name: string,
  sourceUrl: string,
  articleLength: number,
  matchupLength: number,
  overrides: Partial<Pick<Target, "article" | "matchup">> = {},
): Target {
  return {
    slug,
    name,
    sourceUrl,
    article:
      overrides.article ??
      state(
        `doc-top-bruiser-champion-${slug}-20260914`,
        1,
        articleLength,
        INITIAL_UPDATED_AT,
        1,
        `edit-top-bruiser-champion-${slug}-20260914`,
      ),
    matchup:
      overrides.matchup ??
      state(
        `doc-c-${slug}`,
        1,
        matchupLength,
        INITIAL_UPDATED_AT,
        1,
        `edit-top-bruiser-matchup-${slug}-20260914`,
      ),
  };
}

function remaining(
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
      `doc-top-bruiser-remaining-champion-${slug}-20260914`,
      1,
      articleLength,
      REMAINING_UPDATED_AT,
      1,
      `edit-top-bruiser-remaining-champion-${slug}-20260914`,
    ),
    matchup: state(
      `doc-c-${slug}`,
      1,
      matchupLength,
      REMAINING_UPDATED_AT,
      1,
      `edit-top-bruiser-remaining-matchup-${slug}-20260914`,
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
    assert(body.includes("[[분류:탑]] [[분류:딜탱]]"), `${label}: 분류 누락`);
    assert.equal(collectWikiLinkTitles(body).length, 2, `${label}: 분류 링크 수`);
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
  const editId = `edit-top-bruiser-community-${kind}-${target.slug}-20260917`;
  const label = kind === "article" ? "챔피언 위키" : "상대법";
  const summary = kind === "article" ? "영어권 커뮤니티 장문 위키 보강" : "영어권 커뮤니티 장문 상대법 보강";

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
    "INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)",
    `SELECT ${quote(editId)}, id, NULL, ${current.revision}, general, ${quote(summary)}, 'accepted', ${quote(SYSTEM_USER_ID)}, ${quote(CREATED_AT)}, 'admin', ${nextRevision} FROM wiki_docs`,
    `WHERE id = ${quote(current.docId)} AND revision = ${nextRevision} AND general = ${quote(body)}`,
    `AND updated_at = ${quote(CREATED_AT)} AND updated_by = ${quote(SYSTEM_USER_ID)}`,
    `AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
    "",
  );
}
