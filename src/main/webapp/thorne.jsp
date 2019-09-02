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
      <div id="sl-header">
        <h1>Historic Tools of North Castle</h1>
      </div>
      <div id="sl-sidemenu" class="grid_3 alpha">
        <%@include file="sidebar.jspf" %>
      </div>
      <div id="sl-content" class="grid_9 omega">
        <div id="sl-topmenu">
          <ul>
            <li><a href="/">About</a></li>
            <li class="selected disabled">Thorne Collection</li>
            <li><a href="/contact">Contact</a></li>
          </ul>
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
