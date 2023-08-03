
<!-- Login Modal -->
<div class="modal fade" id="login" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header custom-bg" >
                <h1 class="modal-title fs-5 center" id="exampleModalLabel"> <i class="fa fa-user-circle"></i> Login</h1>
                <button type="button" style="margin: 0" class="btn-close text-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body"> 
                <form class="form-group" action="LoginServlet" method="post">
                    <div class="mb-3">
                        <label for="exampleInputSelect" class="form-label">Select Login Type</label>
                        <select name="select" class="form-select" aria-label="Default select example">
                            <option selected>--Select--</option>
                            <option value="">User</option>
                            <option value="">Seller</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Enter Email</label>
                        <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Enter Password</label>
                        <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                    </div>
                    <p>If not registered <button type='button' class="btn custom-bg text-white hv" data-bs-toggle="modal" data-bs-target="#register">Click here</button></p>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn custom-bg text-white" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn custom-bg checkout-btn text-white" onclick="goToCheckout()">Login</button>
            </div>
        </div>
    </div>
</div>
