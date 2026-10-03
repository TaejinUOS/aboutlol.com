/** Riot Match-V5 실경기 수집. 기본 로컬 D1, --remote일 때만 운영 통계 테이블에 기록. */
import { spawn } from "node:child_process";
import { mkdir, stat, rmdir, writeFile } from "node:fs/promises";
import { resolve } from "node:path";
import { setTimeout as delay } from "node:timers/promises";
import { getPlatformProxy } from "wrangler";
import { BUILD_WINDOW_DAYS, extractBuilds, patchLine, type BuildMatch, type BuildTimeline, type ItemCatalog } from "../src/lib/buildStats";

const ROOT = process.cwd();
const STORE = resolve(ROOT, ".wrangler/build-sync");
const LOCK = resolve(STORE, "running.lock");
const quote = (value: string) => `'${value.replaceAll("'", "''")}'`;
const nullable = (value: string | null) => value === null ? "NULL" : quote(value);

function wrangler(args: string[]): Promise<string> {
  return new Promise((accept, reject) => {
    const child = spawn(process.execPath, [resolve(ROOT, "node_modules/wrangler/bin/wrangler.js"), ...args], {
      cwd: ROOT, shell: false, windowsHide: true,
      env: { ...process.env, CI: "true", WRANGLER_SEND_METRICS: "false" }, stdio: ["ignore", "pipe", "pipe"],
    });
    let output = ""; let errors = "";
    child.stdout.on("data", (chunk) => { output += chunk; });
    child.stderr.on("data", (chunk) => { errors += chunk; });
    child.on("error", reject);
    child.on("close", (code) => code === 0 ? accept(output) : reject(new Error(`Wrangler 실패: ${errors || output}`)));
  });
}

async function main() {
  const args = process.argv.slice(2);
  if (args.includes("--help")) {
    console.log(`npm run builds:sync                            KR 솔로 랭크 최근 14일, 최신 패치 → 로컬 D1
npm run builds:sync -- --matches 500 --players 50  표본 확대 (기본 100경기/20계정)
npm run builds:sync -- --patch 16.19.1            Data Dragon 버전 고정
npm run builds:sync -- --remote                  수집 결과 → 운영 D1 (명시적 실행)

RIOT_API_KEY는 프로세스 환경 변수 또는 .dev.vars에서 읽고 출력하지 않습니다.
실행 전 대상 DB에 migrations/0014_champion_builds.sql까지 적용하세요.
에메랄드 I 래더 표본 계정의 경기에서 모든 참가자를 집계합니다. 참가자 티어는 혼합이며
전체 랭크 모집단을 대표하는 표본이 아닙니다. 페이지 조회는 API를 호출하지 않습니다.
동시 수집/db:pull을 피하세요. 중단 후 같은 명령을 다시 실행하면 저장된 경기는 건너뜁니다.`);
    return;
  }
  let matches = 100; let players = 20; let version: string | undefined;
  let remote = false;
  for (let i = 0; i < args.length; i++) {
    if (args[i] === "--remote") remote = true;
    else if (args[i] === "--matches" || args[i] === "--players") {
      const option = args[i]; const value = Number(args[++i]);
      if (!Number.isInteger(value) || value < 1 || value > (option === "--matches" ? 5000 : 200)) throw new Error("수집 개수 범위 오류");
      if (option === "--matches") matches = value; else players = value;
    } else if (args[i] === "--patch") {
      version = args[++i];
      if (!version || !/^\d+\.\d+\.\d+$/.test(version)) throw new Error("패치는 16.19.1 같은 Data Dragon 버전이어야 합니다.");
    } else throw new Error(`알 수 없는 옵션: ${args[i]}`);
  }
  await mkdir(STORE, { recursive: true });
  try { await mkdir(LOCK); }
  catch { throw new Error("빌드 수집 잠금이 있습니다. 실행 중인 수집기가 없을 때만 .wrangler/build-sync/running.lock을 제거하세요."); }
  let proxy: Awaited<ReturnType<typeof getPlatformProxy<CloudflareEnv & { RIOT_API_KEY?: string }>>> | undefined;
  try {
    // db:pull은 로컬 D1 디렉터리를 교체하므로 함께 실행하면 안 된다.
    if (await stat(resolve(ROOT, ".wrangler/db-pull/running.lock")).then(() => true, () => false)) throw new Error("db:pull 실행 중입니다.");
    proxy = await getPlatformProxy<CloudflareEnv & { RIOT_API_KEY?: string }>({ remoteBindings: false });
    const key = (process.env.RIOT_API_KEY ?? proxy.env.RIOT_API_KEY)?.trim();
    if (!key) throw new Error("RIOT_API_KEY가 없습니다. .dev.vars 또는 프로세스 환경 변수에 설정하세요.");
    const DB = proxy.env.DB;
    const existingOutput = remote ? JSON.parse(await wrangler(["d1", "execute", "DB", "--remote", "--json", "--command", "SELECT match_id FROM build_matches;"])) as { results: { match_id: string }[] }[] : null;
    const existing = new Set((existingOutput?.[0].results ?? (await DB.prepare("SELECT match_id FROM build_matches").all<{ match_id: string }>()).results).map((r) => r.match_id));
    let lastRequest = 0;
    let blockedUntil = 0;
    const histories = new Map<string, number[]>();
    /** 순차 요청, 기본 100/120초 이하. 추가 app/method 헤더 제한과 Retry-After도 지킨다. */
    async function riot<T>(host: "kr" | "asia", path: string): Promise<T> {
      for (let attempt = 0; attempt < 4; attempt++) {
        await delay(Math.max(0, lastRequest + 1300 - Date.now(), blockedUntil - Date.now()));
        const history = (histories.get(host) ?? []).filter((time) => Date.now() - time < 120_000);
        if (history.length >= 95) await delay(Math.max(0, history[0] + 120_100 - Date.now()));
        lastRequest = Date.now(); history.push(lastRequest); histories.set(host, history);
        let response: Response;
        try {
          response = await fetch(`https://${host}.api.riotgames.com${path}`, {
            headers: { "X-Riot-Token": key! }, signal: AbortSignal.timeout(15_000),
          });
        } catch {
          if (attempt === 3) throw new Error("Riot 네트워크 오류. 저장된 경기는 유지됩니다.");
          await delay(2000 * (attempt + 1)); continue;
        }
        for (const prefix of ["X-App", "X-Method"]) {
          const limits = response.headers.get(`${prefix}-Rate-Limit`)?.split(",") ?? [];
          const counts = response.headers.get(`${prefix}-Rate-Limit-Count`)?.split(",") ?? [];
          for (const limit of limits) {
            const [max, seconds] = limit.split(":").map(Number);
            const current = counts.map((count) => count.split(":").map(Number)).find(([, window]) => window === seconds)?.[0] ?? 0;
            if (current >= max - 1) blockedUntil = Math.max(blockedUntil, Date.now() + seconds * 1000);
          }
        }
        if (response.status === 429) {
          const seconds = Number(response.headers.get("Retry-After"));
          const wait = Number.isFinite(seconds) && seconds > 0 ? Math.ceil(seconds) : 120;
          blockedUntil = Math.max(blockedUntil, Date.now() + wait * 1000);
          console.log(`Riot 호출 제한: ${wait}초 대기`); continue;
        }
        if (response.status === 401 || response.status === 403) throw new Error(`Riot API ${response.status}: 키 만료/권한을 확인하세요.`);
        if (response.status >= 500 && attempt < 3) { await delay(2000 * (attempt + 1)); continue; }
        if (!response.ok) throw new Error(`Riot API ${response.status}`);
        return await response.json() as T;
      }
      throw new Error("Riot 호출 제한이 계속됩니다. 잠시 후 다시 실행하세요.");
    }
    const fetchStatic = async <T>(url: string): Promise<T> => {
      const response = await fetch(url, { signal: AbortSignal.timeout(15_000) });
      if (!response.ok) throw new Error(`Data Dragon 오류: ${response.status}`);
      return await response.json() as T;
    };
    version ??= (await fetchStatic<string[]>("https://ddragon.leagueoflegends.com/api/versions.json"))[0];
    const patch = patchLine(version)!;
    const catalog = (await fetchStatic<{ data: ItemCatalog }>(`https://ddragon.leagueoflegends.com/cdn/${version}/data/ko_KR/item.json`)).data;
    const since = Date.now() - BUILD_WINDOW_DAYS * 86400_000;
    const startedAt = new Date().toISOString();
    const sql: string[] = [];
    const save = async (statements: string[]) => {
      if (remote) sql.push(...statements);
      else await DB.batch(statements.map((statement) => DB.prepare(statement)));
    };
    // 정적 항목의 이름/아이콘도 관측한 패치와 맞춘다.
    const itemSql = Object.entries(catalog).map(([id, item]) =>
      `INSERT OR REPLACE INTO build_items VALUES (${quote(patch)},${Number(id)},${quote(item.name)},${quote(`https://ddragon.leagueoflegends.com/cdn/${version}/img/item/${item.image.full}`)});`);
    for (let i = 0; i < itemSql.length; i += 50) await save(itemSql.slice(i, i + 50));
    const entries = await riot<{ puuid?: string }[]>("kr", "/lol/league/v4/entries/RANKED_SOLO_5x5/EMERALD/I?page=1");
    const puuids = [...new Set(entries.map((e) => e.puuid).filter((p): p is string => Boolean(p)))];
    if (!puuids.length) throw new Error("래더 API에서 PUUID를 얻지 못했습니다. Riot 스키마/권한을 확인하세요.");
    // 매 실행 다른 구간을 뽑아 누적 표본이 같은 계정에만 머물지 않게 한다.
    const offset = Math.floor(Date.now() / 3600_000) % puuids.length;
    const sampled = [...puuids.slice(offset), ...puuids.slice(0, offset)].slice(0, players);
    const ids = new Set<string>();
    const lists: string[][] = [];
    for (const [index, puuid] of sampled.entries()) {
      const list = await riot<string[]>("asia", `/lol/match/v5/matches/by-puuid/${encodeURIComponent(puuid)}/ids?queue=420&type=ranked&count=100&startTime=${Math.floor(since / 1000)}`);
      lists.push(list);
      if ((index + 1) % 10 === 0) console.log(`표본 계정 조회 ${index + 1}/${sampled.length}`);
    }
    // 한 계정의 100경기를 먼저 모두 채우지 않고 각 계정의 최근 경기부터 번갈아 수집한다.
    for (let index = 0; index < 100; index++) for (const list of lists) {
      const id = list[index];
      if (id && /^KR_\d+$/.test(id) && !existing.has(id)) ids.add(id);
    }
    console.log(`대상: ${remote ? "운영" : "로컬"} / 패치 ${patch} / 신규 후보 ${ids.size}경기 / 상한 ${matches}경기`);
    let collected = 0; let inspected = 0;
    for (const id of ids) {
      if (collected >= matches) break;
      inspected++;
      const match = await riot<BuildMatch>("asia", `/lol/match/v5/matches/${id}`);
      if (patchLine(match.info.gameVersion) !== patch || match.info.queueId !== 420 || match.info.mapId !== 11 ||
          match.info.gameDuration < 600 || match.info.gameStartTimestamp < since ||
          match.info.participants.some((p) => p.gameEndedInEarlySurrender)) continue;
      const timeline = await riot<BuildTimeline>("asia", `/lol/match/v5/matches/${id}/timeline`);
      const observations = extractBuilds(match, timeline, catalog);
      if (!observations.length) continue;
      await save([
        `INSERT OR IGNORE INTO build_matches VALUES (${quote(id)},${quote(patch)},${match.info.gameStartTimestamp},${quote(startedAt)});`,
        ...observations.map((o) => `INSERT OR IGNORE INTO build_observations VALUES (${quote(id)},${o.participantId},${o.championId},${quote(o.position)},${o.win},${nullable(o.starter)},${nullable(o.boots)},${nullable(o.core)},${nullable(o.skills)});`),
      ]);
      collected++;
      if (collected % 10 === 0 || collected === matches) console.log(`수집 ${collected}경기 (검사 ${inspected}경기)`);
    }
    const finishedAt = new Date().toISOString();
    await save([
      `INSERT INTO build_syncs SELECT ${quote(patch)},${quote(finishedAt)},'KR solo / Emerald I ladder seeds / mixed participant ranks',COUNT(*) FROM build_matches WHERE patch=${quote(patch)} AND played_at>=${since} HAVING COUNT(*)>0 ON CONFLICT(patch) ${collected ? "DO UPDATE SET updated_at=excluded.updated_at, matches=excluded.matches" : "DO NOTHING"};`,
      // 데이터와 집계 모두 14일. 오래된 패치는 지워 용량과 표본의 혼합을 제한한다.
      `DELETE FROM build_matches WHERE played_at<${since};`,
      "DELETE FROM build_syncs WHERE patch NOT IN (SELECT DISTINCT patch FROM build_matches);",
      "DELETE FROM build_items WHERE patch NOT IN (SELECT patch FROM build_syncs);",
    ]);
    if (remote) {
      const file = resolve(STORE, `sync-${Date.now()}.sql`);
      await writeFile(file, sql.join("\n"), "utf8");
      await wrangler(["d1", "execute", "DB", "--remote", "--file", file, "--yes"]);
    }
    if (!collected) { console.log("새로 수집한 대상 패치 경기가 없습니다. 기존 갱신 시각은 유지하고 만료 표본을 정리했습니다."); return; }
    console.log(`완료: ${collected}경기, 패치 ${patch}, ${remote ? "운영" : "로컬"} D1 반영`);
  } finally {
    await proxy?.dispose();
    await rmdir(LOCK);
  }
}

main().catch((error: unknown) => {
  const message = error instanceof Error ? error.message : "수집 실패";
  console.error(message.includes("no such table") ? "통계 테이블이 없습니다. 먼저 대상 DB의 D1 migrations apply를 실행하세요." : message);
  process.exitCode = 1;
});
