<?php 

include('../config/dbcon.php');
include('myfunctions.php');


if(isset($_POST['register_btn']))
{
    $name = mysqli_real_escape_string($con,$_POST['name']);
    $phone = mysqli_real_escape_string($con,$_POST['phone']);
    $email = mysqli_real_escape_string($con,$_POST['email']);
    $password = mysqli_real_escape_string($con,$_POST['password']);
    $cpassword = mysqli_real_escape_string($con,$_POST['cpassword']);

    // Check if email already registered
    $check_email_query = "SELECT email FROM users WHERE email='$email' ";
    $check_email_query_run = mysqli_query($con, $check_email_query);

    if(mysqli_num_rows($check_email_query_run) > 0)
    {
        redirect("../register.php", "Email already registered");
    }
    else
    {
        if($password == $cpassword)
        {
            // Hash the password
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);

            // Insert user data with the hashed password
            $insert_query = "INSERT INTO users (name,email,phone,password) VALUES ('$name','$email','$phone','$hashed_password')";
            $insert_query_run = mysqli_query($con, $insert_query);

            if($insert_query_run)
            {
                redirect("../login.php", "Registered Successfully");
            }
            else
            {
                redirect("../register.php", "Something went wrong");
            }
        }
        else
        {
            redirect("../register.php", "Passwords do not match");
        }
    }
}

if(isset($_POST['login_btn']))
{
    $email = mysqli_real_escape_string($con, $_POST['email']);
    $password = mysqli_real_escape_string($con, $_POST['password']);

    $login_query = "SELECT * FROM users WHERE email='$email'";
    $login_query_run = mysqli_query($con, $login_query);

    if(mysqli_num_rows($login_query_run) > 0)
    {
        $userdata = mysqli_fetch_array($login_query_run);
        
        if($userdata['is_ban'] == 1){
            redirect("../login.php", "Account Banned");
            return;
        }
        
        // Verify the entered password against the hashed password
        if(password_verify($password, $userdata['password']))
        {
            $_SESSION['auth'] = true;

            $userid = $userdata['id'];
            $username = $userdata['name'];
            $useremail = $userdata['email'];
            $role_as = $userdata['role_as'];

            $_SESSION['auth_user'] = [
                'user_id' => $userid,
                'name' => $username,
                'email' => $useremail
            ];

            $_SESSION['role_as'] = $role_as;

            if($role_as == 'admin')
            {
                redirect("../admin/index.php", "Welcome To Dashboard");
            }
            else
            {
                redirect("../index.php", "Logged In Successfully");
            }
        }
        else
        {
            redirect("../login.php", "Invalid Credentials");
        }
    }
    else
    {
        redirect("../login.php", "Invalid Credentials");
    }
}


?>