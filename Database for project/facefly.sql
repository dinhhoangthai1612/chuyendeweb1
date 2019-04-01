-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 01, 2019 at 02:22 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facefly`
--

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
CREATE TABLE IF NOT EXISTS `airports` (
  `airport_id` int(11) NOT NULL AUTO_INCREMENT,
  `airport_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `airport_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `airport_city_id` tinyint(4) NOT NULL,
  `airport_province_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`airport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`airport_id`, `airport_name`, `airport_code`, `airport_city_id`, `airport_province_id`) VALUES
(1, 'Sân Bay Nội Bài', 'VVNB/HAN', 2, 1),
(2, 'Sân Bay Tân Sơn Nhất', 'VVTS/SGN', 1, 2),
(3, 'Sân Bay Liên Khương', 'VVDL/DLI', 6, 4),
(4, 'Sân Bay Quốc Tế Đà Năng', 'VVDN/DAD', 5, 3),
(5, 'Sân bay Phù Cát – Bình Định', 'VVPC/UIH', 0, 6),
(6, 'Sân bay Tuy Hòa – Phú Yên', 'VVTH/TBB', 0, 5),
(7, 'Sân bay Quốc tế Cần Thơ', 'VVCT/VCA', 0, 7),
(9, 'Sân Bay Changi', 'IATA', 3, 0),
(10, 'Sân bay Hartsfield Jackson Atlanta', 'ATL', 8, 0),
(11, 'sân bay John F. Kennedy', 'JFK', 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `airways`
--

DROP TABLE IF EXISTS `airways`;
CREATE TABLE IF NOT EXISTS `airways` (
  `airways_id` int(11) NOT NULL AUTO_INCREMENT,
  `airways_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `airway_country_id` tinyint(4) NOT NULL,
  `airways_total_revanue` int(11) DEFAULT '0',
  PRIMARY KEY (`airways_id`),
  UNIQUE KEY `airways_id` (`airways_id`),
  KEY `airways_id_2` (`airways_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `airways`
--

INSERT INTO `airways` (`airways_id`, `airways_name`, `airway_country_id`, `airways_total_revanue`) VALUES
(1, 'Vietjet air', 1, 3150000),
(2, 'Vietnam Airlines', 1, 20887500),
(3, 'JetStar', 1, 14175000),
(4, 'Japan Airlines', 3, 0),
(5, 'All Nippon Airways', 7, 0),
(6, 'Cathay Pacific', 5, 0),
(7, 'Lufthansa', 2, 0),
(8, 'Hainan Airlines', 4, 0),
(9, 'Thai Airways', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` int(4) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `country_coop` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `country_coop`) VALUES
(1, 'Việt Nam', '1-3-7-4'),
(3, 'Nhật Bản', '1-7'),
(4, 'Trung Quốc', '1'),
(5, 'Hồng Kông', '1'),
(6, 'Thái Lan', '1'),
(7, 'Mỹ', '3-7');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
CREATE TABLE IF NOT EXISTS `flights` (
  `flight_id` int(11) NOT NULL AUTO_INCREMENT,
  `airways_id` int(11) NOT NULL,
  `flight_time_from` datetime NOT NULL,
  `flight_time_to` datetime NOT NULL,
  `flight_city_from_id` tinyint(4) NOT NULL,
  `flight_city_to_id` tinyint(4) NOT NULL,
  `flight_price` double NOT NULL,
  `flight_parent_id` tinyint(4) DEFAULT '0',
  `flight_seat` tinyint(4) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  UNIQUE KEY `flight_id` (`flight_id`),
  KEY `flight_id_2` (`flight_id`),
  KEY `airways_id` (`airways_id`),
  KEY `flight_city_to_id` (`flight_city_to_id`),
  KEY `flight_city_from_id` (`flight_city_from_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flight_id`, `airways_id`, `flight_time_from`, `flight_time_to`, `flight_city_from_id`, `flight_city_to_id`, `flight_price`, `flight_parent_id`, `flight_seat`, `updated_at`, `created_at`) VALUES
(1, 2, '2019-05-14 00:00:00', '2019-05-15 00:00:00', 1, 3, 2100000, 0, 3, '2019-03-26 11:34:09', '2019-03-14 09:31:59'),
(2, 8, '2019-05-14 00:00:00', '2019-05-18 00:00:00', 1, 4, 6300000, 0, 2, '2019-03-25 13:51:43', '2019-03-14 13:30:56'),
(3, 8, '2019-05-14 00:00:00', '2019-05-18 00:00:00', 1, 4, 6300000, 2, 2, '2019-03-25 13:45:42', '2019-03-14 13:31:05'),
(4, 2, '2019-05-14 00:00:00', '2019-05-15 00:00:00', 1, 2, 525000, 0, 23, '2019-04-01 18:58:39', '2019-03-14 13:48:47'),
(5, 3, '2019-05-15 00:00:00', '2019-05-15 00:00:00', 2, 1, 1050000, 0, 9, '2019-04-01 15:24:30', '2019-03-14 13:49:34'),
(11, 1, '2019-05-21 21:44:00', '2019-05-21 21:44:00', 1, 5, 525000, 0, 0, '2019-03-21 21:45:34', '2019-03-21 21:45:34'),
(14, 1, '2019-05-23 22:00:00', '2019-05-23 06:00:00', 1, 10, 3150000, 0, 1, '2019-03-23 22:35:12', '2019-03-23 18:58:11'),
(15, 4, '2019-04-24 09:30:00', '2019-04-29 00:30:00', 9, 8, 30000000, 0, 10, '2019-03-24 09:51:41', '2019-03-24 09:40:05'),
(16, 3, '2019-04-25 05:30:00', '2019-04-26 10:30:00', 5, 9, 6000000, 0, 0, '2019-03-24 10:15:50', '2019-03-24 10:15:50'),
(17, 2, '2019-05-24 10:30:00', '2019-05-25 02:00:00', 1, 8, 1050000, 18, 0, '2019-03-24 10:20:07', '2019-03-24 10:20:07'),
(18, 5, '2019-05-24 10:30:00', '2019-05-25 02:00:00', 7, 8, 50000, 0, 0, '2019-03-24 10:20:07', '2019-03-24 10:20:07'),
(19, 2, '2019-04-26 22:24:00', '2019-04-26 22:24:00', 1, 5, 2000000, 0, 1, '2019-04-01 18:22:22', '2019-03-26 22:24:32'),
(21, 5, '2019-04-26 22:25:00', '2019-04-26 22:25:00', 7, 10, 500000, 0, 0, '2019-03-26 22:26:26', '2019-03-26 22:26:26'),
(22, 2, '2019-05-29 13:03:00', '2019-05-29 13:03:00', 1, 6, 2100000, 0, 0, '2019-03-29 13:04:01', '2019-03-29 13:04:01'),
(23, 3, '2019-04-29 13:04:00', '2019-05-29 13:04:00', 6, 1, 2000000, 0, 0, '2019-03-29 13:04:50', '2019-03-29 13:04:50'),
(24, 2, '2019-04-29 13:06:00', '2019-04-30 13:06:00', 1, 9, 3000000, 0, 1, '2019-03-29 15:20:07', '2019-03-29 13:07:47'),
(26, 2, '2019-05-29 14:21:00', '2019-05-29 14:21:00', 1, 10, 525000, 0, 0, '2019-03-29 14:21:33', '2019-03-29 14:21:33');

-- --------------------------------------------------------

--
-- Table structure for table `flights_booking`
--

DROP TABLE IF EXISTS `flights_booking`;
CREATE TABLE IF NOT EXISTS `flights_booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` tinyint(4) NOT NULL,
  `fb_flight_id` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `fb_total_person` tinyint(4) DEFAULT '0',
  `Payment_Method` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `card_number` int(3) DEFAULT NULL,
  `card_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ccv_code` int(3) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flights_booking`
--

INSERT INTO `flights_booking` (`booking_id`, `user_id`, `fb_flight_id`, `total_price`, `fb_total_person`, `Payment_Method`, `card_number`, `card_name`, `ccv_code`, `updated_at`, `created_at`) VALUES
(32, 10, 4, 2362500, 3, 'credit_card', 223, 'Visa', 33, '2019-04-01 15:24:30', '2019-04-01 15:24:30'),
(33, 10, 5, 4725000, 3, 'credit_card', 223, 'Visa', 33, '2019-04-01 15:24:30', '2019-04-01 15:24:30'),
(37, 12, 4, 787500, 1, 'transfer', NULL, NULL, NULL, '2019-04-01 18:58:38', '2019-04-01 18:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `list_cities`
--

DROP TABLE IF EXISTS `list_cities`;
CREATE TABLE IF NOT EXISTS `list_cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_country_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `list_cities`
--

INSERT INTO `list_cities` (`city_id`, `city_name`, `city_code`, `city_country_id`) VALUES
(1, 'TP. Hồ Chí Minh', 'SNG', 1),
(2, 'Hà Nội', 'HAN', 1),
(3, 'Singapore', 'SIN', 0),
(4, 'PuSan', 'PUS', 0),
(5, 'Đà Nẵng', 'DAD', 1),
(6, 'Đà Lạt', 'DAL', 1),
(7, ' New York', 'NY', 7),
(8, 'Los Angeles', 'LA', 7),
(9, 'Tokyo', 'TKO', 3),
(10, 'OSaKa', 'OSA', 3);

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
CREATE TABLE IF NOT EXISTS `passengers` (
  `passenger_id` int(11) NOT NULL AUTO_INCREMENT,
  `passenger_title` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `passenger_first_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `passenger_last_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `passenger_user_id` tinyint(4) NOT NULL,
  `passenger_fl_id` tinyint(4) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passenger_id`, `passenger_title`, `passenger_first_name`, `passenger_last_name`, `passenger_user_id`, `passenger_fl_id`, `updated_at`, `created_at`) VALUES
(33, 'mr', 'Tuấn', 'Nguyễn', 10, 4, NULL, NULL),
(39, 'Mr', 'Nguyen', 'nam', 12, 4, '2019-04-01 19:25:38', NULL),
(40, 'mr', 'Nguyen', 'Tuan', 12, 4, NULL, NULL),
(41, 'mr', 'Nguyen', 'Tuan', 12, 19, NULL, NULL),
(42, 'mr', 'Tran', 'An', 12, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
CREATE TABLE IF NOT EXISTS `provinces` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`province_id`, `province_name`) VALUES
(1, 'Hà Nội'),
(2, 'Thành phố Hồ Chí Minh'),
(3, 'Đà Nẵng'),
(4, 'Lâm Đồng'),
(5, 'Phú Yên'),
(6, 'Bình Định'),
(7, 'Cần Thơ');

-- --------------------------------------------------------

--
-- Table structure for table `transit`
--

DROP TABLE IF EXISTS `transit`;
CREATE TABLE IF NOT EXISTS `transit` (
  `transit_id` int(11) NOT NULL AUTO_INCREMENT,
  `transit_city_id` tinyint(4) NOT NULL,
  `transit_time` datetime NOT NULL,
  `flight_id` int(11) NOT NULL,
  PRIMARY KEY (`transit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_phone` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_gender` int(2) DEFAULT NULL,
  `user_bird` date DEFAULT NULL,
  `user_adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempt` int(2) DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `user_phone`, `user_gender`, `user_bird`, `user_adress`, `attempt`, `last_access`, `remember_token`, `created_at`, `updated_at`, `level`) VALUES
(12, 'admin', 'admin@gmail.com', NULL, '$2y$10$7ZptRbLjt71VjS6VQEWPz./hvBoob7ht/06iDTG2TQJ5VROCp1qjW', NULL, NULL, NULL, NULL, 0, '2019-04-01 05:46:00', NULL, '2019-04-01 10:44:30', '2019-04-01 10:46:00', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`airways_id`) REFERENCES `airways` (`airways_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
