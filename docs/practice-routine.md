# 실전 루틴 & 명령어 모음

> “**스캐폴드 → 구현 → 기록 → 자동화**” 루틴을 습관화!

## 1) 스캐폴드 & 입력 자동

```bash
# 샘플 입력 자동 채움(기본 샘플 1)
PYTHON_BIN=py ./scripts/new-prob.sh <번호> --fetch

# 샘플 2
PYTHON_BIN=py ./scripts/new-prob.sh <번호> --fetch 2

# 실패 시 대안
./scripts/new-prob.sh <번호> --clipboard    # 브라우저에서 복사 후
./scripts/new-prob.sh <번호> --stdin <<'EOF'
(여기에 예제 입력)
EOF

# 특정 파일에서
./scripts/new-prob.sh <번호> --file ./samples/<번호>.txt
```

생성물:
- `src/main/java/boj/p<번호>/Main.java`
- `src/main/java/boj/p<번호>/input.txt` (커밋 제외)
- `docs/problems/<번호5자리>.md` (문서 스텁)

## 2) IntelliJ 실행구성 (문제별)
- **메인 클래스**: `boj.p<번호>.Main`  
- **입력 리디렉션**: `src/main/java/boj/p<번호>/input.txt`

## 3) 문서 3줄 기록 규칙
- **접근**: 핵심 아이디어/자료구조/반례 포인트 1줄  
- **복잡도**: 시간/공간 1줄(빅오)  
- **회고**: 실수 1줄(다음엔 이렇게)

## 4) 커밋 & 푸시
```bash
git add src/main/java/boj/p<번호>/Main.java docs/problems/<번호5자리>.md
git commit -m ":sparkles: feat(boj): <번호5자리> <주제> 풀이"
git push
```
- README 표/사이트 네비/문서는 GitHub Actions가 자동 반영

## 5) 자주 겪는 이슈

- **input.txt가 커밋됨** → 훅이 막음  
  ```bash
  git restore --staged src/main/java/boj/p<번호>/input.txt
  ```

- **Docs에서 새 페이지가 안 보임** → 캐시  
  - 강새로고침(Shift+Reload)  
  - `mkdocs.yml`의 `navigation.instant`를 잠시 끄고 배포

- **readme-sync 푸시 실패(비FF)**  
  - 워크플로에 rebase+retry가 있으니 보통 자동 재시도  
  - 그래도 실패 시 원격에 먼저 올라간 커밋 확인
