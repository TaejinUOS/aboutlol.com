"use client";

import { useEffect, useId, useRef, useState } from "react";

import { youTubeEmbedUrl, youTubeThumbnailUrl, type YouTubeVideo } from "@/lib/youtube";

import styles from "./WikiYouTube.module.css";

const PLAY_EVENT = "wiki-youtube-play";

/** span 골격으로 마크다운 문단 안에서도 유효한 HTML을 유지한다. */
export function WikiYouTube({ videoId, startSeconds }: YouTubeVideo) {
  const [playing, setPlaying] = useState(false);
  const id = useId();
  const playerRef = useRef<HTMLIFrameElement>(null);
  const buttonRef = useRef<HTMLButtonElement>(null);

  useEffect(() => {
    const stopOther = (event: Event) => {
      if ((event as CustomEvent<string>).detail !== id) setPlaying(false);
    };
    window.addEventListener(PLAY_EVENT, stopOther);
    return () => window.removeEventListener(PLAY_EVENT, stopOther);
  }, [id]);

  useEffect(() => {
    if (playing) playerRef.current?.focus();
  }, [playing]);

  return (
    <span className={styles.video}>
      <span className={styles.frame}>
        {playing ? (
          <iframe
            ref={playerRef}
            className={styles.player}
            src={youTubeEmbedUrl(videoId, startSeconds)}
            title="유튜브 영상 플레이어"
            allow="autoplay; encrypted-media; picture-in-picture; fullscreen"
            allowFullScreen
            referrerPolicy="strict-origin-when-cross-origin"
          />
        ) : (
          <button
            ref={buttonRef}
            type="button"
            className={styles.facade}
            aria-label="유튜브 영상 재생"
            onClick={() => {
              window.dispatchEvent(new CustomEvent(PLAY_EVENT, { detail: id }));
              setPlaying(true);
            }}
          >
            <img src={youTubeThumbnailUrl(videoId)} alt="" width={480} height={360} loading="lazy" className={styles.thumbnail} />
            <span className={styles.play} aria-hidden="true">▶</span>
          </button>
        )}
      </span>
      <span className={styles.caption}>
        {playing ? (
          <button type="button" className={styles.close} onClick={() => {
            setPlaying(false);
            // DOM에 재생 버튼이 돌아온 뒤 초점을 돌려준다.
            requestAnimationFrame(() => buttonRef.current?.focus());
          }}>영상 닫기</button>
        ) : <span>재생을 누르면 유튜브 플레이어를 불러옵니다.</span>}
      </span>
    </span>
  );
}
