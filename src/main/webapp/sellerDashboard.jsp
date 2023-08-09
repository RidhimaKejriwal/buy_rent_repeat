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
        <div class="row mt-3 mx-2">
            <div class="col-md-2">

                <div class="list-group mt-4">
                    <a href="" class="list-group-item list-group-item-action active custom-bg " style="border: #ef0078" aria-current="true">
                        Menu
                    </a>

                    <a href="" class="list-group-item list-group-item-action">Edit Profile</a>
                    <a href="" class="list-group-item list-group-item-action">Request</a>
                    <a href="" class="list-group-item list-group-item-action">Add new product</a>
                    <a href="" class="list-group-item list-group-item-action">Schedule Exchanges</a>

                </div>
            </div>
            <div class="col-md-10">
                <div class="container">
                    <div class="row" data-masonry='{"percentPosition": true }'>
                        <div class="card mt-4 product-card">                                
                            <div class="card-body" >
                                <table width="100%">
                                    <tr>
                                        <td width="20%">
                                            <img src="img/default.png" alt="img" style="height: 100px; width: 100px; margin-left: 25px;">
                                            <h5 style="margin-left: 25px; margin-top: 15px;">ridhima_30</h5>
                                        </td>
                                        <td>
                                            <table width="100%">
                                                <tr class="text-center">
                                                    <td colspan="2" style="color: #075B7A"><h1>Ridhima Kejriwal</h1></td>
                                                </tr>
                                                <tr>
                                                    <td><h5>Email: ridhimakejriwal30@gmail.com</h5></td>
                                                    <td><h5>Phone: 9998887776</h5></td>
                                                </tr>
                                                <tr>
                                                    <td><h5>Address: 37-A Malik Enclave, Near Days Hotel</h5></td>
                                                    <td><h5>City: Panipat</h5></td>
                                                </tr>
                                            </table>                                            
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>


