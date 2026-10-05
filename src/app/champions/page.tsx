import { redirect } from "next/navigation";

/** 챔피언 화면은 이제 사이트 첫 화면(`/`)이다. 예전 주소는 쿼리를 유지한 채 넘겨 준다. */
export default async function ChampionsPage({ searchParams }: {
  searchParams: Promise<Record<string, string | string[] | undefined>>;
}) {
  const params = await searchParams;
  const query = new URLSearchParams();
  for (const [key, value] of Object.entries(params)) {
    for (const item of Array.isArray(value) ? value : value === undefined ? [] : [value]) {
      query.append(key, item);
    }
  }
  const search = query.toString();
  redirect(search ? `/?${search}` : "/");
}
