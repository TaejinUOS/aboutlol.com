/** 티어 모델 스크립트가 함께 읽는 파일들. */
import { existsSync, readdirSync, readFileSync } from "node:fs";
import path from "node:path";

import type { DatasetInputs, PatchChange, Snapshot } from "../../src/lib/tierModel/dataset";
import type { TierModel } from "../../src/lib/tierModel/model";

export const ROOT = path.resolve(__dirname, "../..");
export const DATA = path.join(ROOT, "data/tier-model");
export const MODEL_FILE = path.join(ROOT, "src/data/generated/tier-model.json");

export const readJson = <T>(file: string, fallback: T): T =>
  existsSync(file) ? (JSON.parse(readFileSync(file, "utf8")) as T) : fallback;

/** snapshots/<패치>/<구간>.json */
export function loadSnapshots(dir = path.join(DATA, "snapshots")): Snapshot[] {
  if (!existsSync(dir)) return [];
  return readdirSync(dir, { withFileTypes: true })
    .filter((d) => d.isDirectory())
    .flatMap((d) => readdirSync(path.join(dir, d.name))
      .filter((f) => f.endsWith(".json"))
      .map((f) => readJson<Snapshot>(path.join(dir, d.name, f), null!)));
}

export function loadInputs(): DatasetInputs {
  return {
    snapshots: loadSnapshots(),
    changes: readJson<PatchChange[]>(path.join(DATA, "patch-changes.json"), []),
    operator: readJson(path.join(DATA, "operator-metrics.json"), {}),
    pro: readJson(path.join(DATA, "pro-presence.json"), {}),
    releases: readJson(path.join(DATA, "releases.json"), {}),
  };
}

export const loadModel = () => readJson<TierModel | null>(MODEL_FILE, null);
