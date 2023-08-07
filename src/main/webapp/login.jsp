
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>buyRent : Login</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js" ></script>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row mt-4 mb-3">
                <div class="col">
                    <img style="height: 30vw; margin-top: 40px; margin-left: 30px;" src="img/login (1).png" alt="img..">
                </div>
                <div class="col">
                    <div class="card mt-4">
                        <div class="card-header custom-bg text-white">
                            <h3 class="text-center mt-2 mb-2">Login Here !!</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="mb-3">
                                    <label for="exampleInputSelect" class="form-label">Select Login Type</label><span style="color: red">*</span>
                                    <select name="userType" class="form-select" aria-label="Default select example">
                                        <option selected>--Select--</option>
                                        <option value="User">User</option>
                                        <option value="Seller">Seller</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Enter Email</label><span style="color: red">*</span>
                                    <input required name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Enter Password</label><span style="color: red">*</span>
                                    <input required name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <p>If not registered <a href="register.jsp">Click here</a></p>
                                <div class="container text-center">
                                    <button type="submit" class="btn custom-bg text-white">Login</button>
                                    <button type="reset" class="btn custom-bg text-white">Reset</button>
                                </div>
                            </form>
                        </div>                        
                    </div>
                </div>                
            </div>
        </div>
    </body>
</html>
