<%-- 
    Document   : ScheduledExchanges
    Created on : 24-Aug-2023, 6:49:21 pm
    Author     : Dell
--%>

<%@page import="com.learn.buyrent.entities.Product"%>
<%@page import="com.learn.buyrent.entities.RentCart"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.buyrent.dao.ProductDao"%>
<%@page import="com.learn.buyrent.dao.RentCartDao"%>
<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
<%@page import="com.learn.buyrent.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="com.learn.buyrent.entities.Seller"%>
<%@page import="com.learn.buyrent.entities.User"%>
<%
    User nuser = (User) session.getAttribute("current-user");
    Seller seller = (Seller) session.getAttribute("current-seller");
// getting count
    Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());
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
                <%                    RentCartDao rcdao = new RentCartDao(FactoryProvider.getFactory());
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<RentCart> list = rcdao.allRentedApprovedIncompleteProductwithUserId(nuser.getUserId());
                %>

                <div class="container py-2">
                    <div class="row" data-masonry='{"percentPosition": true }'>
                        <%
                            for (RentCart rentProduct : list) {
                                Product product = pdao.getProductbyId(rentProduct.getProductId());
                        %>
                        <div class="row" width="100%">
                            <div class="card mt-4 product-card">                                
                                <div class="card-body container" style="float: left" >
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="img/products/<%= product.getpPhoto1()%>" style="height: 100px;  width: auto;" class="card-img-top" alt="...">
                                        </div>
                                        <div class="col-md-4" style="padding-left: 20px;">
                                            <h5 style="padding-left: 10px;" class="card-title mt-3"> <%= product.getpName()%></h5>
                                            <p class="card-text"> <%= Helper.get10Words(product.getpDesc())%> <a href="productDisplay.jsp?product_id=<%= product.getpId()%>">Show more</a></p>
                                        </div>
                                        <div class="col-md-4" style="margin-top: 15px;">
                                            <h6>Exchange Date: <%= rentProduct.getExchangeDate()%></h6>
                                            <%
                                                if (rentProduct.getRentDuration() != null) {
                                            %>
                                            <h6>Rent Duration: <%= rentProduct.getRentDuration()%></h6>
                                            <h6>Rent Price: <%= rentProduct.getRentPrice()%></h6>
                                            <%
                                            } else {
                                            %>
                                            <h6>Mode of Delivery: <%= rentProduct.getModeOfDelivery()%></h6>
                                            <h6>Buying Price: <%= rentProduct.getBuyingPrice()%></h6>
                                            <%
                                                }
                                            %>
                                        </div>
                                        <div class="col-md-2 text-center" style="margin-top: 25px;">
                                            <%
                                                if (rentProduct.getIsDelivered().equals("no")) {
                                            %>
                                            <button class="btn btn-outline-success"> Not Delivered </button>
                                            <%
                                            } else if (rentProduct.getIsReturned().equals("no") && rentProduct.getVerifyOTP() == null) {
                                            %>
                                            <a href="CartServlet?product_id=<%= rentProduct.getId()%>&op=return"><button class="btn custom-bg text-white"> Return </button></a>
                                            <%
                                            } else if (rentProduct.getIsReturned().equals("no") && rentProduct.getVerifyOTP() != null) {
                                            %>
                                            <form class="form-group" action="CartServlet?product_id=<%= rentProduct.getId()%>&op=verifyreturn" method="post">
                                                <div>
                                                    <input required name="authcode" type="text" class="form-control" id="code" aria-describedby="emailHelp">
                                                    <button style="margin-top: 20px;" type="submit" value="verify" class="btn custom-bg text-white">Verify</button>
                                                </div>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
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
        <!--Edit user profile-->
        <div class="modal fade" id="Edit-profile-user" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

        <%
        } else if (seller != null) {
        %>  
        <%@include file="components/userDashboardHeader.jsp" %>        
        <!--Show Requests-->
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-10">
                <%@include file="components/message.jsp" %>
                <%                    RentCartDao rcdao = new RentCartDao(FactoryProvider.getFactory());
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<RentCart> list = rcdao.allRentedApprovedIncompleteProductwithSellerId(seller.getUserId());
                %>

                <div class="container py-2">
                    <div class="row" data-masonry='{"percentPosition": true }'>
                        <%
                            for (RentCart rentProduct : list) {
                                Product product = pdao.getProductbyId(rentProduct.getProductId());
                        %>
                        <div class="row" width="100%">
                            <div class="card mt-4 product-card">                                
                                <div class="card-body container" style="float: left" >
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="img/products/<%= product.getpPhoto1()%>" style="height: 100px;  width: auto;" class="card-img-top" alt="...">
                                        </div>
                                        <div class="col-md-4" style="padding-left: 20px;">
                                            <h5 style="padding-left: 10px;" class="card-title mt-3"> <%= product.getpName()%></h5>
                                            <p class="card-text"> <%= Helper.get10Words(product.getpDesc())%> <a href="productDisplay.jsp?product_id=<%= product.getpId()%>">Show more</a></p>
                                        </div>
                                        <div class="col-md-3" style="margin-top: 15px;">
                                            <h6>Exchange Date: <%= rentProduct.getExchangeDate()%></h6>
                                            <%
                                                if (rentProduct.getRentDuration() != null) {
                                            %>
                                            <h6>Rent Duration: <%= rentProduct.getRentDuration()%></h6>
                                            <h6>Rent Price: <%= rentProduct.getRentPrice()%></h6>
                                            <%
                                            } else {
                                            %>
                                            <h6>Mode of Delivery: <%= rentProduct.getModeOfDelivery()%></h6>
                                            <h6>Buying Price: <%= rentProduct.getBuyingPrice()%></h6>
                                            <%
                                                }
                                            %>
                                        </div>
                                        <div class="col-md-3 text-center" style="margin-top: 25px;">
                                            <%
                                                if (rentProduct.getIsDelivered().equals("no") && rentProduct.getVerifyOTP() == null) {
                                            %>
                                            <a href="CartServlet?product_id=<%= rentProduct.getId()%>&op=deliver"><button class="btn custom-bg text-white"> Deliver </button></a>
                                            <%
                                            } else if (rentProduct.getIsDelivered().equals("no") && rentProduct.getVerifyOTP() != null) {
                                            %>
                                            <form class="form-group" action="CartServlet?product_id=<%= rentProduct.getId()%>&op=verify" method="post">
                                                <div>
                                                    <input required name="authcode" type="text" class="form-control" id="code" aria-describedby="emailHelp">
                                                    <button style="margin-top: 20px;" type="submit" value="verify" class="btn custom-bg text-white">Verify</button>
                                                </div>
                                            </form>
                                            <%
                                            } else if (rentProduct.getIsReturned().equals("no")) {
                                            %>
                                            <button class="btn btn-outline-success">Return Pending</button>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
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
        <%@include file="components/modals.jsp" %>
        <%
            }
        %>


    </body>
</html>
