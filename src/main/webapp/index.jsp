<%@page import="com.learn.buyrent.entities.User"%>
<%@page import="com.learn.buyrent.helper.Helper"%>
<%@page import="com.learn.buyrent.entities.Product"%>
<%@page import="com.learn.buyrent.dao.ProductDao"%>
<%@page import="com.learn.buyrent.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.buyrent.dao.CategoryDao"%>
<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>buyRent : HOME PAGE</title>
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
            String cat = request.getParameter("category");
            CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
            List<Category> list1 = cdao.getCategories();
        %>
        <div>
            <table class="table table-success table-striped-columns" style="width: 100%; border: 1px solid black;" >
                <tr align="center">
                    <%
                        for (Category category : list1) {
                    %>

                    <td><a class="blink" style="color: black; text-decoration: none" href="browse.jsp?category=<%= category.getCategoryId() %>"><%= category.getCategoryTitle()%></a></td>

                <%
                    }
                %>
                </tr>
            </table>
        </div>
                
        <!--cover photo-->
        <div class="container">
            <div class="row mt-4 mb-3">
                <div class="col" style="margin-top: 100px;">
                    <h1>Why <b class="highlight">buy</b> when you can <b class="highlight">borrow</b>?</h1>
                    <p style="text-align: left">Connect with people in your area and exchange the Stuff and return them after use at fairly low rent.</p>
                    <form class="d-flex" action="search.jsp" method="post" role="search">
                        <input class="form-control me-2" type="search" name="ch" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success hv" type="submit">Search</button>
                    </form>
                    <div style="margin-top: 20px;">
                        <a href="register.jsp"><button type='button' style="margin-right: 20px" class="btn custom-bg2 hv">List an item</button></a>
                        <a href="browse.jsp"><button type='button' class="btn custom-bg2 hv">Browse</button></a>
                    </div>

                </div>
                <div class="col">
                    <img src="img/home.jpeg" style="height: 500px; width: 650px;;" alt="img..">
                </div>
            </div>
        </div>

        <!--features-->
        <div class="container-fluid" style="background-color: lightcyan; padding-top: 20px;"  >
            <div class="row" >
                <div class="col-md-3 col-sm-6" >
                    <img class="icon" src="img/mother-earth-day.png" >
                    <h3 class="highlight">Cleaner Planet</h3>
                    <p>Less Buying means less packaging and less waste to dispose off.</p>
                </div>
                <div class="col-md-3 col-sm-6">
                    <img class="icon" src="img/house.png" >
                    <h3 class="highlight">Save Space</h3>
                    <p>No additional space required to store stuff and no excess clutter.</p>
                </div>
                <div class="col-md-3 col-sm-6">
                    <img class="icon" src="img/saving.png" >
                    <h3 class="highlight">Save Money</h3>
                    <p>Buy less, Rent for a fraction of the cost.</p>
                </div>
                <div class="col-md-3 col-sm-6">
                    <img class="icon" src="img/network.png" </span>
                    <h3 class="highlight">Connect with community</h3>
                    <p>Borrow things from your neighbours instead of buying.</p>
                </div>
            </div>
        </div>

        <!--browse products-->
        <%
            ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
            List<Product> list = pdao.getAllEnabledApprovedProducts();
        %>

        <div class="container py-2">
            <div class="row" >
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
                    <div class="card mt-4 product-card" style="height: 64vh">                                
                        <div class="card-header custom-bg"></div>
                        <div class="card-body" >
                            <div class="container text-center">
                                <img src="img/products/<%= product.getpPhoto1()%>" style="height: 200px; width: 200px;" class="card-img-top" alt="...">
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
