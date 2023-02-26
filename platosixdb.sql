-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2023 at 09:00 PM
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
-- Database: `platosixdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment_t`
--

CREATE TABLE `assessment_t` (
  `AssessmentID` int(11) NOT NULL,
  `SectionID` int(11) DEFAULT NULL,
  `COID` int(11) DEFAULT NULL,
  `PersonID` int(11) DEFAULT NULL,
  `QuestionNum` varchar(11) DEFAULT NULL,
  `AssessmentName` varchar(100) DEFAULT NULL,
  `Marks` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assessment_t`
--

INSERT INTO `assessment_t` (`AssessmentID`, `SectionID`, `COID`, `PersonID`, `QuestionNum`, `AssessmentName`, `Marks`) VALUES
(1, 5, 1, 1, 'Q1', 'Midterm', 25),
(2, 3, 5, 0, 'Q2', 'Midterm', 25),
(3, 3, 5, 0, 'Q3', 'Midterm', 30),
(4, 5, 3, 0, 'Q4', 'Midterm', 20),
(5, 5, 1, 0, 'Q1', 'Final', 20),
(6, 5, 1, 0, 'Q2', 'Final', 15),
(7, 5, 2, 0, 'Q3', 'Final', 15),
(8, 5, 3, 0, 'Q4', 'Final', 50),
(9, 5, 4, 0, 'Q1', 'Project', 30),
(10, 3, 5, 0, 'Q1', 'Midterm', 25),
(11, 3, 1, 0, 'Q2', 'Midterm', 25),
(12, 3, 1, 0, 'Q3', 'Midterm', 30),
(13, 3, 2, 0, 'Q4', 'Midterm', 20),
(14, 3, 1, 0, 'Q5', 'Midterm', 30),
(15, 3, 1, 0, 'Q6', 'Midterm', 20),
(16, 3, 1, 0, 'Q1', 'Final', 20),
(17, 3, 1, 0, 'Q2', 'Final', 15),
(18, 3, 2, 0, 'Q3', 'Final ', 15),
(19, 3, 3, 0, 'Q4', 'Final', 50),
(20, 7, 1, 0, 'Q1', 'Midterm', 25),
(22, 7, 2, 0, 'Q2', 'Midterm', 25),
(23, 7, 3, 0, 'Q3', 'Midterm', 25),
(24, 7, 4, 0, 'Q4', 'Midterm', 25),
(25, 7, 1, 0, 'Q1', 'Final', 25),
(26, 7, 2, 0, 'Q2', 'Final', 25),
(27, 7, 3, 0, 'Q3', 'Final', 25),
(28, 7, 4, 0, 'Q4', 'Final', 25),
(29, 7, 5, 0, 'Q1', 'Project', 25),
(30, 13, 1, 0, 'Q1', 'Midterm', 25),
(31, 13, 2, 0, 'Q2', 'Midterm', 25),
(32, 13, 3, 0, 'Q3', 'Midterm', 25),
(33, 13, 4, 0, 'Q4', 'Midterm', 25),
(34, 13, 1, 0, 'Q1', 'Final', 25),
(35, 13, 2, 0, 'Q2', 'Final', 25),
(36, 13, 3, 0, 'Q3', 'Final', 25),
(37, 13, 4, 0, 'Q4', 'Final', 25),
(38, 13, 5, 0, 'Q1', 'Project', 25),
(39, 12, 1, 0, 'Q1', 'Midterm', 25),
(40, 12, 2, 0, 'Q2', 'Midterm', 25),
(41, 12, 3, 0, 'Q3', 'Midterm', 25),
(42, 12, 4, 0, 'Q4', 'Midterm', 25),
(43, 12, 1, 0, 'Q1', 'Final', 25),
(44, 12, 2, 0, 'Q2', 'Final', 25),
(45, 12, 3, 0, 'Q3', 'Final', 25),
(46, 12, 4, 0, 'Q4', 'Final', 25),
(47, 12, 5, 0, 'Q1', 'Project', 25);

-- --------------------------------------------------------

--
-- Table structure for table `course_t`
--

CREATE TABLE `course_t` (
  `CourseID` varchar(11) NOT NULL,
  `CourseName` varchar(40) DEFAULT NULL,
  `NoOfCredits` int(11) DEFAULT NULL,
  `CourseType` varchar(40) DEFAULT NULL,
  `ProgramID` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_t`
--

INSERT INTO `course_t` (`CourseID`, `CourseName`, `NoOfCredits`, `CourseType`, `ProgramID`) VALUES
('CSE101', 'Introduction to Computer Programming Lan', 3, 'Foundation courses', 'BSc.CSE'),
('CSE101L', 'Labwork based on CSE101', 1, 'Foundation courses', 'BSc.CSE'),
('CSE104', 'Electrical Circuit Analysis', 3, 'Core Courses', 'BSc.CSE'),
('CSE104L ', 'Lab work based on CSE 104 ', 1, 'Core Courses', 'BSc.CSE'),
('CSE203 ', 'Data Structure', 3, 'Core Courses', 'BSc.CSE'),
('CSE203L', 'Labwork based on CSE203', 1, 'Core Courses', 'BSc.CSE'),
('CSE210 ', 'Electronics I', 3, 'Core Courses', 'BSc.CSE'),
('CSE210L', 'Labwork based on CSE210', 1, 'Core Courses', 'BSc.CSE'),
('CSE303', 'Database Management', 3, 'Core Courses', 'BSc.CSE'),
('CSE303L', 'Labwork based on CSE303', 1, 'Core Courses', 'BSc.CSE'),
('CSE316', 'Data Communication & Computer Networks', 3, 'Core Courses', 'BSc.CSE'),
('CSE316L', 'Labwork based on CSE316', 1, 'Core Courses', 'BSc.CSE'),
('CSE421', 'Machine learning', 3, 'Major Course', 'BSc.CSE'),
('CSE425 ', 'Artificial Intelligence', 3, 'Major Course', 'BSc.CSE');

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
(1, 'CO1', 'Understand the database applications starting from conceptual\r\ndesign using data models diagram (ERD', 2, 'CSE303 ', 40),
(2, 'CO2', 'Basic understanding of data access structures and comparison\r\nbetween those structures, Determine th', 3, 'CSE303', 40),
(3, 'CO3', 'Solid foundation on the database design using query language SQL\r\n\r\nand design of user interfaces.', 4, 'CSE303', 40),
(4, 'CO4', 'Implement user interfaces and database using appropriate tools.', 6, 'CSE303', 40),
(5, 'CO1', 'Understand the database applications', 1, 'CSE101', 40),
(6, 'CO2', 'Something something', 2, 'CSE101', 40),
(7, 'CO3', '', 3, 'CSE101', 40),
(8, 'CO4', '', 4, 'CSE101', 40),
(9, 'CO1', '', 6, 'CSE425', 40),
(10, 'CO2', '', 3, 'CSE425', 40),
(11, 'CO3', '', 8, 'CSE425', 40),
(12, 'CO4', '', 1, 'CSE425', 40),
(13, 'CO1', '', 2, 'CSE421', 40),
(14, 'CO2', '', 5, 'CSE421', 40),
(15, 'CO3', '', 6, 'CSE421', 40),
(16, 'CO4', '', 8, 'CSE421', 40),
(17, 'CO2', NULL, 5, 'CSE303', 40);

-- --------------------------------------------------------

--
-- Table structure for table `department_t`
--

CREATE TABLE `department_t` (
  `DepartmentID` varchar(11) NOT NULL,
  `DepartmentName` varchar(40) DEFAULT NULL,
  `SchoolID` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department_t`
--

INSERT INTO `department_t` (`DepartmentID`, `DepartmentName`, `SchoolID`) VALUES
('ACN', 'Accounting', 'SBE'),
('CSE', 'Computer Science and Engineering', 'SETS'),
('ECN', 'Economics', 'SBE'),
('EEE', 'Electrical and Electronic Engineering ', 'SETS'),
('ENV', 'Environmental Sciences & Management', 'SELS'),
('FIN', 'Finance', 'SBE'),
('HRM', 'Human Resource Management', 'SBE'),
('MIS', 'Management Information System', 'SBE'),
('MKT', 'Marketing', 'SBE'),
('PH', 'Public Health', 'SPPH'),
('PHARM', 'Pharmacy', 'SPPH'),
('PS', 'Physical Sciences', 'SETS');

-- --------------------------------------------------------

--
-- Table structure for table `employee_t`
--

CREATE TABLE `employee_t` (
  `PersonID` int(11) NOT NULL,
  `employeeID` int(11) NOT NULL,
  `DateHired` date DEFAULT NULL,
  `Salary` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_t`
--

CREATE TABLE `evaluation_t` (
  `EvalID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `SectionID` int(11) NOT NULL,
  `AssessmentName` varchar(40) NOT NULL,
  `ObtainedMarks` int(11) NOT NULL,
  `AssessmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evaluation_t`
--

INSERT INTO `evaluation_t` (`EvalID`, `StudentID`, `SectionID`, `AssessmentName`, `ObtainedMarks`, `AssessmentID`) VALUES
(129, 1821557, 5, 'Midterm', 12, 1),
(130, 1821557, 5, 'Midterm', 19, 2),
(131, 1821557, 5, 'Midterm', 21, 3),
(132, 1821557, 5, 'Midterm', 10, 4),
(133, 1821557, 5, 'Final', 18, 5),
(134, 1821557, 5, 'Final', 14, 6),
(135, 1821557, 5, 'Final', 14, 7),
(136, 1821557, 5, 'Final', 44, 8),
(137, 1821557, 5, 'Project', 26, 9),
(138, 1821557, 3, 'Midterm', 9, 10),
(139, 1821557, 3, 'Midterm', 15, 11),
(140, 1821557, 3, 'Midterm', 30, 12),
(141, 1821557, 3, 'Midterm', 13, 13),
(142, 1821557, 3, 'Midterm', 26, 14),
(143, 1821557, 3, 'Midterm', 10, 15),
(144, 1821557, 3, 'Final', 15, 16),
(145, 1821557, 3, 'Final', 15, 17),
(146, 1821557, 3, 'Final ', 15, 18),
(147, 1821557, 3, 'Final', 49, 19),
(148, 1821778, 8, 'Midterm', 13, 1),
(149, 1821778, 8, 'Midterm', 20, 2),
(150, 1821778, 8, 'Midterm', 22, 3),
(151, 1821778, 8, 'Midterm', 13, 4),
(152, 1821778, 8, 'Final', 19, 5),
(153, 1821778, 8, 'Final', 15, 6),
(154, 1821778, 8, 'Final', 15, 7),
(155, 1821778, 8, 'Final', 45, 8),
(156, 1821778, 8, 'Project', 30, 9),
(157, 1797789, 5, 'Midterm', 11, 1),
(158, 1797789, 3, 'Midterm', 25, 2),
(159, 1797789, 3, 'Midterm', 19, 3),
(160, 1797789, 5, 'Midterm', 19, 4),
(161, 1797789, 5, 'Final', 20, 5),
(162, 1797789, 5, 'Final', 13, 6),
(163, 1797789, 5, 'Final', 14, 7),
(164, 1797789, 5, 'Final', 49, 8),
(165, 1797789, 5, 'Project', 21, 9),
(166, 1789481, 5, 'Midterm', 5, 1),
(167, 1789481, 3, 'Midterm', 5, 2),
(168, 1789481, 3, 'Midterm', 6, 3),
(169, 1789481, 5, 'Midterm', 7, 4),
(170, 1789481, 5, 'Final', 6, 5),
(171, 1789481, 5, 'Final', 5, 6),
(172, 1789481, 5, 'Final', 2, 7),
(173, 1789481, 5, 'Final', 11, 8),
(174, 1789481, 5, 'Project', 11, 9),
(175, 1773384, 5, 'Midterm', 8, 1),
(176, 1773384, 3, 'Midterm', 6, 2),
(177, 1773384, 3, 'Midterm', 9, 3),
(178, 1773384, 5, 'Midterm', 4, 4),
(179, 1773384, 5, 'Final', 20, 5),
(180, 1773384, 5, 'Final', 15, 6),
(181, 1773384, 5, 'Final', 15, 7),
(182, 1773384, 5, 'Final', 50, 8),
(183, 1773384, 5, 'Project', 15, 9),
(184, 1762565, 5, 'Midterm', 24, 1),
(185, 1762565, 5, 'Midterm', 24, 2),
(186, 1762565, 5, 'Midterm', 28, 3),
(187, 1762565, 5, 'Midterm', 18, 4),
(188, 1762565, 5, 'Final', 10, 5),
(189, 1762565, 5, 'Final', 11, 6),
(190, 1762565, 5, 'Final', 10, 7),
(191, 1762565, 5, 'Final', 11, 8),
(192, 1762565, 5, 'Project', 28, 9),
(193, 1821545, 5, '', 25, 1),
(626, 1579288, 8, 'midterm', 0, 1),
(627, 1528882, 8, 'midterm', 15, 1),
(628, 1653725, 8, 'midterm', 0, 1),
(629, 1625654, 8, 'midterm', 5, 1),
(630, 1669953, 10, 'midterm', 0, 1),
(631, 1665555, 10, 'midterm', 10, 1),
(632, 1616161, 10, 'midterm', 0, 1),
(633, 1633554, 10, 'midterm', 0, 1),
(634, 1645333, 10, 'midterm', 22, 1),
(635, 1416455, 8, 'midterm', 0, 2),
(636, 1579288, 8, 'midterm', 0, 2),
(637, 1528882, 8, 'midterm', 7, 2),
(638, 1653725, 8, 'midterm', 0, 2),
(639, 1625654, 8, 'midterm', 15, 2),
(640, 1669953, 10, 'midterm', 0, 2),
(641, 1665555, 10, 'midterm', 0, 2),
(642, 1616161, 10, 'midterm', 0, 2),
(643, 1633554, 10, 'midterm', 10, 2),
(644, 1645333, 10, 'midterm', 0, 2),
(646, 1579288, 8, 'midterm', 18, 3),
(647, 1528882, 8, 'midterm', 0, 3),
(648, 1653725, 8, 'midterm', 0, 3),
(649, 1625654, 8, 'midterm', 20, 3),
(650, 1669953, 10, 'midterm', 5, 3),
(651, 1665555, 10, 'midterm', 15, 3),
(652, 1616161, 10, 'midterm', 18, 3),
(653, 1633554, 10, 'midterm', 5, 3),
(654, 1645333, 10, 'midterm', 23, 3),
(655, 1416455, 8, 'midterm', 15, 4),
(656, 1579288, 8, 'midterm', 0, 4),
(657, 1528882, 8, 'midterm', 0, 4),
(658, 1653725, 8, 'midterm', 0, 4),
(659, 1625654, 8, 'midterm', 0, 4),
(660, 1669953, 10, 'midterm', 0, 4),
(661, 1665555, 10, 'midterm', 6, 4),
(662, 1616161, 10, 'midterm', 11, 4),
(663, 1633554, 10, 'midterm', 15, 4),
(664, 1645333, 10, 'midterm', 16, 4),
(665, 1416455, 8, 'midterm', 2, 5),
(666, 1579288, 8, 'midterm', 5, 5),
(667, 1528882, 8, 'midterm', 0, 5),
(668, 1653725, 8, 'midterm', 0, 5),
(669, 1625654, 8, 'midterm', 0, 5),
(670, 1669953, 10, 'midterm', 0, 5),
(671, 1665555, 10, 'midterm', 2, 5),
(672, 1616161, 10, 'midterm', 0, 5),
(673, 1633554, 10, 'midterm', 0, 5),
(674, 1645333, 10, 'midterm', 15, 5),
(675, 1416455, 8, 'midterm', 7, 6),
(676, 1579288, 8, 'midterm', 12, 6),
(677, 1528882, 8, 'midterm', 4, 6),
(678, 1653725, 8, 'midterm', 0, 6),
(679, 1625654, 8, 'midterm', 0, 6),
(680, 1669953, 10, 'midterm', 0, 6),
(681, 1665555, 10, 'midterm', 0, 6),
(682, 1616161, 10, 'midterm', 20, 6),
(683, 1633554, 10, 'midterm', 0, 6),
(684, 1645333, 10, 'midterm', 13, 6),
(685, 1416455, 8, 'final', 13, 7),
(686, 1579288, 8, 'final', 0, 7),
(687, 1528882, 8, 'final', 2, 7),
(688, 1653725, 8, 'final', 0, 7),
(689, 1625654, 8, 'final', 8, 7),
(690, 1669953, 10, 'final', 0, 7),
(691, 1665555, 10, 'final', 13, 7),
(692, 1616161, 10, 'final', 14, 7),
(693, 1633554, 10, 'final', 0, 7),
(694, 1645333, 10, 'final', 10, 7),
(695, 1416455, 8, 'final', 13, 8),
(696, 1579288, 8, 'final', 10, 8),
(697, 1528882, 8, 'final', 7, 8),
(698, 1653725, 8, 'final', 0, 8),
(699, 1625654, 8, 'final', 10, 8),
(700, 1669953, 10, 'final', 0, 8),
(701, 1665555, 10, 'final', 12, 8),
(702, 1616161, 10, 'final', 13, 8),
(703, 1633554, 10, 'final', 0, 8),
(704, 1645333, 10, 'final', 12, 8),
(705, 1416455, 8, 'final', 11, 9),
(706, 1579288, 8, 'final', 13, 9),
(707, 1528882, 8, 'final', 8, 9),
(708, 1653725, 8, 'final', 0, 9),
(709, 1625654, 8, 'final', 10, 9),
(710, 1669953, 10, 'final', 0, 9),
(711, 1665555, 10, 'final', 13, 9),
(712, 1616161, 10, 'final', 8, 9),
(713, 1633554, 10, 'final', 0, 9),
(714, 1645333, 10, 'final', 11, 9),
(715, 1579288, 8, 'final', 23, 10),
(716, 1528882, 8, 'final', 13, 10),
(717, 1653725, 8, 'final', 0, 10),
(718, 1625654, 8, 'final', 4, 10),
(719, 1669953, 10, 'final', 0, 10),
(720, 1665555, 10, 'final', 4, 10),
(721, 1616161, 10, 'final', 15, 10),
(722, 1633554, 10, 'final', 0, 10),
(723, 1645333, 10, 'final', 18, 10),
(724, 1579288, 8, 'project', 23, 11),
(725, 1528882, 8, 'project', 6, 11),
(726, 1653725, 8, 'project', 0, 11),
(727, 1625654, 8, 'project', 24, 11),
(728, 1669953, 10, 'project', 0, 11),
(729, 1665555, 10, 'project', 27, 11),
(730, 1616161, 10, 'project', 0, 11),
(731, 1633554, 10, 'project', 0, 11),
(732, 1645333, 10, 'project', 23, 11),
(739, 1821545, 8, 'Project', 25, 20),
(744, 1821545, 7, 'Midterm', 30, 30),
(745, 1821557, 8, 'Midterm', 29, 27),
(747, 1711000, 8, 'Midterm', 29, 27),
(749, 1711000, 8, 'Final', 29, 11);

-- --------------------------------------------------------

--
-- Table structure for table `graduate_student_t`
--

CREATE TABLE `graduate_student_t` (
  `GraduationYear` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `graduate_student_t`
--

INSERT INTO `graduate_student_t` (`GraduationYear`) VALUES
('0000-00-00'),
('0000-00-00'),
('0000-00-00'),
('0000-00-00'),
('0000-00-00'),
('0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `higer_authority_t`
--

CREATE TABLE `higer_authority_t` (
  `UniversityID` int(11) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `instructor_t`
--

CREATE TABLE `instructor_t` (
  `DepartmentID` varchar(11) DEFAULT NULL,
  `Position` varchar(40) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `InstructorID` int(11) NOT NULL,
  `PersonID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instructor_t`
--

INSERT INTO `instructor_t` (`DepartmentID`, `Position`, `StartDate`, `InstructorID`, `PersonID`) VALUES
('CSE', 'Professor', '2019-01-09', 1, 1),
('CSE', 'Associate Professor', '2017-05-09', 2, 2),
('CSE', 'Associate Professor', '2015-08-09', 3, 4),
('CSE', 'Professor', '2016-10-03', 4, 6),
('CSE', 'Assistant Professor', '2016-08-20', 5, 3),
('CSE', 'Assistant Professor', '2008-03-08', 6, 7),
('CSE', 'Lecturer', '2019-10-09', 7, 5),
('CSE', 'Lecturer', '2009-08-19', 8, 9),
('CSE', 'Lecturer', '2011-11-09', 9, 10),
('CSE', 'Lecturer', '2014-08-19', 10, 8),
('CSE', 'Lecturer', '2019-09-09', 11, 11),
('CSE', 'Lecturer', '2009-11-20', 12, 13),
('CSE', 'Professor', '2019-08-09', 13, 12),
('CSE', 'Professor', '2008-08-09', 14, 15);

-- --------------------------------------------------------

--
-- Table structure for table `person_t`
--

CREATE TABLE `person_t` (
  `PersonID` int(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `PersonType` varchar(40) DEFAULT NULL,
  `DOB` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person_t`
--

INSERT INTO `person_t` (`PersonID`, `Name`, `Gender`, `Email`, `Address`, `PersonType`, `DOB`) VALUES
(1, 'Harry Puttar', 'Male', 'send.by.owl@gmail.com', '4 Privet Drive, Little Whinging, Surrey', 'Student', '1980-07-31'),
(2, 'Kazi Tahsinul Haque', 'Male', '', '', 'Student', '0000-00-00'),
(3, 'Mir Sayad Bin Almas', 'Male', '', '', 'Student', '0000-00-00'),
(4, 'Mahamudul Hassan Tonmoy', 'Male', '', '', 'Student', '0000-00-00'),
(5, 'Kuddus Mia', 'Male', '', '', 'Student', '0000-00-00'),
(6, 'Chowdhury Shaheb', 'Male', '', '', 'Student', '0000-00-00'),
(7, 'Dr. Mahadi Hasan', 'Male', 'mhadayhasan@iub.edu.bd', '', 'Instructor', '0000-00-00'),
(8, 'Md. Abu Sayed', 'Male', 'asayed@iub.edu.bd', '', 'Instructor', '0000-00-00'),
(9, 'Sadita Ahmed', 'Female', 'sadita.ahsets@iub.edu.bd', '', 'Instructor', '1988-05-25'),
(10, 'Bilkis Begum', 'Female', NULL, 'Jupiter', 'Student', '1996-01-21'),
(11, 'Bruce Wayne', 'Male', NULL, '1007 Mountain Drive, Gotham', 'Student', '1992-08-08'),
(12, 'Sefatul Wasi', 'Male', 'sefatullah@gmail.com', '', 'Student', '1997-02-15'),
(13, 'Amin Ahsan Ali', 'Male', 'aaa@gmail.com', '', 'Instructor', '0000-00-00'),
(14, 'Luna ', 'Female', 'luna@gmail.com', '', 'Student', '0000-00-00'),
(15, 'Erza', 'Female', 'erza@gmail.com', '', 'Instructor', '0000-00-00'),
(16, 'Owen', 'Male', 'owen@gmail.com', '', 'Student', '0000-00-00'),
(17, 'Harper', 'Male', 'harper@gmail.com', '', 'Student', '0000-00-00'),
(18, 'Stella', 'Female', 'stella@gmail.com', '', 'Student', '0000-00-00'),
(19, 'Samuel', 'Male', 'samuel@gmail.com', '', 'Student', '0000-00-00'),
(20, 'Sakib', 'Male ', 'sakib@gmail.com', 'baba lane', 'Student', '1999-01-12'),
(21, 'Arnob', 'Male ', 'arnob@gmail.com', '', 'Student', '0000-00-00'),
(22, 'Shofiq', 'Male ', 'shofiq@gmail.com', '', 'Student', '0000-00-00'),
(23, 'Roni', 'Male ', 'roni@gmail.com', '', 'Student', '0000-00-00');

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
(2, 'PO2', 'Requirement Analysis', 'BSc.CSE'),
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

-- --------------------------------------------------------

--
-- Table structure for table `program_t`
--

CREATE TABLE `program_t` (
  `ProgramID` varchar(11) NOT NULL,
  `ProgramName` varchar(40) DEFAULT NULL,
  `DepartmentID` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `program_t`
--

INSERT INTO `program_t` (`ProgramID`, `ProgramName`, `DepartmentID`) VALUES
('BSc.CEN', 'B.Sc. in Computer Engineering ', 'CSE'),
('BSc.CSC', 'B.Sc. in Computer Science ', 'CSE'),
('BSc.CSE', 'B.Sc. in Computer Science & Engineering ', 'CSE'),
('BSc.EEE', 'Electrical & Electronic Engineering', 'EEE'),
('BSc.EL', 'English Literature', 'ENG'),
('BSc.ELT', 'English Language Teaching', 'ENG'),
('BSc.ETE', 'Electronic & Telecommunication Engineeri', 'EEE'),
('BSc.MAT', 'Mathematics', 'PS'),
('BSc.PHY', 'Physics', 'PS');

-- --------------------------------------------------------

--
-- Table structure for table `school_t`
--

CREATE TABLE `school_t` (
  `SchoolID` varchar(11) NOT NULL,
  `SchoolName` varchar(40) DEFAULT NULL,
  `UniversityID` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `school_t`
--

INSERT INTO `school_t` (`SchoolID`, `SchoolName`, `UniversityID`) VALUES
('SAD', 'School of Architecture & Design', 'BRACU'),
('SBE', 'School of Business & Entrepreneurship', 'IUB'),
('SELS', 'School of Environment & Life Science', 'IUB'),
('SETS', 'School of Engineering, Technology and Sc', 'IUB'),
('SGE', 'School of General Education', 'BRACU'),
('SHLS', 'School of Health & Life Sciences', 'NSU'),
('SIC', 'School of Institutes & Centre', 'NSU'),
('SLASS', 'School of Liberal Arts & Social Sciences', 'IUB'),
('SPPH', 'School of Pharmacy & Public Health', 'IUB');

-- --------------------------------------------------------

--
-- Table structure for table `section_t`
--

CREATE TABLE `section_t` (
  `SectionID` int(11) NOT NULL,
  `SectionNum` int(11) DEFAULT NULL,
  `CourseID` varchar(11) DEFAULT NULL,
  `InstructorID` int(11) DEFAULT NULL,
  `Semester` varchar(20) DEFAULT NULL,
  `s_year` year(4) DEFAULT NULL,
  `No.ofStudents` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section_t`
--

INSERT INTO `section_t` (`SectionID`, `SectionNum`, `CourseID`, `InstructorID`, `Semester`, `s_year`, `No.ofStudents`) VALUES
(3, 1, 'CSE101', 5, 'Spring', 2021, 30),
(4, 1, 'CSE101L', 0, 'Spring', 2021, 30),
(5, 1, 'CSE303', 8, 'Spring', 2021, 10),
(6, 1, 'CSE303L', 8, 'Spring', 2021, 10),
(7, 1, 'CSE425 ', 13, 'Autumn', 2021, 5),
(8, 2, 'CSE303', 10, 'Spring', 2021, 10),
(9, 2, 'CSE303L', 10, 'Spring', 2021, 10),
(10, 3, 'CSE303', 10, 'Summer', 2021, 10),
(11, 3, 'CSE303L', 10, 'Summer', 2021, 10),
(12, 1, 'CSE425', 13, 'Summer', 2020, 15),
(13, 1, 'CSE421', 13, 'Summer', 2020, 15),
(14, 1, 'CSE421', 13, 'Spring', 2021, 15);

-- --------------------------------------------------------

--
-- Table structure for table `student_t`
--

CREATE TABLE `student_t` (
  `StudentID` int(11) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `ProgramID` varchar(15) DEFAULT NULL,
  `EnrollmentDate` date DEFAULT NULL,
  `AssessmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_t`
--

INSERT INTO `student_t` (`StudentID`, `PersonID`, `ProgramID`, `EnrollmentDate`, `AssessmentID`) VALUES
(1579288, 21, 'BSc.CSE', '2015-04-15', 0),
(1616161, 20, 'BSc.CSE', '2018-04-14', 1),
(1625654, 23, 'BSc.CSE', '2016-04-17', 0),
(1653725, 22, 'BSc.CSE', '2016-04-16', 0),
(1711000, 14, 'BSc.CSC', '2017-05-14', 0),
(1711619, 5, 'BSc.CSE', '2017-01-14', 3),
(1711729, 9, 'BSc.CSE', '2017-01-14', 3),
(1711900, 18, 'BSc.ELT', '2017-02-14', 0),
(1722990, 16, 'BSc.CSC', '2017-04-14', 0),
(1728139, 4, 'BSc.CSE', '2017-01-14', 1),
(1762565, 11, 'BSc.CSE', '2017-01-14', 3),
(1773384, 10, 'BSc.CSE', '2017-01-14', 3),
(1789481, 6, 'BSc.CSE', '2017-01-14', 3),
(1797789, 1, 'BSc.CSE', '2017-01-14', 2),
(1820029, 19, 'BSc.CSE', '2018-02-14', 0),
(1821545, 0, 'BSc.CSE', NULL, 1),
(1821557, 2, 'BSc.CSE', '2018-01-14', 1),
(1821778, 3, 'BSc.CSE', '2018-01-14', 1),
(1821999, 12, 'BSc.CEN', '2018-02-14', 1),
(1901999, 17, 'BSc.EEE', '2019-03-14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `undergraduate_student_t`
--

CREATE TABLE `undergraduate_student_t` (
  `EarnedCredit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `university_t`
--

CREATE TABLE `university_t` (
  `UniversityID` varchar(11) NOT NULL,
  `UniversityName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `university_t`
--

INSERT INTO `university_t` (`UniversityID`, `UniversityName`) VALUES
('BRACU', 'BRAC University'),
('DU', 'University of Dhaka'),
('EWU', 'East West University '),
('IUB', 'Independent University,Bangladesh'),
('NSU', 'North South University');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment_t`
--
ALTER TABLE `assessment_t`
  ADD PRIMARY KEY (`AssessmentID`),
  ADD KEY `FK_SectionAssessment` (`SectionID`),
  ADD KEY `FK_COAssessment` (`COID`),
  ADD KEY `FK_PersonAssessment` (`PersonID`);

--
-- Indexes for table `course_t`
--
ALTER TABLE `course_t`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `FK_ProgramCourse` (`ProgramID`);

--
-- Indexes for table `co_t`
--
ALTER TABLE `co_t`
  ADD PRIMARY KEY (`COID`),
  ADD KEY `FK_PLOCO` (`PLOID`),
  ADD KEY `FK_CourseCO` (`CourseID`);

--
-- Indexes for table `department_t`
--
ALTER TABLE `department_t`
  ADD PRIMARY KEY (`DepartmentID`),
  ADD KEY `FK_SchoolDepartment` (`SchoolID`);

--
-- Indexes for table `employee_t`
--
ALTER TABLE `employee_t`
  ADD PRIMARY KEY (`employeeID`),
  ADD KEY `FK_PersonEmployee` (`PersonID`);

--
-- Indexes for table `evaluation_t`
--
ALTER TABLE `evaluation_t`
  ADD PRIMARY KEY (`EvalID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `FK_AssessmentEvaluation` (`AssessmentID`),
  ADD KEY `SectionID` (`SectionID`);

--
-- Indexes for table `higer_authority_t`
--
ALTER TABLE `higer_authority_t`
  ADD KEY `FK_UniversityAuthority` (`UniversityID`);

--
-- Indexes for table `instructor_t`
--
ALTER TABLE `instructor_t`
  ADD PRIMARY KEY (`InstructorID`),
  ADD KEY `FK_DepartmentInstructor` (`DepartmentID`),
  ADD KEY `FK_PersonInstructor` (`PersonID`);

--
-- Indexes for table `person_t`
--
ALTER TABLE `person_t`
  ADD PRIMARY KEY (`PersonID`);

--
-- Indexes for table `plo_t`
--
ALTER TABLE `plo_t`
  ADD PRIMARY KEY (`PLOID`),
  ADD KEY `FK_ProgramPLO` (`ProgramID`);

--
-- Indexes for table `program_t`
--
ALTER TABLE `program_t`
  ADD PRIMARY KEY (`ProgramID`),
  ADD KEY `FK_DepartmentProgram` (`DepartmentID`);

--
-- Indexes for table `school_t`
--
ALTER TABLE `school_t`
  ADD PRIMARY KEY (`SchoolID`),
  ADD KEY `FK_UniversitySchool` (`UniversityID`);

--
-- Indexes for table `section_t`
--
ALTER TABLE `section_t`
  ADD PRIMARY KEY (`SectionID`),
  ADD KEY `FK_CourseSection` (`CourseID`),
  ADD KEY `FK_InstructorSection` (`InstructorID`);

--
-- Indexes for table `student_t`
--
ALTER TABLE `student_t`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `STUDENT_FK1` (`PersonID`),
  ADD KEY `FK_AssessmentStudent` (`AssessmentID`),
  ADD KEY `FK_ProgramStudent` (`ProgramID`);

--
-- Indexes for table `university_t`
--
ALTER TABLE `university_t`
  ADD PRIMARY KEY (`UniversityID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessment_t`
--
ALTER TABLE `assessment_t`
  MODIFY `AssessmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `co_t`
--
ALTER TABLE `co_t`
  MODIFY `COID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `evaluation_t`
--
ALTER TABLE `evaluation_t`
  MODIFY `EvalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=750;

--
-- AUTO_INCREMENT for table `instructor_t`
--
ALTER TABLE `instructor_t`
  MODIFY `InstructorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `person_t`
--
ALTER TABLE `person_t`
  MODIFY `PersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `plo_t`
--
ALTER TABLE `plo_t`
  MODIFY `PLOID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `section_t`
--
ALTER TABLE `section_t`
  MODIFY `SectionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_t`
--
ALTER TABLE `course_t`
  ADD CONSTRAINT `FK_ProgramCourse` FOREIGN KEY (`ProgramID`) REFERENCES `program_t` (`ProgramID`);

--
-- Constraints for table `department_t`
--
ALTER TABLE `department_t`
  ADD CONSTRAINT `FK_SchoolDepartment` FOREIGN KEY (`SchoolID`) REFERENCES `school_t` (`SchoolID`);

--
-- Constraints for table `evaluation_t`
--
ALTER TABLE `evaluation_t`
  ADD CONSTRAINT `FK_AssessmentEvaluation` FOREIGN KEY (`AssessmentID`) REFERENCES `assessment_t` (`AssessmentID`),
  ADD CONSTRAINT `evaluation_t_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student_t` (`StudentID`),
  ADD CONSTRAINT `evaluation_t_ibfk_3` FOREIGN KEY (`SectionID`) REFERENCES `section_t` (`SectionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
