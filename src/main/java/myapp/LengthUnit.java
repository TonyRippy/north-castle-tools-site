package myapp;

// TODO(trippy): Look for existing Java libraries for this.
public class LengthUnit {
  
  public static final LengthUnit CENTIMETER = new LengthUnit("cm");
  public static final LengthUnit INCH = new LengthUnit("in");

  public String name;
  
  private LengthUnit(String name) {
    this.name = name;
  }

  public static LengthUnit byName(String name) {
    if (name == null) return null;
    if (name.equals(CENTIMETER.name)) return CENTIMETER;
    if (name.equals(INCH.name)) return INCH;
    throw new IndexOutOfBoundsException("Unknown length unit: " + name);
  }
}
