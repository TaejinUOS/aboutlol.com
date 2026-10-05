"use client";

import type { KeyboardEvent, PointerEvent, ReactNode } from "react";
import { useCallback, useEffect, useRef, useState, useSyncExternalStore } from "react";

import styles from "./PortalCylinder.module.css";

/**
 * 관문이 `FLAT_PORTAL_LIMIT`보다 많을 때 쓰는 원통형 회전 진열. 챔피언 첫 화면의 라인
 * 표지도 같은 진열을 쓴다 (`LaneSelectionScreen`).
 *
 * 한 번에 보이는 것은 정면 하나와 양옆 하나씩, 세 장뿐이다 — 정면은 크게, 양옆은 작게
 * 줄여 둔다. 나머지는 숨기고 포커스도 받지 않는다. 각 커버는 정면에서 몇 칸 떨어졌는지
 * (부호 있는 칸 수)만큼 원통 위에서 일정한 각도로 돌아가 서므로, 관문이 몇 개든 세
 * 장의 모양은 같다. 끝에서 처음으로는 끊김 없이 이어서 돈다. 정면의 커버를 누르면 그
 * 관문이 펼쳐지고, 옆 커버를 누르면 먼저 정면으로 돌아온다. 좌우 버튼 · 키보드 ←/→ ·
 * 드래그(스와이프)로 돌린다.
 *
 * 모바일 폭에서는 원통을 풀어 세로로 쌓는다 (CSS만으로). 동작 줄이기 설정에서는 회전
 * 애니메이션 없이 바로 넘어간다.
 */
type Props<T> = {
  items: T[];
  getKey: (item: T) => string;
  getLabel: (item: T) => string;
  /** 바깥에서 고른 관문. 바뀌면 그 관문이 정면으로 돌아온다. */
  activeKey: string | null;
  renderFace: (item: T, index: number, front: boolean) => ReactNode;
  label: string;
  /**
   * 정면 커버가 바뀌어 멈출 때마다 부른다 (드래그 중에는 부르지 않는다). 돌리는 것만으로
   * 고르는 화면(라인 선택)이 쓴다.
   */
  onFrontChange?: (key: string) => void;
  /** 화면마다 커버 크기·글자색 같은 CSS 변수를 덮어쓸 때. */
  className?: string;
  /** 좌우 버튼이 소리로 읽히는 이름의 명사. `이전 관문` · `이전 라인`. */
  itemNoun?: string;
  /**
   * 아래 좌우 버튼과 `01 / 05` 줄을 보일지. 옆 커버 누르기 · 드래그 · 키보드 ←/→로도
   * 돌릴 수 있으므로, 세로 자리가 아까운 화면(라인 선택)은 끈다.
   */
  controls?: boolean;
};

/** `PortalCylinder.module.css`가 원통을 풀어 세로로 쌓는 폭. */
const FLAT_QUERY = "(max-width: 767px)";

function subscribeFlat(onChange: () => void) {
  const query = window.matchMedia(FLAT_QUERY);
  query.addEventListener("change", onChange);
  return () => query.removeEventListener("change", onChange);
}

/** 좁은 화면이라 원통이 풀려 세로 목록인지. 서버에서는 원통으로 본다. */
export function useFlatLayout() {
  return useSyncExternalStore(subscribeFlat, () => window.matchMedia(FLAT_QUERY).matches, () => false);
}

/** 정면에서 이 칸 수보다 멀면 숨긴다. 양옆 한 장씩만 보이게 하는 경계다. */
const VISIBLE_DISTANCE = 1.5;

/** 이만큼 넘게 끌어야 드래그로 본다. 그보다 짧으면 누름이다. */
const DRAG_THRESHOLD = 6;

function mod(value: number, n: number) {
  return ((value % n) + n) % n;
}

/** `pos`에서 `index`까지 가장 짧은 방향으로 도는 칸 수. */
function shortestDelta(pos: number, index: number, n: number) {
  let delta = mod(index - pos, n);
  if (delta > n / 2) delta -= n;
  return delta;
}

export function PortalCylinder<T>({
  items,
  getKey,
  getLabel,
  activeKey,
  renderFace,
  label,
  onFrontChange,
  className,
  itemNoun = "관문",
  controls = true,
}: Props<T>) {
  const n = items.length;
  const activeIndex = activeKey ? items.findIndex((item) => getKey(item) === activeKey) : -1;

  /**
   * 원통의 회전 위치(칸 단위). 정수가 아니어도 되고 n을 넘어도 된다 — 끝에서 처음으로
   * 넘어갈 때 거꾸로 한 바퀴 감기지 않도록 값을 접지 않는다.
   */
  const [pos, setPos] = useState(Math.max(activeIndex, 0));
  const [dragging, setDragging] = useState(false);
  const faceRefs = useRef<(HTMLDivElement | null)[]>([]);
  const drag = useRef<{ id: number; x: number; pos: number; moved: boolean; width: number } | null>(null);
  /** 드래그로 끝난 누름은 클릭으로 치지 않는다. */
  const suppressClick = useRef(false);

  const flat = useFlatLayout();
  const frontIndex = mod(Math.round(pos), n);

  const rotateTo = useCallback((index: number) => {
    setPos((current) => Math.round(current) + shortestDelta(Math.round(current), index, n));
  }, [n]);

  useEffect(() => {
    if (activeIndex >= 0) rotateTo(activeIndex);
  }, [activeIndex, rotateTo]);

  /* 콜백과 키는 렌더마다 새로 오므로 ref로 들고, 정면이 바뀐 때에만 부른다. */
  const frontChange = useRef<{ notify?: (key: string) => void; key: string }>({ key: "" });
  useEffect(() => {
    frontChange.current = { notify: onFrontChange, key: getKey(items[frontIndex]) };
  });
  useEffect(() => {
    if (dragging) return;
    const { notify, key } = frontChange.current;
    notify?.(key);
  }, [frontIndex, dragging]);

  const step = (direction: 1 | -1) => setPos((current) => Math.round(current) + direction);

  const onKeyDown = (event: KeyboardEvent) => {
    if (event.key !== "ArrowLeft" && event.key !== "ArrowRight") return;
    event.preventDefault();
    const next = mod(frontIndex + (event.key === "ArrowRight" ? 1 : -1), n);
    rotateTo(next);
    faceRefs.current[next]?.querySelector<HTMLElement>("button, a")?.focus({ preventScroll: true });
  };

  const onPointerDown = (event: PointerEvent<HTMLDivElement>) => {
    if (event.button !== 0) return;
    const width = faceRefs.current[frontIndex]?.offsetWidth || 220;
    drag.current = { id: event.pointerId, x: event.clientX, pos, moved: false, width };
  };

  const onPointerMove = (event: PointerEvent<HTMLDivElement>) => {
    const current = drag.current;
    if (!current || current.id !== event.pointerId) return;
    const dx = event.clientX - current.x;
    if (!current.moved) {
      if (Math.abs(dx) < DRAG_THRESHOLD) return;
      // 드래그가 확실해진 뒤에만 포인터를 붙잡는다. 처음부터 잡으면 짧은 누름의 클릭이 버튼에 닿지 않는다.
      current.moved = true;
      setDragging(true);
      event.currentTarget.setPointerCapture(event.pointerId);
    }
    setPos(current.pos - dx / current.width);
  };

  const endDrag = (event: PointerEvent<HTMLDivElement>) => {
    const current = drag.current;
    if (!current || current.id !== event.pointerId) return;
    drag.current = null;
    if (!current.moved) return;
    suppressClick.current = true;
    setDragging(false);
    setPos((value) => Math.round(value));
  };

  return (
    <section
      className={`${styles.root} ${className ?? ""}`}
      aria-roledescription="carousel"
      aria-label={label}
    >
      <div
        className={styles.viewport}
        onKeyDown={onKeyDown}
        onPointerDown={onPointerDown}
        onPointerMove={onPointerMove}
        onPointerUp={endDrag}
        onPointerCancel={endDrag}
        onClickCapture={(event) => {
          if (!suppressClick.current) return;
          suppressClick.current = false;
          event.preventDefault();
          event.stopPropagation();
        }}
      >
        <div className={`${styles.stage} ${dragging ? styles.stageDragging : ""}`}>
          {items.map((item, index) => {
            /* 정면에서 오른쪽(+)·왼쪽(-)으로 몇 칸인지. 드래그 중에는 소수다. */
            const offset = shortestDelta(pos, index, n);
            const distance = Math.abs(offset);
            const front = index === frontIndex;
            // 세로 목록에서는 전부 보인다.
            const hidden = !flat && distance > VISIBLE_DISTANCE;
            return (
              <div
                key={getKey(item)}
                ref={(element) => {
                  faceRefs.current[index] = element;
                }}
                className={styles.face}
                style={{
                  ["--s" as string]: Math.max(-3, Math.min(3, offset)),
                  ["--d" as string]: Math.min(distance, 3),
                }}
                data-front={front || undefined}
                aria-hidden={hidden || undefined}
                inert={hidden}
                role="group"
                aria-roledescription="slide"
                aria-label={`${index + 1} / ${n}: ${getLabel(item)}`}
                // 탭으로 옆 커버에 닿으면 그 커버를 정면으로 돌린다. 마우스로 누른 포커스는
                // 아래 클릭 처리에 맡긴다 — 여기서 먼저 돌리면 그 누름이 곧바로 펼침이 된다.
                onFocus={(event) => {
                  if (event.target.matches(":focus-visible")) rotateTo(index);
                }}
                onClickCapture={(event) => {
                  // 좁은 화면에서는 원통이 풀려 세로 목록이므로 바로 펼친다.
                  if (front || flat) return;
                  // 옆 커버를 누르면 펼치지 않고 먼저 정면으로 돌린다.
                  event.preventDefault();
                  event.stopPropagation();
                  rotateTo(index);
                }}
              >
                {renderFace(item, index, front)}
              </div>
            );
          })}
        </div>
      </div>

      {controls && <div className={styles.controls}>
        <button type="button" className={`btn ${styles.arrow}`} onClick={() => step(-1)} aria-label={`이전 ${itemNoun}`}>
          ←
        </button>
        <p className={`mono ${styles.counter}`} aria-live="polite">
          {String(frontIndex + 1).padStart(2, "0")} / {String(n).padStart(2, "0")}
          <span className={styles.counterLabel}>{getLabel(items[frontIndex])}</span>
        </p>
        <button type="button" className={`btn ${styles.arrow}`} onClick={() => step(1)} aria-label={`다음 ${itemNoun}`}>
          →
        </button>
      </div>}
    </section>
  );
}
