<%@page import="com.learn.buyrent.entities.Seller"%>
<%
    if (nuser != null) {
%>
<%@include file="navbar.jsp" %>
<div class="row mt-3 mx-2">
    <div class="col-md-2">
        <div class="list-group mt-4">
            <a href="" class="list-group-item list-group-item-action active custom-bg " style="border: #ef0078" aria-current="true">Menu</a>
            <a href="#" data-bs-toggle="modal" data-bs-target="#Edit-profile" class="list-group-item list-group-item-action">Edit Profile</a>
            <a href="requests.jsp" class="list-group-item list-group-item-action">Requests sent</a>
            <a href="ScheduledExchanges.jsp" class="list-group-item list-group-item-action">Schedule Exchanges</a>
        </div>
    </div>
    <div class="col-md-10">
        <!--profile show-->
        <%@include file="message.jsp" %>
        <div class="container">
            <div class="row" data-masonry='{"percentPosition": true }'>
                <div class="card mt-4 product-card">                                
                    <div class="card-body" >
                        <table width="100%">
                            <tr>
                                <td width="20%">
                                    <img src="img/user/<%= nuser.getUserPic()%>" alt="img" style="height: 100px; width: 100px; margin-left: 25px;">
                                </td>
                                <td>
                                    <table width="100%">
                                        <tr class="text-center">
                                            <td colspan="2" style="color: #075B7A"><h1><%= nuser.getUserName()%></h1></td>
                                        </tr>
                                        <tr>
                                            <td><h5 style="color: #B0BEC5; font-weight: normal">Email: <span style="color: #212121"><%= nuser.getUserEmail()%></span></h5></td>
                                            <td><h5 style="color: #B0BEC5; font-weight: normal">Phone: <span style="color: #212121"><%= nuser.getUserPhone()%></span></h5></td>
                                        </tr>
                                        <tr>
                                            <td><h5 style="color: #B0BEC5; font-weight: normal">Address: <span style="color: #212121"><%= nuser.getUserAddress()%></span></h5></td>
                                            <td><h5 style="color: #B0BEC5; font-weight: normal">City: <span style="color: #212121"><%= nuser.getUserCity()%></span></h5></td>
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
<%
} else if(seller != null){
%>
<%@include file="sel_navbar.jsp" %>
        <div class="row mt-3 mx-2">
            <div class="col-md-2">

                <div class="list-group mt-4">
                    <a href="" class="list-group-item list-group-item-action active custom-bg " style="border: #ef0078" aria-current="true">
                        Menu
                    </a>

                    <a href="#" data-bs-toggle="modal" data-bs-target="#Edit-profile" class="list-group-item list-group-item-action">Edit Profile</a>
                    <a href="" class="list-group-item list-group-item-action">Request</a>
                    <a href="#" data-bs-toggle="modal" data-bs-target="#Add-product" class="list-group-item list-group-item-action">Add new product</a>
                    <a href="ScheduledExchanges.jsp" class="list-group-item list-group-item-action">Scheduled Exchanges</a>

                </div>
            </div>
            <div class="col-md-10">
                <!--profile show-->
                <%@include file="message.jsp" %>
                <div class="container">
                    <div class="row" data-masonry='{"percentPosition": true }'>
                        <div class="card mt-4 product-card">                                
                            <div class="card-body" >
                                <table width="100%">
                                    <tr>
                                        <td width="20%">
                                            <img src="img/seller/<%= seller.getUserPic()%>" alt="img" style="height: 100px; width: 100px; margin-left: 25px;">
                                        </td>
                                        <td>
                                            <table width="100%">
                                                <tr class="text-center">
                                                    <td colspan="2" style="color: #075B7A"><h1><%= seller.getUserName()%></h1></td>
                                                </tr>
                                                <tr>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Email: <span style="color: #212121"><%= seller.getUserEmail()%></span></h5></td>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Phone: <span style="color: #212121"><%= seller.getUserPhone()%></span></h5></td>
                                                </tr>
                                                <tr>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">Address: <span style="color: #212121"><%= seller.getUserAddress()%></span></h5></td>
                                                    <td><h5 style="color: #B0BEC5; font-weight: normal">City: <span style="color: #212121"><%= seller.getUserCity()%></span></h5></td>
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
<%
    }
%>