
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>buyRent : Register</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js" ></script>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row mt-4 mb-3">
                <div class="col">
                    <img style="margin-top: 125px;" src="img/add-friend (1).png" alt="img..">
                </div>
                <div class="col">
                    <div class="card">                        
                        <div class="card-body px-4">
                            <%@include file="components/message.jsp" %>
                            <h3 class="text-center my-3">Register here !!</h3>
                            <form class="form-group" action="VerifyServlet" method="post">
                                <div class="mb-3">
                                    <label for="exampleInputSelect" class="form-label">Select Register Type</label><span style="color: red">*</span>
                                    <select required name="userType" class="form-select" aria-label="Default select example">
                                        <option selected>--Select--</option>
                                        <option value="User">User</option>
                                        <option value="Seller">Seller</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Enter Email </label><span style="color: red">*</span>
                                    <input required name="email" type="email" class="form-control" id="email" placeholder="Enter Here.." aria-describedby="emailHelp">                        
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Enter Name </label><span style="color: red">*</span>
                                    <input required name="name" type="text" class="form-control" id="name" placeholder="Enter Here.." aria-describedby="emailHelp">                        
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Enter Password</label><span style="color: red">*</span>
                                    <input required name="password" type="password" class="form-control" id="password" placeholder="Enter Here.." aria-describedby="emailHelp">                        
                                </div>
                                <div class="mb-3">
                                    <label for="cpassword" class="form-label">Confirm Password</label><span style="color: red">*</span>
                                    <input required name="cpassword" type="password" class="form-control" id="cpassword" placeholder="Enter Here.." aria-describedby="emailHelp">                        
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Enter Phone</label><span style="color: red">*</span>
                                    <input required name="phone" type="number" class="form-control" id="phone" placeholder="Enter Here.." aria-describedby="emailHelp">                        
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Enter Address </label><span style="color: red">*</span>
                                    <textarea required name="address" class="form-control" placeholder="Enter here.."></textarea>                        
                                </div>
                                <div class="mb-3">
                                    <label for="city" class="form-label">Enter City </label><span style="color: red">*</span>
                                    <input required name="city" type="text" class="form-control" id="city" placeholder="Enter Here.." aria-describedby="emailHelp">                        
                                </div>                                
                                <div class="container text-center">
                                    <button type="submit" class="btn custom-bg text-white">Register</button>
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

