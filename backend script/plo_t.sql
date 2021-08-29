-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2021 at 09:11 PM
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
-- Table structure for table `plo_t`
--

CREATE TABLE `plo_t` (
  `PLOID` int(11) NOT NULL,
  `PLONum` varchar(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `ProgramID` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plo_t`
--

INSERT INTO `plo_t` (`PLOID`, `PLONum`, `Description`, `ProgramID`) VALUES
(1, 'PO1', 'Knowledge', 'BSc.CSE'),
(2, 'PO2', 'Requirement Analysis', ''),
(3, 'PO3', 'problem analysis', ''),
(4, 'PO4', 'Design', ''),
(5, 'PO5', 'Problem Solving', ''),
(6, 'PO6', 'Implementation', ''),
(7, 'PO7', 'Experiment and Analysis', ''),
(8, 'PO8', 'Community Engagement & Engg.', ''),
(9, 'PO9', 'Teamwork', ''),
(10, 'PO10', 'Communication', ''),
(11, 'PO11', 'Self-Moticated', ''),
(12, 'PO12', 'Ethics', ''),
(13, 'PO13', 'Process Management ', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `plo_t`
--
ALTER TABLE `plo_t`
  ADD PRIMARY KEY (`PLOID`),
  ADD KEY `FK_ProgramPLO` (`ProgramID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `plo_t`
--
ALTER TABLE `plo_t`
  MODIFY `PLOID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
