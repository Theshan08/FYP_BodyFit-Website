<?php 

include('functions/userfunctions.php'); 
include('includes/header.php'); 
include('includes/slider.php'); 

?>

<div class="py-5 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4>About Us</h4>
                <div class="underline mb-2"></div>
                <p>
                hhhBody Fit boasts an extensive catalog of gym supplements and equipment that cater to every aspect of your fitness routine. No matter your fitness goals, from bulking up to slimming down or improving athletic performance, you'll find exactly what you need. The website offers a wide range of products, from protein powders and nutritional supplements to cardio machines, strength training equipment, and much more.     </p>
                <p>
                Beyond the chatbot, Body Fit is committed to fostering a sense of community among its customers. They provide forums and resources where you can connect with like-minded fitness enthusiasts, ask questions, and share your progress. The Body Fit community is there to inspire and support you on your fitness journey.
<br>
                </p>

            </div>
        </div>
    </div>
</div>



<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4>Trending Products</h4>
                <div class="underline mb-2"></div>
                <div class="owl-carousel">
                    <?php 
                        $trendingProducts = getAllTrending();
                        if(mysqli_num_rows($trendingProducts) > 0)
                        {
                            foreach ($trendingProducts as $item) {
                                ?>
                                    <div class="item">
                                        <a href="product-view.php?product=<?= $item['slug']; ?>">
                                            <div class="card shadow">
                                                <div class="card-body">
                                                    <img src="uploads/<?= $item['image']; ?>" alt="Product Image" class="w-100">
                                                    <h6 class="text-center"><?= $item['name']; ?></h6>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                <?php
                            }
                        }
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="py-5">
    <div class="container">
        <div class="row">
<h4>Top Selling Products</h4>
<div class="underline mb-2"></div>


<div class="row">
    <?php
    // Fetch and populate the $products array with product data here
    // ...

    // Check if $products is not empty before looping through it
    if (!empty($products)) {
        foreach ($products as $item) {
            // Display each product card
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
    } else {
        // Handle the case where no products are available
        echo "";
    }

    // SQL query to find the top-selling product for the current month
    $sql = "SELECT oi.prod_id, p.name AS product_name, SUM(oi.qty) AS product_quantity
    FROM order_items oi
    INNER JOIN orders o ON oi.order_id = o.id
    INNER JOIN products p ON oi.prod_id = p.id
    WHERE YEAR(o.created_at) = YEAR(CURRENT_DATE()) AND MONTH(o.created_at) = MONTH(CURRENT_DATE())
    GROUP BY oi.prod_id, p.name
    ORDER BY product_quantity DESC
    LIMIT 3"; // Change LIMIT to 3

$result = $con->query($sql);

if ($result->num_rows > 0) {
?>
<div class="row">
    <?php
    while ($row = $result->fetch_assoc()) {
    ?>
    <div class="col-md-4 mb-2">
        <div class="card shadow">
            <div class="card-body">
                <p class="text-center"><?= $row['product_name']; ?></p>
                <p class="text-center">Quantity Sold: <?= $row['product_quantity']; ?></p>
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
<?php
}


    // Close the database connection
    $con->close();
    ?>
</div>



<?php include('includes/footer.php'); ?>
<script>

$(document).ready(function () {
    $('.owl-carousel').owlCarousel({
        loop:true,
        margin:10,
        nav:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:3
            },
            1000:{
                items:4
            }
        }
    })

});
</script>