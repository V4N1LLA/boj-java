#!/usr/bin/env bash
set -euo pipefail
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <problemNumber>"
  exit 1
fi

NUM="$1"
DIR="src/main/java/boj/p${NUM}"
mkdir -p "$DIR"

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
    String nextLine() throws IOException { return br.readLine(); }
  }

  public static void main(String[] args) throws Exception {
    FastScanner fs = new FastScanner();
    // TODO: solve
  }
}
JAVA

# 패키지 치환
sed -i "s/pREPLACE/p${NUM}/g" "${DIR}/Main.java" 2>/dev/null || \
perl -0777 -pe "s/pREPLACE/p${NUM}/g" -i "${DIR}/Main.java"

# 로컬 입력 파일
: > "${DIR}/input.txt"

echo "Created: ${DIR}/Main.java + input.txt"