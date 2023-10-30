<?php 

include('functions/userfunctions.php');
include('includes/header.php'); 

include('authenticate.php'); 

$user = getUserData();



// Assuming $user contains the user's data
?>



<div class="py-3 bg-info">
    <div class="container">
        <h6 class="text-white">
            <a href="index.php" class="text-dark">
                Home / 
            </a> 
            <a href="profile.php" class="text-dark">
                Profile
            </a>
        </h6>
    </div>
</div>

<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form action="code.php" method="POST">
                    <div class="card mb-3">
                        <div class="card-header">
                            <h4 class="mb-0">My Profile</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Name</label>
                                        <input type="text" name="name" value="<?= $user['name']??""; ?>" class="form-control"  required />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Email Id</label>
                                        <input type="email"  name="email" value="<?= $user['email']??""; ?>" class="form-control" required />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Phone Number</label>
                                        <input type="tel" name="phone" value="<?= $user['phone'] ?? ""; ?>" max="11" class="form-control"  required  />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label>Alternate Phone Number</label>
                                        <input type="tel" name="pincode" value="<?= $user['pincode'] ?? ""; ?>" max="11" class="form-control" />
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label>Address</label>
                                        <textarea name="address" class="form-control" rows="3"><?=$user['address']?? "";?></textarea>
                                    </div>
                                </div>

                                <div>
                                    <button type="submit" name="updateProfile" class="btn btn-primary float-end">Update Profile</button>
                                </div>
                            </div>
                        </div>
                    </div>

                   
                </form>
            </div>
        </div>
    </div>
</div>


<?php include('includes/footer.php'); ?>
