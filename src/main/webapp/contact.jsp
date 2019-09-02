<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.ToolGroup" %>
<%
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
            <li><a href="/">About</a></li>
            <li><a href="/thorne">Thorne Collection</a></li>
            <li class="selected disabled">Contact</li>
          </ul>
        </div>
        <div id="sl-navlink">
          <a href="/">Home</a>
          &gt;
        </div>
        <p>
          TODO
        </p>
      </div>
      <div class="clear"></div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
