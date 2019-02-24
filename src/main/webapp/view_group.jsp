<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.Tool" %>
<%@ page import="myapp.ToolGroup" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%
ToolGroup selected = ToolGroup.forPath(request.getPathInfo());
if (selected == null) {
  response.sendError(HttpServletResponse.SC_BAD_REQUEST);
  return;
}
if (!selected.readFromDatastore()) {
  response.sendError(HttpServletResponse.SC_NOT_FOUND);
  return;
}
UserService userService = UserServiceFactory.getUserService();
%>

<!doctype html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="content-language" content="en-US">
    <title>Historic Tools of North Castle - <%= selected.name %></title>
    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
    <link rel="stylesheet" type="text/css" href="/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/css/text.css">
    <link rel="stylesheet" type="text/css" href="/css/960.css">
    <link rel="stylesheet" type="text/css" href="/css/theme.css">
    <style type="text/css">
      #admin {
        float: right;
        padding-right: 20px;
      }
      img {
        width: 90%;
      }
    </style>
  </head>
  <body>
    <div id="sl-container" class="container_12">
      <div id="sl-header">
        <h1>Historic Tools of North Castle</h1>
      </div>
      <div id="sl-content" class="grid_12">
        <% if (userService.isUserLoggedIn() && userService.isUserAdmin()) { %>
        <div id="admin">
          <a href="<%= "/__edit__/group" + request.getPathInfo() %>">
            Edit this tool group.
          </a>
          <br>
          <a href="/__edit__/tool/<%= selected.id %>/">
            Add new tool to this group.
          </a>
        </div>
        <% } %>
        <div class="grid_7 alpha">
          <h1><%= selected.name %></h1>
          <%= selected.description == null ? "" : selected.description %>
          <% if (selected.tools.size() > 0) { %>
          <h2 id="tools">Tools</h2>
          The following is a list of all tools in this category.
          Click on a name for more information.
          <ul>
            <% for (Tool t : selected.tools) { %>
            <li>
              <a href="/tool/<%= t.toolGroupId %>/<%= t.id %>">
                <%= t.name == null ? "" : t.name %>
              </a>
            </li>
            <% } %>
          </ul>
          <% } %>
        </div>
        <%--
        <div class="grid_5 omega">
          <% if (selected.image != null) { %>
          <img src="<%= selected.image %>"></img>
          <% } %>
        </div>
        --%>
      </div>
      <div class="clear"></div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
