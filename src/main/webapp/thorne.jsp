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
          which is available for viewing on the second floor of
          Smith's Tavern in the Town of North Castle.  The collction
          is organized in a set of displays, shown below. The displays
          are shown in clockwise order, starting from the entrance to
          the collection room. Click on any picture to zoom in.
        </p>
        <h2>Displays</h2>
        <div id="panel-1" style="display:none">Panel #1</div>
        <div id="panel-2" style="display:none">Panel #2</div>
        <div id="panel-3" style="display:none">Panel #3</div>
        <div id="panel-4" style="display:none">Panel #4</div>
        <div id="panel-5" style="display:none">Panel #5</div>
        <div id="panel-6" style="display:none">Panel #6</div>
        <div id="panel-7" style="display:none">Panel #7</div>
        <div id="panel-8" style="display:none">Panel #8</div>
        <div id="panel-9" style="display:none">Panel #9</div>
        <div id="panel-10" style="display:none">Panel #10</div>
        <div id="panel-11" style="display:none">Panel #11</div>
        <div id="panel-12" style="display:none">Panel #12</div>
        <div id="panel-13" style="display:none">Panel #13</div>
        <div id="panel-14" style="display:none">Panel #14</div>
        <div id="panel-15" style="display:none">Panel #15</div>
        <div id="panel-16" style="display:none">Panel #16</div>
        <div id="panel-17" style="display:none">Panel #17</div>
        <div id="panel-18" style="display:none">Panel #18</div>
        <div id="window-1" style="display:none">Window #1</div>
        <div id="window-2" style="display:none">Window #2</div>
        <div id="gallery">
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%201.jpg" data-sub-html="#panel-1">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-1.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%202.jpg" data-sub-html="#panel-2">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-2.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Window%20%231.jpg" data-sub-html="#window-1">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-window-1.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%203.jpg" data-sub-html="#panel-3">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-3.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%204.jpg" data-sub-html="#panel-4">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-4.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Window%20%232%20I.jpg" data-sub-html="#window-2">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-window-2.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%205%20I.jpg" data-sub-html="#panel-5">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-5.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%205%20II.jpg" data-sub-html="#panel-5">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-5-2.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%206%20I.jpg" data-sub-html="#panel-6">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-6.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%206%20II.jpg" data-sub-html="#panel-6">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-6-2.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%207.jpg" data-sub-html="#panel-7">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-7.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%208.jpg" data-sub-html="#panel-8">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-8.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%209.jpg" data-sub-html="#panel-9">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-9.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2010.jpg" data-sub-html="#panel-10">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-10.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panels%2010-11.jpg" data-sub-html="#panel-11">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-11.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2012.jpg" data-sub-html="#panel-12">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-12.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2013.jpg" data-sub-html="#panel-13">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-13.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2014.jpg" data-sub-html="#panel-14">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-14.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2015.jpg" data-sub-html="#panel-15">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-15.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2016.jpg" data-sub-html="#panel-16">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-16.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2017.jpg" data-sub-html="#panel-17">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-17.jpg"></img>
          </a>
          <a href="https://storage.googleapis.com/north-castle-tools-site-images/Panel%2018.jpg" data-sub-html="#panel-18">
            <img src="https://storage.googleapis.com/north-castle-tools-site-images/thumb-panel-18.jpg"></img>
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
