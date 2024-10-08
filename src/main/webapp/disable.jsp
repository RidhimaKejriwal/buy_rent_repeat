<%-- 
    Document   : enable
    Created on : 15-Aug-2023, 7:45:15 am
    Author     : Dell
--%>

<%@page import="com.learn.buyrent.helper.Helper"%>
<%@page import="com.learn.buyrent.entities.Product"%>
<%@page import="com.learn.buyrent.dao.ProductDao"%>
<%@page import="com.learn.buyrent.entities.Seller"%>
<%
    Seller seller = (Seller) session.getAttribute("current-seller");
    if (seller == null) {
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
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js" ></script>
        <%@include file="components/common_css_js.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
    </head>
    <body onload="makeActive('disable')">
        <%@include file="components/sel_navbar.jsp" %>
        <%@include file="components/modals.jsp" %>
        <div class="row mt-3 mx-2">
            <!--Menu bar-->
            <div class="col-md-2">
                <div class="list-group mt-4">
                    <a href="" class="list-group-item list-group-item-action active custom-bg " style="border: #ef0078" aria-current="true">Menu</a>
                    <a href="#" data-bs-toggle="modal" data-bs-target="#Edit-profile" class="list-group-item list-group-item-action">Edit Profile</a>
                    <a href="#" class="list-group-item list-group-item-action">Request</a>
                    <a href="#" data-bs-toggle="modal" data-bs-target="#Add-product" class="list-group-item list-group-item-action">Add new product</a>
                    <a href="#" class="list-group-item list-group-item-action">Schedule Exchanges</a>
                </div>
            </div>
            <div class="col-md-10">
                <!--profile show-->
                <%@include file="components/message.jsp" %>
                <div class="container">
                    <div class="row" data-masonry='{"percentPosition": true }'>
                        <div class="card mt-4 product-card">                                
                            <div class="card-body" >
                                <table width="100%">
                                    <tr>
                                        <td width="20%">
                                            <img src="img/seller/<%= seller.getUserPic()%>" alt="img" style="height: 100px; width: 100px; margin-left: 25px;">
                                        </td>
                                        <td>
                                            <table width="100%">
                                                <tr class="text-center">
                                                    <td colspan="2" style="color: #075B7A"><h1><%= seller.getUserName()%></h1></td>
                                                </tr>
                                                <tr>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Email: <span style="color: #212121"><%= seller.getUserEmail()%></span></h5></td>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Phone: <span style="color: #212121"><%= seller.getUserPhone()%></span></h5></td>
                                                </tr>
                                                <tr>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Address: <span style="color: #212121"><%= seller.getUserAddress()%></span></h5></td>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">City: <span style="color: #212121"><%= seller.getUserCity()%></span></h5></td>
                                                </tr>
                                            </table>                                            
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!--available not-available-->
                <div class="container">
                    <table class="enable">
                        <tr  class="text-center">
                            <td style="border: 1px solid; padding: 2px;"><a id="enable" style="color: #607D8B; text-decoration: none;" href="enable.jsp">Enabled Products</a></td>
                            <td style="border: 1px solid; padding: 2px;"><a id="disable" style="color: #607D8B; text-decoration: none;" href="disable.jsp">Disabled Products</a></td>
                        </tr>
                    </table>
                </div>

                <!--disabled products-->
                <%
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = pdao.getAllDisabledApprovedSellerProducts(seller.getUserId());
                %>

                <div class="container py-2">
                    <div class="row" data-masonry='{"percentPosition": true }'>
                        <%
                            for (Product product : list) {
                                String sellprice = pdao.getSellingPrice(product.getpSellPrice());
                                String rentprice = pdao.getRentPrice(product.getpRentPrice());
                        %>
                        <div class="col-md-4">
                            <div class="card mt-4 product-card" >                                
                                <div class="card-header custom-bg"></div>
                                <div class="card-body" >
                                    <div class="container text-center">
                                        <img src="img/products/<%= product.getpPhoto1()%>" style="max-height: 300px; max-width: 100%; width: auto;" class="card-img-top" alt="...">
                                    </div>
                                    <h5  class="card-title mt-3"> <%= product.getpName()%></h5>
                                    <p class="card-text"> <%= Helper.get10Words(product.getpDesc())%> <a href="productDisplay.jsp?product_id=<%= product.getpId() %>">Show more</a></p>
                                </div>
                                <div class="card-footer">
                                    <button style="border-color: #075B7A ; color: #075B7A; padding: 4px;" class="btn">Rent: <%= rentprice%><span class="text-secondary rent-duration"> <%= product.getpRentDuration()%> </span></button>
                                    <%
                                        if (sellprice.equals("not for sale")) {
                                    %>
                                    <button style="border-color: #075B7A ; color: #075B7A; padding: 4px;" class="btn"> Buy: <span class="text-secondary rent-duration"> <%= sellprice%> </span></button>
                                    <%
                                    } else {
                                    %>
                                    <button style="border-color: #075B7A ; color: #075B7A; padding: 4px;" class="btn"> Buy: <%= sellprice%></button>
                                    <% } %>
                                </div>
                            </div>
                        </div>

                        <%
                            }

                            if (list.size() == 0) {
                                out.println("<h2>No product available..</h2>");
                            }
                        %>
                    </div>
                </div>

            </div>
        </div>

    </body>
</html>
