"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";

import { requireActionAdmin } from "@/lib/authGuard";
import { setTier, TIERS, type Tier } from "@/lib/tierStore";

export async function setTierAction(formData: FormData): Promise<void> {
  const auth = await requireActionAdmin();
  if (!auth.ok) redirect(auth.error === "unauthenticated" ? "/login" : "/");

  const positionSlug = String(formData.get("positionSlug") ?? "");
  const championSlug = String(formData.get("championSlug") ?? "");
  const rawTier = String(formData.get("tier") ?? "");
  if (rawTier && !TIERS.includes(rawTier as Tier)) {
    redirect(`/admin/tier-list?position=${encodeURIComponent(positionSlug)}&error=invalid`);
  }
  const result = await setTier(positionSlug, championSlug, rawTier ? rawTier as Tier : null, auth.viewer.id);
  revalidatePath("/tier-list");
  revalidatePath("/admin/tier-list");
  const back = `/admin/tier-list?position=${encodeURIComponent(positionSlug)}`;
  redirect(result.ok ? `${back}&done=saved` : `${back}&error=invalid`);
}
