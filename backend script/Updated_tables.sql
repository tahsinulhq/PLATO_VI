-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2021 at 06:38 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_update`
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
  `QuestionNum` int(11) DEFAULT NULL,
  `AssessmentName` varchar(100) DEFAULT NULL,
  `Marks` double DEFAULT NULL,
  `assessmentType` varchar(100) NOT NULL,
  `noOfStudents` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `CONum` int(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `PLOID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `COThreshold` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `EvalID` int(11) NOT NULL,
  `ObtainedMarks` int(11) DEFAULT NULL,
  `AssessmentName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(8, 'Md. Abu Sayed', 'Male', 'asayed@iub.edu.bd', '', 'Instructor', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `plo_t`
--

CREATE TABLE `plo_t` (
  `PLOID` int(11) NOT NULL,
  `PLONum` int(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `ProgramID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `Year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section_t`
--

INSERT INTO `section_t` (`SectionID`, `SectionNum`, `CourseID`, `InstructorID`, `Semester`, `Year`) VALUES
(3, 1, 'CSE101', 0, 'Spring', 2021),
(4, 1, 'CSE101L', 0, 'Spring', 2021),
(5, 1, 'CSE303', 8, 'Spring', 2021),
(6, 1, 'CSE303L', 8, 'Spring', 2021),
(7, 1, 'CSE425 ', 0, 'Spring', 2021),
(8, 2, 'CSE303', 8, 'Spring', 2021),
(9, 2, 'CSE303L', 8, 'Spring', 2021),
(10, 3, 'CSE303', 10, 'Spring', 2021),
(11, 3, 'CSE303L', 10, 'Spring', 2021);

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
  ADD KEY `StudentID` (`StudentID`);

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
  MODIFY `AssessmentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `co_t`
--
ALTER TABLE `co_t`
  MODIFY `COID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructor_t`
--
ALTER TABLE `instructor_t`
  MODIFY `InstructorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `person_t`
--
ALTER TABLE `person_t`
  MODIFY `PersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `plo_t`
--
ALTER TABLE `plo_t`
  MODIFY `PLOID` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `evaluation_t_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student_t` (`StudentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
