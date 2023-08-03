
<!-- Register Modal -->
<div class="modal fade" id="register" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header custom-bg" >
                <h1 class="modal-title fs-5 center" id="exampleModalLabel"> <i class="fa fa-user-plus"></i> Register</h1>
                <button type="button" style="margin: 0" class="btn-close text-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">  
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
                    <button type="submit" class="btn custom-bg checkout-btn text-white" onclick="">Register</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn custom-bg text-white" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

