"use client";

import { useState } from "react";

import { MarkdownBody } from "./MarkdownBody";
import styles from "./WikiPreview.module.css";

export function WikiPreview({ body }: { body: string }) {
  const [open, setOpen] = useState(false);
  return (
    <details className={styles.preview} onToggle={(event) => setOpen(event.currentTarget.open)}>
      <summary className={styles.summary}>본문 미리보기</summary>
      {open && (
        <div className={styles.body}>
          {body.trim() ? <MarkdownBody text={body} /> : <p>본문을 입력하면 미리보기가 표시됩니다.</p>}
        </div>
      )}
    </details>
  );
}
