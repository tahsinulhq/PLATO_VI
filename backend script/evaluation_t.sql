-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2021 at 08:08 AM
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
-- Table structure for table `evaluation_t`
--

CREATE TABLE `evaluation_t` (
  `StudentID` int(11) NOT NULL,
  `SectionID` int(11) NOT NULL,
  `EvalID` int(11) NOT NULL,
  `AssessmentName` varchar(40) NOT NULL,
  `ObtainedMarks` int(11) NOT NULL,
  `AssessmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evaluation_t`
--

INSERT INTO `evaluation_t` (`StudentID`, `SectionID`, `EvalID`, `AssessmentName`, `ObtainedMarks`, `AssessmentID`) VALUES
(1821557, 5, 129, 'Midterm', 12, 1),
(1821557, 5, 130, 'Midterm', 19, 2),
(1821557, 5, 131, 'Midterm', 21, 3),
(1821557, 5, 132, 'Midterm', 10, 4),
(1821557, 5, 133, 'Final', 18, 5),
(1821557, 5, 134, 'Final', 14, 6),
(1821557, 5, 135, 'Final', 14, 7),
(1821557, 5, 136, 'Final', 44, 8),
(1821557, 5, 137, 'Project', 26, 9),
(1821557, 3, 138, 'Midterm', 9, 10),
(1821557, 3, 139, 'Midterm', 15, 11),
(1821557, 3, 140, 'Midterm', 30, 12),
(1821557, 3, 141, 'Midterm', 13, 13),
(1821557, 3, 142, 'Midterm', 26, 14),
(1821557, 3, 143, 'Midterm', 10, 15),
(1821557, 3, 144, 'Final', 15, 16),
(1821557, 3, 145, 'Final', 15, 17),
(1821557, 3, 146, 'Final ', 15, 18),
(1821557, 3, 147, 'Final', 49, 19),
(1821778, 5, 148, 'Midterm', 13, 1),
(1821778, 5, 149, 'Midterm', 20, 2),
(1821778, 5, 150, 'Midterm', 22, 3),
(1821778, 5, 151, 'Midterm', 13, 4),
(1821778, 5, 152, 'Final', 19, 5),
(1821778, 5, 153, 'Final', 15, 6),
(1821778, 5, 154, 'Final', 15, 7),
(1821778, 5, 155, 'Final', 45, 8),
(1821778, 5, 156, 'Project', 30, 9),
(1797789, 5, 157, 'Midterm', 11, 1),
(1797789, 5, 158, 'Midterm', 25, 2),
(1797789, 5, 159, 'Midterm', 19, 3),
(1797789, 5, 160, 'Midterm', 19, 4),
(1797789, 5, 161, 'Final', 20, 5),
(1797789, 5, 162, 'Final', 13, 6),
(1797789, 5, 163, 'Final', 14, 7),
(1797789, 5, 164, 'Final', 49, 8),
(1797789, 5, 165, 'Project', 21, 9),
(1789481, 5, 166, 'Midterm', 5, 1),
(1789481, 5, 167, 'Midterm', 5, 2),
(1789481, 5, 168, 'Midterm', 6, 3),
(1789481, 5, 169, 'Midterm', 7, 4),
(1789481, 5, 170, 'Final', 6, 5),
(1789481, 5, 171, 'Final', 5, 6),
(1789481, 5, 172, 'Final', 2, 7),
(1789481, 5, 173, 'Final', 11, 8),
(1789481, 5, 174, 'Project', 11, 9),
(1773384, 5, 175, 'Midterm', 8, 1),
(1773384, 5, 176, 'Midterm', 6, 2),
(1773384, 5, 177, 'Midterm', 9, 3),
(1773384, 5, 178, 'Midterm', 4, 4),
(1773384, 5, 179, 'Final', 20, 5),
(1773384, 5, 180, 'Final', 15, 6),
(1773384, 5, 181, 'Final', 15, 7),
(1773384, 5, 182, 'Final', 50, 8),
(1773384, 5, 183, 'Project', 15, 9),
(1762565, 5, 184, 'Midterm', 24, 1),
(1762565, 5, 185, 'Midterm', 24, 2),
(1762565, 5, 186, 'Midterm', 28, 3),
(1762565, 5, 187, 'Midterm', 18, 4),
(1762565, 5, 188, 'Final', 10, 5),
(1762565, 5, 189, 'Final', 11, 6),
(1762565, 5, 190, 'Final', 10, 7),
(1762565, 5, 191, 'Final', 11, 8),
(1762565, 5, 192, 'Project', 28, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `evaluation_t`
--
ALTER TABLE `evaluation_t`
  ADD PRIMARY KEY (`EvalID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `FK_AssessmentEvaluation` (`AssessmentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `evaluation_t`
--
ALTER TABLE `evaluation_t`
  MODIFY `EvalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `evaluation_t`
--
ALTER TABLE `evaluation_t`
  ADD CONSTRAINT `FK_AssessmentEvaluation` FOREIGN KEY (`AssessmentID`) REFERENCES `assessment_t` (`AssessmentID`),
  ADD CONSTRAINT `evaluation_t_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student_t` (`StudentID`),
  ADD CONSTRAINT `evaluation_t_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student_t` (`StudentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
