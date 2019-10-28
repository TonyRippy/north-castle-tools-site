package myapp;

import static com.google.common.truth.Truth.assertThat;

import org.junit.Test;

public class ToolTest {
  @Test
  public void testPathParsing() {
    // Basic path parsing
    Tool t = Tool.forPath("/one/two");
    assertThat(t.toolGroupId).isEqualTo("one");
    assertThat(t.id).isEqualTo("two");

    // Try one with a URL-encoded path elements.
    t = Tool.forPath("/Washing%2FIroning/Iron");
    assertThat(t.toolGroupId).isEqualTo("Washing/Ironing");
    assertThat(t.id).isEqualTo("Iron");
  }
}
