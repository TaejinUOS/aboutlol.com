/** 외부 네트워크·DB 없이 영상 문법과 URL 경계를 검사한다. */
import assert from "node:assert/strict";

import { linkifyYouTubeEmbeds, wikiVideoTarget } from "../src/lib/wikiVideo";
import { parseYouTubeVideo, youTubeEmbedUrl, youTubeWatchUrl } from "../src/lib/youtube";

const id = "M7lc1UVf-VE";
for (const url of [id, `https://youtu.be/${id}?si=share`, `https://www.youtube.com/watch?v=${id}`, `https://m.youtube.com/shorts/${id}`, `https://www.youtube-nocookie.com/embed/${id}`, `https://youtube.com/live/${id}`]) {
  assert.deepEqual(parseYouTubeVideo(url), { videoId: id, startSeconds: 0 });
}
for (const [time, seconds] of [["90", 90], ["1m30s", 90], ["1h2m3s", 3723], ["-5", 0], ["Infinity", 0], ["99999999999999999999", 0]] as const) {
  assert.equal(parseYouTubeVideo(`https://youtu.be/${id}?t=${time}`)?.startSeconds, seconds);
}
assert.equal(parseYouTubeVideo(`https://youtube.com/watch?v=${id}&start=42`)?.startSeconds, 42);
assert.equal(parseYouTubeVideo(`https://youtu.be/${id}#t=42`)?.startSeconds, 42);
for (const url of [`https://youtube.com.evil.test/watch?v=${id}`, `https://evil.test/?v=${id}`, `https://youtube.com/embed/${id}extra`, `https://youtube.com/watch?v=bad`, `https://user:pass@youtube.com/watch?v=${id}`, `https://youtube.com:999/watch?v=${id}`, "javascript:alert(1)", "data:text/html,<script>alert(1)</script>"]) {
  assert.equal(parseYouTubeVideo(url), null, url);
}
const embed = `[youtube(https://youtu.be/${id}?t=90)]`;
const target = `#wiki-youtube:${id}:90`;
assert.ok(linkifyYouTubeEmbeds(`앞 문단\n${embed}\n뒤 문단`).includes(target));
assert.deepEqual(wikiVideoTarget(target), { videoId: id, startSeconds: 90 });
assert.equal(wikiVideoTarget(`${target}&src=evil`), null);
assert.equal(wikiVideoTarget(`#wiki-youtube:${id}:9999999999`), null);
for (const literal of [
  `\`${embed}\``, `\`code\n${embed}\ncode\``, `\`\`code\n${embed}\ncode\`\``,
  `\`\`\`md\n${embed}\n\`\`\``, `~~~~\n${embed}\n~~~~`, `    ${embed}`, `- ${embed}`, `> ${embed}`, `# ${embed}`, `글 ${embed}`, `[youtube(https://evil.test)]`, `[youtube(${id})`,
]) assert.equal(linkifyYouTubeEmbeds(literal), literal);
assert.equal((linkifyYouTubeEmbeds(`${embed}\n\n${embed}`).match(/#wiki-youtube:/g) ?? []).length, 2);
assert.ok(linkifyYouTubeEmbeds(`~~~\n${embed}\n~~~\n${embed}`).includes(target));
assert.equal(youTubeEmbedUrl(id, 90), `https://www.youtube-nocookie.com/embed/${id}?autoplay=1&rel=0&start=90`);
assert.equal(youTubeWatchUrl(id, 90), `https://www.youtube.com/watch?v=${id}&t=90s`);
console.log("[wiki-videos] 주소·시작 시간·코드 예제 보존·임의 주소 차단 확인 완료.");
