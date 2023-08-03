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
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="register.jsp" %>
        <%@include file="login.jsp" %>
        <%
            out.println(FactoryProvider.getFactory());
        %>
        <!--cover photo-->
        <div class="container">
            <div class="row mt-4 mb-3">
                <div class="col" style="margin-top: 100px;">
                    <h1>Why <b class="highlight">buy</b> when you can <b class="highlight">borrow</b>?</h1>
                    <p style="text-align: left">Connect with people in your area and exchange the Stuff and return them after use at fairly low rent.</p>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success hv" type="submit">Search</button>
                    </form>
                    <div style="margin-top: 20px;">
                        <button type='button' style="margin-right: 20px" class="btn custom-bg2 hv">List an item</button>
                        <button type='button' class="btn custom-bg2 hv">Browse</button>
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
        <div class="container">
            <h1>Under Construction!</h1>
        </div>
        
        <!--donate poster-->
        <div id="donate" class="container-fluid" style="background-color: #1e4040">
            <div class="row mt-4 mb-3">
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
    </body>
</html>
