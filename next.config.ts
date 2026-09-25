import type { NextConfig } from "next";

const SITE_HOST = "aboutlol.com";
const REDIRECT_HOSTS = ["www.aboutlol.com", "kkaenam.com", "www.kkaenam.com"];

const nextConfig: NextConfig = {
  /**
   * 새 www와 이전 도메인 둘을 정식 주소로 넘긴다. 각 문서의 경로와 질의 문자열을
   * 유지해야 기존 공유 링크와 Me 선택 상태가 그대로 열린다.
   *
   * 미들웨어 파일 대신 Next의 라우팅 계층에서 처리해 매 요청에 부담을 더하지 않는다.
   */
  async redirects() {
    return [
      /*
       * 루트를 따로 두는 이유: `:path*`가 0개 세그먼트에 매칭되면 치환이 일어나지 않고
       * 목적지에 `:path*`가 문자 그대로 남는다. www.aboutlol.com/ 같은 루트가
       * 가장 많이 입력되므로 `:path+`로 한 개 이상만 받고 루트는 분리한다.
       */
      ...REDIRECT_HOSTS.flatMap((host) => {
        const fromHost = [{ type: "host" as const, value: host }];
        return [
          {
            source: "/",
            has: fromHost,
            destination: `https://${SITE_HOST}/`,
            permanent: true,
          },
          {
            source: "/:path+",
            has: fromHost,
            destination: `https://${SITE_HOST}/:path+`,
            permanent: true,
          },
        ];
      }),
      /*
       * 매치업 문서가 챔피언당 하나로 통일되면서 주소에서 포지션이 빠졌다
       * (마이그레이션 0003). 밖으로 나간 링크가 죽지 않게 옛 주소를 넘겨준다.
       *
       * 포지션 슬러그를 하나하나 적은 것은 `/matchup/ahri/edit`처럼 **두 세그먼트인
       * 새 주소**가 여기 걸리지 않게 하기 위해서다. `:position`을 열어 두면 `edit`이
       * 챔피언으로 해석되어 편집 화면이 통째로 리다이렉트된다.
       */
      {
        source: "/matchup/:position(top|jungle|mid|adc|support)/:champion",
        destination: "/matchup/:champion",
        permanent: true,
      },
    ];
  },
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "ddragon.leagueoflegends.com",
        pathname: "/cdn/**",
      },
    ],
  },
};

export default nextConfig;

/**
 * `next dev`에서도 Cloudflare 바인딩을 쓸 수 있게 하는 개발용 훅 (@opennextjs/cloudflare).
 * 아직 바인딩이 없어 하는 일은 없지만, 나중에 KV·D1을 붙였을 때 로컬과 배포가 어긋나지 않는다.
 */
import { initOpenNextCloudflareForDev } from "@opennextjs/cloudflare";

void initOpenNextCloudflareForDev();
