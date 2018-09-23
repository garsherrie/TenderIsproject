-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2018 at 08:27 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projecttender`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `TenderID` int(254) NOT NULL,
  `IDNo` varchar(254) NOT NULL,
  `Submission date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`TenderID`, `IDNo`, `Submission date`) VALUES
(1, '99460', '2018-09-16 21:25:51');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DeptID` int(254) NOT NULL,
  `Name` varchar(254) NOT NULL,
  `DeptMan` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DeptID`, `Name`, `DeptMan`) VALUES
(1, 'Languages', ''),
(2, 'Mathematics', ''),
(3, 'Humanities', ''),
(4, 'Sciences', ''),
(5, 'Technical', ''),
(6, 'Economics', ''),
(7, 'Business', ''),
(8, 'Laboratory', ''),
(9, 'Administration', ''),
(10, 'Finance', ''),
(11, 'Guidance and Counselling', '');

-- --------------------------------------------------------

--
-- Table structure for table `heads`
--

CREATE TABLE `heads` (
  `HeadID` varchar(254) NOT NULL,
  `Name` varchar(254) NOT NULL,
  `Email` varchar(254) NOT NULL,
  `Department` varchar(254) NOT NULL,
  `Phone_Num` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `heads`
--

INSERT INTO `heads` (`HeadID`, `Name`, `Email`, `Department`, `Phone_Num`) VALUES
('26565', 'Davidson Kamau Ridure', 'davidson.ridure@site.com', 'Laboratory', 712303090),
('34545', 'Peninah Waswa Kimilili', 'kimilili.waswa@site.com', 'Administration', 713454567);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Idnum` varchar(254) NOT NULL,
  `Status` varchar(254) NOT NULL,
  `Email` varchar(254) NOT NULL,
  `Password` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`Idnum`, `Status`, `Email`, `Password`) VALUES
('100446', 'tenderer', 'ian.odundo@site.com', 'OdundoIan'),
('26565', 'department manager', 'davidson.ridure@site.com', 'RidureDavid'),
('34545', 'department manager', 'kimilili.waswa@site.com', 'WaswaPenn'),
('99460', 'tenderer', 'munyui.julie@site.com', 'MunyuiJulie');

-- --------------------------------------------------------

--
-- Table structure for table `tenderers`
--

CREATE TABLE `tenderers` (
  `No` int(11) NOT NULL,
  `Name` varchar(254) NOT NULL,
  `IDNo` varchar(254) NOT NULL,
  `Phone` varchar(254) NOT NULL,
  `Email` varchar(254) NOT NULL,
  `Address` varchar(254) NOT NULL,
  `POBox` varchar(254) NOT NULL,
  `Password` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenderers`
--

INSERT INTO `tenderers` (`No`, `Name`, `IDNo`, `Phone`, `Email`, `Address`, `POBox`, `Password`) VALUES
(1, 'Ian Otieno Odundo', '100446', '0713009333', 'ian.odundo@site.com', '', '', 'OdundoIan'),
(2, 'Julie Munyui', '99460', '0797652842', 'munyui.julie@site.com', '', '', 'MunyuiJulie');

-- --------------------------------------------------------

--
-- Table structure for table `tenders`
--

CREATE TABLE `tenders` (
  `TenderID` int(254) NOT NULL,
  `Name` varchar(254) NOT NULL,
  `Department` varchar(254) NOT NULL,
  `Requirements` varchar(254) NOT NULL,
  `Enquiries` varchar(254) NOT NULL,
  `Deadtime` time(6) NOT NULL,
  `Deaddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenders`
--

INSERT INTO `tenders` (`TenderID`, `Name`, `Department`, `Requirements`, `Enquiries`, `Deadtime`, `Deaddate`) VALUES
(1, 'Construction Materials', 'Administration', 'Supply of 10 bags of cement and 4 tonnes of sand.', '071300933', '12:30:00.000000', '2018-09-18'),
(2, 'Call for Stationery', 'Languages', 'Supply of 2000 A4 square ruled notebooks.', '0719653520', '00:00:00.000000', '2018-09-30'),
(22, 'Maize', 'Administration', '100 90kg bags of maize', '079723456263', '00:00:00.000000', '0000-00-00'),
(24, 'Books', 'Sciences', 'KMF 200 copies', '0734567338i8', '00:20:18.000000', '0000-00-00'),
(25, 'Pencils', 'Economics', 'Beautiful pencils', '0832456478', '00:00:00.000000', '2018-09-09'),
(27, 'Thermometer', 'Laboratory', '50 thermometers ', '0712303090', '00:00:00.000000', '2018-09-09'),
(28, 'Projectors', 'Administration', 'we need 5 projectors', '0713454567', '00:00:00.000000', '2018-09-09'),
(29, 'Burretes', 'Laboratory', '20 burretes', '0712303090', '00:00:00.000000', '2018-09-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD KEY `TenderID` (`TenderID`,`IDNo`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DeptID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `heads`
--
ALTER TABLE `heads`
  ADD KEY `HeadID` (`HeadID`),
  ADD KEY `Department` (`Department`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Idnum`);

--
-- Indexes for table `tenderers`
--
ALTER TABLE `tenderers`
  ADD UNIQUE KEY `Num` (`No`),
  ADD UNIQUE KEY `IDNo_2` (`IDNo`),
  ADD KEY `No` (`No`),
  ADD KEY `IDNo` (`IDNo`);

--
-- Indexes for table `tenders`
--
ALTER TABLE `tenders`
  ADD PRIMARY KEY (`TenderID`),
  ADD KEY `Department` (`Department`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `DeptID` int(254) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tenderers`
--
ALTER TABLE `tenderers`
  MODIFY `No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tenders`
--
ALTER TABLE `tenders`
  MODIFY `TenderID` int(254) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`TenderID`) REFERENCES `tenders` (`TenderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `heads`
--
ALTER TABLE `heads`
  ADD CONSTRAINT `heads_ibfk_1` FOREIGN KEY (`HeadID`) REFERENCES `login` (`Idnum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `heads_ibfk_2` FOREIGN KEY (`Department`) REFERENCES `departments` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tenderers`
--
ALTER TABLE `tenderers`
  ADD CONSTRAINT `tenderers_ibfk_1` FOREIGN KEY (`IDNo`) REFERENCES `login` (`Idnum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tenders`
--
ALTER TABLE `tenders`
  ADD CONSTRAINT `tenders_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `departments` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
