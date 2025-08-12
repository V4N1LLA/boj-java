package boj.p1920;

import java.io.*;
import java.util.*;

public class Main {
    static FastScanner fs = new FastScanner(System.in);
    static StringBuilder sb = new StringBuilder();

    public static void main(String[] args) throws IOException {
        int N = fs.nextInt();
        int[] arr = new int[N];
        for (int i = 0; i < N; i++) arr[i] = fs.nextInt();
        Arrays.sort(arr);

        int M = fs.nextInt();
        for (int i = 0; i < M; i++) {
            int target = fs.nextInt();
            sb.append(binarySearch(arr, target) ? "1\n" : "0\n");
        }
        System.out.print(sb);
    }

    static boolean binarySearch(int[] arr, int target) {
        int left = 0, right = arr.length - 1;
        while (left <= right) {
            int mid = (left + right) / 2;
            if (arr[mid] == target) return true;
            else if (arr[mid] < target) left = mid + 1;
            else right = mid - 1;
        }
        return false;
    }

    static class FastScanner {
        BufferedReader br; StringTokenizer st;
        FastScanner(InputStream is) { br = new BufferedReader(new InputStreamReader(is)); }
        String next() throws IOException {
            while (st == null || !st.hasMoreTokens()) st = new StringTokenizer(br.readLine());
            return st.nextToken();
        }
        int nextInt() throws IOException { return Integer.parseInt(next()); }
    }
}
