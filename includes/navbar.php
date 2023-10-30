<?php 
  $page = substr($_SERVER['SCRIPT_NAME'], strrpos($_SERVER['SCRIPT_NAME'],"/")+1);
?>
<nav class="navbar navbar-expand-lg white-space sticky-top bg-f2f2f2 shadow">
  <div class="container">
    <a class="navbar-brand" href="index.php">Body Fit</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ms-auto">
      <li class="nav-item">
          <a class="nav-link <?= $page == "index.php"? 'active':''; ?>" aria-current="page" href="index.php">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <?= $page == "products.php"? 'active':''; ?>" href="products.php">Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <?= $page == "cart.php"? 'active':''; ?>" href="cart.php">Cart</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <?= $page == "recommend.php"? 'active':''; ?>" href="recommend.php">Recommend Me</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <?= $page == "bmi.php"? 'active':''; ?>" href="bmi.php">BMI</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <?= $page == "wishlist.php"? 'active':''; ?>" href="wishlist.php">Wishlist</a>
        </li>
        <?php 
          if(isset($_SESSION['auth']))
          {
            ?>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <?= $_SESSION['auth_user']['name']; ?>
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <li><a class="dropdown-item <?= $page == "my-orders.php"? 'active':''; ?>" href="my-orders.php">My Orders</a></li>
                  <li><a class="dropdown-item <?= $page == "profile.php"? 'active':''; ?>" href="profile.php">My Profile</a></li>
                  <li><a class="dropdown-item" href="logout.php">Logout</a></li>
                </ul>
              </li>
            <?php
          }
          else
          {
            ?>
              <li class="nav-item">
                <a class="nav-link <?= $page == "register.php"? 'active':''; ?>" href="register.php">Register</a>
              </li>
              <li class="nav-item">
                <a class="nav-link <?= $page == "login.php"? 'active':''; ?>" href="login.php">Login</a>
              </li>
            <?php
          }
        ?>
      
      </ul>
    </div>
  </div>
</nav>