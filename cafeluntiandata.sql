-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2025 at 01:57 AM
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
  `Admin_ID` int(11) NOT NULL,
  `Admin_FName` varchar(55) NOT NULL,
  `Admin_LName` varchar(55) NOT NULL,
  `Email` varchar(55) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Contact` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_reservation_tbl`
--

CREATE TABLE `order_reservation_tbl` (
  `Customer_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `User_FName` varchar(55) NOT NULL,
  `User_LName` varchar(55) NOT NULL,
  `Contact` bigint(20) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Order_Name` varchar(255) NOT NULL,
  `Notes` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tablereservation_tbl`
--

CREATE TABLE `tablereservation_tbl` (
  `Reservation_ID` int(11) NOT NULL,
  `Full_Name` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Pax` int(11) NOT NULL,
  `Table_Number` int(11) NOT NULL,
  `Reservation_Created` datetime NOT NULL,
  `Status` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tablereservation_tbl`
--

INSERT INTO `tablereservation_tbl` (`Reservation_ID`, `Full_Name`, `Date`, `Time`, `Email`, `Pax`, `Table_Number`, `Reservation_Created`, `Status`) VALUES
(1, '', '2025-02-28', '10:06:00', '2120465@ub.edu.ph', 2, 0, '2025-02-24 10:06:17', ''),
(2, 'Jewel Ordanza', '2025-02-27', '10:10:00', 'jewelordanza@gmail.com', 4, 0, '2025-02-24 10:07:35', ''),
(3, 'Shane Keh', '2025-02-26', '10:15:00', 'shane@gmail.com', 5, 0, '2025-02-24 10:09:50', 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `User_ID` int(11) NOT NULL,
  `User_FName` varchar(255) NOT NULL,
  `User_LName` varchar(255) NOT NULL,
  `Email` varchar(55) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Contact_Num` varchar(20) NOT NULL,
  `Position` varchar(255) NOT NULL,
  `Account_Created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`User_ID`, `User_FName`, `User_LName`, `Email`, `Password`, `Contact_Num`, `Position`, `Account_Created`) VALUES
(1, 'Jewel', 'Ordanza', 'ju@gmail.com', 'jenniekim', '09934129155', 'Customer', '2025-02-18'),
(2, 'Shane', 'Keh', 'shane@gmail.com', '1111', '5654545454', 'Admin', '2025-02-18'),
(3, 'Althea', 'Castro', 'Thea@gmail.com', '1234', '0926652152', 'Customer', '2025-02-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `order_reservation_tbl`
--
ALTER TABLE `order_reservation_tbl`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `tablereservation_tbl`
--
ALTER TABLE `tablereservation_tbl`
  ADD PRIMARY KEY (`Reservation_ID`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_reservation_tbl`
--
ALTER TABLE `order_reservation_tbl`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tablereservation_tbl`
--
ALTER TABLE `tablereservation_tbl`
  MODIFY `Reservation_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
