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
            <li><a href="/">Welcome</a></li>
            <li><a href="/thorne">Thorne Collection</a></li>
            <li class="selected disabled">About</li>
          </ul>
        </div>
        <div id="sl-navlink">
          <a href="/">Home</a>
          &gt;
        </div>
        <h1>The John Norris Thorne, Jr. Collection</h1>
        <h3>Early Tools and Household Utensils and Farm Implements</h3>
        <p>
          Mr. John Norrish Thorne, Jr. was an avid collector of farm implements,
          household utensils and early tools.  He was interested in implements
          used by farmers and utensils used by homemakers and tools used by
          specific trades, such as carpenters, cobblers, coopers, wagon makers
          and lumberjacks.  His comprehensive collection includes patent models
          and small copies used by salesmen and is illustrative of life without
          electricity.
        </p>
        <p>
          Mrs. Thorne loaned her husband’s large collection to The North Castle
          Historical Society and some years after Mr. Thorne’s death in 1972
          donated the entire collection to The Society.  There are more than 250
          separate items on display at Historic Smith’s Tavern in Armonk.
          However, the collection is housed on the second floor of the Tavern
          and inaccessible to many visitors who do not climb the very steep and
          narrow stairs.  Now, for the first time, the entire collection may be
          viewed electronically.
        </p>
        <p>
          The North Castle Historical Society is deeply indebted to Eagle Scout
          candidate Nicholas Skiera who conceived the idea and executed it to
          completion with many hours of volunteer help from members Troop 94
          Armonk.  His organizational skills, commitment and computer talent are
          evident in the finished product.
        </p>
        <p>
        We hope you enjoy your tour of <i>North Castle Historical Tools</i>.
        </p>
        <p>
          Please contact
          <a href="mailto:northcastlehistoricaltools@gmail.com">
            northcastlehistoricaltools@gmail.com
          </a> with any questions or information.
        </p>
      </div>
      <div class="clear"></div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
