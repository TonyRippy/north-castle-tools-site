<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.Tool" %>
<%@ page import="myapp.ToolGroup" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%
Tool selectedTool = Tool.forPath(request.getPathInfo());
if (selectedTool == null) {
  response.sendError(HttpServletResponse.SC_BAD_REQUEST);
  return;
}
if (!selectedTool.readFromDatastore()) {
  response.sendError(HttpServletResponse.SC_NOT_FOUND);
  return;
}
ToolGroup selectedGroup = new ToolGroup(selectedTool.toolGroupId);
if (!selectedGroup.readFromDatastore()) {
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
    <title>Historic Tools of North Castle - <%= selectedTool.name %></title>
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
        width: 100%;
      }
    </style>
  </head>
  <body>
    <div id="sl-container" class="container_12">
      <%@include file="header.jspf" %>
      <div id="sl-sidemenu" class="grid_3 alpha">
        <%@include file="sidebar.jspf" %>
      </div>
      <div id="sl-content" class="grid_9 omega">
        <% if (userService.isUserLoggedIn() && userService.isUserAdmin()) { %>
        <div id="admin">
          <a href="/__edit__/tool/<%= selectedTool.toolGroupId %>/">
            Add new record.
          </a>
          <br>
          <a href="<%= "/__edit__/tool" + request.getPathInfo() %>">
            Edit this record.
          </a>
        </div>
        <% } %>
        <div id="sl-navlink">
          <a href="/">Home</a>
          &gt;
          <a href="/group/<%= selectedGroup.id %>"><%= selectedGroup.name %></a>
          &gt;
        </div>
        <div class="grid_6 alpha">
          <h1><%= selectedTool.name %></h1>
          <p>
            <%= selectedTool.description == null ? "" : selectedTool.description %>
          </p>
          <h2>Catalog Items:</h2>
          <h3>
            Item <%= selectedTool.code %>
            (<%= selectedTool.name %>)
          </h3>
          <table>
            <% if (selectedTool.location != null) { %>
              <tr><th>Location:</th><td><%= selectedTool.location %></td></tr>
            <% } %>  
            <% if (selectedTool.length != null) { %>
              <tr>
                <th>Length:</th>
                <td>
                  <%= selectedTool.length %>
                  <% if (selectedTool.lengthUnit != null) { %>
                    <%= selectedTool.lengthUnit.name %></td>
                  <% } %>  
                </td>
              </tr>
            <% } %>  
            <% if (selectedTool.width != null) { %>
              <tr>
                <th>Width:</th>
                <td>
                  <%= selectedTool.width %>
                  <% if (selectedTool.widthUnit != null) { %>
                    <%= selectedTool.widthUnit.name %>
                  <% } %>
                </td>
              </tr>
            <% } %>  
            <% if (selectedTool.height != null) { %>
              <tr>
                <th>Height:</th>
                <td>
                  <%= selectedTool.height %>
                  <% if (selectedTool.heightUnit != null) { %>
                    <%= selectedTool.heightUnit.name %>
                  <% } %>  
                </td>
              </tr>
            <% } %>  
            <% if (selectedTool.weight != null) { %>
              <tr>
                <th>Weight:</th>
                <td>
                  <%= selectedTool.weight %>
                  <% if (selectedTool.weightUnit != null) { %>
                    <%= selectedTool.weightUnit.name %>
                  <% } %>  
                </td>
              </tr>
            <% } %>  
          </table>          
        </div>
        <div class="grid_3 omega">
          <% if (selectedTool.images != null) { %>
            <% for (String url : selectedTool.images) { %>
              <img src="<%= url %>"></img>
            <% } %>  
          <% } %>  
        </div>
      </div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
