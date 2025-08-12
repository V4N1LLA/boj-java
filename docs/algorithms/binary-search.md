# 이분 탐색(Binary Search)

## 언제?
- **오름차순 정렬**되어 있고 포함/위치 확인이 목표일 때

## 생활 비유
전화번호부를 가운데부터 펴서 절반씩 버린다 → O(log N)

## 구현
```java
static boolean binarySearch(int[] a, int x) {
  int l = 0, r = a.length - 1;
  while (l <= r) {
    int m = (l + r) >>> 1; // overflow 안전
    if (a[m] == x) return true;
    if (a[m] < x) l = m + 1;
    else r = m - 1;
  }
  return false;
}
