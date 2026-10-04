# ABOUTLOL ImageGen Prompts — UNDERCITY GRAFFITI (Arcane 테마 후보)

생성 방식: ChatGPT 이미지 생성 (GPT)
기준 문서: [`../../DESIGN_ARCANE.md`](../../DESIGN_ARCANE.md) v0.3

| 버전 | 결과 |
| --- | --- |
| v1 | 황동·양피지 중심 → 스팀펑크 RPG UI로 나옴 (이미지 삭제) |
| v2 | 주황 나트륨등·세밀한 유화 → `lane-selection-arcane-v2.png`. 배경이 날카롭고 페인트가 자글자글함 |
| **v3** | 하늘색·분홍 + 초록 자운, 굵고 단순한 애니메이션 면. 사용자 레퍼런스 `Arcane_reference1.jpg`, `Arcane_reference2.jpg` 기준 |

## 사용 방법

1. **새 대화에서 시작한다.** v2 대화에 이어 쓰면 이전 그림의 주황·세밀한 화풍이 따라온다.
2. **0번(무드 키 비주얼)을 먼저 만든다.** `Arcane_reference1.jpg`, `Arcane_reference2.jpg`를 함께 올린다.
   화풍이 잡힐 때까지 여기서 반복한다.
3. **같은 대화에서** 1번·2번을 이어서 요청한다. 레퍼런스 2장은 대화에 남아 있으니 다시 올리지 않아도 된다.
4. 첫 줄의 `STYLE ANCHOR`는 작품명을 쓴 문장이다. 거절되면 그 줄만 지우고 다시 보낸다.
5. 참조 이미지
   - 1번: `public/images/Mundo.jpg`, `Warwick.jpg`, `Viktor.jpg`, `Jinx.jpg`, `Renata.jpg`를 이 순서로 올린다
     (탑·정글·미드·원딜·서폿 대표 표지 — 다섯 모두 자운 출신이라 배경과 이야기가 맞는다).
   - 2번: 아리 로딩 아트(`https://ddragon.leagueoflegends.com/cdn/img/champion/loading/Ahri_0.jpg`)를 올린다.
6. 한글이 깨지면 "Keep everything, fix only the Korean text to exactly: …"로 글자만 고친다.
7. 결과는 `lane-selection-arcane-v3.png`, `ahri-matchup-arcane-v3.png`로 이 폴더에 저장한다.

## 0. 무드 키 비주얼 (UI 없음)

```text
STYLE ANCHOR: in the visual style of the animated series Arcane — Jinx and the undercity of Zaun.

The two attached images are style references only. Match their look: bold animated-series graphic style with large simple shapes, 2-3 value cel-like shading, soft painted forms, chunky rounded smoke clouds, flat explosion bursts and thick diagonal speed lines (reference 1), and a wall covered in big chunky chalk graffiti doodles (reference 2).

Create a 16:9 key-art background frame of an empty Zaun undercity street, used only as a style target for a website redesign. No characters.

Shape language (most important): big simple silhouettes, few details, soft out-of-focus background. Not photorealistic, not sharp, not finely detailed, not gritty, not steampunk. It should read like a frame from a stylized animated film, not a detailed illustration.
Color: toxic chemical green haze fills the air and background (deep #1E4A35 and lighter #2F7A4E), simplified tower and pipe silhouettes fading into the green. Dark green-black base #0B1613. The two hero colors are sky blue #4FBDF2 and hot pink #FF4DA6: a flat pink-and-sky-blue explosion burst with thick diagonal speed lines in one corner, and rounded chunky smoke clouds in dark indigo #2A2546 / #3E3766 rolling across the bottom.
Graffiti: on one wall, big bold chalk doodles in sky blue, pink and white — a grinning monkey face, X-eyed smiley, puffy cloud, explosion star, scribbled circle, arrow, heart. Thick strokes, large and readable, not tiny scribbles.
Paint drips: only a few thick drips with round blobby ends. No fine dripping, no splatter dust.
Avoid: orange or sodium-yellow lights, brass, gears, parchment, sharp brick textures, fine grain, scratchy surfaces, many thin paint drips, smooth digital gradients, glassmorphism, text, logos, watermarks, copying the reference characters.
```

## 1. 라인 선택 화면 (라인 표지 5장 + 티어순 챔피언 목록)

> 라인 대표 표지 5장이 곧 라인 선택이고, 표지를 누르면 그 라인 챔피언이 **티어 내림차순 목록**으로
> 아래에 펼쳐진다. 목업은 미드가 선택된 상태다. 목록의 챔피언·티어는 조판 확인용 예시다.

```text
STYLE ANCHOR: in the visual style of the animated series Arcane — Jinx and the undercity of Zaun.

Use the exact style of the previous key-art image and the two style references: large simple shapes, 2-3 value shading, soft out-of-focus green Zaun background, chunky rounded smoke clouds, flat sky-blue and pink explosion bursts, big chunky chalk graffiti, a few thick round-ended drips. Now design a high-fidelity 16:9 desktop website mockup in that world. UI elements stay crisp and readable on top.

Page: the lane selection page of the Korean League of Legends strategy site "ABOUTLOL". Five lane cover posters ARE the lane selector; clicking one drops a tier-sorted champion list below it. Shown state: the mid lane is selected.
Input images: Image 1 Dr. Mundo (top), Image 2 Warwick (jungle), Image 3 Viktor (mid), Image 4 Jinx (bot), Image 5 Renata Glasc (support). All five come from the undercity of Zaun. Keep every artwork recognizable and unrepainted; crop each into a tall poster around the champion's face and upper body (Warwick: his snarling head on the right side of the image; Viktor: masked head and raised staff; Jinx: face and braids; Renata: masked face and white collar); only soften the outer edges with a thick brush-stroke mask.

Layout:
- 72px header on a plain dark green-black bar (#0B1613): "ABOUTLOL" on the left, menu "홈", "챔피언", "위키", "티어표", "강의", "마이페이지", and a simple bell icon at the far right. "챔피언" is active: a solid sky-blue (#4FBDF2) tab with dark text and a soft glow.
- Background behind the top area: soft green toxic haze with simplified out-of-focus Zaun silhouettes and dark indigo smoke clouds rolling along the bottom of the posters.
- Compact headline "누굴 상대해?" in heavy angular Korean letters, chalk white (#F1EEF4), painted with one bold brush, smooth edges; a thick pink chalk circle doodled around the question mark. Small mono text "LANE / PATCH / TIER" to its right.
- One row of five tall equal-height posters, left to right: Mundo "탑", Warwick "정글", Viktor "미드", Jinx "원딜", Renata "서폿". Widths on a 12-column grid: Viktor 4 columns, the others 2 columns each. Bold brush-shaped edges with a few large curves, never rounded cards.
- Each lane label is a big chalk-white word overlapping the poster bottom, with one thick chalk-white brush underline. Only the selected "미드" has a sky-blue underline.
- Selected Viktor poster: sky-blue outline with a soft glow; behind it a flat sky-blue-and-pink explosion burst with a few thick diagonal speed lines; 3 to 5 thick sky-blue paint drips with round blobby ends run down from its bottom edge into the list below. Unselected posters sink slightly into the green haze but stay readable.
- Chalk graffiti, 3 doodles only, big and bold, never over faces or labels: a pink crown on the Viktor poster corner, a sky-blue arrow pointing down toward the list, a white grinning monkey face near the Jinx poster corner.
- Below, a list panel in plain dark green-black (#13241F), with a maximum width so rows do not stretch across the whole screen; the area to its right shows the soft green haze and smoke. Title "미드 · 티어순" in chalk white, small note "높은 티어부터". A vertical list, not cards: a tall tier letter column on the left ("S", then "A", then "B"), and one thin ruled row per champion with a 48px square icon and the Korean name. Rows: under "S" "아리", "오리아나"; under "A" "아칼리", "사일러스", "빅토르"; under "B" "제드", cut off by the bottom edge to suggest scrolling. The "S" letter is sky blue, "A" and "B" chalk white. The "오리아나" row shows a keyboard focus ring: a white 3px outline with a thin dark gap.

Color: dark green-black #0B1613 / #13241F, toxic green haze #1E4A35 / #2F7A4E only in the background, indigo smoke #2A2546 / #3E3766, chalk white #F1EEF4, sky blue #4FBDF2 for the current selection, hot pink #FF4DA6 for graffiti accents. No orange.
Text (verbatim): "ABOUTLOL", "홈", "챔피언", "위키", "티어표", "강의", "마이페이지", "누굴 상대해?", "LANE / PATCH / TIER", "탑", "정글", "미드", "원딜", "서폿", "미드 · 티어순", "높은 티어부터", "S", "A", "B", "아리", "오리아나", "아칼리", "사일러스", "빅토르", "제드"
Constraints: no browser chrome, no watermark, no show logo or title; feasible in HTML/CSS; Korean text crisp; the list reads clearly as one descending tier list.
Avoid: orange or sodium lights, brass, gears, parchment, sharp detailed brick alley, scratchy textures, film grain, many thin drips, splatter dust, different underline colors per lane, a "MID" tag on every row, rows stretched across the full width, smooth digital gradients, glassmorphism, rounded SaaS cards, graffiti over faces, labels or list text.
```

## 2. 아리 상대법 화면

```text
STYLE ANCHOR: in the visual style of the animated series Arcane — Jinx and the undercity of Zaun.

Use the exact style of the previous images: large simple shapes, 2-3 value shading, soft green Zaun haze, chunky indigo smoke clouds, flat sky-blue and pink explosion bursts, big chunky chalk graffiti, a few thick round-ended drips. Now design the champion matchup page of the same website as a high-fidelity 16:9 desktop mockup. The reading panel is clean and calm.

Input image: Image 1 is Ahri's official vertical loading art. Use it unchanged and unrepainted; only soften its left edge into the green haze with a thick brush mask and add a thin sky-blue rim light on its right edge.

Layout:
- Same header as before, "챔피언" active in sky blue.
- Left Aside (about 30% width): soft green haze with simplified Zaun silhouettes and indigo smoke clouds at the bottom. Ahri's art offset slightly right. Enormous sky-blue Korean text "아리" painted with one bold brush, partly behind the art, plus a small readable label "아리". At the bottom, four square ability icons labeled Q, W, E, R with thick brush frames and small sky-blue mono cooldowns "7s", "9s", "12s", "130s". Under them, a small dark note with a white left rule: "E · 매혹" and "적중하면 이동을 막아요."
- Right Main (about 70% width): plain dark green-black reading panel (#13241F), chalk-white text, no texture. Tabs "빌드", "아리", "상대법", "영상" attached to the top of the panel; "상대법" active in solid sky blue with dark text. Below, a dark combobox labeled "내 챔피언 선택" showing "트위스티드 페이트".
- Section 01 (shared advice): large number "01", a chalk-white vertical rule, label "공통", headings "매혹이 빠진 12초가 핵심" and "라인을 짧게 유지해요" with short Korean paragraphs. No accent color.
- Section 02 (personal advice): dark plum background (#2B1426), hot-pink vertical rule, large "02", a big hand-drawn pink chalk label "Me · 트위스티드 페이트" with a small flat pink explosion shape behind it and 2 or 3 thick pink drips with round ends, a small tag "현재 선택", heading "골드 카드로 진입을 끊기" and a short Korean paragraph. Distinguishable from section 01 by background, rule and label.
- In the margin outside the panel, one big white chalk doodle of a grinning monkey face. No doodles inside the reading text.

Color: dark green-black #0B1613 / #13241F, toxic green haze only in the Aside background, indigo smoke #2A2546 / #3E3766, chalk white #F1EEF4, sky blue #4FBDF2 for current selection and the giant name, hot pink #FF4DA6 and plum #2B1426 only for the personal section. No orange.
Text (verbatim): "ABOUTLOL", "홈", "챔피언", "위키", "티어표", "강의", "마이페이지", "아리", "Q", "W", "E", "R", "7s", "9s", "12s", "130s", "E · 매혹", "적중하면 이동을 막아요.", "빌드", "상대법", "영상", "내 챔피언 선택", "트위스티드 페이트", "01", "02", "공통", "Me · 트위스티드 페이트", "현재 선택", "매혹이 빠진 12초가 핵심", "라인을 짧게 유지해요", "골드 카드로 진입을 끊기"
Constraints: no browser chrome, no watermark, no show logo or title; the art stays inside the Aside; feasible in HTML/CSS; body text comfortable to read.
Avoid: orange, brass, gears, parchment, sharp detailed backgrounds, scratchy textures, film grain, many thin drips, white text on pink, repainting Ahri, smooth digital gradients, glassmorphism, rounded SaaS cards, graffiti over body text.
```

## 3. 서비스용 배경 에셋 (v3 목업 채택 후)

`lane-selection-arcane-v3.png`의 배경을 실제 사이트에 쓰기 위한 원본 에셋이다. 목업 이미지는
UI가 그림에 박혀 있고 해상도가 1672×941이라 잘라 쓸 수 없다. **v3 목업을 만든 대화에서 이어서**
요청해야 같은 화풍이 나온다.

| 레이어 | 형식 | 구현 |
| --- | --- | --- |
| 3-1 원경 (자운 실루엣 + 초록 연무) | 불투명 WebP, 데스크톱 2560×1440 / 모바일 1080×1920 | 페이지 바탕 `background-image`, `image-set`으로 해상도 분기 |
| 3-2 연기 덩어리 띠 | 투명 PNG → WebP | 포스터 아래·목록 뒤에 겹치는 별도 레이어 |
| 3-3 낙서 스티커 시트 | 투명 PNG → 개별로 잘라 WebP 또는 SVG로 다시 그림 | 왕관·화살표·원숭이 등 `aria-hidden` 장식 |

### 3-1 원경

```text
Using the exact background art style, palette and lighting of the lane-selection mockup we just made, create ONLY the background plate as a clean standalone image, with no UI at all.

Size: wide 16:9, as large as possible (target 2560×1440).
Content: the soft out-of-focus toxic-green Zaun undercity — simplified tower, bridge and pipe silhouettes, green chemical haze (#1E4A35 / #2F7A4E), a few tiny pink and sky-blue window lights, dark green-black (#0B1613) toward the left and bottom edges.
Composition for a website: the left 60% and the bottom 45% must be calm, dark and low-detail because posters, text and a list panel will sit there; the most interesting silhouettes go in the upper-right area. No strong focal object in the center. The left and right edges should be tileable-looking so the image can be cropped for wider or narrower screens.
Style: large simple shapes, 2-3 value shading, soft painted forms, no fine detail, no sharp edges, no grain.
Do not include: any text, letters, logos, header, buttons, posters, characters, graffiti, smoke clouds in the foreground, paint drips, explosion bursts, watermark.
```

모바일용은 같은 대화에서 이어서:

```text
Now make a vertical 9:16 version (target 1080×1920) of the same background plate, same style and palette. Keep the top 40% for the more interesting silhouettes and make the lower 60% calm, dark and low-detail. No text, UI, characters, smoke clouds or graffiti.
```

### 3-2 연기 덩어리 띠

```text
Using the same style, create ONLY a horizontal band of chunky rounded smoke clouds on a fully transparent background (PNG with alpha).

Size: very wide strip, target 2560×640.
Smoke: big puffy rounded cloud silhouettes with 2-3 flat value steps in dark indigo (#2A2546 / #3E3766) and a faint violet rim on top edges, like the smoke in the mockup. Dense along the bottom edge, breaking into separate puffs toward the top, fully transparent above. Edges are soft-painted but clearly shaped, not blurry fog.
Do not include: background scenery, text, characters, graffiti, glow, watermark. The background must be transparent, not black or checkerboard.
```

### 3-3 낙서 스티커 시트

```text
Using the same chalk graffiti style as the mockup, create a sticker sheet of separate doodles on a fully transparent background (PNG with alpha), each doodle clearly separated with empty space around it, arranged in a loose 3×3 grid.

Doodles (thick chunky chalk strokes, single flat color each, slightly rough edges):
1. pink (#FF4DA6) crown
2. sky-blue (#4FBDF2) arrow pointing down-left
3. white (#F1EEF4) grinning monkey face
4. pink circle scribble (to circle a word)
5. sky-blue X-eyed smiley face
6. white puffy cloud
7. pink explosion star
8. sky-blue heart
9. white wavy underline scribble

Do not include: text, letters, background, shadows, glow, watermark. Transparent background, not black or checkerboard.
```

## 4. 홈 — 필트오버 (위의 도시)

> 홈(`/`)만 **필트오버**로 칠해 나머지 자운 화면과 대비를 만든다. 필트오버는 Arcane의 위쪽 도시다 —
> 노을빛 황금 하늘, 흰 대리석과 금 장식의 우아한 건물, 비행선, 시계탑, 마법공학의 맑은 하늘색 빛.
>
> **v1의 실패를 반복하지 않는다.** v1은 황동 판·리벳·양피지를 *UI 틀*로 써서 스팀펑크 RPG가 됐다.
> 필트오버는 녹슨 금속이 아니라 **밝고 깨끗하고 우아한 도시**다. 금은 가는 장식선으로만 쓰고,
> UI 면은 깨끗한 상아색, 그림체는 자운과 같은 굵고 단순한 애니메이션 면이다.
>
> 색 역할은 사이트 전체와 같다: 하늘색 `#4FBDF2` = 지금 고른 것, 라임 `#D8FF3E` = 길잡이(홈에서는 거의 쓰지 않음),
> 분홍 `#FF4DA6` = Me(홈에는 없음). 필트오버 고유색은 상아·금·남색이다.

### 사용 방법

1. **새 대화에서 시작한다.** 자운 대화에 이어 쓰면 초록 연무가 따라온다.
2. 4-0 무드 이미지를 먼저 만든다. `Arcane_reference1.jpg`를 함께 올리면 그림체(큰 면, 2~3단 명암)가 맞는다.
   이 레퍼런스는 그림체만 참고하라고 지시해 두었다 — 색은 따라가지 않는다.
3. 같은 대화에서 4-1 홈 목업, 이어서 4-2 배경 에셋을 요청한다.
4. 결과는 `home-piltover-v1.png`로 이 폴더에 저장한다.

### 4-0 무드 키 비주얼 (UI 없음)

```text
STYLE ANCHOR: in the visual style of the animated series Arcane — the upper city of Piltover.

The attached image is a reference for the drawing style only (large simple shapes, 2-3 value cel-like shading, soft painted forms, bold graphic silhouettes). Do NOT copy its colors or subject.

Create a 16:9 key-art frame of Piltover at golden hour, used only as a style target for a website redesign. No characters.

Shape language (most important): big simple silhouettes, few details, soft out-of-focus distance, clean elegant forms. It should read like a frame from a stylized animated film. Not photorealistic, not finely detailed, not gritty, not steampunk.
Scene: a bright city of white marble and cream stone with slender gold trims and art-nouveau curves, a tall clock tower, domed academy buildings, arched bridges, one or two elegant airships far away, a wide sky. The view looks out over the city from a high terrace; the lower part of the frame is calm open sky and soft clouds.
Light and color: warm golden-hour sunlight from the upper right, ivory and cream buildings (#F4ECDD, #E9DCC3), warm gold highlights (#E2B24C), soft peach and pale sky-blue sky, long cool navy shadows (#14283A, #2A4A66). A few small clear sky-blue (#4FBDF2) glows of magical technology in windows and street lamps — crisp and small, not glowing orbs.
Mood: optimistic, wealthy, orderly, elegant — the opposite of a dark polluted undercity.
Avoid: green haze, toxic smoke, graffiti, rust, brass gears, rivets, pipes as the main motif, parchment, medieval fantasy castle, smooth digital gradients, lens flare, glassmorphism, text, logos, watermarks.
```

### 4-1 홈 화면 목업

```text
STYLE ANCHOR: in the visual style of the animated series Arcane — the upper city of Piltover.

Use the exact style and lighting of the previous Piltover key-art image. Now design a high-fidelity 16:9 desktop website mockup of the HOME page of the Korean League of Legends strategy site "ABOUTLOL". UI elements stay crisp and readable on top of the painting.

Art style (most important): the upper part of the page is a bright painted Piltover skyline at golden hour (large simple shapes, 2-3 value shading, soft distance). The content area below sits on clean ivory surfaces. Gold appears only as thin elegant art-nouveau linework: corner flourishes, thin double rules, a small clock-face ornament. Not steampunk: no brass plates, no rivets, no gears, no parchment, no scrolls.

Layout:
- 72px header on a dark navy-black bar (#0B1613): "ABOUTLOL" on the left, menu "홈", "챔피언", "위키", "티어표", "강의", "마이페이지", and a simple bell icon on the right. "홈" is active: a solid sky-blue (#4FBDF2) tab with dark text.
- Hero over the skyline: small mono label "01 / ABOUTLOL HOME", a huge heading "HOME" in heavy geometric letters, ivory (#F4ECDD) with a thin gold inline and a deep navy drop shadow, and one line of Korean body text below: "지난 판의 기록에서 다음 상대법으로. 최근 20경기의 데스와 분당 CS를 읽고, 어려웠던 상대를 다시 봅니다." A small ticket label "MATCH ARCHIVE / KR" in sky blue with dark text.
- Content grid below the hero, asymmetric: a narrow left column (about 25%) and a wide right column (about 75%).
- Left column, an ivory panel with a thin gold double rule: mono label "01 / MY PLAYERS", heading "즐겨찾는 소환사", short text "검색한 Riot ID를 저장하면 이 브라우저에서 바로 다시 열 수 있습니다." and two saved player rows, each with a round profile icon, a Riot ID like "Hide on bush#KR1" and a small rank label.
- Right column, top: a wide ivory search panel. Mono label "02 / PLAYER LOOKUP", heading "누구의 전적을 볼까?", a field labeled "Riot ID" with placeholder "게임 이름#태그", and a solid sky-blue button "전적 찾기" with dark text and a hard navy offset shadow. Helper text "게임 내 Riot ID를 #까지 포함해 입력해 주세요. 한국 서버 전적만 조회합니다."
- Right column, below: mono label "03 / NEXT MATCHUP", heading "패배한 상대, 다음엔 다르게", and a ruled list (not cards) of 4 rows; each row has a 48px champion icon, a Korean champion name ("제드", "아리", "카타리나", "르블랑") and a short line like "탈론으로 상대함 · 2패". Thin gold dividers between rows.
- Panels have nearly square corners, thin navy outlines and a 6px hard navy offset shadow. No rounded SaaS cards.

Color: ivory #F4ECDD and cream #E9DCC3 surfaces, deep navy #14283A text and outlines, gold #E2B24C only for thin ornament lines, sky blue #4FBDF2 only for the active menu, the button and the ticket label, golden-hour peach and pale-blue sky in the painted skyline.
Text (verbatim): "ABOUTLOL", "홈", "챔피언", "위키", "티어표", "강의", "마이페이지", "01 / ABOUTLOL HOME", "HOME", "지난 판의 기록에서 다음 상대법으로. 최근 20경기의 데스와 분당 CS를 읽고, 어려웠던 상대를 다시 봅니다.", "MATCH ARCHIVE / KR", "01 / MY PLAYERS", "즐겨찾는 소환사", "02 / PLAYER LOOKUP", "누구의 전적을 볼까?", "Riot ID", "게임 이름#태그", "전적 찾기", "03 / NEXT MATCHUP", "패배한 상대, 다음엔 다르게", "제드", "아리", "카타리나", "르블랑"
Constraints: no browser chrome, no watermark, no show logo or title; feasible in HTML/CSS; Korean text crisp; body text dark navy on ivory for comfortable reading.
Avoid: green haze, graffiti, paint drips, toxic smoke, rust, brass plates, rivets, gears, parchment, scrolls, medieval fantasy frames, glowing orbs, hexagon crystals, smooth digital gradients, glassmorphism, rounded SaaS cards, gold body text.
```

### 4-2 서비스용 배경 에셋

목업이 마음에 들면 **같은 대화에서** 이어서 요청한다. 자운 3장과 같은 레이어 구성이다.

| 레이어 | 형식 | 구현 |
| --- | --- | --- |
| 원경 (필트오버 스카이라인) | 불투명, 데스크톱 16:9 / 모바일 9:16 | 홈 상단 배경 |
| 구름 띠 | 투명 PNG | 히어로와 본문 사이를 받치는 레이어 (자운의 연기 띠 자리) |
| 금 장식 시트 | 투명 PNG | 패널 모서리 장식·시계 문양 |

원경:

```text
Using the exact background art style, palette and lighting of the home mockup we just made, create ONLY the Piltover skyline background plate as a clean standalone image with no UI at all.

Size: wide 16:9, as large as possible.
Content: golden-hour Piltover — ivory and cream buildings with thin gold trims, clock tower, domes, arched bridges, one distant airship, peach and pale-blue sky, a few tiny sky-blue magical-technology window lights.
Composition for a website: the top-left area and the whole bottom 45% must be calm, low-detail sky or soft cloud because a heading and content panels sit there; the most interesting buildings go along the right side and the middle band. No strong focal object in the center.
Style: large simple shapes, 2-3 value shading, soft painted forms, no fine detail, no sharp edges, no grain.
Do not include: any text, letters, logos, header, buttons, panels, characters, ornaments, watermark.
```

모바일용:

```text
Now make a vertical 9:16 version of the same background plate, same style and palette. Put the clock tower and the most interesting buildings in the top 40%, and keep the lower 60% calm soft sky and clouds. No text, UI or characters.
```

구름 띠:

```text
Using the same style, create ONLY a horizontal band of soft golden-hour clouds on a fully transparent background (PNG with alpha).

Size: very wide strip, about 5:2.
Clouds: big rounded cloud silhouettes with 2-3 flat value steps — warm ivory (#F4ECDD) tops lit by the sun, peach mid-tones, soft lavender-blue undersides — dense along the bottom edge and breaking into separate puffs toward the top, fully transparent above. Clearly shaped, not blurry fog.
Do not include: buildings, text, characters, glow, watermark. The background must be transparent, not black, white or checkerboard.
```

금 장식 시트:

```text
Using the same elegant style, create a sheet of separate gold ornaments on a fully transparent background (PNG with alpha), each clearly separated with empty space around it, arranged in a loose 3×3 grid. Single flat gold #E2B24C with a slightly darker gold #B8862C for depth, thin elegant art-nouveau linework.

1. top-left panel corner flourish
2. top-right panel corner flourish (mirror of 1)
3. small clock face with tick marks (no readable numbers)
4. thin horizontal divider with a small center diamond
5. small sun emblem
6. airship silhouette
7. laurel-like swirl
8. thin double-rule section underline
9. small four-point sparkle ornament

Do not include: text, letters, numbers, background, shadows, glow, rust, rivets, gears, watermark. Transparent background, not black, white or checkerboard.
```
