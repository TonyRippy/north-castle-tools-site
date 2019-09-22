package myapp;

import static myapp.Config.getDatastore;
import static com.google.cloud.datastore.StructuredQuery.OrderBy.asc;

import com.google.cloud.datastore.Datastore;
import com.google.cloud.datastore.Entity;
import com.google.cloud.datastore.Key;
import com.google.cloud.datastore.KeyFactory;
import com.google.cloud.datastore.PathElement;
import com.google.cloud.datastore.Query;
import com.google.cloud.datastore.QueryResults;

import java.util.ArrayList;
import java.util.List;

public class Item extends DataObject<Item> {
  public static final String KIND = "Item";
  
  public String toolGroupId;
  public String toolId;
  public int index;
  
  public String name;
  public String code;
  public String location;

  public Number length;
  public LengthUnit lengthUnit;
  public Number width;
  public LengthUnit widthUnit;
  public Number height;
  public LengthUnit heightUnit;
  public Number weight;
  public WeightUnit weightUnit;

  public String description;
  
  public Item(String toolGroupId, String toolId, int index) {
    this.toolGroupId = toolGroupId;
    this.toolId = toolId;
    this.index = index;
  }

  static public Item forPath(String path) {
    // Extract the toolGroupId and toolId from the URL path.
    // Format is "/TOOL_GROUP_ID/TOOL_ID/INDEX"
    if (path == null || path.length() == 0 || path.charAt(0) != '/') {
      return null;
    }
    // Find the second & third slash, ignoring the first.
    int slash1 = path.indexOf('/', 1);
    if (slash1 < 0) {
      return null;
    }
    int slash2 = path.indexOf('/', slash1 + 1);
    if (slash2 < 0) {
      return null;
    }
    String toolGroupId = path.substring(1, slash1);
    String toolId = path.substring(slash1 + 1, slash2);
    int index = Integer.parseInt(path.substring(slash2 + 1));
    return new Item(toolGroupId, toolId, index);
  }

  @Override
  protected String getKind() {
    return KIND;
  }

  @Override
  protected Key buildKey(KeyFactory keyFactory) {
    if (toolId == null || toolId.isEmpty() || toolGroupId == null || toolGroupId.isEmpty()) {
      return null;
    }
    return keyFactory
      .addAncestor(PathElement.of(ToolGroup.KIND, toolGroupId))
      .addAncestor(PathElement.of(Tool.KIND, toolId))
      .setKind(KIND)
      .newKey(Integer.toString(index));
  }

  @Override
  protected boolean readSummaryFields(Entity e) {
    name = getString(e, "name");
    return true;
  }

  private static LengthUnit getLengthUnit(Entity e, String propertyName) {
    return LengthUnit.byName(getString(e, propertyName));
  }

  private static void setLengthUnit(Entity.Builder e, String propertyName, LengthUnit value) {
    setString(e, propertyName, value.name);
  }

  private static WeightUnit getWeightUnit(Entity e, String propertyName) {
    return WeightUnit.byName(getString(e, propertyName));
  }

  private static void setWeightUnit(Entity.Builder e, String propertyName, WeightUnit value) {
    setString(e, propertyName, value.name);
  }

  @Override
  protected boolean readAllFields(Entity e) {
    name = getString(e, "name");
    code = getString(e, "code");
    location = getString(e, "location");    
    
    length = getNumber(e, "length");
    lengthUnit = getLengthUnit(e, "lengthUnit");
    width = getNumber(e, "width");
    widthUnit = getLengthUnit(e, "widthUnit");
    height = getNumber(e, "height");
    heightUnit = getLengthUnit(e, "heightUnit");
    weight = getNumber(e, "weight");
    weightUnit = getWeightUnit(e, "weightUnit");
    
    description = getText(e, "description");

    return true;
  }

  @Override
  protected boolean writeAllFields(Entity.Builder e) {
    setString(e, "name", name);
    setString(e, "code", code);
    setString(e, "location", location);
    
    setNumber(e, "length", length);
    setLengthUnit(e, "lengthUnit", lengthUnit);
    setNumber(e, "width", width);
    setLengthUnit(e, "widthUnit", widthUnit);
    setNumber(e, "height", height);
    setLengthUnit(e, "heightUnit", heightUnit);
    setNumber(e, "weight", weight);
    setWeightUnit(e, "weightUnit", weightUnit);

    setText(e, "description", description);

    return true;
  }
}
