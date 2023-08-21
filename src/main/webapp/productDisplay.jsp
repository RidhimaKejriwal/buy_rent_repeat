<%-- 
    Document   : productDisplay
    Created on : 15-Aug-2023, 11:38:26 pm
    Author     : Dell
--%>

<%@page import="com.learn.buyrent.entities.Seller"%>
<%@page import="com.learn.buyrent.entities.Admin"%>
<%
    User user = (User) session.getAttribute("current-user");
    Seller seller = (Seller) session.getAttribute("current-seller");
    Admin admin = (Admin) session.getAttribute("admin-login");
    
%>

<%@page import="com.learn.buyrent.dao.CategoryDao"%>
<%@page import="com.learn.buyrent.dao.SellerDao"%>
<%@page import="com.learn.buyrent.helper.Helper"%>
<%@page import="com.learn.buyrent.entities.Product"%>
<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
<%@page import="com.learn.buyrent.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js" ></script>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%
            int product_Id = Integer.parseInt(request.getParameter("product_id"));
            ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
            SellerDao sdao = new SellerDao(FactoryProvider.getFactory());
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            Product product = pdao.getProductbyId(product_Id);
//            System.out.println(product);
        %>
        <%@include file="components/navbar.jsp" %>

        <div class="container py-2">
            <div class="row" data-masonry='{"percentPosition": true }'>
                <%                    
                    String sellprice = pdao.getSellingPrice(product.getpSellPrice());
                    String rentprice = pdao.getRentPrice(product.getpRentPrice());
                    String stars = pdao.getStars(product.getpQuality());
                %>
                <div class="col-md-12">
                    <div class="card mt-4 product-card1">                                
                        <div class="card-header custom-bg text-white">
                            <h5  class="card-title mt-3"> <%= product.getpName()%></h5>
                        </div>
                        <div class="card-body" >
                            <div class="container text-center">
                                <img src="img/products/<%= product.getpPhoto1()%>" style="max-height: 300px; max-width: 100%; width: auto;" class="card-img-top" alt="...">
                                <img src="img/products/<%= product.getpPhoto2()%>" style="max-height: 300px; max-width: 100%; width: auto;" class="card-img-top" alt="...">
                            </div>
                            <div class="container" style="margin-top: 10px;">
                                <div class="row product-card">
                                    <div class="col-md-3 text-center">
                                        <h5>Description: </h5>
                                    </div>
                                    <div class="col-md-9">
                                        <p style="margin-bottom:0"> <%= product.getpDesc()%></p>
                                    </div>
                                </div>
                                <div class="row product-card">
                                    <div class="col-md-3 text-center">
                                        <h5>Product Quality: </h5>
                                    </div>
                                    <div class="col-md-9">
                                        <p style="margin-bottom:0"> <%= stars%> </p>
                                    </div>
                                </div>
                                <div class="row product-card">
                                    <div class="col-md-3 text-center">
                                        <h5>Product Used: </h5>
                                    </div>
                                    <div class="col-md-9">
                                        <p style="margin-bottom:0"> <%= product.getpUsedFor()%> </p>
                                    </div>
                                </div>
                                <div class="row product-card">
                                    <div class="col-md-3 text-center">
                                        <h5>Product by: </h5>
                                    </div>
                                    <div class="col-md-9">
                                        <p style="margin-bottom:0"> <%= sdao.getUserById(product.getSeller_id()).getUserName()%> </p>
                                        <p style="margin-bottom:0"> <%= sdao.getUserById(product.getSeller_id()).getUserAddress()%> (<%= sdao.getUserById(product.getSeller_id()).getUserCity()%>) </p>
                                    </div>
                                </div>
                                <div class="row product-card">
                                    <div class="col-md-3 text-center">
                                        <h5>Rent Price: </h5>
                                    </div>
                                    <div class="col-md-9">
                                        <p style="margin-bottom:0"> <%= rentprice%> <span class="text-secondary rent-duration"> <%= product.getpRentDuration()%> </span> </p>
                                    </div>
                                </div>
                                <div class="row product-card">
                                    <div class="col-md-3 text-center">
                                        <h5> Sell Price: </h5>
                                    </div>
                                    <div class="col-md-9">
                                        <p style="margin-bottom:0"> <%= sellprice%> </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <%
                                if(user != null)
                                {
                            %>
                            <a href="cart.jsp"><button style="padding: 5px;" class="btn btn-success text-white"> Add to cart </button></a>
                            <%
                                }
                            %>
                            
                            <%
                                if(user == null && seller == null && admin == null)
                                {
                            %>
                            <a href="login.jsp"><button style="padding: 5px;" class="btn btn-success text-white"> Add to cart </button></a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
