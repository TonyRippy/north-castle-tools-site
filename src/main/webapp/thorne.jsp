<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myapp.Tool" %>
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
    <link rel="stylesheet" type="text/css" href="/css/lightgallery.css">
    <style type="text/css">
      h2 {
        margin-top: 20px;
        margin-bottom: 10px;
      }
      h3 {
        margin-top: 20px;
        margin-bottom: 10px;
      }
      img {
        display: block;
        width: 100%;
      }
    </style>
    <script src="/js/lightgallery.min.js"></script>
    <script src="/js/lg-fullscreen.min.js"></script>
    <script src="/js/lg-zoom.min.js"></script>
    <script src="/js/lg-thumbnail.min.js"></script>
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
            <li class="selected disabled">Thorne Collection</li>
            <li><a href="/about">About</a></li>
          </ul>
        </div>
        <div id="sl-navlink">
          <a href="/">Home</a>
          &gt;
        </div>
        <h1>Thorne Collection</h1>
        <p>
          The tools on this site are part of the Thorne Collection,
          which is available for viewing on the second floor of Smith's Tavern
          in the Town of North Castle.
          The collction is organized in a set of displays, shown below.
        </p>
        <h2>Displays</h2>
        <div id="panel3" style="display:none">
          Panel #3
        </div>
        <div id="gallery">
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%203.jpg" data-sub-html="#panel3">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-3.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%203%20II.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-3-2.jpg"></img>
          </a>
          <!--<h3>Panel #4</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%204.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-4.jpg"></img>
          </a>
          <!--<h3>Panel #5</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%205%20I.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-3.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%205%20II.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-3-2.jpg"></img>
          </a>
          <!--<h3>Panel #6</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%206%20I.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-3.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%206%20II.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-3-2.jpg"></img>
          </a>
          <!--<h3>Panel #7</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%207.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-7.jpg"></img>
          </a>
          <!--<h3>Panel #8</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%208.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-8.jpg"></img>
          </a>
          <!--<h3>Panel #9</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%209.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-9.jpg"></img>
          </a>
          <!--<h3>Panel #10-11</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panels%2010-11.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-10-11.jpg"></img>
          </a>
          <!--<h3>Panel #12</h3>-->
          <!--Coming soon!-->
          <!-- <img src=""></img> -->
          <!--<h3>Panel #13</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2013.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-13.jpg"></img>
          </a>
          <!--<h3>Panel #14</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2014.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-14.jpg"></img>
          </a>
          <!--<h3>Panel #15</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2015.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-15.jpg"></img>
          </a>
          <!--<h3>Panel #16</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2016.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-16.jpg"></img>
          </a>
          <!--<h3>Panel #17</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2017.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-17.jpg"></img>
          </a>
          <!--<h3>Panel #18</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2018.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-18.jpg"></img>
          </a>
          <!--<h3>Window #1</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Window%20%231.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/Window%20%231.jpg"></img>
          </a>
          <!--<h3>Window #2</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Window%20%232%20I.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/Window%20%232%20I.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Window%20%232%20II.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/Window%20%232%20II.jpg"></img>
          </a>
          <!--<h3>Window #3</h3>-->
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Window%203.jpg">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/Window%203.jpg"></img>
          </a>
        </div>
        <script>
          lightGallery(document.getElementById('gallery'));
        </script>    
        <h2>All Tools</h2>
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
      <div class="clear"></div>
    </div>
  </body>
</html>

<%-- //[END all]--%>
