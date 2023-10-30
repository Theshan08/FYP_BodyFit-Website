<?php 

include('../middleware/adminMiddleware.php'); 
include('includes/header.php'); 

if(isset($_GET['t']))
{
    $tracking_no = $_GET['t'];

    $orderData = checkTrackingNoValid($tracking_no);
    if(mysqli_num_rows($orderData) < 0)
    {
        ?>
            <h4>Something went wrong</h4>
        <?php
        die();
    }
}
else{
    ?>
        <h4>Something went wrong</h4>
    <?php
    die();
}

$data = mysqli_fetch_array($orderData);
?>


<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header bg-primary">
                    <span class="text-white fs-4"> View Order</span>
                    <a href="orders.php" class="btn btn-warning float-end"> <i class="fa fa-reply"></i> Back</a>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h4>Delivery Details</h4>
                            <hr>
                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <label class="fw-bold">Name</label>
                                    <div class="border p-1">
                                        <?= $data['name']; ?>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-2">
                                    <label class="fw-bold">Email</label>
                                    <div class="border p-1">
                                        <?= $data['email']; ?>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-2">
                                    <label class="fw-bold">Phone</label>
                                    <div class="border p-1">
                                        <?= $data['phone']; ?>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-2">
                                    <label class="fw-bold">Tracking No.</label>
                                    <div class="border p-1">
                                        <?= $data['tracking_no']; ?>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-2">
                                    <label class="fw-bold">Address</label>
                                    <div class="border p-1">
                                        <?= $data['address']; ?>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-2">
                                    <label class="fw-bold">Alternate Phone</label>
                                    <div class="border p-1">
                                        <?= $data['pincode']; ?>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <h4>Order Details</h4>
                            <hr>

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                            
                                    <?php

                                        $order_query = "SELECT o.id as oid, o.tracking_no, o.user_id, oi.*, oi.qty as orderqty, p.* FROM orders o, order_items oi, 
                                            products p WHERE oi.order_id=o.id AND p.id=oi.prod_id 
                                            AND o.tracking_no='$tracking_no' ";
                                        $order_query_run = mysqli_query($con, $order_query);     

                                        if(mysqli_num_rows($order_query_run) > 0)
                                        {
                                            foreach ($order_query_run as $item) {
                                                ?>
                                                    <tr >
                                                        <td class="align-middle">
                                                            <img src="../uploads/<?= $item['image']; ?>" width="50px" height="50px" alt="<?= $item['name']; ?>">
                                                            <?= $item['name']; ?>
                                                        </td>
                                                        <td class="align-middle">
                                                           RM <?= $item['price']; ?>
                                                        </td>
                                                            <td class="align-middle">
                                                            <?= $item['orderqty']; ?>
                                                        </td>
                                                    </tr>
                                                <?php
                                            }
                                        }

                                    ?>
                                </tbody>
                            </table>

                            <hr>
                            <h5>Total Price : <span class="float-end fw-bold">RM <?= $data['total_price']; ?> </span> </h5>

                            <hr>

                            <label class="fw-bold">Payment Mode</label>
                            <div class="border p-1 mb-3">
                                <?= $data['payment_mode'] ?>
                            </div>

                            <div class="card card-body shadow border-1 mb-4">
                                        <h5>Update Order Status</h5>
                                        <form action="code.php" method="POST">

                                            <input type="hidden" name="tracking_no" value="<?= $data['tracking_no'] ?>">

                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Parcel Status</label>
                                                    <select name="status" class="form-select">
                                                        <option value="in_progress" <?= $data['status'] == "in_progress" ? 'selected':'' ?>>In Progress</option>
                                                        <option value="intransit" <?= $data['status'] == "intransit" ? 'selected':'' ?>>In Transit</option>
                                                        <option value="outfordelivery" <?= $data['status'] == "outfordelivery" ? 'selected':'' ?>>Out for Delivery</option>
                                                        <option value="delivered" <?= $data['status'] == "delivered" ? 'selected':'' ?>>Delivered</option>
                                                        <option value="cancelled" <?= $data['status'] == "cancelled" ? 'selected':'' ?>>Cancelled</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <label>Payment Status</label>
                                                    <select name="payment_status" class="form-select">
                                                        <option value="pending" <?= $data['payment_status'] == "pending" ? 'selected':'' ?>>Pending</option>
                                                        <option value="completed" <?= $data['payment_status'] == "completed" ? 'selected':'' ?>>Completed</option>
                                                        <option value="cancelled" <?= $data['payment_status'] == "cancelled" ? 'selected':'' ?>>Cancelled</option>

                                                    </select>
                                                </div>
                                                <div class="col-md-12 text-end">
                                                    <br/>
                                                    <button type="submit" name="update_order_btn" class="btn btn-primary btn-sm">Submit</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>
   