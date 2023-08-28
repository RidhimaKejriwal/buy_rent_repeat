<%-- 
    Document   : browse
    Created on : 28-Aug-2023, 3:06:36 pm
    Author     : Dell
--%>

<%@page import="com.learn.buyrent.entities.Category"%>
<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.buyrent.dao.CategoryDao"%>
<%@page import="com.learn.buyrent.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>buyRent : Browse Products</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js" ></script>
        <%@include file="components/common_css_js.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
    </head>
    <body>
        <!--navbar-->
        <%
            User user1 = (User) session.getAttribute("current-user");
        %>
        <nav class="navbar navbar-expand-lg navbar-dark custom-bg">
            <div class="container-fluid">
                <img class="logo" src="img/logo.jpeg" alt="alt"/>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/buyRent/">Request->Rent->Repeat</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav mb-lg-0 ">
                        <%
                            if (user1 == null) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link active alink" href="login.jsp"> <i class="fa fa-user-circle"></i> Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active alink" href="register.jsp"> <i class="fa fa-user-plus"></i> Register</a>
                        </li>
                        <%
                        } else {
                        %>
                        <li class="nav-item active">
                            <a class="nav-link active" href="userDashboard.jsp"> <i class="fa fa-user-circle"></i> <%= user1.getUserName()%></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link active" href="LogoutServlet">Logout</a>
                        </li>
                        <%
                            }
                        %>
                        <li class="nav-item">
                            <a class="nav-link active alink" href="guide.jsp">Guide</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active alink" href="#donate">Donate</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <%//            out.println(FactoryProvider.getFactory());
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> list1 = cdao.getCategories();
        %>
        <div>
            <table class="table table-success table-striped-columns" style="width: 100%; border: 1px solid black;" >
                <tr align="center">
                    <%
                        for (Category category : list1) {
                    %>

                    <td><%= category.getCategoryTitle()%></td>

                    <%
                        }
                    %>
                </tr>
            </table>
        </div>


        <!--donate poster-->
        <div id="donate" class="container-fluid" style="background-color: #1e4040">
            <div class="row mt-4">
                <div class="col">
                    <img src="img/donate.png" style="height: 400px; width: 550px;;" alt="img..">
                </div>
                <div class="col" style="margin-top: 100px;">
                    <h1 style="color: white; text-align: center">Give your unused stuff for the <b style="color: cyan">happiness</b> of others.</h1>
                    <h3 style="text-align: center; color: white">Give a little, Help a lot!</h3>
                    <div style="justify-content: center; align-items: center; display: flex; margin-top: 40px;" >
                        <a href="donate.jsp"><button type='button' class="btn custom-bg2">Donate Now!</button></a>
                    </div>
                </div>

            </div>
        </div>

        <!--footer-->
        <div class="container-fluid text-center" style="background-color: #1e4040">
            <h5 style="margin-bottom: 0; color: white;">Contact us at : requestrentrepeat@gmail.com</h5>
        </div>
    </body>
</html>
