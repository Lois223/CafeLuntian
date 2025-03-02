-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2025 at 05:56 AM
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
(202502006, 'Thea', 'Castro', 'theaa@gmail.com', '1234', '0927838167', '2025-02-28');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_tbl`
--

CREATE TABLE `customer_order_tbl` (
  `Customer_ID` int(11) NOT NULL,
  `Customer_Name` varchar(255) NOT NULL,
  `Customer_Order` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `DP_Amount` int(11) NOT NULL,
  `Balance_Amount` int(11) NOT NULL,
  `Receipt` varbinary(500) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_reservation_tbl`
--

CREATE TABLE `table_reservation_tbl` (
  `Reservation_ID` int(11) NOT NULL,
  `Full_Name` varchar(255) NOT NULL,
  `Reservation_Date` date NOT NULL,
  `Reservation_Time` time NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Pax` int(11) NOT NULL,
  `Reservation_Created` datetime NOT NULL,
  `Status` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_reservation_tbl`
--

INSERT INTO `table_reservation_tbl` (`Reservation_ID`, `Full_Name`, `Reservation_Date`, `Reservation_Time`, `Email`, `Pax`, `Reservation_Created`, `Status`) VALUES
(3, 'Shane Keh', '2025-02-26', '10:15:00', 'shane@gmail.com', 5, '2025-02-24 10:09:50', 'confirmed'),
(4, 'Althea Lois Castro', '2025-02-27', '17:00:00', 'althea@gmail.com', 6, '2025-02-25 09:26:31', 'confirmed'),
(11, 'Jewel Ordanza', '2025-02-28', '13:30:00', 'jewel@gmail.com', 4, '2025-02-25 13:57:55', 'confirmed'),
(202502001, '', '0000-00-00', '00:00:00', '', 0, '2025-02-28 10:05:21', 'confirmed'),
(202502002, 'Jewel Ordanza', '2025-02-28', '10:10:00', '2120465@ub.edu.ph', 2, '2025-02-28 10:11:29', 'confirmed');

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
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `table_reservation_tbl`
--
ALTER TABLE `table_reservation_tbl`
  ADD PRIMARY KEY (`Reservation_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  MODIFY `Admin_ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202502007;

--
-- AUTO_INCREMENT for table `customer_order_tbl`
--
ALTER TABLE `customer_order_tbl`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_reservation_tbl`
--
ALTER TABLE `table_reservation_tbl`
  MODIFY `Reservation_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202502003;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
