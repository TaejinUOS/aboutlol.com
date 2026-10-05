import { collectBuilds } from "../src/lib/buildCollector";

type Env = { DB: D1Database; RIOT_API_KEY?: string; COLLECTOR_ENABLED?: string; TIER_SAMPLE_REQUESTS?: string };
const worker = {
  async scheduled(_event: ScheduledController, env: Env) {
    if (env.COLLECTOR_ENABLED !== "true") return;
    if (!env.RIOT_API_KEY) throw new Error("RIOT_API_KEY secret 필요");
    // 티어 구간 표본은 기본 꺼짐(0). 켤 때는 전체 예산도 그만큼 늘려 빌드 수집 몫을 지킨다.
    const tierRequests = Math.max(0, Math.min(500, Number(env.TIER_SAMPLE_REQUESTS ?? 0) || 0));
    console.log(JSON.stringify(await collectBuilds(env.DB, env.RIOT_API_KEY, {
      requests: 36 + tierRequests,
      tierSample: { requests: tierRequests },
    })));
  },
  // 수집 실행/상태/계정 정보는 공개 HTTP 경로로 제공하지 않는다.
  fetch() { return new Response("Not found", { status: 404 }); },
};
export default worker;
