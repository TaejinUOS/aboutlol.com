import { parseYouTubeVideo, type YouTubeVideo } from "./youtube";

const PREFIX = "#wiki-youtube:";

/** 한 줄짜리 영상 문법만 변환한다. 코드·목록·인용·제목 속 예제는 그대로 둔다. */
export function linkifyYouTubeEmbeds(source: string): string {
  let fence: string | null = null;
  const output: string[] = [];
  let plain: string[] = [];
  const flush = () => {
    const chunk = plain.join("\n");
    // 인라인 코드도 여러 줄에 걸칠 수 있다. 예제 속 문법까지 바꾸지 않는다.
    const spans = [...chunk.matchAll(/(?<![\\`])(`+)(?!`)[\s\S]*?(?<!`)\1(?!`)/g)]
      .map((match) => ({ start: match.index!, end: match.index! + match[0].length }));
    let offset = 0;
    let spanIndex = 0;
    for (const line of plain) {
      while (spans[spanIndex] && spans[spanIndex].end <= offset) spanIndex++;
      const inCode = spans[spanIndex] && spans[spanIndex].start < offset + line.length;
      const match = !inCode && /^ {0,3}\[youtube\(([^\r\n()]*)\)\][ \t]*\r?$/i.exec(line);
      const video = match ? parseYouTubeVideo(match[1]) : null;
      // 이미지 override에서만 알아보는 내부 표기. 임의 HTML·외부 src는 전달하지 않는다.
      output.push(video ? `\n![유튜브 영상](${PREFIX}${video.videoId}:${video.startSeconds})\n` : line);
      offset += line.length + 1;
    }
    plain = [];
  };
  for (const line of source.split("\n")) {
    const marker = /^ {0,3}(`{3,}|~{3,})(.*)$/.exec(line);
    if (fence) {
      if (marker && marker[1][0] === fence[0] && marker[1].length >= fence.length && !marker[2].trim()) fence = null;
      output.push(line);
      continue;
    }
    if (marker) { flush(); fence = marker[1]; output.push(line); }
    else plain.push(line);
  }
  flush();
  return output.join("\n");
}

/** 일반 이미지와 구별한다. 편집자가 내부 표기를 직접 쓰더라도 ID·초만 허용한다. */
export function wikiVideoTarget(src: unknown): YouTubeVideo | null {
  if (typeof src !== "string") return null;
  const match = /^#wiki-youtube:([A-Za-z0-9_-]{11}):(\d{1,10})$/.exec(src);
  if (!match) return null;
  const startSeconds = Number(match[2]);
  return startSeconds <= 2147483647 ? { videoId: match[1], startSeconds } : null;
}
