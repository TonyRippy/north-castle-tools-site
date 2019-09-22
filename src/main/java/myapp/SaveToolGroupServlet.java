package myapp;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SaveToolGroupServlet extends SaveServlet {
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    // Create/Load the ToolGroup object being modified.
    ToolGroup g;
    String oldId = s(req, "oldId");
    String newId = s(req, "newId");
    if (oldId == null) {
      // The record didn't exist before, we should create a new one.
      if (newId == null) {
        resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
        return;
      }
      g = new ToolGroup(newId);
    } else {
      // Load the existing record from the database.
      g = new ToolGroup(oldId);
      if (!g.readFromDatastore()) {
        resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        return;
      }
      if (!oldId.equals(newId)) {
        // The ID has changed.
        // We need to remove the old record and create a new one.
        // TODO(trippy): Implement a delete method.
        if (newId == null) {
          // No new record, nothing more to do.
          sendSuccessResponse(resp, "/");
          return;
        }
        // Set the new identifier, which will result in a new record once saved.
        g.id = newId;
      }
    }

    // Read the rest of the fields and save the record.
    g.name = s(req, "name");
    g.description = s(req, "description");
    g.writeToDatastore();

    // Let the user know the request succeeded, redirect to the view page.
    sendSuccessResponse(resp, "/group/" + newId);
  }
}
