-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2021 at 07:29 PM
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
(2, 5, 1, 0, 'Q2', 'Midterm', 25),
(3, 5, 2, 0, 'Q3', 'Midterm', 30),
(4, 5, 3, 0, 'Q4', 'Midterm', 20),
(5, 5, 1, 0, 'Q1', 'Final', 20),
(6, 5, 1, 0, 'Q2', 'Final', 15),
(7, 5, 2, 0, 'Q3', 'Final', 15),
(8, 5, 3, 0, 'Q4', 'Final', 50),
(9, 5, 4, 0, 'Q1', 'Project', 30),
(10, 3, 5, 1, 'Q1', 'Midterm', 25),
(11, 3, 5, 0, 'Q2', 'Midterm', 25),
(12, 3, 5, 0, 'Q3', 'Midterm', 30),
(13, 3, 6, 0, 'Q4', 'Midterm', 20),
(14, 3, 5, 0, 'Q5', 'Midterm', 30),
(15, 3, 5, 0, 'Q6', 'Midterm', 20),
(16, 3, 5, 0, 'Q1', 'Final', 20),
(17, 3, 5, 0, 'Q2', 'Final', 15),
(18, 3, 6, 0, 'Q3', 'Final ', 15),
(19, 3, 7, 0, 'Q4', 'Final', 50),
(20, 3, 8, 0, 'Q1', 'project', 30);

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
(1, 'CO1', 'Understand the database applications starting from conceptual\ndesign using data models diagram (ERD)', 2, 'CSE303 ', 40),
(2, 'CO2', 'Basic understanding of data access structures and comparison\nbetween those structures, Determine the', 3, 'CSE303', 40),
(3, 'CO3', 'Solid foundation on the database design using query language SQL\n\nand design of user interfaces.', 4, 'CSE303', 40),
(4, 'CO4', 'Implement user interfaces and database using appropriate tools.', 6, 'CSE303', 40),
(5, 'CO1', 'Null', 1, 'CSE101', 40),
(6, 'CO2', 'NULL', 2, 'CSE101', 40),
(7, 'CO3', 'NULL', 3, 'CSE101', 40),
(8, 'CO4', 'NUll', 4, 'CSE101', 40);

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
('CSE', 'Computer Science and Engineering', 'SETS'),
('EEE', 'Electrical and Electronic Engineering ', 'SETS');

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
(1762565, 5, 192, 'Project', 28, 9),
(1821557, 3, 193, 'Project', 21, 20);

-- --------------------------------------------------------

--
-- Table structure for table `graduate_student_t`
--

CREATE TABLE `graduate_student_t` (
  `GraduationYear` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('CSE', 'Professor', '2019-01-09', 1, 0),
('CSE', 'Associate Professor', '2017-05-09', 2, 0),
('CSE', 'Associate Professor', '2015-08-09', 3, 0),
('CSE', 'Professor', '2016-10-03', 4, 0),
('CSE', 'Assistant Professor', '2016-08-20', 5, 0),
('CSE', 'Assistant Professor', '2008-03-08', 6, 0),
('CSE', 'Lecturer', '2019-10-09', 7, 0),
('CSE', '', '2009-08-19', 8, 7),
('CSE', 'Lecturer', '2011-11-09', 9, 0),
('CSE', 'Lecturer', '2014-08-19', 10, 8),
('CSE', 'Lecturer', '2019-09-09', 11, 0),
('CSE', 'Lecturer', '2009-11-20', 12, 0),
('CSE', 'Professor', '2019-08-09', 13, 0),
('CSE', 'Professor', '2008-08-09', 14, 0);

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
(1, 'Harry Puttar', 'Male', 'send.by.owl@gmail.com', '4 Privet Drive, Little Whinging, Surrey', 'Wizard', '1980-07-31'),
(2, 'Kazi Tahsinul Haque', 'Male', '', '', 'Student', '0000-00-00'),
(3, 'Mir Sayad Bin Almas', 'Male', '', '', 'Student', '0000-00-00'),
(4, 'Mahamudul Hassan Tonmoy', 'Male', '', '', 'Student', '0000-00-00'),
(5, 'Kuddus Mia', 'Male', '', '', 'Student', '0000-00-00'),
(6, 'Chowdhury Shaheb', 'Male', '', '', 'Student', '0000-00-00'),
(7, 'Ms. Sadita Ahmed', 'Female', 'sadita.ahsets@iub.edu.bd', '', 'Instructor', '0000-00-00'),
(8, 'Md. Abu Sayed', 'Male', 'asayed@iub.edu.bd', '', 'Instructor', '0000-00-00'),
(9, 'Montu Mia', 'Male', NULL, 'Mars', 'Student', '1998-05-25'),
(10, 'Bilkis Begum', 'Female', NULL, 'Jupiter', 'Student', '1996-01-21'),
(11, 'Bruce Wayne', 'Male', NULL, '1007 Mountain Drive, Gotham', 'Student', '1992-08-08');

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
(3, 'PO3', 'problem analysis', 'BSc.CSE'),
(4, 'PO4', 'Design', 'BSc.CSE'),
(5, 'PO5', 'Problem Solving', 'BSc.CSE'),
(6, 'PO6', 'Implementation', 'BSc.CSE'),
(7, 'PO7', 'Experiment and Analysis', 'BSc.CSE'),
(8, 'PO8', 'Community Engagement & Engg.', 'BSc.CSE'),
(9, 'PO9', 'Teamwork', 'BSc.CSE'),
(10, 'PO10', 'Communication', 'BSc.CSE'),
(11, 'PO11', 'Self-Moticated', 'BSc.CSE'),
(12, 'PO12', 'Ethics', 'BSc.CSE'),
(13, 'PO13', 'Process Management ', 'BSc.CSE');

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
('BSc.CSE', 'B.Sc. in Computer Science & Engineering ', 'CSE');

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
('SETS', 'School of Engineering, Technology and Sc', 'IUB');

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
  `Year` year(4) DEFAULT NULL,
  `No.ofStudents` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section_t`
--

INSERT INTO `section_t` (`SectionID`, `SectionNum`, `CourseID`, `InstructorID`, `Semester`, `Year`, `No.ofStudents`) VALUES
(3, 1, 'CSE101', 0, 'Spring', 2021, 30),
(4, 1, 'CSE101L', 0, 'Spring', 2021, 30),
(5, 1, 'CSE303', 8, 'Spring', 2021, 10),
(6, 1, 'CSE303L', 8, 'Spring', 2021, 10),
(7, 1, 'CSE425 ', 0, 'Spring', 2021, 5),
(8, 2, 'CSE303', 8, 'Spring', 2021, 10),
(9, 2, 'CSE303L', 8, 'Spring', 2021, 10),
(10, 3, 'CSE303', 10, 'Spring', 2021, 10),
(11, 3, 'CSE303L', 10, 'Spring', 2021, 10);

-- --------------------------------------------------------

--
-- Table structure for table `student_t`
--

CREATE TABLE `student_t` (
  `StudentID` int(11) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `ProgramID` varchar(15) DEFAULT NULL,
  `EntrollmentDate` date DEFAULT NULL,
  `AssessmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_t`
--

INSERT INTO `student_t` (`StudentID`, `PersonID`, `ProgramID`, `EntrollmentDate`, `AssessmentID`) VALUES
(1711619, 5, 'BSc.CSE', '2017-01-14', 3),
(1711729, 9, 'BSc.CSE', '2017-01-14', 3),
(1728139, 4, 'BSc.CSE', '2017-01-14', 1),
(1762565, 11, 'BSc.CSE', '2017-01-14', 3),
(1773384, 10, 'BSc.CSE', '2017-01-14', 3),
(1789481, 6, 'BSc.CSE', '2017-01-14', 3),
(1797789, 1, 'BSc.CSE', '2017-01-14', 2),
(1821557, 2, 'BSc.CSE', '2018-01-14', 1),
(1821778, 3, 'BSc.CSE', '2018-01-14', 1);

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
('IUB', 'Independent University,Bangladesh');

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
  ADD KEY `FK_AssessmentEvaluation` (`AssessmentID`);

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
  MODIFY `AssessmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `co_t`
--
ALTER TABLE `co_t`
  MODIFY `COID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `evaluation_t`
--
ALTER TABLE `evaluation_t`
  MODIFY `EvalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `instructor_t`
--
ALTER TABLE `instructor_t`
  MODIFY `InstructorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `person_t`
--
ALTER TABLE `person_t`
  MODIFY `PersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `plo_t`
--
ALTER TABLE `plo_t`
  MODIFY `PLOID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `section_t`
--
ALTER TABLE `section_t`
  MODIFY `SectionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment_t`
--
ALTER TABLE `assessment_t`
  ADD CONSTRAINT `FK_COAssessment` FOREIGN KEY (`COID`) REFERENCES `co_t` (`COID`),
  ADD CONSTRAINT `FK_PersonAssessment` FOREIGN KEY (`PersonID`) REFERENCES `person_t` (`PersonID`),
  ADD CONSTRAINT `FK_SectionAssessment` FOREIGN KEY (`SectionID`) REFERENCES `section_t` (`SectionID`);

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
  ADD CONSTRAINT `evaluation_t_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student_t` (`StudentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
