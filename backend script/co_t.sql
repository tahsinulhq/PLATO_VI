-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2021 at 09:12 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plato-6`
--

-- --------------------------------------------------------

--
-- Table structure for table `co_t`
--

CREATE TABLE `co_t` (
  `COID` int(11) NOT NULL,
  `CONum` varchar(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `PLOID` int(11) DEFAULT NULL,
  `CourseID` varchar(11) DEFAULT NULL,
  `COThreshold` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `co_t`
--

INSERT INTO `co_t` (`COID`, `CONum`, `Description`, `PLOID`, `CourseID`, `COThreshold`) VALUES
(1, 'CO1', 'Understand the database applications starting from conceptual\ndesign using data models diagram (ERD)', 0, 'CSE303 ', 40),
(2, 'CO2', 'Basic understanding of data access structures and comparison\nbetween those structures, Determine the', 0, '', 40),
(3, 'CO3', 'Solid foundation on the database design using query language SQL\n\nand design of user interfaces.', 0, '', 40),
(4, 'CO4', 'Implement user interfaces and database using appropriate tools.', 0, '', 40);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `co_t`
--
ALTER TABLE `co_t`
  ADD PRIMARY KEY (`COID`),
  ADD KEY `FK_PLOCO` (`PLOID`),
  ADD KEY `FK_CourseCO` (`CourseID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `co_t`
--
ALTER TABLE `co_t`
  MODIFY `COID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
