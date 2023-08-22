-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2023 at 05:41 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sadhannu`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `privilege` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `email`, `privilege`) VALUES
(0, 'guest', 'guest', 'guest@gmail.com', 0),
(1, 'admin', 'admin', 'admin@gmail.com', 1),
(2, 'david', 'test', 'swastik@gmail.com', 0),
(3, 'lenin', '12345', 'sujan@gmail.com', 0),
(4, 'kevin', 'password', 'banshaj@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `shipper_id` int(11) UNSIGNED NOT NULL,
  `total_sum` double(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `cart_id`, `user_id`, `shipper_id`, `total_sum`) VALUES
(1, 0, 1, 1, 152.00),
(2, 0, 1, 2, 304.00);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `item_id`, `user_id`, `quantity`) VALUES
(0, 2, 0, 1),
(0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` int(10) UNSIGNED NOT NULL,
  `brand` varchar(30) NOT NULL,
  `company` varchar(30) NOT NULL,
  `headquarter` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `brand`, `company`, `headquarter`) VALUES
(1, 'Ranger', 'Ford', 'USA'),
(2, 'Land Cruiser', 'Toyota', 'Japan'),
(3, 'Brezza', 'Suzuki', 'Japan'),
(4, 'Nexon EV', 'Tata', 'India'),
(5, 'Kona', 'Hyundai', 'South KoreaLAND CRUISER');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `brand` int(10) UNSIGNED NOT NULL,
  `price` double(10,2) UNSIGNED NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `brand`, `price`, `image`) VALUES
(1, 'NEXT GEN RAPTOR', 1, 21500000.00, './assets/products/car01.jpg'),
(2, 'LAND CRUISER 70', 2, 29600000.00, './assets/products/car02.jpg'),
(3, 'RAIZE', 2, 6850000.00, './assets/products/car03.jpg'),
(4, 'LAND CRUISER PRADO', 2, 28300000.00, './assets/products/car04.jpg'),
(5, 'FOrtuner ', 2, 22200000.00, './assets/products/car05.jpg'),
(6, 'RAV 4 ', 2, 16300000.00, './assets/products/car06.jpg'),
(7, 'RAV 4', 2, 16300000.00, './assets/products/car06.jpg'),
(8, 'Ranger 3.2L(DIESEL) XL A/T', 1, 10100000.00, './assets/products/car08.jpg'),
(9, 'Everest 2.0L Bi-Turbo (DIESEL) TITANIUM 4x4A/T', 1, 21700000.00, './assets/products/car09.jpg'),
(10, 'Next Gen Ranger 2.OL (DIESEL) XL A/T', 1, 11090000.00, './assets/products/car10.jpg'),
(11, 'Brezza Lxi', 3, 4499000.00, './assets/products/car11.jpg'),
(12, 'Fronx Delta', 3, 4199000.00, './assets/products/car12.jpg'),
(13, 'Jimny Zeta', 3, 5999000.00, './assets/products/car13.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `shipper`
--

CREATE TABLE `shipper` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `age` int(10) UNSIGNED DEFAULT NULL,
  `area` varchar(30) NOT NULL,
  `cost` double(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipper`
--

INSERT INTO `shipper` (`id`, `name`, `age`, `area`, `cost`) VALUES
(1, 'Hoang Duc', 18, 'Ha Noi', 1.00),
(2, 'Mr Dinh', 20, 'Da Nang', 2.00),
(3, 'Ky Anh', 20, 'Ho Chi Minh', 1.50),
(4, 'Ngoc Anh', 19, 'Binh Duong', 0.50),
(5, 'Khanh Huyen', 21, 'Lao Cai', 3.00),
(6, 'Nam Hai', 20, 'Vung Tau', 2.50);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `gender` tinyint(3) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `money` double(10,2) UNSIGNED NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `phone`, `gender`, `address`, `money`) VALUES
(0, 'Guest', NULL, 0, NULL, 0.00),
(1, 'Admin', '0943284322', 0, NULL, 99999.99),
(2, 'David', '0828382237', 0, NULL, 50.00),
(3, 'Lenin', '0723923232', 1, NULL, 100.00),
(4, 'Kevin', '0932733612', 0, NULL, 10.00);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
