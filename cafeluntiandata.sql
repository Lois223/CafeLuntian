-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2025 at 04:38 PM
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
CREATE DATABASE IF NOT EXISTS `cafeluntiandata` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cafeluntiandata`;

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
  `Order_Name` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Room_Num` int(11) NOT NULL,
  `Mode_of_Service` varchar(255) NOT NULL,
  `Time` time NOT NULL,
  `Receipt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_order_tbl`
--

INSERT INTO `customer_order_tbl` (`Order_ID`, `Customer_Name`, `Contact`, `Email`, `Order_Name`, `Price`, `Quantity`, `Room_Num`, `Mode_of_Service`, `Time`, `Receipt`) VALUES
(202503001, 'Jewel Ordanza', '01234567895', 'jew@gmail.com', '', 0, 0, 201, 'Delivery', '13:03:00', 'uploads/202503001_aaa.jpg'),
(202503002, 'Shane Keh', '09586421452', 'shane@gmail.com', '', 0, 0, 222, 'Pickup', '13:04:00', 'uploads/202503002_aaa.jpg'),
(202503003, 'Althea Castro', '03265478995', 'Althea@gmail.com', '', 0, 0, 205, 'Pickup', '13:05:00', 'uploads/202503003_aaa.jpg'),
(202503004, 'test101', '09123456789', 'test@gmail.com', '', 0, 0, 5, 'Delivery', '16:13:00', 'uploads/202503004_a.png'),
(202503005, 'lois', '02314569874', 'Lois@gmail.com', '', 0, 0, 0, 'Pickup', '16:37:00', NULL),
(202503006, 'thea', '09123456789', 'thea@gmail.com', '', 0, 0, 202, 'Delivery', '17:37:00', NULL);

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
  `Add_Ons_Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items_tbl`
--

INSERT INTO `order_items_tbl` (`Item_ID`, `Order_ID`, `Item_Name`, `Quantity`, `Price`, `Subtotal`, `Created_At`, `Add_Ons`, `Add_Ons_Price`) VALUES
(4, 202503001, 'Caramel Macchiato', 1, 99.00, 99.00, '2025-03-13 17:03:30', NULL, NULL),
(5, 202503001, 'Salted Caramel', 2, 99.00, 198.00, '2025-03-13 17:03:30', NULL, NULL),
(6, 202503001, 'Americano', 1, 129.00, 129.00, '2025-03-13 17:03:30', NULL, NULL),
(7, 202503002, 'Java Chip', 2, 149.00, 298.00, '2025-03-13 17:04:44', NULL, NULL),
(8, 202503002, 'Dark Chocolate', 1, 129.00, 129.00, '2025-03-13 17:04:44', NULL, NULL),
(9, 202503003, 'Cappuccino', 1, 99.00, 99.00, '2025-03-13 17:05:31', NULL, NULL),
(10, 202503003, 'Salted Caramel', 2, 99.00, 198.00, '2025-03-13 17:05:31', NULL, NULL),
(11, 202503004, 'Caramel', 1, 99.00, 99.00, '2025-03-13 17:13:56', NULL, NULL),
(12, 202503004, 'Dirty Matcha', 2, 129.00, 258.00, '2025-03-13 17:13:56', NULL, NULL),
(13, 202503005, 'Spanish Latte', 1, 99.00, 99.00, '2025-03-15 15:37:36', 'alcohol', 0.00),
(14, 202503005, 'Cappuccino', 1, 99.00, 99.00, '2025-03-15 15:37:36', 'coffee', 0.00),
(15, 202503006, 'Caramel Macchiato', 1, 99.00, 99.00, '2025-03-15 15:38:00', 'alcohol', 0.00),
(16, 202503006, 'Salted Caramel', 1, 99.00, 99.00, '2025-03-15 15:38:00', NULL, 0.00);

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
(202502021, 'Jewel Ordanza', '2025-03-08', '13:00:00', 'jew@gmail.com', 5, '2025-02-28 13:52:11', 'confirmed'),
(202502022, 'Shane Keh', '2025-03-05', '10:00:00', 'shane@gmail.com', 5, '2025-02-28 13:52:44', 'confirmed'),
(202502023, 'Althea Lois Castro', '2025-04-01', '14:30:00', 'althea@gmail.com', 2, '2025-02-28 13:53:33', 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `transactions_tbl`
--

CREATE TABLE `transactions_tbl` (
  `Transaction_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Order_Date` datetime NOT NULL,
  `Contact_Num` bigint(20) NOT NULL,
  `Amount` varchar(255) NOT NULL,
  `Receipt` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Payment_Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD PRIMARY KEY (`Transaction_ID`);

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
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202503009;

--
-- AUTO_INCREMENT for table `order_items_tbl`
--
ALTER TABLE `order_items_tbl`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `table_reservation_tbl`
--
ALTER TABLE `table_reservation_tbl`
  MODIFY `Reservation_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202502024;

--
-- AUTO_INCREMENT for table `transactions_tbl`
--
ALTER TABLE `transactions_tbl`
  MODIFY `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items_tbl`
--
ALTER TABLE `order_items_tbl`
  ADD CONSTRAINT `order_items_tbl_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `customer_order_tbl` (`Order_ID`) ON DELETE CASCADE;
--
-- Database: `crud`
--
CREATE DATABASE IF NOT EXISTS `crud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud`;

-- --------------------------------------------------------

--
-- Table structure for table `student_tbl`
--

CREATE TABLE `student_tbl` (
  `ID` int(11) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_tbl`
--

INSERT INTO `student_tbl` (`ID`, `First_Name`, `Last_Name`, `Age`) VALUES
(1, 'Luna', 'King', 21),
(2, 'Moon', 'Queen', 21),
(3, 'Apollo', 'Sun', 31);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student_tbl`
--
ALTER TABLE `student_tbl`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student_tbl`
--
ALTER TABLE `student_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `docudata`
--
CREATE DATABASE IF NOT EXISTS `docudata` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `docudata`;

-- --------------------------------------------------------

--
-- Table structure for table `ivfr_fast_drip`
--

CREATE TABLE `ivfr_fast_drip` (
  `Patient_ID` int(20) DEFAULT NULL,
  `SFD_Date` date DEFAULT NULL,
  `IVF` varchar(255) DEFAULT NULL,
  `Volume` varchar(255) DEFAULT NULL,
  `Incorporation` varchar(255) DEFAULT NULL,
  `Time_Taken` time DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ivfr_fast_drip`
--

INSERT INTO `ivfr_fast_drip` (`Patient_ID`, `SFD_Date`, `IVF`, `Volume`, `Incorporation`, `Time_Taken`, `Remarks`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-11-20', 'D5NSS (5% Dextrose in Normal Saline Solution)', '500 mL', '1 mg Vitamin B Complex', '04:00:00', 'Monitored closely, no complications.', 202409683, 'o', NULL),
(202411015, '2024-11-22', 'LR (Lactated Ringer\'s Solution)', '1,000 mL', 'None', '04:00:00', 'Patient tolerated well.', 202409681, 'o', NULL),
(202411016, '2024-11-21', 'D5W (5% Dextrose in Water)', '750 mL', '2 mg Multivitamins', '04:00:00', 'Mild redness around IV site, treated with repositioning.', 202409683, 'o', NULL),
(202411017, '2024-11-23', 'NSS (Normal Saline Solution)', '500 mL', '10 mg Potassium Chloride', '04:00:00', 'Good response, hydration improved.', 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ivfr_iv`
--

CREATE TABLE `ivfr_iv` (
  `Patient_ID` int(20) DEFAULT NULL,
  `IV_Date` date DEFAULT NULL,
  `Bottle_No` varchar(255) DEFAULT NULL,
  `IV_Solution` varchar(255) DEFAULT NULL,
  `Volume` varchar(255) DEFAULT NULL,
  `Incorporation` varchar(255) DEFAULT NULL,
  `Regulation` varchar(255) DEFAULT NULL,
  `Start_Time` time DEFAULT NULL,
  `Time_End` datetime DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ivfr_iv`
--

INSERT INTO `ivfr_iv` (`Patient_ID`, `IV_Date`, `Bottle_No`, `IV_Solution`, `Volume`, `Incorporation`, `Regulation`, `Start_Time`, `Time_End`, `Remarks`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-11-20', '1', 'D5NSS (5% Dextrose in Normal Saline Solution)', '500 mL', '1 mg Vitamin B Complex', '100 mL/hr', '04:00:00', '2024-11-20 17:00:00', 'Patient showed improvement after infusion.', 202409683, 'o', NULL),
(202411015, '2024-11-22', 'IVB67890', 'Dextrose 5%', '1000 mL', 'IV infusion', 'Continuous', '04:00:00', '2024-11-26 19:30:00', 'Rehydration therapy.', 202409681, 'o', NULL),
(202411016, '2024-11-21', 'IVB11223', 'Ringer’s Lactate', '500 mL', 'IV infusion', 'Continuous', '04:00:00', '2023-11-14 18:45:00', 'Given for electrolyte balance.', 202409683, 'o', NULL),
(202411017, '2023-07-17', 'IVB33456', 'Normal Saline', '1000 mL', 'IV infusion', 'Continuous', '04:00:00', '2023-07-17 19:00:00', 'To manage dehydration.', 202409683, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ivfr_side_drips`
--

CREATE TABLE `ivfr_side_drips` (
  `Patient_ID` int(20) DEFAULT NULL,
  `SD_Date` date DEFAULT NULL,
  `Bottle_No` varchar(255) DEFAULT NULL,
  `IV_Solution` varchar(255) DEFAULT NULL,
  `Volume` varchar(255) DEFAULT NULL,
  `Incorporation` varchar(255) DEFAULT NULL,
  `Regulation` varchar(255) DEFAULT NULL,
  `Start_Time` time DEFAULT NULL,
  `Time_End` datetime DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ivfr_side_drips`
--

INSERT INTO `ivfr_side_drips` (`Patient_ID`, `SD_Date`, `Bottle_No`, `IV_Solution`, `Volume`, `Incorporation`, `Regulation`, `Start_Time`, `Time_End`, `Remarks`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-11-20', '001', 'Dextrose 5%', '500 ml', '1L NS', 'IV drip', '10:00:00', '2024-11-20 17:00:00', 'Completed as prescribed', 202409683, 'o', NULL),
(202411015, '2024-11-26', '002', 'Saline', '250 ml', '500 ml D5W', 'Drip', '14:00:00', '2024-11-26 19:30:00', 'Adjusted per doctor\'s instructions', 202409681, 'o', NULL),
(202411016, '2023-11-14', '003', 'Lactated Ringer\'s', '500 ml', '1L NS', 'IV drip', '09:00:00', '2023-11-14 18:45:00', 'No issues noted', 202409683, 'o', NULL),
(202411017, '2023-07-17', '004', 'Normal Saline', '500 ml', '250 ml D5W', 'Drip', '13:00:00', '2023-07-17 19:00:00', 'Well tolerated by the patient', 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_diagnostics`
--

CREATE TABLE `kardex_diagnostics` (
  `Patient_ID` int(20) NOT NULL,
  `Diagnostic_Date` date NOT NULL,
  `Diagnostics` varchar(255) DEFAULT NULL,
  `Diagnostics_Category` int(11) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_diagnostics`
--

INSERT INTO `kardex_diagnostics` (`Patient_ID`, `Diagnostic_Date`, `Diagnostics`, `Diagnostics_Category`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-11-20', 'Fever with chills', 3, 202409683, 'o', NULL),
(202411015, '2024-11-26', 'Acute upper respiratory infection', 4, 202409681, 'o', NULL),
(202411016, '2023-11-14', 'Tension headache', 2, 202409683, 'o', NULL),
(202411017, '2023-07-17', 'Cough with mild wheezing', 5, 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_diagnostics_categories`
--

CREATE TABLE `kardex_diagnostics_categories` (
  `Diagnostics_Checks` int(11) NOT NULL,
  `Categories` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_diagnostics_categories`
--

INSERT INTO `kardex_diagnostics_categories` (`Diagnostics_Checks`, `Categories`) VALUES
(1, 'Request'),
(2, 'Extracted/Done'),
(3, 'Results in'),
(4, 'Relayed'),
(5, 'Acknowledge');

-- --------------------------------------------------------

--
-- Table structure for table `kardex_diet`
--

CREATE TABLE `kardex_diet` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Diet_Date` date DEFAULT NULL,
  `Diet_Category` int(11) DEFAULT NULL,
  `Other_Info` varchar(255) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_diet`
--

INSERT INTO `kardex_diet` (`Patient_ID`, `Diet_Date`, `Diet_Category`, `Other_Info`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-11-20', 1, NULL, 202409683, 'o', NULL),
(202411015, '2024-11-26', 2, NULL, 202409681, 'o', NULL),
(202411016, '2023-11-14', 4, NULL, 202409681, 'o', NULL),
(202411017, '2023-07-17', 9, 'Regular Diet', 202409683, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_diet_categories`
--

CREATE TABLE `kardex_diet_categories` (
  `Diet_Checks` int(11) NOT NULL,
  `Categories` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_diet_categories`
--

INSERT INTO `kardex_diet_categories` (`Diet_Checks`, `Categories`) VALUES
(1, 'NPO'),
(2, 'DAT'),
(3, 'BRAT DIET'),
(4, 'SOFT DIET'),
(5, 'General Liquid'),
(6, 'Clear Liquid'),
(7, 'Diet for Age'),
(8, 'Breast Feeding'),
(9, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `kardex_diet_last_meal`
--

CREATE TABLE `kardex_diet_last_meal` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Meal_Date` date DEFAULT NULL,
  `Last_Meal` varchar(255) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_diet_last_meal`
--

INSERT INTO `kardex_diet_last_meal` (`Patient_ID`, `Meal_Date`, `Last_Meal`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-11-20', 'Chicken broth, crackers, and apple juice', 202409681, 'o', NULL),
(202411015, '2024-11-26', 'Tomato soup, scrambled eggs, and vanilla pudding', 202409683, 'o', NULL),
(202411016, '2023-11-14', 'Mashed potatoes, scrambled eggs, and soft bread', 202409681, 'o', NULL),
(202411017, '2023-07-17', 'Grilled chicken, rice, and steamed vegetables', 202409683, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_drips_transfusion`
--

CREATE TABLE `kardex_drips_transfusion` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Drips_Transfusion_Date` date DEFAULT NULL,
  `Drips_Transfusion` varchar(255) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_drips_transfusion`
--

INSERT INTO `kardex_drips_transfusion` (`Patient_ID`, `Drips_Transfusion_Date`, `Drips_Transfusion`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-10-15', 'Normal saline (100 ml/hr) for rehydration.', 202409683, 'o', NULL),
(202411015, '2024-11-26', '500ml Lactated Ringer\'s solution for electrolyte balance.', 202409683, 'o', NULL),
(202411016, '2023-11-14', 'Blood transfusion, 2 units of O-positive whole blood.', 202409681, 'o', NULL),
(202411017, '2023-07-17', 'Normal saline (250 ml/hr) for hydration.', 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_endorsements`
--

CREATE TABLE `kardex_endorsements` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Endorsement_Date` date DEFAULT NULL,
  `Special_Endorsement` text DEFAULT NULL,
  `Endorsement_Remarks` text DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_endorsements`
--

INSERT INTO `kardex_endorsements` (`Patient_ID`, `Endorsement_Date`, `Special_Endorsement`, `Endorsement_Remarks`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-10-15', 'Rehydration for fever management.', 'Monitor temperature every 4 hours, ensure IV fluid administration as per the prescribed volume.', 202409683, 'o', NULL),
(202411015, '2024-11-26', 'Antibiotic therapy for cold symptoms.', 'Continue cold medications, monitor pulse and respiratory rate every 4 hours.', 202409683, 'o', NULL),
(202411016, '2023-11-14', 'Pain management for headache.', 'Administer pain relief medication as per schedule, monitor pain levels every 4 hours.', 202409681, 'o', NULL),
(202411017, '2023-07-17', 'Cough management and respiratory support.', 'Continue respiratory therapy, monitor oxygen levels, administer cough medication as prescribed.', 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_io`
--

CREATE TABLE `kardex_io` (
  `Patient_ID` int(20) DEFAULT NULL,
  `IO_Date` date NOT NULL,
  `IO_Category` int(11) DEFAULT NULL,
  `Other_Info` varchar(255) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_io`
--

INSERT INTO `kardex_io` (`Patient_ID`, `IO_Date`, `IO_Category`, `Other_Info`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-10-15', 1, NULL, 202409683, 'o', NULL),
(202411015, '2024-11-26', 2, NULL, 202409683, 'o', NULL),
(202411016, '2023-11-14', 4, NULL, 202409681, 'o', NULL),
(202411017, '2023-07-17', 3, NULL, 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_io_categories`
--

CREATE TABLE `kardex_io_categories` (
  `IO_Checks` int(11) NOT NULL,
  `Categories` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_io_categories`
--

INSERT INTO `kardex_io_categories` (`IO_Checks`, `Categories`) VALUES
(1, 'Q1'),
(2, 'Q2'),
(3, 'Q4'),
(4, 'Q Shift'),
(5, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `kardex_iv`
--

CREATE TABLE `kardex_iv` (
  `Patient_ID` int(20) NOT NULL,
  `IVFluid_Date` date NOT NULL,
  `IVFluid` varchar(255) NOT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_iv`
--

INSERT INTO `kardex_iv` (`Patient_ID`, `IVFluid_Date`, `IVFluid`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-10-15', 'Normal Saline (0.9%)', 202409683, 'o', NULL),
(202411015, '2024-11-26', 'Ringer\'s Lactate', 202409683, 'o', NULL),
(202411016, '2023-11-14', 'Dextrose 5% in Water (D5W)', 202409681, 'o', NULL),
(202411017, '2023-07-17', 'Normal Saline (0.9%)', 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_medications`
--

CREATE TABLE `kardex_medications` (
  `Patient_ID` int(20) NOT NULL,
  `Date` date DEFAULT NULL,
  `Medication_Name` varchar(255) NOT NULL,
  `Medication_Remarks` varchar(255) NOT NULL,
  `Entered_By_Nurse` int(20) NOT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_medications`
--

INSERT INTO `kardex_medications` (`Patient_ID`, `Date`, `Medication_Name`, `Medication_Remarks`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-10-15', 'Paracetamol', 'Pain relief, every 4 hours as needed.', 202409683, 'o', NULL),
(202411015, '2024-11-26', 'Amoxicillin', 'For bacterial infection, twice daily for 7 days.', 202409683, 'o', NULL),
(202411016, '2023-11-14', 'Ibuprofen', 'For fever, every 6 hours as needed.', 202409681, 'o', NULL),
(202411017, '2023-07-17', 'Cough Syrup', 'For dry cough, 10 ml three times daily.', 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_notes`
--

CREATE TABLE `kardex_notes` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Date` date NOT NULL,
  `Contraptions` text DEFAULT NULL,
  `Monitoring` text DEFAULT NULL,
  `Other_Endorsement` text DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_notes`
--

INSERT INTO `kardex_notes` (`Patient_ID`, `Date`, `Contraptions`, `Monitoring`, `Other_Endorsement`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-10-15', 'Oxygen mask', 'Vital signs every 4 hours', 'None', 202409683, 'o', NULL),
(202411015, '2024-11-26', 'IV drip (normal saline)', 'Blood pressure and heart rate every 2 hours', 'None', 202409683, 'o', NULL),
(202411016, '2023-11-14', 'Nebulizer', 'Oxygen saturation and respiration rate every 4 hours', 'None', 202409681, 'o', NULL),
(202411017, '2023-07-17', 'None', 'Temperature and pulse rate every 6 hours', 'None', 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_tbl`
--

CREATE TABLE `kardex_tbl` (
  `Patient_ID` int(20) NOT NULL,
  `Date` date NOT NULL,
  `Precautions` mediumtext NOT NULL,
  `Hospital_Num` varchar(25) NOT NULL,
  `Weight` float NOT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_tbl`
--

INSERT INTO `kardex_tbl` (`Patient_ID`, `Date`, `Precautions`, `Hospital_Num`, `Weight`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-10-15', 'Isolation precautions due to fever', '202409685', 58, 202409683, 'o', NULL),
(202411015, '2024-11-26', 'Contact precautions due to cold symptoms', '202409685', 72, 202409683, 'o', NULL),
(202411016, '2023-11-14', 'Standard precautions for headache', '202409685', 65, 202409681, 'o', NULL),
(202411017, '2023-07-17', 'Respiratory precautions due to cough', '202409685', 70, 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_vitals`
--

CREATE TABLE `kardex_vitals` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Vitals_Date` date NOT NULL,
  `Vitals_Category` int(11) DEFAULT NULL,
  `Other_Info` varchar(255) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_vitals`
--

INSERT INTO `kardex_vitals` (`Patient_ID`, `Vitals_Date`, `Vitals_Category`, `Other_Info`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-10-15', 1, 'Fever, Temperature monitoring', 202409683, 'o', NULL),
(202411015, '2024-11-26', 3, 'Cold, Pulse and respiratory rate monitoring', 202409683, 'o', NULL),
(202411016, '2023-11-14', 2, 'Headache, Blood pressure monitoring', 202409681, 'o', NULL),
(202411017, '2023-07-17', 4, 'Cough, Monitoring for heart rate', 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kardex_vitals_categories`
--

CREATE TABLE `kardex_vitals_categories` (
  `Vitals_Checks` int(11) NOT NULL,
  `Categories` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kardex_vitals_categories`
--

INSERT INTO `kardex_vitals_categories` (`Vitals_Checks`, `Categories`) VALUES
(1, 'Q1'),
(2, 'Q2'),
(3, 'Q4'),
(4, 'FHT');

-- --------------------------------------------------------

--
-- Table structure for table `medication_record_prn_response`
--

CREATE TABLE `medication_record_prn_response` (
  `Medication_PRN_ID` int(11) NOT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Ordered_By_Doctor` int(20) DEFAULT NULL,
  `PRN_10_6` varchar(20) DEFAULT NULL,
  `PRN_6_2` varchar(20) DEFAULT NULL,
  `PRN_2_10` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_record_prn_response`
--

INSERT INTO `medication_record_prn_response` (`Medication_PRN_ID`, `Patient_ID`, `Ordered_By_Doctor`, `PRN_10_6`, `PRN_6_2`, `PRN_2_10`) VALUES
(21, 202411014, 202409684, 'Done', 'Done, minor problem', 'Done');

-- --------------------------------------------------------

--
-- Table structure for table `medication_record_so_response`
--

CREATE TABLE `medication_record_so_response` (
  `Medication_SO_ID` int(11) NOT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Ordered_By_Doctor` int(20) DEFAULT NULL,
  `SO_10_6` varchar(20) DEFAULT NULL,
  `SO_6_2` varchar(20) DEFAULT NULL,
  `SO_2_10` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_record_so_response`
--

INSERT INTO `medication_record_so_response` (`Medication_SO_ID`, `Patient_ID`, `Ordered_By_Doctor`, `SO_10_6`, `SO_6_2`, `SO_2_10`) VALUES
(20, 202411014, 202409684, 'Completed', 'Completed', 'In progress');

-- --------------------------------------------------------

--
-- Table structure for table `medication_record_stat_response`
--

CREATE TABLE `medication_record_stat_response` (
  `Medication_STAT_ID` int(11) NOT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Ordered_By_Doctor` int(20) DEFAULT NULL,
  `STAT_10_6` varchar(20) DEFAULT NULL,
  `STAT_6_2` varchar(20) DEFAULT NULL,
  `STAT_2_10` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_record_stat_response`
--

INSERT INTO `medication_record_stat_response` (`Medication_STAT_ID`, `Patient_ID`, `Ordered_By_Doctor`, `STAT_10_6`, `STAT_6_2`, `STAT_2_10`) VALUES
(21, 202411014, 202409684, 'Done', 'In progress', 'Standby');

-- --------------------------------------------------------

--
-- Table structure for table `nurse_notes`
--

CREATE TABLE `nurse_notes` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Date_Time` datetime DEFAULT NULL,
  `Shift` varchar(255) DEFAULT NULL,
  `Focus` varchar(255) DEFAULT NULL,
  `Action_Response` text DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurse_notes`
--

INSERT INTO `nurse_notes` (`Patient_ID`, `Entered_By_Nurse`, `Date_Time`, `Shift`, `Focus`, `Action_Response`, `Status`, `Deletion_Date`) VALUES
(202411014, 202409683, '2025-01-02 08:00:00', 'AM', 'Fever, Temperature monitoring', 'Administered paracetamol; observed decrease in fever', 'o', NULL),
(202411015, 202409683, '2024-11-26 14:00:00', 'PM', 'Cold, Respiratory rate', 'Administered antihistamines; monitored respiratory rate, stable', 'o', NULL),
(202411016, 202409681, '2023-11-14 10:00:00', 'AM', 'Headache, Blood pressure monitoring', 'Administered pain relief; BP normalized after 30 minutes', 'o', NULL),
(202411017, 202409681, '2023-07-17 22:00:00', 'Night', 'Cough, Heart rate monitoring', 'Cough suppressant given; monitored heart rate, stable', 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nurse_sched`
--

CREATE TABLE `nurse_sched` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Day_Shift_Nurse_ID` int(20) DEFAULT NULL,
  `Day_Shift_Start` time DEFAULT NULL,
  `Day_Shift_End` time DEFAULT NULL,
  `Night_Shift_Nurse_ID` int(20) DEFAULT NULL,
  `Night_Shift_Start` time DEFAULT NULL,
  `Night_Shift_End` time DEFAULT NULL,
  `Entered_By_Nurse` int(11) NOT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nurse_sched`
--

INSERT INTO `nurse_sched` (`Patient_ID`, `Date`, `Day_Shift_Nurse_ID`, `Day_Shift_Start`, `Day_Shift_End`, `Night_Shift_Nurse_ID`, `Night_Shift_Start`, `Night_Shift_End`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-12-12', 202409683, '06:00:00', '18:00:00', 202409681, '18:00:00', '06:00:00', 202409682, 'o', NULL),
(202411015, '2024-12-14', 202409683, '06:00:00', '18:00:00', 202409681, '18:00:00', '06:00:00', 202409682, 'o', NULL),
(202411016, '2024-12-15', 202409683, '06:00:00', '18:00:00', 202409681, '18:00:00', '06:00:00', 202409682, 'o', NULL),
(202411017, '2024-12-12', 202409683, '06:00:00', '18:00:00', 202409681, '18:00:00', '06:00:00', 202409682, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `outpatient_info`
--

CREATE TABLE `outpatient_info` (
  `Outpatient_ID` int(20) NOT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Civil_Status` varchar(20) DEFAULT NULL,
  `Patient_Companion` varchar(20) DEFAULT NULL,
  `Relation_To_Patient` varchar(20) DEFAULT NULL,
  `Travel_History` varchar(5) DEFAULT NULL,
  `Travel_Location` varchar(30) DEFAULT NULL,
  `Travel_Date` date DEFAULT NULL,
  `Chief_Complain` text DEFAULT NULL,
  `History_of_Illness` text DEFAULT NULL,
  `Present_History` text DEFAULT NULL,
  `Blood_Pressure` varchar(10) DEFAULT NULL,
  `Temperature` double DEFAULT NULL,
  `Respiratory_Rate` int(11) DEFAULT NULL,
  `Pulse_Rate` int(11) DEFAULT NULL,
  `Weight` double DEFAULT NULL,
  `Height` double DEFAULT NULL,
  `FHT` int(11) DEFAULT NULL,
  `Pertinent_Findings` text DEFAULT NULL,
  `Impression_Diagnosis` text DEFAULT NULL,
  `Plan` text DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `outpatient_info`
--

INSERT INTO `outpatient_info` (`Outpatient_ID`, `Patient_ID`, `Civil_Status`, `Patient_Companion`, `Relation_To_Patient`, `Travel_History`, `Travel_Location`, `Travel_Date`, `Chief_Complain`, `History_of_Illness`, `Present_History`, `Blood_Pressure`, `Temperature`, `Respiratory_Rate`, `Pulse_Rate`, `Weight`, `Height`, `FHT`, `Pertinent_Findings`, `Impression_Diagnosis`, `Plan`, `Date`, `Entered_By_Nurse`) VALUES
(2, 202411018, 'Single', 'Maria Nguyen', 'Aunt', 'No', NULL, NULL, 'Sore Throat', '3-day sore throat', 'Mild swelling in throat area', '108/68', 37.4, 19, 75, 14, 95, NULL, 'Mild throat redness, no fever.', 'Pharyngitis', 'Prescribed throat lozenges and fluids.', '2024-10-01', 202409683),
(3, 202411019, 'Single', 'Mark Santos', 'Family Friend', 'Yes', 'Cebu City', '2024-11-05', 'Cold', '5-day runny nose', 'Nasal congestion and mild cough', '102/64', 38, 21, 79, 17, 100, NULL, 'Slight nasal discharge, no wheeze.', 'Upper Respiratory Infection', 'Prescribed antihistamines and rest.', '2024-11-15', 202409681);

-- --------------------------------------------------------

--
-- Table structure for table `patient_contacts`
--

CREATE TABLE `patient_contacts` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Mother_Name` varchar(255) DEFAULT NULL,
  `Mother_Contact` varchar(25) DEFAULT NULL,
  `Father_Name` varchar(255) DEFAULT NULL,
  `Father_Contact` varchar(25) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_contacts`
--

INSERT INTO `patient_contacts` (`Patient_ID`, `Mother_Name`, `Mother_Contact`, `Father_Name`, `Father_Contact`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, 'Sarah Johnson', '+63 912 345 6789', 'Robert Johnson', '+63 917 654 3210', 202409681, 'o', NULL),
(202411015, 'Maria Martinez', '+63 918 123 4567', 'Juan Martinez', '+63 922 345 6789', 202409683, 'o', NULL),
(202411016, 'Linda Smith\r\n', '+63 920 234 5678', 'Michael Smith', '+63 918 876 5432', 202409683, 'o', NULL),
(202411017, 'Jessica Brown', '+63 915 234 7890', 'Thomas Brown', '+63 920 456 1234', 202409681, 'o', NULL),
(202501001, 'asas', 'asa', 'asas', 'asas', 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_emergency_contact`
--

CREATE TABLE `patient_emergency_contact` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Emergency_Contact_Name` varchar(255) DEFAULT NULL,
  `Emergency_Contact` varchar(25) DEFAULT NULL,
  `Relation_to_Patient` varchar(255) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_emergency_contact`
--

INSERT INTO `patient_emergency_contact` (`Patient_ID`, `Emergency_Contact_Name`, `Emergency_Contact`, `Relation_to_Patient`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, 'Patricia Johnson', '+63 922 345 6789', 'Aunt', 202409681, 'o', NULL),
(202411015, 'Veronica Martinez', '+63 919 876 5432', 'Grandmother', 202409683, 'o', NULL),
(202411016, 'Rachel Smith', '+63 917 654 3210', 'Aunt', 202409683, 'o', NULL),
(202411017, 'Emily Brown', '+63 918 765 4321', 'Older Sister', 202409681, 'o', NULL),
(202501001, 'asasa', 'asas', 'asa', 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_info`
--

CREATE TABLE `patient_info` (
  `Patient_ID` int(20) NOT NULL,
  `Admission_Date` datetime DEFAULT NULL,
  `Patient_FName` varchar(30) DEFAULT NULL,
  `Patient_MName` varchar(30) NOT NULL,
  `Patient_LName` varchar(30) NOT NULL,
  `Patient_Type` varchar(20) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Sex` varchar(255) DEFAULT NULL,
  `Room_Num` int(11) DEFAULT NULL,
  `Street` varchar(50) NOT NULL,
  `House_Num` varchar(50) NOT NULL,
  `Subdivision` varchar(50) DEFAULT NULL,
  `Barangay` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Province` varchar(50) NOT NULL,
  `Birthplace` varchar(255) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `Attending_Physician` int(20) NOT NULL,
  `Admitting_Diagnosis` mediumtext DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL,
  `Discharge_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_info`
--

INSERT INTO `patient_info` (`Patient_ID`, `Admission_Date`, `Patient_FName`, `Patient_MName`, `Patient_LName`, `Patient_Type`, `Age`, `Sex`, `Room_Num`, `Street`, `House_Num`, `Subdivision`, `Barangay`, `City`, `Province`, `Birthplace`, `DoB`, `Attending_Physician`, `Admitting_Diagnosis`, `Entered_By_Nurse`, `Status`, `Deletion_Date`, `Discharge_Date`) VALUES
(202411014, '2024-10-15 14:57:45', 'Emily', '', 'Johnson', 'Inpatient', 4, 'Female', 208, 'Maple Lane', '123', 'Green Hills', 'Barangay 1', 'Cityville', 'Metro City', 'Cityville General', '2020-05-12', 202409684, 'Fever', 202409681, 'o', NULL, NULL),
(202411015, '2024-11-26 15:04:52', 'Liam', '', 'Martinez', 'Inpatient', 7, 'Male', 207, 'Oak Street', '456', NULL, 'Barangay 1', 'Cityville', 'Metro City', 'Townburg Medical', '2017-08-23', 202409685, 'Cold', 202409683, 'o', NULL, NULL),
(202411016, '2023-11-14 15:04:52', 'Ava', '', 'Smith', 'Inpatient', 6, 'Female', 208, 'Pine Road', '789', 'Maple Grove', 'Barangay 2', 'Villageton', 'Valley Province', 'Villageton Clinic', '2018-02-14', 202409684, 'Headache', 202409683, 'o', NULL, NULL),
(202411017, '2023-07-17 15:04:52', 'Noah', '', 'Brown', 'Inpatient', 3, 'Male', 208, 'Birch Avenue', '321', NULL, 'Barangay 2', 'Villageton', 'Valley Province', 'Metrotown Hospital', '2021-11-30', 202409685, 'Cough', 202409681, 'o', NULL, NULL),
(202411018, '2024-10-01 15:04:52', 'Sophia', '', 'Nguyen', 'Outpatient', 2, 'Female', NULL, 'Cedar Lane', '654', 'Hilltop Subdivision', 'Barangay 1', 'Cityville', 'Metro City', 'Urbancity Medical', '2022-04-18', 202409684, 'Sore Throat', 202409681, 'o', NULL, NULL),
(202411019, '2024-11-15 15:04:52', 'Benjamin', '', 'Garcia', 'Outpatient', 5, 'Male', NULL, 'Willow Way', '987', NULL, 'Barangay 2', 'Villageton', 'Valley Province', 'Countryside Health', '2019-09-10', 202409685, 'Cold', 202409683, 'o', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_info_notes`
--

CREATE TABLE `patient_info_notes` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Medical_History` text DEFAULT NULL,
  `Allergies` text DEFAULT NULL,
  `Current_Medication` text DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_info_notes`
--

INSERT INTO `patient_info_notes` (`Patient_ID`, `Medical_History`, `Allergies`, `Current_Medication`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, 'Asthma (Diagnosed at age 3)\r\nChickenpox (Had at age 6)', 'Penicillin (Severe reaction)', 'Salbutamol Inhaler (Used as needed for asthma)', 202409681, 'o', NULL),
(202411015, 'No significant history', 'Dust mites (Mild irritation)', 'Paracetamol (As needed for fever or headache)', 202409683, 'o', NULL),
(202411016, 'Migraines (Occasional)', 'Pollen (Seasonal sneezing and itching)', 'Ibuprofen (For headache and migraines)', 202409683, 'o', NULL),
(202411017, 'Eczema (Flare-ups in winter)', 'Shellfish (Mild allergic reaction)', 'Hydrocortisone Cream (For eczema flare-ups)', 202409681, 'o', NULL),
(202501001, 'asa', 'asa', 'asa', 202409681, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_intake`
--

CREATE TABLE `patient_intake` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` char(5) DEFAULT NULL,
  `Intake_Type` varchar(20) DEFAULT NULL,
  `Intake_Measure` decimal(5,2) DEFAULT NULL,
  `Intake_Remarks` text DEFAULT NULL,
  `Status` char(2) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_intake`
--

INSERT INTO `patient_intake` (`Patient_ID`, `Entered_By_Nurse`, `Date`, `Time`, `Intake_Type`, `Intake_Measure`, `Intake_Remarks`, `Status`, `Deletion_Date`) VALUES
(202411014, 202409683, '2024-11-26', 'AM', 'Oral', 2.10, 'None', 'o', NULL),
(202411014, 202409683, '2024-11-26', 'AM', 'Parental', 2.30, 'None', 'o', NULL),
(202411014, 202409683, '2024-11-26', 'AM', 'Other', 0.30, 'Small amount', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'PM', 'Oral', 2.80, 'N/A', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'PM', 'Parental', 1.80, 'N/A', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'PM', 'Other', 0.67, 'Small quantity', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'Night', 'Oral', 1.00, 'N/A', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'Night', 'Parental', 3.60, 'N/A', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'Night', 'Oral', 0.00, 'None taken', 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_lab_results`
--

CREATE TABLE `patient_lab_results` (
  `Lab_Result_ID` int(11) NOT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Entered_By_Nurse` varchar(30) DEFAULT NULL,
  `File_Name` varchar(255) DEFAULT NULL,
  `Upload_Date` datetime DEFAULT NULL,
  `Image_Location` varchar(255) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_lab_results`
--

INSERT INTO `patient_lab_results` (`Lab_Result_ID`, `Patient_ID`, `Entered_By_Nurse`, `File_Name`, `Upload_Date`, `Image_Location`, `Status`, `Deletion_Date`) VALUES
(28, 202411014, 'Ron Weasley', '1732764745.jpg', '2024-11-28 04:32:25', '../DocuCare/lab/1732764745.jpg', 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_output`
--

CREATE TABLE `patient_output` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` char(5) DEFAULT NULL,
  `Output_Type` varchar(20) DEFAULT NULL,
  `Output_Measure` decimal(5,2) DEFAULT NULL,
  `Output_Remarks` text DEFAULT NULL,
  `Status` char(2) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_output`
--

INSERT INTO `patient_output` (`Patient_ID`, `Entered_By_Nurse`, `Date`, `Time`, `Output_Type`, `Output_Measure`, `Output_Remarks`, `Status`, `Deletion_Date`) VALUES
(202411014, 202409683, '2024-11-26', 'AM', 'Urine', 1.20, 'None', 'o', NULL),
(202411014, 202409683, '2024-11-26', 'AM', 'Stool', 3.60, 'None', 'o', NULL),
(202411014, 202409683, '2024-11-26', 'AM', 'Drainage', 0.00, 'None', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'PM', 'Urine', 2.60, 'N/A', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'PM', 'Stool', 2.50, 'N/A', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'PM', 'Drainage', 1.30, 'N/A', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'Night', 'Urine', 0.80, 'N/A', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'Night', 'Stool', 4.10, 'N/A', 'o', NULL),
(202411014, 202409681, '2024-11-26', 'Night', 'Drainage', 0.00, 'N/A', 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_scan_results`
--

CREATE TABLE `patient_scan_results` (
  `Scan_Result_ID` int(11) NOT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Entered_By_Nurse` varchar(30) DEFAULT NULL,
  `File_Name` varchar(255) DEFAULT NULL,
  `Upload_Date` datetime DEFAULT NULL,
  `Image_Location` varchar(255) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_scan_results`
--

INSERT INTO `patient_scan_results` (`Scan_Result_ID`, `Patient_ID`, `Entered_By_Nurse`, `File_Name`, `Upload_Date`, `Image_Location`, `Status`, `Deletion_Date`) VALUES
(12, 202411014, '202409683', '1732764764.jpg', '2024-11-28 04:32:44', '../DocuCare/scan/1732764764.jpg', 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_vital_signs`
--

CREATE TABLE `patient_vital_signs` (
  `Patient_ID` int(20) NOT NULL,
  `Vitals_DateTime` datetime NOT NULL,
  `Blood_Pressure` varchar(10) NOT NULL,
  `Respiratory_Rate` int(11) NOT NULL,
  `Pulse_Rate` int(11) NOT NULL,
  `Temperature` double NOT NULL,
  `Oxygen_Lvl` int(11) NOT NULL,
  `Weight` double NOT NULL,
  `Pain_Scale` int(11) NOT NULL,
  `Intervention` mediumtext NOT NULL,
  `Entered_By_Nurse` int(20) NOT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_vital_signs`
--

INSERT INTO `patient_vital_signs` (`Patient_ID`, `Vitals_DateTime`, `Blood_Pressure`, `Respiratory_Rate`, `Pulse_Rate`, `Temperature`, `Oxygen_Lvl`, `Weight`, `Pain_Scale`, `Intervention`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-12-12 07:19:04', '118/76', 16, 75, 37.5, 98, 58, 4, 'Administered ibuprofen 400mg for fever and discomfort.', 202409683, 'o', NULL),
(202411014, '2024-12-11 07:19:04', '122/78', 18, 80, 38, 97, 72, 6, 'Administered paracetamol 500mg for fever and body aches.', 202409683, 'o', NULL),
(202411014, '2024-12-10 07:19:04', '110/70', 14, 70, 36.8, 99, 60, 3, 'Administered fluids (saline) and continued monitoring.', 202409681, 'o', NULL),
(202411014, '2024-12-09 07:19:04', '120/75', 17, 78, 37, 99, 68, 2, 'Administered cough syrup and continued monitoring.', 202409681, 'o', NULL),
(202411014, '2024-12-08 07:19:04', '112/82', 85, 75, 36.5, 100, 58, 1, 'None', 202409683, 'o', NULL),
(202411014, '2024-12-07 07:19:04', '110/84', 21, 79, 37.6, 97, 17, 6, 'asfasfafa', 202409683, 'o', NULL),
(202411014, '2024-12-06 07:19:04', '100/80', 14, 70, 65, 99, 65, 3, 'bnmbnmbn', 202409683, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `Room_Number` int(11) NOT NULL,
  `Room_Type` varchar(20) DEFAULT NULL,
  `Bed_Capacity` int(11) DEFAULT NULL,
  `Available_Beds` int(11) DEFAULT NULL,
  `Room_Status` varchar(20) DEFAULT NULL,
  `Scheduled_Maintenance` datetime DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`Room_Number`, `Room_Type`, `Bed_Capacity`, `Available_Beds`, `Room_Status`, `Scheduled_Maintenance`, `Status`, `Deletion_Date`) VALUES
(206, 'Single', 1, 0, 'Occupied', '2024-11-27 12:11:47', 'o', NULL),
(207, 'Double', 2, 1, 'Available', NULL, 'o', NULL),
(208, 'Double', 2, 0, 'Occupied', '2024-11-29 12:11:47', 'o', NULL),
(209, 'Single', 1, 1, 'Available', NULL, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms_information`
--

CREATE TABLE `rooms_information` (
  `Room_Number` int(11) DEFAULT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Day_Shift_Nurse_ID` int(20) DEFAULT NULL,
  `Night_Shift_Nurse_ID` int(20) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms_information`
--

INSERT INTO `rooms_information` (`Room_Number`, `Patient_ID`, `Day_Shift_Nurse_ID`, `Night_Shift_Nurse_ID`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(206, 202411014, 202409683, 202409681, 202409682, 'o', NULL),
(207, 202411015, 202409683, 202409681, 202409682, 'o', NULL),
(208, 202411016, 202409683, 202409681, 202409682, 'o', NULL),
(208, 202411017, 202409683, 202409681, 202409682, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms_maintenance`
--

CREATE TABLE `rooms_maintenance` (
  `Room_Number` int(11) DEFAULT NULL,
  `Scheduled_Maintenance` datetime DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms_maintenance`
--

INSERT INTO `rooms_maintenance` (`Room_Number`, `Scheduled_Maintenance`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(206, '2024-11-27 12:11:47', 202409682, 'o', NULL),
(208, '2024-11-29 12:11:47', 202409682, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `standing_order_response`
--

CREATE TABLE `standing_order_response` (
  `Standing_Order_ID` int(11) NOT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Order_Start_Date` date DEFAULT NULL,
  `Order_Discontinued_Date` date DEFAULT NULL,
  `Remarks` text DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `standing_order_response`
--

INSERT INTO `standing_order_response` (`Standing_Order_ID`, `Patient_ID`, `Order_Start_Date`, `Order_Discontinued_Date`, `Remarks`, `Entered_By_Nurse`) VALUES
(34, 202411014, '2024-11-26', '2024-11-27', 'Done without any problems', 202409683);

-- --------------------------------------------------------

--
-- Table structure for table `tpr_initial_vitals`
--

CREATE TABLE `tpr_initial_vitals` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Initial_Vitals_Date` datetime DEFAULT NULL,
  `Blood_Pressure` varchar(10) DEFAULT NULL,
  `Pulse_Rate` int(11) DEFAULT NULL,
  `Respiratory_Rate` int(11) DEFAULT NULL,
  `Temperature` double DEFAULT NULL,
  `Weight` double DEFAULT NULL,
  `IE` double DEFAULT NULL,
  `FHT` int(11) DEFAULT NULL,
  `Entered_By_Nurse` int(11) NOT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tpr_initial_vitals`
--

INSERT INTO `tpr_initial_vitals` (`Patient_ID`, `Initial_Vitals_Date`, `Blood_Pressure`, `Pulse_Rate`, `Respiratory_Rate`, `Temperature`, `Weight`, `IE`, `FHT`, `Entered_By_Nurse`, `Status`, `Deletion_Date`) VALUES
(202411014, '2024-11-26 08:00:00', '118/76', 75, 16, 37.5, 58, NULL, NULL, 202409683, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tpr_vital_signs`
--

CREATE TABLE `tpr_vital_signs` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Vitals_Date` date DEFAULT NULL,
  `Day_Number` int(11) DEFAULT NULL,
  `Vitals_Time_Check` time NOT NULL,
  `Temperature` decimal(5,2) NOT NULL,
  `Pulse` int(11) NOT NULL,
  `Respiration` int(11) NOT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tpr_vital_signs`
--

INSERT INTO `tpr_vital_signs` (`Patient_ID`, `Entered_By_Nurse`, `Vitals_Date`, `Day_Number`, `Vitals_Time_Check`, `Temperature`, `Pulse`, `Respiration`, `Status`, `Deletion_Date`) VALUES
(202411014, 202409681, '2024-11-26', 1, '00:00:00', 37.50, 75, 16, 'o', NULL),
(202411014, 202409681, '2024-11-26', 1, '04:00:00', 37.60, 76, 17, 'o', NULL),
(202411014, 202409681, '2024-11-26', 1, '08:00:00', 37.60, 76, 17, 'o', NULL),
(202411014, 202409683, '2024-11-26', 1, '12:00:00', 37.70, 78, 18, 'o', NULL),
(202411014, 202409683, '2024-11-26', 1, '16:00:00', 37.40, 74, 16, 'o', NULL),
(202411014, 202409681, '2024-11-26', 1, '20:00:00', 37.60, 75, 17, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tpr_vital_signs_output`
--

CREATE TABLE `tpr_vital_signs_output` (
  `Patient_ID` int(20) DEFAULT NULL,
  `Entered_By_Nurse` int(20) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Output_Time_Check` time NOT NULL,
  `Blood_Pressure` varchar(7) NOT NULL,
  `Urine` varchar(255) NOT NULL,
  `Stool` varchar(255) NOT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tpr_vital_signs_output`
--

INSERT INTO `tpr_vital_signs_output` (`Patient_ID`, `Entered_By_Nurse`, `Date`, `Output_Time_Check`, `Blood_Pressure`, `Urine`, `Stool`, `Status`, `Deletion_Date`) VALUES
(202411014, 202409681, '2024-11-26', '00:00:00', '120/80', '500 ml', 'N/A', 'o', NULL),
(202411014, 202409683, '2024-11-26', '16:00:00', '125/85', '600 ml', 'N/A', 'o', NULL),
(202411014, 202409681, '2024-11-26', '20:00:00', '118/79', '550 ml', 'N/A', 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `User_ID` int(11) NOT NULL,
  `User_FName` varchar(30) NOT NULL,
  `User_MName` varchar(30) NOT NULL,
  `User_LName` varchar(30) NOT NULL,
  `Contact_Num` varchar(25) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Position` varchar(25) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Account_Created` date DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`User_ID`, `User_FName`, `User_MName`, `User_LName`, `Contact_Num`, `Department`, `Position`, `Email`, `Password`, `Account_Created`, `Status`, `Deletion_Date`) VALUES
(202409681, 'Neville', '', 'Longbottom', '09592855832', 'Pediatrics', 'Nurse 1', 'Neville@gmail.com', '1111', '2024-11-26', 'o', NULL),
(202409682, 'Severus', '', 'Snape', '09582746124', 'Pediatrics', 'Nurse 2', 'Snape@gmail.com', '1234', '2024-11-27', 'o', NULL),
(202409683, 'Ron', '', 'Weasley', '09948512751', 'Pediatrics', 'Nurse 1', 'Ron@gmail.com', '1111', '2024-11-24', 'o', NULL),
(202409684, 'Albus', '', 'Dumbledore', '07847385731', 'Pediatrics', 'Doctor', 'Albus@gmail.com', '4321', '2024-11-01', 'o', NULL),
(202409685, 'Minerva', '', 'McGonagall', '09987683219', 'Pediatrics', 'Doctor', 'Minerva@gmail.com', '4321', '2024-11-13', 'o', NULL),
(202409686, 'Tom', '', 'Riddle', '09968673295', 'Pediatrics', 'Admin', 'tom@gmail.com', '7890', '2024-10-01', 'o', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ivfr_fast_drip`
--
ALTER TABLE `ivfr_fast_drip`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `ivfr_iv`
--
ALTER TABLE `ivfr_iv`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `ivfr_side_drips`
--
ALTER TABLE `ivfr_side_drips`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_diagnostics`
--
ALTER TABLE `kardex_diagnostics`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Diagnostics_Category` (`Diagnostics_Category`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_diagnostics_categories`
--
ALTER TABLE `kardex_diagnostics_categories`
  ADD PRIMARY KEY (`Diagnostics_Checks`);

--
-- Indexes for table `kardex_diet`
--
ALTER TABLE `kardex_diet`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Diet_Category` (`Diet_Category`),
  ADD KEY `kardex_diet_ibfk_3` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_diet_categories`
--
ALTER TABLE `kardex_diet_categories`
  ADD PRIMARY KEY (`Diet_Checks`);

--
-- Indexes for table `kardex_diet_last_meal`
--
ALTER TABLE `kardex_diet_last_meal`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_drips_transfusion`
--
ALTER TABLE `kardex_drips_transfusion`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_endorsements`
--
ALTER TABLE `kardex_endorsements`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_io`
--
ALTER TABLE `kardex_io`
  ADD KEY `IO_Category` (`IO_Category`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_io_categories`
--
ALTER TABLE `kardex_io_categories`
  ADD PRIMARY KEY (`IO_Checks`);

--
-- Indexes for table `kardex_iv`
--
ALTER TABLE `kardex_iv`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_medications`
--
ALTER TABLE `kardex_medications`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_notes`
--
ALTER TABLE `kardex_notes`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_tbl`
--
ALTER TABLE `kardex_tbl`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_vitals`
--
ALTER TABLE `kardex_vitals`
  ADD KEY `Vitals_Category` (`Vitals_Category`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `kardex_vitals_categories`
--
ALTER TABLE `kardex_vitals_categories`
  ADD PRIMARY KEY (`Vitals_Checks`);

--
-- Indexes for table `medication_record_prn_response`
--
ALTER TABLE `medication_record_prn_response`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Ordered_By_Doctor` (`Ordered_By_Doctor`),
  ADD KEY `Medication_PRN_ID` (`Medication_PRN_ID`);

--
-- Indexes for table `medication_record_so_response`
--
ALTER TABLE `medication_record_so_response`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Ordered_By_Doctor` (`Ordered_By_Doctor`),
  ADD KEY `Medication_SO_ID` (`Medication_SO_ID`);

--
-- Indexes for table `medication_record_stat_response`
--
ALTER TABLE `medication_record_stat_response`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Ordered_By_Doctor` (`Ordered_By_Doctor`),
  ADD KEY `Medication_STAT_ID` (`Medication_STAT_ID`);

--
-- Indexes for table `nurse_notes`
--
ALTER TABLE `nurse_notes`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `nurse_sched`
--
ALTER TABLE `nurse_sched`
  ADD KEY `Day_Shift_Nurse_ID` (`Day_Shift_Nurse_ID`),
  ADD KEY `Night_Shift_Nurse_ID` (`Night_Shift_Nurse_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `outpatient_info`
--
ALTER TABLE `outpatient_info`
  ADD PRIMARY KEY (`Outpatient_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `patient_contacts`
--
ALTER TABLE `patient_contacts`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `patient_emergency_contact`
--
ALTER TABLE `patient_emergency_contact`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `patient_info`
--
ALTER TABLE `patient_info`
  ADD PRIMARY KEY (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`),
  ADD KEY `Room_Num` (`Room_Num`),
  ADD KEY `Attending_Physician` (`Attending_Physician`);

--
-- Indexes for table `patient_info_notes`
--
ALTER TABLE `patient_info_notes`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `patient_intake`
--
ALTER TABLE `patient_intake`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `patient_lab_results`
--
ALTER TABLE `patient_lab_results`
  ADD PRIMARY KEY (`Lab_Result_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `patient_output`
--
ALTER TABLE `patient_output`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `patient_scan_results`
--
ALTER TABLE `patient_scan_results`
  ADD PRIMARY KEY (`Scan_Result_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indexes for table `patient_vital_signs`
--
ALTER TABLE `patient_vital_signs`
  ADD KEY `vitals_tbl_ibfk_1` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`Room_Number`);

--
-- Indexes for table `rooms_information`
--
ALTER TABLE `rooms_information`
  ADD KEY `Room_Number` (`Room_Number`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Day_Shift_Nurse_ID` (`Day_Shift_Nurse_ID`),
  ADD KEY `Night_Shift_Nurse_ID` (`Night_Shift_Nurse_ID`),
  ADD KEY `fk_entered_by_nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `rooms_maintenance`
--
ALTER TABLE `rooms_maintenance`
  ADD KEY `Room_Number` (`Room_Number`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `standing_order_response`
--
ALTER TABLE `standing_order_response`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`),
  ADD KEY `Standing_Order_ID` (`Standing_Order_ID`);

--
-- Indexes for table `tpr_initial_vitals`
--
ALTER TABLE `tpr_initial_vitals`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `tpr_vital_signs`
--
ALTER TABLE `tpr_vital_signs`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `tpr_vital_signs_output`
--
ALTER TABLE `tpr_vital_signs_output`
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Entered_By_Nurse` (`Entered_By_Nurse`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `outpatient_info`
--
ALTER TABLE `outpatient_info`
  MODIFY `Outpatient_ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient_info`
--
ALTER TABLE `patient_info`
  MODIFY `Patient_ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202501002;

--
-- AUTO_INCREMENT for table `patient_lab_results`
--
ALTER TABLE `patient_lab_results`
  MODIFY `Lab_Result_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `patient_scan_results`
--
ALTER TABLE `patient_scan_results`
  MODIFY `Scan_Result_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202409687;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ivfr_fast_drip`
--
ALTER TABLE `ivfr_fast_drip`
  ADD CONSTRAINT `ivfr_fast_drip_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `ivfr_fast_drip_ibfk_2` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `ivfr_iv`
--
ALTER TABLE `ivfr_iv`
  ADD CONSTRAINT `ivfr_iv_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `ivfr_iv_ibfk_2` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `ivfr_side_drips`
--
ALTER TABLE `ivfr_side_drips`
  ADD CONSTRAINT `ivfr_side_drips_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `ivfr_side_drips_ibfk_2` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `kardex_diagnostics`
--
ALTER TABLE `kardex_diagnostics`
  ADD CONSTRAINT `kardex_diagnostics_ibfk_2` FOREIGN KEY (`Diagnostics_Category`) REFERENCES `kardex_diagnostics_categories` (`Diagnostics_Checks`),
  ADD CONSTRAINT `kardex_diagnostics_ibfk_3` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `kardex_diagnostics_ibfk_4` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `kardex_diet`
--
ALTER TABLE `kardex_diet`
  ADD CONSTRAINT `kardex_diet_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `kardex_diet_ibfk_2` FOREIGN KEY (`Diet_Category`) REFERENCES `kardex_diet_categories` (`Diet_Checks`),
  ADD CONSTRAINT `kardex_diet_ibfk_3` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `kardex_diet_last_meal`
--
ALTER TABLE `kardex_diet_last_meal`
  ADD CONSTRAINT `kardex_diet_last_meal_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `kardex_diet_last_meal_ibfk_2` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `kardex_drips_transfusion`
--
ALTER TABLE `kardex_drips_transfusion`
  ADD CONSTRAINT `kardex_drips_transfusion_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `kardex_drips_transfusion_ibfk_2` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `kardex_endorsements`
--
ALTER TABLE `kardex_endorsements`
  ADD CONSTRAINT `kardex_endorsements_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `kardex_endorsements_ibfk_2` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `kardex_io`
--
ALTER TABLE `kardex_io`
  ADD CONSTRAINT `kardex_io_ibfk_2` FOREIGN KEY (`IO_Category`) REFERENCES `kardex_io_categories` (`IO_Checks`),
  ADD CONSTRAINT `kardex_io_ibfk_3` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `kardex_io_ibfk_4` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `kardex_iv`
--
ALTER TABLE `kardex_iv`
  ADD CONSTRAINT `kardex_iv_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `kardex_iv_ibfk_2` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `kardex_medications`
--
ALTER TABLE `kardex_medications`
  ADD CONSTRAINT `kardex_medications_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `kardex_medications_ibfk_2` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `kardex_notes`
--
ALTER TABLE `kardex_notes`
  ADD CONSTRAINT `kardex_notes_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `kardex_notes_ibfk_2` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `kardex_tbl`
--
ALTER TABLE `kardex_tbl`
  ADD CONSTRAINT `kardex_tbl_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `kardex_tbl_ibfk_2` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);

--
-- Constraints for table `kardex_vitals`
--
ALTER TABLE `kardex_vitals`
  ADD CONSTRAINT `kardex_vitals_ibfk_2` FOREIGN KEY (`Vitals_Category`) REFERENCES `kardex_vitals_categories` (`Vitals_Checks`),
  ADD CONSTRAINT `kardex_vitals_ibfk_3` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_info` (`Patient_ID`),
  ADD CONSTRAINT `kardex_vitals_ibfk_4` FOREIGN KEY (`Entered_By_Nurse`) REFERENCES `user_tbl` (`User_ID`);
--
-- Database: `docudata_doctors`
--
CREATE DATABASE IF NOT EXISTS `docudata_doctors` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `docudata_doctors`;

-- --------------------------------------------------------

--
-- Table structure for table `doctors_order`
--

CREATE TABLE `doctors_order` (
  `Doctor_Order_ID` int(11) NOT NULL,
  `Ordered_by_Doctor` int(20) DEFAULT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Doctor_Order_Date` datetime DEFAULT NULL,
  `Observation_Progress` text DEFAULT NULL,
  `Doctor_Order` text DEFAULT NULL,
  `Current_Status` varchar(1) DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors_order`
--

INSERT INTO `doctors_order` (`Doctor_Order_ID`, `Ordered_by_Doctor`, `Patient_ID`, `Doctor_Order_Date`, `Observation_Progress`, `Doctor_Order`, `Current_Status`, `Status`, `Deletion_Date`) VALUES
(20, 202409684, 202411014, '2024-11-26 20:17:00', 'Patient was checked at 08:00 AM. Temperature was 37.1°C, pulse 76 bpm, blood pressure 120/80 mmHg. Pain level was 3/10 after taking Tylenol. IV fluids were increased to 500ml, and oxygen was given at 2L. At 03:00 PM, oxygen saturation improved from 89% to 94%. The patient felt more comfortable after being repositioned at 06:00 PM.', 'Administer 500 ml of Normal Saline IV every 8 hours. Monitor blood pressure every 4 hours. Increase oxygen flow to 3L/min if oxygen saturation drops below 90%. Ensure the patient remains in a semi-reclining position. Schedule follow-up X-ray for tomorrow morning at 9:00 AM.', NULL, 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors_order_categories`
--

CREATE TABLE `doctors_order_categories` (
  `Status` varchar(1) NOT NULL,
  `Status_Categories` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors_order_categories`
--

INSERT INTO `doctors_order_categories` (`Status`, `Status_Categories`) VALUES
('A', 'Administered / Started'),
('C', 'Carried Out'),
('D', 'Discontinued'),
('E', 'Endorsed'),
('R', 'Requested');

-- --------------------------------------------------------

--
-- Table structure for table `medication_record_prn`
--

CREATE TABLE `medication_record_prn` (
  `Medication_PRN_ID` int(11) NOT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Ordered_By_Doctor` int(20) DEFAULT NULL,
  `Medication_PRN_Date` date DEFAULT NULL,
  `PRN_Medication` text DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_record_prn`
--

INSERT INTO `medication_record_prn` (`Medication_PRN_ID`, `Patient_ID`, `Ordered_By_Doctor`, `Medication_PRN_Date`, `PRN_Medication`, `Status`, `Deletion_Date`) VALUES
(21, 202411014, 202409684, '2024-11-26', 'Give 2mg lorazepam every 4 hours for anxiety.', 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medication_record_so`
--

CREATE TABLE `medication_record_so` (
  `Medication_SO_ID` int(11) NOT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Ordered_By_Doctor` int(20) DEFAULT NULL,
  `Medication_SO_Date` date DEFAULT NULL,
  `Hospital_Day` varchar(10) DEFAULT NULL,
  `Standing_Order` text DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_record_so`
--

INSERT INTO `medication_record_so` (`Medication_SO_ID`, `Patient_ID`, `Ordered_By_Doctor`, `Medication_SO_Date`, `Hospital_Day`, `Standing_Order`, `Status`, `Deletion_Date`) VALUES
(20, 202411014, 202409684, '2024-11-26', 'Tuesday', 'Administer 1L Normal Saline IV every 12 hours.', 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medication_record_stat`
--

CREATE TABLE `medication_record_stat` (
  `Medication_STAT_ID` int(11) NOT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Ordered_By_Doctor` int(20) DEFAULT NULL,
  `Medication_STAT_Date` date DEFAULT NULL,
  `STAT_Order` text DEFAULT NULL,
  `Status` char(3) DEFAULT NULL,
  `Deletion_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_record_stat`
--

INSERT INTO `medication_record_stat` (`Medication_STAT_ID`, `Patient_ID`, `Ordered_By_Doctor`, `Medication_STAT_Date`, `STAT_Order`, `Status`, `Deletion_Date`) VALUES
(21, 202411014, 202409684, '2024-11-26', 'Administer 50mg diphenhydramine IV for allergic reaction.', 'o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `standing_order`
--

CREATE TABLE `standing_order` (
  `Standing_Order_ID` int(11) NOT NULL,
  `Patient_ID` int(20) DEFAULT NULL,
  `Ordered_by_Doctor` int(20) DEFAULT NULL,
  `Date_Ordered` date DEFAULT NULL,
  `Order` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `standing_order`
--

INSERT INTO `standing_order` (`Standing_Order_ID`, `Patient_ID`, `Ordered_by_Doctor`, `Date_Ordered`, `Order`) VALUES
(34, 202411014, 202409684, '2024-11-26', '1L Normal Saline IV, 50mg Diphenhydramine IV, 2mg Lorazepam PRN for anxiety, 500ml Diet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors_order`
--
ALTER TABLE `doctors_order`
  ADD PRIMARY KEY (`Doctor_Order_ID`),
  ADD KEY `Ordered_by_Doctor` (`Ordered_by_Doctor`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Current_Status` (`Current_Status`);

--
-- Indexes for table `doctors_order_categories`
--
ALTER TABLE `doctors_order_categories`
  ADD PRIMARY KEY (`Status`);

--
-- Indexes for table `medication_record_prn`
--
ALTER TABLE `medication_record_prn`
  ADD PRIMARY KEY (`Medication_PRN_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Ordered_By_Doctor` (`Ordered_By_Doctor`);

--
-- Indexes for table `medication_record_so`
--
ALTER TABLE `medication_record_so`
  ADD PRIMARY KEY (`Medication_SO_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Ordered_By_Doctor` (`Ordered_By_Doctor`);

--
-- Indexes for table `medication_record_stat`
--
ALTER TABLE `medication_record_stat`
  ADD PRIMARY KEY (`Medication_STAT_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Ordered_By_Doctor` (`Ordered_By_Doctor`);

--
-- Indexes for table `standing_order`
--
ALTER TABLE `standing_order`
  ADD PRIMARY KEY (`Standing_Order_ID`),
  ADD KEY `Ordered_by_Doctor` (`Ordered_by_Doctor`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors_order`
--
ALTER TABLE `doctors_order`
  MODIFY `Doctor_Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `medication_record_prn`
--
ALTER TABLE `medication_record_prn`
  MODIFY `Medication_PRN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `medication_record_so`
--
ALTER TABLE `medication_record_so`
  MODIFY `Medication_SO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `medication_record_stat`
--
ALTER TABLE `medication_record_stat`
  MODIFY `Medication_STAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `standing_order`
--
ALTER TABLE `standing_order`
  MODIFY `Standing_Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctors_order`
--
ALTER TABLE `doctors_order`
  ADD CONSTRAINT `doctors_order_ibfk_1` FOREIGN KEY (`Ordered_by_Doctor`) REFERENCES `docudata`.`user_tbl` (`User_ID`),
  ADD CONSTRAINT `doctors_order_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `docudata`.`patient_info` (`Patient_ID`),
  ADD CONSTRAINT `doctors_order_ibfk_3` FOREIGN KEY (`Current_Status`) REFERENCES `doctors_order_categories` (`Status`);

--
-- Constraints for table `medication_record_prn`
--
ALTER TABLE `medication_record_prn`
  ADD CONSTRAINT `medication_record_prn_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `docudata`.`patient_info` (`Patient_ID`),
  ADD CONSTRAINT `medication_record_prn_ibfk_2` FOREIGN KEY (`Ordered_By_Doctor`) REFERENCES `docudata`.`user_tbl` (`User_ID`),
  ADD CONSTRAINT `medication_record_prn_ibfk_3` FOREIGN KEY (`Ordered_By_Doctor`) REFERENCES `docudata`.`user_tbl` (`User_ID`),
  ADD CONSTRAINT `medication_record_prn_ibfk_4` FOREIGN KEY (`Ordered_By_Doctor`) REFERENCES `docudata`.`user_tbl` (`User_ID`);

--
-- Constraints for table `medication_record_so`
--
ALTER TABLE `medication_record_so`
  ADD CONSTRAINT `medication_record_so_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `docudata`.`patient_info` (`Patient_ID`),
  ADD CONSTRAINT `medication_record_so_ibfk_2` FOREIGN KEY (`Ordered_By_Doctor`) REFERENCES `docudata`.`user_tbl` (`User_ID`);

--
-- Constraints for table `medication_record_stat`
--
ALTER TABLE `medication_record_stat`
  ADD CONSTRAINT `medication_record_stat_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `docudata`.`patient_info` (`Patient_ID`),
  ADD CONSTRAINT `medication_record_stat_ibfk_2` FOREIGN KEY (`Ordered_By_Doctor`) REFERENCES `docudata`.`user_tbl` (`User_ID`);

--
-- Constraints for table `standing_order`
--
ALTER TABLE `standing_order`
  ADD CONSTRAINT `standing_order_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `docudata`.`patient_info` (`Patient_ID`),
  ADD CONSTRAINT `standing_order_ibfk_2` FOREIGN KEY (`Ordered_by_Doctor`) REFERENCES `docudata`.`user_tbl` (`User_ID`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"docudata\",\"table\":\"tpr_vital_signs_output\"},{\"db\":\"docudata\",\"table\":\"tpr_initial_vitals\"},{\"db\":\"docudata\",\"table\":\"tpr_vital_signs\"},{\"db\":\"docudata\",\"table\":\"nurse_notes\"},{\"db\":\"docudata\",\"table\":\"patient_vital_signs\"},{\"db\":\"docudata\",\"table\":\"patient_info\"},{\"db\":\"docudata_doctors\",\"table\":\"doctors_order\"},{\"db\":\"docudata\",\"table\":\"user_tbl\"},{\"db\":\"docudata\",\"table\":\"nurse_sched\"},{\"db\":\"docudata\",\"table\":\"rooms_maintenance\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-10-25 09:53:57', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":333}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
