<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.Item" %>
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
      .admin {
        float: right;
        padding-right: 20px;
      }
      img {
        width: 100%;
      }
      h3 {
        margin-bottom: 0;
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
        <div class="admin">
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
          <div class="admin">
            <a href="<%= "/__edit__/item"
                         + request.getPathInfo() + "/"
                         + Integer.toString(selectedTool.items.size()) %>">
              Add new item.
            </a>
          </div>
          <h2>Catalog Items:</h2>
            <% for (Item item : selectedTool.items) { %>
            <div class="admin">
              <a href="<%= "/__edit__/item"
                           + request.getPathInfo() + "/"
                           + Integer.toString(item.index) %>">
                Edit this item.
              </a>
            </div>
            <h3>
              Item
              <% if (item.code != null) { %>
                <%= item.code %>
              <% } else { %>
                #<%= item.index + 1 %><%-- count from one instead of zero... --%>  
              <% } %>
              <% if (item.name != null) { %>
                (<%= item.name %>)
              <% } %>              
            </h3>
            <table>
              <% if (item.location != null) { %>
                <tr><th>Location:</th><td><%= item.location %></td></tr>
              <% } %>  
              <% if (item.length != null) { %>
                <tr>
                  <th>Length:</th>
                  <td>
                    <%= item.length %>
                    <% if (item.lengthUnit != null) { %>
                      <%= item.lengthUnit.name %></td>
                    <% } %>  
                  </td>
                </tr>
              <% } %>  
              <% if (item.width != null) { %>
                <tr>
                  <th>Width:</th>
                  <td>
                    <%= item.width %>
                    <% if (item.widthUnit != null) { %>
                      <%= item.widthUnit.name %>
                    <% } %>
                  </td>
                </tr>
              <% } %>  
              <% if (item.height != null) { %>
                <tr>
                  <th>Height:</th>
                  <td>
                    <%= item.height %>
                    <% if (item.heightUnit != null) { %>
                      <%= item.heightUnit.name %>
                    <% } %>  
                  </td>
                </tr>
              <% } %>  
              <% if (item.weight != null) { %>
                <tr>
                <th>Weight:</th>
                  <td>
                    <%= item.weight %>
                    <% if (item.weightUnit != null) { %>
                    <%= item.weightUnit.name %>
                    <% } %>  
                  </td>
                </tr>
              <% } %>  
            </table>          
            <% if (item.description != null) { %>
              <p><%= item.description %></p>
            <% } %>
          <% } %>  
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
