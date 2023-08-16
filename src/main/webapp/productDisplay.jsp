<%-- 
    Document   : productDisplay
    Created on : 15-Aug-2023, 11:38:26 pm
    Author     : Dell
--%>

<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
<%@page import="com.learn.buyrent.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int product_Id = Integer.parseInt(request.getParameter("product_id"));
            ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
            Post p = d.getPostByPostId(postId);
        %>
    </body>
</html>
