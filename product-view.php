<?php 

include('functions/userfunctions.php');
include('includes/header.php');

if(isset($_GET['product']))
{
    $product_slug = $_GET['product'];
    $product_data = getSlugActive("products",$product_slug);
    $product = mysqli_fetch_array($product_data);

    if($product)
    {
        ?>
         <div class="py-3 bg-primary">
            <div class="container">
                <h6 class="text-white"> 
                    <a class="text-white" href="index.php">
                        Home / 
                    </a>
                    <a class="text-white" href="categories.php">
                        Products / 
                    </a>
                    <?= $product['name']; ?></h6>
            </div>
        </div>

        <div class="bg-light py-4">
            <div class="container product_data mt-3">
                <div class="row">
                    <div class="col-md-4">
                        <div class="shadow">
                            <img src="uploads/<?= $product['image']; ?>" alt="Product Image" class="w-100">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <h4 class="fw-bold"><?= $product['name']; ?>
                            <span class="float-end text-danger"><?php if($product['trending']){ echo "Trending"; } ?></span>
                        </h4>
                        <hr>
                        <p><?= $product['small_description']; ?></p>
                        <div class="row">
                            <div class="col-md-6">
                                <h4>RM <span class="text-success fw-bold"> <?= $product['selling_price']; ?> </span></h4>
                            </div>
                            <div class="col-md-6">
                                <h5> RM <s class="text-danger"> <?= $product['original_price']; ?> </s></h5>
                            </div>
                        </div>

                        <div class="row my-3">
                            <div class="col-md-6">
                                <div class="input-group mb-1" style="width:130px">
                                    <button class="input-group-text decrement-btn" <?= $product['qty'] == 0?'disabled':'' ?>>-</button>
                                    <input type="text" class="form-control text-center input-qty bg-white" value="1" disabled>
                                    <button class="input-group-text increment-btn" <?= $product['qty'] == 0?'disabled':'' ?> value="<?= $product['id'] ?>">+</button>
                                </div>
                                <?php 
                                if($product['qty'] == 0) {?>
                                <label class="text-danger">Stock remaining: 0</label>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <button class="btn btn-primary px-4 addToCartBtn" <?= $product['qty'] == 0?'disabled':'' ?> value="<?= $product['id']; ?>"> <i class="fa fa-shopping-cart me-2"></i>Add to Cart</button>
                            </div>
                            <div class="col-md-6">
                                <button class="btn btn-danger px-4 addToWlBtn" value="<?= $product['id']; ?>"> <i class="fa fa-heart me-2"></i>Add to Wishlist</button>
                            </div>
                        </div>
                        <hr>

                        <h6>Product Description:</h6>

                        <p><?= $product['description']; ?></p>
                    </div>
                </div>
            </div>
        </div>


        <?php
    }
    else
    {
        echo "Product Not Found";
    }
}
else
{
    echo "Something Went wrong";
}
include('includes/footer.php'); ?>