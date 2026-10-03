import assert from "node:assert/strict";
import { extractBuilds, isCoreItem, patchLine, rankBuilds, type BuildEvent, type BuildMatch, type ItemCatalog } from "../src/lib/buildStats";

const item = (name: string, gold: number, tags: string[] = [], into: string[] = []) => ({
  name, gold: { total: gold, purchasable: true }, maps: { "11": true }, tags, into, image: { full: "test.png" },
});
const catalog: ItemCatalog = {
  100: item("시작 아이템", 450), 200: item("물약", 50), 300: item("기본 신발", 300, ["Boots"], ["301"]),
  301: item("완성 신발", 1100, ["Boots"]), 400: item("중간 재료", 2200, [], ["401"]),
  401: item("완성 코어 1", 3000), 402: item("완성 코어 2", 3000), 403: item("완성 코어 3", 3000),
  404: { ...item("자동 변신", 3000), gold: { total: 3000, purchasable: false } },
  405: item("변신 전 코어", 3000, [], ["404"]),
};
const match: BuildMatch = {
  metadata: { matchId: "KR_1234" }, info: {
    queueId: 420, mapId: 11, gameVersion: "16.19.123.1", gameDuration: 1800,
    gameStartTimestamp: Date.now(), participants: [
      { participantId: 1, championId: 103, teamPosition: "MIDDLE", win: true },
      { participantId: 2, championId: 99, teamPosition: "UTILITY", win: false },
      { participantId: 3, championId: 99, teamPosition: "", win: false },
    ],
  },
};
const purchase = (itemId: number, timestamp: number): BuildEvent => ({ type: "ITEM_PURCHASED", participantId: 1, itemId, timestamp });
const events: BuildEvent[] = [
  purchase(100, 1000), purchase(200, 2000), purchase(200, 2500),
  purchase(300, 150_000), purchase(301, 250_000), purchase(400, 350_000),
  purchase(402, 450_000), { type: "ITEM_UNDO", participantId: 1, beforeId: 402, afterId: 0, timestamp: 450_001 },
  purchase(401, 550_000), purchase(402, 650_000), purchase(403, 750_000), purchase(401, 850_000),
  ...[1, 2, 3, 1, 1, 4, 1, 3, 1].map((skillSlot, i) => ({ type: "SKILL_LEVEL_UP", skillSlot, participantId: 1, timestamp: 30_000 + i * 60_000 })),
];
const timeline = { metadata: { matchId: "KR_1234" }, info: { frames: [{ events }] } };
const observations = extractBuilds(match, timeline, catalog);
assert.equal(observations.length, 2, "불명 포지션 제외, 다른 포지션 분리");
assert.equal(observations[0].starter, "[100,200,200]", "시작 물약 개수 보존");
assert.equal(observations[0].boots, "[301]", "기본 신발 제외");
assert.equal(observations[0].core, "[401,402,403]", "구매 취소·재료·중복 제외, 구매 순서 보존");
assert.equal(observations[0].skills, "[1,2,3,1,1,4,1,3,1]");
const refunded = extractBuilds(match, { ...timeline, info: { frames: [{ events: [...events,
  { type: "ITEM_SOLD", participantId: 1, itemId: 100, timestamp: 3000 },
  { type: "ITEM_UNDO", participantId: 1, beforeId: 0, afterId: 100, timestamp: 4000 },
] }] } }, catalog);
assert.equal(refunded[0].starter, "[100,200,200]", "시작 아이템 판매 취소를 복원한다");
assert.equal(observations[1].core, null, "3코어 미완성은 분모 제외");
assert.equal(observations[1].skills, null, "레벨 9 이전 종료는 분모 제외");
assert.equal(isCoreItem(400, catalog), false);
assert.equal(isCoreItem(405, catalog), true, "자동 변신 상위 아이템을 완성 구매품으로 세지 않는다");
assert.deepEqual(extractBuilds({ ...match, info: { ...match.info, queueId: 440 } }, timeline, catalog), []);
assert.deepEqual(extractBuilds({ ...match, info: { ...match.info, gameDuration: 500 } }, timeline, catalog), []);
assert.deepEqual(extractBuilds({ ...match, info: { ...match.info, participants: [{ ...match.info.participants[0], gameEndedInEarlySurrender: true }] } }, timeline, catalog), []);
assert.throws(() => extractBuilds(match, { ...timeline, metadata: { matchId: "KR_5678" } }, catalog));
const ranked = rankBuilds("core", [{ key: "[1,2,3]", games: 50, wins: 25 }, { key: "[2,3,4]", games: 1, wins: 1 }]);
assert.equal(ranked.eligible, 51);
assert.equal(ranked.rows[0].recommended, true);
assert.equal(ranked.rows[1].recommended, false, "100% 승률의 1판 표본을 추천하지 않는다");
assert.equal(ranked.rows[0].winRate, 50);
assert.equal(ranked.rows[0].pickRate, 50 / 51 * 100);
assert.equal(rankBuilds("starter", [{ key: "[]", games: 29, wins: 29 }]).rows[0].recommended, false);
assert.equal(rankBuilds("boots", Array.from({ length: 10 }, (_, i) => ({ key: String(i), games: 10, wins: 5 }))).eligible, 100, "상위 5개 밖 조합도 선택률 분모에 포함");
assert.equal(patchLine("16.19.123.1"), "16.19");
assert.equal(patchLine("invalid"), null);
console.log("PASS: 빌드 구매 취소·순서·표본 분모·포지션·패치·추천 기준");
