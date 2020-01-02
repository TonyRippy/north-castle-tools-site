<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.ToolGroup" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%
  UserService userService = UserServiceFactory.getUserService();
  ToolGroup selectedGroup = null;
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
      <%@include file="header.jspf" %>
      <div id="sl-sidemenu" class="grid_3 alpha">
        <%@include file="sidebar.jspf" %>
      </div>
      <div id="sl-content" class="grid_9 omega">
        <div id="sl-topmenu">
          <ul>
            <li class="selected disabled">Welcome</li>
            <li><a href="/thorne">Thorne Collection</a></li>
            <li><a href="/about">About</a></li>
          </ul>
        </div>
        <% if (userService.isUserLoggedIn() && userService.isUserAdmin()) { %>
        <div id="admin">
          <a href="/__edit__/group/">
            Add new tool group.
          </a>
        </div>
        <% } %>
        <p>
          Welcome to Historic Tools of North Castle where you may tour the
          tools, implements and patent models collected by Mr. J. Norrish Thorne
          over his lifetime.  The North Castle Historical Society is honored
          that his family donated the Collection to The Society.  Many of these
          tools were used in trades not practiced in North Castle today
          including trades such as wagon making, ice harvesting, cobbling,
          coopering and farming.
        </p>
        <p>
          You may view the complete list of tools by clicking on the
          <a href="/thorne">Thorne Collection</a> link at the top of the
          page. You may learn more about the collection and the project to
          digitally catalog it using the <a href="/about">About</a> link. You
          may explore the different categories of tools by clicking the links on
          the left-hand side of the page.
        </p>
        <center>
        <img src="img/tavern.jpg"/>
        <p>
          440 Bedford Rd, Armonk, NY 10504
        </p>
        </center>
      </div>
      <div class="clear"></div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
