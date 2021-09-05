-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2021 at 01:24 PM
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
-- Database: `plato6_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `graduate_student_t`
--

CREATE TABLE `graduate_student_t` (
  `GraduationYear` date DEFAULT NULL,
  `StudentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `graduate_student_t`
--

INSERT INTO `graduate_student_t` (`GraduationYear`, `StudentID`) VALUES
('0000-00-00', 0),
('0000-00-00', 0),
('0000-00-00', 0),
('0000-00-00', 0),
('0000-00-00', 0),
('0000-00-00', 0),
('0000-00-00', 0),
('0000-00-00', 0),
('0000-00-00', 0),
('0000-00-00', 0),
('0000-00-00', 0),
('0000-00-00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `graduate_student_t`
--
ALTER TABLE `graduate_student_t`
  ADD KEY `FK_GStudent` (`StudentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `graduate_student_t`
--
ALTER TABLE `graduate_student_t`
  ADD CONSTRAINT `FK_GStudent` FOREIGN KEY (`StudentID`) REFERENCES `student_t` (`StudentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
