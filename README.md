# 📚 BOJ-Java

백준(BOJ) & solved.ac 문제 풀이 저장소 – Java 17 기반

[![Java Build & Test](https://github.com/V4N1LLA/boj-java/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/V4N1LLA/boj-java/actions/workflows/ci.yml)
[![README Stats Sync](https://github.com/V4N1LLA/boj-java/actions/workflows/readme-sync.yml/badge.svg?branch=main)](https://github.com/V4N1LLA/boj-java/actions/workflows/readme-sync.yml)
[![Docs Build & Deploy](https://github.com/V4N1LLA/boj-java/actions/workflows/pages.yml/badge.svg?branch=main)](https://github.com/V4N1LLA/boj-java/actions/workflows/pages.yml)

---

## 📌 소개
- **언어**: Java 17
- **환경**: IntelliJ IDEA Community Edition + Gradle
- **목적**: 알고리즘/자료구조 학습 및 코딩테스트 대비
- **관리 방식**: 문제 번호별 패키지(`boj/pXXXX`)로 관리  
  & GitHub Actions로 진행 현황 표 자동 업데이트  
  & MkDocs(Material)로 학습 노트 웹 문서 자동 배포

**문서 사이트**: 👉 [BOJ Java Notes](https://v4n1lla.github.io/boj-java)

---

## 🗂️ 폴더 구조
```
src/main/java/boj
├── Main.java               # 공용 테스트 엔트리 (선택)
├── p1000/
│   ├── Main.java
│   └── input.txt           # 로컬 예제 입력 (Git 제외)
├── p1920/
│   ├── Main.java
│   └── input.txt
docs/                       # MkDocs 문서
├── index.md
├── algorithms/
│   ├── time-complexity.md
│   ├── binary-search.md
│   └── bfs-dfs.md
└── problems/
    └── 01920.md
scripts/
├── update_readme.py        # README 진행 표 치환
└── new-prob.sh             # 새 문제 스캐폴드 생성
.github/workflows/
├── ci.yml                  # Gradle 빌드 체크
├── readme-sync.yml         # README 표 자동 반영
└── pages.yml               # Docs → GitHub Pages 자동 배포
```

> `input.txt`는 예제 테스트 전용이며 `.gitignore`로 제외 처리

---

## 🛠 사용 기술
- **Java 17**
- **Gradle**
- **IntelliJ IDEA Community Edition**
- **Git / GitHub**
- **GitHub Actions**
    - CI (빌드 체크)
    - README 문제 표 자동 갱신
    - MkDocs 문서 자동 배포
- **MkDocs Material** (학습 노트 사이트)

---

## ✅ 커밋 규칙
- `:sparkles: feat(boj): 1920 수 찾기 – 이분 탐색`
- `:bug: fix(boj): 1920 경계 체크 누락`
- `:memo: docs(boj): 주간 회고(1주차)`
- `:truck: chore: .gitignore 정리`
- `:construction: wip(boj): 2178 미로 탐색 – BFS 구현 중`

---

## 📊 진행 현황
<!-- PROBLEM_TABLE:START -->
| 번호 | 링크 | 메모 |
|---:|:---|:---|
| 01260 | [문서](https://v4n1lla.github.io/boj-java/problems/01260/) / [코드](src/main/java/boj/p1260/Main.java) |  |
| 01920 | [문서](https://v4n1lla.github.io/boj-java/problems/01920/) / [코드](src/main/java/boj/p1920/Main.java) |  |
<!-- PROBLEM_TABLE:END -->

---

## 🚀 실행 방법
1. 새 문제 생성:
   ```bash
   scripts/new-prob.sh 1260
    ```
2. 같은 폴더에 input.txt 작성 (예제 입력)

3. IntelliJ 실행 구성:

    - 메인 클래스: boj.pXXXX.Main

    - 입력 리디렉션: 해당 input.txt

4. Shift + F10 실행

---

## 📌 참고
- [백준 온라인 저지](https://www.acmicpc.net/)
- [solved.ac](https://solved.ac/)

---

## 🏅 solved.ac 프로필
[![Solved.ac Profile](http://mazassumnida.wtf/api/v2/generate_badge?boj=v4n1ll4)](https://solved.ac/v4n1ll4/)
