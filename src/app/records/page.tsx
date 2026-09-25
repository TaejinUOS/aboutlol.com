import { permanentRedirect } from "next/navigation";

/** 이전 전적 링크를 새 홈 검색으로 보낸다. */
export default async function RecordsRedirect({ searchParams }: {
  searchParams: Promise<{ riotId?: string | string[] }>;
}) {
  const { riotId } = await searchParams;
  permanentRedirect(typeof riotId === "string" ? `/?riotId=${encodeURIComponent(riotId)}` : "/");
}
