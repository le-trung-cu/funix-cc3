package app.datastructs;

import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.PriorityQueue;
import java.util.StringTokenizer;

public class Graph {
  int[][] a;
  int n;

  static int INF = 9999; // 9999 is considered as infinite value
  String s1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  char[] b;

  public Graph() {
    //
  }

  // Initial adjacent matrix a[][].
  // Read file and set value into a[][].
  public void setWeights(String filename) throws IOException {
    // Read 1 line.
    String line = "";
    String s1 = "";

    StringTokenizer token;

    RandomAccessFile reader = new RandomAccessFile(filename, "r");

    line = reader.readLine();

    n = Integer.parseInt(line.trim());
    a = new int[n][n];

    for (int i = 0; i < n; i++) {
      line = reader.readLine();
      token = new StringTokenizer(line, " ");
      for (int j = 0; j < a.length; j++) {
        s1 = token.nextToken();
        if (s1.equalsIgnoreCase("INF")) {
          a[i][j] = INF;
        } else {
          a[i][j] = Integer.parseInt(s1);
        }
      }
    }

    reader.close();

  }

  // Display weights
  public void displayWeights() {
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (a[i][j] == INF) {
          System.out.print("INF");
          if (j < n - 1) {
            System.out.print("  ");
          }
        } else {
          System.out.print(a[i][j]);
          if (j < n - 1) {
            String f = "%-" + (5 - String.valueOf(a[i][j]).length()) + "s";
            System.out.printf(f, " ");
          }
        }

      }
      System.out.print("\n");
    }
  }

  void displayStep(int step, boolean[] selected, int[] dist, int[] path, int p, int[] sele, int nSele,
      boolean[] stopDisplay) {
    //
  }

  // shortest path from vertex p to vertex q
  // return 1 if find 1 shortest path, else return -1
  int dijkstra(boolean[] visited, int[] dist, int[] path, int start, int end, boolean[] stopDisplay) {
    PriorityQueue<GraphEdge> pq = new PriorityQueue<>();
    pq.add(new GraphEdge(start, start, 0));

    dist[start] = 0;
    visited[start] = true;
    String pathStr = "";

    while (!pq.isEmpty()) {
      GraphEdge current = pq.poll();
      
      pathStr += this.s1.charAt(current.end);
      
      visited[current.end] = true;

      System.out.println(pathStr);
      System.err.println(Arrays.toString(dist));

      ArrayList<Integer> neighbors = getNeighbors(current.end);
      for (Integer neighbor : neighbors) {
        int x = getEdge(current.end, neighbor);
        if (dist[neighbor] > x) {
          pq.add(new GraphEdge(current.end, neighbor, x));
          int newDist = dist[current.end] + x;
          if (newDist < dist[neighbor]) {
            dist[neighbor] = newDist;
            path[neighbor] = current.end;
          }
        }
      }
      // if current is end node, this mean find 1 shortest path, then return
      if ((int) current.end == end) {
        return 1;
      }
    }
    return -1;
  }

  // hien thi duong di
  void pathDijkstra(int[] dist, int[] path, int p, int q) {
    int preQ = q;
    MyStack<Integer> mStack = new MyStack<>();

    while (preQ != p) {
      mStack.push(preQ);
      preQ = path[preQ];
    }
    mStack.push(p);

    // print path
    System.out.println("Path: ");
    while (!mStack.isEmpty()) {
      int x = mStack.pop();
      char positionChar = this.s1.charAt(x);
      System.out.print(positionChar + " ");
    }

    System.out.println();
  }

  // dijkstra from p to q
  public void dijkstra(int p, int q) {
    int[] dist = new int[n];
    boolean[] visited = new boolean[n];
    int[] path = new int[n];
    boolean[] stopDisplay = new boolean[n];

    for (int i = 0; i < n; i++) {
      dist[i] = INF;
    }

    dijkstra(visited, dist, path, p, q, stopDisplay);
    System.out.println("The length of shortest path from A to E is " + dist[q]);

    pathDijkstra(dist, path, p, q);
    System.out.println(Arrays.toString(path));
    System.out.println(Arrays.toString(dist));
  }

  // run DFS start at position k
  public void DFS(int k) {
    boolean[] visited = new boolean[n];
    int visitedCount = 0;
    MyStack<Integer> stack = new MyStack<>();
    stack.push(k);

    // if stack not empty and not visited all node yet
    while (!stack.isEmpty() && visitedCount < n) {
      Integer current = stack.pop();

      if (!visited[current]) {
        visitedCount++;
        String step = s1.charAt(current) + (visitedCount < n ? "->" : "");
        System.out.print(step);
      }
      visited[current] = true;
      ArrayList<Integer> neighbors = getNeighbors(current);
      for (Integer i : neighbors) {
        if (!visited[i]) {
          stack.push(i);
        }
      }
    }
    System.out.print(System.lineSeparator());
  }

  ArrayList<Integer> getNeighbors(int k) {
    ArrayList<Integer> result = new ArrayList<>();
    for (int i = n - 1; i >= 0; i--) {
      if (a[k][i] != INF && k != i) {
        result.add(i);
      }
    }
    return result;
  }

  int getEdge(int i, int j) {
    return a[i][j];
  }
}