-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 09, 2023 lúc 03:49 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET GLOBAL FOREIGN_KEY_CHECKS = 0;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobileshop`
--

-- --------------------------------------------------------

--
--Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `privilege` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- 
Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `shipper_id` int(11) UNSIGNED NOT NULL,
  `total_sum` double(10,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`--

INSERT INTO `cart` (`id`, `item_id`, `user_id`, `quantity`) VALUES
(0, 12, 1, 1),
(1, 5, 1, 1),
(25, 1, 0, 1),
(26, 8, 0, 1),
(27, 13, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for `manufacturer` . table--

CREATE TABLE `manufacturer` (
  `id` int(10) UNSIGNED NOT NULL,
  `brand` varchar(30) NOT NULL,
  `company` varchar(30) NOT NULL,
  `headquarter` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

---- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `brand` int(10) UNSIGNED NOT NULL,
  `price` double(10,2) UNSIGNED NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `brand`, `price`, `image`) VALUES
(1, 'NEXT GEN RAPTOR', 1, 21500000.00, './assets/products/car01.jpg'),
(2, 'LAND CRUISER 70', 2, 122.00, './assets/products/car02.jpg'),
(3, 'RAIZE', 2, 6850000.00, './assets/products/car03.jpg'),
(4, 'LAND CRUISER PRADO', 2, 28300000.00, './assets/products/car04.jpg'),
(5, 'FOrtuner ', 2, 22200000.00, './assets/products/car05.jpg'),
(6, 'RAV 4 ', 2, 16300000.00, './assets/products/car06.jpg'),
(7, 'RAV 4', 2, 16300000.00, './assets/products/car06.jpg'),
(8, 'Ranger 3.2L(DIESEL) XL A/T', 1, 10100000.00, './assets/products/car08.jpg'),
(9, 'Everest 2.0L Bi-Turbo (DIESEL) TITANIUM 4x4A/T', 1, 21700000.00, './assets/products/car09.jpg'),
(10, 'Next Gen Ranger 2.OL (DIESEL) XL A/T', 1, 11090000.00, './assets/products/car10.jpgg'),
(11, 'Brezza Lxi', 3, 4499000.00, './assets/products/car11.jpg'),
(12, 'Fronx Delta', 3, 4199000.00, './assets/products/car12.jpg'),
(13, 'Jimny Zeta', 3, 5999000.00, './assets/products/car13.jpg');
(14, 'Grand Vitara Alpha+ Dual', 3, 9729000.00, './assets/products/car14.jpg');
(15, 'Creta SX', 5, 6798000.00, './assets/products/car15.jpg');
(16, 'Tulson GLX 4WD TURBO ', 5, 16296000.00, './assets/products/car16.jpg');
(17, 'KONA GLS ', 5, 6496000.00, './assets/products/car17.jpg');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

---- Dumping data for table `shipper`
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
  `city` varchar(30) NOT NULL,
  `gender` tinyint(3) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `money` double(10,2) UNSIGNED NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

---- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `phone`, `gender`, `address`, `money`) VALUES
(0, 'Guest', NULL, 'VN', 0, NULL, 0.00),
(1, 'Admin', '0943284322', 0, NULL, 99999.99),
(2, 'David', '0828382237', 0, NULL, 50.00),
(3, 'Lenin', '0723923232' 1, NULL, 100.00),
(4, 'Kevin', '0932733612', 0, NULL, 10.00);

--
-- Indexes for dumped tables
--

--
--Index for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Index for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shipper_id` (`shipper_id`),
  ADD KEY `bill_id` (`cart_id`);

--
--Index for table `cart`
--remaining down
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);
-- remaining up
--
-- Index for table `manufacturer`--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Index for table `product`--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `id` (`id`);

--
 --Index for table `shipper`--

ALTER TABLE `shipper`
  ADD PRIMARY KEY (`id`);

--
-- Index for table `user`
-- --
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
--AUTO_INCREMENT for dumped tables--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `bill`--
ALTER TABLE `bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `cart`--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `cart`--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `cart`--

--
-- AUTO_INCREMENT for table `cart`--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- AUTO_INCREMENT for table `cart`--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`shipper_id`) REFERENCES `shipper` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- AUTO_INCREMENT for table `cart`--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `manufacturer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;