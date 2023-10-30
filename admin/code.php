<?php

include('../config/dbcon.php');
include('../functions/myfunctions.php');

if(isset($_POST['add_category_btn']))
{
    $name = $_POST['name'];
    $slug = $_POST['slug'];
    $description = $_POST['description'];
    $meta_title = $_POST['meta_title'];
    $meta_description = $_POST['meta_description'];
    $meta_keywords = $_POST['meta_keywords'];
    $status = isset($_POST['status']) ? '1':'0' ;
    $popular = isset($_POST['popular']) ? '1':'0';

    $image = $_FILES['image']['name'];

    $path = "../uploads";

    $image_ext = pathinfo($image, PATHINFO_EXTENSION);
    $filename = time().'.'.$image_ext;

    $cate_query = "INSERT INTO categories 
    (name,slug,description,meta_title,meta_description,meta_keywords,status,popular,image) 
    VALUES ('$name','$slug','$description','$meta_title','$meta_description','$meta_keywords','$status','$popular','$filename')";

    $cate_query_run = mysqli_query($con, $cate_query);

    if($cate_query_run)
    {
        move_uploaded_file($_FILES['image']['tmp_name'], $path.'/'.$filename);

        redirect("add-category.php", "Category Added Successfully");
    }
    else
    {
        redirect("add-category.php", "Something Went Wrong");
    }
    
}
else if(isset($_POST['update_category_btn']))
{
    $category_id = $_POST['category_id'];
    $name = $_POST['name'];
    $slug = $_POST['slug'];
    $description = $_POST['description'];
    $meta_title = $_POST['meta_title'];
    $meta_description = $_POST['meta_description'];
    $meta_keywords = $_POST['meta_keywords'];
    $status = isset($_POST['status']) ? '1':'0' ;
    $popular = isset($_POST['popular']) ? '1':'0';

    $new_image = $_FILES['image']['name'];
    $old_image = $_POST['old_image'];

    if($new_image != "")
    {
        // $update_filename = $new_image;
        $image_ext = pathinfo($new_image, PATHINFO_EXTENSION);
        $update_filename = time().'.'.$image_ext;
    }
    else
    {
        $update_filename = $old_image;
    }
    $path = "../uploads";

    $update_query = "UPDATE categories SET name='$name', slug='$slug', description='$description', 
    meta_title='$meta_title', meta_description='$meta_description', meta_keywords='$meta_keywords', 
    status='$status', popular='$popular', image='$update_filename' WHERE id='$category_id' ";

    $update_query_run = mysqli_query($con, $update_query);

    if($update_query_run)
    {
        if($_FILES['image']['name'] != "")
        {
            move_uploaded_file($_FILES['image']['tmp_name'], $path.'/'.$update_filename);
            if(file_exists("../uploads/".$old_image))
            {
                unlink("../uploads/".$old_image);
            }
        }
        redirect("edit-category.php?id=$category_id", "Category Updated Successfully");
    }
    else
    {
        redirect("edit-category.php?id=$category_id", "Something Went wrong");
    }

}
else if(isset($_POST['delete_category_btn']))
{
    $category_id = mysqli_real_escape_string($con, $_POST['category_id']);

    $category_query = "SELECT * FROM categories WHERE id='$category_id' ";
    $category_query_run = mysqli_query($con, $category_query);
    $category_data = mysqli_fetch_array($category_query_run);
    $image = $category_data['image'];

    $delete_query = "DELETE FROM categories WHERE id='$category_id' ";
    $delete_query_run = mysqli_query($con, $delete_query);

    if($delete_query_run)
    {
        
        if(file_exists("../uploads/".$image))
        {
            unlink("../uploads/".$image);
        }

        // redirect("category.php", "Category deleted Successfully");
        echo 200;
    }
    else{
        // redirect("category.php", "Something went wrong");
        echo 500;

    }
}
else if(isset($_POST['add_product_btn']))
{
    $category_id = $_POST['category_id'];

    $name = $_POST['name'];
    $slug = $_POST['slug'];
    $small_description = $_POST['small_description'];
    $description = $_POST['description'];

    $goal = $_POST['goal'];
    $diet = $_POST['diet'];


    $is_supplement = $_POST['is_supplement'] == true? 1:0;
    
    $original_price = $_POST['original_price'];
    $selling_price = $_POST['selling_price'];
    $qty = $_POST['qty'];
    $meta_title = $_POST['meta_title'];
    $meta_description = $_POST['meta_description'];
    $meta_keywords = $_POST['meta_keywords'];
    $status = isset($_POST['status']) ? '1':'0' ;
    $trending = isset($_POST['trending']) ? '1':'0';

    $image = $_FILES['image']['name'];

    $path = "../uploads";

    $image_ext = pathinfo($image, PATHINFO_EXTENSION);
    $filename = time().'.'.$image_ext;

    if($name != "" && $slug != "" && $description != "")
    {

        $product_query = "INSERT INTO products (category_id,name,slug,small_description,description, goal, diet, 
        original_price,selling_price,is_supplement,
        qty,meta_title,meta_description,meta_keywords,status,trending,image) VALUES 
        ('$category_id','$name','$slug','$small_description','$description','$goal', '$diet', '$original_price','$selling_price','$is_supplement','$qty','$meta_title',
        '$meta_description','$meta_keywords','$status','$trending','$filename')";

        $product_query_run = mysqli_query($con, $product_query);

        if($product_query_run)
        {
            move_uploaded_file($_FILES['image']['tmp_name'], $path.'/'.$filename);

            redirect("add-product.php", "Product Added Successfully");
        }
        else
        {
            redirect("add-product.php", "Something went wrong");
        }
    }
    else
    {
        redirect("add-product.php", "All fields are mandatory");
    }


}
else if(isset($_POST['update_product_btn']))
{
    $product_id = $_POST['product_id'];
    $category_id = $_POST['category_id'];

    $name = $_POST['name'];
    $slug = $_POST['slug'];
    $small_description = $_POST['small_description'];
    $description = $_POST['description'];
    $original_price = $_POST['original_price'];
    $selling_price = $_POST['selling_price'];
    $qty = $_POST['qty'];
    $meta_title = $_POST['meta_title'];
    $meta_description = $_POST['meta_description'];
    $meta_keywords = $_POST['meta_keywords'];
    $status = isset($_POST['status']) ? '1':'0' ;
    $trending = isset($_POST['trending']) ? '1':'0';

    $goal = $_POST['goal'];
    $diet = $_POST['diet'];
    
    
    $is_supplement = $_POST['is_supplement'] == true? 1:0;
    
    $path = "../uploads";

    $new_image = $_FILES['image']['name'];
    $old_image = $_POST['old_image'];

    if($new_image != "")
    {
        // $update_filename = $new_image;
        $image_ext = pathinfo($new_image, PATHINFO_EXTENSION);
        $update_filename = time().'.'.$image_ext;
    }
    else
    {
        $update_filename = $old_image;
    }

    $update_product_query = "UPDATE products SET category_id='$category_id',name='$name',slug='$slug',small_description='$small_description',description='$description',
            goal='$goal', diet='$diet', original_price='$original_price',selling_price='$selling_price', is_supplement='$is_supplement', qty='$qty',meta_title='$meta_title',
        meta_description='$meta_description',meta_keywords='$meta_keywords',status='$status',trending='$trending',image='$update_filename' WHERE id='$product_id' ";
    $update_product_query_run = mysqli_query($con, $update_product_query);

    if($update_product_query_run)
    {
        if($_FILES['image']['name'] != "")
        {
            move_uploaded_file($_FILES['image']['tmp_name'], $path.'/'.$update_filename);
            if(file_exists("../uploads/".$old_image))
            {
                unlink("../uploads/".$old_image);
            }
        }
        redirect("edit-product.php?id=$product_id", "Product Updated Successfully");
    }
    else
    {
        redirect("edit-product.php?id=$product_id", "Something Went wrong");
    }
}
else if(isset($_POST['delete_product_btn']))
{
    $product_id = mysqli_real_escape_string($con, $_POST['product_id']);

    $product_query = "SELECT * FROM products WHERE id='$product_id' ";
    $product_query_run = mysqli_query($con, $product_query);
    $product_data = mysqli_fetch_array($product_query_run);
    $image = $product_data['image'];

    $delete_query = "DELETE FROM products WHERE id='$product_id' ";
    $delete_query_run = mysqli_query($con, $delete_query);

    if($delete_query_run)
    {
        
        if(file_exists("../uploads/".$image))
        {
            unlink("../uploads/".$image);
        }

        // redirect("products.php", "Product deleted Successfully");
        echo 200;
    }
    else{
        // redirect("products.php", "Something went wrong");
        echo 500;
    }

}
else if(isset($_POST['update_order_btn'])){
    $track_no = $_POST['tracking_no'];
    $order_status = $_POST['status'];
    $payment_status = $_POST['payment_status'];
    
    $updateOrder_query = "UPDATE orders SET status='$order_status', payment_status='$payment_status' WHERE tracking_no='$track_no' ";
    $updateOrder_query_run = mysqli_query($con, $updateOrder_query);

    redirect("view-order.php?t=$track_no", "Order status updated successfully");
}

if(isset($_POST['saveUser']))
{
    // Include a function to validate and sanitize user input
    function validateInput($input) {
        // Implement your validation and sanitization logic here
        // For example, you can use mysqli_real_escape_string or other methods
        // to sanitize user input and perform any necessary validation.
        return $input;
    }

    $name = validateInput($_POST['name']);
    $email = validateInput($_POST['email']);
    $password = validateInput($_POST['password']);
    $phone = validateInput($_POST['phone']);
    $pincode = validateInput($_POST['pincode']);
    $address = validateInput($_POST['address']);
    $isBan = isset($_POST['is_ban']) ? 1 : 0; // Use isset to check if the checkbox is checked
    $role = validateInput($_POST['role']);

    // Check if required fields are not empty
    if(!empty($name) && !empty($email) && !empty($password)){

        // Hash the password
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        // Check if the email is already in use
        $EmailCheckQuery = "SELECT * FROM users WHERE email='$email'";
        $checkResult = mysqli_query($con, $EmailCheckQuery);
        
        if($checkResult){
            if(mysqli_num_rows($checkResult) > 0){
                redirect('users-create.php','Email Already used by another user');
            }
        } else {
            redirect('users-create.php','Something Went Wrong');
        }

        // Insert user data with the hashed password
        $query = "INSERT INTO users (name,email,password,phone,pincode,address,role_as,is_ban) VALUES 
                ('$name', '$email', '$hashed_password', '$phone', '$pincode','$address','$role','$isBan')";
        
        $result = mysqli_query($con, $query);

        if($result){
            redirect('users.php','User Created Successfully');
        } else {
            redirect('users-create.php','Something Went Wrong');
        }
    } else {
        redirect('users-create.php','Please fill required fields!');
    }
}


if(isset($_POST['updateUser']))
{
    $userId = validate($_POST['userId']);

    // Checking if the user exists
    $user = getById('users', $userId);
    $userData = mysqli_fetch_array($user);
    if(!$userData){
        redirect('users-edit.php?id='.$userId, 'No Such ID found');
    }

    $name = validate($_POST['name']);
    $email = validate($_POST['email']);
    $password = $_POST['password']; // Password won't be updated unless provided

    $phone = validate($_POST['phone']);
    $pincode = validate($_POST['pincode']);
    $address = validate($_POST['address']);

    $isBan = isset($_POST['is_ban']) ? 1 : 0;
    $role = validate($_POST['role']);
    
    // Check if any of the fields are not empty
    if (!empty($name) || !empty($email) || !empty($password)) {

        // Check if the password is provided, and if so, hash it
        if (!empty($password)) {
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            $query = "UPDATE users SET name='$name', 
                        email='$email', 
                        password='$hashed_password',
                        phone='$phone',
                        pincode='$pincode',
                        address='$address',
                        is_ban='$isBan',
                        role_as='$role' 
                        WHERE id='$userId'";
        } else {
            // If password is not provided, update other fields without changing the password
            $query = "UPDATE users SET name='$name', 
                        email='$email', 
                        phone='$phone',
                        pincode='$pincode',
                        address='$address',
                        is_ban='$isBan',
                        role_as='$role' 
                        WHERE id='$userId'";
        }

        $result = mysqli_query($con, $query);

        if($result){
            redirect('users-edit.php?id='.$userId, 'User Updated Successfully');
        } else {
            redirect('users-edit.php?id='.$userId, 'Something Went Wrong');
        }
    } else {
        redirect('users-edit.php?id='.$userId, 'Please fill at least one of the fields!');
    }
} else {
    header('Location: ../index.php');
}




?>

