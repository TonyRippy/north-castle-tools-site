package myapp;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SaveItemServlet extends SaveServlet {
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    // Create/Load the Tool object being modified.
    String toolGroupId = s(req, "toolGroupId");
    String toolId = s(req, "toolId");
    int index = n(req, "index").intValue();
    Item item = new Item(toolGroupId, toolId, index);

    // Read the rest of the fields and save the record.
    item.name = s(req, "name");
    item.code = s(req, "code");
    item.location = s(req, "location");
    
    item.length = n(req, "length");
    item.lengthUnit = LengthUnit.byName(s(req, "lengthUnit"));
    item.width = n(req, "width");
    item.widthUnit = LengthUnit.byName(s(req, "widthUnit"));
    item.height = n(req, "height");
    item.heightUnit = LengthUnit.byName(s(req, "heightUnit"));
    item.weight = n(req, "weight");
    item.weightUnit = WeightUnit.byName(s(req, "weightUnit"));

    item.description = s(req, "description");
    item.writeToDatastore();

    // Let the user know the request succeeded, redirect to the view page.
    sendSuccessResponse(resp, "/tool/" + toolGroupId + "/" + toolId);
  }
}
