/**
 * 미드 암살자·메이지 챔피언 일반 문서의 마크다운 조판을 보강한다.
 * 원고는 seeds/champion-wiki/*.md, 결과는 seeds/mid-assassin-mage-wiki-markdown.sql.
 * 조사 뒤 리비전이 바뀐 문서는 건드리지 않아 사용자 편집을 덮어쓰지 않는다.
 */
import assert from "node:assert/strict";
import { readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

import { MAX_BODY_LENGTH, SYSTEM_USER_ID } from "../src/data/wiki";
import { buildOutline } from "../src/lib/wikiMarkup";

const CREATED_AT = "2026-09-13T00:00:00.000Z";
const OUTPUT = "seeds/mid-assassin-mage-wiki-markdown.sql";

const targets = [
  ["doc-a-23010eca-0af1-4ee2-a3a2-ac98f90fa9f9", "나피리", "naafiri", 2],
  ["doc-a-67086497-75b0-4808-a001-3dddfeacc105", "라이즈", "ryze", 2],
  ["doc-a-27bd0e78-66b0-4a9b-846a-32b18365e3ef", "럭스", "lux", 2],
  ["doc-ai-champion-leblanc-20260911", "르블랑", "leblanc", 3],
  ["doc-a-132c9ef9-8e8b-4aff-8e16-2e4098465398", "리산드라", "lissandra", 2],
  ["doc-a-077fa2c7-41b2-4620-ae2c-185b81fe54d1", "말자하", "malzahar", 2],
  ["doc-a-5bd97d30-0917-495d-b049-bb438235d231", "멜", "mel", 2],
  ["doc-a-bed696ba-2310-4820-9cf4-ee5c34ae55a2", "베이가", "veigar", 2],
  ["doc-a-80df8739-7bdf-428b-9789-58571366b198", "벡스", "vex", 2],
  ["doc-a-f1404d69-50a3-4c61-9452-d31dd292564a", "빅토르", "viktor", 2],
  ["doc-a-908b088a-d7ea-4d7a-bdc5-3c47ada13b5e", "신드라", "syndra", 2],
  ["doc-a-2df64efd-93e1-4656-bddf-8f305f5df8cc", "아리", "ahri", 2],
  ["doc-a-f1945b6e-3dee-45ee-b457-00c5384aa05c", "아우렐리온 솔", "aurelionsol", 2],
  ["doc-a-5fc0f788-ca1b-4024-86b9-1d459c56490c", "아지르", "azir", 2],
  ["doc-ai-champion-akali-20260911", "아칼리", "akali", 3],
  ["doc-a-65d0b98e-aca6-4035-a3bf-d7fd4faa29cf", "애니", "annie", 2],
  ["doc-a-7f7d1f23-aefd-455d-995a-3d8fbb3539e5", "애니비아", "anivia", 2],
  ["doc-a-2899fe45-3c51-4058-9487-26242464d8de", "오로라", "aurora", 2],
  ["doc-a-0d4c7c07-b905-472f-9b4a-b4a94f0f08cb", "오리아나", "orianna", 2],
  ["doc-ai-champion-zed-20260911", "제드", "zed", 3],
  ["doc-a-d804656d-2129-4e55-b28c-658608efa1fd", "제라스", "xerath", 2],
  ["doc-a-cc54cdde-cfcc-479d-9737-2b26f152b569", "조이", "zoe", 2],
  ["doc-a-0e9226b2-5491-42cb-b678-0d9219f200c4", "카시오페아", "cassiopeia", 2],
  ["doc-ai-champion-katarina-20260911", "카타리나", "katarina", 3],
  ["doc-a-3425cc0c-770c-44fb-9e75-434bc8f27357", "키아나", "qiyana", 2],
  ["doc-a-0b3be62a-0b48-461d-8bef-96e5057ae96d", "탈론", "talon", 2],
  ["doc-a-6ac51090-21cb-4daf-a0c6-66e8482021c5", "탈리야", "taliyah", 2],
  ["doc-a-cfa6e563-1fcd-4407-b0f7-bf98b68fa239", "트위스티드 페이트", "twistedfate", 2],
  ["doc-ai-champion-fizz-20260911", "피즈", "fizz", 3],
  ["doc-a-12ad2a64-3bb7-489e-8ccb-459432858e90", "흐웨이", "hwei", 2],
] as const;

const quote = (value: string | number) =>
  typeof value === "number" ? String(value) : `'${value.replace(/'/g, "''")}'`;
const lines = [
  "-- scripts/enrich-mid-assassin-mage-wiki.ts가 생성.",
  "-- 미드 암살자·메이지 일반 문서 30건의 마크다운 조판을 보강한다.",
  "-- 현재 리비전이 조사 당시와 같을 때만 갱신해 이후 사용자 편집을 보존한다.",
];

for (const [id, title, slug, revision] of targets) {
  const body = readFileSync(join("seeds/champion-wiki", `${slug}.md`), "utf8").trim();
  assert(body.startsWith("# 라인전 실전 팁\n\n> **한눈에 보기** — "), `${title}: 요약 인용문 누락`);
  assert(body.length <= MAX_BODY_LENGTH, `${title}: 본문 길이 초과`);
  assert((body.match(/\*\*/g) ?? []).length >= 8, `${title}: 핵심 문장 강조 누락`);
  assert(/`[QWER]{1,2}`/u.test(body), `${title}: 스킬 키 인라인 코드 누락`);
  assert(/^- \[.+\]\(https?:\/\//mu.test(body), `${title}: 출처 링크 목록 누락`);
  const outline = buildOutline(body, "article-body", 2, new Set());
  assert.equal(outline.children.length, 1, `${title}: 최상위 제목 구조 오류`);
  assert(outline.children[0].children.length >= 4, `${title}: 소제목 구조 누락`);

  const nextRevision = revision + 1;
  const editId = `edit-mid-rich-markdown-${slug}-20260913`;
  lines.push(
    `-- ${title}: r${revision} -> r${nextRevision}`,
    "UPDATE wiki_docs",
    `SET general = ${quote(body)}, revision = ${nextRevision}, updated_at = ${quote(CREATED_AT)}, updated_by = ${quote(SYSTEM_USER_ID)}`,
    `WHERE id = ${quote(id)} AND kind = 'article' AND revision = ${revision}`,
    `  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
    "INSERT INTO wiki_edits (id, doc_id, me_slug, base_revision, body, summary, status, author, created_at, accepted_via, revision)",
    `SELECT ${quote(editId)}, id, NULL, ${revision}, general, '미드 암살자·메이지 문서 마크다운 조판 보강', 'accepted', ${quote(SYSTEM_USER_ID)}, ${quote(CREATED_AT)}, 'admin', ${nextRevision}`,
    `FROM wiki_docs WHERE id = ${quote(id)} AND revision = ${nextRevision} AND general = ${quote(body)}`,
    `  AND NOT EXISTS (SELECT 1 FROM wiki_edits WHERE id = ${quote(editId)});`,
    "",
  );
  console.log(`${title}: ${body.length}자, 마크다운 검증 통과`);
}

assert.equal(targets.length, 30);
writeFileSync(OUTPUT, `${lines.join("\n").trimEnd()}\n`);
console.log(`생성: ${OUTPUT} (문서 ${targets.length}개)`);
