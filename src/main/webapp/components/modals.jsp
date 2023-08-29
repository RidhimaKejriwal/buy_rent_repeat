<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
<%@page import="com.learn.buyrent.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.buyrent.dao.CategoryDao"%>

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
                        <input type="hidden" name="operation" value="addProduct">
                        <table class="table">
                            <tr>
                                <td>Seller id : </td>
                                <td><input type="text" class="form-control" name="p_sellerid" readonly value="<%= seller.getUserId()%>"></td>
                            </tr>
                            <tr>
                                <%
                                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                    List<Category> list1 = cdao.getCategories();
                                %>
                                <td>Category<span style="color: red">*</span> : </td>
                                <td>
                                    <select name="p_category" required>
                                        <option value="0">Other</option>
                                        <%
                                            for (Category category : list1) {
                                        %>

                                        <option value="<%= category.getCategoryId()%>" ><%= category.getCategoryTitle()%></option>

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
                                <td>Product Description<span style="color: red">*</span> :</td>
                                <td><input type="text" class="form-control" name="p_desc" required></td>
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
                                <td><input type="number" class="form-control" name="p_sellingprice" value="0"></td>
                            </tr>
                            <tr>
                                <td>Rent Price :</td>
                                <td><input type="number" class="form-control" name="p_rentprice" value="0"></td>
                                <td>
                                    <select name="p_rentduration">
                                        <option value="">None</option>
                                        <option>per Day</option>                                        
                                        <option>per Week</option>                                        
                                        <option>per Month</option>                                        
                                        <option>for 3 months</option>                                        
                                        <option>for 6 months</option>                                        
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Quality<span style="color: red">*</span> :</td>
                                <td>
                                    <select name="p_quality" required>
                                        <option value="5">5 (Excellent)</option>                                        
                                        <option value="4">4 (Very Good)</option>                                        
                                        <option value="3">3 (Good)</option>                                        
                                        <option value="2">2 (Average)</option>                                        
                                        <option value="1">1 (Poor)</option>                                        
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

<!--Edit seller profile-->
<div class="modal fade" id="Edit-profile-seller" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header custom-bg text-center text-white">
                <h1 class="modal-title fs-5" id="exampleModalLabel"> Edit Profile </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="img/seller/<%= seller.getUserPic()%>" class="img-fluid" style="border-radius:50%; max-width: 150px">
                    <br>
                    <h1 class="modal-title fs-5 mt-3" id="exampleModalLabel"><%= seller.getUserName()%></h1>
                    <div style="">
                        <h5 class="mt-2">Please Edit Carefully!!</h5> 
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="person" value="seller">
                            <table class="table">
                                <tr>
                                    <td>ID :</td>
                                    <td><%= seller.getUserId()%></td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= seller.getUserEmail()%>"></td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input type="text" class="form-control" name="user_name" value="<%= seller.getUserName()%>"></td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input type="password" class="form-control" name="user_password" value="<%= seller.getUserPassword()%>"></td>
                                </tr>
                                <tr>
                                    <td>Phone :</td>
                                    <td><input type="phone" class="form-control" name="user_phone" value="<%= seller.getUserPhone()%>"></td>
                                </tr>
                                <tr>
                                    <td>Address : </td>
                                    <td><input type="text" class="form-control" name="user_address" value="<%= seller.getUserAddress()%>"></td>
                                </tr>
                                <tr>
                                    <td>City : </td>
                                    <td><input type="text" class="form-control" name="user_city" value="<%= seller.getUserCity()%>"></td>
                                </tr>
                                <tr>
                                    <td>Profile pic :</td>
                                    <td><input type="file" class="form-control" name="image" value="<%= seller.getUserPic()%>"></td>
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
