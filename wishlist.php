<?php 

include('functions/userfunctions.php');
include('includes/header.php'); 

include('authenticate.php'); 
?>

<div class="py-3 bg-info">
    <div class="container">
        <h6 class="text-dark">
            <a href="index.php" class="text-dark">
                Home / 
            </a> 
            <a href="wishlist.php" class="text-dark">
                Wishlist
            </a>
        </h6>
    </div>
</div>

<div class="py-4 my-5">
    <div class="container">
        <div class="">
            <div class="row">
                <div class="col-md-12">
                    <h4>My Wishlist</h4>
                    <hr>
                    <div id="wishlist-area">
                    <?php 
                        $items = getWishlistItems();
                        
                        if(mysqli_num_rows($items) > 0) { 
                            ?>
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <h6 class="fw-bold">Product</h6>
                                </div>
                                <div class="col-md-3">
                                    <h6 class="fw-bold">Price</h6>
                                </div>
                                <div class="col-md-3">
                                    <h6 class="fw-bold">Action</h6>
                                </div>
                            </div>
                            <div id="">
                                <?php
                                    foreach ($items as $witem) 
                                    {
                                        ?>
                                        <div class="card product_data shadow-sm mb-3">
                                            <div class="row align-items-center">
                                                <div class="col-md-2">
                                                    <img src="uploads/<?= $witem['image'] ?>" alt="Image" width="80px">
                                                </div>
                                                <div class="col-md-4">
                                                    <h5><?= $witem['name'] ?></h5>
                                                </div>
                                                <div class="col-md-3">
                                                    <h5>RM <?= $witem['selling_price'] ?></h5>
                                                </div>
                                                <div class="col-md-3">
                                                    <a href="product-view.php?product=<?= $witem['slug'] ?>" class="btn btn-primary btn-sm"> <i class="fa fa-eye"></i> View</a>
                                                    <button class="btn btn-danger btn-sm removeWlItem" value="<?= $witem['wid'] ?>"> 
                                                    <i class="fa fa-trash me-2"></i>Remove</button>
                                                </div>
                                            </div>
                                        </div>

                                        <?php
                                    }
                                ?>
                            </div>
                        <?php
                        }else{
                            ?>
                            <div class="card card-body shadow text-center">
                                <h3 class="py-4">Your wishlist is empty</h3>
                            </div>
                            <?php
                        }
                    ?>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
                        
<?php include('includes/footer.php'); ?>
   