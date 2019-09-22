<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.ToolGroup" %>

<%
ToolGroup g = ToolGroup.forPath(request.getPathInfo());
if (g == null) {
  g = new ToolGroup(null);
} else {
  g.readFromDatastore();
}
%>

<!doctype html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="content-language" content="en-US">
    <title>Edit Tool Group</title>
    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico"> 
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/text.css">
    <link rel="stylesheet" type="text/css" href="/css/960.css">
    <link rel="stylesheet" type="text/css" href="/css/theme.css">
    <style type="text/css">
      legend {
        font-weight: bold;
      }
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
        <h1>Edit Tool Group</h1>
        <h2>Instructions</h2>
        <p>
          This is a form that will allow you to add or make changes to tool groups on the site.
          The identification fields are required in order for the site to work properly,
          but all other fields are optional and can be left blank.
        </p>
        <form action="/__save__/group" method="post">
          <h2>Data Entry</h2>
          <fieldset>
          <legend>Identification</legend>
          <p>
            <label for="newId">Id:</label>
            <input type="text" id="newId" name="newId"
              value="<%= g == null || g.id == null ? "" : g.id %>">
            <input type="hidden" id="oldId" name="oldId"
                   value="<%= g == null || g.id == null ? "" : g.id %>">
            <br>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name"
              value="<%= g == null || g.name == null ? "" : g.name %>">
          </p>
          </fieldset>
          <fieldset>
          <legend>Description</legend>
          <textarea id="description" name="description">
            <%= g.description == null ? "" : g.description %>
          </textarea>
          </fieldset>
          <input type="submit" value="Save" />
        </form>
      </div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
