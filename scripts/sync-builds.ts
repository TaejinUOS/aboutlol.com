/** 로컬 prototype / Production 키 운영 수동 수집. Cron과 동일한 DB cursor/임대를 사용한다. */
import { mkdir, rmdir, stat, writeFile } from "node:fs/promises";
import { resolve } from "node:path";
import { getPlatformProxy } from "wrangler";
import { collectBuilds, getCollectorStatus } from "../src/lib/buildCollector";

async function main() {
  const args = process.argv.slice(2);
  if (args.includes("--help")) {
    console.log(`npm run builds:sync                         KR 다이아+ 패치 전체 → 로컬 D1
npm run builds:sync -- --cycles 20            DB cursor를 이어서 여러 묶음 수집
npm run builds:sync -- --players 12 --matches 20 --requests 80
npm run builds:sync -- --patch 16.19.1        Data Dragon 버전 고정
npm run builds:sync -- --remote              Production 키 → 운영 D1
npm run builds:sync -- --status [--remote]   계정·대기열·backfill·오류 확인 (키 불필요)

기본 묶음: Riot 최대 36회, 계정별 history 6페이지, 경기 검사 12개. --cycles 기본 1.
다이아몬드 I–IV / 마스터 / 그랜드마스터 / 챌린저의 래더를 끝까지 순환합니다.
최초에는 100경기씩 이전 패치 경계까지 조회하고 이후 새 경기를 누적합니다.
운영 쓰기에는 RIOT_KEY_TYPE=production 및 유효한 Production 키가 필요합니다.
실행 전 migrations/0015_build_collector.sql까지 적용하세요. 키/PUUID를 출력하지 않습니다.`);
    return;
  }
  let remote = false, status = false, cycles = 1, players = 6, matches = 12, requests = 36;
  let version: string | undefined;
  for (let i = 0; i < args.length; i++) {
    if (args[i] === "--remote") remote = true;
    else if (args[i] === "--status") status = true;
    else if (["--cycles", "--players", "--matches", "--requests"].includes(args[i])) {
      const option = args[i], value = Number(args[++i]);
      const min = option === "--players" || option === "--matches" ? 0 : 1;
      if (!Number.isInteger(value) || value < min || value > 1000) throw new Error(`${option}: ${min}~1000 정수 필요`);
      if (option === "--cycles") cycles = value;
      if (option === "--players") players = value;
      if (option === "--matches") matches = value;
      if (option === "--requests") requests = value;
    } else if (args[i] === "--patch") {
      version = args[++i];
      if (!version || !/^\d+\.\d+\.\d+$/.test(version)) throw new Error("Data Dragon 버전 필요 (예: 16.19.1)");
    } else throw new Error(`알 수 없는 옵션: ${args[i]}`);
  }
  const store = resolve(process.cwd(), ".wrangler/build-sync"), lock = resolve(store, "running.lock");
  await mkdir(store, { recursive: true });
  try { await mkdir(lock); } catch { throw new Error("빌드 수집 잠금이 있습니다. 실행 중인 수집기가 없는지 확인하세요."); }
  let local: Awaited<ReturnType<typeof getPlatformProxy<CloudflareEnv & { RIOT_API_KEY?: string }>>> | undefined;
  let operational: Awaited<ReturnType<typeof getPlatformProxy<CloudflareEnv>>> | undefined;
  try {
    if (await stat(resolve(process.cwd(), ".wrangler/db-pull/running.lock")).then(() => true, () => false)) throw new Error("db:pull 실행 중입니다.");
    if (remote && !status && process.env.RIOT_KEY_TYPE !== "production") throw new Error("운영 수집에는 RIOT_KEY_TYPE=production 확인이 필요합니다. 개발 키는 로컬 검증에 사용하세요.");
    local = await getPlatformProxy<CloudflareEnv & { RIOT_API_KEY?: string }>({ remoteBindings: false });
    let DB = local.env.DB;
    if (remote) {
      const configPath = resolve(store, "remote.jsonc");
      await writeFile(configPath, JSON.stringify({ name: "build-manual-remote", compatibility_date: "2026-08-31",
        d1_databases: [{ binding: "DB", database_name: "kkaenam-gg", database_id: "9df1655b-da71-4d23-ba2f-6c2b6981e632", remote: true }] }));
      operational = await getPlatformProxy<CloudflareEnv>({ configPath, remoteBindings: true });
      DB = operational.env.DB;
    }
    if (status) { console.log(JSON.stringify(await getCollectorStatus(DB), null, 2)); return; }
    const key = (process.env.RIOT_API_KEY ?? local.env.RIOT_API_KEY)?.trim();
    if (!key) throw new Error(".dev.vars 또는 RIOT_API_KEY 환경 변수에 키를 설정하세요.");
    for (let i = 0; i < cycles; i++) {
      const result = await collectBuilds(DB, key, { players, matches, requests, version, durationMs: Math.min(600_000, requests * 1600 + 30_000) });
      console.log(JSON.stringify({ cycle: i + 1, target: remote ? "remote" : "local", ...result }));
      if (["rate-limit", "locked"].includes(result.status)) break;
    }
    console.log(JSON.stringify(await getCollectorStatus(DB), null, 2));
  } finally {
    await operational?.dispose(); await local?.dispose(); await rmdir(lock);
  }
}
main().catch((error: unknown) => {
  const message = error instanceof Error ? error.message : "수집 실패";
  console.error(message.includes("no such table") ? "먼저 대상 DB에 0015까지 migrations apply를 실행하세요." : message);
  process.exitCode = 1;
});
