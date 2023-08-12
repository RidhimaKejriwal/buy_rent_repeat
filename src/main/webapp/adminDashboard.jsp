<%-- 
    Document   : adminDashboard
    Created on : 12-Aug-2023, 9:34:40 am
    Author     : Dell
--%>
<%@page import="com.learn.buyrent.entities.Admin"%>
<%
    Admin admin = (Admin) session.getAttribute("admin-login");
    if (admin == null) {
        session.setAttribute("error_message", "You are not logged in!! Login first..");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>buyRent : Admin Dashboard</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js" ></script>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <h1>Hello this is admin page..</h1>
    </body>
</html>
