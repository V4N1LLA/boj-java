#!/usr/bin/env python3
# BOJ 문제 페이지에서 예제 입력을 파싱하여 stdout으로 출력
# 사용: python scripts/fetch_sample.py 1260 --sample 1
import sys, argparse, time
from html import unescape

# 의존성: requests, beautifulsoup4
try:
    import requests
except ImportError:
    sys.stderr.write("requests가 필요합니다. 설치: py -m pip install --user requests\n")
    raise

try:
    from bs4 import BeautifulSoup
except ImportError:
    sys.stderr.write("beautifulsoup4가 필요합니다. 설치: py -m pip install --user beautifulsoup4\n")
    raise

UA = ("Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
      "AppleWebKit/537.36 (KHTML, like Gecko) "
      "Chrome/124.0.0.0 Safari/537.36")

BASE = "https://www.acmicpc.net"

def fetch_html(url: str) -> str:
    s = requests.Session()
    s.headers.update({
        "User-Agent": UA,
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language": "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7",
        "Referer": BASE + "/",
        "Connection": "keep-alive",
    })
    # 가끔 첫 요청이 막히면 한 번 더 시도
    for attempt in range(2):
        r = s.get(url, timeout=15)
        if r.status_code == 403 and attempt == 0:
            time.sleep(0.7)
            continue
        r.raise_for_status()
        return r.text
    # 여기에 도달하면 raise_for_status로 예외 발생
    return ""

def extract_sample(html: str, sample_no: int) -> str:
    soup = BeautifulSoup(html, "html.parser")

    # 1) <pre id="sample-input-{n}">
    pre = soup.find("pre", id=f"sample-input-{sample_no}")

    # 2) "예제 입력"/"Sample Input" 헤더 다음의 pre (n번째)
    if pre is None:
        heads = []
        for h in soup.find_all(["h2", "h3"]):
            t = (h.get_text() or "").strip().lower()
            if "sample input" in t or "예제 입력" in t:
                heads.append(h)
        if heads:
            idx = max(0, sample_no - 1)
            if idx < len(heads):
                cand = heads[idx].find_next("pre")
                if cand:
                    pre = cand

    # 3) 샘플 입력 컨테이너(div.sample-input 등) 내부 pre
    if pre is None:
        for div in soup.select("div.sample-input, div.sampledata"):
            p = div.find("pre")
            if p:
                pre = p
                break

    if pre is None:
        raise RuntimeError("샘플 입력을 찾지 못했습니다.")

    text = pre.get_text("\n")
    text = unescape(text)
    text = text.rstrip("\n") + "\n"  # 마지막 개행 1개 보장
    return text

def main():
    p = argparse.ArgumentParser()
    p.add_argument("problem", type=int, help="BOJ 문제 번호")
    p.add_argument("--sample", type=int, default=1, help="샘플 번호(기본 1)")
    args = p.parse_args()

    url = f"{BASE}/problem/{args.problem}"
    html = fetch_html(url)
    sys.stdout.write(extract_sample(html, args.sample))

if __name__ == "__main__":
    main()