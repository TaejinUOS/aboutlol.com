import assert from "node:assert/strict";

import { extractFootnotes } from "../src/lib/wikiMarkup";

const INVEN_URL = /https?:\/\/(?:[a-z0-9-]+\.)?inven\.co\.kr\/[^)\s]+/giu;
const LINK_ONLY_INVEN_FOOTNOTE = /^\[(?:\\.|[^\]])+\]\(https?:\/\/(?:[a-z0-9-]+\.)?inven\.co\.kr\/[^)\s]+\)$/iu;

export function validateSourceFootnotes(body: string, label: string) {
  assert(!body.includes("AI 작성 초안"), `${label}: AI 작성 제목이 남아 있다`);
  assert(!/^## 출처$/mu.test(body), `${label}: 분리된 출처 섹션이 남아 있다`);

  const sourceCount = body.match(INVEN_URL)?.length ?? 0;
  assert(sourceCount > 0, `${label}: 인벤 출처가 없다`);

  const extracted = extractFootnotes(body);
  assert(!INVEN_URL.test(extracted.body), `${label}: 각주 밖 인벤 URL이 있다`);
  assert.equal(extracted.notes.length, sourceCount, `${label}: 인벤 링크와 각주 수가 다르다`);
  for (const note of extracted.notes) {
    assert(
      LINK_ONLY_INVEN_FOOTNOTE.test(note.body),
      `${label}: 각주는 부연 설명 없이 인벤 링크 하나만 포함해야 한다`,
    );
  }

  return sourceCount;
}
