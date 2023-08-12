<%@page import="com.learn.buyrent.entities.Seller"%>
<%
//    Seller nseller = (Seller) session.getAttribute("current-seller");
%>
<%@page import="com.learn.buyrent.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
<%@page import="com.learn.buyrent.dao.CategoryDao"%>
<!--Edit profile-->
<div class="modal fade" id="Edit-profile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header custom-bg text-center text-white">
                <h1 class="modal-title fs-5" id="exampleModalLabel"> Edit Profile </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="/buyRent/img/default.png" class="img-fluid" style="border-radius:50%; max-width: 150px">
                    <br>
                    <h1 class="modal-title fs-5 mt-3" id="exampleModalLabel"><%= nseller.getUserName()%></h1>
                    <div style="">
                        <h5 class="mt-2">Please Edit Carefully!!</h5> 
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>ID :</td>
                                    <td><input readonly type="text" class="form-control" name="user_id" value="<%= nseller.getUserId() %>"></td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= nseller.getUserEmail()%>"></td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input type="text" class="form-control" name="user_name" value="<%= nseller.getUserName()%>"></td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input type="password" class="form-control" name="user_password" value="****"></td>
                                </tr>
                                <tr>
                                    <td>Phone :</td>
                                    <td><input type="phone" class="form-control" name="user_phone" value="<%= nseller.getUserPhone() %>"></td>
                                </tr>
                                <tr>
                                    <td>Address : </td>
                                    <td><input type="text" class="form-control" name="user_address" value="<%= nseller.getUserAddress() %>"></td>
                                </tr>
                                <tr>
                                    <td>City : </td>
                                    <td><input type="text" class="form-control" name="user_city" value="<%= nseller.getUserCity() %>"></td>
                                </tr>
                                <tr>
                                    <td>Profile pic :</td>
                                    <td><input type="file" class="form-control" name="image"></td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn custom-bg text-white"><span class="fa fa-edit"></span> Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!--Add new product-->
<div class="modal fade" id="Add-product" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-bg text-center text-white">
                <h1 class="modal-title fs-5" id="exampleModalLabel"> Add Product </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div style=""> 
                    <form action="AddProductServlet" method="post" enctype="multipart/form-data">
                        <table class="table">
                            <tr>
                                <%
                                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                    List<Category> list1 = cdao.getCategories();
                                %>
                                <td>Category<span style="color: red">*</span> : </td>
                                <td>
                                    <select name="p_category" required>
                                        <option>Other</option>
                                        <%
                                            for (Category category : list1) {
                                        %>

                                        <option ><%= category.getCategoryTitle()%></option>

                                        <%
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Product Name<span style="color: red">*</span> :</td>
                                <td><input type="text" class="form-control" name="p_name" required></td>
                            </tr>
                            <tr>
                                <td>Photo1<span style="color: red">*</span> :</td>
                                <td><input type="file" class="form-control" name="p_image1" required></td>
                            </tr>
                            <tr>
                                <td>Photo2<span style="color: red">*</span> :</td>
                                <td><input type="file" class="form-control" name="p_image2" required></td>
                            </tr>
                            <tr>
                                <td>Selling Price :</td>
                                <td><input type="number" class="form-control" name="p_sellingprice"></td>
                            </tr>
                            <tr>
                                <td>Rent Price :</td>
                                <td><input type="number" class="form-control" name="p_rentprice"></td>
                            </tr>
                            <tr>
                                <td>Quality<span style="color: red">*</span> :</td>
                                <td>
                                    <select name="p_quality" required>
                                        <option>1 (Excellent)</option>                                        
                                        <option>2 (Very Good)</option>                                        
                                        <option>3 (Good)</option>                                        
                                        <option>4 (Average)</option>                                        
                                        <option>5 (Poor)</option>                                        
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Used for<span style="color: red">*</span> :</td>
                                <td>
                                    <select name="p_usedfor" required>
                                        <option>less than 1 year</option>
                                        <option>between 1 & 2 year</option>
                                        <option>between 2 & 3 year</option>
                                        <option>more than 3 year</option>
                                    </select>
                                </td>
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
