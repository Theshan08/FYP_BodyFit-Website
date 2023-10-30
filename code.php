<?php 
include('config/dbcon.php');
include('functions/userfunctions.php');

if(isset($_POST['updateProfile'])){
    
    $userId = $_SESSION['auth_user']['user_id'];

    $name = mysqli_real_escape_string($con, $_POST['name']);
    $phone = mysqli_real_escape_string($con, $_POST['phone']);
    $pincode = mysqli_real_escape_string($con, $_POST['pincode']);
    $address = mysqli_real_escape_string($con, $_POST['address']);

    if($name != '' || $phone != '' || $address != ''){

        $query = "UPDATE users SET name='$name', phone='$phone',pincode='$pincode', address='$address' WHERE id='$userId'";
        $result = mysqli_query($con, $query);

        if($result){
            redirect('profile.php','Profile Updated Successfully!');
        }else{
            redirect('profile.php','Something Went Wrong');
        }
    }else{
        redirect('profile.php','Please fill required fields!');
    }
}
else if(isset($_POST['checkProdStock'])){
    $quantity = mysqli_real_escape_string($con, $_POST['quantity']);
    $product_id = mysqli_real_escape_string($con, $_POST['product_id']);

    if($quantity > 0 && $product_id != ''){

        $query = "SELECT * FROM products WHERE id='$product_id' LIMIT 1";
        $result = mysqli_query($con, $query);
        $productData = mysqli_fetch_array($result);

        if($productData['qty'] > $quantity){
            echo 'available';            
        }else{
            echo 'Only '.$productData['qty'].' quantity available';
        }
    }else{
        echo 500;
    }
}
else{
    
}

?>