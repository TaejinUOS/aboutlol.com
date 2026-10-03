/** 운영 D1 → 로컬. 운영에는 export만 실행하고, 검증한 로컬 DB만 교체한다. */
import { spawn } from "node:child_process";
import { randomUUID } from "node:crypto";
import { access, mkdir, readFile, rename, rmdir, stat, writeFile } from "node:fs/promises";
import { createConnection } from "node:net";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { unstable_splitSqlQuery as splitSqlQuery } from "wrangler";

const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const WRANGLER = join(ROOT, "node_modules/wrangler/bin/wrangler.js");
const DATABASE = "DB"; // wrangler.jsonc의 바인딩. 임의 원격 대상을 인자로 받지 않는다.
const STORE = join(ROOT, ".wrangler/db-pull");
const LOCAL = join(ROOT, ".wrangler/state/v3/d1");
const LOCK = join(STORE, "running.lock");

async function exists(path: string) {
  try { await access(path); return true; }
  catch (error) {
    if ((error as NodeJS.ErrnoException).code === "ENOENT") return false;
    throw error;
  }
}

function wrangler(args: string[]): Promise<string> {
  // shell을 거치지 않아 Windows·POSIX 모두 경로와 SQL 인자를 그대로 전달한다.
  return new Promise((accept, reject) => {
    const child = spawn(process.execPath, [WRANGLER, ...args], {
      cwd: ROOT, shell: false, windowsHide: true,
      env: { ...process.env, CI: "true", WRANGLER_SEND_METRICS: "false" },
      stdio: ["ignore", "pipe", "pipe"],
    });
    let stdout = "";
    let stderr = "";
    child.stdout.setEncoding("utf8").on("data", (chunk: string) => { stdout += chunk; });
    child.stderr.setEncoding("utf8").on("data", (chunk: string) => { stderr += chunk; });
    child.on("error", reject);
    child.on("close", (code) => {
      if (code === 0) accept(stdout);
      else reject(new Error(`Wrangler 실패 (${code}).\n${stderr || stdout}`));
    });
  });
}

async function checkServers() {
  for (const port of [3000, 8788]) {
    const listening = await new Promise<boolean>((accept) => {
      const socket = createConnection({ host: "127.0.0.1", port });
      const done = (value: boolean) => { socket.destroy(); accept(value); };
      socket.once("connect", () => done(true));
      socket.once("error", () => done(false));
      socket.setTimeout(500, () => done(false));
    });
    if (listening) throw new Error(`포트 ${port}에 서버가 실행 중입니다. dev/preview 서버를 종료한 뒤 다시 실행하세요.`);
  }
}

type Result = { success: boolean; results: Record<string, unknown>[] };

async function verify(persist: string) {
  const output = await wrangler([
    "d1", "execute", DATABASE, "--local", "--persist-to", persist, "--json",
    "--command", "PRAGMA quick_check; PRAGMA foreign_key_check; SELECT name FROM sqlite_schema WHERE type='table' ORDER BY name; SELECT COUNT(*) AS count FROM champion_placements; SELECT COUNT(*) AS count FROM wiki_docs;",
  ]);
  const results = JSON.parse(output) as Result[];
  if (results.length !== 5 || results.some((r) => !r.success)) throw new Error("DB 검증 질의에 실패했습니다.");
  if (results[0].results.length !== 1 || Object.values(results[0].results[0])[0] !== "ok") {
    throw new Error("가져온 DB의 무결성 검사에 실패했습니다.");
  }
  if (results[1].results.length) throw new Error("가져온 DB에 외래키 오류가 있습니다.");
  const tables = results[2].results.map((r) => String(r.name));
  for (const table of ["users", "wiki_docs", "wiki_sections", "wiki_edits", "wiki_links", "champion_placements", "champion_ops", "champion_videos", "tier_placements", "d1_migrations"]) {
    if (!tables.includes(table)) throw new Error(`필수 테이블이 없습니다: ${table}`);
  }
  console.log(`검증 완료: 분류 ${results[3].results[0].count}건, 위키 ${results[4].results[0].count}건, 외래키 정상.`);
}

async function main() {
  const args = process.argv.slice(2);
  if (args.includes("--help")) {
    console.log(`npm run db:pull                 전체 운영 DB를 로컬로 가져오기\nnpm run db:pull -- --dry-run    가져오기·검증만 수행, 로컬 DB 유지\nnpm run db:pull -- --restore ID 실행 ID의 local-before.sql 백업으로 복구\n\n실행 전에 모든 dev/preview 서버와 빌드를 종료하세요 (사용자 지정 포트 포함).\n운영 전체 덤프에는 계정 정보가 포함됩니다. .wrangler/db-pull/에만 보관하세요.`);
    return;
  }
  const dryRun = args.includes("--dry-run");
  const restoreIndex = args.indexOf("--restore");
  const restoreId = restoreIndex >= 0 ? args[restoreIndex + 1] : undefined;
  const remaining = args.filter((_, i) => i !== restoreIndex && !(restoreIndex >= 0 && i === restoreIndex + 1) && args[i] !== "--dry-run");
  if (remaining.length || (restoreIndex >= 0 && (!restoreId || !/^[\w-]+$/.test(restoreId)))) {
    throw new Error("잘못된 인자입니다. npm run db:pull -- --help를 확인하세요.");
  }
  await checkServers();
  await mkdir(STORE, { recursive: true });
  try { await mkdir(LOCK); }
  catch (error) {
    if ((error as NodeJS.ErrnoException).code === "EEXIST") throw new Error(`다른 db:pull이 실행 중이거나 중단된 잠금이 있습니다: ${LOCK}`);
    throw error;
  }

  const id = `${new Date().toISOString().replace(/[:.]/g, "-")}-${randomUUID().slice(0, 8)}`;
  const run = join(STORE, id);
  let movedOld = false;
  let installed = false;
  try {
    await mkdir(run);
    const persist = join(run, "candidate");
    const dump = restoreId ? join(STORE, restoreId, "local-before.sql") : join(run, "remote.sql");
    console.log(`실행 ID: ${id}\n${restoreId ? `백업 복구: ${restoreId}` : "전체 운영 D1을 내려받습니다."}`);
    if (restoreId) {
      if (!(await stat(dump)).isFile()) throw new Error("복구할 SQL 백업이 없습니다.");
    } else {
      // 원격 호출은 읽기 전용 export 하나뿐이다.
      await wrangler(["d1", "export", DATABASE, "--remote", "--output", dump, "--skip-confirmation"]);
    }
    if ((await stat(dump)).size === 0) throw new Error("SQL 덤프가 비어 있습니다.");
    // 운영 덤프는 자식 표의 INSERT가 부모 표의 CREATE보다 먼저 나올 수 있다.
    // 모든 표를 먼저 만들고 데이터를 넣는다. 문자열 안의 줄바꿈·세미콜론은
    // Wrangler 자체 SQL 파서로 보존한다 (줄 단위/세미콜론 단순 분할 금지).
    const statements = splitSqlQuery(await readFile(dump, "utf8"));
    const tableStatements = statements.filter((sql) => /^\s*CREATE TABLE\b/i.test(sql));
    const otherStatements = statements.filter((sql) => !/^\s*CREATE TABLE\b/i.test(sql));
    const importFile = join(run, "import.sql");
    await writeFile(importFile, [...tableStatements, ...otherStatements].join(";\n") + ";\n");
    console.log("별도 로컬 DB에 가져와 검증합니다.");
    await wrangler(["d1", "execute", DATABASE, "--local", "--persist-to", persist, "--file", importFile, "--yes"]);
    // 운영 스냅숏의 이력을 이어서, 아직 배포되지 않은 로컬 마이그레이션도 적용한다.
    await wrangler(["d1", "migrations", "apply", DATABASE, "--local", "--persist-to", persist]);
    await verify(persist);
    await writeFile(join(run, "manifest.json"), JSON.stringify({ id, createdAt: new Date().toISOString(), mode: restoreId ? "restore" : "pull", restoreId, dryRun }, null, 2) + "\n");
    if (dryRun) {
      console.log(`로컬 DB는 유지했습니다. 검증 결과: .wrangler/db-pull/${id}/`);
      return;
    }
    await checkServers();
    if (await exists(LOCAL)) {
      console.log("기존 로컬 DB를 백업합니다.");
      await wrangler(["d1", "export", DATABASE, "--local", "--output", join(run, "local-before.sql")]);
      if ((await stat(join(run, "local-before.sql"))).size === 0) throw new Error("로컬 백업이 비어 있습니다.");
    }
    // 백업 중 서버가 다시 실행된 경우에도 파일을 교체하지 않는다.
    await checkServers();
    await mkdir(dirname(LOCAL), { recursive: true });
    if (await exists(LOCAL)) {
      await rename(LOCAL, join(run, "local-d1-before"));
      movedOld = true;
    }
    await rename(join(persist, "v3/d1"), LOCAL);
    installed = true;
    console.log(`로컬 DB 교체 완료. npm run dev로 서버를 시작하세요.\n백업: .wrangler/db-pull/${id}/\n${movedOld ? `복구: npm run db:pull -- --restore ${id}` : "기존 로컬 DB가 없어 복구 백업은 생성하지 않았습니다."}`);
  } catch (error) {
    if (movedOld && !installed) await rename(join(run, "local-d1-before"), LOCAL);
    if (["EBUSY", "EPERM"].includes((error as NodeJS.ErrnoException).code ?? "")) {
      throw new Error("로컬 DB 파일이 잠겨 교체하지 못했습니다. 모든 dev/preview 서버와 빌드 프로세스를 종료한 뒤 다시 실행하세요.", { cause: error });
    }
    throw error;
  } finally {
    await rmdir(LOCK);
  }
}

main().catch((error: unknown) => {
  console.error(error instanceof Error ? error.message : error);
  process.exitCode = 1;
});
