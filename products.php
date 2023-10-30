<?php 

include('functions/userfunctions.php');
include('includes/header.php');

    ?>
        <div class="py-3 bg-info">
            <div class="container">
                <h6 class="text-white"> 
                    <a class="text-dark" href="categories.php">
                        Home / 
                    </a>
                    <a class="text-dark" href="#">
                        Products 
                    </a></h6>
            </div>
        </div>

        <div class="py-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        
                        <h2>Our Products</h2>
                        <hr>
                        <div class="row">
                        <div class="col-md-3 mb-4">
                            <div class="card shadow sticky2">
                                <div class="card-header">
                                    <h4 class="mb-0">Filter 
                                        <button class="btn btn-warning btn-sm float-end d-md-none d-inline-block" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFilterMobile">
                                            <span class="fa fa-bars"></span>
                                        </button>
                                        <a href="products.php" class="btn btn-danger btn-sm mx-2 float-end">Reset</a>
                                    </h4>
                                </div>
                                <div class="collapse dont-collapse-sm" id="collapseFilterMobile">
                                    <div class="card-body">
                                        <form action="" method="GET">
                                            <?php
                                                $categoryQuery = mysqli_query($con, "SELECT * FROM categories WHERE status='0'");
                                                if($categoryQuery)
                                                {
                                                    ?>
                                                    <div class="mb-3">
                                                        <label class="mb-2">Category</label>
                                                        <br/>
                                                        <?php
                                                        if(mysqli_num_rows($categoryQuery) > 0){
                                                            foreach($categoryQuery as $cateFilterItem){

                                                                $checkedCategories = [];
                                                                if(isset($_GET['category'])){
                                                                    $checkedCategories = $_GET['category'];
                                                                }
                                                                ?>
                                                                <div class="form-check">
                                                                    <input class="form-check-input" type="checkbox" 
                                                                        name="category[]" 
                                                                        value="<?=$cateFilterItem['slug'];?>" 
                                                                        id="categoryCheckbox<?= $cateFilterItem['id']; ?>"
                                                                        <?php if(in_array($cateFilterItem['slug'], $checkedCategories)){ echo 'checked'; }  ?>
                                                                    />
                                                                    <label class="form-check-label text-dark" for="categoryCheckbox<?= $cateFilterItem['id']; ?>">
                                                                        <?= $cateFilterItem['name']; ?>
                                                                    </label>
                                                                </div>
                                                                <?php
                                                            }
                                                        }
                                                    ?>
                                                    </div>
                                                    <?php
                                                }
                                                
                                            ?>

                                    
                                            <div class="mt-3">
                                                    <hr>
                                                <button type="submit" class="btn btn-primary w-100">Submit</button>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <div class="col-md-9">
                                <?php 
                                    $categoryIds = "";
                                    if(isset($_GET['category'])){

                                        $checkedCategoriesFilter = [];
                                        $checkedCategoriesFilter = $_GET['category'];
                                        $categorySlugsData = implode("','",$checkedCategoriesFilter);
            
                                        $categorySlugs = "SELECT * FROM categories WHERE slug IN ('".$categorySlugsData."') AND status='0'";
                                        $categoryResult = mysqli_query($con,$categorySlugs); 
                                        if($categoryResult){
                                            if(mysqli_num_rows($categoryResult) > 0){

                                                $categoryIdArray = [];
                                                foreach($categoryResult as $cateresItem){
                                                    array_push($categoryIdArray,$cateresItem['id']);
                                                }
                                                $categoryIds = implode("','",$categoryIdArray);
                                            }else{
                                                echo "No Categories Available!";
                                            }
                                        
                                        }
                                    }

                                    if($categoryIds != ''){

                                        $filterProductsQuery = "SELECT * FROM products WHERE category_id IN ('".$categoryIds."') AND status='0'";
                                    }else{
                                        $filterProductsQuery = "SELECT * FROM products WHERE status='0'"; 
                                    }

                                    $products = mysqli_query($con,$filterProductsQuery); 
                                    if($products){

                                        if(mysqli_num_rows($products) > 0)
                                        {
                                            ?>
                                            <div class="row">

                                                <?php
                                                foreach($products as $item)
                                                {
                                                    ?>
                                                        <div class="col-md-3 mb-2">
                                                            <a href="product-view.php?product=<?= $item['slug']; ?>">
                                                                <div class="card shadow">
                                                                    <div class="card-body">
                                                                        <img src="uploads/<?= $item['image']; ?>" alt="Product Image" class="w-100">
                                                                        <h5 class="text-center"><?= $item['name']; ?></h5>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    <?php
                                                }
                                                ?>
                                            </div>

                                            <?php
                                        }
                                        else
                                        {
                                            echo "No data available";
                                        }
                                    }
                                ?>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    <?php
   
include('includes/footer.php'); ?>
   