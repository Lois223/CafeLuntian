-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2025 at 03:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafeluntiandata`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_tbl`
--

CREATE TABLE `admin_tbl` (
  `Admin_ID` int(50) NOT NULL,
  `User_FName` varchar(255) NOT NULL,
  `User_LName` varchar(255) NOT NULL,
  `Email` varchar(55) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Contact_Num` varchar(20) NOT NULL,
  `Account_Created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_tbl`
--

INSERT INTO `admin_tbl` (`Admin_ID`, `User_FName`, `User_LName`, `Email`, `Password`, `Contact_Num`, `Account_Created`) VALUES
(202502001, 'Jewel', 'Ordanza', 'jewel@gmail.com', '$2y$10$eSPPu.a8vbe3v', '09934129155', '2025-02-28'),
(202502002, 'Althea', 'Castro', 'althea@gmail.com', '1111', '09266521525', '2025-02-28'),
(202502003, 'Jewel Marie', 'Ordanza', '2120465@ub.edu.ph', '1212', '09551826420', '2025-02-28'),
(202502004, 'Shane', 'Keh', 'keh@gmail.com', 'shane', '09934129155', '2025-02-28'),
(202502005, 'Jewel Marie', 'Ordanza', 'jew@gmail.com', '1212', '09934129155', '2025-02-28'),
(202502006, 'Thea', 'Castro', 'theaa@gmail.com', '1234', '0927838167', '2025-02-28'),
(202503001, 'John', 'Doe', 'johndoe@gmail.com', '1212', '123456789', '2025-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_tbl`
--

CREATE TABLE `customer_order_tbl` (
  `Order_ID` int(11) NOT NULL,
  `Customer_Name` varchar(255) NOT NULL,
  `Contact` varchar(20) DEFAULT NULL,
  `Email` varchar(155) NOT NULL,
  `Room_Num` int(11) NOT NULL,
  `Mode_of_Service` varchar(255) NOT NULL,
  `Time` time NOT NULL,
  `Receipt` varchar(255) DEFAULT NULL,
  `Status` varchar(30) NOT NULL,
  `Add_Ons` text NOT NULL,
  `Add_Ons_Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_order_tbl`
--

INSERT INTO `customer_order_tbl` (`Order_ID`, `Customer_Name`, `Contact`, `Email`, `Room_Num`, `Mode_of_Service`, `Time`, `Receipt`, `Status`, `Add_Ons`, `Add_Ons_Price`) VALUES
(202503001, 'Jewel Ordanza', '01234567895', 'jew@gmail.com', 201, 'Delivery', '13:03:00', 'uploads/202503001_aaa.jpg', '', '', 0.00),
(202503002, 'Shane Keh', '09586421452', 'shane@gmail.com', 222, 'Pickup', '13:04:00', 'uploads/202503002_aaa.jpg', '', '', 0.00),
(202503003, 'Althea Castro', '03265478995', 'Althea@gmail.com', 205, 'Pickup', '13:05:00', 'uploads/202503003_aaa.jpg', '', '', 0.00),
(202503004, 'test101', '09123456789', 'test@gmail.com', 5, 'Delivery', '16:13:00', 'uploads/202503004_a.png', '', '', 0.00),
(202503007, 'Jewel Marie Ordanza', '0956566565', '2120465@ub.edu.ph', 209, 'Delivery', '00:40:00', NULL, 'pending', '', 0.00),
(202503008, 'shane', '03214569874', '2120465@ub.edu.ph', 202, 'Delivery', '12:58:00', NULL, 'pending', '', 0.00),
(202503009, 'Jewel Marie Ordanza', '23232432423', '2120465@ub.edu.ph', 0, 'Pickup', '13:10:00', NULL, 'pending', '', 0.00),
(202503010, 'Jewel Marie Ordanza', '09551826420', '2120465@ub.edu.ph', 205, 'Delivery', '10:20:00', NULL, 'pending', '', 0.00),
(202503011, 'Jewel Marie Ordanza', '09551826420', 'jewel@gmail.com', 0, 'Pickup', '21:50:00', NULL, 'pending', '', 0.00),
(202503012, 'Jewel Marie Ordanza', '09234123232', 'ju@gmail.com', 0, 'Pickup', '21:10:00', NULL, 'pending', '', 0.00),
(202503015, 'shane', '03214956647', 'Snape@gmail.com', 0, 'Pickup', '14:54:00', NULL, 'pending', '', 0.00),
(202503016, 'hotel', '02314569874', 'Neville@gmail.com', 0, 'Pickup', '14:50:00', NULL, 'pending', '', 0.00),
(202503017, 'test', '02314569874', 'Ron@gmail.com', 0, 'Pickup', '15:08:00', NULL, 'pending', '', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_items_tbl`
--

CREATE TABLE `order_items_tbl` (
  `Item_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Item_Name` varchar(255) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `Add_Ons` text DEFAULT NULL,
  `Add_Ons_Price` float(10,2) DEFAULT NULL,
  `Status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items_tbl`
--

INSERT INTO `order_items_tbl` (`Item_ID`, `Order_ID`, `Item_Name`, `Quantity`, `Price`, `Subtotal`, `Created_At`, `Add_Ons`, `Add_Ons_Price`, `Status`) VALUES
(4, 202503001, 'Caramel Macchiato', 1, 99.00, 99.00, '2025-03-13 17:03:30', NULL, NULL, 'cancelled'),
(5, 202503001, 'Salted Caramel', 2, 99.00, 198.00, '2025-03-13 17:03:30', NULL, NULL, 'cancelled'),
(6, 202503001, 'Americano', 1, 129.00, 129.00, '2025-03-13 17:03:30', NULL, NULL, 'cancelled'),
(7, 202503002, 'Java Chip', 2, 149.00, 298.00, '2025-03-13 17:04:44', NULL, NULL, 'cancelled'),
(8, 202503002, 'Dark Chocolate', 1, 129.00, 129.00, '2025-03-13 17:04:44', NULL, NULL, 'cancelled'),
(9, 202503003, 'Cappuccino', 1, 99.00, 99.00, '2025-03-13 17:05:31', NULL, NULL, 'confirmed'),
(10, 202503003, 'Salted Caramel', 2, 99.00, 198.00, '2025-03-13 17:05:31', NULL, NULL, 'confirmed'),
(11, 202503004, 'Caramel', 1, 99.00, 99.00, '2025-03-13 17:13:56', NULL, NULL, 'cancelled'),
(12, 202503004, 'Dirty Matcha', 2, 129.00, 258.00, '2025-03-13 17:13:56', NULL, NULL, 'cancelled'),
(25, 202503007, 'Salted Caramel', 1, 129.00, 129.00, '2025-03-20 04:48:13', 'alcohol', 0.00, 'cancelled'),
(26, 202503007, 'Salted Caramel', 1, 129.00, 129.00, '2025-03-20 04:48:13', 'coffee', 0.00, 'cancelled'),
(27, 202503008, 'Chocolate', 1, 99.00, 99.00, '2025-03-20 05:00:17', 'alcohol', 0.00, 'cancelled'),
(28, 202503009, 'White Chocolate', 2, 149.00, 298.00, '2025-03-20 05:10:38', NULL, 0.00, 'cancelled'),
(29, 202503010, 'Salted Caramel', 1, 99.00, 99.00, '2025-03-23 11:19:08', NULL, 0.00, 'cancelled'),
(30, 202503010, 'Americano', 1, 99.00, 99.00, '2025-03-23 11:19:08', NULL, 0.00, 'cancelled'),
(31, 202503010, 'Salted Caramel', 1, 99.00, 99.00, '2025-03-23 11:19:08', NULL, 0.00, 'cancelled'),
(32, 202503011, 'Salted Caramel', 1, 99.00, 99.00, '2025-03-23 13:46:47', NULL, 0.00, 'pending'),
(33, 202503012, 'Americano', 1, 129.00, 129.00, '2025-03-23 13:47:54', NULL, 0.00, 'pending'),
(37, 202503015, 'Chocolate', 1, 99.00, 99.00, '2025-03-24 06:55:11', NULL, 0.00, 'confirmed'),
(38, 202503015, 'Cafe Mocha', 1, 129.00, 129.00, '2025-03-24 06:55:11', NULL, 0.00, 'confirmed'),
(41, 202503016, 'Spanish Latte', 1, 99.00, 99.00, '2025-03-24 12:50:26', NULL, 0.00, 'confirmed'),
(42, 202503017, 'Cappuccino', 1, 99.00, 99.00, '2025-03-24 13:08:46', NULL, 0.00, 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `table_reservation_tbl`
--

CREATE TABLE `table_reservation_tbl` (
  `Reservation_ID` varchar(20) NOT NULL,
  `Full_Name` varchar(255) NOT NULL,
  `Reservation_Date` date NOT NULL,
  `Reservation_Time` time NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Pax` int(11) NOT NULL,
  `Reservation_Created` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_reservation_tbl`
--

INSERT INTO `table_reservation_tbl` (`Reservation_ID`, `Full_Name`, `Reservation_Date`, `Reservation_Time`, `Email`, `Pax`, `Reservation_Created`, `Status`) VALUES
('3', 'Jewel Ordanza', '2025-03-26', '19:50:00', '2120465@ub.edu.ph', 2, '2025-03-23 11:43:22', 'confirmed'),
('RES-202503-0B969', 'Jewel Ordanza', '2025-03-25', '19:50:00', '2120465@ub.edu.ph', 2, '2025-03-23 11:47:08', 'confirmed'),
('RES-202503-54724', 'Jewel Ordanza', '2025-03-26', '07:46:00', '2120465@ub.edu.ph', 3, '2025-03-23 11:46:44', 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `transactions_tbl`
--

CREATE TABLE `transactions_tbl` (
  `Transaction_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Customer_Name` varchar(255) NOT NULL,
  `Date_Time` timestamp NOT NULL DEFAULT current_timestamp(),
  `Amount` decimal(10,2) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `Receipt_Path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions_tbl`
--

INSERT INTO `transactions_tbl` (`Transaction_ID`, `Order_ID`, `Customer_Name`, `Date_Time`, `Amount`, `Status`, `Receipt_Path`) VALUES
(1, 202503017, 'test', '2025-03-24 13:16:22', 99.00, 'pending', ''),
(2, 202503016, 'hotel', '2025-03-24 13:33:41', 99.00, 'pending', ''),
(3, 202503015, 'shane', '2025-03-24 13:36:56', 228.00, 'pending', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `customer_order_tbl`
--
ALTER TABLE `customer_order_tbl`
  ADD PRIMARY KEY (`Order_ID`);

--
-- Indexes for table `order_items_tbl`
--
ALTER TABLE `order_items_tbl`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `table_reservation_tbl`
--
ALTER TABLE `table_reservation_tbl`
  ADD PRIMARY KEY (`Reservation_ID`);

--
-- Indexes for table `transactions_tbl`
--
ALTER TABLE `transactions_tbl`
  ADD PRIMARY KEY (`Transaction_ID`),
  ADD KEY `Order` (`Order_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  MODIFY `Admin_ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202503002;

--
-- AUTO_INCREMENT for table `customer_order_tbl`
--
ALTER TABLE `customer_order_tbl`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202503018;

--
-- AUTO_INCREMENT for table `order_items_tbl`
--
ALTER TABLE `order_items_tbl`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `transactions_tbl`
--
ALTER TABLE `transactions_tbl`
  MODIFY `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items_tbl`
--
ALTER TABLE `order_items_tbl`
  ADD CONSTRAINT `order_items_tbl_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `customer_order_tbl` (`Order_ID`) ON DELETE CASCADE;

--
-- Constraints for table `transactions_tbl`
--
ALTER TABLE `transactions_tbl`
  ADD CONSTRAINT `fk_transaction_order` FOREIGN KEY (`Order_ID`) REFERENCES `customer_order_tbl` (`Order_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_transactions_order` FOREIGN KEY (`Order_ID`) REFERENCES `order_items_tbl` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
