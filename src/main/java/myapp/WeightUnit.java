package myapp;

// TODO(trippy): Look for existing Java libraries for this.
public class WeightUnit {
  
  public static final WeightUnit GRAMS = new WeightUnit("g");
  public static final WeightUnit KILOGRAMS = new WeightUnit("kg");
  public static final WeightUnit OUNCES = new WeightUnit("oz");
  public static final WeightUnit POUNDS = new WeightUnit("lb");

  public String name;
  
  private WeightUnit(String name) {
    this.name = name;
  }

  public static WeightUnit byName(String name) {
    if (name == null) return null;
    if (name.equals(GRAMS.name)) return GRAMS;
    if (name.equals(KILOGRAMS.name)) return KILOGRAMS;
    if (name.equals(OUNCES.name)) return OUNCES;
    if (name.equals(POUNDS.name)) return POUNDS;
    throw new IndexOutOfBoundsException("Unknown weight unit: " + name);
  }
}
