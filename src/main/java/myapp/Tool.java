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

public class Tool extends DataObject<Tool> {
  public static final String KIND = "Tool";
  
  public String id;
  public String toolGroupId;  
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
  public List<String> images;
  
  public Tool(String id, String toolGroupId) {
    this.id = id;
    this.toolGroupId = toolGroupId;
  }

  static public Tool forPath(String path) {
    // Extract the toolGroupId and toolId from the URL path.
    // Format is "/TOOL_GROUP_ID/TOOL_ID"
    if (path == null || path.length() == 0 || path.charAt(0) != '/') {
      return null;
    }
    // Find the second slash, ignoring the first.
    int index = path.indexOf('/', 1);
    if (index < 0) {
      return null;
    }
    String toolGroupId = path.substring(1, index);
    String toolId = path.substring(index + 1);
    return new Tool(toolId, toolGroupId);
  }

  @Override
  protected String getKind() {
    return KIND;
  }

  @Override
  protected Key buildKey(KeyFactory keyFactory) {
    if (id == null || id.isEmpty() || toolGroupId == null || toolGroupId.isEmpty()) {
      return null;
    }
    return keyFactory
      .addAncestor(PathElement.of(ToolGroup.KIND, toolGroupId))
      .setKind(KIND)
      .newKey(id);
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
    images = getStringList(e, "images");

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
    setStringList(e, "images", images);
    return true;
  }

  // TODO: Figure out how to move this into DataObject
  public static List<Tool> listAll() {
    Datastore datastore = getDatastore();
    Query<Entity> query = Query.newEntityQueryBuilder()
        .setKind(KIND)
        .setOrderBy(asc("name"))
        .build();
    QueryResults<Entity> results = datastore.run(query);
    List<Tool> all = new ArrayList<>();
    while (results.hasNext()) {
      Entity e = results.next();
      String id = e.getKey().getName();
      List<PathElement> ancestors = e.getKey().getAncestors();
      if (ancestors.size() != 1) {
        throw new RuntimeException("Unexpected number of ancestors: " + e.getKey().toString());
      }
      PathElement ancestor = ancestors.get(0);
      if (!ancestor.getKind().equals(ToolGroup.KIND)) {
        throw new RuntimeException("Encountered ancestor that isn't a ToolGroup: " + ancestor.toString());
      }
      String toolGroupId = ancestor.getName();
      Tool tool = new Tool(id, toolGroupId);
      if (tool.readSummaryFields(e)) {
        all.add(tool);
      }
    }
    return all;
  }

}
