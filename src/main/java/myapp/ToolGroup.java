package myapp;

import static myapp.Config.getDatastore;
import static com.google.cloud.datastore.StructuredQuery.OrderBy.asc;

import com.google.cloud.datastore.Datastore;
import com.google.cloud.datastore.DatastoreException;
import com.google.cloud.datastore.Entity;
import com.google.cloud.datastore.Key;
import com.google.cloud.datastore.KeyFactory;
import com.google.cloud.datastore.Query;
import com.google.cloud.datastore.QueryResults;
import com.google.cloud.datastore.StructuredQuery.PropertyFilter;

import java.util.ArrayList;
import java.util.List;

public class ToolGroup extends DataObject<ToolGroup> {
  public static final String KIND = "ToolGroup";
  
  public String id;
  public String name;
  public String description;
  public List<Tool> tools;

  public ToolGroup(String id) {
    this.id = id;
  }

  static public ToolGroup forPath(String path) {
    // Extract the id from the URL path.
    // Format is "/TOOL_GROUP_ID"
    if (path == null || path.length() < 2 || path.charAt(0) != '/') {
      return null;
    }
    // Remove the leading slash from the path.
    String toolGroupId = path.substring(1); 
    return new ToolGroup(toolGroupId);
  }

  @Override
  protected String getKind() {
    return KIND;
  }

  @Override
  protected Key buildKey(KeyFactory keyFactory) {
    if (id == null || id.isEmpty()) {
      return null;
    }
    return keyFactory
      .setKind(KIND)
      .newKey(id);
  }

  @Override
  protected boolean readSummaryFields(Entity e) {
    name = getString(e, "name");
    return true;
  }

  @Override
  protected boolean readAllFields(Entity e) {
    name = getString(e, "name");
    description = getText(e, "description");
    return true;
  }

  @Override
  protected boolean writeAllFields(Entity.Builder e) {
    setString(e, "name", name);
    setText(e, "description", description);
    return true;
  }

  @Override
  protected boolean readFromDatastore(Datastore datastore) {
    // Load this record's fields.
    if (!super.readFromDatastore(datastore)) {
      return false;
    }
    // Also load the list of tools that are part of this group.
    Query<Entity> query = Query.newEntityQueryBuilder()
      .setKind(Tool.KIND)
      .setFilter(PropertyFilter.hasAncestor(
          buildKey(datastore.newKeyFactory())))
      .setOrderBy(asc("name"))
      .build();
    QueryResults<Entity> results = datastore.run(query);
    tools = new ArrayList<>();
    while (results.hasNext()) {
      Entity e = results.next();
      Tool tool = new Tool(e.getKey().getName(), id);
      if (tool.readSummaryFields(e)) {
        tools.add(tool);
      }
    }
    return true;
  }

  // TODO: Figure out how to move this into DataObject
  public static List<ToolGroup> listAll() {
    Datastore datastore = getDatastore();
    Query<Entity> query = Query.newEntityQueryBuilder()
        .setKind(KIND)
        .setOrderBy(asc("name"))
        .build();
    QueryResults<Entity> results = datastore.run(query);
    List<ToolGroup> all = new ArrayList<>();
    while (results.hasNext()) {
      Entity e = results.next();
      ToolGroup toolGroup = new ToolGroup(e.getKey().getName());
      if (toolGroup.readSummaryFields(e)) {
        all.add(toolGroup);
      }
    }
    return all;
  }

}
