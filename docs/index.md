# BOJ Java 노트

백준/solved.ac 기반 **Java 17** 코딩테스트 준비 기록.

- 개념을 *비유*로 이해하고
- 최소 템플릿으로 *바로 구현*하고
- 문제별로 *패턴/실수*를 축적합니다.

> 원칙: **이해 → 구현 → 패턴화**  
> 습관: **입력 범위**로 허용 복잡도부터 가늠하기

---

## 🔗 빠른 링크
- 저장소: https://github.com/V4N1LLA/boj-java
- solved.ac: https://solved.ac/v4n1ll4
- 진행 현황표(README): https://github.com/V4N1LLA/boj-java#-진행-현황

---

## 🚀 빠른 시작
1) **새 문제 스캐폴드**
```bash
scripts/new-prob.sh 1260
```
- 생성 위치: `src/main/java/boj/p1260/{Main.java,input.txt}`

2) **IntelliJ 실행 구성**
- 메인 클래스: `boj.p1260.Main`
- 입력 리디렉션: 해당 `input.txt`

3) **문서 기록(3줄 규칙)**
- 파일: `docs/problems/01260.md`
  - 접근 / 복잡도 / 후기 한 줄씩
- 필요하면 `mkdocs.yml`의 `nav`에 링크 추가

4) **푸시하면 자동화 동작**
- CI: Gradle 컴파일 체크
- README 표: `readme-sync`가 자동 갱신
- 문서: GitHub Pages로 자동 배포

!!! tip "작성 규칙"
문제를 풀면 `docs/problems/<번호>.md`에 **접근·복잡도·후기**를 꼭 남깁니다.  
나중에 패턴 회고와 재풀이 속도가 확 달라져요.

---

## 📚 문서 맵
- **템플릿**
  - [Java 입출력 템플릿](snippets/java-io-template.md)
- **알고리즘**
  - [시간 복잡도](algorithms/time-complexity.md)
  - [이분 탐색](algorithms/binary-search.md)
  - [DFS/BFS](algorithms/bfs-dfs.md)
- **문제 메모**
  - [BOJ 1920](problems/01920.md)

---

## 🧱 규칙/관례(요약)
- 패키지: `boj.p{문제번호}` (예: `boj.p1920.Main`)
- 커밋 예시:
  - `:sparkles: feat(boj): 1920 수 찾기 – 이분 탐색`
  - `:bug: fix(boj): 2178 경계 체크`
  - `:memo: docs(problems): 01920 회고 추가`