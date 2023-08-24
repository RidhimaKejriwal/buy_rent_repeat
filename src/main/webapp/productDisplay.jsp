<%-- 
    Document   : productDisplay
    Created on : 15-Aug-2023, 11:38:26 pm
    Author     : Dell
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.buyrent.entities.Category"%>
<%@page import="com.learn.buyrent.entities.Seller"%>
<%@page import="com.learn.buyrent.entities.Admin"%>
<%
    User user = (User) session.getAttribute("current-user");
    Seller seller = (Seller) session.getAttribute("current-seller");
    Admin admin = (Admin) session.getAttribute("admin-login");
    LocalDate date = LocalDate.now();
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
        <%            int product_Id = Integer.parseInt(request.getParameter("product_id"));
            ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
            SellerDao sdao = new SellerDao(FactoryProvider.getFactory());
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            Product product = pdao.getProductbyId(product_Id);            
            Seller nseller = sdao.getUserById(product.getSeller_id());
//            System.out.println(product);
%>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/message.jsp" %>

        <div class="container py-2">
            <div class="row" data-masonry='{"percentPosition": true }'>
                <%                    String sellprice = pdao.getSellingPrice(product.getpSellPrice());
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
                                        <p style="margin-bottom:0"> <%= nseller.getUserName()%> </p>
                                        <p style="margin-bottom:0"> <%= nseller.getUserAddress()%> (<%= nseller.getUserCity()%>) </p>
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
                                if (user != null) {
                                    if (product.getpRentPrice() != 0 && product.getpSellPrice() != 0) {


                            %>
                            <button data-bs-toggle="modal" data-bs-target="#Product-Rent" style="padding: 5px; padding-left: 10px; padding-right: 10px;" class="btn btn-success text-white"> Rent </button>
                            <button data-bs-toggle="modal" data-bs-target="#Product-Sell" style="padding: 5px; padding-left: 10px; padding-right: 10px;" class="btn btn-success text-white"> Buy </button>
                            <%                            } else if (product.getpRentPrice() == 0) {
                            %>
                            <button data-bs-toggle="modal" data-bs-target="#Product-Sell" style="padding: 5px; padding-left: 10px; padding-right: 10px;" class="btn btn-success text-white"> Buy </button>
                            <%
                            } else {
                            %>
                            <button data-bs-toggle="modal" data-bs-target="#Product-Rent" style="padding: 5px; padding-left: 10px; padding-right: 10px;" class="btn btn-success text-white"> Rent </button>
                            <%
                                    }
                                }
                            %>

                            <%
                                if (user == null && seller == null && admin == null) {
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

        <!--Rent modal-->
        <div class="modal fade" id="Product-Rent" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-center text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel"> Rent Product </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div style="">
                            <form action="RentProductServlet" method="post">
                                <input type="hidden" name="u_name" value="<%= user.getUserName() %>">
                                <input type="hidden" name="u_id" value="<%= user.getUserId() %>">
                                <input type="hidden" name="s_id" value="<%= nseller.getUserId() %>">
                                <input type="hidden" name="p_id" value="<%= product.getpId() %>">
                                <table class="table">
                                    <tr>
                                        <td>Product Name : </td>
                                        <td><input type="text" class="form-control" name="p_name" value="<%= product.getpName()%>" readonly></td>
                                    </tr>                                    
                                    <tr>
                                        <td>Seller Name :</td>
                                        <td><input type="text" class="form-control" name="s_name" value="<%= nseller.getUserName()%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>Seller Address :</td>
                                        <td><input type="text" class="form-control" name="s_address" value="<%= nseller.getUserAddress()%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>Rent Price :</td>
                                        <td><input type="number" class="form-control" name="p_rentprice" readonly value="<%= product.getpRentPrice()%>"></td>
                                        <td><input type="text" class="form-control" name="p_rentduration" readonly value="<%= product.getpRentDuration()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Your requested duration<span style="color: red">*</span> :</td>
                                        <td>
                                            <input type="number" class="form-control" name="requested_duration_number" required>
                                        </td>
                                        <td>
                                            <select class="form-control" name="requested_duration_type" required>
                                                <option value="day(s)">day(s)</option>
                                                <option value="week(s)">week(s)</option>
                                                <option value="month(s)">month(s)</option>
                                            </select>
                                        </td>
                                    </tr>                                    
                                    <tr>
                                        <td>Exchange date<span style="color: red">*</span> :</td>
                                        <td><input type='date' class="form-control" name='date' min="<%=date%>" required></td>
                                    </tr>
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn custom-bg text-white">Send Request</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sell product-->
        <div class="modal fade" id="Product-Sell" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-center text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel"> Sell Product </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div style=""> 
                            <form action="SellProductServlet" method="post"> 
                                <input type="hidden" name="u_name" value="<%= user.getUserName() %>">
                                <input type="hidden" name="u_id" value="<%= user.getUserId() %>">
                                <input type="hidden" name="s_id" value="<%= nseller.getUserId() %>">
                                <input type="hidden" name="p_id" value="<%= product.getpId() %>">
                                <table class="table">
                                    <tr>
                                        <td>Product Name : </td>
                                        <td><input type="text" class="form-control" name="p_name" value="<%= product.getpName()%>" readonly></td>
                                    </tr>                                    
                                    <tr>
                                        <td>Seller Name :</td>
                                        <td><input type="text" class="form-control" name="s_name" value="<%= nseller.getUserName()%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>Seller Address :</td>
                                        <td><input type="text" class="form-control" name="s_address" value="<%= nseller.getUserAddress()%>" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>Selling Price :</td>
                                        <td><input type="number" class="form-control" name="p_sellingprice" readonly="" value="<%= product.getpSellPrice() %>"></td>
                                    </tr>
                                    <tr>
                                        <td>Mode of delivery<span style="color: red">*</span> :</td>                                        
                                        <td>
                                            <select class="form-control" name="delivery_mode" required>
                                                <option value="pickup">Pickup from seller(free)</option>                                                                                       
                                                <option value="deliver">Get it delivered(+10%)</option>                                                                                       
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Exchange date<span style="color: red">*</span> :</td>
                                        <td><input type='date' class="form-control" name='date' min="<%=date%>" required></td>
                                    </tr>
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn custom-bg text-white">Send Request</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
