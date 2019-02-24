package myapp;

import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SaveToolServlet extends SaveServlet {
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    // Create/Load the Tool object being modified.
    Tool t;
    String oldId = s(req, "oldId");
    String newId = s(req, "newId");
    String oldGroupId = s(req, "oldGroupId");
    String newGroupId = s(req, "newGroupId");
    if (oldId == null) {
      // The record didn't exist before, we should create a new one.
      if (newId == null || newGroupId == null) {
        resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
        return;
      }
      t = new Tool(newId, newGroupId);
    } else {
      // Load the existing record from the database.
      if (oldGroupId == null) {
        resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
        return;
      }
      t = new Tool(oldId, oldGroupId);
      if (!t.readFromDatastore()) {
        resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        return;
      }
      if (!oldId.equals(newId) || !oldGroupId.equals(newGroupId)) {
        // The ID has changed.
        // We need to remove the old record and create a new one.
        if (newId != null && (newGroupId == null || newGroupId.isEmpty())) {
          resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
          return;
        }
        // We need to remove the old record.
        // TODO(trippy): Implement a delete method.
        if (newId == null) {
          // No new record, nothing more to do.
            sendSuccessResponse(resp, "/group/" + oldGroupId);
            return;
        }
        // Set the new identifiers, which will result in a new record once saved.
        t.id = newId;
        t.toolGroupId = newGroupId;
      }
    }

    // Read the rest of the fields and save the record.
    t.name = s(req, "name");
    t.description = s(req, "description");
    t.writeToDatastore();

    // Let the user know the request succeeded, redirect to the view page.
    sendSuccessResponse(resp, "/tool/" + newGroupId + "/" + newId);
  }
}