<%@page import="com.learn.buyrent.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User nuser = (User) session.getAttribute("current-user");
    if (nuser == null) {
        session.setAttribute("error_message", "You are not logged in!! Login first..");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>buyRent : USER DASHBOARD</title>
    </head>
    <body>
        <h1>HELLO USER, THIS IS USER DASHBOARD</h1>
    </body>
</html>
