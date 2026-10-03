import { collectBuilds } from "../src/lib/buildCollector";

type Env = { DB: D1Database; RIOT_API_KEY?: string; COLLECTOR_ENABLED?: string };
const worker = {
  async scheduled(_event: ScheduledController, env: Env) {
    if (env.COLLECTOR_ENABLED !== "true") return;
    if (!env.RIOT_API_KEY) throw new Error("RIOT_API_KEY secret 필요");
    console.log(JSON.stringify(await collectBuilds(env.DB, env.RIOT_API_KEY)));
  },
  // 수집 실행/상태/계정 정보는 공개 HTTP 경로로 제공하지 않는다.
  fetch() { return new Response("Not found", { status: 404 }); },
};
export default worker;
