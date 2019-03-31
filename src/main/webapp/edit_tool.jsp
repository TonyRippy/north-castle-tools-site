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
          <legend>Description</legend>
          <textarea id="description" name="description">
            <%= t.description == null ? "" : t.description %>
          </textarea>
          </fieldset>
          <input type="submit" value="Save" />
        </form>
      </div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
