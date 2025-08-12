#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 || ! "$1" =~ ^[0-9]+$ ]]; then
  echo "Usage: $0 <problemNumber>"
  exit 1
fi

NUM="$1"
PAD=$(printf "%05d" "$NUM")
DIR="src/main/java/boj/p${NUM}"
MD="docs/problems/${PAD}.md"

mkdir -p "$DIR" "docs/problems"

cat > "${DIR}/Main.java" <<'JAVA'
package boj.pREPLACE;

import java.io.*;
import java.util.*;

/** BOJ pREPLACE */
public class Main {
  static class FastScanner {
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    StringTokenizer st;
    String next() throws IOException {
      while (st == null || !st.hasMoreTokens()) st = new StringTokenizer(br.readLine());
      return st.nextToken();
    }
    int nextInt() throws IOException { return Integer.parseInt(next()); }
    long nextLong() throws IOException { return Long.parseLong(next()); }
  }

  public static void main(String[] args) throws Exception {
    FastScanner fs = new FastScanner();
    // TODO: solve
  }
}
JAVA

# 패키지 치환 (macOS 호환)
sed -i.bak "s/pREPLACE/p${NUM}/g" "${DIR}/Main.java" && rm -f "${DIR}/Main.java.bak"

# 로컬 입력 파일(커밋 제외 대상)
: > "${DIR}/input.txt"

# 문제 메모 스텁
if [[ ! -f "${MD}" ]]; then
  cat > "${MD}" <<MD
# BOJ ${NUM}

- 문제: https://www.acmicpc.net/problem/${NUM}
- 코드: \`src/main/java/boj/p${NUM}/Main.java\`

## 접근
(아이디어, 자료구조, 엣지케이스)

## 복잡도
- 시간:
- 공간:

## 회고
(틀린 이유/개선 포인트)
MD
fi

echo "✔ Created: ${DIR}/{Main.java,input.txt}, ${MD}"
echo "TIP) IntelliJ: 메인=boj.p${NUM}.Main · 입력=src/main/java/boj/p${NUM}/input.txt"