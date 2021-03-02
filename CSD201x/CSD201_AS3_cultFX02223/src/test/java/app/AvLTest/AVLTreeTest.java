package app.AvLTest;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;

import org.junit.Test;

import app.AVLTree;

public class AVLTreeTest {

  @Test
  public void testCase1() {
    AVLTree<Integer, Integer> avl = new AVLTree<>();

    avl.insert(9, 9);
    avl.insert(5, 5);
    avl.insert(10, 10);
    avl.insert(0, 0);
    avl.insert(6, 6);
    avl.insert(11, 11);
    avl.insert(-1, -1);
    avl.insert(1, 1);
    avl.insert(2, 2);
    ArrayList<Integer> pr;
    pr = avl.preorder();

    assertEquals("9 1 0 -1 5 2 6 10 11 ", arrayToString(pr));
    avl.remove(10);
    pr = avl.preorder();
    assertEquals("1 0 -1 9 5 2 6 11 ", arrayToString(pr));
  }

  private String arrayToString(ArrayList<Integer> arr) {
    String result = "";
    for (Integer integer : arr) {
      result += (int) integer + " ";
    }
    System.out.println(result);
    return result;
  }
}
