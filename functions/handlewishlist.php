<?php

session_start();
include('../config/dbcon.php');

if(isset($_SESSION['auth']))
{
    if(isset($_POST['scope']))
    {
        $scope = $_POST['scope'];
        switch ($scope)
        {
            case "add":
                $prod_id = $_POST['prod_id'];
                $user_id = $_SESSION['auth_user']['user_id'];

                $chk_existing_wishlist = "SELECT * FROM wishlists WHERE prod_id='$prod_id' AND user_id='$user_id' ";
                $chk_existing_wishlist_run = mysqli_query($con, $chk_existing_wishlist);

                if(mysqli_num_rows($chk_existing_wishlist_run) > 0)
                {
                    echo "existing";
                }
                else
                {
                    $insert_query = "INSERT INTO wishlists (user_id, prod_id) VALUES ('$user_id','$prod_id')";
                    $insert_query_run = mysqli_query($con, $insert_query);

                    if($insert_query_run)
                    {
                        echo 201;
                    }
                    else
                    {
                        echo 500;
                    }
                }

                break;

            case "delete":
                $wishlist_id = $_POST['wishlist_id'];

                $user_id = $_SESSION['auth_user']['user_id'];

                $chk_existing_cart = "SELECT * FROM wishlists WHERE id='$wishlist_id' AND user_id='$user_id' ";
                $chk_existing_cart_run = mysqli_query($con, $chk_existing_cart);

                if(mysqli_num_rows($chk_existing_cart_run) > 0)
                {
                    $delete_query = "DELETE FROM wishlists WHERE id='$wishlist_id' ";
                    $delete_query_run = mysqli_query($con, $delete_query);
                    if($delete_query_run){
                        echo 200;
                    }else{
                        echo "something went wrong";
                    }
                }
                else
                {
                    echo "something went wrong";
                }

                break;
                
            default:
                echo 500;
        }
    }

}
else
{
    echo 401;
}

?>