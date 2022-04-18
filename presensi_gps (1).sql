-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2022 at 10:01 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensi_gps`
--

-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

CREATE TABLE `offices` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `radius` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offices`
--

INSERT INTO `offices` (`id`, `name`, `latitude`, `longitude`, `radius`, `created_at`, `updated_at`) VALUES
(1, 'PT Lapi Laboratories Cabang Makassar', -5.098277736237209, 119.53411476643562, 50, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `presences`
--

CREATE TABLE `presences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `office_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `off` tinyint(1) NOT NULL DEFAULT 0,
  `back_at` int(11) DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presences`
--

INSERT INTO `presences` (`id`, `office_id`, `user_id`, `image`, `off`, `back_at`, `status`, `created_at`, `updated_at`) VALUES
(41, 1, 18, '1639132544.IMG_20211210_183552095.png', 0, 11, 1, '2021-12-10 02:35:45', '2021-12-10 02:35:51'),
(45, 1, 20, '1639196315.IMG_20211211_121844958.png', 0, 18, 1, '2021-12-11 04:18:35', '2021-12-11 04:34:19'),
(46, 1, 20, '1639376952.IMG_20211213_142919528.jpg', 0, 20, 1, '2021-12-14 06:29:12', '2021-12-13 06:29:12'),
(50, 1, 20, '1639388732.IMG_20211213_174540141.jpg', 0, 24, 1, '2021-12-13 09:45:32', '2021-12-13 09:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `user_id`, `name`, `latitude`, `longitude`, `note`, `image`, `status`, `created_at`, `updated_at`) VALUES
(6, 20, 'apotek farma', -45745.679769, 6786.678689, 'disini bagus, kasur bagus emput, tidak mabut', '1638987188.boruto.png', 1, '2021-12-08 09:49:51', '2021-12-09 23:30:46'),
(8, 20, 'apotek farma', -45745.679769, 6786.67868, 'disini bagus, kasur bagus emput, tidak mabut', '1638987188.boruto.png', 1, '2021-12-08 10:13:08', '2021-12-13 08:22:25'),
(9, 20, 'goa ria', -5.0981881, 119.5342122, 'apotek terbagus di dunia', '1639203510.IMG_20211211_141839206.png', 1, '2021-12-11 06:18:30', '2021-12-13 08:22:20'),
(10, 20, 'rumahku', -5.0981953, 119.5342105, 'catatan', '1639383009.IMG_20211213_161016218.jpg', 1, '2021-12-13 08:10:09', '2021-12-13 09:36:59'),
(11, 20, 'jff', -5.0981817, 119.5342152, 'jfjf', '1639386267.IMG_20211213_170436595.png', 1, '2021-12-13 09:04:27', '2021-12-13 09:09:56'),
(12, 20, 'laproan', -5.0981933, 119.5342134, 'hdjfjf', '1639388614.IMG_20211213_174342968.jpg', 0, '2021-12-13 09:43:34', '2021-12-13 09:43:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` enum('admin','manager','sales','') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `position`, `email`, `password`, `image`, `api_token`, `created_at`, `updated_at`) VALUES
(18, 'admin lapi ini', 'admin', 'admin@admin.com', 'admin123', '1639388430.IMG_20211213_174037468.jpg', NULL, NULL, '2021-12-13 09:42:47'),
(20, 'nama anda ini', 'sales', 'sales@gmail.com', 'password', '1639119029.IMG_20211210_145032692.jpg', NULL, '2021-12-06 20:07:04', '2021-12-13 09:46:30'),
(21, 'dg Mudo', 'manager', 'manager@manager.com', 'manager123', '1639078480.IMG_20211210_033444879.jpg', '14be51e1d5821ab41671bc5b25ffe7d7.dfd6b10215e2e61b5b56789294d068f5', '2021-12-09 11:34:41', '2021-12-13 09:46:40'),
(24, 'test', 'sales', 'mail@ndjd.fom', 'hdjfjfjfjf', '1639388398.IMG_20211213_174006237.png', NULL, '2021-12-13 09:12:46', '2021-12-13 09:39:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presences`
--
ALTER TABLE `presences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `office_id` (`office_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`),
  ADD UNIQUE KEY `user_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `offices`
--
ALTER TABLE `offices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `presences`
--
ALTER TABLE `presences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `presences`
--
ALTER TABLE `presences`
  ADD CONSTRAINT `presences_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `presences_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
