<%@page import="com.learn.buyrent.helper.Helper"%>
<%@page import="com.learn.buyrent.entities.Product"%>
<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.buyrent.dao.ProductDao"%>
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
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js" ></script>
        <%@include file="components/common_css_js.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="row mt-3 mx-2">
            <div class="col-md-2">
                <div class="list-group mt-4">
                    <a href="" class="list-group-item list-group-item-action active custom-bg " style="border: #ef0078" aria-current="true">Menu</a>
                    <a href="#" data-bs-toggle="modal" data-bs-target="#Edit-profile" class="list-group-item list-group-item-action">Edit Profile</a>
                    <a href="#" data-bs-toggle="modal" data-bs-target="#Show-cart" class="list-group-item list-group-item-action">Cart</a>
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
                                            <img src="img/user/<%= nuser.getUserPic()%>" alt="img" style="height: 100px; width: 100px; margin-left: 25px;">
                                        </td>
                                        <td>
                                            <table width="100%">
                                                <tr class="text-center">
                                                    <td colspan="2" style="color: #075B7A"><h1><%= nuser.getUserName()%></h1></td>
                                                </tr>
                                                <tr>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Email: <span style="color: #212121"><%= nuser.getUserEmail()%></span></h5></td>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Phone: <span style="color: #212121"><%= nuser.getUserPhone()%></span></h5></td>
                                                </tr>
                                                <tr>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Address: <span style="color: #212121"><%= nuser.getUserAddress()%></span></h5></td>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">City: <span style="color: #212121"><%= nuser.getUserCity()%></span></h5></td>
                                                </tr>
                                            </table>                                            
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!--browse products-->
                <%
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = pdao.getAllEnabledApprovedProducts();
                %>

                <div class="container py-2">
                    <div class="row" data-masonry='{"percentPosition": true }'>
                        <%
                            int j;
                            if (list.size() > 6) {
                                j = 6;
                            } else {
                                j = list.size();
                            }
                            //                    for (Product product : list) {
                            for (int i = 0; i < j; i++) {
                                Product product = list.get(i);
                                String sellprice = pdao.getSellingPrice(product.getpSellPrice());
                                String rentprice = pdao.getRentPrice(product.getpRentPrice());
                        %>
                        <div class="col-md-4">
                            <div class="card mt-4 product-card">                                
                                <div class="card-header custom-bg"></div>
                                <div class="card-body" >
                                    <div class="container text-center">
                                        <img src="img/products/<%= product.getpPhoto1()%>" style="max-height: 200px; max-width: 100%; width: auto" class="card-img-top" alt="...">
                                    </div>
                                    <h5  class="card-title mt-3"> <%= product.getpName()%></h5>
                                    <p class="card-text"> <%= Helper.get10Words(product.getpDesc())%> <a href="productDisplay.jsp?product_id=<%= product.getpId()%>">Show more</a></p>
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
                            //                    }
                        %>
                    </div>
                </div>

            </div>
        </div>

        <!--Edit profile-->
        <div class="modal fade" id="Edit-profile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-center text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel"> Edit Profile </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="img/seller/<%= nuser.getUserPic()%>" class="img-fluid" style="border-radius:50%; max-width: 150px">
                            <br>
                            <h1 class="modal-title fs-5 mt-3" id="exampleModalLabel"><%= nuser.getUserName()%></h1>
                            <div style="">
                                <h5 class="mt-2">Please Edit Carefully!!</h5> 
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="person" value="user">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= nuser.getUserId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= nuser.getUserEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= nuser.getUserName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= nuser.getUserPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Phone :</td>
                                            <td><input type="phone" class="form-control" name="user_phone" value="<%= nuser.getUserPhone()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Address : </td>
                                            <td><input type="text" class="form-control" name="user_address" value="<%= nuser.getUserAddress()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>City : </td>
                                            <td><input type="text" class="form-control" name="user_city" value="<%= nuser.getUserCity()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Profile pic :</td>
                                            <td><input type="file" class="form-control" name="image" value="<%= nuser.getUserPic()%>"></td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn custom-bg text-white"><span class="fa fa-edit"></span> Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
