<?php

require '../functions/myfunctions.php';

$paramResult = checkParamId('id');
if(is_numeric($paramResult)){

    $userId = mysqli_real_escape_string($con, $paramResult);

    // Checking user exists or not

    $userData = getById('users',$userId);
    $user = mysqli_fetch_array($userData);
    if($user){
        
        $query = "DELETE FROM users WHERE id='$userId'";
        $response = mysqli_query($con, $query);

        if($response){

            redirect('users.php','User Delete Successfully');
        }else{
            redirect('users.php','Something Went Wrong!');
        }
    }else{
        redirect('users.php', "User not found");
    }

}else{
    redirect('users.php',$paramResult);
}


?>