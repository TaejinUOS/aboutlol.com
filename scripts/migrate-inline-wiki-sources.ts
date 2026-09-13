/**
 * 운영 D1의 시스템 원고를 링크 전용 인라인 각주판으로 안전하게 이관한다.
 *
 * 문서 ID, 예상 리비전, 시스템 작성자, 편집 이력 수가 모두 조사값과 같을 때만
 * 새 리비전을 만든다. 조사 뒤 새 제안이나 편집이 생겼으면 건너뛴다.
 * 실행: npx tsx scripts/migrate-inline-wiki-sources.ts
 */
import assert from "node:assert/strict";
import { readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

import { SYSTEM_USER_ID } from "../src/data/wiki";
import { validateSourceFootnotes } from "./wiki-manuscript-validation";

const CREATED_AT = "2026-09-13T09:00:00.000Z";
const OUTPUT = "seeds/migrate-inline-wiki-sources.sql";
const PREFLIGHT_OUTPUT = "seeds/check-inline-wiki-source-migration.sql";

type Target = {
  id: string;
  kind: "article" | "matchup";
  slug: string;
  revision: number;
  path: string;
};

const richArticles = [
  ["doc-a-23010eca-0af1-4ee2-a3a2-ac98f90fa9f9", "naafiri", 3],
  ["doc-a-67086497-75b0-4808-a001-3dddfeacc105", "ryze", 3],
  ["doc-a-27bd0e78-66b0-4a9b-846a-32b18365e3ef", "lux", 3],
  ["doc-ai-champion-leblanc-20260911", "leblanc", 4],
  ["doc-a-132c9ef9-8e8b-4aff-8e16-2e4098465398", "lissandra", 3],
  ["doc-a-077fa2c7-41b2-4620-ae2c-185b81fe54d1", "malzahar", 3],
  ["doc-a-5bd97d30-0917-495d-b049-bb438235d231", "mel", 3],
  ["doc-a-bed696ba-2310-4820-9cf4-ee5c34ae55a2", "veigar", 3],
  ["doc-a-80df8739-7bdf-428b-9789-58571366b198", "vex", 3],
  ["doc-a-f1404d69-50a3-4c61-9452-d31dd292564a", "viktor", 3],
  ["doc-a-908b088a-d7ea-4d7a-bdc5-3c47ada13b5e", "syndra", 3],
  ["doc-a-2df64efd-93e1-4656-bddf-8f305f5df8cc", "ahri", 3],
  ["doc-a-f1945b6e-3dee-45ee-b457-00c5384aa05c", "aurelionsol", 3],
  ["doc-a-5fc0f788-ca1b-4024-86b9-1d459c56490c", "azir", 3],
  ["doc-ai-champion-akali-20260911", "akali", 4],
  ["doc-a-65d0b98e-aca6-4035-a3bf-d7fd4faa29cf", "annie", 3],
  ["doc-a-7f7d1f23-aefd-455d-995a-3d8fbb3539e5", "anivia", 3],
  ["doc-a-2899fe45-3c51-4058-9487-26242464d8de", "aurora", 3],
  ["doc-a-0d4c7c07-b905-472f-9b4a-b4a94f0f08cb", "orianna", 3],
  ["doc-ai-champion-zed-20260911", "zed", 4],
  ["doc-a-d804656d-2129-4e55-b28c-658608efa1fd", "xerath", 3],
  ["doc-a-cc54cdde-cfcc-479d-9737-2b26f152b569", "zoe", 3],
  ["doc-a-0e9226b2-5491-42cb-b678-0d9219f200c4", "cassiopeia", 3],
  ["doc-ai-champion-katarina-20260911", "katarina", 4],
  ["doc-a-3425cc0c-770c-44fb-9e75-434bc8f27357", "qiyana", 3],
  ["doc-a-0b3be62a-0b48-461d-8bef-96e5057ae96d", "talon", 3],
  ["doc-a-6ac51090-21cb-4daf-a0c6-66e8482021c5", "taliyah", 3],
  ["doc-a-cfa6e563-1fcd-4407-b0f7-bf98b68fa239", "twistedfate", 3],
  ["doc-ai-champion-fizz-20260911", "fizz", 4],
  ["doc-a-12ad2a64-3bb7-489e-8ccb-459432858e90", "hwei", 3],
] as const;

const briefArticleSlugs = [
  "sylas", "yone", "yasuo", "galio", "ekko", "diana", "irelia",
  "corki", "jayce", "smolder", "tristana", "akshan", "locke",
] as const;
const topSlugs = [
  "ornn", "malphite", "shen", "ksante", "sion", "chogath",
  "poppy", "maokai", "nasus", "zac", "tahmkench", "drmundo",
] as const;
const midMatchupSlugs = [
  "qiyana", "galio", "ekko", "diana", "irelia", "sion", "corki", "jayce",
  "tristana", "malzahar", "viktor", "syndra", "xerath", "twistedfate",
  "lux", "orianna", "anivia", "zoe", "veigar", "vex", "cassiopeia",
  "taliyah", "annie", "aurelionsol", "lissandra", "azir",
] as const;

const targets: Target[] = [
  ...richArticles.map(([id, slug, revision]) => ({
    id, kind: "article" as const, slug, revision, path: `seeds/champion-wiki/${slug}.md`,
  })),
  ...briefArticleSlugs.map((slug) => ({
    id: `doc-ai-champion-${slug}-20260912`,
    kind: "article" as const,
    slug,
    revision: 1,
    path: `seeds/champion-wiki/${slug}.md`,
  })),
  ...topSlugs.map((slug) => ({
    id: slug === "sion" ? "doc-ai-champion-sion-20260912" : `doc-top-tank-champion-${slug}-20260913`,
    kind: "article" as const,
    slug,
    revision: slug === "sion" ? 2 : 1,
    path: `seeds/champion-wiki/${slug}.md`,
  })),
  ...[...new Set([...midMatchupSlugs, ...topSlugs])].map((slug) => ({
    id: `doc-c-${slug}`,
    kind: "matchup" as const,
    slug,
    revision: slug === "sion" ? 2 : 1,
    path: topSlugs.includes(slug as (typeof topSlugs)[number])
      ? `seeds/top-tank-matchup-wiki/${slug}.md`
      : `seeds/mid-matchup-wiki/${slug}.md`,
  })),
];

assert.equal(targets.length, 92);
assert.equal(new Set(targets.map((target) => target.id)).size, targets.length);

const quote = (value: string | number) =>
  typeof value === "number" ? String(value) : `'${value.replace(/'/g, "''")}'`;
const lines = [
  "-- scripts/migrate-inline-wiki-sources.ts가 생성.",
  "-- 운영 조사값과 같은 시스템 원고만 새 리비전으로 이관하며 조사 뒤 편집이 있으면 건너뛴다.",
];
const reportValues: string[] = [];

for (const target of targets) {
  const body = readFileSync(join(process.cwd(), target.path), "utf8")
    .replace(/\r\n?/g, "\n")
    .trim();
  validateSourceFootnotes(body, target.path);
  const nextRevision = target.revision + 1;
  const editId = `edit-inline-sources-${target.kind}-${target.slug}-20260913`;
  const summary = target.kind === "article"
    ? "출처를 근거 문장 인라인 각주로 정리"
    : "상대법 출처를 근거 문장 인라인 각주로 정리";
  reportValues.push(`(${quote(target.id)}, ${quote(editId)})`);

  lines.push(
    "UPDATE wiki_docs",
    `SET general = ${quote(body)}, revision = ${nextRevision}, updated_at = ${quote(CREATED_AT)}, updated_by = ${quote(SYSTEM_USER_ID)}`,
    `WHERE id = ${quote(target.id)} AND kind = ${quote(target.kind)} AND revision = ${target.revision}`,
    `  AND updated_by = ${quote(SYSTEM_USER_ID)}`,
    `  AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = ${quote(target.id)}) = ${target.revision}`,
    `  AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = ${quote(target.id)} AND revision = ${target.revision} AND author = ${quote(SYSTEM_USER_ID)} AND status = 'accepted' AND body = wiki_docs.general)`,
    `  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
    "INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)",
    `SELECT ${quote(editId)}, id, NULL, ${target.revision}, general, ${quote(summary)}, 'accepted', ${quote(SYSTEM_USER_ID)}, ${quote(CREATED_AT)}, 'admin', ${nextRevision}`,
    `FROM wiki_docs WHERE id = ${quote(target.id)} AND revision = ${nextRevision}`,
    `  AND general = ${quote(body)} AND updated_at = ${quote(CREATED_AT)} AND updated_by = ${quote(SYSTEM_USER_ID)}`,
    `  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
  );
}

lines.push(
  "-- 과거 리비전의 AI 제목과 요약만 중립화한다. 출처 본문은 역사 보존을 위해 고치지 않는다.",
  "UPDATE wiki_edits",
  "SET body = CASE",
  "      WHEN body LIKE '# AI 작성 초안%' AND doc_id IN (SELECT id FROM wiki_docs WHERE kind = 'article')",
  "        THEN REPLACE(body, '# AI 작성 초안', '# 미드 라인 실전 운용')",
  "      WHEN body LIKE '# AI 작성 초안%' THEN REPLACE(body, '# AI 작성 초안', '# 미드 라인 상대법')",
  "      ELSE body END,",
  "    summary = CASE",
  "      WHEN summary = 'AI 작성: 실전 라인전 초안' THEN '미드 챔피언 실전 운용 원고 작성'",
  "      WHEN summary = 'AI 작성: 인벤 기반 실전 라인전 상대법' THEN '인벤 기반 미드 라인 상대법 작성'",
  "      ELSE REPLACE(REPLACE(summary, 'AI 작성: ', ''), 'AI 작성', '원고 작성') END",
  "WHERE body LIKE '%AI 작성%' OR summary LIKE '%AI 작성%';",
  `WITH targets(doc_id, edit_id) AS (VALUES\n  ${reportValues.join(",\n  ")})`,
  "SELECT 'applied' AS result, COUNT(*) AS document_count FROM targets t",
  "WHERE EXISTS (SELECT 1 FROM wiki_edits e WHERE e.id = t.edit_id);",
  `WITH targets(doc_id, edit_id) AS (VALUES\n  ${reportValues.join(",\n  ")})`,
  "SELECT 'skipped' AS result, t.doc_id, d.kind, d.revision, d.updated_by",
  "FROM targets t LEFT JOIN wiki_docs d ON d.id = t.doc_id",
  "WHERE NOT EXISTS (SELECT 1 FROM wiki_edits e WHERE e.id = t.edit_id) ORDER BY t.doc_id;",
);

writeFileSync(OUTPUT, `${lines.join("\n")}\n`);

const preflightValues = targets.map((target) => {
  const editId = `edit-inline-sources-${target.kind}-${target.slug}-20260913`;
  return `(${quote(target.id)}, ${quote(target.kind)}, ${target.revision}, ${quote(editId)})`;
});
const preflightCte = `WITH targets(doc_id, kind, expected_revision, edit_id) AS (VALUES\n  ${preflightValues.join(",\n  ")})`;
const preflight = [
  "-- 운영 이관 전에는 eligible 92, migrated 0이어야 한다. 이관 뒤에는 반대여야 한다.",
  preflightCte,
  "SELECT COUNT(*) AS target_count,",
  "  SUM(CASE WHEN EXISTS (SELECT 1 FROM wiki_edits e WHERE e.id = t.edit_id) THEN 1 ELSE 0 END) AS migrated,",
  "  SUM(CASE WHEN d.id IS NOT NULL AND d.kind = t.kind AND d.revision = t.expected_revision",
  `    AND d.updated_by = ${quote(SYSTEM_USER_ID)}`,
  "    AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = t.doc_id) = t.expected_revision",
  `    AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = t.doc_id AND revision = t.expected_revision AND author = ${quote(SYSTEM_USER_ID)} AND status = 'accepted' AND body = d.general)`,
  "    AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = t.edit_id) THEN 1 ELSE 0 END) AS eligible",
  "FROM targets t LEFT JOIN wiki_docs d ON d.id = t.doc_id;",
  preflightCte,
  "SELECT t.doc_id, t.kind AS expected_kind, t.expected_revision, d.kind, d.revision, d.updated_by,",
  "  (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = t.doc_id) AS edit_count",
  "FROM targets t LEFT JOIN wiki_docs d ON d.id = t.doc_id",
  "WHERE NOT EXISTS (SELECT 1 FROM wiki_edits e WHERE e.id = t.edit_id)",
  "  AND NOT (d.id IS NOT NULL AND d.kind = t.kind AND d.revision = t.expected_revision",
  `    AND d.updated_by = ${quote(SYSTEM_USER_ID)}`,
  "    AND (SELECT COUNT(*) FROM wiki_edits WHERE doc_id = t.doc_id) = t.expected_revision",
  `    AND EXISTS (SELECT 1 FROM wiki_edits WHERE doc_id = t.doc_id AND revision = t.expected_revision AND author = ${quote(SYSTEM_USER_ID)} AND status = 'accepted' AND body = d.general))`,
  "ORDER BY t.doc_id;",
].join("\n");
writeFileSync(PREFLIGHT_OUTPUT, `${preflight}\n`);
console.log(`생성: ${OUTPUT} · ${PREFLIGHT_OUTPUT} (안전 이관 대상 ${targets.length}개)`);
