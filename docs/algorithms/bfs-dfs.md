# DFS / BFS

## 차이
- DFS: 한 길로 깊게 (스택/재귀)
- BFS: 가까운 것부터 넓게 (큐, 최단거리)

## 공통 포인트
- 인접 리스트 정렬(문제 요구 시)
- visited 배열로 중복 방지

```java
import java.util.*;

List<Integer>[] g; boolean[] v;

void dfs(int s){
  v[s]=true; visit(s);
  for(int nx: g[s]) if(!v[nx]) dfs(nx);
}

void bfs(int s){
  Queue<Integer> q=new ArrayDeque<>();
  v[s]=true; q.add(s);
  while(!q.isEmpty()){
    int cur=q.poll(); visit(cur);
    for(int nx: g[cur]) if(!v[nx]){ v[nx]=true; q.add(nx); }
  }
}
```
