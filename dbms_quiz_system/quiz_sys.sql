-- MySQL dump 10.13  Distrib 8.0.28, for macos12.2 (arm64)
--
-- Host: localhost    Database: quiz_system
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abcd`
--

DROP TABLE IF EXISTS `abcd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abcd` (
  `QuizID` char(5) NOT NULL,
  `QuesID` char(3) NOT NULL,
  `CorrectPercent` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abcd`
--

LOCK TABLES `abcd` WRITE;
/*!40000 ALTER TABLE `abcd` DISABLE KEYS */;
INSERT INTO `abcd` VALUES ('qz1','q1',10),('qz1','q2',20),('qz1','q3',50),('qz1','q4',80),('qz1','q5',100),('qz2','q10',80),('qz2','q6',20),('qz2','q7',50),('qz2','q8',80),('qz2','q9',100);
/*!40000 ALTER TABLE `abcd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_ques`
--

DROP TABLE IF EXISTS `academic_ques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_ques` (
  `QuesID` char(3) NOT NULL,
  `CourseCode` char(5) DEFAULT NULL,
  PRIMARY KEY (`QuesID`),
  CONSTRAINT `academic_ques_ibfk_1` FOREIGN KEY (`QuesID`) REFERENCES `question` (`QuesID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_ques`
--

LOCK TABLES `academic_ques` WRITE;
/*!40000 ALTER TABLE `academic_ques` DISABLE KEYS */;
INSERT INTO `academic_ques` VALUES ('q1','CS204'),('q2','CS204'),('q4','CS204'),('q5','CS204');
/*!40000 ALTER TABLE `academic_ques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access` (
  `TeacherID` char(3) NOT NULL,
  `qbID` char(3) NOT NULL,
  PRIMARY KEY (`TeacherID`,`qbID`),
  KEY `fkeyq` (`qbID`),
  CONSTRAINT `access_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher_name` (`TeacherID`),
  CONSTRAINT `access_ibfk_2` FOREIGN KEY (`qbID`) REFERENCES `question_bank` (`qbID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES ('20','qb1'),('21','qb1'),('29','qb1');
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attempts`
--

DROP TABLE IF EXISTS `attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attempts` (
  `StudentID` char(3) NOT NULL,
  `QuizID` char(5) NOT NULL,
  `Grade` int DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`QuizID`),
  KEY `fkey` (`QuizID`),
  CONSTRAINT `attempts_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`),
  CONSTRAINT `attempts_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attempts`
--

LOCK TABLES `attempts` WRITE;
/*!40000 ALTER TABLE `attempts` DISABLE KEYS */;
INSERT INTO `attempts` VALUES ('10','qz2',9),('89','qz1',30);
/*!40000 ALTER TABLE `attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contains` (
  `QuizID` char(5) NOT NULL,
  `QuesID` char(3) NOT NULL,
  `CorrectPercent` int DEFAULT NULL,
  PRIMARY KEY (`QuizID`,`QuesID`),
  KEY `q_idx` (`QuesID`),
  CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`),
  CONSTRAINT `q` FOREIGN KEY (`QuesID`) REFERENCES `question` (`QuesID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES ('qz1','q1',10),('qz1','q2',20),('qz1','q4',80),('qz1','q5',100),('qz2','q10',80),('qz2','q6',20),('qz2','q7',50),('qz2','q8',80),('qz2','q9',100),('qz3','q10',NULL),('qz3','q5',NULL);
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creates_qb`
--

DROP TABLE IF EXISTS `creates_qb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creates_qb` (
  `LoginID` char(3) DEFAULT NULL,
  `qbID` char(3) NOT NULL,
  PRIMARY KEY (`qbID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creates_qb`
--

LOCK TABLES `creates_qb` WRITE;
/*!40000 ALTER TABLE `creates_qb` DISABLE KEYS */;
INSERT INTO `creates_qb` VALUES ('29','qb1'),('89','qb2');
/*!40000 ALTER TABLE `creates_qb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `non_acad_ques`
--

DROP TABLE IF EXISTS `non_acad_ques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_acad_ques` (
  `QuesID` char(3) NOT NULL,
  `Category` char(10) DEFAULT NULL,
  PRIMARY KEY (`QuesID`),
  CONSTRAINT `non_acad_ques_ibfk_1` FOREIGN KEY (`QuesID`) REFERENCES `question` (`QuesID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `non_acad_ques`
--

LOCK TABLES `non_acad_ques` WRITE;
/*!40000 ALTER TABLE `non_acad_ques` DISABLE KEYS */;
INSERT INTO `non_acad_ques` VALUES ('q10','Music'),('q6','Music'),('q7','Music'),('q8','Music'),('q9','Music');
/*!40000 ALTER TABLE `non_acad_ques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `QuesID` char(3) NOT NULL,
  `MaxScore` int DEFAULT NULL,
  `Correct` char(1) DEFAULT NULL,
  `CreateDate` date DEFAULT NULL,
  `Difficulty` int DEFAULT NULL,
  `question_statement` text,
  PRIMARY KEY (`QuesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('q1',1,'A','2022-02-02',1,'What is the capital of India?'),('q10',1,'D','2022-02-02',1,NULL),('q11',5,'B','2022-03-24',4,NULL),('q2',2,'C','2022-02-02',2,NULL),('q4',2,'C','2022-02-02',2,NULL),('q5',1,'D','2022-02-02',1,NULL),('q6',1,'A','2022-02-02',1,NULL),('q7',1,'B','2022-02-02',1,NULL),('q8',1,'C','2022-02-02',2,NULL),('q9',1,'C','2022-02-02',1,NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_bank`
--

DROP TABLE IF EXISTS `question_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_bank` (
  `qbID` char(3) NOT NULL,
  PRIMARY KEY (`qbID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_bank`
--

LOCK TABLES `question_bank` WRITE;
/*!40000 ALTER TABLE `question_bank` DISABLE KEYS */;
INSERT INTO `question_bank` VALUES ('qb1'),('qb2');
/*!40000 ALTER TABLE `question_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `QuizID` char(3) NOT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `MaxScore` int DEFAULT NULL,
  `Category` char(10) DEFAULT NULL,
  PRIMARY KEY (`QuizID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES ('qz1','2022-01-01 13:00:00','2022-01-01 13:30:00',30,'Academic'),('qz2','2022-01-01 12:00:00','2022-01-01 12:30:00',30,'Encore'),('qz3','2022-06-24 10:00:00','2022-06-24 11:00:00',30,'Academic');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizscores`
--

DROP TABLE IF EXISTS `quizscores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizscores` (
  `QuizScore` decimal(32,0) DEFAULT NULL,
  `QuizID` char(5) NOT NULL,
  `StudentID` char(3) NOT NULL,
  PRIMARY KEY (`QuizID`,`StudentID`),
  KEY `fkey` (`StudentID`),
  CONSTRAINT `quizscores_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`),
  CONSTRAINT `quizscores_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizscores`
--

LOCK TABLES `quizscores` WRITE;
/*!40000 ALTER TABLE `quizscores` DISABLE KEYS */;
INSERT INTO `quizscores` VALUES (6,'qz1','89'),(1,'qz2','10');
/*!40000 ALTER TABLE `quizscores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `response` (
  `StudentID` char(3) NOT NULL,
  `QuizID` char(5) NOT NULL,
  `QuesID` char(3) NOT NULL,
  `Response` char(1) DEFAULT NULL,
  `Score` int DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`QuizID`,`QuesID`),
  KEY `fkeyq` (`QuesID`),
  CONSTRAINT `response_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `response_ibfk_2` FOREIGN KEY (`QuesID`) REFERENCES `question` (`QuesID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--

LOCK TABLES `response` WRITE;
/*!40000 ALTER TABLE `response` DISABLE KEYS */;
INSERT INTO `response` VALUES ('10','qz2','q10','B',0),('10','qz2','q6','B',0),('10','qz2','q7','B',1),('10','qz2','q8','B',0),('10','qz2','q9','B',0),('89','qz1','q1','B',0),('89','qz1','q2','B',2),('89','qz1','q4','D',0),('89','qz1','q5','D',1);
/*!40000 ALTER TABLE `response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `UserID` char(3) NOT NULL,
  `Role` text,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_creates_quiz`
--

DROP TABLE IF EXISTS `s_creates_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_creates_quiz` (
  `StudentID` char(3) NOT NULL,
  `QuizID` char(3) NOT NULL,
  PRIMARY KEY (`StudentID`,`QuizID`),
  KEY `fkeyq` (`QuizID`),
  CONSTRAINT `s_creates_quiz_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`),
  CONSTRAINT `s_creates_quiz_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`),
  CONSTRAINT `s_creates_quiz_ibfk_3` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_creates_quiz`
--

LOCK TABLES `s_creates_quiz` WRITE;
/*!40000 ALTER TABLE `s_creates_quiz` DISABLE KEYS */;
INSERT INTO `s_creates_quiz` VALUES ('89','qz2');
/*!40000 ALTER TABLE `s_creates_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_clubs`
--

DROP TABLE IF EXISTS `st_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_clubs` (
  `StudentID` char(3) NOT NULL,
  `Club` char(15) NOT NULL,
  PRIMARY KEY (`StudentID`,`Club`),
  CONSTRAINT `st_clubs_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`),
  CONSTRAINT `st_clubs_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_clubs`
--

LOCK TABLES `st_clubs` WRITE;
/*!40000 ALTER TABLE `st_clubs` DISABLE KEYS */;
INSERT INTO `st_clubs` VALUES ('10','Encore'),('89','Encore'),('89','Masquerade');
/*!40000 ALTER TABLE `st_clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_info`
--

DROP TABLE IF EXISTS `student_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_info` (
  `StudentID` char(3) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Batch` char(4) DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `student_info_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`),
  CONSTRAINT `student_info_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_info`
--

LOCK TABLES `student_info` WRITE;
/*!40000 ALTER TABLE `student_info` DISABLE KEYS */;
INSERT INTO `student_info` VALUES ('10','2002-12-12','2020'),('12','2002-01-15','2020'),('89','2000-12-06','2020');
/*!40000 ALTER TABLE `student_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_name`
--

DROP TABLE IF EXISTS `student_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_name` (
  `FirstName` text,
  `MiddleName` text,
  `LastName` text,
  `StudentID` char(3) NOT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_name`
--

LOCK TABLES `student_name` WRITE;
/*!40000 ALTER TABLE `student_name` DISABLE KEYS */;
INSERT INTO `student_name` VALUES ('Amit','Singh','Shah','10'),('Akshay','Rajput',NULL,'12'),('Ishan','Pandey',NULL,'89');
/*!40000 ALTER TABLE `student_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_phno`
--

DROP TABLE IF EXISTS `student_phno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_phno` (
  `StudentID` char(3) NOT NULL,
  `phone` char(10) NOT NULL,
  PRIMARY KEY (`StudentID`,`phone`),
  CONSTRAINT `student_phno_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`),
  CONSTRAINT `student_phno_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_phno`
--

LOCK TABLES `student_phno` WRITE;
/*!40000 ALTER TABLE `student_phno` DISABLE KEYS */;
INSERT INTO `student_phno` VALUES ('10','9999991235'),('89','9999991234'),('89','9999999999');
/*!40000 ALTER TABLE `student_phno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_qb`
--

DROP TABLE IF EXISTS `student_qb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_qb` (
  `qbID` char(3) NOT NULL,
  `StudentID` char(3) NOT NULL,
  PRIMARY KEY (`qbID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_qb`
--

LOCK TABLES `student_qb` WRITE;
/*!40000 ALTER TABLE `student_qb` DISABLE KEYS */;
INSERT INTO `student_qb` VALUES ('qb2',''),('qb3','');
/*!40000 ALTER TABLE `student_qb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_creates_ques`
--

DROP TABLE IF EXISTS `t_creates_ques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_creates_ques` (
  `TeacherID` char(3) NOT NULL,
  `QuesID` char(3) NOT NULL,
  PRIMARY KEY (`QuesID`),
  KEY `fkey` (`TeacherID`),
  CONSTRAINT `t_creates_ques_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher_name` (`TeacherID`),
  CONSTRAINT `t_creates_ques_ibfk_2` FOREIGN KEY (`QuesID`) REFERENCES `question` (`QuesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_creates_ques`
--

LOCK TABLES `t_creates_ques` WRITE;
/*!40000 ALTER TABLE `t_creates_ques` DISABLE KEYS */;
INSERT INTO `t_creates_ques` VALUES ('29','q1'),('29','q5');
/*!40000 ALTER TABLE `t_creates_ques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_creates_quiz`
--

DROP TABLE IF EXISTS `t_creates_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_creates_quiz` (
  `TeacherID` char(3) NOT NULL,
  `QuizID` char(3) NOT NULL,
  `CourseCode` char(5) DEFAULT NULL,
  PRIMARY KEY (`QuizID`),
  KEY `fkey` (`TeacherID`),
  CONSTRAINT `t_creates_quiz_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher_name` (`TeacherID`),
  CONSTRAINT `t_creates_quiz_ibfk_2` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_creates_quiz`
--

LOCK TABLES `t_creates_quiz` WRITE;
/*!40000 ALTER TABLE `t_creates_quiz` DISABLE KEYS */;
INSERT INTO `t_creates_quiz` VALUES ('29','qz1','CS204');
/*!40000 ALTER TABLE `t_creates_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taken_from`
--

DROP TABLE IF EXISTS `taken_from`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taken_from` (
  `QuesID` char(3) NOT NULL,
  `qbID` char(3) NOT NULL,
  PRIMARY KEY (`QuesID`),
  KEY `fkeyqb` (`qbID`),
  CONSTRAINT `taken_from_ibfk_1` FOREIGN KEY (`qbID`) REFERENCES `question_bank` (`qbID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `taken_from_ibfk_2` FOREIGN KEY (`QuesID`) REFERENCES `question` (`QuesID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taken_from`
--

LOCK TABLES `taken_from` WRITE;
/*!40000 ALTER TABLE `taken_from` DISABLE KEYS */;
INSERT INTO `taken_from` VALUES ('q1','qb1'),('q2','qb1'),('q4','qb1'),('q5','qb1'),('q10','qb2'),('q6','qb2'),('q7','qb2'),('q8','qb2'),('q9','qb2');
/*!40000 ALTER TABLE `taken_from` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_course`
--

DROP TABLE IF EXISTS `teacher_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_course` (
  `TeacherID` char(3) NOT NULL,
  `CourseCode` char(5) NOT NULL,
  PRIMARY KEY (`TeacherID`,`CourseCode`),
  CONSTRAINT `teacher_course_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher_name` (`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_course`
--

LOCK TABLES `teacher_course` WRITE;
/*!40000 ALTER TABLE `teacher_course` DISABLE KEYS */;
INSERT INTO `teacher_course` VALUES ('20','CS208'),('20','EC201'),('29','CS202'),('29','CS204');
/*!40000 ALTER TABLE `teacher_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_info`
--

DROP TABLE IF EXISTS `teacher_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_info` (
  `TeacherID` char(3) NOT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_info`
--

LOCK TABLES `teacher_info` WRITE;
/*!40000 ALTER TABLE `teacher_info` DISABLE KEYS */;
INSERT INTO `teacher_info` VALUES ('20','1985-12-06'),('21','1986-12-06'),('29','1987-12-06');
/*!40000 ALTER TABLE `teacher_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_name`
--

DROP TABLE IF EXISTS `teacher_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_name` (
  `FirstName` text,
  `MiddleName` text,
  `LastName` text,
  `TeacherID` char(3) NOT NULL,
  PRIMARY KEY (`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_name`
--

LOCK TABLES `teacher_name` WRITE;
/*!40000 ALTER TABLE `teacher_name` DISABLE KEYS */;
INSERT INTO `teacher_name` VALUES ('Sunil',NULL,'Dutt','20'),('Pramit',NULL,'Mazumdar','21'),('Novarun',NULL,'Deb','29');
/*!40000 ALTER TABLE `teacher_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_phno`
--

DROP TABLE IF EXISTS `teacher_phno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_phno` (
  `TeacherID` char(3) NOT NULL,
  `Phone` char(10) NOT NULL,
  PRIMARY KEY (`TeacherID`,`Phone`),
  CONSTRAINT `teacher_phno_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher_name` (`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_phno`
--

LOCK TABLES `teacher_phno` WRITE;
/*!40000 ALTER TABLE `teacher_phno` DISABLE KEYS */;
INSERT INTO `teacher_phno` VALUES ('20','8888888999'),('21','8888888977'),('29','8888888888');
/*!40000 ALTER TABLE `teacher_phno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_qb`
--

DROP TABLE IF EXISTS `teacher_qb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_qb` (
  `qbID` char(3) NOT NULL,
  `CourseCode` char(5) DEFAULT NULL,
  PRIMARY KEY (`qbID`),
  CONSTRAINT `teacher_qb_ibfk_1` FOREIGN KEY (`qbID`) REFERENCES `question_bank` (`qbID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_qb`
--

LOCK TABLES `teacher_qb` WRITE;
/*!40000 ALTER TABLE `teacher_qb` DISABLE KEYS */;
INSERT INTO `teacher_qb` VALUES ('qb1','CS206');
/*!40000 ALTER TABLE `teacher_qb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaches` (
  `TeacherID` char(3) NOT NULL,
  `StudentID` char(3) NOT NULL,
  `CourseCode` char(5) NOT NULL,
  PRIMARY KEY (`TeacherID`,`StudentID`,`CourseCode`),
  KEY `fkeys` (`StudentID`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher_name` (`TeacherID`),
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`StudentID`) REFERENCES `student_name` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES ('20','10','EC201'),('29','89','CS204');
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-28 23:16:09
