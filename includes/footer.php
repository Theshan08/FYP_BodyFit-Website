

<div class="py-5 bg-dark">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h4 class="text-white">Body Fit</h4>
                <div class="underline mb-2"></div>
                <a href="index.php" class="text-white"> <i class="fa fa-angle-right"></i> Home</a> <br>
                <a href="#" class="text-white"> <i class="fa fa-angle-right"></i> About Us</a><br>
                <a href="cart.php" class="text-white"> <i class="fa fa-angle-right"></i> My Cart</a><br>
            </div>
            <div class="col-md-3">
                <h4 class="text-white">Address</h4>
                <p class="text-white">
                    1-Z, Lebuh Bukit Jambul, 
                    <br>
                    Bukit Jambul, 
                    <br>
                    11900 Bayan Lepas, 
                    <br>
                    Pulau Pinang
                </p>
                <a href="tel:+60125404407" class="text-white"> <i class="fa fa-phone"></i> +60125404407 </a> <br>
                <a href="mailto:theshanraj13@gmail.com" class="text-white"> <i class="fa fa-envelope"></i> theshanraj13@gmail.com </a>
            </div>
            <div class="col-md-6">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15889.967954798654!2d100.2818707!3d5.3416038!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x881c46d428b3162c!2sINTI%20International%20College%20Penang!5e0!3m2!1sen!2smy!4v1664863231556!5m2!1sen!2smy" class="w-100" height="200" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="py-2 bg-warning">
    <div class="text-center">
    <p class="mb-0 text-white">All rights reserved. Copyright @ Body Fit</a> - <?= date('Y') ?></p>
    </div>
</div>

    
    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
      
  <!-- ALERTIFY JS -->
  <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

  <script>

      alertify.set('notifier','position', 'top-right');
      <?php 
          if(isset($_SESSION['message'])) 
          { 
              ?>
                alertify.success('<?= $_SESSION['message']; ?>');
              <?php 
              unset($_SESSION['message']);
          } 
      ?>
  </script>


  </body>
</html>