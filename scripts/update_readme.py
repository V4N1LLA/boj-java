#!/usr/bin/env python3
# stdin으로 표 텍스트를 받고, README의 마커 사이만 치환합니다.
import sys, re, io, os

MARK_START = "<!-- PROBLEM_TABLE:START -->"
MARK_END   = "<!-- PROBLEM_TABLE:END -->"

table = sys.stdin.read().strip() + "\n"

readme_path = os.path.join(os.getcwd(), "README.md")
with io.open(readme_path, "r", encoding="utf-8", newline="") as f:
    text = f.read()

pattern = re.compile(
    re.escape(MARK_START) + r".*?" + re.escape(MARK_END),
    re.S
)
if not pattern.search(text):
    print("MISSING")
    sys.exit(0)

replacement = f"{MARK_START}\n{table}{MARK_END}"
new_text = pattern.sub(replacement, text)

if new_text != text:
    with io.open(readme_path, "w", encoding="utf-8", newline="") as f:
        f.write(new_text)
    print("UPDATED")
else:
    print("NOCHANGE")