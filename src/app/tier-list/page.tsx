import { permanentRedirect } from "next/navigation";

import { getPosition } from "@/data/taxonomy";

/**
 * 티어표는 따로 메뉴를 두지 않고 챔피언(라인 선택) 화면의 `티어순` 목록이 맡는다.
 * 작성 근거·건의 문서 링크도 그 목록 맨 아래로 옮겼다. 예전 주소는 같은 포지션으로 잇는다.
 */
export default async function TierListPage({ searchParams }: {
  searchParams: Promise<{ position?: string | string[] }>;
}) {
  const { position } = await searchParams;
  permanentRedirect(typeof position === "string" && getPosition(position) ? `/?position=${position}` : "/");
}
