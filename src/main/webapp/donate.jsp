<%@page import="java.util.List"%>
<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
<%@page import="com.learn.buyrent.dao.NGODao"%>
<%@page import="com.learn.buyrent.entities.NGO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>buyRent : DONATE PAGE</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js" ></script>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div id="donate" class="container-fluid" style="background-color: #1e4040; margin-top:0px;">
            <div class="row  mb-3">
                <div class="col">
                    <img src="img/donate.png" style="height: 400px; width: 550px;;" alt="img..">
                </div>
                <div class="col" style="margin-top: 100px;">
                    <h1 style="color: white; text-align: center">Give your unused stuff for the <b style="color: cyan">happiness</b> of others.</h1>
                    <h3 style="text-align: center; color: white">Give a little, Help a lot!</h3>
                    <div style="justify-content: center; align-items: center; display: flex; margin-top: 40px;" >
                        <button data-bs-toggle="modal" data-bs-target="#Add-NGO" type='button' class="btn custom-bg2">Register NGO!</button>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/message.jsp" %>
        <%            NGODao ndao = new NGODao(FactoryProvider.getFactory());
            List<NGO> list1 = ndao.getallNGOs();
        %>
        <div>
            <table class="table table-success table-striped-columns" style="width: 100%; border: 1px solid black;" >
                <%
                    for (NGO ngo : list1) {
                %>
                <tr align="center">
                    <td><a href="<%= ngo.getLink()%>"><%= ngo.getName()%></a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>

        <!--Register NGO-->
        <div class="modal fade" id="Add-NGO" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-center text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel"> Add Product </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div style=""> 
                            <form action="AddNGOServlet" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="operation" value="addProduct">
                                <table class="table">
                                    <tr>
                                        <td>Organization Name<span style="color: red">*</span> : </td>
                                        <td><input type="text" class="form-control" name="name" required></td>
                                    </tr> 
                                    <tr>
                                        <td>Cause<span style="color: red">*</span> : </td>
                                        <td><input type="text" class="form-control" name="cause" required></td>
                                    </tr> 
                                    <tr>
                                        <td>Description<span style="color: red">*</span> : </td>
                                        <td><input type="text" class="form-control" name="description" required></td>
                                    </tr> 
                                    <tr>
                                        <td>Email <span style="color: red">*</span> :</td>
                                        <td><input type="text" class="form-control" name="email" required></td>
                                    </tr>
                                    <tr>
                                        <td>Phone <span style="color: red">*</span> :</td>
                                        <td><input type="text" class="form-control" name="phone" required></td>
                                    </tr>
                                    <tr>
                                        <td>Photo <span style="color: red">*</span> :</td>
                                        <td><input type="file" class="form-control" name="photo" required></td>
                                    </tr>
                                    <tr>
                                        <td>Address<span style="color: red">*</span> :</td>
                                        <td><input type="text" class="form-control" name="address" required></td>
                                    </tr>
                                    <tr>
                                        <td>State :</td>
                                        <td><input type="text" class="form-control" name="state"></td>
                                    </tr>
                                    <tr>
                                        <td>City :</td>
                                        <td><input type="text" class="form-control" name="state" ></td>
                                    </tr>
                                    <tr>
                                        <td>Link :</td>
                                        <td><input type="text" class="form-control" name="link"></td>
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
