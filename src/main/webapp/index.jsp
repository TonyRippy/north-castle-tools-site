<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.ToolGroup" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%
UserService userService = UserServiceFactory.getUserService();
%>

<!doctype html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="content-language" content="en-US">
    <title>Historic Tools of North Castle</title>
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
      <div id="sl-header">
        <h1>Historic Tools of North Castle</h1>
      </div>
      <div id="sl-content">
        <% if (userService.isUserLoggedIn() && userService.isUserAdmin()) { %>
        <div id="admin">
          <a href="/__edit__/group/">
            Add new tool group.
          </a>
        </div>
        <% } %>
        <p>
          Welcome!
        </p>
        <p>
        The following is a list of the different types of tools collected by the
        North Castle Historical Society:
        </p>
        <ul>
          <% for (ToolGroup g : ToolGroup.listAll()) { %>
          <li>
            <a href="/group/<%= g.id %>">
              <%= g.name %>
            </a>
          </li>
          <% } %>
        </ul>
      </div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
