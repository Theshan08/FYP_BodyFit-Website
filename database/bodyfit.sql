-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2023 at 04:38 AM
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
-- Database: `bodyfit`
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
(51, 9, 14, 1, '2023-10-13 17:50:29'),
(58, 7, 16, 1, '2023-10-27 17:37:56'),
(61, 7, 19, 2, '2023-10-27 17:50:55'),
(62, 7, 17, 2, '2023-10-29 04:15:42');

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
(10, 'Gym Equipment', 'gym_equip', 'bike, treadmill, dumbells, barbells and many more', 0, 0, '1696996933.jpg', 'gym_equipment', 'gym_equipment', 'gym_equipment', '2023-10-11 04:02:13'),
(11, 'Amino Acid', 'amino acid', 'Amino acids are organic compounds that contain both amino and carboxylic acid functional groups. Although over 500 amino acids exist in nature, by far the most important are the 22 α-amino acids incorporated into proteins.', 0, 0, '1697367690.png', 'amino acid', 'amino acidamino acid', 'amino acid', '2023-10-15 11:01:30'),
(12, 'Weight Gainer', 'Weight Gainer', 'weight gainer is for the user that struggles to gain weight', 0, 0, '1697367837.jpeg', 'Weight Gainer', 'Weight GainerWeight Gainer', 'Weight Gainer', '2023-10-15 11:03:57'),
(13, 'Protein Bar', 'protein bar', 'By eating junk chocalate, eating protein bar help makes you full rather than making yourself fat', 0, 0, '1697368004.jpeg', 'protein bar', 'protein barprotein bar', 'protein bar', '2023-10-15 11:06:44');

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
(7, 'ORDERSC197723456789', 6, 'Mandela', 'Mandela@gmail.com', '0123456789', 'Inti', 11900, 2997, 'COD', '', 'delivered', 'completed', NULL, '2023-10-04 07:31:19'),
(8, 'ORDERSC759323456789', 7, 'Test', 'test@gmail.com', '0123456789', 'Hello123', 11700, 630, 'COD', '', '', '', NULL, '2023-10-07 08:43:40'),
(9, 'ORDERSC1126234656', 7, 'test', 'test@gmail.com', '01234656', 'hello123', 11700, 630, 'COD', '', 'delivered', 'completed', NULL, '2023-10-07 11:43:50'),
(10, 'ORDERSC609123456789', 7, 'Hello', 'hello123@gmail.com', '0123456789', 'inti', 11700, 39992, 'COD', '', 'received', 'pending', NULL, '2023-10-10 05:16:27'),
(11, 'ORDERSC327823456789', 7, 'Alex', 'Alex@gmail.com', '0123456789', 'Kota Kinabalu', 987654321, 1998, 'COD', '', 'received', 'pending', NULL, '2023-10-11 11:41:52'),
(12, 'ORDERSC128323456789', 7, 'Alex', 'Alex@gmail.com', '0123456789', 'Kota Kinabalu', 66554498, 9998, 'COD', '', 'delivered', 'completed', NULL, '2023-10-11 11:57:04'),
(13, 'ORDERSC132023456789', 7, 'Alex', 'Alex@gmail.com', '0123456789', 'Kota Kinabalu', 66554498, 717, 'COD', '', 'in_progress', 'pending', NULL, '2023-10-11 13:27:18'),
(14, 'ORDERSC858423456789', 7, 'Alex', 'Alex@gmail.com', '0123456789', 'Kota Kinabalu', 66554498, 717, 'Paid by PayPal', '14J163276X835182X', 'delivered', 'completed', NULL, '2023-10-11 15:10:52'),
(15, 'ORDERSC637723456789', 7, 'Alex', 'Alex@gmail.com', '0123456789', 'Kota Kinabalu', 66554498, 347, 'COD', '', 'delivered', 'completed', NULL, '2023-10-11 15:47:20'),
(16, 'ORDERSC153323456789', 7, 'Alex', 'Alex@gmail.com', '0123456789', 'Kota Kinabalu', 66554498, 239, 'COD', '', 'in_progress', 'pending', NULL, '2023-10-12 12:10:09'),
(17, 'ORDERSC540723456789', 9, 'User1', 'user1@gmail.com', '0123456789', '            test', 2147483647, 239, 'COD', '', 'delivered', 'completed', NULL, '2023-10-13 12:14:26'),
(18, 'ORDERSC540623456789', 9, 'User1', 'user1@gmail.com', '0123456789', '            test', 2147483647, 239, 'COD', '', 'intransit', 'pending', NULL, '2023-10-13 14:49:20'),
(19, 'ORDERSC113123456789', 9, 'test', 'test@gmail.com', '0123456789', '            tstss', 123456787, 478, 'COD', '', 'in_progress', 'pending', NULL, '2023-10-13 14:52:01'),
(20, 'ORDERSC814223456789', 9, 'User1', 'user1@gmail.com', '0123456789', '        hello    ', 2147483647, 4999, 'COD', '', 'in_progress', 'pending', NULL, '2023-10-13 15:04:36'),
(21, 'ORDERSC540523456789', 9, 'User1', 'user1@gmail.com', '0123456789', '        hello    ', 2147483647, 347, 'COD', '', 'in_progress', 'pending', NULL, '2023-10-13 16:42:58'),
(22, 'ORDERSC258223546878', 9, 'test', 'test@gmail.com', '0123546878', 'hrllo', 2147483647, 347, 'COD', '', 'in_progress', 'pending', NULL, '2023-10-13 16:51:16'),
(23, 'ORDERSC997523456789', 9, 'nickel', 'Test@gmail.com', '0123456789', 'test', 2147483647, 999, 'COD', '', 'in_progress', 'pending', NULL, '2023-10-13 17:04:38'),
(24, 'ORDERSC991123456789', 9, 'User1', 'user1@gmail.com', '0123456789', '        hello    ', 2147483647, 347, 'Paid by PayPal', '6TD60867TG7006340', 'in_progress', 'completed', NULL, '2023-10-13 17:45:08'),
(25, 'ORDERSC510023456789', 7, 'Alex', 'Alex@gmail.com', '0123456789', '        Kota Kinabalu    ', 66554498, 1238, 'Paid by PayPal', '420190098V399572L', 'delivered', 'completed', NULL, '2023-10-18 06:00:26'),
(26, 'ORDERSC278723456789', 7, 'Alex', 'Alex@gmail.com', '0123456789', '        Kota Kinabalu    ', 66554498, 239, 'Paid by PayPal', '2R102505698655915', 'in_progress', 'completed', NULL, '2023-10-18 06:27:10'),
(27, 'ORDERSC360623456789', 7, 'Alex', 'Alex@gmail.com', '0123456789', '        Kota Kinabalu    ', 66554498, 229, 'Paid by PayPal', '6LR80619W3266271J', 'in_progress', 'completed', NULL, '2023-10-18 06:35:38'),
(28, 'ORDERSC801623456789', 7, 'Alex', 'Alex@gmail.com', '0123456789', '        Kota Kinabalu    ', 66554498, 139, 'COD', '', 'in_progress', 'pending', NULL, '2023-10-18 06:36:07'),
(29, 'ORDERSC982423456789', 7, 'Alex', 'Alex@gmail.com', '0123456789', '        Kota Kinabalu    ', 66554498, 468, 'Paid by PayPal', '22A47137L3730605B', 'in_progress', 'completed', NULL, '2023-10-25 06:23:50'),
(30, 'ORDERSC211323344569', 10, 'Harold', 'harold@gmail.com', '0123344569', 'Inti Penang', 193456789, 597, 'COD', '', 'in_progress', 'pending', NULL, '2023-11-08 05:19:34'),
(31, 'ORDERSC395523344569', 10, 'Harold', 'harold@gmail.com', '0123344569', 'Inti Penang', 123456799, 5499, 'COD', '', 'in_progress', 'pending', NULL, '2023-11-08 05:20:18'),
(32, 'ORDERSC589523344569', 10, 'Harold', 'harold@gmail.com', '0123344569', 'Inti Penang', 123456789, 1145, 'COD', '', 'in_progress', 'pending', NULL, '2023-11-08 05:34:03');

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
(12, 10, 9, 8, 4999, '2023-10-10 05:16:27'),
(13, 11, 10, 2, 999, '2023-10-11 11:41:52'),
(14, 12, 9, 2, 4999, '2023-10-11 11:57:04'),
(15, 13, 14, 3, 239, '2023-10-11 13:27:18'),
(16, 14, 14, 3, 239, '2023-10-11 15:10:52'),
(17, 15, 11, 1, 347, '2023-10-11 15:47:20'),
(18, 16, 14, 1, 239, '2023-10-12 12:10:09'),
(19, 17, 14, 1, 239, '2023-10-13 12:14:26'),
(20, 18, 14, 1, 239, '2023-10-13 14:49:20'),
(21, 19, 14, 2, 239, '2023-10-13 14:52:01'),
(22, 20, 9, 1, 4999, '2023-10-13 15:04:36'),
(23, 21, 11, 1, 347, '2023-10-13 16:42:58'),
(24, 22, 11, 1, 347, '2023-10-13 16:51:16'),
(25, 23, 10, 1, 999, '2023-10-13 17:04:38'),
(26, 24, 11, 1, 347, '2023-10-13 17:45:08'),
(27, 25, 14, 1, 239, '2023-10-18 06:00:26'),
(28, 25, 10, 1, 999, '2023-10-18 06:00:26'),
(29, 26, 14, 1, 239, '2023-10-18 06:27:10'),
(30, 27, 19, 1, 229, '2023-10-18 06:35:38'),
(31, 28, 18, 1, 139, '2023-10-18 06:36:07'),
(32, 29, 19, 1, 229, '2023-10-25 06:23:50'),
(33, 29, 14, 1, 239, '2023-10-25 06:23:50'),
(34, 30, 17, 3, 199, '2023-11-08 05:19:34'),
(35, 31, 22, 1, 5499, '2023-11-08 05:20:18'),
(36, 32, 19, 5, 229, '2023-11-08 05:34:03');

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
(9, 8, ' Gold Standard 100% Whey Protein', 'gold-standard-whey-protien', ' Gold Standard 100% Whey Protein | For Muscle Recovery | No Added Sugar | Flavour Powder Vanilla Icecream\r\n24 grams of protein per serving to help rebuild and maintain muscle\r\n5.5 grams of naturally occurring BCAAs per serving to support endurance and recovery\r\nBanned substance tested-informed choice certified vegetarian', ' Gold Standard 100% Whey Protein | For Muscle Recovery | No Added Sugar | Flavour Powder Vanilla Icecream\r\n24 grams of protein per serving to help rebuild and maintain muscle\r\n5.5 grams of naturally occurring BCAAs per serving to support endurance and recovery\r\nBanned substance tested-informed choice certified vegetarian', 'build_muscle', 'noDiet_requirement', 5999, 4999, 1, '1695475433.webp', 2, 0, 1, ' Gold Standard 100% Whey Protein | For Muscle Recovery | No Added Sugar | Flavour Powder Vanilla Icecream', ' Gold Standard 100% Whey Protein | For Muscle Recovery | No Added Sugar | Flavour Powder Vanilla Icecream', ' Gold Standard 100% Whey Protein | For Muscle Recovery | No Added Sugar | Flavour Powder Vanilla Icecream', '2023-09-23 05:23:53'),
(10, 9, 'MuscleBlaze MB Creatine Monohydrate', 'MuscleBlaze-MB-Creatine-Monohydrate', 'MuscleBlaze MB Creatine Monohydrate is a workout supplement that can help boost workout performance. It is a source of pure and unadulterated creatine monohydrate, which is instantly absorbed by the body, providing a constant supply of energy by resynthesizing ADPs into ATPs (the energy currency) of the body. Regular consumption of creatine monohydrate allows for sustaining longer in the gym and attaining lean muscle mass.', 'MuscleBlaze MB Creatine Monohydrate is a workout supplement that can help boost workout performance. It is a source of pure and unadulterated creatine monohydrate, which is instantly absorbed by the body, providing a constant supply of energy by resynthesizing ADPs into ATPs (the energy currency) of the body. Regular consumption of creatine monohydrate allows for sustaining longer in the gym and attaining lean muscle mass.', 'lose_weight', 'vegetarian', 1299, 999, 1, '1695537855.jpg', 16, 0, 1, 'MuscleBlaze MB Creatine Monohydrate', 'MuscleBlaze MB Creatine Monohydrate', 'MuscleBlaze MB Creatine Monohydrate', '2023-09-23 22:44:15'),
(11, 8, 'MuscleTech Vanilla ', 'muscletech', 'ultimate muscle building protein sjake', '<p>Ultimate Protein + Weight Loss Formula</p><p><br></p>', 'build_muscle', 'noDiet_requirement', 359, 347, 1, '1697027228.jpg', 8, 0, 0, 'muscletech', 'muscletech', 'muscletech', '2023-10-11 12:27:08'),
(14, 8, 'Vegan Weight Gainer', 'Vegan Weight Gainer', 'Getting a decent amount of protein, carbs, and calories has never been so effortless, one shake will deliver 31g of protein, 50g of carbs, and 388kcal. The beast of a supplement, Weight Gainer Blend, makes a perfect choice to be taken post-workout, or on a rest-day to keep your levels full.', '<p>test</p>', 'build_muscle', 'vegan', 240, 239, 1, '1697028419.jpg', 4, 0, 1, 'myprotein ', 'myprotein', 'myprotein', '2023-10-11 12:46:59'),
(15, 8, 'myprotein whey impact', 'myprotein', 'whey impact', '<p>test</p>', 'build_muscle', 'vegetarian', 800, 425, 1, '1697371319.jpg', 30, 0, 0, 'myprotein', 'myprotein', 'myproteinmyprotein', '2023-10-15 12:01:59'),
(16, 11, 'BCAA Amino Hydrate', 'bcaa', 'BCAA', '<h1 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235); font-size: 40px; line-height: 48px; font-weight: 400; font-family: Play, sans-serif; color: rgb(83, 83, 83); letter-spacing: 0.25px;\">BCAA Amino Hydrate&nbsp;</h1><p style=\"margin-right: 0px; margin-bottom: 2rem; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235); color: rgb(86, 86, 86); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 0.25px;\"><strong style=\"margin: 0px; padding: 0px; border-color: rgb(235, 235, 235);\">NEXT GENERATION</strong></p><p style=\"margin-right: 0px; margin-bottom: 2rem; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235); color: rgb(86, 86, 86); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 0.25px;\">BCAA Amino-Hydrate is an intra-workout &amp; recovery drink-mix that all athletes, bodybuilders, powerlifters, boxers and general keep fitters should be consuming during every workout.</p><p style=\"margin-right: 0px; margin-bottom: 2rem; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235); color: rgb(86, 86, 86); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 0.25px;\">BCAA Amino-Hydrate was formulated to deliver maximum amounts of highly tested Branch Chain Amino Acids that will maximise your training intensity and longevity while flooding your body with a blend of re-hydrating electrolytes and salts with added citrulline for intra-workout pump.</p><p style=\"margin-right: 0px; margin-bottom: 2rem; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235); color: rgb(86, 86, 86); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 0.25px;\">Fueling your body’s engine during your workout is the key to progress.*</p><p style=\"margin-right: 0px; margin-bottom: 2rem; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235); color: rgb(86, 86, 86); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 0.25px;\"><strong style=\"margin: 0px; padding: 0px; border-color: rgb(235, 235, 235);\">Key Benefits:</strong></p><ul style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235); color: rgb(86, 86, 86); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 0.25px;\"><li style=\"margin: 0px; padding: 8px 0px; border-color: rgb(235, 235, 235); line-height: 20px; list-style: inside none disc;\">Batch tested for athletes by Informed-Sport</li><li style=\"margin: 0px; padding: 8px 0px; border-color: rgb(235, 235, 235); line-height: 20px; list-style: inside none disc;\">Replenish electrolytes</li><li style=\"margin: 0px; padding: 8px 0px; border-color: rgb(235, 235, 235); line-height: 20px; list-style: inside none disc;\">Featuring citrulline (intra-workout pump)</li><li style=\"margin: 0px; padding: 8px 0px; border-color: rgb(235, 235, 235); line-height: 20px; list-style: inside none disc;\">Easy Mixing with the&nbsp;Applied shaker for extra water intake</li><li style=\"margin: 0px; padding: 8px 0px; border-color: rgb(235, 235, 235); line-height: 20px; list-style: inside none disc;\">Halal certified product</li></ul><div class=\"accordion-item\" style=\"margin: 0px; padding: 0px; border-color: rgb(235, 235, 235); color: rgb(86, 86, 86); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 0.25px; background-color: rgb(255, 255, 255);\"><div id=\"flush-collapse2\" class=\"accordion-collapse collapse show\" aria-labelledby=\"flush-heading2\" data-bs-parent=\"#accordionFlushExample\" style=\"margin: 0px; padding: 0px; border-color: rgb(235, 235, 235);\"><div class=\"accordion-body\" style=\"margin: 0px; padding-top: 0px; padding-bottom: 0px; border-color: rgb(235, 235, 235);\"><p style=\"margin-right: 0px; margin-bottom: 2rem; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235);\">*Vitamin B6 contributes to a normal energy-yielding metabolism.</p></div></div></div><div class=\"accordion-item\" style=\"margin: 0px; padding: 0px; border-color: rgb(235, 235, 235); color: rgb(86, 86, 86); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 0.25px; background-color: rgb(255, 255, 255);\"><h2 id=\"flush-heading3\" class=\"accordion-header\" style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235); font-size: 36px; line-height: 42px; font-weight: 400; font-family: Play, sans-serif; color: rgb(83, 83, 83);\"><strong style=\"margin: 0px; padding: 0px; border-color: rgb(235, 235, 235); font-size: 16px;\">Suggested Use:</strong></h2></div><p style=\"margin-right: 0px; margin-bottom: 2rem; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235); color: rgb(86, 86, 86); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 0.25px;\">Mix 1 scoop (14g) with 500ml of water and shake well. Consume during exercise on training days or throughout the day on non-training days.<em style=\"margin: 0px; padding: 0px; border-color: rgb(235, 235, 235);\"><br style=\"margin: 0px 0px 5px; padding: 0px; border-color: rgb(235, 235, 235);\"></em></p><p style=\"margin-right: 0px; margin-bottom: 2rem; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235); color: rgb(86, 86, 86); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 0.25px;\"><em style=\"margin: 0px; padding: 0px; border-color: rgb(235, 235, 235);\">Scoops are estimate only, weighing scales are recommended.</em></p><p style=\"margin-right: 0px; margin-bottom: 2rem; margin-left: 0px; padding: 0px; border-color: rgb(235, 235, 235); color: rgb(86, 86, 86); font-family: Roboto, sans-serif; font-size: 14px; letter-spacing: 0.25px;\"><em style=\"margin: 0px; padding: 0px; border-color: rgb(235, 235, 235);\"><strong style=\"margin: 0px; padding: 0px; border-color: rgb(235, 235, 235);\">Caution:&nbsp;</strong></em>Check with a qualified health professional before using this product if you are under the age of 18, pregnant or nursing a baby or if you have any known or suspected medical condition(s) or are taking any prescription or OTC medication(s). Not to be used as a substitute for a varied diet and healthy lifestyle. Store this product in a cool dry place, away from children. Do not exceed suggested use.</p>', 'build_muscle', 'noDiet_requirement', 135, 120, 0, '1697371994.jpg', 20, 0, 0, 'bcaa', 'bcaa', 'bcaa', '2023-10-15 12:13:14'),
(17, 13, 'Myprotein Protein Brownie', 'protein-brownie', 'Brownie filled with protein.', '<div class=\"productDescription_contentPropertyHeading productDescription_contentPropertyHeading-tabbed\" data-tab-title=\"Product Overview\" style=\"font-size: 1.27rem; line-height: 1.75rem; font-weight: 700; font-style: inherit; text-indent: 0px; text-decoration: none; white-space: normal; margin: 0px; padding: 16px 0px 16px 8px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; box-sizing: border-box; font-family: Biotif, &quot;Noto Sans&quot;, &quot;Noto Sans JP&quot;, &quot;Noto Sans KR&quot;, Helvetica; text-transform: capitalize; text-align: left; color: rgb(26, 26, 26); width: 623.99px; cursor: default;\">Product Overview</div><div class=\"productDescription_contentPropertyHeading productDescription_contentPropertyHeading-tabbed\" data-tab-title=\"Product Overview\" style=\"font-size: 1.27rem; line-height: 1.75rem; font-weight: 700; font-style: inherit; text-indent: 0px; text-decoration: none; white-space: normal; margin: 0px; padding: 16px 0px 16px 8px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; box-sizing: border-box; font-family: Biotif, &quot;Noto Sans&quot;, &quot;Noto Sans JP&quot;, &quot;Noto Sans KR&quot;, Helvetica; text-transform: capitalize; text-align: left; color: rgb(26, 26, 26); width: 623.99px; cursor: default;\"><span style=\"background-color: initial; font-size: 1rem; font-style: inherit; font-weight: 300; letter-spacing: 0.2px; font-family: inherit; text-align: var(--bs-body-text-align);\">With up to 75% less sugar than standard supermarket alternatives, enjoy an afternoon pick-me-up without ruining all your hard-earned progress.</span></div><div id=\"product-description-content-lg-2\" class=\"productDescription_contentProperties productDescription_contentProperties_list\" data-item-content=\"\" aria-labelledby=\"product-description-heading-lg-2\" role=\"region\" style=\"line-height: inherit; margin: 0px; padding: 8px 40px 32px 8px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; font-family: Biotif, &quot;Noto Sans&quot;, &quot;Noto Sans JP&quot;, &quot;Noto Sans KR&quot;, Helvetica; display: flex; flex-basis: 100%; flex-flow: column wrap; align-items: stretch; color: rgb(77, 79, 83);\"><div class=\"productDescription_synopsisContent\" style=\"font-size: 1rem; line-height: 1.5rem; font-style: inherit; margin: 0px 0px 12px; padding: 0px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; width: 623.99px; color: rgb(26, 26, 26); letter-spacing: 0.2px;\"><div class=\"athenaProductPageSynopsisContent\" style=\"line-height: inherit; font-weight: inherit; font-style: inherit; margin: 0px; padding: 0px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; font-family: inherit;\"><p style=\"line-height: 1.5rem; font-style: inherit; margin-right: 0px; margin-bottom: 12px; margin-left: 0px; padding: 0px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; letter-spacing: 0.2px;\">Created with heaps of delicious cocoa powder and baked with sweet chocolate chips, our Protein Brownies are packed with 23g of protein for an indulgent everyday treat.</p><p style=\"line-height: 1.5rem; font-style: inherit; margin-right: 0px; margin-bottom: 12px; margin-left: 0px; padding: 0px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; letter-spacing: 0.2px;\">We’ve gone through an exciting redesign, and as we step into a new era, you’ll see fresh packaging in your orders. &nbsp;<br></p></div></div></div>', 'build_muscle', 'noDiet_requirement', 210, 199, 0, '1697389420.jpg', 27, 0, 1, 'protein-brownie', 'protein-brownie', 'protein-brownie', '2023-10-15 17:03:40'),
(18, 9, 'Myprotein Creatine Monohydrate', 'creatine-monohydrate', 'Most effective creatine monohydrate', '<p style=\"font-size: 16px;\"><span style=\"font-weight: 700;\">Product Overview<br><br></span></p><p style=\"margin-right: 0px; margin-bottom: 12px; margin-left: 0px; line-height: 1.5rem; font-size: 16px; padding: 0px; height: initial; border: 0px; background: 0px 0px rgb(242, 249, 249); list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; font-family: Biotif, &quot;Noto Sans&quot;, &quot;Noto Sans JP&quot;, &quot;Noto Sans KR&quot;, Helvetica; color: rgb(26, 26, 26); letter-spacing: 0.2px;\">One of the most highly researched forms of creatine in the world — our hard-hitting powder is scientifically proven to increase physical performance,<sup style=\"font-size: smaller; line-height: 16px; font-weight: inherit; font-style: inherit; margin: 0px; padding: 0px; height: initial; border: 0px; background: 0px 0px; list-style: none; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none;\">1&nbsp;</sup>by improving overall power.</p><p style=\"margin-right: 0px; margin-bottom: 12px; margin-left: 0px; line-height: 1.5rem; font-size: 16px; padding: 0px; height: initial; border: 0px; background: 0px 0px rgb(242, 249, 249); list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; font-family: Biotif, &quot;Noto Sans&quot;, &quot;Noto Sans JP&quot;, &quot;Noto Sans KR&quot;, Helvetica; color: rgb(26, 26, 26); letter-spacing: 0.2px;\">We’ve gone through an exciting redesign, and as we step into a new era, you’ll see fresh packaging in your orders. &nbsp;<br>&nbsp;<br>Change is a good thing. But change takes time. Especially when you make change responsibly.&nbsp;<br><br></p>', 'build_muscle', 'noDiet_requirement', 149, 139, 0, '1697389924.jpg', 29, 0, 0, 'Myprotein ', 'Myprotein ', 'Myprotein ', '2023-10-15 17:12:04'),
(19, 12, 'Muscletech Weight Gainer', 'weight-gainer', 'Muscletech ', '<pre data-hook=\"description\" class=\"_28cEs\" style=\"background: transparent; border: 0px; margin-bottom: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: inherit; text-wrap: wrap; overflow-wrap: break-word; word-break: break-word; text-overflow: ellipsis; font-size: 16px;\"><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit; white-space-collapse: collapse;\"><span style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\"><strong style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Directions</strong>:</span></p><ul style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 1em; outline: 0px; padding: 0px 0px 0px 40px; vertical-align: baseline; list-style: circle; padding-inline: revert; font: inherit; white-space-collapse: collapse;\"><li style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\">Mix 1 serving (3 Scoops) in 10 oz. of water or skim milk and consume twice daily.</li></ul><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit; white-space-collapse: collapse;\"> </p><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit; white-space-collapse: collapse;\"><span style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\"><strong style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Description</strong>:</span></p><ul style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 1em; outline: 0px; padding: 0px 0px 0px 40px; vertical-align: baseline; list-style: circle; padding-inline: revert; font: inherit; white-space-collapse: collapse;\"><li style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\">We’ve engineered a 5-in-1, hardcore mass gainer for anyone looking to put on some extra size and strength. Our 100% Premium Mass Gainer features 40g of protein, over 230g of carbs and over 1,100 mass-producing calories, plus 4.1g of L-leucine, 5g of creatine, and 19 vitamins and minerals for huge gains.</li></ul><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit; white-space-collapse: collapse;\"> </p><ul style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 1em; outline: 0px; padding: 0px 0px 0px 40px; vertical-align: baseline; list-style: circle; padding-inline: revert; font: inherit; white-space-collapse: collapse;\"><li style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\">In a university study, subjects who added 2,000 calories to a high-protein diet and a weightlifting program gained 6.8 lbs. of mass vs. 1.3 lbs. in the control group. This formula provides over 2,000 mass-building calories with just 2 servings per day.</li></ul><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit; white-space-collapse: collapse;\"> </p><ul style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 1em; outline: 0px; padding: 0px 0px 0px 40px; vertical-align: baseline; list-style: circle; padding-inline: revert; font: inherit; white-space-collapse: collapse;\"><li style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\">Unlike our competitors that contain little to no creatine, our 100% Premium Mass Gainer contains a clinically validated 5g dose of creatine to help you increase strength and regenerate ATP stores that are reduced during resistance training. In a human clinical study, subjects gained 6 lbs. in just 6 weeks while using the same creatine dose found in 2 daily servings of our mass gainer.</li></ul><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit; white-space-collapse: collapse;\"> </p><ul style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 1em; outline: 0px; padding: 0px 0px 0px 40px; vertical-align: baseline; list-style: circle; padding-inline: revert; font: inherit; white-space-collapse: collapse;\"><li style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\"><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\"><strong style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">40G PROTEIN</strong></p></li><li style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\"><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\"><strong style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">235G CARBS</strong></p></li><li style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\"><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\"><strong style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">1,130 CALORIES</strong></p></li><li style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\"><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\"><strong style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">5G CREATINE</strong></p></li></ul></pre>', 'build_muscle', 'noDiet_requirement', 250, 229, 1, '1697390508.jpg', 13, 0, 0, 'Muscletech ', 'Muscletech ', 'Muscletech ', '2023-10-15 17:21:48'),
(20, 13, 'MuscleTech Signature Protein Bar', 'candy-bar', 'MuscleTech Signature Protein Bar', '<pre data-hook=\"description\" class=\"_28cEs\" style=\"background: transparent; border: 0px; margin-bottom: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font-family: inherit; text-wrap: wrap; overflow-wrap: break-word; word-break: break-word; text-overflow: ellipsis; font-size: 16px;\"><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit; white-space-collapse: collapse;\"><span style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\"><strong style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Description</strong>:</span></p><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit; white-space-collapse: collapse;\">The ultimate chocolate bar from MuscleTech and All-Pro football star Rob Gronkowski that not only tastes amazing, but is packed with a whopping 20g of protein, boosts energy and is make with real chocolate!</p><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit; white-space-collapse: collapse;\">&nbsp;</p><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit; white-space-collapse: collapse;\">Sink your teeth into this soft and chewy candy bar that packs 20g of protein and an energy boost. These gluten-free, triple-layered, baked bars are made with science-backed premium whey protein to help support muscle growth and recovery from workouts!</p><p style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit; white-space-collapse: collapse;\">&nbsp;</p><ul style=\"background: transparent; border: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 1em; outline: 0px; padding: 0px 0px 0px 40px; vertical-align: baseline; list-style: circle; padding-inline: revert; font: inherit; white-space-collapse: collapse;\"><li style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\">Candy bar taste</li><li style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\">20g protein</li><li style=\"background: transparent; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; font: inherit;\">Boosts energy</li></ul></pre>', 'build_muscle', 'noDiet_requirement', 130, 119, 0, '1697390933.jpeg', 30, 0, 0, 'MuscleTech ', 'MuscleTech ', 'MuscleTech ', '2023-10-15 17:28:53'),
(21, 8, 'Myprotein The Whey', 'Myprotein-whey1', 'Gluten Free protein', '<div class=\"productDescription_contentPropertyHeading productDescription_contentPropertyHeading-tabbed\" data-tab-title=\"Product Overview\" style=\"font-size: 1.27rem; line-height: 1.75rem; font-weight: 700; font-style: inherit; text-indent: 0px; text-decoration: none; white-space: normal; margin: 0px; padding: 16px 0px 16px 8px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; box-sizing: border-box; font-family: Biotif, \"Noto Sans\", \"Noto Sans JP\", \"Noto Sans KR\", Helvetica; text-transform: capitalize; text-align: left; color: rgb(26, 26, 26); width: 623.99px; cursor: default;\">Product Overview</div><div class=\"productDescription_contentPropertyHeading productDescription_contentPropertyHeading-tabbed\" data-tab-title=\"Product Overview\" style=\"font-size: 1.27rem; line-height: 1.75rem; font-weight: 700; font-style: inherit; text-indent: 0px; text-decoration: none; white-space: normal; margin: 0px; padding: 16px 0px 16px 8px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; box-sizing: border-box; font-family: Biotif, \"Noto Sans\", \"Noto Sans JP\", \"Noto Sans KR\", Helvetica; text-transform: capitalize; text-align: left; color: rgb(26, 26, 26); width: 623.99px; cursor: default;\"><span style=\"background-color: initial; font-size: 1rem; font-style: inherit; font-weight: 300; letter-spacing: 0.2px; font-family: inherit; text-align: var(--bs-body-text-align);\">The Whey is our premium 100% whey protein blend designed to contribute to the growth and maintenance of muscle mass,</span><span style=\"background-color: initial; font-size: 1rem; font-style: inherit; font-weight: 300; letter-spacing: 0.2px; font-family: inherit; text-align: var(--bs-body-text-align);\"> along with digestive enzymes and live cultures.</span></div><div id=\"product-description-content-lg-2\" class=\"productDescription_contentProperties productDescription_contentProperties_list\" data-item-content=\"\" aria-labelledby=\"product-description-heading-lg-2\" role=\"region\" style=\"line-height: inherit; margin: 0px; padding: 8px 40px 32px 8px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; font-family: Biotif, \"Noto Sans\", \"Noto Sans JP\", \"Noto Sans KR\", Helvetica; display: flex; flex-basis: 100%; flex-flow: column wrap; align-items: stretch; color: rgb(77, 79, 83);\"><div class=\"productDescription_synopsisContent\" style=\"font-size: 1rem; line-height: 1.5rem; font-style: inherit; margin: 0px 0px 12px; padding: 0px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; width: 623.99px; color: rgb(26, 26, 26); letter-spacing: 0.2px;\"><div class=\"athenaProductPageSynopsisContent\" style=\"line-height: inherit; font-weight: inherit; font-style: inherit; margin: 0px; padding: 0px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; font-family: inherit;\"><p style=\"line-height: 1.5rem; font-style: inherit; margin-right: 0px; margin-bottom: 12px; margin-left: 0px; padding: 0px; height: initial; border: 0px; background: 0px 0px; list-style: none; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; content: none; quotes: none; letter-spacing: 0.2px;\">Packed with market-leading nutritionals, including a massive 25g of protein in every serving, with 13g coming from whey isolate, 10g from concentrate, and 6g from hydrolyzed protein—to provide the fuel your muscles need to grow.</p></div></div></div>', 'get_lean', 'noDiet_requirement', 205, 199, 1, '1697391140.jpg', 15, 0, 0, 'Myprotein-whey1', 'Myprotein-whey1', 'Myprotein-whey1', '2023-10-15 17:32:20'),
(22, 10, 'NORDICTRACK STUDIO ELLIPTICAL', 'NORDICTRACK ', 'NORDICTRACK ', '<ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Top Trainers:&nbsp;</span>iFIT brings some of the best personal trainers in the world straight to your screen, making it easy to find the perfect coach for you</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Global Workouts:&nbsp;</span>Embark on a virtual journey around the world with your favorite personal trainer as incline-matching technology digitally adjusts your speed, incline, or resistance to mimic real-world terrain</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Studio Classes:&nbsp;</span>Participate in boutique Studio Classes alongside virtual classmates</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Personalized Workouts:&nbsp;</span>Personally-tailored workouts based on your fitness level and interest are sent to your equipment every day</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Activation Required:</span>&nbsp;Redeem your 30-day iFIT Membership* to activate your product and gain access to world-class personal training in your home</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">*Credit card required</span>&nbsp;- iFIT membership not required to access onboard workouts and other core features of your machine. After initial 30 days, membership will auto-renew for fee unless canceled 24 hours in advance</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Automatic Trainer Control with iFIT</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">With iFIT, your trainers will automatically adjust your resistance to meet their suggestions and mimic real-world terrain</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Full iFIT membership sold separately</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">5\" High-Contrast Display</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Track all your important workout stats on this easy to read display. Enjoy enhanced metrics tracking with the iFIT app</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Integrated Tablet Holder</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Stream immersive iFIT workouts to your own tablet or smartphone (not included) to get the most out of your exercise</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">16 Lb. Inertia-Enhanced Flywheel</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">This inertia-enhanced flywheel keeps every stride smooth and consistent</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">20 Digital Resistance Levels</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">With iFIT, your trainers will auto-adjust your resistance. If you need to override their suggestions, you can do so with the simple touch of a button</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">SMR Silent Magnetic Resistance</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">This innovative technology minimizes noise so that you don’t disturb your family or neighbors</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Soft Touch Upper-Body Grips</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Transform every cardio workout into total-body exercise thanks to these soft-touch upper body grips</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Oversized Pedals</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Oversized pedals are cushioned for your comfort and convenience</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Front-Mounted Transport Wheels</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Easily move your elliptical from room to room thanks to these integrated transport wheels</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Oversized Levelers</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Keep your elliptical level on any surface for a more comfortable and secure workout</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Auxiliary Audio Port with Dual 2\" Speakers</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Listen to your favorite iFIT Trainers through high-quality speakers</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Solid Steel Construction</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">NordicTrack equipment is built to withstand your most intense workout sessions</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Water Bottle Holder</span></p><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Keep hydration within reach thanks to this convenient feature</li></ul><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">125kg&nbsp;Total Weight Capacity</span></p>', 'build_muscle', 'noDiet_requirement', 5760, 5499, 0, '1697391443.jpg', 2, 0, 0, 'NORDICTRACK ', 'NORDICTRACK ', 'NORDICTRACK ', '2023-10-15 17:37:23'),
(23, 10, 'HAMMER SPORT WATER EFFECT 3D ROWER', 'row machine', 'row machine', '<p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><img src=\"https://www.fitnessconcept.com.my/media/wysiwyg/E-BROCHURE/ROWE_1.png\" alt=\"\" width=\"328\" height=\"142\" style=\"margin: 0px; padding: 0px; border: 0px; max-height: 100%; max-width: 100%; vertical-align: top;\"></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Just the right size!</span></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">The WaterEffect 3D was designed with a 17-litre tank to provide the optimum balance between compactness and resistance. For your ultimate rowing experience, the emphasis was placed on the best possible volume and the optimum training stimulus!</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><img src=\"https://www.fitnessconcept.com.my/media/wysiwyg/E-BROCHURE/ROWER_3.png\" alt=\"\" width=\"315\" height=\"265\" style=\"margin: 0px; padding: 0px; border: 0px; max-height: 100%; max-width: 100%; vertical-align: top;\"></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Ergonomic design and accessories</span></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">The ergonomically designed rowing handle and SZ rowing bar accessories ensure that your workout is always particularly easy on your joints and effective. With the Cardio Weights you achieve an even more intensive training stimulus.</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><img src=\"https://www.fitnessconcept.com.my/media/wysiwyg/E-BROCHURE/ROWER_4.png\" alt=\"\" width=\"310\" height=\"270\" style=\"margin: 0px; padding: 0px; border: 0px; max-height: 100%; max-width: 100%; vertical-align: top;\"></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">With the power of water</span></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">Regulate the intensity of your workout by adjusting the fill level of the tank in 6 steps as well as the stroke force, so you always row in the optimal range. The high-quality water tank made of robust polycarbonate provides the soothing sound of the water.</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><img src=\"https://www.fitnessconcept.com.my/media/wysiwyg/E-BROCHURE/ROWER_5.png\" alt=\"\" width=\"309\" height=\"195\" style=\"margin: 0px; padding: 0px; border: 0px; max-height: 100%; max-width: 100%; vertical-align: top;\"></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">As free as on the water</span></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">Equipped with the extra-long aluminium rail of 105 cm, even people taller than 2m can effectively use the full range of motion. With the combination of different handles and 6 possible rowing styles, you constantly set new training stimuli and prevent one-sided training.</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">&nbsp;</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><u style=\"margin: 0px; padding: 0px;\"><img src=\"https://www.fitnessconcept.com.my/media/wysiwyg/E-BROCHURE/ROWER_6.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; max-height: 100%; max-width: 100%; vertical-align: top;\"></u></span></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">Professional design for highest demands</span></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">Due to the small and ergonomic distance between the tread plates of only 4cm, your feet are in a perfect training position: easy on the joints and effective. This small distance between your feet is a quality feature of high-quality rowing machines and ensures movements that are particularly easy on the joints. A comfortable seat height of 50 cm and feet with adjustable foot caps ensure a safe feel-good workout.</p>', 'build_muscle', 'noDiet_requirement', 7999, 7899, 0, '1697391833.jpg', 2, 0, 0, 'row machine', 'row machine', 'row machine', '2023-10-15 17:43:53');
INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `small_description`, `description`, `goal`, `diet`, `original_price`, `selling_price`, `is_supplement`, `image`, `qty`, `status`, `trending`, `meta_title`, `meta_keywords`, `meta_description`, `created_at`) VALUES
(24, 10, 'MAXX 20KG ADJUSTABLE DUMBELL', 'MAXX', 'MAXX', '<div class=\"page-title-wrapper product\" style=\"margin: 0px; padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><h1 class=\"page-title\" style=\"margin: -6px 0px 10px; padding: 0px; line-height: 44px; font-family: &quot;Saira Condensed&quot;; color: rgb(25, 25, 25); text-transform: uppercase; font-size: 40px !important;\"><img src=\"https://www.fitnessconcept.com.my/media/wysiwyg/WhatsApp_Image_2022-08-17_at_3.00.25_PM.jpeg\" alt=\"\" style=\"color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-weight: 400; text-align: var(--bs-body-text-align); margin: 0px; padding: 0px; border: 0px; max-height: 100%; max-width: 100%; vertical-align: top; width: 50%;\"><br></h1></div>', 'build_muscle', 'noDiet_requirement', 975, 925, 0, '1697391993.jpg', 12, 0, 0, 'MAXX', 'MAXX', 'MAXX', '2023-10-15 17:46:33'),
(25, 10, 'MAXX MULTI FUNCTION BENCH', 'MAXX-BENCH', 'MAXX-BENCH', '<div class=\"group-title\" role=\"tablist\" style=\"margin: 0px 0px 10px; padding: 0px; text-align: center; color: rgb(119, 119, 119); font-family: \"Open Sans\", sans-serif; font-size: 14px;\"><span style=\"font-size: 1rem; background-color: transparent; text-align: var(--bs-body-text-align);\">Maxx Multi Function Bench is design to fulfill all your workout needs. From its solid frame to its multi-adjustable position, allowing for a large workout variation</span></div><div class=\"group-content\" style=\"margin: 0px; padding: 30px 0px 0px; border-top: 1px solid rgb(221, 221, 221); color: rgb(119, 119, 119); font-family: \"Open Sans\", sans-serif; font-size: 14px;\"><div class=\"data item content\" id=\"product.info.description.custom\" data-role=\"content\" aria-labelledby=\"tab-label-product.info.description.custom\" role=\"tabpanel\" aria-hidden=\"false\" style=\"margin: 0px; padding: 0px; background-color: transparent !important;\"><ul style=\"margin-right: 0px; margin-bottom: 2.5rem; margin-left: 0px; padding: 0px 0px 0px 20px; list-style-position: initial; list-style-image: initial;\"><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Light Commercial Grade</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\">13 levels of backrest & 4 levels of seat adjustment for a full-body workout</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Comes with leg developer, preacher curl & sit up function</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Rear transportation wheels for easy relocating of the bench</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Thick 8cm upholstery</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Fits regular or Olympic weight plates</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Large footprint dimension to provide extra stability</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Product dimension: 151.1 (L) x 62.6(W) x 113.2(H) cm</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Max weight : 300kg</li><li style=\"margin: 0px 0px 1rem; padding: 0px;\">Product weight: 45kg</li></ul></div></div>', 'build_muscle', 'noDiet_requirement', 1880, 1799, 0, '1697392170.jpg', 10, 0, 0, 'MAXX-BENCH', 'MAXX-BENCH', 'MAXX-BENCH', '2023-10-15 17:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `role_as` varchar(255) NOT NULL DEFAULT 'user',
  `is_ban` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `pincode`, `address`, `password`, `role_as`, `is_ban`, `created_at`) VALUES
(2, 'New Username', 'user@gmail.com', '1231231233', '4455', '', '$2y$10$FqM7xivlNpfMcb.Ut7I5zuiIXhMyxRsdUHU6q.xL3zpdlcbNiPu46', 'user', 0, '2022-02-14 02:51:19'),
(7, 'Alex', 'Alex@gmail.com', '0123456789', '66554498', 'Kota Kinabalu', '$2y$10$ofI1SQn3jTuZaf4C8QoFHOdWR2zpqPS2gpcCbVdNfw8m2w0bXoMA6', 'user', 0, '2023-10-05 21:01:30'),
(8, 'BodyFit', 'bodyfit@gmail.com', '0125404407', '0123456789', 'INTI Penang', '$2y$10$dfpYsRtYGiyoETXd9sb0ou1EVn0e6ab12H8N.IW2mvbgZV7qXDm1K', 'admin', 0, '2023-10-10 11:23:05'),
(9, 'User1', 'user1@gmail.com', '0123456789', '020202020202', 'hello', '$2y$10$1gG7LsYkZUU0L4QcgmGB6.dUt7N5z5pUjagECkkN2i7Xu6I5VIVdq', 'user', 0, '2023-10-12 12:26:50'),
(10, 'Harold', 'harold@gmail.com', '0123344569', '01122334455', 'Kota Damansara', '$2y$10$yv8j8ymOU8SSyNJj0Zha1e6XwB03W3guQZYaif4caJVMr8QJseW26', 'user', 0, '2023-11-03 05:25:28');

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
(6, 7, 0, '2023-10-11 00:37:45'),
(10, 7, 19, '2023-10-31 02:27:07'),
(11, 7, 24, '2023-10-31 02:27:23'),
(12, 7, 23, '2023-10-31 02:27:26');

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
