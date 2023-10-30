<?php 

include('../middleware/adminMiddleware.php'); 
include('includes/header.php');

?>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-primary">
                    
                    <h4 class="text-white"> User List
                        <a href="users-create.php" class="btn btn-warning float-end">Add User</a>
                    </h4>
                </div>
                <div class="card-body" id="">
                        <table id="myTable" class="table table-bordered table-striped">
                        <div class="container">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Role</th>
                                    <th>Is Ban</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $users = getAll('users');

                                    if(mysqli_num_rows($users) > 0){
                                        foreach($users as $userItem) :
                                        ?>
                                        <tr>
                                            <td><?= $userItem['id']; ?></td>
                                            <td><?= $userItem['name']; ?></td>
                                            <td><?= $userItem['email']; ?></td>
                                            <td><?= $userItem['phone']; ?></td>
                                            <td><?= $userItem['role_as']; ?></td>
                                            <td>
                                                <?php  
                                                    if($userItem['is_ban'] == 1){
                                                        echo '<span class="badge bg-danger">Banned</span>';
                                                    }else{
                                                        echo '<span class="badge bg-primary">Active</span>';
                                                    }
                                                ?>
                                            </td>
                                            <td>
                                                <a href="users-edit.php?id=<?= $userItem['id'];?>" class="btn mb-0 btn-success btn-sm">Edit</a>
                                                <a href="users-delete.php?id=<?= $userItem['id'];?>" 
                                                    onclick="return confirm('Are you sure you want to delete data?')"
                                                    class="btn mb-0 btn-danger btn-sm">
                                                    Delete
                                                </a>


                                            </td>
                                        </tr>
                                        <?php
                                        endforeach;
                                    }else{
                                        ?>
                                        <tr>
                                            <td colspan="6">No Record Found!</td>
                                        </tr>
                                        <?php
                                    }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
 </div>
<?php include('includes/footer.php'); ?>
