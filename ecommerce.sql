-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 16, 2025 at 05:20 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(12, 5, 1, 2, '2025-06-13 12:49:22', '2025-06-13 12:49:22'),
(13, 5, 14, 1, '2025-06-14 04:23:34', '2025-06-14 04:23:34'),
(17, 3, 2, 2, '2025-06-14 12:35:12', '2025-06-15 02:41:07'),
(18, 6, 2, 1, '2025-06-15 02:54:30', '2025-06-15 02:54:30'),
(14, 5, 16, 1, '2025-06-14 08:19:54', '2025-06-14 08:19:54'),
(16, 5, 13, 1, '2025-06-14 12:02:02', '2025-06-14 12:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `image_url`) VALUES
(1, 'T-Shirt', '2025-06-11 08:37:46', '2025-06-11 08:37:46', NULL),
(2, 'Jeans', '2025-06-11 09:02:51', '2025-06-11 09:02:51', NULL),
(3, 'Bag', '2025-06-11 09:14:39', '2025-06-11 09:14:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('percent','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `discounts_code_unique` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_06_08_072431_create_products_table', 1),
(6, '2025_06_08_082505_create_categories_table', 1),
(7, '2025_06_08_083040_add_category_id_to_products_table', 1),
(8, '2025_06_08_083830_create_carts_table', 1),
(9, '2025_06_08_144831_create_orders_table', 1),
(10, '2025_06_08_144838_create_order_items_table', 1),
(11, '2025_06_09_093420_add_is_admin_to_users_table', 1),
(12, '2025_06_11_033404_add_stock_to_products_table', 1),
(13, '2025_06_11_035902_create_discounts_table', 1),
(14, '2025_06_12_074315_create_paypal_payments_table', 2),
(15, '2025_06_12_075759_add_image_url_to_categories_table', 2),
(16, '2025_06_14_110853_add_total_amount_to_orders_table', 3),
(17, '2025_06_14_111142_add_payment_fields_to_orders_table', 4),
(18, '2025_06_14_162101_change_total_amount_type_in_orders_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `total_amount`, `payment_method`, `payment_status`, `payment_id`, `created_at`, `updated_at`) VALUES
(1, 5, 39.98, 'paid', 39.98, 'paypal', 'paid', '4G2692511B580230D', '2025-06-14 04:16:38', '2025-06-14 04:16:38'),
(2, 5, 39.98, 'paid', 39.98, 'paypal', 'paid', '5MN76359WD2626133', '2025-06-14 04:22:20', '2025-06-14 04:22:20'),
(3, 5, 40.99, 'paid', 40.99, 'paypal', 'paid', '7YK01720B4334830V', '2025-06-14 04:24:08', '2025-06-14 04:24:08'),
(4, 5, 40.99, 'paid', 40.99, 'paypal', 'paid', '6GL24520C75324533', '2025-06-14 04:26:28', '2025-06-14 04:26:28'),
(5, 5, 40.99, 'paid', 40.99, 'paypal', 'paid', '2FW040172R995683D', '2025-06-14 04:35:36', '2025-06-14 04:35:36'),
(6, 5, 40.99, 'paid', 40.99, 'paypal', 'paid', '9MX58449NB783674S', '2025-06-14 04:41:20', '2025-06-14 04:41:20'),
(7, 5, 129.97, 'pending', 129.97, 'paypal', 'paid', '9SX25740S5579970M', '2025-06-14 08:54:12', '2025-06-14 09:42:32'),
(8, 5, 11.99, 'processing', 1.00, 'paypal', 'paid', '1Y481028YX128462K', '2025-06-14 09:59:20', '2025-06-14 09:59:20'),
(9, 5, 11.99, 'processing', 1.00, 'paypal', 'paid', '2UX00739F9017012H', '2025-06-14 10:00:54', '2025-06-14 10:00:54'),
(10, 5, 11.99, 'processing', 1.00, 'paypal', 'paid', '0D315708V6003000N', '2025-06-14 10:07:12', '2025-06-14 10:07:12'),
(11, 5, 11.99, 'processing', 1.00, 'paypal', 'paid', '87X25538UC9811701', '2025-06-14 10:11:29', '2025-06-14 10:11:29'),
(12, 5, 23.98, 'processing', 2.00, 'paypal', 'paid', '942161420U672060E', '2025-06-14 10:11:56', '2025-06-14 10:11:56'),
(13, 5, 23.98, 'processing', 2.00, 'paypal', 'paid', '6FD597716X6390039', '2025-06-14 10:19:31', '2025-06-14 10:19:31'),
(14, 5, 11.99, 'processing', 1.00, 'paypal', 'paid', '93X96628SP147882J', '2025-06-14 10:23:07', '2025-06-14 10:23:07'),
(15, 5, 11.99, 'processing', 1.00, 'paypal', 'paid', '8P70322763191952T', '2025-06-14 10:25:34', '2025-06-14 10:25:34'),
(16, 5, 11.99, 'processing', 1.00, 'paypal', 'paid', '18B18695C6214944G', '2025-06-14 10:32:44', '2025-06-14 10:32:44'),
(17, 3, 30.99, 'completed', 1.00, 'paypal', 'paid', '340187348G4229902', '2025-06-14 12:28:15', '2025-06-14 12:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 2, 19.99, '2025-06-14 04:16:38', '2025-06-14 04:16:38'),
(2, 2, 12, 2, 19.99, '2025-06-14 04:22:20', '2025-06-14 04:22:20'),
(3, 3, 13, 1, 40.99, '2025-06-14 04:24:08', '2025-06-14 04:24:08'),
(4, 4, 13, 1, 40.99, '2025-06-14 04:26:28', '2025-06-14 04:26:28'),
(5, 5, 13, 1, 40.99, '2025-06-14 04:35:36', '2025-06-14 04:35:36'),
(6, 6, 13, 1, 40.99, '2025-06-14 04:41:20', '2025-06-14 04:41:20'),
(7, 7, 16, 1, 129.97, '2025-06-14 08:54:12', '2025-06-14 08:54:12'),
(8, 8, 3, 1, 11.99, '2025-06-14 09:59:20', '2025-06-14 09:59:20'),
(9, 9, 3, 1, 11.99, '2025-06-14 10:00:54', '2025-06-14 10:00:54'),
(10, 10, 3, 1, 11.99, '2025-06-14 10:07:12', '2025-06-14 10:07:12'),
(11, 11, 3, 1, 11.99, '2025-06-14 10:11:29', '2025-06-14 10:11:29'),
(12, 12, 3, 2, 11.99, '2025-06-14 10:11:56', '2025-06-14 10:11:56'),
(13, 13, 3, 2, 11.99, '2025-06-14 10:19:31', '2025-06-14 10:19:31'),
(14, 14, 3, 1, 11.99, '2025-06-14 10:23:07', '2025-06-14 10:23:07'),
(15, 15, 3, 1, 11.99, '2025-06-14 10:25:34', '2025-06-14 10:25:34'),
(16, 16, 3, 1, 11.99, '2025-06-14 10:32:44', '2025-06-14 10:32:44'),
(17, 17, 8, 1, 30.99, '2025-06-14 12:28:15', '2025-06-14 12:28:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payments`
--

DROP TABLE IF EXISTS `paypal_payments`;
CREATE TABLE IF NOT EXISTS `paypal_payments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `paypal_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paypal_payments_paypal_transaction_id_unique` (`paypal_transaction_id`),
  KEY `paypal_payments_order_id_foreign` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'api_token', '9d6f7f852b456999efe5a6777fdf11a178200518a0c71d9488222036244ef3df', '[\"*\"]', '2025-06-13 12:43:07', '2025-06-10 21:56:48', '2025-06-13 12:43:07'),
(2, 'App\\Models\\User', 2, 'api_token', '3cd5aed426f81d93f2fc9d6b82c7a6b7ac34de871ac708bd2525674759b69f1b', '[\"*\"]', NULL, '2025-06-10 21:59:13', '2025-06-10 21:59:13'),
(3, 'App\\Models\\User', 2, 'api_token', 'c0d966452e52893598a6784830a44f66cffc179b0d1cd5e44a6ea1eea268384d', '[\"*\"]', NULL, '2025-06-10 22:10:29', '2025-06-10 22:10:29'),
(4, 'App\\Models\\User', 2, 'admin_token', '1e38f7268eb4ffffab40d6ac8bd307d032e6c858d7e25e966de7e301357df023', '[\"*\"]', NULL, '2025-06-10 22:56:30', '2025-06-10 22:56:30'),
(5, 'App\\Models\\User', 2, 'admin_token', 'd3246e1c426a89aa88df04801e67e5e00e38c23bb3b226db9c3bc27042d24462', '[\"*\"]', '2025-06-11 07:05:31', '2025-06-10 22:56:56', '2025-06-11 07:05:31'),
(6, 'App\\Models\\User', 2, 'admin_token', '2ce625c8f5d42ed24af3b6566a7ee2256f72a1dc77bd8bbeb37586ce9b8ef2f1', '[\"*\"]', '2025-06-11 07:36:06', '2025-06-11 07:14:37', '2025-06-11 07:36:06'),
(7, 'App\\Models\\User', 2, 'admin_token', '57f10a3c4cfb7e153ec940704a223e2f35c70261ac111bede2a46b8306ee4430', '[\"*\"]', '2025-06-14 12:29:21', '2025-06-11 07:36:13', '2025-06-14 12:29:21'),
(8, 'App\\Models\\User', 3, 'api_token', 'c09e57f17e3359d0000b2ef42fe9deb857612524078e368176fb6858b7e93269', '[\"*\"]', NULL, '2025-06-12 05:32:39', '2025-06-12 05:32:39'),
(9, 'App\\Models\\User', 4, 'api_token', 'd806df142a95fa36e6bda628d2b4a12fb125a711e222f7dc0bfe5c2ac7e09cb3', '[\"*\"]', NULL, '2025-06-12 05:37:40', '2025-06-12 05:37:40'),
(10, 'App\\Models\\User', 3, 'authToken', 'e491e3de0fdccdc09d6178bc4e8bda0427f8ad053b2278cb460de09ef80c44ec', '[\"*\"]', NULL, '2025-06-13 09:58:02', '2025-06-13 09:58:02'),
(11, 'App\\Models\\User', 3, 'authToken', 'f1ee7e8b9ba8b59fc340c069a28b61172a54947cc6fb928fd767d03bce0c4184', '[\"*\"]', NULL, '2025-06-13 10:04:25', '2025-06-13 10:04:25'),
(12, 'App\\Models\\User', 3, 'authToken', 'a1518b83d5972526216e605e87acc89c9049e4779dfa28441d322b5250d10fb7', '[\"*\"]', '2025-06-13 10:14:20', '2025-06-13 10:11:42', '2025-06-13 10:14:20'),
(13, 'App\\Models\\User', 3, 'authToken', '8715cbca67bd0946ab6b3e895b6975a9459e75938820784f0179e58e350e4839', '[\"*\"]', '2025-06-13 12:37:03', '2025-06-13 10:44:46', '2025-06-13 12:37:03'),
(14, 'App\\Models\\User', 5, 'authToken', 'f97503248264b1f23ad12f41f8c2c96f6515a5f64571d797264fb98a04f0fce1', '[\"*\"]', '2025-06-14 12:17:46', '2025-06-13 12:37:30', '2025-06-14 12:17:46'),
(15, 'App\\Models\\User', 5, 'authToken', '6b070a902ace50099a72da3943ba53bda1fc0939f521ab6736c4c9bf019b95b2', '[\"*\"]', '2025-06-15 11:30:21', '2025-06-13 12:47:54', '2025-06-15 11:30:21'),
(16, 'App\\Models\\User', 3, 'authToken', '4709268a06a22471f69e6d920b425a4d4574b9091281610143577fb0c90b830b', '[\"*\"]', '2025-06-14 12:35:24', '2025-06-14 12:18:28', '2025-06-14 12:35:24'),
(17, 'App\\Models\\User', 3, 'authToken', '922af093229a224ca341f431878df38c4c3b804fe3da39c7df6132c95102405a', '[\"*\"]', NULL, '2025-06-14 14:44:04', '2025-06-14 14:44:04'),
(18, 'App\\Models\\User', 3, 'authToken', '9fec261515668c0f958b9bfd52db9a55c850e1b1ef5d7dcb407541587e87c171', '[\"*\"]', NULL, '2025-06-14 14:44:17', '2025-06-14 14:44:17'),
(19, 'App\\Models\\User', 3, 'authToken', 'a22f15d53987d3db236cd873e715b9ae60b7ecc83ecee90ff27df1136b3b7b1a', '[\"*\"]', NULL, '2025-06-14 14:44:18', '2025-06-14 14:44:18'),
(20, 'App\\Models\\User', 5, 'authToken', '48d4f7687ef08b90d74e83ddf510c35059bdf3f276e40bcd60afd9957041785e', '[\"*\"]', NULL, '2025-06-14 14:45:38', '2025-06-14 14:45:38'),
(21, 'App\\Models\\User', 5, 'authToken', 'a215a98baad5a50a674633ff612ba5899f577022b89e8448aa31c454eeaa3eb7', '[\"*\"]', NULL, '2025-06-14 14:45:39', '2025-06-14 14:45:39'),
(22, 'App\\Models\\User', 3, 'authToken', 'bd888c181c2a290a5e06ef908c0fc05db42634a5a278330e2b861fcd7792931a', '[\"*\"]', '2025-06-14 22:23:00', '2025-06-14 22:22:50', '2025-06-14 22:23:00'),
(23, 'App\\Models\\User', 3, 'authToken', 'f9efcd9c78f876a4387bc155e7654e564030ff39c2b99cc0714133e60abeb483', '[\"*\"]', '2025-06-15 02:47:21', '2025-06-15 02:40:18', '2025-06-15 02:47:21'),
(24, 'App\\Models\\User', 6, 'authToken', 'c289113b09bdfc292a65a01c1160f04c554ffab1a6f32ba89f05481bd3291651', '[\"*\"]', NULL, '2025-06-15 02:51:18', '2025-06-15 02:51:18'),
(25, 'App\\Models\\User', 6, 'authToken', '3a43041f5a5de3d4024afdfa7dfd3382b77cccfa2797f862982f0f8dd0f049e9', '[\"*\"]', '2025-06-15 02:51:43', '2025-06-15 02:51:35', '2025-06-15 02:51:43'),
(26, 'App\\Models\\User', 6, 'authToken', 'e62fbdbd1c4296fe74c72e57a51e51ec43d6839a53209378d5d6dda4dbc22c0b', '[\"*\"]', '2025-06-15 02:53:45', '2025-06-15 02:53:43', '2025-06-15 02:53:45'),
(27, 'App\\Models\\User', 6, 'authToken', 'ee3b454b26e5ba60fd16642e3ee5d4543462ed1d0130177d590304a2b4c6ceba', '[\"*\"]', '2025-06-15 02:54:32', '2025-06-15 02:54:20', '2025-06-15 02:54:32'),
(28, 'App\\Models\\User', 3, 'authToken', 'ec8e7e4425d0475fde8e49f3923ab550b0cb23bf649cb2607ce415bf9e3f101d', '[\"*\"]', NULL, '2025-06-15 08:45:05', '2025-06-15 08:45:05'),
(29, 'App\\Models\\User', 3, 'authToken', '6dc0fef989d5179062eeb35b2dc73b623cf1557413bdf97252e4883e4da756ca', '[\"*\"]', NULL, '2025-06-15 08:49:37', '2025-06-15 08:49:37'),
(30, 'App\\Models\\User', 3, 'authToken', 'da3e352a810537792691a3def78e733a9f736e5edf5243c6bcfd0d2b9cdb83ab', '[\"*\"]', NULL, '2025-06-15 08:49:38', '2025-06-15 08:49:38'),
(31, 'App\\Models\\User', 7, 'authToken', '3b00dcc2af2eb60a11c0b6edc7660354045687fcf6606e56b9504e4b529d50f1', '[\"*\"]', NULL, '2025-06-15 09:10:14', '2025-06-15 09:10:14'),
(32, 'App\\Models\\User', 8, 'authToken', '8c84c40234c2f30cc65aa2b4811a3f7f84a518c145f7b31b44389f74b8e0c034', '[\"*\"]', NULL, '2025-06-15 09:23:55', '2025-06-15 09:23:55'),
(33, 'App\\Models\\User', 8, 'authToken', 'fde438647f9a29368b75b7d6aa45df06f1bc30380b685e4c3be983f1a58a381f', '[\"*\"]', NULL, '2025-06-15 09:24:16', '2025-06-15 09:24:16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int UNSIGNED NOT NULL DEFAULT '0',
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `stock`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Light-Blue T-Shirt', 'make from 100% Cotton', 19.99, 'products/SnEj8L202LKZq3xLkL8zEcg3l9jVHlqQh6KaH08e.webp', 100, 1, '2025-06-11 08:47:04', '2025-06-11 08:47:39'),
(2, 'Tiger T-Shirt', 'Create From Rare Material', 25.99, 'products/oGMNICUvo4jV0esHrtpmlNv6PsrFusrLgYco43Dn.jpg', 100, 1, '2025-06-11 08:49:00', '2025-06-11 08:49:00'),
(3, 'White Blue T-Shirt', 'Best For Beautiful Girl', 11.99, 'products/44foLVlO4VGeSf6opX1AkSTzvibEn5Nlng5gMAmw.jpg', 89, 1, '2025-06-11 08:49:52', '2025-06-14 10:32:44'),
(4, 'DarkBlue T-Shirt', 'Good With Gentleman', 19.99, 'products/vt1tTVdwAbkvsL1jc8wNrJnalafbYkW09ZBy8IEW.webp', 10, 1, '2025-06-11 08:52:53', '2025-06-11 08:52:53'),
(5, 'Modern Blue T-Shirt', 'Fit With Middle Age Person', 39.99, 'products/F48I6QojupbK4747ml4fPG98OwwNIDNVRBJLnAvO.jpg', 5, 1, '2025-06-11 08:53:41', '2025-06-11 08:53:41'),
(6, 'Grenn T-Shirt', 'Best For Beautiful Young Girl', 5.99, 'products/CS59MsWLxBAfwwksx6t8prnmLiMVvIK4EyVVgnYd.jpg', 10, 1, '2025-06-11 08:54:29', '2025-06-11 08:54:29'),
(7, 'White Black T-Shirt', 'Best For Young Age', 16.99, 'products/NZkzkti42KsQbRHOxTxlSfXHMEL13thZbMLHZUmQ.webp', 10, 1, '2025-06-11 08:55:08', '2025-06-11 08:55:08'),
(8, 'Dark Blue Jeans', 'Fit With Teenager', 30.99, 'products/WM4YlPLwLZc4tcw5DN2MpGfWsFA0aj5X55y93Dwo.webp', 9, 2, '2025-06-11 09:03:32', '2025-06-14 12:28:15'),
(9, 'Light Blue Jeans', 'Best For Adult Age', 20.99, 'products/ZLQS9shuUz8s3P9IKOpkByobKxXP3ggoL3bw1yxF.jpg', 10, 2, '2025-06-11 09:04:08', '2025-06-11 09:04:08'),
(10, 'Blue Jeans', 'For Sample Look', 25.99, 'products/5Eeyq2FYt1dd53THO8k8vFoGouCRQt11lMcTmKa4.jpg', 10, 2, '2025-06-11 09:05:56', '2025-06-11 09:05:56'),
(11, 'Dark Jeans', 'Best For Modern Teenager', 29.99, 'products/cGIihMtBA2w8ygCX2JkcpxIsL1aDh9TjEnI0wiYE.webp', 10, 2, '2025-06-11 09:10:55', '2025-06-11 09:10:55'),
(12, 'Dark Blue Jeans', 'Best For Modern Look', 35.99, 'products/jq6eeX9jvtyeKAMXYxytk9zKrFOFACuuc39dBRyE.jpg', 6, 2, '2025-06-11 09:12:17', '2025-06-14 04:22:20'),
(13, 'Dark Gray Jeans', 'Best For Modern Look', 32.99, 'products/C6abquUKbgW49KuPqsXUDLobASd7uHyDkrls4OFr.webp', 6, 2, '2025-06-11 09:12:59', '2025-06-14 04:41:20'),
(14, 'White Blue Jeans', 'Best For Modern Woman', 40.99, 'products/fZy8Hzi2hxRcfCRGirXfwoVUufjihy4Voh8iXtPv.webp', 10, 2, '2025-06-11 09:13:40', '2025-06-11 09:13:40'),
(15, 'Dark Blue Jeans', 'For Simple Look', 19.99, 'products/pZAbTRRqAJaqCCWSYUg2Fdt5hCHr5TOn5bDGJBcF.webp', 10, 2, '2025-06-11 09:14:25', '2025-06-11 09:14:25'),
(16, 'Brown Bag', 'User-Friendly', 129.97, 'products/DKvkidYuGvqAq4777a1I45GFGpL7k5fjaD4y1RCv.webp', 4, 3, '2025-06-11 09:15:17', '2025-06-14 08:54:12'),
(17, 'Back Bag', 'Good For Confidence Woman', 259.99, 'products/VGkhNb4bKNfgMvO7RMKt2PsZhDA3XumdyJE6DhgM.webp', 2, 3, '2025-06-11 09:15:55', '2025-06-11 09:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Admin', 'admin123@gmail.com', NULL, '$2y$10$oclDdLiPzVXOOS1ejuVq5uUH6SuP/zVGtqxp2ns2ZYqN73zHfYs02', 1, '1|WIwCg7YPdj9KlYbbWbAJZE3xmDPVaJD42rPIZU2M', '2025-06-10 21:56:48', '2025-06-10 21:56:48'),
(3, 'hour', 'hour123@gmail.com', NULL, '$2y$10$CBUcZXRcdIr8dCdAEklQHeEQa25D5D8sie2ATQ5yYFNF20.HqoWkm', 0, NULL, '2025-06-12 05:32:39', '2025-06-12 05:32:39'),
(4, 'My Name', 'test@example.com', NULL, '$2y$10$TlAUoVAhsS8sQBmwt4pKYujMgizFSj9/yjjIoAwStN0vDxPLK1L3G', 0, NULL, '2025-06-12 05:37:40', '2025-06-12 05:37:40'),
(5, 'Test User', 'test1@example.com', NULL, '$2y$10$LE55DW4UcELDwZ/ASyGh5.Gslb7M7ZecTgJIrhpVuUDuTflyEcNlW', 0, NULL, '2025-06-13 12:36:48', '2025-06-13 12:36:48'),
(6, 'test2', 'test2@gmail.com', NULL, '$2y$10$V2uOaA.HG3HaPuuR.7oTYusRsD/pQc2n18Wv3WTJ7RvHtmCd2SYKS', 0, NULL, '2025-06-15 02:51:18', '2025-06-15 02:51:18'),
(7, 'test3', 'test3@gmail.com', NULL, '$2y$10$tIrxqSjhUVz0n.qbEBZ3lO0N6kj01uVc0vpOdQdPeTu.k4AM.OLAy', 0, NULL, '2025-06-15 09:10:14', '2025-06-15 09:10:14'),
(8, 'test4', 'test4@gmail.com', NULL, '$2y$10$g172iPCHwIhyf9OfVOMi8ekKWroouHu1y/aG8YjLdOHpP1lAaS/ye', 0, NULL, '2025-06-15 09:23:55', '2025-06-15 09:23:55');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
