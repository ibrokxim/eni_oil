-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 20 2024 г., 06:03
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `eni_oil`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `code`, `value`, `created_at`, `updated_at`) VALUES
(1, 'Halal', '-', NULL, '2024-12-11 06:18:28', '2024-12-11 06:18:28'),
(2, 'Halal', '-', NULL, '2024-12-11 06:19:48', '2024-12-11 06:19:48'),
(3, 'Kosher', '-', NULL, '2024-12-11 06:21:17', '2024-12-11 06:21:17');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Центрифуга', 'centryfuga', 1, '2024-12-09 10:55:13', '2024-12-09 10:55:13'),
(2, 'Ibrohim', 'ibrohim', NULL, '2024-12-11 05:23:56', '2024-12-11 05:23:56'),
(3, 'Ibrohim', 'ibrohim-675968895f2fd', 2, '2024-12-11 05:25:13', '2024-12-11 05:25:13'),
(5, 'amir', 'amir', 2, '2024-12-11 05:41:44', '2024-12-11 05:41:44');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_12_09_044528_create_products_table', 1),
(6, '2024_12_09_045414_create_attributes_table', 1),
(7, '2024_12_09_045617_create_specifications_table', 1),
(8, '2024_12_09_050006_create_product_attributes_table', 1),
(9, '2024_12_09_050018_create_product_specifications_table', 1),
(10, '2024_12_09_050432_create_categories_table', 1),
(11, '2024_12_09_050508_create_product_category_table', 1),
(12, '2024_12_09_051319_create_product_images_table', 1),
(13, '2024_12_19_092225_create_seos_table', 2),
(14, '2024_12_19_121943_create_p_r_s_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sku` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `application` text DEFAULT NULL,
  `for_clients` text DEFAULT NULL,
  `warnings` varchar(255) DEFAULT NULL,
  `eco_friendly` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product_category`
--

CREATE TABLE `product_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product_specifications`
--

CREATE TABLE `product_specifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `specification_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `p_r_s`
--

CREATE TABLE `p_r_s` (
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `kg_per_unit` decimal(10,2) NOT NULL,
  `liters_per_unit` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `p_r_s`
--

INSERT INTO `p_r_s` (`code`, `name`, `kg_per_unit`, `liters_per_unit`, `created_at`, `updated_at`) VALUES
('CODE', 'PRODUCT NAME', 0.00, 0.00, NULL, NULL),
('118312', 'ARNICA PSX 46  170 KG FS', 170.00, 205.00, NULL, NULL),
('118323', 'ARNICA PSX 46   850 KG CV', 850.00, 1000.00, NULL, NULL),
('119025', 'GREASE LC 1 KG 180   FS', 180.00, 205.00, NULL, NULL),
('119054', 'GREASE LC 1 18 KG    SE', 18.00, 18.00, NULL, NULL),
('119125', 'GREASE LC 2 KG 180   FS', 180.00, 205.00, NULL, NULL),
('119154', 'GREASE LC 2 18 KG    SE', 18.00, 18.00, NULL, NULL),
('119194', 'Eni Grease LC 2    24x380 gr senza pompa', 9.12, 0.38, NULL, NULL),
('119195', 'Eni Grease LC 2    36x380 gr con pompa', 13.68, 0.38, NULL, NULL),
('143911', 'Eni Eco Lube MS  180 KG FS', 180.00, 205.00, NULL, NULL),
('143950', 'Eni Eco Lube MS   20 L', 18.40, 20.00, NULL, NULL),
('144011', 'Olio X Motoseghe180 KG FS', 180.00, 205.00, NULL, NULL),
('144097', 'Eni Chainsaw OilOlio X Motoseghe  4X4 LT', 14.14, 4.00, NULL, NULL),
('172094', 'MP GREASE SENZA POMPA  24X380 GR', 9.12, 0.38, NULL, NULL),
('172194', 'MP GREASE CON POMPA da 36x380 GR', 13.68, 0.38, NULL, NULL),
('212111', 'SIC C 150        180 KG FS', 180.00, 205.00, NULL, NULL),
('212211', 'SIC C 220        180 KG FS', 180.00, 205.00, NULL, NULL),
('213212', 'RADULA 32        170 KG FS', 170.00, 205.00, NULL, NULL),
('213250', 'Eni Radula 32    20 LT      SE', 17.50, 20.00, NULL, NULL),
('213350', 'Eni Radula 46    20 LT      SE', 17.60, 20.00, NULL, NULL),
('213911', 'RADULA 100      180 KG FS', 180.00, 205.00, NULL, NULL),
('214711', 'RADULA 320       180 KG FS', 180.00, 205.00, NULL, NULL),
('215112', 'ACER 15          170 KG FS', 170.00, 205.00, NULL, NULL),
('215150', 'Eni Acer 15            20LT  SE', 17.20, 20.00, NULL, NULL),
('215211', 'ACER 220         180 KG FS', 180.00, 205.00, NULL, NULL),
('215250', 'Eni Acer 220            20LT  SE', 18.00, 20.00, NULL, NULL),
('215311', 'ACER 320         180 KG FS', 180.00, 205.00, NULL, NULL),
('215350', 'Eni Acer 320            20LT  SE', 18.10, 20.00, NULL, NULL),
('215411', 'ACER 460         180 KG FS', 180.00, 205.00, NULL, NULL),
('215450', 'Eni Acer 460            20LT  SE', 18.20, 20.00, NULL, NULL),
('215511', 'ACER 800         180 KG FS', 180.00, 205.00, NULL, NULL),
('215550', 'Eni Acer 800            20LT  SE', 18.50, 20.00, NULL, NULL),
('216012', 'ACER 22          170 KG FS', 170.00, 205.00, NULL, NULL),
('216050', 'Eni Acer 22            20LT  SE', 17.30, 20.00, NULL, NULL),
('216111', 'ACER 32          180 KG FS', 180.00, 205.00, NULL, NULL),
('216150', 'Eni Acer 32            20LT  SE', 17.60, 20.00, NULL, NULL),
('216211', 'ACER 46          180 KG FS', 180.00, 205.00, NULL, NULL),
('216250', 'Eni Acer 46            20LT  SE', 17.70, 20.00, NULL, NULL),
('216311', 'ACER 68          180 KG FS', 180.00, 205.00, NULL, NULL),
('216350', 'Eni Acer 68            20LT  SE', 17.80, 20.00, NULL, NULL),
('216411', 'ACER 100            180 KG FS', 180.00, 205.00, NULL, NULL),
('216450', 'Eni Acer 100            20LT  SE', 18.00, 20.00, NULL, NULL),
('216511', 'ACER 150         180 KG FS', 180.00, 205.00, NULL, NULL),
('216550', 'Eni Acer 150            20LT  SE', 17.90, 20.00, NULL, NULL),
('230112', 'OSO 15           170 KG FS', 170.00, 205.00, NULL, NULL),
('230150', 'Eni OSO 15            20LT  SE', 17.08, 20.00, NULL, NULL),
('230211', 'OSO 32           180 KG FS', 180.00, 205.00, NULL, NULL),
('230230', 'OSO 32            48 KG FS', 48.00, 60.00, NULL, NULL),
('230250', 'Eni OSO 32            20LT  SE', 17.50, 20.00, NULL, NULL),
('230297', 'Eni OSO 32  4X4 LT HDPE', 14.00, 4.00, NULL, NULL),
('230311', 'OSO 46           180 KG FS', 180.00, 205.00, NULL, NULL),
('230330', 'OSO 46            48 KG  FS', 48.00, 60.00, NULL, NULL),
('230350', 'Eni OSO 46            20LT  SE', 17.60, 20.00, NULL, NULL),
('230397', 'Eni OSO 46  4X4 LT HDPE', 14.08, 4.00, NULL, NULL),
('230411', 'OSO 68           180 KG FS', 180.00, 205.00, NULL, NULL),
('230423', 'OSO 68           850 KG CV', 850.00, 1000.00, NULL, NULL),
('230450', 'OSO 68            20 LT  SE', 17.67, 20.00, NULL, NULL),
('230497', 'Eni OSO 68  4X4 LT HDPE', 14.18, 4.00, NULL, NULL),
('230511', 'OSO 100          180 KG FS', 180.00, 205.00, NULL, NULL),
('230523', 'OSO 100          850 KG CV', 850.00, 1000.00, NULL, NULL),
('230550', 'Eni OSO 100            20LT  SE', 17.80, 20.00, NULL, NULL),
('230611', 'OSO 150          180 KG FS', 180.00, 205.00, NULL, NULL),
('230623', 'OSO 150          850 KG CV', 850.00, 1000.00, NULL, NULL),
('230650', 'Eni OSO 150            20LT  SE', 17.90, 20.00, NULL, NULL),
('231611', 'OSO 22           180 KG FS', 180.00, 205.00, NULL, NULL),
('231650', 'Eni OSO 22            20LT  SE', 17.30, 20.00, NULL, NULL),
('253012', 'ARNICA 22        170 KG FS', 170.00, 205.00, NULL, NULL),
('253050', 'Eni Arnica 22            20LT  SE', 17.24, 20.00, NULL, NULL),
('253111', 'ARNICA 32        180 KG FS', 180.00, 205.00, NULL, NULL),
('253150', 'Eni Arnica 32            20LT  SE', 17.38, 20.00, NULL, NULL),
('253211', 'ARNICA 46        180 KG FS', 180.00, 205.00, NULL, NULL),
('253250', 'Eni Arnica 46            20LT  SE', 17.54, 20.00, NULL, NULL),
('253311', 'ARNICA 68        180 KG FS', 180.00, 205.00, NULL, NULL),
('253323', 'ARNICA 68        850 KG CV', 850.00, 1000.00, NULL, NULL),
('253350', 'Eni Arnica 68            20LT  SE', 17.66, 20.00, NULL, NULL),
('253411', 'ARNICA 100       180 KG FS', 180.00, 205.00, NULL, NULL),
('254011', 'Eni Arnica EAL 46     180 KG', 180.00, 205.00, NULL, NULL),
('256011', 'ARNICA S/46      180 KG FS', 180.00, 205.00, NULL, NULL),
('256111', 'ARNICA S/68      180 KG FS', 180.00, 205.00, NULL, NULL),
('258018', 'ARNICA 104/FR 200 KG', 200.00, 205.00, NULL, NULL),
('258050', 'Eni Arnica 104/FR     20L  SE', 21.00, 20.00, NULL, NULL),
('261011', 'OTE 32           180 KG FS', 180.00, 205.00, NULL, NULL),
('261023', 'OTE 32           850 KG FS', 850.00, 1000.00, NULL, NULL),
('261050', 'Eni OTE 32            20LT  SE', 17.20, 20.00, NULL, NULL),
('261111', 'OTE 46           180 KG FS', 180.00, 205.00, NULL, NULL),
('261123', 'OTE 46           850 KG CV', 850.00, 1000.00, NULL, NULL),
('261150', 'Eni OTE 46            20LT  SE', 17.24, 20.00, NULL, NULL),
('261211', 'Eni OTE 68           180 KG FS', 180.00, 205.00, NULL, NULL),
('261223', 'Eni OTE 68           850 KG CV', 850.00, 1000.00, NULL, NULL),
('261250', 'Eni OTE 68            20LT  SE', 17.24, 20.00, NULL, NULL),
('261311', 'Eni OTE 80           180 KG FS', 180.00, 205.00, NULL, NULL),
('261350', 'Eni OTE 80            20LT  SE', 17.32, 20.00, NULL, NULL),
('261411', 'OTE 100          180 KG FS', 180.00, 205.00, NULL, NULL),
('261423', 'OTE 100          850 KG CV', 850.00, 1000.00, NULL, NULL),
('261450', 'Eni OTE 100            20LT  SE', 17.44, 20.00, NULL, NULL),
('261611', 'OTE 46 GT        180 KG FS', 180.00, 205.00, NULL, NULL),
('261623', 'OTE 46 GT        850 KG CV', 850.00, 1000.00, NULL, NULL),
('270011', 'BLASIA 68        180 KG FS', 180.00, 205.00, NULL, NULL),
('270050', 'Eni Blasia 68            20LT  SE', 17.80, 20.00, NULL, NULL),
('270111', 'Eni BLASIA 100       180 KG FS', 180.00, 205.00, NULL, NULL),
('270150', 'Eni Blasia 100          20LT  SE', 17.78, 20.00, NULL, NULL),
('270211', 'Eni BLASIA 150       180 KG FS', 180.00, 205.00, NULL, NULL),
('270250', 'Eni Blasia 150          20LT  SE', 17.88, 20.00, NULL, NULL),
('270311', 'Eni BLASIA 220       180 KG FS', 180.00, 205.00, NULL, NULL),
('270350', 'Eni Blasia 220          20LT  SE', 17.92, 20.00, NULL, NULL),
('270397', 'Eni BLASIA 220  4X4 LT HDPE', 14.34, 4.00, NULL, NULL),
('270411', 'Eni BLASIA 320       180 KG FS', 180.00, 205.00, NULL, NULL),
('270450', 'Eni Blasia 320          20LT  SE', 18.06, 20.00, NULL, NULL),
('270511', 'Eni BLASIA 460       180 KG FS', 180.00, 205.00, NULL, NULL),
('270550', 'Eni Blasia 460          20LT  SE', 18.16, 20.00, NULL, NULL),
('270611', 'Eni BLASIA 680       180 KG FS', 180.00, 205.00, NULL, NULL),
('270650', 'Eni Blasia 680          20LT  SE', 18.44, 20.00, NULL, NULL),
('270711', 'BLASIA FMP 460   KG 180 FS', 180.00, 205.00, NULL, NULL),
('270811', 'BLASIA BM 220    KG 180 FS', 180.00, 205.00, NULL, NULL),
('271011', 'BLASIA FMP 100   180 KG FS', 180.00, 205.00, NULL, NULL),
('271111', 'BLASIA FMP 150   180 KG FS', 180.00, 205.00, NULL, NULL),
('271211', 'BLASIA FMP 220   180 KG FS', 180.00, 205.00, NULL, NULL),
('271311', 'BLASIA FMP 320   180 KG FS', 180.00, 205.00, NULL, NULL),
('271350', 'Eni Blasia FMP 320          20LT  SE', 18.04, 20.00, NULL, NULL),
('277011', 'BLASIA S 150     KG 180 FS', 180.00, 205.00, NULL, NULL),
('277050', 'Eni Blasia S 150          20LT  SE', 20.00, 20.00, NULL, NULL),
('278011', 'Eni Blasia S 220     180 KG FS', 180.00, 205.00, NULL, NULL),
('278050', 'Eni Blasia S 220          20LT  SE', 20.60, 20.00, NULL, NULL),
('279111', 'BETULA 32   KG 180      FS', 180.00, 205.00, NULL, NULL),
('279150', 'Eni Betula 32           20LT  SE', 18.00, 20.00, NULL, NULL),
('279211', 'BETULA 46   KG 180      FS', 180.00, 205.00, NULL, NULL),
('279250', 'Eni Betula 46           20LT  SE', 18.00, 20.00, NULL, NULL),
('279311', 'BETULA 68   KG 180      FS', 180.00, 205.00, NULL, NULL),
('279350', 'Eni Betula 68           20LT  SE', 18.00, 20.00, NULL, NULL),
('279411', 'BETULA ESX 150     KG 180 FS', 180.00, 205.00, NULL, NULL),
('280011', 'DICREA 68        180 KG FS', 180.00, 205.00, NULL, NULL),
('280050', 'Eni Dicrea 68          20LT  SE', 17.80, 20.00, NULL, NULL),
('280111', 'DICREA 100       180 KG FS', 180.00, 205.00, NULL, NULL),
('280150', 'Eni Dicrea 100          20LT  SE', 17.76, 20.00, NULL, NULL),
('280211', 'DICREA 150       180 KG FS', 180.00, 205.00, NULL, NULL),
('280250', 'Eni Dicrea 150          20LT  SE', 17.96, 20.00, NULL, NULL),
('280311', 'DICREA 220       180 KG FS', 180.00, 205.00, NULL, NULL),
('280511', 'DICREA 320       180 KG FS', 180.00, 205.00, NULL, NULL),
('280550', 'Eni Dicrea 320          20LT  SE', 18.10, 20.00, NULL, NULL),
('282011', 'DICREA 32        180 KG FS', 180.00, 205.00, NULL, NULL),
('282050', 'Eni Dicrea 32          20LT  SE', 17.08, 20.00, NULL, NULL),
('282111', 'DICREA 46        180 KG FS', 180.00, 205.00, NULL, NULL),
('282150', 'Eni Dicrea 46          20LT  SE', 17.16, 20.00, NULL, NULL),
('320011', 'ASP C 32         180 KG FS', 180.00, 205.00, NULL, NULL),
('320050', 'ASP C 32           20LT  SE', 17.50, 20.00, NULL, NULL),
('320111', 'ASP C 100        180 KG FS', 180.00, 205.00, NULL, NULL),
('320150', 'ASP C 100           20LT  SE', 17.90, 20.00, NULL, NULL),
('330112', 'ALARIA 2         170 KG FS', 170.00, 205.00, NULL, NULL),
('332011', 'ASP 100          180 KG FS', 180.00, 205.00, NULL, NULL),
('332050', 'ASP 100         20 L', 17.90, 20.00, NULL, NULL),
('332111', 'ASP 150          180 KG FS', 180.00, 205.00, NULL, NULL),
('332130', 'ASP 150          48 KG FS', 48.00, 60.00, NULL, NULL),
('332150', 'ASP 150         20 L', 18.00, 20.00, NULL, NULL),
('332211', 'ASP 220          180 KG FS', 180.00, 205.00, NULL, NULL),
('332250', 'ASP 220         20 L', 18.00, 20.00, NULL, NULL),
('333011', 'ALARIA 3         180 KG FS', 180.00, 205.00, NULL, NULL),
('333111', 'ALARIA 7         180 KG FS', 180.00, 205.00, NULL, NULL),
('340011', 'SIMBLUM 3        180 KG FS', 180.00, 205.00, NULL, NULL),
('340311', 'EXIDIA HG 32     180 KG FS', 180.00, 205.00, NULL, NULL),
('340350', 'Eni Exidia HG 32          20LT  SE', 17.48, 20.00, NULL, NULL),
('340411', 'EXIDIA HG 68     180 KG FS', 180.00, 205.00, NULL, NULL),
('340450', 'Eni Exidia HG 68          20LT SE', 17.72, 20.00, NULL, NULL),
('340497', 'Eni EXIDIA HG 68  4X4 LT HDPE', 14.18, 4.00, NULL, NULL),
('340511', 'EXIDIA HG 220    180 KG FS', 180.00, 205.00, NULL, NULL),
('340550', 'Eni Exidia HG 220          20LT SE', 18.02, 20.00, NULL, NULL),
('340911', 'SIMBLUM 3/A      180 KG FS', 180.00, 205.00, NULL, NULL),
('341211', 'Eni SIMBLUM 2/A      KG 180 FS', 180.00, 205.00, NULL, NULL),
('341311', 'SIMBLUM 26/A     KG 180 FS', 180.00, 205.00, NULL, NULL),
('360011', 'SVE 23/G         180 KG FS', 180.00, 205.00, NULL, NULL),
('417011', 'ALNUS 136        180 KG FS', 180.00, 205.00, NULL, NULL),
('417050', 'Eni Alnus 136           20LT  SE', 23.04, 20.00, NULL, NULL),
('420011', 'RUSTIA 27        180 KG FS', 180.00, 205.00, NULL, NULL),
('420050', 'RUSTIA 27         20 L', 18.20, 20.00, NULL, NULL),
('428011', 'RUSTIA C 10W/20  180 KG FS', 180.00, 205.00, NULL, NULL),
('428111', 'RUSTIA C 30      180 KG FS', 180.00, 205.00, NULL, NULL),
('441612', 'ITE 600          170 KG  FS', 170.00, 205.00, NULL, NULL),
('441650', 'Eni ITE 600   20LT  SE', 18.00, 20.00, NULL, NULL),
('443712', 'ITE 600  X       170 KG  FS', 170.00, 205.00, NULL, NULL),
('450011', 'OBI 10    180 KG CV', 180.00, 205.00, NULL, NULL),
('450050', 'Eni OBI 10   20LT  SE', 18.00, 20.00, NULL, NULL),
('451012', 'OBI 12           170 KG FS', 170.00, 205.00, NULL, NULL),
('451050', 'Eni OBI 12   20LT', 18.00, 20.00, NULL, NULL),
('452012', 'Eni OBI T 13      KG 170FS', 170.00, 205.00, NULL, NULL),
('452050', 'Eni OBI T 13   20LT', 18.00, 20.00, NULL, NULL),
('460325', 'ECO GREASE/0  180 KG    FS', 180.00, 205.00, NULL, NULL),
('460354', 'ECO GREASE/0     18KG       SE', 18.00, 18.00, NULL, NULL),
('460525', 'GREASE CC 2      KG 180 FS', 180.00, 205.00, NULL, NULL),
('460554', 'GREASE CC 2       KG 18 SE', 18.00, 18.00, NULL, NULL),
('460625', 'GREASE CC 3      KG 180 FS', 180.00, 205.00, NULL, NULL),
('460654', 'GREASE CC 3       KG 18 SE', 18.00, 18.00, NULL, NULL),
('460725', 'GREASE CC 4      KG 180 FS', 180.00, 205.00, NULL, NULL),
('460754', 'GREASE CC 4       KG 18 SE', 18.00, 18.00, NULL, NULL),
('461325', 'Eni Eco Grease 2  180 KG    FS', 180.00, 205.00, NULL, NULL),
('461354', 'Eni Eco Grease 2  KG 18    SE', 18.00, 18.00, NULL, NULL),
('461425', 'Eni Eco Grease Plus 2  180 KG    FS', 180.00, 205.00, NULL, NULL),
('461454', 'Eni Eco Grease Plus 2  KG 18    SE', 18.00, 18.00, NULL, NULL),
('461494', 'Eni Eco Grease Plus 2 24x380g senza pomp', 9.12, 0.38, NULL, NULL),
('461495', 'Eni Eco Grease Plus 2 36x380g con pompa', 13.68, 0.38, NULL, NULL),
('462525', 'GREASE MU 2      KG 180 FS', 180.00, 205.00, NULL, NULL),
('462554', 'GREASE MU 2       KG 18 SE', 18.00, 18.00, NULL, NULL),
('462625', 'GREASE MU 3      KG 180 FS', 180.00, 205.00, NULL, NULL),
('462654', 'GREASE MU 3       KG 18 SE', 18.00, 18.00, NULL, NULL),
('463525', 'GREASE MU EP 0 KG 180   FS', 180.00, 205.00, NULL, NULL),
('463554', 'GREASE MU EP 0 18 KG    SE', 18.00, 18.00, NULL, NULL),
('463625', 'GREASE MU EP 1 KG 180   FS', 180.00, 205.00, NULL, NULL),
('463654', 'GREASE MU EP 1 18 KG    SE', 18.00, 18.00, NULL, NULL),
('463725', 'GREASE MU EP 2 KG 180   FS', 180.00, 205.00, NULL, NULL),
('463730', 'GREASE MU EP 2  48 KG   FT', 48.00, 60.00, NULL, NULL),
('463754', 'GREASE MU EP 2 KG 18    SE', 18.00, 18.00, NULL, NULL),
('463776', 'GREASE MU EP 2  3X5 KG  SE', 15.00, 15.00, NULL, NULL),
('463794', 'Eni Grease MU EP 2  24x380gr senza pompa', 9.12, 0.38, NULL, NULL),
('463795', 'Eni Grease MU EP 2  36x380gr con pompa', 13.68, 0.38, NULL, NULL),
('463825', 'GREASE MU EP 3 KG 180   FS', 180.00, 205.00, NULL, NULL),
('463854', 'GREASE MU EP 3 KG 18    SE', 18.00, 18.00, NULL, NULL),
('464025', 'GREASE PV 2    KG 180 FS', 180.00, 205.00, NULL, NULL),
('464054', 'GREASE PV 2      kg 18  SE', 18.00, 18.00, NULL, NULL),
('464125', 'Eni Grease PHT   KG 180   FS', 180.00, 205.00, NULL, NULL),
('464140', 'GREASE PHT    20 KG SE', 20.00, 20.00, NULL, NULL),
('464325', 'GREASE MU EP 00  180 KG FS', 180.00, 205.00, NULL, NULL),
('464354', 'GREASE MU EP 00  18 KG SE', 18.00, 18.00, NULL, NULL),
('466025', 'GREASE NF 2      KG 180 FS', 180.00, 205.00, NULL, NULL),
('466054', 'GREASE NF 2       kg 18 SE', 18.00, 18.00, NULL, NULL),
('467225', 'GREASE SM 2      KG 180 FS', 180.00, 205.00, NULL, NULL),
('467254', 'GREASE SM 2       KG 18 SE', 18.00, 18.00, NULL, NULL),
('467525', 'GREASE SLL/00 KG.180    FS', 180.00, 205.00, NULL, NULL),
('467554', 'GREASE SLL/00 KG.18     SE', 18.00, 18.00, NULL, NULL),
('467654', 'Eni Grease MP BLU 2   KG 18    SE', 18.00, 18.00, NULL, NULL),
('467694', 'Eni Grease MP BLU 2    24x380 gr', 9.12, 0.38, NULL, NULL),
('470225', 'GREASE NG 3      KG 180 FS', 180.00, 205.00, NULL, NULL),
('470254', 'GREASE NG 3       KG 18 SE', 18.00, 18.00, NULL, NULL),
('471025', 'SAGUS 60         180 KG FS', 180.00, 205.00, NULL, NULL),
('471054', 'SAGUS 60          KG 18 SE', 18.00, 18.00, NULL, NULL),
('486311', 'Eni FIN 332/F    180 KG FS', 180.00, 205.00, NULL, NULL),
('486340', 'Eni FIN 332/F         20 L SE', 18.00, 20.00, NULL, NULL),
('486411', 'Eni FIN 360/EP F 180KG FS', 180.00, 205.00, NULL, NULL),
('497054', 'GREASE LP 0  KG 18 SE', 18.00, 18.00, NULL, NULL),
('497125', 'GREASE LP 1 KG 180 FS', 180.00, 205.00, NULL, NULL),
('497154', 'GREASE LP 1  KG 18 SE', 18.00, 18.00, NULL, NULL),
('497225', 'GREASE LP 2      KG 180 FS', 180.00, 205.00, NULL, NULL),
('497254', 'GREASE LP 2  KG 18 SE', 18.00, 18.00, NULL, NULL),
('497530', 'Eni Grease LCX 2/32   48 KG SE', 48.00, 60.00, NULL, NULL),
('497730', 'Eni Grease LCX 2/220  48 KG SE', 48.00, 60.00, NULL, NULL),
('497776', 'Eni Grease LCX 2/220  3X5 KG SE', 15.00, 15.00, NULL, NULL),
('497825', 'Eni Grease LCX 2/100   170 KG', 170.00, 205.00, NULL, NULL),
('497854', 'Eni Grease LCX 2/100  17 KG SE', 17.00, 17.00, NULL, NULL),
('497925', 'Eni Grease LCX 1.5/460  170 KG FS', 170.00, 205.00, NULL, NULL),
('497954', 'Eni Grease LCX 1.5/460  17 KG SE', 17.00, 17.00, NULL, NULL),
('498154', 'Eni Grease Sagus AC 460 18 KG', 18.00, 18.00, NULL, NULL),
('498330', 'Eni Grease MSX 2/460  48 KG SE', 48.00, 60.00, NULL, NULL),
('498354', 'Eni Grease MSX 2/460  17 KG SE', 17.00, 17.00, NULL, NULL),
('498376', 'Eni Grease MSX 2/460  3X5 KG SE', 15.00, 15.00, NULL, NULL),
('498454', 'Eni Grease TBM EP 2  18 KG', 18.00, 18.00, NULL, NULL),
('498494', 'Eni Grease TBM EP 2 24x380gr senza pompa', 9.12, 0.38, NULL, NULL),
('512811', 'FRESIA FP        kg 180 FS', 180.00, 205.00, NULL, NULL),
('517011', 'ASTER S     180 KG      FS', 180.00, 205.00, NULL, NULL),
('517050', 'Eni Aster S           20LT', 17.90, 20.00, NULL, NULL),
('518011', 'ASTER FP         KG 180 FS', 180.00, 205.00, NULL, NULL),
('518050', 'Eni Aster FP           20LT', 17.70, 20.00, NULL, NULL),
('519011', 'ASTER MP   180 KG  FS', 180.00, 205.00, NULL, NULL),
('519050', 'Eni Aster MP           20LT', 17.56, 20.00, NULL, NULL),
('520011', 'ASTER L         180 KG  FS', 180.00, 205.00, NULL, NULL),
('520511', 'FRESIA ESB 10    180 KG FS', 180.00, 205.00, NULL, NULL),
('520911', 'Eni FRESIA ESB 35    180 KG FS', 180.00, 205.00, NULL, NULL),
('521011', 'ASTER TG      180 KG     FS', 180.00, 205.00, NULL, NULL),
('521050', 'Eni Aster TG           20LT', 17.80, 20.00, NULL, NULL),
('521311', 'FRESIA ESB 25    180 KG FS', 180.00, 205.00, NULL, NULL),
('522911', 'CODIUM L 46         175 KG FS', 180.00, 205.00, NULL, NULL),
('522950', 'CODIUM L 46            20LT', 18.00, 20.00, NULL, NULL),
('523111', 'CODIUM LS 32    KG 180 FS', 180.00, 205.00, NULL, NULL),
('523150', 'CODIUM LS 32            20LT', 18.00, 20.00, NULL, NULL),
('523411', 'ALNUS PF 610   KG 180 FS', 180.00, 205.00, NULL, NULL),
('523511', 'ALNUS PF 612   180 KG  FS', 180.00, 205.00, NULL, NULL),
('523811', 'HYDROIL GF 32    180 KG FS', 180.00, 205.00, NULL, NULL),
('523850', 'HYDROIL GF 32           20LT', 17.60, 20.00, NULL, NULL),
('523911', 'HYDROIL GF 46    180 KG FS', 180.00, 205.00, NULL, NULL),
('523950', 'HYDROIL GF 46           20LT', 17.70, 20.00, NULL, NULL),
('524011', 'HYDROIL GF 68    180 KG FS', 180.00, 205.00, NULL, NULL),
('524050', 'HYDROIL GF 68           20LT', 17.80, 20.00, NULL, NULL),
('524311', 'Eni TRAFILA 605      FS', 180.00, 205.00, NULL, NULL),
('524611', 'TELIUM VSF 320     FS', 180.00, 205.00, NULL, NULL),
('524650', 'Eni Telium VSF 320          20LT', 21.20, 20.00, NULL, NULL),
('524712', 'CALIBRATION FLUID    KG.170 FS', 170.00, 205.00, NULL, NULL),
('524712', 'CALIBRATION FLUID    KG.170 FS', 170.00, 205.00, NULL, NULL),
('524750', 'Eni Calibration Fluid   20 L', 16.50, 20.00, NULL, NULL),
('524925', 'SILIS GREASE HTL 1 KG.180', 180.00, 205.00, NULL, NULL),
('524954', 'SILIS GREASE HTL 1 KG.18', 18.00, 18.00, NULL, NULL),
('525025', 'LITIO GREASE 475  KG.180', 180.00, 205.00, NULL, NULL),
('525054', 'LITIO GREASE 475  SE', 18.00, 18.00, NULL, NULL),
('526511', 'ACER 680         180 KG FS', 180.00, 205.00, NULL, NULL),
('527011', 'ALNUS SSC 608   180 KG FS', 180.00, 205.00, NULL, NULL),
('527050', 'Eni Alnus SSC 608           20LT', 18.00, 20.00, NULL, NULL),
('529011', 'BLASIA FSX 320  180KG FS', 180.00, 205.00, NULL, NULL),
('529050', 'Eni Blasia FSX  320          20LT', 17.10, 20.00, NULL, NULL),
('529111', 'BLASIA FSX 460  180KG FS', 180.00, 205.00, NULL, NULL),
('529150', 'Eni Blasia FSX  460          20LT', 17.24, 20.00, NULL, NULL),
('529311', 'ARNICA S  FR  46     180KG FS', 180.00, 205.00, NULL, NULL),
('529411', 'ARNICA S  FR  68     180KG FS', 180.00, 205.00, NULL, NULL),
('529911', 'Eni BLASIA FSX 220  180KG FS', 180.00, 205.00, NULL, NULL),
('529950', 'Eni Blasia FSX 220          20LT', 17.10, 20.00, NULL, NULL),
('600354', 'Eni TOP 2000 2   18KG    SE', 18.00, 18.00, NULL, NULL),
('600371', 'Eni TOP 2000 2  24x380 gr', 10.42, 0.38, NULL, NULL),
('670049', 'Eni Tilia 15   LT 20', 17.00, 20.00, NULL, NULL),
('670062', 'Eni Tilia 15   5 LT TA', 4.25, 5.00, NULL, NULL),
('670149', 'Eni Tilia 22   LT 20', 17.00, 20.00, NULL, NULL),
('670162', 'Eni Tilia 22   5 LT TA', 4.25, 5.00, NULL, NULL),
('670218', 'Eni Tilia 32   LT 215', 182.75, 215.00, NULL, NULL),
('670249', 'Eni Tilia 32   LT 20', 17.00, 20.00, NULL, NULL),
('670262', 'Eni Tilia 32   5 LT TA', 4.25, 5.00, NULL, NULL),
('670318', 'Eni Tilia 46   LT 215', 182.75, 215.00, NULL, NULL),
('670349', 'Eni Tilia 46   LT 20', 17.00, 20.00, NULL, NULL),
('670418', 'Eni Tilia 68   LT 215', 184.90, 215.00, NULL, NULL),
('670449', 'Eni Tilia 68   LT 20', 17.20, 20.00, NULL, NULL),
('670549', 'Eni Tilia 100   LT 20', 17.20, 20.00, NULL, NULL),
('670562', 'Eni Tilia 100   5 LT TA', 4.30, 5.00, NULL, NULL),
('670618', 'Eni Tilia SX 32   LT 215', 176.30, 215.00, NULL, NULL),
('670649', 'Eni Tilia SX 32   LT 20', 16.40, 20.00, NULL, NULL),
('670718', 'Eni Tilia SX 46   LT 215', 178.45, 215.00, NULL, NULL),
('670749', 'Eni Tilia SX 46   LT 20', 16.60, 20.00, NULL, NULL),
('670818', 'Eni Tilia SX 68   LT 215', 178.45, 215.00, NULL, NULL),
('670849', 'Eni Tilia SX 68   LT 20', 16.60, 20.00, NULL, NULL),
('670918', 'Eni Tilia SX 100   LT 215', 178.45, 215.00, NULL, NULL),
('670949', 'Eni Tilia SX 100   LT 20', 16.60, 20.00, NULL, NULL),
('671118', 'Eni Tilia C 46   LT 215', 178.45, 215.00, NULL, NULL),
('671149', 'Eni Tilia C 46   LT 20', 16.60, 20.00, NULL, NULL),
('671249', 'Eni Tilia C 68   LT 20', 16.60, 20.00, NULL, NULL),
('671318', 'Eni Tilia C 100   LT 215', 178.45, 215.00, NULL, NULL),
('671349', 'Eni Tilia C 100   LT 20', 16.60, 20.00, NULL, NULL),
('671462', 'Eni Myrtus HT 150   5 LT TA', 4.30, 5.00, NULL, NULL),
('671549', 'Eni Myrtus HT 220   LT 20', 17.20, 20.00, NULL, NULL),
('671562', 'Eni Myrtus HT 220   5 LT TA', 4.30, 5.00, NULL, NULL),
('671618', 'Eni Myrtus HT 320     LT 215', 187.05, 215.00, NULL, NULL),
('671649', 'Eni Myrtus HT 320   LT 20', 17.40, 20.00, NULL, NULL),
('671662', 'Eni Myrtus HT 320   5 LT TA', 4.35, 5.00, NULL, NULL),
('671749', 'Eni Myrtus TSX 320   LT 20', 17.60, 20.00, NULL, NULL),
('671762', 'Eni Myrtus TSX 320   5 LT TA', 4.40, 5.00, NULL, NULL),
('672049', 'Eni Ribes 150   LT 20', 17.40, 20.00, NULL, NULL),
('672062', 'Eni Ribes 150   5 LT TA', 4.35, 5.00, NULL, NULL),
('672118', 'Eni Ribes 220   LT 215', 187.05, 215.00, NULL, NULL),
('672149', 'Eni Ribes 220   LT 20', 17.40, 20.00, NULL, NULL),
('672162', 'Eni Ribes 220   5 LT TA', 4.35, 5.00, NULL, NULL),
('672218', 'Eni Ribes 320   LT 215', 187.05, 215.00, NULL, NULL),
('672249', 'Eni Ribes 320   LT 20', 17.40, 20.00, NULL, NULL),
('672262', 'Eni Ribes 320   5 LT TA', 4.35, 5.00, NULL, NULL),
('672349', 'Eni Ribes 460   LT 20', 17.20, 20.00, NULL, NULL),
('672362', 'Eni Ribes 460   5 LT TA', 4.30, 5.00, NULL, NULL),
('672649', 'Eni Ribes SX 150   LT 20', 16.80, 20.00, NULL, NULL),
('672662', 'Eni Ribes SX 150   5 LT TA', 4.20, 5.00, NULL, NULL),
('672718', 'Eni Ribes SX 220   LT 215', 180.60, 215.00, NULL, NULL),
('672749', 'Eni Ribes SX 220   LT 20', 16.80, 20.00, NULL, NULL),
('672849', 'Eni Ribes SX 320   LT 20', 16.80, 20.00, NULL, NULL),
('672862', 'Eni Ribes SX 320   5 LT TA', 4.20, 5.00, NULL, NULL),
('672949', 'Eni Ribes SX 460   LT 20', 16.80, 20.00, NULL, NULL),
('674018', 'Eni Ribes White oil 22   215 L', 174.00, 215.00, NULL, NULL),
('674049', 'Eni Ribes White oil 22   LT 20', 16.20, 20.00, NULL, NULL),
('674118', 'Eni Ribes White oil 70 215 L', 177.50, 215.00, NULL, NULL),
('674149', 'Eni Ribes White oil 70   LT 20', 16.50, 20.00, NULL, NULL),
('678154', 'Eni Rubus TF 00 18KG SE', 18.00, 18.00, NULL, NULL),
('678160', 'Eni Rubus TF 00     5 KG SE', 5.00, 5.00, NULL, NULL),
('678254', 'Eni Rubus TF 0 18KG SE', 18.00, 18.00, NULL, NULL),
('678354', 'Eni Rubus TF 1 18KG SE', 18.00, 18.00, NULL, NULL),
('678360', 'Eni Rubus TF 1     5 KG SE', 5.00, 5.00, NULL, NULL),
('678454', 'Eni Rubus TF 2 18KG SE', 18.00, 18.00, NULL, NULL),
('678460', 'Eni Rubus TF 2     5 KG SE', 5.00, 5.00, NULL, NULL),
('678478', 'Eni Rubus TF 2  12X400gr', 4.80, 0.40, NULL, NULL),
('678554', 'Eni Rubus Universal 000 18KG SE', 18.00, 18.00, NULL, NULL),
('678660', 'Eni Rubus Universal 00     5 KG SE', 5.00, 5.00, NULL, NULL),
('678754', 'Eni Rubus Universal 0 18KG SE', 18.00, 18.00, NULL, NULL),
('678854', 'Eni Rubus Universal 1 18KG SE', 18.00, 18.00, NULL, NULL),
('678860', 'Eni Rubus Universal 1     5 KG SE', 5.00, 5.00, NULL, NULL),
('678954', 'Eni Rubus Universal 2 18KG SE', 18.00, 18.00, NULL, NULL),
('678978', 'Eni Rubus Universal 2  12X400gr', 4.80, 0.40, NULL, NULL),
('679454', 'Eni Rubus SIL 3 18KG SE', 18.00, 18.00, NULL, NULL),
('679460', 'Eni Rubus SIL 3     5 KG SE', 5.00, 5.00, NULL, NULL),
('679625', 'Eni Rubus CSX  2     KG 180', 180.00, 205.00, NULL, NULL),
('679654', 'Eni Rubus CSX 2 18KG SE', 18.00, 18.00, NULL, NULL),
('679678', 'Eni Rubus CSX 2  12X400gr', 4.80, 0.40, NULL, NULL),
('679754', 'Eni Rubus CX 1,5 18KG SE', 18.00, 18.00, NULL, NULL),
('679960', 'Eni Rubus PFPE 2    5 KG SE', 5.00, 5.00, NULL, NULL),
('680054', 'Eni Rubus Contact 2 18KG SE', 18.00, 18.00, NULL, NULL),
('680060', 'Eni Rubus Contact 2    5 KG SE', 5.00, 5.00, NULL, NULL),
('680154', 'Eni Rubus MP 2 18KG SE', 18.00, 18.00, NULL, NULL),
('680160', 'Eni Rubus MP 2    5 KG SE', 5.00, 5.00, NULL, NULL),
('700712', 'ACER MV 10  KG 170      FS', 170.00, 205.00, NULL, NULL),
('700750', 'Eni Acer MV 10           20LT', 17.02, 20.00, NULL, NULL),
('701611', 'BETULA ESX 32     KG 180 FS', 180.00, 205.00, NULL, NULL),
('701650', 'Eni Betula ESX 32           20LT', 18.80, 20.00, NULL, NULL),
('703211', 'Eni ACORUS 7032   KG.180', 180.00, 205.00, NULL, NULL),
('704811', 'AQUAMET 205       190 KG FS', 190.00, 205.00, NULL, NULL),
('704823', 'AQUAMET 205       900 KG cv', 900.00, 1000.00, NULL, NULL),
('704840', 'AQUAMET 205   20L     SE', 20.00, 20.00, NULL, NULL),
('705450', 'Eni Betula S 32          20LT', 17.00, 20.00, NULL, NULL),
('705514', 'Eni BETULA S 46      KG 170 FS', 170.00, 205.00, NULL, NULL),
('705614', 'BETULA S 68      KG 170 FS', 170.00, 205.00, NULL, NULL),
('705650', 'Eni Betula S 68          20LT', 17.00, 20.00, NULL, NULL),
('708311', 'BLASIA ESB  220  180KG FS', 180.00, 205.00, NULL, NULL),
('708611', 'Eni Aquamet 500 FG ECO     200 KG FS', 200.00, 205.00, NULL, NULL),
('708650', 'Eni Aquamet 500 FG ECO   20 KG', 20.00, 20.00, NULL, NULL),
('709119', 'DICREA S 150     KG 210 FS', 210.00, 205.00, NULL, NULL),
('709150', 'Eni Dicrea S 150          20LT', 21.08, 20.00, NULL, NULL),
('709811', 'Eni Aquamet 700 HP ECO     190 KG FS', 190.00, 205.00, NULL, NULL),
('709851', 'Eni Aquamet 700 HP ECO     20 KG', 20.00, 20.00, NULL, NULL),
('711054', '1718         LT 20 SE', 18.00, 20.00, NULL, NULL),
('711711', 'AQUAMET 700 EP     190 KG FS', 190.00, 205.00, NULL, NULL),
('711751', 'Eni Aquamet 700 EP     20 KG', 20.00, 20.00, NULL, NULL),
('711850', 'Eni Betula ESX 46           20LT', 18.80, 20.00, NULL, NULL),
('713211', 'ALNUS SSC 616 L  180 KG FS', 180.00, 205.00, NULL, NULL),
('713250', 'Eni Alnus SSC 616/L           20LT', 18.20, 20.00, NULL, NULL),
('713911', 'BETULA ESX 68    180 KG FS', 180.00, 205.00, NULL, NULL),
('713950', 'Eni Betula ESX 68           20LT', 19.50, 20.00, NULL, NULL),
('714211', 'BETULA ESX 100   180 KG FS', 180.00, 205.00, NULL, NULL),
('714250', 'Eni Betula ESX 100           20LT', 19.20, 20.00, NULL, NULL),
('717225', 'GREASE NS 4    KG 180 FS', 180.00, 205.00, NULL, NULL),
('717254', 'GREASE NS 4 KG.18 SE', 18.00, 18.00, NULL, NULL),
('717455', 'GR VN           KG 15   SC', 15.00, 15.00, NULL, NULL),
('717525', 'GREASE AC 2      KG 180 FS', 180.00, 205.00, NULL, NULL),
('717554', 'GREASE AC 2 KG.18 SE', 18.00, 18.00, NULL, NULL),
('717654', 'GREASE AC 1 KG.18 SE', 18.00, 18.00, NULL, NULL),
('718111', 'OTE 80  EP       180 KG FS', 180.00, 205.00, NULL, NULL),
('718411', 'OTE TC 46     180 KG FS', 180.00, 205.00, NULL, NULL),
('720223', 'BLASIA ESB 460    850 KG  CV', 850.00, 1000.00, NULL, NULL),
('727011', 'GEUM C SAE 40    180 KG FS', 180.00, 205.00, NULL, NULL),
('727023', 'GEUM C SAE 40    850 KG  CV', 850.00, 1000.00, NULL, NULL),
('727411', 'GEUM 40     180 KG FS', 180.00, 205.00, NULL, NULL),
('727511', 'Eni GEUM NG    180 KG FS', 180.00, 205.00, NULL, NULL),
('727611', 'Eni GEUM LFG   180 KG FS', 180.00, 205.00, NULL, NULL),
('727650', 'Eni GEUM LFG  20 LT SE', 17.46, 20.00, NULL, NULL),
('727711', 'GEUM E           180 KG FS', 180.00, 205.00, NULL, NULL),
('727811', 'GEUM SX 40     180 KG FS', 180.00, 205.00, NULL, NULL),
('728212', 'DICREA SX 46     170 KG FS', 170.00, 205.00, NULL, NULL),
('728250', 'Eni Dicrea SX 46           20LT', 16.66, 20.00, NULL, NULL),
('728312', 'DICREA SX 32   KG 170   FS', 170.00, 205.00, NULL, NULL),
('728350', 'Eni Dicrea SX 32           20LT', 16.70, 20.00, NULL, NULL),
('728412', 'DICREA SX 68  KG 170 FS', 170.00, 205.00, NULL, NULL),
('728450', 'Eni Dicrea SX 68           20LT', 16.80, 20.00, NULL, NULL),
('728811', 'DICREA ESX 100  KG 180  FS', 180.00, 205.00, NULL, NULL),
('728850', 'Eni Dicrea ESX 100           20LT', 19.80, 20.00, NULL, NULL),
('729311', 'ARNICA A 15   KG 180 FS', 180.00, 205.00, NULL, NULL),
('729411', 'OSO D 32   180 KG', 180.00, 205.00, NULL, NULL),
('729711', 'Eni OSO D 46    180 KG', 180.00, 205.00, NULL, NULL),
('730611', 'ARNICA DV 46     180 KG FS', 180.00, 205.00, NULL, NULL),
('731111', 'ALARIA 3 HT      180 KG FS', 180.00, 205.00, NULL, NULL),
('734511', 'ARUM HT 220      KG 180 FS', 180.00, 205.00, NULL, NULL),
('734550', 'Eni Arum HT 220           20LT', 19.50, 20.00, NULL, NULL),
('734611', 'ARUM ESX      KG 180 FS', 180.00, 205.00, NULL, NULL),
('734650', 'Eni Arum ESX           20LT', 18.34, 20.00, NULL, NULL),
('735311', 'ASTER TA/S   180 KG     FS', 180.00, 205.00, NULL, NULL),
('735411', 'ASTER DE    180 KG     FS', 180.00, 205.00, NULL, NULL),
('735450', 'Eni Aster DE           20LT', 17.20, 20.00, NULL, NULL),
('735611', 'ASTER MM/E      180KG        FS', 180.00, 205.00, NULL, NULL),
('735811', 'ASTER TA/E     180 KG         FS', 180.00, 205.00, NULL, NULL),
('737911', 'ASTER L/S   KG 180      FS', 180.00, 205.00, NULL, NULL),
('742411', 'OSO S 46           180 KG FS', 180.00, 205.00, NULL, NULL),
('742511', 'OSO S 68           180 KG FS', 180.00, 205.00, NULL, NULL),
('748211', 'ACER MP 100      180 KG FS', 180.00, 205.00, NULL, NULL),
('748411', 'ACER MP 220      180 KG FS', 180.00, 205.00, NULL, NULL),
('748511', 'ACER MP 320      KG 180 FS', 180.00, 205.00, NULL, NULL),
('748611', 'ACER MP 460      180 KG FS', 180.00, 205.00, NULL, NULL),
('748711', 'ACER MPK 220     180 KG FS', 180.00, 205.00, NULL, NULL),
('748811', 'ACER MP 150      180 KG FS', 180.00, 205.00, NULL, NULL),
('751011', 'ALISMA 32 PV     180 KG FS', 180.00, 205.00, NULL, NULL),
('752011', 'Eni Aquamet 85 Plus        200 KG', 200.00, 205.00, NULL, NULL),
('752023', 'Eni Aquamet 85 Plus        1000 KG', 1000.00, 1000.00, NULL, NULL),
('752111', 'Eni Aquamet 86      KG 200', 200.00, 205.00, NULL, NULL),
('752151', 'Eni Aquamet 86      25 KG', 25.00, 25.00, NULL, NULL),
('752211', 'Eni Aquamet 104 Plus        190 KG', 190.00, 205.00, NULL, NULL),
('752251', 'Eni Aquamet 104 Plus     20 KG', 20.00, 20.00, NULL, NULL),
('752311', 'Eni Aquamet 105      200 KG', 200.00, 205.00, NULL, NULL),
('752350', 'Eni Aquamet 105   20 KG', 20.00, 20.00, NULL, NULL),
('752411', 'Eni Aquamet 500 FG Plus        200 KG', 200.00, 205.00, NULL, NULL),
('752511', 'Eni Aquamet 700 HP Plus        190 KG', 190.00, 205.00, NULL, NULL),
('752551', 'Eni Aquamet 700 HP Plus     20 KG', 20.00, 20.00, NULL, NULL),
('752651', 'Eni Aquamet Extra      20 L', 18.00, 25.00, NULL, NULL),
('754111', 'AQUAMET 700 EXTREME  190 KG FS', 190.00, 205.00, NULL, NULL),
('754151', 'Eni Aquamet 700 EXTREME     20 KG', 20.00, 20.00, NULL, NULL),
('754411', 'AQUAMET 700 MB     200 KG FS', 200.00, 205.00, NULL, NULL),
('754511', 'AQUAMET S 700 BS     200 KG FS', 200.00, 205.00, NULL, NULL),
('755111', 'ARNICA P 46   KG 180    FS', 180.00, 205.00, NULL, NULL),
('755150', 'Eni ARNICA P 46           20LT', 18.00, 20.00, NULL, NULL),
('755511', 'ARNICA SA 19   KG 180   FS', 180.00, 205.00, NULL, NULL),
('763011', 'BLASIA 32   KG 180      FS', 180.00, 205.00, NULL, NULL),
('763050', 'Eni Blasia 32         20 L', 17.48, 20.00, NULL, NULL),
('764811', 'AQUAMET 260/EP      KG 180 FS', 180.00, 205.00, NULL, NULL),
('764851', 'Eni Aquamet 260 EP   20L', 20.50, 20.00, NULL, NULL),
('768025', 'SP GR MU 00      KG 180 FS', 180.00, 205.00, NULL, NULL),
('768054', 'SP GR MU 00     KG 18   SE', 18.00, 18.00, NULL, NULL),
('770611', 'BLASIA SX 320 KG 180', 180.00, 205.00, NULL, NULL),
('770650', 'Eni Blasia SX 320           20LT', 16.96, 20.00, NULL, NULL),
('771011', 'BLASIA P 1000    180 KG FS', 180.00, 205.00, NULL, NULL),
('771050', 'Eni Blasia P 1000           20LT', 18.34, 20.00, NULL, NULL),
('771211', 'BLASIA S 460    KG 180 FS', 180.00, 205.00, NULL, NULL),
('771250', 'Eni Blasia S 460           20LT', 20.20, 20.00, NULL, NULL),
('771311', 'BLASIA P 2200    KG 180 FS', 180.00, 205.00, NULL, NULL),
('771411', 'BLASIA S 320     KG 180 FS', 180.00, 205.00, NULL, NULL),
('771450', 'Eni Blasia S 320           20LT', 20.60, 20.00, NULL, NULL),
('772011', 'TURBO 23699      180 KG FS', 206.54, 205.00, NULL, NULL),
('772311', 'H LIFT 46        180 KG FS', 180.00, 205.00, NULL, NULL),
('772350', 'Eni H Lift 46         20 L', 17.26, 20.00, NULL, NULL),
('773364', 'Eni Aquamet CL 33  TAN 10 KG', 10.00, 10.00, NULL, NULL),
('773511', 'ARNICA V 46    180 KG FS', 180.00, 205.00, NULL, NULL),
('773611', 'ARNICA V 68   180 KG    FS', 180.00, 205.00, NULL, NULL),
('773712', 'BLASIA SX 220    170 KG FS', 170.00, 205.00, NULL, NULL),
('773750', 'Eni Blasia SX 220           20LT', 16.90, 20.00, NULL, NULL),
('773912', 'BLASIA SX 100    170 KG FS', 170.00, 205.00, NULL, NULL),
('773950', 'Eni Blasia SX 100           20LT', 16.80, 20.00, NULL, NULL),
('774012', 'BLASIA SX 150    170 KG FS', 170.00, 205.00, NULL, NULL),
('774050', 'Eni  Blasia SX 150,   20L', 16.90, 20.00, NULL, NULL),
('774911', 'ARNICA ABX 15    170KG FS', 170.00, 205.00, NULL, NULL),
('775512', 'OTE 32  GT       170 KG FS', 170.00, 205.00, NULL, NULL),
('775523', 'OTE 32 GT       850 KG FS', 850.00, 1000.00, NULL, NULL),
('785750', 'Eni Rustia 68 F/N   20L', 15.72, 20.00, NULL, NULL),
('786011', 'RUSTIA NT    180 KG  FS', 180.00, 205.00, NULL, NULL),
('792112', 'Eni Rustia 250 F/N      KG 170', 170.00, 205.00, NULL, NULL),
('792150', 'Eni Rustia 250 F/N   18KG', 18.00, 20.00, NULL, NULL),
('798312', 'ARNICA 15    170 KG     FS', 170.00, 205.00, NULL, NULL),
('6803692', 'Eni Ribes Multipurpose  12x400 ml   SP', 3.89, 0.40, NULL, NULL),
('6804692', 'Eni Ribes Silicone Fluid  12x500 ml   SP', 3.58, 0.50, NULL, NULL),
('6805692', 'Eni Rubus High Performance Grease 12x400ml', 2.93, 0.40, NULL, NULL),
('6806692', 'Eni Ribes Rust Remover  12x400 ml   SP', 3.89, 0.40, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `specifications`
--

CREATE TABLE `specifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `specifications`
--

INSERT INTO `specifications` (`id`, `name`, `code`, `value`, `created_at`, `updated_at`) VALUES
(1, 'AMG', '23443', NULL, '2024-12-11 07:21:47', '2024-12-11 07:21:47');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_product_id_foreign` (`product_id`),
  ADD KEY `product_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Индексы таблицы `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_category_id_foreign` (`category_id`),
  ADD KEY `product_category_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_specifications_product_id_foreign` (`product_id`),
  ADD KEY `product_specifications_specification_id_foreign` (`specification_id`);

--
-- Индексы таблицы `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seos_slug_unique` (`slug`),
  ADD KEY `seos_type_type_id_index` (`type`,`type_id`);

--
-- Индексы таблицы `specifications`
--
ALTER TABLE `specifications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `specifications`
--
ALTER TABLE `specifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_category_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD CONSTRAINT `product_specifications_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_specifications_specification_id_foreign` FOREIGN KEY (`specification_id`) REFERENCES `specifications` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
