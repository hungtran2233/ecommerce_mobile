-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 12, 2021 lúc 09:16 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mobile`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_09_18_000000_create_users_table', 1),
(2, '2020_09_18_100000_create_password_resets_table', 1),
(8, '2020_09_18_160420_create_categories_table', 1),
(9, '2020_09_22_160520_create_product_types_table', 1),
(10, '2020_09_22_160609_create_products_table', 1),
(11, '2020_09_22_160836_create_orders_table', 1),
(12, '2020_09_22_160905_create_order_details_table', 1),
(13, '2020_09_22_160940_create_contacts_table', 1),
(14, '2020_09_26_161113_create_customers_table', 1),
(15, '2020_09_26_083107_create_table_banner_table', 1),
(16, '2020_09_26_122007_create_table_image_product_table', 1),
(17, '2020_09_26_152001_create_specifications_table', 1),
(18, '2020_10_04_164939_create_comments_table', 1),
(19, '2020_10_04_165744_create_table_admin_comment_table', 1),
(20, '2020_10_04_164820_add_attribute_code_and_time_code_into_posts_table', 1),
(21, '2020_10_04_124421_create_roles_table', 1),
(22, '2020_10_04_124651_create_permissions_table', 1),
(23, '2020_10_04_162414_create_blogs_table', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
