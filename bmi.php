<?php 

include('functions/userfunctions.php');
include('includes/header.php');
?>
<div class="py-3 bg-info">
    <div class="container">
        <h6 class="text-dark"> 
            <a class="text-dark" href="index.php">
                Home / 
            </a>
            <a class="text-dark" href="bmi.php">
                BMI
            </a>
        </h6>
    </div>
</div>


<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/css?family=Quicksand:400,700" rel="stylesheet">
  <style>
    * {
      font-family: Quicksand;
      font-size: 16px;
      color: #333;
    }

    body {
      margin: 0;
      height: 100vh;
      padding: 0;
      border: 0;
      background: linear-gradient(to bottom right, #F1F2B5, #eef2f3);
    }

    .form {
      background-color: #fff;
      height: 240px;
      width: 450px;
      border-radius: 20px;
      margin: 20px auto 20px auto;
      display: block;
      border: solid 1px #289df6;
      box-shadow: 0 0 40px 0 #ddd;
    }

    .form:hover {
      box-shadow: 0 0 60px 0 #ccc;
      transition: 0.4s;
      transform: scale(1.02);
    }

    .row-one {
      padding: 30px 20px 15px 20px;
      
    }

    .row-two {
      padding: 15px 20px 30px 20px;
    }

    .text-input {
      width: 60px;
      height: 30px;
      border-radius: 10px;
      background-color: #dbeffe;
      border: none;
      outline: none;
      padding: 5px 10px;
      cursor: pointer;
    }

    .text-input:last-child {
      margin-bottom: 35px;
    }

    .text-input:hover {
      background-color: #cbe7fd;
    }

    #submit {
      border: none;
      border-radius: 10px;
      height: 40px;
      width: 140px;
      background-color: #289df6;
      color: #fff;
      margin: auto;
      display: block;
      outline: none;
      cursor: pointer;
    }

    #submit:hover {
      background-color: #0a8ef2;
    }

    .text {
      display: inline-block;
      margin: 5px 20px 5px 8px;
    }

    .container {
      display: inline-block;
      position: relative;
      padding-left: 30px;
      cursor: pointer;
      user-select: none;
      
    }

    .container input {
      position: absolute;
      opacity: 0;
    }

    .checkmark {
      position: absolute;
      top: 0;
      left: 0;
      height: 25px;
      width: 25px;
      background-color: #dbeffe;
      border-radius: 50%;
    }

    .container:hover input ~ .checkmark {
      background-color: #cbe7fd;
    }

    .container input:checked ~ .checkmark {
      background-color: #289df6;
    }

    h1 {
      font-size: 30px;
      font-weight: 300;
      text-align: center;
      color: #289df6;
      padding-top: 15px;
      display: block;
    }

    h2 {
      font-size: 22px;
      font-weight: 300;
      text-align: center;
    }

    h3 {
      font-size: 24px;
      font-weight: 300;
      text-align: center;
      padding: 15px;
    }

    .bmi-image {
    max-width: 50%; /* Set the maximum width to prevent image overflow */
    max-height: 50%;
    display: block; /* Centers the image horizontally */
    margin: 0 auto; /* Centers the image horizontally */
}

    h3 b {
      font-size: 32px;
      font-weight: 300;
      color: #289df6;
    }

    .checkmark:after {
      content: "";
      position: absolute;
      display: none;
    }

    .container input:checked ~ .checkmark:after {
      display: block;
    }

    .container .checkmark:after {
      left: 9px;
      top: 5px;
      width: 5px;
      height: 10px;
      border: solid white;
      border-width: 0 2px 2px 0;
      transform: rotate(45deg);

      

    }
  </style>
</head>
<body>
  <h3><b>B</b>ody <b>M</b>ass <b>I</b>ndex Calculator</h3>

  <img src="assets/images/bmi.jpg" class="bmi-image">

  <form class="form" id="form" onsubmit="return validateForm()">
    <div class="row-one">
      <input type="text" class="text-input" id="age" autocomplete="off" required/><p class="text">Age</p>
      <label class="container">
        <input type="radio" name="radio" id="f"><p class="text">Female</p>
        <span class="checkmark"></span>
      </label>
      <label class="container">
        <input type="radio" name="radio" id="m"><p class="text">Male</p>
        <span class="checkmark"></span>
      </label>
    </div>
    <div class="row-two">
      <input type="text" class="text-input" id="height" autocomplete="off" required><p class="text">Height (cm)</p>
      <input type="text" class="text-input" id="weight" autocomplete="off" required><p class="text">Weight (kg)</p>
    </div>
    <button type="button" id="submit">Submit</button>
  </form>
  <script>
    var age = document.getElementById("age");
    var height = document.getElementById("height");
    var weight = document.getElementById("weight");
    var male = document.getElementById("m");
    var female = document.getElementById("f");
    var form = document.getElementById("form");

    function validateForm() {
      if (age.value == '' || height.value == '' || weight.value == '' || (male.checked == false && female.checked == false)) {
        alert("All fields are required!");
        document.getElementById("submit").removeEventListener("click", countBmi);
      } else {
        countBmi();
      }
    }

    document.getElementById("submit").addEventListener("click", validateForm);

    function countBmi() {
      var p = [age.value, height.value, weight.value];
      if (male.checked) {
        p.push("male");
      } else if (female.checked) {
        p.push("female");
      }
      form.reset();
      var bmi = Number(p[2]) / (Number(p[1]) / 100 * Number(p[1]) / 100);

      var result = '';
      if (bmi < 18.5) {
        result = 'Underweight';
      } else if (18.5 <= bmi && bmi <= 24.9) {
        result = 'Normal Weight';
      } else if (25 <= bmi && bmi <= 29.9) {
        result = 'Overweight';
      } else if (30 <= bmi && bmi <= 34.9) {
        result = 'Obesity';
      } else if (35 <= bmi) {
        result = 'Extremely Obesity';
      }

      var h1 = document.createElement("h1");
      var h2 = document.createElement("h2");

      var t = document.createTextNode(result);
      var b = document.createTextNode('BMI: ');
      var r = document.createTextNode(parseFloat(bmi).toFixed(2));

      h1.appendChild(t);
      h2.appendChild(b);
      h2.appendChild(r);

      document.body.appendChild(h1);
      document.body.appendChild(h2);
      document.getElementById("submit").removeEventListener("click", countBmi);
      document.getElementById("submit").removeEventListener("click", validateForm);
    }

    document.getElementById("submit").addEventListener("click", countBmi);
  </script>
  <br>
  <br>
<br>
<br>

</body>
</html>


