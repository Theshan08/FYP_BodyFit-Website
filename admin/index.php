<?php 

include('../middleware/adminMiddleware.php'); 
include('includes/header.php'); 
?>

<?php 
  $today = date('Y-m-d');
  $year = date('Y');
  if(isset($_GET['year'])){
    $year = $_GET['year'];
  }



?>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="row mt-4">
                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div
                                class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">weekend</i>
                            </div>
                            <div class="text-end pt-1">
                                <p class="text-sm mb-0 text-capitalize">Today's Sales</p>
                                <h4 class="mb-0">
                                    <?php
                                        $todayAmount = todayMoney();
                                        $new = mysqli_fetch_array($todayAmount);
                                        $todayMoneyFormatted = preg_replace("/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/i", "$1,", $new[0]);
                                        echo 'RM '. ($todayMoneyFormatted >0 ? $todayMoneyFormatted:'0');
                                    ?>
                                </h4>
                            </div>
                        </div>
                        <div class="card-footer p-3">
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div
                                class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">person</i>
                            </div>
                            <div class="text-end pt-1">
                                <p class="text-sm mb-0 text-capitalize"> Registered Users Today</p>
                                <h4 class="mb-0">
                                    <?php
                                        $todayUsers = todayUsers();
                                        echo mysqli_num_rows($todayUsers);
                                    ?>
                                </h4>
                            </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3">
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div
                                class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">person</i>
                            </div>
                            <div class="text-end pt-1">
                                <p class="text-sm mb-0 text-capitalize">Total Users</p>
                                <h4 class="mb-0">
                                    <?php
                                        $totalUsers = totalUsers();
                                        echo mysqli_num_rows($totalUsers);
                                    ?>
                                </h4>
                            </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3">
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div
                                class="icon icon-lg icon-shape bg-gradient-info shadow-info text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">weekend</i>
                            </div>
                            <div class="text-end pt-1">
                                <p class="text-sm mb-0 text-capitalize">Total Sales</p>
                                <h4 class="mb-0">
                                    <?php
                                        $totalSales = totalSales();
                                        $new = mysqli_fetch_array($totalSales);
                                        $moneyFormatted = preg_replace("/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/i", "$1,", $new[0]);
                                        echo 'RM '. ($moneyFormatted ?? '0');
                                    ?>
                                </h4>
                            </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- /.row -->
<h3 class="box-title">Sales Report</h3>


      <!-- Chart Data -->
      <!DOCTYPE html>
<html>
<head>
    <title>Monthly Sales Chart</title>
    <!-- Include Chart.js library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.min.js"></script>
</head>
<body>
    <div style="width: 80%; margin: auto;">
        <canvas id="salesChart"></canvas>
    </div>

    <script>
        // PHP code to fetch the monthly sales data
        <?php
        

        // SQL query to get monthly sales data
        $sql = "SELECT DATE_FORMAT(created_at, '%m-%Y') AS month, SUM(total_price) AS total_sales
                FROM orders
                GROUP BY month
                ORDER BY month";

        $result = $con->query($sql);

        $data = array();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
        }

        // Close the database connection
        $con->close();

        // Convert PHP array to JavaScript array
        echo "const salesData = " . json_encode($data) . ";\n";
        ?>
        
        // Create a chart using Chart.js
        const months = salesData.map(item => item.month);
        const sales = salesData.map(item => item.total_sales);

        const ctx = document.getElementById('salesChart').getContext('2d');
        const chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: months,
                datasets: [{
                    label: 'Monthly Sales',
                    data: sales,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

       
    </script>
</body>
</html>

<?php include('includes/footer.php'); ?>