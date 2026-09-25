import type { Metadata } from "next";

import { LegalPage } from "@/components/legal/LegalPage";

export const metadata: Metadata = { title: "소개" };

export default function AboutPage() {
  return (
    <LegalPage index="소개" title="ABOUTLOL은 무엇인가요">
      <p>
        ABOUTLOL은 리그 오브 레전드 상대법 커뮤니티입니다. 포지션을 고르고 상대할 챔피언을
        선택하면, 누구에게나 통하는 <strong>공통 상대법</strong>과 내가 하는 챔피언에 맞춘{" "}
        <strong>Me 상대법</strong>을 함께 볼 수 있습니다.
      </p>

      <h2>지금 할 수 있는 것</h2>
      <p>
        포지션·카테고리별로 챔피언을 찾아보고, 각 챔피언의 상대법 문서를 열람할 수 있습니다.
        문서는 이용자들이 함께 채워 가는 위키 형태이며, 로그인하면 편집을 제안할 수 있습니다.
      </p>

      <h2>계정과 편집</h2>
      <p>
        구글·카카오 계정으로 로그인할 수 있습니다. 로그인한 이용자는 문서를 편집·제안하고,
        마이페이지에서 계정 정보 확인과 회원 탈퇴를 할 수 있습니다.
      </p>

      <h2>운영자</h2>
      <p>
        ABOUTLOL은 회사가 아닌 개인 개발자가 만들고 운영하는 비공식 프로젝트입니다. 리그 오브
        레전드 및 관련 자산은 Riot Games, Inc.의 소유이며, ABOUTLOL은 Riot Games가 승인하거나
        후원하지 않습니다.
      </p>

      <h2>문의</h2>
      <p>
        서비스 관련 문의나 신고는{" "}
        <a href="mailto:taejin1472@gmail.com">taejin1472@gmail.com</a>으로 보내 주세요. 자세한
        내용은 <a href="/contact">문의 안내</a> 페이지를 참고하세요.
      </p>
    </LegalPage>
  );
}
