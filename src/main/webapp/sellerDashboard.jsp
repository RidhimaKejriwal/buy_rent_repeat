<%@page import="com.learn.buyrent.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
<%@page import="com.learn.buyrent.dao.CategoryDao"%>
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
        <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
    </head>
    <body>
        <%@include file="components/sel_navbar.jsp" %>
        <div class="row mt-3 mx-2">
            <div class="col-md-2">

                <div class="list-group mt-4">
                    <a href="" class="list-group-item list-group-item-action active custom-bg " style="border: #ef0078" aria-current="true">
                        Menu
                    </a>

                    <a href="#" data-bs-toggle="modal" data-bs-target="#Edit-profile" class="list-group-item list-group-item-action">Edit Profile</a>
                    <a href="requests.jsp" class="list-group-item list-group-item-action">Request</a>
                    <a href="#" data-bs-toggle="modal" data-bs-target="#Add-product" class="list-group-item list-group-item-action">Add new product</a>
                    <a href="ScheduledExchanges.jsp" class="list-group-item list-group-item-action">Scheduled Exchanges</a>

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
                                            <img src="img/seller/<%= nseller.getUserPic()%>" alt="img" style="height: 100px; width: 100px; margin-left: 25px;">
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
                            <td style="border: 1px solid; padding: 2px;"><a id="enable" style="color: #607D8B; text-decoration: none;" href="enable.jsp">Enabled Products</a></td>
                            <td style="border: 1px solid; padding: 2px;"><a id="disable" style="color: #607D8B; text-decoration: none;" href="disable.jsp">Disabled Products</a></td>
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
                            <img src="img/seller/<%= nseller.getUserPic()%>" class="img-fluid" style="border-radius:50%; max-width: 150px">
                            <br>
                            <h1 class="modal-title fs-5 mt-3" id="exampleModalLabel"><%= nseller.getUserName()%></h1>
                            <div style="">
                                <h5 class="mt-2">Please Edit Carefully!!</h5> 
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="person" value="seller">
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

        <!--Add new product-->
        <div class="modal fade" id="Add-product" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-center text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel"> Add Product </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div style=""> 
                            <form action="AddProductServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="operation" value="addProduct">
                                <table class="table">
                                    <tr>
                                        <td>Seller id : </td>
                                        <td><input type="text" class="form-control" name="p_sellerid" readonly value="<%= nseller.getUserId() %>"></td>
                                    </tr>
                                    <tr>
                                        <%
                                            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                            List<Category> list1 = cdao.getCategories();
                                        %>
                                        <td>Category<span style="color: red">*</span> : </td>
                                        <td>
                                            <select name="p_category" required>
                                                <option value="0">Other</option>
                                                <%
                                                    for (Category category : list1) {
                                                %>

                                                <option value="<%= category.getCategoryId()%>" ><%= category.getCategoryTitle()%></option>

                                                <%
                                                    }
                                                %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Product Name<span style="color: red">*</span> :</td>
                                        <td><input type="text" class="form-control" name="p_name" required></td>
                                    </tr>
                                    <tr>
                                        <td>Product Description<span style="color: red">*</span> :</td>
                                        <td><input type="text" class="form-control" name="p_desc" required></td>
                                    </tr>
                                    <tr>
                                        <td>Photo1<span style="color: red">*</span> :</td>
                                        <td><input type="file" class="form-control" name="p_image1" required></td>
                                    </tr>
                                    <tr>
                                        <td>Photo2<span style="color: red">*</span> :</td>
                                        <td><input type="file" class="form-control" name="p_image2" required></td>
                                    </tr>
                                    <tr>
                                        <td>Selling Price :</td>
                                        <td><input type="number" class="form-control" name="p_sellingprice" value="0"></td>
                                    </tr>
                                    <tr>
                                        <td>Rent Price :</td>
                                        <td><input type="number" class="form-control" name="p_rentprice" value="0"></td>
                                        <td>
                                            <select name="p_rentduration">
                                                <option value="">None</option>
                                                <option>per Day</option>                                        
                                                <option>per Week</option>                                        
                                                <option>per Month</option>                                        
                                                <option>for 3 months</option>                                        
                                                <option>for 6 months</option>                                        
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Quality<span style="color: red">*</span> :</td>
                                        <td>
                                            <select name="p_quality" required>
                                                <option value="5">5 (Excellent)</option>                                        
                                                <option value="4">4 (Very Good)</option>                                        
                                                <option value="3">3 (Good)</option>                                        
                                                <option value="2">2 (Average)</option>                                        
                                                <option value="1">1 (Poor)</option>                                        
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Used for<span style="color: red">*</span> :</td>
                                        <td>
                                            <select name="p_usedfor" required>
                                                <option>less than 1 year</option>
                                                <option>between 1 & 2 year</option>
                                                <option>between 2 & 3 year</option>
                                                <option>more than 3 year</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn custom-bg text-white">Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>


