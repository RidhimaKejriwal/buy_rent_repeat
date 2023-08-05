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
                    <img style="margin-top: 40px; width: 20vw; margin-left: 150px;" src="img/add-friend (1).png" alt="img..">
                </div>
                <div class="col">
                    <div class="card" style="margin-top: 50px;">                        
                        <div class="card-body px-4">
                            <%@include file="components/message.jsp" %>
                            <h3 class="text-center my-3">Register here !!</h3>
                            <form class="form-group" action="VerifyUserCode" method="post">
                                
                                <div class="mb-3">
                                    <label for="code" class="form-label">Enter Code</label>
                                    <input required name="authcode" type="text" class="form-control" id="code" aria-describedby="emailHelp">                        
                                </div>
                                               
                                <div class="container text-center">
                                    <button type="submit" value="verify" class="btn custom-bg text-white">Verify</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
