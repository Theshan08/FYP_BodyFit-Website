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

session_start(); // Start the session

if (isset($_POST['login_btn'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Create a prepared statement
    $login_query = "SELECT * FROM users WHERE email=?";
    $stmt = mysqli_prepare($con, $login_query);

    if ($stmt) {
        // Bind the email parameter to the prepared statement
        mysqli_stmt_bind_param($stmt, "s", $email);

        // Execute the prepared statement
        mysqli_stmt_execute($stmt);

        // Get the result
        $result = mysqli_stmt_get_result($stmt);

        if (mysqli_num_rows($result) > 0) {
            $userdata = mysqli_fetch_assoc($result);

            if ($userdata['is_ban'] == 1) {
                redirect("../login.php", "Account Banned");
                return;
            }

            // Verify the entered password against the hashed password
            if (password_verify($password, $userdata['password'])) {
                // Set session variables to indicate the user is logged in
                $_SESSION['auth'] = true;
                $_SESSION['auth_user'] = [
                    'user_id' => $userdata['id'],
                    'name' => $userdata['name'],
                    'email' => $userdata['email'],
                ];
                $_SESSION['role_as'] = $userdata['role_as'];

                if ($userdata['role_as'] == 'admin') {
                    redirect("../admin/index.php", "Welcome To Dashboard");
                } else {
                    redirect("../index.php", "Logged In Successfully");
                }
            } else {
                redirect("../login.php", "Invalid Credentials");
            }
        } else {
            redirect("../login.php", "Invalid Credentials");
        }

        // Close the prepared statement
        mysqli_stmt_close($stmt);
    } else {
        // Handle the case where the prepared statement failed
        redirect("../login.php", "Login Failed");
    }

    // Close the database connection
    mysqli_close($con);
}


?>