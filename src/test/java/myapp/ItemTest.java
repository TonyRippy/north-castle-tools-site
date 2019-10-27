package myapp;

import static com.google.common.truth.Truth.assertThat;

import org.junit.Test;

public class ItemTest {
  @Test
  public void testPathParsing() {
    // Basic path parsing
    Item i = Item.forPath("/boo/hoo/2");
    assertThat(i.toolGroupId).isEqualTo("boo");
    assertThat(i.toolId).isEqualTo("hoo");
    assertThat(i.index).isEqualTo(2);
  }
}
