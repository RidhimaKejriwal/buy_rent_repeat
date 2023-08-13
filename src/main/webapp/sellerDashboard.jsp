<%@page import="com.learn.buyrent.entities.Product"%>
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
        <title>buyRent : SELLER DASHBOARD</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js" ></script>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/sel_navbar.jsp" %>
        <%@include file="components/common_modals.jsp" %>
        <div class="row mt-3 mx-2">
            <div class="col-md-2">

                <div class="list-group mt-4">
                    <a href="" class="list-group-item list-group-item-action active custom-bg " style="border: #ef0078" aria-current="true">
                        Menu
                    </a>

                    <a href="#" data-bs-toggle="modal" data-bs-target="#Edit-profile" class="list-group-item list-group-item-action">Edit Profile</a>
                    <a href="#" class="list-group-item list-group-item-action">Request</a>
                    <a href="#" data-bs-toggle="modal" data-bs-target="#Add-product" class="list-group-item list-group-item-action">Add new product</a>
                    <a href="#" class="list-group-item list-group-item-action">Schedule Exchanges</a>

                </div>
            </div>
            <div class="col-md-10">
                <!--profile show-->
                <div class="container">
                    <div class="row" data-masonry='{"percentPosition": true }'>
                        <div class="card mt-4 product-card">                                
                            <div class="card-body" >
                                <table width="100%">
                                    <tr>
                                        <td width="20%">
                                            <img src="img/default.png" alt="img" style="height: 100px; width: 100px; margin-left: 25px;">
                                        </td>
                                        <td>
                                            <table width="100%">
                                                <tr class="text-center">
                                                    <td colspan="2" style="color: #075B7A"><h1><%= nseller.getUserName()%></h1></td>
                                                </tr>
                                                <tr>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Email: <span style="color: #212121"><%= nseller.getUserEmail()%></span></h5></td>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Phone: <span style="color: #212121"><%= nseller.getUserPhone()%></span></h5></td>
                                                </tr>
                                                <tr>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Address: <span style="color: #212121"><%= nseller.getUserAddress()%></span></h5></td>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">City: <span style="color: #212121"><%= nseller.getUserCity()%></span></h5></td>
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
                            <td style="border: 1px solid; padding: 2px;"><a style="color: black; text-decoration: none;" href="#">Enabled Products</a></td>
                            <td style="border: 1px solid; padding: 2px;"><a style="color: black; text-decoration: none;" href="#">Disabled Products</a></td>
                        </tr>
                    </table>
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
                            <img src="/buyRent/img/default.png" class="img-fluid" style="border-radius:50%; max-width: 150px">
                            <br>
                            <h1 class="modal-title fs-5 mt-3" id="exampleModalLabel"><%= nseller.getUserName()%></h1>
                            <div style="">
                                <h5 class="mt-2">Please Edit Carefully!!</h5> 
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= nseller.getUserId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= nseller.getUserEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= nseller.getUserName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= nseller.getUserPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Phone :</td>
                                            <td><input type="phone" class="form-control" name="user_phone" value="<%= nseller.getUserPhone()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Address : </td>
                                            <td><input type="text" class="form-control" name="user_address" value="<%= nseller.getUserAddress()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>City : </td>
                                            <td><input type="text" class="form-control" name="user_city" value="<%= nseller.getUserCity()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Profile pic :</td>
                                            <td><input type="file" class="form-control" name="image" value="<%= nseller.getUserPic()%>"></td>
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


