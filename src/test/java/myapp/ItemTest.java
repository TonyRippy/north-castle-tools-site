package myapp;

import static com.google.common.truth.Truth.assertThat;

import org.junit.Test;

public class ItemTest {
  @Test
  public void testPathParsing() {
    // Basic path parsing
    Item i = Item.forPath("/one/two/3");
    assertThat(i.toolGroupId).isEqualTo("one");
    assertThat(i.toolId).isEqualTo("two");
    assertThat(i.index).isEqualTo(3);

    // Try one with a URL-encoded path elements.
    i = Item.forPath("/Washing%2FIroning/Iron/1");
    assertThat(i.toolGroupId).isEqualTo("Washing/Ironing");
    assertThat(i.toolId).isEqualTo("Iron");
    assertThat(i.index).isEqualTo(1);
  }
}
