<%@page import="com.learn.buyrent.entities.Seller"%>
<%
//    Seller cseller = (Seller) session.getAttribute("current-seller");
%>
<%@page import="com.learn.buyrent.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.buyrent.helper.FactoryProvider"%>
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
