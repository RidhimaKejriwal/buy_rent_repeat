<%@page import="com.learn.buyrent.entities.Seller"%>
<%
    Seller seller1 = (Seller) session.getAttribute("current-seller");
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
                    <a class="nav-link active" aria-current="page" href="#">Request->Rent->Repeat</a>
                </li>
            </ul>
            <ul class="navbar-nav mb-lg-0 ">
                <li class="nav-item">
                    <a class="nav-link active alink" href="guide.jsp">Guide</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active alink" href="#donate">Donate</a>
                </li>
            <%
                if (seller1 == null) {
            %>
                <li class="nav-item">
                    <a class="nav-link active alink" href="login.jsp"> <i class="fa fa-user-circle"></i> Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active alink" href="register.jsp"> <i class="fa fa-user-plus"></i> Register</a>
                </li>
                <%
                    }
                    else
                    {
                %>
                
                <li class="nav-item active">
                    <a class="nav-link active" href="sellerDashboard.jsp"> <i class="fa fa-user-circle"></i> <%= seller1.getUserName() %></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link active" href="LogoutServlet">Logout</a>
                </li>
                
                <%
                    }
                %>
                
                
            </ul>
        </div>
    </div>
</nav>

