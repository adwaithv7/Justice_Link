-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2023 at 01:06 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crimedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(200) DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'admin', 'admin', 8745498447, 'admin@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2022-01-25 12:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `ID` int(10) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `CatDes` mediumtext DEFAULT NULL,
  `AddDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`ID`, `CategoryName`, `CatDes`, `AddDate`) VALUES
(1, 'Personal Crimes', 'Personal Crimes – “Offenses against the Person”: These are crimes that result in physical or mental harm to another person. Personal crimes include:\r\nAssault \r\nBattery\r\nFalse Imprisonment\r\nKidnapping\r\nHomicide – crimes such as first and second degree murder, involuntary manslaughter, and vehicular homicide\r\nRape, statutory rape, sexual assault, and other offenses of a sexual nature', '2023-02-26 06:34:00'),
(2, 'Property Crimes', 'Property Crimes – “Offenses against Property”: These are crimes that do not necessarily involve harm to another person. Instead, they involve an interference with another person’s right to use or enjoy their property. Property crimes include:\r\nLarceny (theft)\r\nRobbery (theft by force) – Note: this is also considered a personal crime since it results in physical and mental harm.\r\nBurglary (penalties for burglary)\r\nArson\r\nEmbezzlement\r\nForgery\r\nFalse pretenses\r\nReceipt of stolen goods.', '2023-02-25 18:30:00'),
(3, 'Inchoate Crimes ', 'Inchoate Crimes – “Inchoate” translates into “incomplete”, meaning crimes that were begun, but not completed. This requires that a person take a substantial step to complete a crime, as opposed to just “intend” to commit a crime. Inchoate crimes include:\r\nAttempt – any crime that is attempted like “attempted robbery”\r\nSolicitation\r\nConspiracy', '2023-03-01 06:35:08'),
(4, 'Statutory Crimes ', 'Statutory Crimes – A violation of a specific state or federal statute and can involve either property offenses or personal offense. Statutory crimes include:\r\nAlcohol-related crimes such as drunk driving (DUI)\r\nSelling alcohol to a minor.', '2023-03-01 18:30:00'),
(5, 'sexual assault', 'illegal sexual contact that usually involves force upon a person without consent or is inflicted upon a person who is incapable of giving consent (as because of age or physical or mental incapacity) or who places the assailant (such as a doctor) in a position of trust or authority', '2023-03-04 06:47:42');

-- --------------------------------------------------------

--
-- Table structure for table `tblcriminal`
--

CREATE TABLE `tblcriminal` (
  `ID` int(10) NOT NULL,
  `CriminalID` varchar(50) DEFAULT NULL,
  `PoliceID` int(10) DEFAULT NULL,
  `PoliceStationId` int(11) DEFAULT NULL,
  `PoliceStation` varchar(200) DEFAULT NULL,
  `CatName` varchar(100) DEFAULT NULL,
  `CrimeDate` varchar(200) DEFAULT NULL,
  `CrimeTime` varchar(200) DEFAULT NULL,
  `Prison` varchar(200) DEFAULT NULL,
  `Court` varchar(200) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `ContactNumber` bigint(10) DEFAULT NULL,
  `Height` varchar(50) DEFAULT NULL,
  `Weight` varchar(50) DEFAULT NULL,
  `DateofBirth` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Address` mediumtext DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(200) DEFAULT NULL,
  `Country` varchar(200) DEFAULT NULL,
  `Zipcode` int(10) DEFAULT NULL,
  `Photo` varchar(200) DEFAULT NULL,
  `RecordDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblcriminal`
--

INSERT INTO `tblcriminal` (`ID`, `CriminalID`, `PoliceID`, `PoliceStationId`, `PoliceStation`, `CatName`, `CrimeDate`, `CrimeTime`, `Prison`, `Court`, `Name`, `ContactNumber`, `Height`, `Weight`, `DateofBirth`, `Email`, `Address`, `City`, `State`, `Country`, `Zipcode`, `Photo`, `RecordDate`) VALUES
(1, '442128753', 3, 4, 'Rajnagar Extension GZBUP', 'Personal Crimes', '2023-02-28', '15:18', 'Central Jail', 'Supreme Court', 'AJay Yaadv', 4563178952, '168cm', '80Kg', '2001-01-12', '', 'NA', 'Ghaziabad', 'up', 'India', 201017, '659baba4dd9c875610423e1339f1e6491678607126.png', '2023-03-12 07:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `tblfir`
--

CREATE TABLE `tblfir` (
  `ID` int(10) NOT NULL,
  `FIRNo` varchar(120) DEFAULT NULL,
  `UserID` int(50) DEFAULT NULL,
  `PoliceStationId` int(11) DEFAULT NULL,
  `PoliceStation` varchar(200) DEFAULT NULL,
  `CrimeType` varchar(200) DEFAULT NULL,
  `NameAccused` varchar(200) DEFAULT NULL,
  `NameApplicants` varchar(200) DEFAULT NULL,
  `ParentageApplicant` varchar(200) DEFAULT NULL,
  `ContactNumber` bigint(10) DEFAULT NULL,
  `Address` mediumtext DEFAULT NULL,
  `RelationAccused` varchar(200) DEFAULT NULL,
  `PurposeofFIR` varchar(200) DEFAULT NULL,
  `DateofFIR` timestamp NULL DEFAULT current_timestamp(),
  `Remark` varchar(200) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `RemarkDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `SectionofLaw` varchar(200) NOT NULL,
  `InvestigationOfficer` varchar(200) NOT NULL,
  `InvestigationDetail` mediumtext NOT NULL,
  `ChargesheetDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblfir`
--

INSERT INTO `tblfir` (`ID`, `FIRNo`, `UserID`, `PoliceStationId`, `PoliceStation`, `CrimeType`, `NameAccused`, `NameApplicants`, `ParentageApplicant`, `ContactNumber`, `Address`, `RelationAccused`, `PurposeofFIR`, `DateofFIR`, `Remark`, `Status`, `RemarkDate`, `SectionofLaw`, `InvestigationOfficer`, `InvestigationDetail`, `ChargesheetDate`) VALUES
(1, '482448703', 1, 1, 'Central Delhi Police Stations', 'Property Crimes', 'Rahul Kumar', 'Amit Kumar', 'NA', 1425365821, 'A 123 Block C Central Delhi India', 'No Relation', 'Fir Against Property Crime', '2023-03-10 14:32:54', NULL, NULL, '2023-03-12 03:19:28', '', '', '', '2023-03-12 03:19:28'),
(10, '828531740', 2, 4, 'Rajnagar Extension GZBUP', 'Property Crimes', 'Amit Singh', 'Atul Kumar Singh', 'NA', 4563214102, 'A 123 XYZ Society Rajnagar Extension GZB', 'Brother', 'Property  case', '2023-03-12 07:31:31', 'NA', 'Charge Sheet Completed', '2023-03-12 07:43:43', 'SECTION', 'Amit Singh', 'Investigation Detail,  Investigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation DetailInvestigation Detail', '2023-03-12 07:43:43'),
(11, '594903510', 2, 4, 'Rajnagar Extension GZBUP', 'Personal Crimes', 'John Doe', 'Atul Kumar', 'NA', 452631452, 'A 1234 XYZ Society Rajnnagar Ext. GZB', 'No Relation', 'Personal Crime', '2023-03-12 11:41:58', 'Fir is approved', 'Approved', '2023-03-12 11:42:54', '', '', '', '2023-03-12 11:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `tblpolice`
--

CREATE TABLE `tblpolice` (
  `ID` int(10) NOT NULL,
  `PoliceStationId` int(11) DEFAULT NULL,
  `PoliceStationName` varchar(200) DEFAULT NULL,
  `PID` varchar(20) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Address` mediumtext DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `JoiningDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpolice`
--

INSERT INTO `tblpolice` (`ID`, `PoliceStationId`, `PoliceStationName`, `PID`, `Name`, `MobileNumber`, `Email`, `Address`, `Password`, `JoiningDate`) VALUES
(1, 1, 'Central Delhi Police Stations', 'CNTD01', 'Rahul Kumar', 1425369852, 'rk@test.com', '12/1 Central Delhi 110001', 'f925916e2754e5e03f75dd58a5733251', '2023-02-28 18:01:23'),
(2, 2, 'Laxmi Nagar East Delhi Police Stations', 'LNPSD123', 'Amit Gupta', 7895410236, 'amitk@test.com', '2321 Gali No2 Laxmi Nagar New Delhi 110092', 'f925916e2754e5e03f75dd58a5733251', '2023-02-28 18:03:28'),
(3, 4, 'Rajnagar Extension GZBUP', 'GZB123', 'Avinash Kr. Singh', 1425365410, 'avinash@gmail.in', 'Plot no 1234 main road Rajnagar extension GZB UP-201017', 'f925916e2754e5e03f75dd58a5733251', '2023-03-12 07:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblpolicestation`
--

CREATE TABLE `tblpolicestation` (
  `id` int(11) NOT NULL,
  `PoliceStationName` varchar(255) DEFAULT NULL,
  `PoliceStationCode` varchar(200) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpolicestation`
--

INSERT INTO `tblpolicestation` (`id`, `PoliceStationName`, `PoliceStationCode`, `PostingDate`) VALUES
(1, 'Central Delhi Police Stations', 'CDPS01', '2023-02-28 17:58:02'),
(2, 'Laxmi Nagar East Delhi Police Stations', 'LND09', '2023-02-28 17:58:57'),
(3, 'Rajeev Chowk Police Station New Delhi', 'RCPSD212', '2023-02-28 18:00:01'),
(4, 'Rajnagar Extension GZBUP', 'GZBUP0111', '2023-03-12 07:27:46');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FullName`, `MobileNumber`, `Email`, `Password`, `RegDate`) VALUES
(1, 'Anuj Kumar', 1425362514, 'ak@test.com', 'f925916e2754e5e03f75dd58a5733251', '2023-03-10 14:17:22'),
(2, 'Atul Kumar Singh', 4562145230, 'atl123@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2023-03-12 07:30:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcriminal`
--
ALTER TABLE `tblcriminal`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblfir`
--
ALTER TABLE `tblfir`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpolice`
--
ALTER TABLE `tblpolice`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpolicestation`
--
ALTER TABLE `tblpolicestation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblcriminal`
--
ALTER TABLE `tblcriminal`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblfir`
--
ALTER TABLE `tblfir`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblpolice`
--
ALTER TABLE `tblpolice`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblpolicestation`
--
ALTER TABLE `tblpolicestation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
