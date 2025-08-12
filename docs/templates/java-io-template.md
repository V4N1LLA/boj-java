``````
import java.io.*;
import java.util.*;

public class Main {
public static void main(String[] args) throws Exception {
BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
StringBuilder sb = new StringBuilder();
StringTokenizer st;

        int n = Integer.parseInt(br.readLine());
        st = new StringTokenizer(br.readLine());

        int[] a = new int[n];
        for (int i = 0; i < n; i++) a[i] = Integer.parseInt(st.nextToken());

        // 배열을 한 번이라도 읽어서 사용하면 IntelliJ 경고가 사라집니다.
        long sum = 0;
        for (int v : a) sum += v;

        sb.append(sum).append('\n');  // 필요시 다른 출력으로 교체
        System.out.print(sb);
    }
}