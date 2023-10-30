-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2023 at 06:18 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `prod_id`, `prod_qty`, `created_at`) VALUES
(23, 1, 3, 1, '2023-09-23 05:17:14'),
(24, 1, 9, 2, '2023-09-23 13:25:32'),
(31, 7, 10, 1, '2023-10-10 15:23:21');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `popular` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(191) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `meta_keywords` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `popular`, `image`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`) VALUES
(8, 'Whey Protien', 'whey-protien', 'This is whey protien', 0, 0, '1695475265.png', 'Whey Protien', 'Whey Protien', 'Whey Protien', '2023-09-23 13:21:05'),
(9, 'Creatine Supplement', 'creatine-supp', 'Creatine SupplementCreatine SupplementCreatine Supplement', 0, 0, '1695537677.jpg', 'Creatine Supplement', 'Creatine Supplement', 'Creatine Supplement', '2023-09-24 06:41:17'),
(10, 'Gym Equipment', 'gym_equip', 'bike, treadmill, dumbells, barbells and many more', 0, 0, '1696996933.jpg', 'gym_equipment', 'gym_equipment', 'gym_equipment', '2023-10-11 04:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `tracking_no` varchar(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` mediumtext NOT NULL,
  `pincode` int(191) NOT NULL,
  `total_price` int(191) NOT NULL,
  `payment_mode` varchar(191) NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `tracking_no`, `user_id`, `name`, `email`, `phone`, `address`, `pincode`, `total_price`, `payment_mode`, `payment_id`, `status`, `payment_status`, `comments`, `created_at`) VALUES
(1, 'sharmacoder63016565998', 1, 'OM prakash', 'om@gmail.com', '656565998', 'testing address', 560088, 46397, 'COD', '', 'cancelled', 'pending', NULL, '2022-08-02 08:59:28'),
(2, 'sharmacoder6023sf', 1, 'asdf', 'asdf@gmai.com', 'adsf', 'adsfasf', 0, 46397, 'COD', '', 'pending', 'pending', NULL, '2022-08-02 09:01:35'),
(3, 'sharmacoder6779df', 1, 'adsf', 'asdf@gmail.com', 'asdf', 'sdfa', 0, 47997, 'COD', '', 'pending', 'pending', NULL, '2022-08-03 07:37:20'),
(4, 'sharmacoder7435sf', 1, 'asdf', 'adsf', 'adsf', 'adsf', 0, 15999, 'Paid by PayPal', '47X98245JT480770K', 'pending', 'pending', NULL, '2022-10-07 07:16:40'),
(5, 'sharmacoder4647df', 1, 'asd', 'fadsf', 'asdf', 'adsf', 0, 22999, 'Paid by PayPal', '88F32539DL1774142', 'pending', 'pending', NULL, '2022-10-07 07:21:03'),
(6, 'sharmacoder2684sf', 1, 'asdf', 'asdf', 'adsf', 'a', 0, 15999, 'Paid by PayPal', '4EU871766J269392G', 'pending', 'pending', NULL, '2022-10-07 07:22:04'),
(7, 'ORDERSC197723456789', 6, 'Mandela', 'Mandela@gmail.com', '0123456789', 'Inti', 11900, 2997, 'COD', '', '', '', NULL, '2023-10-04 07:31:19'),
(8, 'ORDERSC759323456789', 7, 'Test', 'test@gmail.com', '0123456789', 'Hello123', 11700, 630, 'COD', '', '', '', NULL, '2023-10-07 08:43:40'),
(9, 'ORDERSC1126234656', 7, 'test', 'test@gmail.com', '01234656', 'hello123', 11700, 630, 'COD', '', 'outfordelivery', 'completed', NULL, '2023-10-07 11:43:50'),
(10, 'ORDERSC609123456789', 7, 'Hello', 'hello123@gmail.com', '0123456789', 'inti', 11700, 39992, 'COD', '', 'received', 'pending', NULL, '2023-10-10 05:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(191) NOT NULL,
  `prod_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` int(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `prod_id`, `qty`, `price`, `created_at`) VALUES
(1, 1, 4, 1, 399, '2022-08-02 08:59:28'),
(2, 1, 2, 2, 22999, '2022-08-02 08:59:28'),
(3, 2, 4, 1, 399, '2022-08-02 09:01:35'),
(4, 2, 2, 2, 22999, '2022-08-02 09:01:35'),
(5, 3, 1, 3, 15999, '2022-08-03 07:37:20'),
(6, 4, 1, 1, 15999, '2022-10-07 07:16:40'),
(7, 5, 2, 1, 22999, '2022-10-07 07:21:03'),
(8, 6, 1, 1, 15999, '2022-10-07 07:22:04'),
(9, 7, 10, 3, 999, '2023-10-04 07:31:19'),
(10, 8, 0, 3, 210, '2023-10-07 08:43:40'),
(11, 9, 0, 3, 210, '2023-10-07 11:43:50'),
(12, 10, 9, 8, 4999, '2023-10-10 05:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `small_description` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `goal` varchar(255) NOT NULL,
  `diet` varchar(255) NOT NULL,
  `original_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `is_supplement` tinyint(4) NOT NULL,
  `image` varchar(191) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `trending` tinyint(4) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_keywords` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `small_description`, `description`, `goal`, `diet`, `original_price`, `selling_price`, `is_supplement`, `image`, `qty`, `status`, `trending`, `meta_title`, `meta_keywords`, `meta_description`, `created_at`) VALUES
(9, 8, ' Gold Standard 100% Whey Protein | For Muscle Recovery', 'gold-standard-whey-protien', ' Gold Standard 100% Whey Protein | For Muscle Recovery | No Added Sugar | Flavour Powder Vanilla Icecream\r\n24 grams of protein per serving to help rebuild and maintain muscle\r\n5.5 grams of naturally occurring BCAAs per serving to support endurance and recovery\r\nBanned substance tested-informed choice certified vegetarian', ' Gold Standard 100% Whey Protein | For Muscle Recovery | No Added Sugar | Flavour Powder Vanilla Icecream\r\n24 grams of protein per serving to help rebuild and maintain muscle\r\n5.5 grams of naturally occurring BCAAs per serving to support endurance and recovery\r\nBanned substance tested-informed choice certified vegetarian', 'build_muscle', 'vegetarian', 5999, 4999, 1, '1695475433.webp', 42, 0, 1, ' Gold Standard 100% Whey Protein | For Muscle Recovery | No Added Sugar | Flavour Powder Vanilla Icecream', ' Gold Standard 100% Whey Protein | For Muscle Recovery | No Added Sugar | Flavour Powder Vanilla Icecream', ' Gold Standard 100% Whey Protein | For Muscle Recovery | No Added Sugar | Flavour Powder Vanilla Icecream', '2023-09-23 05:23:53'),
(10, 9, 'MuscleBlaze MB Creatine Monohydrate', 'MuscleBlaze-MB-Creatine-Monohydrate', 'MuscleBlaze MB Creatine Monohydrate is a workout supplement that can help boost workout performance. It is a source of pure and unadulterated creatine monohydrate, which is instantly absorbed by the body, providing a constant supply of energy by resynthesizing ADPs into ATPs (the energy currency) of the body. Regular consumption of creatine monohydrate allows for sustaining longer in the gym and attaining lean muscle mass.', 'MuscleBlaze MB Creatine Monohydrate is a workout supplement that can help boost workout performance. It is a source of pure and unadulterated creatine monohydrate, which is instantly absorbed by the body, providing a constant supply of energy by resynthesizing ADPs into ATPs (the energy currency) of the body. Regular consumption of creatine monohydrate allows for sustaining longer in the gym and attaining lean muscle mass.', 'lose_weight', 'vegetarian', 1299, 999, 1, '1695537855.jpg', 20, 0, 1, 'MuscleBlaze MB Creatine Monohydrate', 'MuscleBlaze MB Creatine Monohydrate', 'MuscleBlaze MB Creatine Monohydrate', '2023-09-23 22:44:15'),
(0, 8, 'Vegan Weight Gainer', 'myprotein', 'Tasty Vegan Weight Gainer', 'To build muscle and size, you must always be in a calorie surplus – which means you have to eat more calories than you burn. Our plant-powered blend is packed with pea protein isolate and brown rice protein, with added carbs, to give a staggering 400 calories per serving. \r\n\r\n', 'build_muscle', 'noDiet_requirement', 210, 210, 1, '1696519780.jpg', 0, 0, 0, 'Vegan Weight Gainer', 'vegan weight gainer', 'vegan weight gainer', '2023-10-05 15:29:40'),
(0, 10, 'BH Fitness Air Bike', 'AirBike', 'Coolest innovation of Air Bike ', '<p>hh</p>', 'build_muscle', 'noDiet_requirement', 5000, 4499, 0, '1696997477.jpg', 3, 0, 0, 'Air Bike', 'Air Bike', 'Air Bike', '2023-10-11 04:11:17'),
(0, 10, 'BH Fitness Treadmill', 'treadmill', 'treadmill', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 28px; color: rgb(17, 17, 17); font-family: OswaldRegular; font-size: 14px;\"><img alt=\"Screenshot 2021-02-05 at 11\" class=\"img-responsive \" src=\"https://www.hflifestyle.com.my/image/catalog/product/Screenshot%202021-02-05%20at%2011.39.19%20AM.png\" style=\"border: 0px none; display: inline-block; max-width: 100%; width: 50%;\"></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 28px; color: rgb(17, 17, 17); font-family: OswaldRegular; font-size: 14px;\"><img alt=\"Screenshot 2021-02-05 at 11\" class=\"img-responsive \" src=\"https://www.hflifestyle.com.my/image/catalog/product/Screenshot%202021-02-05%20at%2011.44.16%20AM.png\" style=\"border: 0px none; display: inline-block; max-width: 100%; width: 50%;\"></p>', 'build_muscle', 'noDiet_requirement', 1588, 1499, 0, '1696997700.jpg', 2, 0, 0, 'treadmill', 'treadmill', 'treadmill', '2023-10-11 04:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `alt_phone` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `role_as` varchar(255) NOT NULL DEFAULT 'user',
  `is_ban` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `alt_phone`, `address`, `password`, `role_as`, `is_ban`, `created_at`) VALUES
(1, 'Om Prakash N', 'om@gmail.com', '2147483647', '65464654', 'test', '$2y$10$YcTLyxN5QiWhQpjjSVSw3uczaNwJEbWqmmEFj/dMwQ6Iv7p/GT2Ha', 'admin', 0, '2022-02-14 02:49:59'),
(2, 'New Username', 'user@gmail.com', '1231231233', '4455', '', '12345', 'user', 0, '2022-02-14 02:51:19'),
(6, 'asdfsadf', 'asdf@gmail.com', '465465', '465465', '', '1234', 'user', 1, '2023-09-26 09:09:12'),
(7, 'Alex', 'Alex@gmail.com', '0123456789', '9876543210', 'Kota Kinabalu', '$2y$10$ofI1SQn3jTuZaf4C8QoFHOdWR2zpqPS2gpcCbVdNfw8m2w0bXoMA6', 'user', 0, '2023-10-05 21:01:30'),
(0, 'BodyFit', 'bodyfit@gmail.com', '0125404407', '0123456789', 'INTI Penang', '$2y$10$dfpYsRtYGiyoETXd9sb0ou1EVn0e6ab12H8N.IW2mvbgZV7qXDm1K', 'admin', 0, '2023-10-10 11:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `prod_id`, `created_at`) VALUES
(5, 1, 9, '2023-09-23 18:55:30'),
(6, 7, 0, '2023-10-11 00:37:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
