<?php
include('../middleware/adminMiddleware.php'); 
include('includes/header.php'); 
?>

    <div class="row">
        <div class="col-12">
            <div class="card mb-4">
                <div class="card-header pb-0">
                    <h6>Edit User
                        <a href="users.php" class="btn btn-danger btn-sm float-end">Back</a>
                    </h6>
                </div>
                <div class="card-body">
                    
                    <form action="code.php" method="POST">
                        <?php 
                            $paramResult = checkParamId('id');
                            if(!is_numeric($paramResult)){
                                echo '<h5>'.$paramResult.'</h5>';
                                return false;
                            }

                            $userData = getById('users',checkParamId('id'));
                            $user = mysqli_fetch_array($userData);
                            if($user){
                        ?>

                        <input type="hidden" name="userId" required value="<?= $user['id']; ?>" />

                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label>Name *</label>
                                    <input type="text" name="name" value="<?= $user['name']; ?>" required class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Email *</label>
                                    <input type="email" name="email" value="<?= $user['email']; ?>" required class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Password *</label>
                                    <input type="password" name="password" value="<?= $user['password']; ?>" required class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Phone</label>
                                    <input type="text" name="phone" value="<?= $user['phone']; ?>" required class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label>Alternate Phone</label>
                                    <input type="text" name="pincode" value="<?= $user['pincode']; ?>" class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label>Address</label>
                                    <input type="text" name="address" value="<?= $user['address']; ?>" class="form-control" />
                                </div>
                            </div>
                            
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label>Select Role</label>
                                    <select name="role" class="form-select" required>
                                        <option value="">Select Role</option>
                                        <option value="admin" <?= $user['role_as'] == 'admin' ? 'selected':''; ?> >Admin</option>
                                        <option value="user" <?= $user['role_as'] == 'user' ? 'selected':''; ?>>User</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-3">
                                    <label>Is Ban</label>
                                    <br/>
                                    <input type="checkbox" style="width:30px;height:30px;" name="is_ban" <?= $user['is_ban'] == true ? 'checked':''; ?> />
                                </div>
                            </div>
                           

                            <div class="col-md-5 mb-3 text-end">
                                <br/>
                                <button type="submit" name="updateUser" class="btn btn-primary">Update</button>
                            </div>
                        </div>

                        <?php 
                            } else { 
                                echo '<h5>'.$user['message'].'</h5>';
                            }
                        ?>

                    </form>
                </div>
            </div>
        </div>
    </div>

<?php include('includes/footer.php'); ?>
