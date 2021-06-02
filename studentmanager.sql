-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: studentmanager
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class_m2m_schedule`
--

DROP TABLE IF EXISTS `class_m2m_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_m2m_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `class_m2m_schedule_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `class_m2m_schedule_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`sche_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_m2m_schedule`
--

LOCK TABLES `class_m2m_schedule` WRITE;
/*!40000 ALTER TABLE `class_m2m_schedule` DISABLE KEYS */;
INSERT INTO `class_m2m_schedule` VALUES (1,1,1),(2,1,2),(3,2,3),(4,1,3),(5,2,1),(6,8,4),(7,7,3),(8,7,2);
/*!40000 ALTER TABLE `class_m2m_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_m2m_student`
--

DROP TABLE IF EXISTS `class_m2m_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_m2m_student` (
  `class_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  KEY `class_id` (`class_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `class_m2m_student_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `class_m2m_student_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_m2m_student`
--

LOCK TABLES `class_m2m_student` WRITE;
/*!40000 ALTER TABLE `class_m2m_student` DISABLE KEYS */;
INSERT INTO `class_m2m_student` VALUES (4,1),(1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(2,1),(7,6),(8,7);
/*!40000 ALTER TABLE `class_m2m_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `course` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'S1','Python'),(2,'S2','Java'),(3,'S3','Go'),(4,'S4','Hadoop'),(5,'S5','wangluo'),(6,'S6','数控技术'),(7,'S7','电气焊'),(8,'S8','美容美发');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `sche_id` int(11) NOT NULL AUTO_INCREMENT,
  `sche_name` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`sche_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,'day1'),(2,'day2'),(3,'day3'),(4,'day4');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `QQ` int(11) NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'wangpeng',1234563,'12345'),(2,'buju',223456,'12345'),(3,'zhangsan',41209832,'12345'),(4,'lisi',251766460,'12345'),(5,'wangwu',13081832,'12345'),(6,'baiqi',2147483647,'12345'),(7,'huatuo',1207928832,'12345'),(8,'sunbin',2147483647,'12345');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_records`
--

DROP TABLE IF EXISTS `study_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_m2m_schedule_id` int(11) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `status` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_m2m_schedule_id` (`class_m2m_schedule_id`),
  KEY `stu_id` (`stu_id`),
  CONSTRAINT `study_records_ibfk_1` FOREIGN KEY (`class_m2m_schedule_id`) REFERENCES `class_m2m_schedule` (`id`),
  CONSTRAINT `study_records_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `students` (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_records`
--

LOCK TABLES `study_records` WRITE;
/*!40000 ALTER TABLE `study_records` DISABLE KEYS */;
INSERT INTO `study_records` VALUES (28,1,1,'N',90),(29,1,2,'N',87),(30,2,1,'Y',87),(31,2,2,'Y',100),(32,6,7,'N',NULL),(34,6,7,'Y',NULL);
/*!40000 ALTER TABLE `study_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_m2m_class`
--

DROP TABLE IF EXISTS `teacher_m2m_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_m2m_class` (
  `teacher_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  KEY `teacher_id` (`teacher_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `teacher_m2m_class_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  CONSTRAINT `teacher_m2m_class_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_m2m_class`
--

LOCK TABLES `teacher_m2m_class` WRITE;
/*!40000 ALTER TABLE `teacher_m2m_class` DISABLE KEYS */;
INSERT INTO `teacher_m2m_class` VALUES (4,1),(4,2),(4,3),(2,4),(4,5),(4,6),(4,7),(4,8);
/*!40000 ALTER TABLE `teacher_m2m_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Alex','12345'),(2,'Peiqi','12345'),(3,'Jack','12345'),(4,'Mayun','12345'),(5,'Wangjianlin','12345');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-12 21:06:31
