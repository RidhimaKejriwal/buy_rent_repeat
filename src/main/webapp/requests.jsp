<%-- 
    Document   : requests
    Created on : 23-Aug-2023, 11:32:27 pm
    Author     : Dell
--%>
<%@page import="com.learn.buyrent.entities.RentCart"%>
<%@page import="com.learn.buyrent.entities.Seller"%>
<%@page import="com.learn.buyrent.entities.User"%>
<%
    User nuser = (User) session.getAttribute("current-user");
    Seller seller = (Seller) session.getAttribute("current-seller"); 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js" ></script>
        <%@include file="components/common_css_js.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>

    </head>
    <body>
        <%
            if (nuser != null) {
        %>
        <%@include file="components/userDashboardHeader.jsp" %>        
        <!--Show Requests-->
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-10">

            </div>
        </div>
        <%
            }
        %>
    </body>
</html>
