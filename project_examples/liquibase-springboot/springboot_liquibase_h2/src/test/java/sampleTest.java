package net.codejava;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class JUnit5ExampleTest {

    @Test
    void justAnExample() {
      System.out.println("\n\nTest successful\n\n");
    }

    @Test
  	void contextLoads() {
  	}
}
