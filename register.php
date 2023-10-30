<?php 
session_start();

if(isset($_SESSION['auth']))
{
    $_SESSION['message'] = "You are already logged In";
    header('Location: index.php');
    exit();
}

include('includes/header.php'); 
?>

<div class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <?php
                if(isset($_SESSION['message'])) 
                { 
                    ?>
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Hey!</strong> <?= $_SESSION['message']; ?>.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <?php 
                    unset($_SESSION['message']);
                }
                ?>
                <div class="card">
    <div class="card-header bg-primary">
        <h4 class="text-white mb-0">Registration Form . . .</h4>
    </div>
    <div class="card-body">
        <form action="functions/authcode.php" method="POST" onsubmit="return validateForm()">
            <div class="mb-2">
                <label class="form-label mb-0">Name</label>
                <input type="text" name="name" class="form-control" placeholder="Enter your name" pattern="[a-z A-Z]+" oninvalid="setCustomValidity('Please enter alphabets only. ')" required>
            </div>
            <div class="mb-2">
                <label class="form-label mb-0">Phone</label>
                <input type="text" name="phone" class="form-control" placeholder="Enter your phone number (do not add +)" pattern="[0-9]+" oninvalid="setCustomValidity('Please enter numbers only. ')" minlength="10" required>
            </div>
            <div class="mb-2">
                <label for="exampleInputEmail1" class="form-label mb-0">Email address</label>
                <input type="email" name="email" class="form-control" placeholder="Enter your email" id="exampleInputEmail1" aria-describedby="emailHelp" required>
            </div>
            <div class="mb-2">
                <label for="exampleInputPassword1" class="form-label mb-0">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter password" id="exampleInputPassword1" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\|\-]).{8,}$"
                 minlength="8" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
            </div>
            <div class="mb-2">
                <label class="form-label mb-0">Confirm Password</label>
                <input type="password" name="cpassword" class="form-control" placeholder="Confirm password" minlength="6" required>
            </div>
            
            <button type="submit" name="register_btn" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>

<script>
    function validateForm() {
        var password = document.getElementsByName('password')[0].value;
        var cpassword = document.getElementsByName('cpassword')[0].value;

        if (password !== cpassword) {
            alert('Password and Confirm Password must match.');
            return false;
        }

        return true;
    }
</script>

            
            </div>
        </div>
    </div>
</div>



<?php include('includes/footer.php'); ?>
   