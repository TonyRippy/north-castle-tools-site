<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.Tool" %>
<%@ page import="myapp.ToolGroup" %>

<%
Tool t = Tool.forPath(request.getPathInfo());
if (t == null) {
  t = new Tool(null, null);
} else {
  t.readFromDatastore();
}
%>

<!doctype html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="content-language" content="en-US">
    <title>Edit Tool</title>
    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/text.css">
    <link rel="stylesheet" type="text/css" href="/css/960.css">
    <link rel="stylesheet" type="text/css" href="/css/theme.css">
    <style type="text/css">
      #sl-container {
        width: 980px;
      }
    </style>
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=ixuyq1vlmya4hji8r3wn575whswzx0039e8incvhia67yto2"></script>
    <script>
      tinymce.init({
        selector: '#description',
        plugins: 'lists, link'
      });
    </script>
  </head>
  <body>
    <div id="sl-container" class="container_12">
      <div id="sl-content" class="grid_12">
        <h1 class="grid_12 alpha omega">Edit Tool</h1>
        <div class="clear"></div>
        <div id="instructions" class="grid_12 alpha omega">
          <h2>Instructions</h2>
          <p>
            This is a form that will allow you to add or make changes to tools on the site.
            The identification fields are required in order for the site to work properly,
            but all other fields are optional and can be left blank.
          </p>
        </div>
        <div class="clear"></div>
        <form action="/__save__/tool" method="post" class="grid_12 alpha omega">
          <h2>Data Entry</h2>
          <fieldset>
          <legend>Identification</legend>
          <p>
            <label for="newId">Id:</label>
            <input type="text" id="newId" name="newId"
              value="<%= t == null || t.id == null ? "" : t.id %>">
            <input type="hidden" id="oldId" name="oldId"
              value="<%= t == null || t.id == null ? "" : t.id %>">
          </p>
          <p>
            <label for="newGroupId">Category:</label>
            <select id="newGroupId" name="newGroupId">
              <% for (ToolGroup g : ToolGroup.listAll()) { %>
                <option value="<%= g.id %>"
                    <% if (g.id.equals(t.toolGroupId)) { %> selected <% } %> >
                  <%= g.name %>
                </option>
              <% } %>
            </select>
            <input type="hidden" id="oldGroupId" name="oldGroupId"
                   value="<%= t == null || t.toolGroupId == null ? "" : t.toolGroupId %>">
          </p>
          <p>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name"
              value="<%= t == null || t.name == null ? "" : t.name %>">
          </p>
          <p>
            <label for="code">Code:</label>
            <input type="text" id="code" name="code"
              value="<%= t == null || t.code == null ? "" : t.code %>">
          </p>
          <p>
            <label for="location">Location:</label>
            <input type="text" id="location" name="location"
              value="<%= t == null || t.location == null ? "" : t.location %>">
          </p>
          </fieldset>
          <fieldset>
          <legend>Measurements</legend>
          <p>
            <label for="length">Length:</lablel>
            <input id="length" name="length" type="number"
                   value="<%= t == null || t.length == null ? "" : t.length.toString() %>">
            <%-- TODO(trippy): Turn this into a template! --%>
            <select id="lengthUnit" name="lengthUnit">
                <option value="cm"
                    <% if (t == null || t.lengthUnit == null || t.lengthUnit.name.equals("cm")) { %>
                      selected
                    <% } %> >
                  cm
                </option>
                <option value="in"
                    <% if (t == null || t.lengthUnit == null || t.lengthUnit.name.equals("in")) { %>
                      selected
                    <% } %> >
                  in
                </option>
            </select>
          </p>
          <p>
            <label for="width">Width:</lablel>
            <input id="width" name="width" type="number"
                   value="<%= t == null || t.width == null ? "" : t.width.toString() %>">
            <select id="widthUnit" name="widthUnit">
                <option value="cm"
                    <% if (t == null || t.widthUnit == null || t.widthUnit.name.equals("cm")) { %>
                      selected
                    <% } %> >
                  cm
                </option>
                <option value="in"
                    <% if (t == null || t.widthUnit == null || t.widthUnit.name.equals("in")) { %>
                      selected
                    <% } %> >
                  in
                </option>
            </select>
          </p>
          <p>
            <label for="height">Height:</lablel>
            <input id="height" name="height" type="number"
                   value="<%= t == null || t.height == null ? "" : t.height.toString() %>">
            <select id="heightUnit" name="heightUnit">
                <option value="cm"
                    <% if (t == null || t.heightUnit == null || t.heightUnit.equals("cm")) { %>
                      selected
                    <% } %> >
                  cm
                </option>
                <option value="in"
                    <% if (t == null || t.heightUnit == null || t.heightUnit.equals("in")) { %>
                      selected
                    <% } %> >
                  in
                </option>
            </select>
          </p>
          <p>
            <label for="weight">Weight:</lablel>
            <input id="weight" name="weight" type="number"
                   value="<%= t == null || t.weight == null ? "" : t.weight.toString() %>">
            <select id="weightUnit" name="weightUnit">
                <option value="g"
                    <% if (t == null || t.weightUnit == null || t.weightUnit.equals("g")) { %>
                      selected
                    <% } %> >
                  g
                </option>
                <option value="kg"
                    <% if (t == null || t.weightUnit == null || t.weightUnit.equals("kg")) { %>
                      selected
                    <% } %> >
                  kg
                </option>
                <option value="oz"
                    <% if (t == null || t.weightUnit == null || t.weightUnit.equals("oz")) { %>
                      selected
                    <% } %> >
                  oz
                </option>
                <option value="lb"
                    <% if (t == null || t.weightUnit == null || t.weightUnit.equals("lb")) { %>
                      selected
                    <% } %> >
                  lb
                </option>
            </select>
          </p>
          </fieldset>
          <fieldset>
          <legend>Description</legend>
          <textarea id="description" name="description">
            <%= t.description == null ? "" : t.description %>
          </textarea>
          </fieldset>
          <fieldset>
          <legend>Images</legend>
          <%-- TODO: Add ability to preview images. --%>
          <%-- TODO: Add ability to set multiple images. --%>
          <input type="text" id="images" name="images" size="100"
                 value = "<%= t == null || t.images == null || t.images.isEmpty() ? "" : t.images.get(0) %>">
          </fieldset>
          <input type="submit" value="Save" />
        </form>
      </div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
