package boj.p1260;

import java.io.*;
import java.util.*;

/** BOJ p1260 */
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
