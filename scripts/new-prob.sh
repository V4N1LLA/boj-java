#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage: $0 <problemNumber> [--stdin | --file <path> | --clipboard | --fetch [sampleNo]]

예)
  $0 1260                           # 빈 input.txt
  $0 1260 --stdin <<<'...text...'   # 표준입력으로 채우기
  $0 1260 --file ./samples/1260.txt # 파일로 채우기
  $0 1260 --clipboard               # 클립보드로 채우기
  $0 1260 --fetch                   # BOJ에서 샘플 입력 1 가져오기
  $0 1260 --fetch 2                 # 샘플 입력 2 가져오기
USAGE
}

if [[ $# -lt 1 || ! "$1" =~ ^[0-9]+$ ]]; then usage; exit 1; fi

NUM="$1"; shift || true
MODE="${1:-}"; ARG="${2:-}"

PAD=$(printf "%05d" "$NUM")
DIR="src/main/java/boj/p${NUM}"
MD="docs/problems/${PAD}.md"
INPUT="${DIR}/input.txt"

# Python 실행기 찾기
PYTHON_BIN="${PYTHON_BIN:-python3}"
command -v "$PYTHON_BIN" >/dev/null 2>&1 || PYTHON_BIN=python

mkdir -p "$DIR" "docs/problems"

# --- Main.java ---
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
sed -i.bak "s/pREPLACE/p${NUM}/g" "${DIR}/Main.java" && rm -f "${DIR}/Main.java.bak"

# --- docs 스텁 ---
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

# --- input.txt 작성 함수들 ---
write_from_stdin()       { cat > "$INPUT"; }
write_from_file()        { [[ -f "$1" ]] || { echo "❌ 파일 없음: $1"; exit 1; }; cat "$1" > "$INPUT"; }
write_from_clipboard() {
  if command -v pbpaste >/dev/null 2>&1; then pbpaste > "$INPUT" && return 0; fi
  if command -v xclip   >/dev/null 2>&1; then xclip -selection clipboard -o > "$INPUT" && return 0; fi
  if command -v xsel    >/dev/null 2>&1; then xsel --clipboard --output > "$INPUT" && return 0; fi
  if command -v powershell.exe >/dev/null 2>&1; then powershell.exe -NoProfile -Command "Get-Clipboard" | tr -d '\r' > "$INPUT" && return 0; fi
  echo "❌ 클립보드를 읽지 못했습니다. xclip/xsel(pbpaste) 또는 PowerShell 확인"; exit 1
}
# --- input.txt를 BOJ에서 자동으로 채우기 (--fetch) ---
write_from_fetch() {
  local sample="${1:-1}"

  # 의존성 점검: requests, bs4
  if ! "$PYTHON_BIN" - <<'PY' >/dev/null 2>&1
import importlib.util, sys
ok = all(importlib.util.find_spec(m) is not None for m in ("requests","bs4"))
sys.exit(0 if ok else 1)
PY
  then
    echo "Installing dependencies: requests, beautifulsoup4 ..."
    "$PYTHON_BIN" -m pip install --user --disable-pip-version-check -q requests beautifulsoup4 || {
      echo "❌ 의존성 설치 실패. 수동 설치: py -m pip install --user requests beautifulsoup4"; exit 1; }
  fi

  # 임시 파일로 먼저 받고, CR 제거해 최종 파일에 기록
  local tmp
  tmp="$(mktemp)"
  "$PYTHON_BIN" -u "scripts/fetch_sample.py" "$NUM" --sample "$sample" > "$tmp"
  tr -d '\r' < "$tmp" > "$INPUT"
  rm -f "$tmp"
}

# --- 입력 모드 처리 ---
case "$MODE" in
  --stdin)        write_from_stdin ;;
  --file)         shift || true; write_from_file "${ARG:-${1:-}}" ;;
  --clipboard)    write_from_clipboard ;;
  --fetch)        shift || true; write_from_fetch "${ARG:-1}" ;;
  "" )            : > "$INPUT" ;;  # 기본: 빈 파일
  * )             usage; exit 1 ;;
esac

# 입력 작성 로직 뒤, 출력부를 이렇게 교체
if [ -s "$INPUT" ]; then
  status="(filled)"
else
  status="(empty)"
fi

echo "✔ Created:"
echo "  - ${DIR}/Main.java"
echo "  - ${INPUT} ${status}"
echo "  - ${MD}"
echo "TIP) IntelliJ: 메인=boj.p${NUM}.Main · 입력=${INPUT}"