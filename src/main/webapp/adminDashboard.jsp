<%-- 
    Document   : adminDashboard
    Created on : 12-Aug-2023, 9:34:40 am
    Author     : Dell
--%>
<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
<%@page import="com.learn.buyrent.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="com.learn.buyrent.entities.Admin"%>
<%
    Admin admin = (Admin) session.getAttribute("admin-login");
    if (admin == null) {
        session.setAttribute("error_message", "You are not logged in!! Login first..");
        response.sendRedirect("login.jsp");
        return;
    }

// getting count
    Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>buyRent : Admin Dashboard</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js" ></script>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/sel_navbar.jsp" %>
        <div class="row mt-4 mx-2">

            <div class="col-md-2">
                <div class="list-group mt-4">
                    <a href="" class="list-group-item list-group-item-action active custom-bg " style="border: #ef0078" aria-current="true">Menu</a>
                    <a href="productRequests.jsp" class="list-group-item list-group-item-action">Product Requests</a>
                    <a href="#" data-bs-toggle="modal" data-bs-target="#add-category-modal" class="list-group-item list-group-item-action">Add new category</a>
                    <!--<a href="#" class="list-group-item list-group-item-action">Schedule Exchanges</a>-->
                </div>
            </div>

            <div class="col-md-10">
                <!---->
                <%@include file="components/message.jsp" %>
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">

                        <div class="card" data-bs-toggle="tooltip" data-bs-placement="left" data-bs-title="Number of users on this website">
                            <div style="height: 40px" class="card-header custom-bg"></div>
                            <div class="card-body text-center py-0">
                                <div class="container">
                                    <img style="height: 200px; width: 200px" class="img-fluid rounded-circle" src="img/teamwork.png" alt="user_icon">
                                </div>                            
                                <h2 class="text-center">Users</h2>                            
                            </div>
                            <div class="card-footer custom-bg2 text-center">
                                <h3><%= m.get("userCount")%></h3>
                            </div>
                        </div>

                    </div>

                    <!--second col-->
                    <div class="col-md-4">

                        <div class="card" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="Number of Seller on this site">
                            <div style="height: 40px" class="card-header custom-bg"></div>
                            <div class="card-body text-center py-0">
                                <div class="container">
                                    <img style="height: 200px; width: 200px" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                                </div>
                                <h2 class="">Sellers</h2>
                            </div>
                            <div class="card-footer custom-bg2 text-center">
                                <h3><%= m.get("sellerCount")%></h3>
                            </div>
                        </div>

                    </div>

                    <!--third col-->
                    <div class="col-md-4">

                        <div class="card" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Total number of products">
                            <div style="height: 40px" class="card-header custom-bg"></div>
                            <div class="card-body text-center py-0">
                                <div class="container">
                                    <img style="height: 200px; width: 200px" class="img-fluid rounded-circle" src="img/shipping.png" alt="user_icon">
                                </div>                            
                                <h2 class="">Products</h2>
                            </div>
                            <div class="card-footer custom-bg2 text-center">
                                <h3><%= m.get("productCount")%></h3>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>

        <!--add category modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fluid">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Category details..</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="AddProductServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <div class="mb-3">
                                    <label for="ctitle" class="form-label">Category Title : </label>
                                    <input name="catTitle" type="text" class="form-control" id="ctitle" placeholder="Enter here.." required aria-describedby="emailHelp"/>                        
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="mb-3">
                                    <label for="cdesc" class="form-label">Category Desc : </label>
                                    <textarea name="catDescription" class="form-control" placeholder="Enter here.." required></textarea>                        
                                </div>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn custom-bg2">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer custom-bg"></div>
                </div>
            </div>
        </div>

        <!--end category modal-->
    </body>
</html>
