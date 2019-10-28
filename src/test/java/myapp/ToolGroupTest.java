package myapp;

import static com.google.common.truth.Truth.assertThat;

import org.junit.Test;

public class ToolGroupTest {
  @Test
  public void testPathParsing() {
    // Basic path parsing
    ToolGroup tg = ToolGroup.forPath("/foo");
    assertThat(tg.id).isEqualTo("foo");

    // Try one with a URL-encoded path elements.
    tg = ToolGroup.forPath("/Washing%2FIroning");
    assertThat(tg.id).isEqualTo("Washing/Ironing");
  }
}
