package app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.junit.Test;

import app.datastructs.MyBSTree;

public class MyPersonServiceTest {
  @Test
  public void Test1() {
    MyBSTree<Person> tree = new MyBSTree<>();
    MyPersonService service = new MyPersonService(tree);

    Person p1, p4, p2, p3, p5;

    p1 = new Person("1", "Ha", "Ha noi", "12/09/90");
    service.insert(p1);

    p4 = new Person("4", "Lan", "Ha noi", "04/04/87");
    service.insert(p4);

    p2 = new Person("2", "An", "Nam Dinh", "1/1/1111");
    service.insert(p2);

    p3 = new Person("3", "Binh", "TH", "01/05/92");
    service.insert(p3);

    p5 = new Person("5", "Tuan", "TB", "02/02/89");
    service.insert(p5);

    System.out.println("Choice 2 (in order):");
    service.inOrder();

    System.out.println("Choice 3 ( Breadth-First Traversal)");
    service.BFT();

    System.out.println("Choice 4 Search ID: 3");
    Person searchPerson = service.search("3");
    assertEquals(p3, searchPerson);
    System.out.println(searchPerson.toString());

    System.out.println("Choice 5 Delete ID: 5");
    service.delete("5");

    System.out.println("Choice 2 Inorder traverse:");
    service.inOrder();

    System.out.println("Choice 6 Balancing Binary Search Tree:");
    service.balance();

    System.out.println("Choice 2 Inorder traverse:");
    service.inOrder();

    System.out.println("Choice 3 ( Breadth-First Traversal)");
    service.BFT();
  }

  @Test
  public void Test2() throws IOException {
    final File expected = new File("xyz.txt");
    final File output = new File("test", "xyz.txt");

    assertTrue(FileUtils.contentEquals(expected, output));
    MyBSTree<Person> tree = new MyBSTree<>();
    MyPersonService service = new MyPersonService(tree);

    Person p1, p4, p2, p3, p5;

    p1 = new Person("1", "Ha", "Ha noi", "12/09/90");
    service.insert(p1);

    p4 = new Person("4", "Lan", "Ha noi", "04/04/87");
    service.insert(p4);

    p2 = new Person("2", "An", "Nam Dinh", "1/1/1111");
    service.insert(p2);

    p3 = new Person("3", "Binh", "TH", "01/05/92");
    service.insert(p3);

    p5 = new Person("5", "Tuan", "TB", "02/02/89");
    service.insert(p5);

    System.out.println("Choice 2 (in order):");
    Iterator<Node<Person>> iterator = tree.iteratorInOrder();
    while (iterator.hasNext()) {
      Node<Person> current = iterator.next();
      System.out.println(current.value.toString());
    }
  }
}
