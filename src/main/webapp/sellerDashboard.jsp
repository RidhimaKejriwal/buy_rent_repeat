<%@page import="com.learn.buyrent.entities.Seller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Seller nseller = (Seller) session.getAttribute("current-seller");
    if (nseller == null) {
        session.setAttribute("error_message", "You are not logged in!! Login first..");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
