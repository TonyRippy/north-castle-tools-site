<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.Tool" %>
<%@ page import="myapp.ToolGroup" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%
Tool selected = Tool.forPath(request.getPathInfo());
if (selected == null) {
  response.sendError(HttpServletResponse.SC_BAD_REQUEST);
  return;
}
if (!selected.readFromDatastore()) {
  response.sendError(HttpServletResponse.SC_NOT_FOUND);
  return;
}
ToolGroup toolGroup = new ToolGroup(selected.toolGroupId);
if (!toolGroup.readFromDatastore()) {
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
    </style>
  </head>
  <body>
    <div id="sl-container" class="container_12">
      <div id="sl-header" class="grid_12">
        <h1>Historic Tools of North Castle</h1>
      </div>
      <div class="clear"></div>
      <div id="sl-content" class="grid_12">
        <% if (userService.isUserLoggedIn() && userService.isUserAdmin()) { %>
        <div id="admin">
          <a href="/__edit__/tool/<%= selected.toolGroupId %>/">
            Add new record.
          </a>
          <br>
          <a href="<%= "/__edit__/tool" + request.getPathInfo() %>">
            Edit this record.
          </a>
        </div>
        <% } %>
        <div id="sl-navlink">
          <a href="/group/<%= toolGroup.id %>"><b>&larr;</b> <%= toolGroup.name %></a>
        </div>
        <div class="grid_7 alpha">
          <h1><%= selected.name %></h1>
          <p>
            <%= selected.description == null ? "" : selected.description %>
          </p>
        </div>
        <div class="grid_5 omega">
          <%--
          <% if (selected.images == null) { %>
            <img src="/images/grave.jpg"></img>
          <% } else for (String url : selected.images) { %>
            <img src="<%= url %>"></img>
          <% } %>  
          --%>
        </div>
      </div>
    </div>
  </body>
</html>

<%-- //[END all]--%>