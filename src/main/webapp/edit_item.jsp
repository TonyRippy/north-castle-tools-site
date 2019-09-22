<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.Item" %>
<%@ page import="myapp.Tool" %>
<%@ page import="myapp.ToolGroup" %>

<%
Item item = Item.forPath(request.getPathInfo());
item.readFromDatastore();
%>

<!doctype html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="content-language" content="en-US">
    <title>Edit Catalog Item</title>
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
        <h1 class="grid_12 alpha omega">Edit Catalog Item</h1>
        <div class="clear"></div>
        <div id="instructions" class="grid_12 alpha omega">
          <h2>Instructions</h2>
          <p>
            All fields are optional and can be left blank.
          </p>
        </div>
        <div class="clear"></div>
        <form action="/__save__/item" method="post" class="grid_12 alpha omega">
          <h2>Data Entry</h2>
          <fieldset>
          <legend>Identification</legend>
          <input type="hidden" id="toolGroupId" name="toolGroupId"
            value="<%= item.toolGroupId %>">
          <input type="hidden" id="toolId" name="toolId"
            value="<%= item.toolId %>">
          <input type="hidden" id="index" name="index"
            value="<%= item.index %>">
          <p>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name"
              value="<%= item == null || item.name == null ? "" : item.name %>">
          </p>
          <p>
            <label for="code">Code:</label>
            <input type="text" id="code" name="code"
              value="<%= item == null || item.code == null ? "" : item.code %>">
          </p>
          <p>
            <label for="location">Location:</label>
            <input type="text" id="location" name="location"
              value="<%= item == null || item.location == null ? "" : item.location %>">
          </p>
          </fieldset>
          <fieldset>
          <legend>Measurements</legend>
          <p>
            <label for="length">Length:</lablel>
            <input id="length" name="length" type="number"
                   value="<%= item == null || item.length == null ? "" : item.length.toString() %>">
            <%-- TODO(trippy): Turn this into a template! --%>
            <select id="lengthUnit" name="lengthUnit">
                <option value="cm"
                    <% if (item == null || item.lengthUnit == null || item.lengthUnit.name.equals("cm")) { %>
                      selected
                    <% } %> >
                  cm
                </option>
                <option value="in"
                    <% if (item == null || item.lengthUnit == null || item.lengthUnit.name.equals("in")) { %>
                      selected
                    <% } %> >
                  in
                </option>
            </select>
          </p>
          <p>
            <label for="width">Width:</lablel>
            <input id="width" name="width" type="number"
                   value="<%= item == null || item.width == null ? "" : item.width.toString() %>">
            <select id="widthUnit" name="widthUnit">
                <option value="cm"
                    <% if (item == null || item.widthUnit == null || item.widthUnit.name.equals("cm")) { %>
                      selected
                    <% } %> >
                  cm
                </option>
                <option value="in"
                    <% if (item == null || item.widthUnit == null || item.widthUnit.name.equals("in")) { %>
                      selected
                    <% } %> >
                  in
                </option>
            </select>
          </p>
          <p>
            <label for="height">Height:</lablel>
            <input id="height" name="height" type="number"
                   value="<%= item == null || item.height == null ? "" : item.height.toString() %>">
            <select id="heightUnit" name="heightUnit">
                <option value="cm"
                    <% if (item == null || item.heightUnit == null || item.heightUnit.equals("cm")) { %>
                      selected
                    <% } %> >
                  cm
                </option>
                <option value="in"
                    <% if (item == null || item.heightUnit == null || item.heightUnit.equals("in")) { %>
                      selected
                    <% } %> >
                  in
                </option>
            </select>
          </p>
          <p>
            <label for="weight">Weight:</lablel>
            <input id="weight" name="weight" type="number"
                   value="<%= item == null || item.weight == null ? "" : item.weight.toString() %>">
            <select id="weightUnit" name="weightUnit">
                <option value="g"
                    <% if (item == null || item.weightUnit == null || item.weightUnit.equals("g")) { %>
                      selected
                    <% } %> >
                  g
                </option>
                <option value="kg"
                    <% if (item == null || item.weightUnit == null || item.weightUnit.equals("kg")) { %>
                      selected
                    <% } %> >
                  kg
                </option>
                <option value="oz"
                    <% if (item == null || item.weightUnit == null || item.weightUnit.equals("oz")) { %>
                      selected
                    <% } %> >
                  oz
                </option>
                <option value="lb"
                    <% if (item == null || item.weightUnit == null || item.weightUnit.equals("lb")) { %>
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
            <%= item.description == null ? "" : item.description %>
          </textarea>
          </fieldset>
          <input type="submit" value="Save" />
        </form>
      </div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
