package app.AvLTest;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;

import org.junit.Test;

import app.datastructs.MyBSTree;

public class MyBSTreeTest {

  @Test
  public void testCase1() {
    MyBSTree<Integer> avl = new MyBSTree<>();

    avl.insert(10);
    avl.insert(8);
    avl.insert(7);
    avl.insert(6);
    avl.insert(5);
    avl.insert(4);

    avl.balance();

    ArrayList<Integer> pr;
    pr = avl.preOrder();

    assertEquals("6 4 5 8 7 10 ", arrayToString(pr));
  }

  @Test
  public void testCount() {
    MyBSTree<Integer> avl = new MyBSTree<>();
    
    avl.insert(10);
    avl.insert(10);
    avl.insert(8);
    avl.insert(7);
    avl.insert(7);
    avl.insert(6);
    avl.insert(6);
    assertEquals(4, avl.count(avl.getRoot()));
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