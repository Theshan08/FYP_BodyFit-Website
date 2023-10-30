
<?php 

include('functions/userfunctions.php');
include('includes/header.php');
?>
<div class="py-3 bg-info">
    <div class="container">
        <h6 class="text-white"> 
            <a class="text-dark" href="index.php">
                Home / 
            </a>
            <a class="text-dark" href="recommend.php">
                Recommendations
            </a>
        </h6>
    </div>
</div>

<?php
if(isset($_GET['goal']) && isset($_GET['diet']))
{
    $goal = $_GET['goal'];
    $diet = $_GET['diet'];

    

    if($goal && $diet)
    {
        ?>

        <div class="py-3">
            <div class="container">
                <div class="row">
                  
                    <div class="col-md-12">
                        <h3> Recommended Products </h3>
                        <hr>
                        <div class="row">

                            <?php 
                                $products = getRecommendedProducts($goal, $diet);

                                if(mysqli_num_rows($products) > 0)
                                {
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
                                }
                                else
                                {
                                    ?>
                                    <div class="col-md-12 py-5">
                                        <div class="card shadow">
                                            <div class="card-body text-center">
                                                <h4 class=" py-3"> No products found for the current filter </h4>
                                                <a href="recommend.php" class="btn btn-primary">Change Filter</a>
                                            </div>
                                        </div>
                                    </div>
                                <?php
                                }
                            ?>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <?php
    }
    else
    {
        echo "Something Went wrong";
    }
}
else
{
    ?>
        <div class="modal fade" id="selectGoal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="selectGoalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="selectGoalLabel">Recommend me</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="" method="GET">
                        <div class="modal-body">
                            <div class="card">
                                <div class="card-header">
                                    Please provide the below details
                                </div>
                                <div class="card-body">
                                    <div class="container">
                                        <div class="row">

                                            <div class="col-md-12">
                                                <div class="mb-2">
                                                    <label class="mb-0">What's your Goal</label>
                                                    <select required name="goal" class="form-select" id="" >
                                                        <option value="build_muscle">Build Muscle</option>
                                                        <option value="lose_weight">Lose Weight</option>
                                                        <option value="get_lean">Get Lean</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="mb-2">
                                                    <label class="mb-0">What's your Diet</label>
                                                    <select required name="diet" class="form-select" id="" >
                                                        <option value="noDiet_requirement">No dietary requirement</option>
                                                        <option value="vegan">Vegan</option>
                                                        <option value="vegetarian">Vegetarian</option>
                                                        <option value="gluten_free">Gluten-Free</option>
                                                    </select>
                                                </div>
                                            </div>
                                             
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <div style="height: 80vh;">
            <div class="container py-5">
                <div class="card">
                    <div class="card-body">
                        <div class="p-5 ">
                            <h4>Select your goals and criteria</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php
}
include('includes/footer.php'); 
?>
<script type="text/javascript">
    $(window).on('load', function() {
        $('#selectGoal').modal('show');
    });
</script>