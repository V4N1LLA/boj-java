# 📚 BOJ-Java백준(BOJ) & solved.ac 문제 풀이 저장소 – Java 17 기반![ci](https://github.com/<USER>/boj-java/actions/workflows/ci.yml/badge.svg)
![readme-sync](https://github.com/<USER>/boj-java/actions/workflows/readme-sync.yml/badge.svg)## 📌 소개
- **언어**: Java 17
- **환경**: IntelliJ IDEA Community Edition + Gradle
- **목적**: 알고리즘/자료구조 학습 및 코딩테스트 대비
- **관리 방식**: 문제 번호별 패키지(`boj/pXXXX`)로 관리  
  & GitHub Actions로 진행 현황 표 자동 업데이트## 🗂️ 폴더 구조
````
src/main/java/boj
├── p1000/        # BOJ 1000번 문제
│   ├── Main.java
│   └── input.txt   (Git에 포함되지 않음)
├── p1920/        # BOJ 1920번 - 수 찾기
│   ├── Main.java
│   └── input.txt
└── ...
````> `input.txt`는 예제 테스트 전용이며 `.gitignore`로 제외 처리## 🛠 사용 기술
- **Java 17**
- **Gradle**
- **IntelliJ IDEA Community Edition**
- **Git / GitHub**
- **GitHub Actions** (CI + README 동기화)## :white_check_mark: 커밋 규칙
- `:sparkles: feat(boj): 1920 수 찾기 – 이분 탐색`
- `:bug: fix(boj): 1920 경계 체크 누락`
- `:memo: docs(boj): 주간 회고(1주차)`
- `:truck: chore: .gitignore 정리`
- `:construction: wip(boj): 2178 미로 탐색 – BFS 구현 중`## 📊 진행 현황
<!-- PROBLEM_TABLE:START -->
| 번호 | 링크 | 메모 |
|---:|:---|:---|
| 1920 | [문제](https://www.acmicpc.net/problem/1920) |  |
<!-- PROBLEM_TABLE:END -->## 🚀 실행 방법
1. 문제별 패키지 생성: `src/main/java/boj/pXXXX/Main.java`
2. 같은 폴더에 `input.txt` 작성 (예제 입력)
3. IntelliJ **실행 구성**:
    - 메인 클래스: `boj.pXXXX.Main`
    - 입력 리디렉션: `input.txt`
4. `Shift + F10` 실행## 📌 참고
- [백준 온라인 저지](https://www.acmicpc.net/)
- [solved.ac](https://solved.ac/)## 🏅 solved.ac 프로필
[![Solved.ac Profile](http://mazassumnida.wtf/api/v2/generate_badge?boj=v4n1ll4)](https://solved.ac/v4n1ll4/)