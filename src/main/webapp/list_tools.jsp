<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.Tool" %>
<%@ page import="java.net.URLEncoder" %>

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
    </style>
  </head>
  <body>
    <div id="sl-container" class="container_12">
      <div id="sl-header">
        <h1>Historic Tools of North Castle</h1>
      </div>
      <div id="sl-content">
        The following is a list of all tools available on the site, listed alphabetically.
        Click on a name for more information.
        <ul>
          <% for (Tool t : Tool.listAll()) { %>
          <li>
            <a href="/tool/<%= URLEncoder.encode(t.toolGroupId) %>/<%= URLEncoder.encode(t.id) %>">
              <%= t.name == null ? "" : t.name %>
            </a>
          </li>
          <% } %>
        </ul>
      </div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
