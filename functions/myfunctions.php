<?php

session_start();
include('../config/dbcon.php');

function getAll($table)
{
    global $con;
    $query = "SELECT * FROM $table";
    return $query_run = mysqli_query($con, $query);
}

function validate($inputData){

    global $con;
    $validatedData = mysqli_real_escape_string($con,$inputData);
    return trim($validatedData);
}


function checkParamId($type)
{
    if(isset($_GET[$type])){
        if($_GET[$type] != null){
            return $_GET[$type];
        }else{
            return 'Id not found';
        }
    }else{
        return 'No id given';
    }
}

function getByID($table, $id)
{
    global $con;
    $query = "SELECT * FROM $table WHERE id='$id' ";
    return $query_run = mysqli_query($con, $query);
}

function redirect($url, $message)
{
    $_SESSION['message'] = $message;
    header('Location: '.$url);
    exit(0);
}

/*function getAllOrders()
{
    global $con;
    $query = "SELECT * FROM orders WHERE status='in_progress' AND payment_status='pending' OR status='intransit' AND payment_status='pending' OR status='outfordelivery' AND payment_status='pending' OR status='in_progress' AND payment_status='completed' ";
    return $query_run = mysqli_query($con, $query);
}

function getOrderHistory()
{
    global $con;
    $query = "SELECT * FROM orders WHERE status ='delivered' AND payment_status ='completed' OR status ='cancelled' AND payment_status ='cancelled'";
    return $query_run = mysqli_query($con, $query);
} */


 //Create a function to generate the WHERE clause for filtering orders.
function generateOrderFilter($status, $paymentStatus) {
    return "status='$status' AND payment_status='$paymentStatus'";
}

function getAllOrders() {
    global $con;

    $conditions = [
        generateOrderFilter('in_progress', 'pending'),
        generateOrderFilter('in_progress', 'completed'),
        generateOrderFilter('intransit', 'pending'),
        generateOrderFilter('intransit', 'completed'),
        generateOrderFilter('outfordelivery', 'pending'),
        generateOrderFilter('outfordelivery', 'completed'),
        generateOrderFilter('delivered', 'pending'),
    ];

    $query = "SELECT * FROM orders WHERE " . implode(' OR ', $conditions);
    return $query_run = mysqli_query($con, $query);
}

function getOrderHistory() {
    global $con;

    $conditions = [
        generateOrderFilter('in_progress', 'cancelled'),
        generateOrderFilter('intransit', 'cancelled'),
        generateOrderFilter('outfordelivery', 'cancelled'),
        generateOrderFilter('delivered', 'completed'),
        generateOrderFilter('delivered', 'cancelled'),
        generateOrderFilter('pending', 'cancelled'),
        generateOrderFilter('completed', 'cancelled'),
        generateOrderFilter('cancelled', 'cancelled'),
    ];

    $query = "SELECT * FROM orders WHERE " . implode(' OR ', $conditions);
    return $query_run = mysqli_query($con, $query);
} 

function checkTrackingNoValid($trackingNo)
{
    global $con;

    $query = "SELECT * FROM orders WHERE tracking_no='$trackingNo' ";
    return mysqli_query($con, $query);
}

function todayMoney()
{
    global $con;

    $todayDate = date('Y-m-d');
    $query = "SELECT SUM(total_price) FROM orders WHERE created_at LIKE '$todayDate%' ";
    return mysqli_query($con, $query);
}

function todayUsers()
{
    global $con;

    $todayDate = date('Y-m-d');
    $query = "SELECT id FROM users WHERE created_at LIKE '$todayDate%' ";
    return mysqli_query($con, $query);
}

function totalUsers()
{
    global $con;

    $query = "SELECT id FROM users";
    return mysqli_query($con, $query);
}

function totalSales()
{
    global $con;

    $query = "SELECT SUM(total_price) FROM orders";
    return mysqli_query($con, $query);
}


?>