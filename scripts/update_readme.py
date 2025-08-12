# scripts/update_readme.py
# stdin으로 표 텍스트를 받고, README의 마커 사이만 치환합니다.
import sys, re, io, os

table = sys.stdin.read()

readme_path = os.path.join(os.getcwd(), "README.md")
with io.open(readme_path, "r", encoding="utf-8", newline="") as f:
    text = f.read()

pattern = re.compile(r'<!-- PROBLEM_TABLE:START -->.*?<!-- PROBLEM_TABLE:END -->', re.S)
if not pattern.search(text):
    print("MISSING")
    sys.exit(0)

replacement = "<!-- PROBLEM_TABLE:START -->\n" + table + "<!-- PROBLEM_TABLE:END -->"
new_text = pattern.sub(replacement, text)

if new_text != text:
    with io.open(readme_path, "w", encoding="utf-8", newline="") as f:
        f.write(new_text)
    print("UPDATED")
else:
    print("NOCHANGE")