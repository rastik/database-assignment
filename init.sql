/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for osx10.20 (arm64)
--
-- Host: 127.0.0.1    Database: assignment_2
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES
(4,'Jessica','Nguyen','scarson@ross.com','001-495-380-4928','52102 George Harbor, Lake Kellytown, RI 85749'),
(5,'William','Carroll','mark84@hotmail.com','(021)430-3208x4579','899 Baldwin Via, East Josephstad, AL 31923'),
(6,'Terrence','Baker','lisaturner@harris-griffith.com','+1-157-603-0588','46306 Keith Ferry, North Brendanstad, OK 85251'),
(7,'Alex','Reyes','melissa26@hotmail.com','001-041-421-4410x677','33048 Johnson Avenue Apt. 373, Pittmanstad, DC 22818'),
(8,'Yolanda','Miller','waltonkatie@yahoo.com','3491888692','0837 Lauren Junction, South Charlesberg, WV 30276'),
(9,'Mark','Ray','nicolegonzalez@yahoo.com','783.806.6737x27173','576 Murray Mountain, North Nathanview, NJ 09735'),
(10,'Ashley','Cooper','xmartinez@king.com','(743)452-9979','7610 Walker Lane Suite 120, Mcdonaldberg, MS 05974'),
(11,'Jamie','Williams','joanwilliams@newman.com','393.280.2610x283','66175 Katrina River Apt. 791, New Victoria, RI 81389'),
(12,'Allison','Turner','amy13@hotmail.com','835-118-9310','58790 Strong Overpass Apt. 184, Carolshire, IA 21770'),
(13,'Charles','Richardson','megan31@harrington.com','001-480-667-1994','8155 Melissa Rest, Port Joanna, OK 65840');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Package`
--

DROP TABLE IF EXISTS `Package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Package` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `skipass_type` varchar(100) NOT NULL,
  `package_name` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`package_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `Package_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `Room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Package`
--

LOCK TABLES `Package` WRITE;
/*!40000 ALTER TABLE `Package` DISABLE KEYS */;
INSERT INTO `Package` VALUES
(1,6,'Standard','Package 1',490.20),
(2,6,'Family','Package 2',105.96),
(3,5,'Premium','Package 3',304.30),
(4,10,'Premium','Package 4',385.44),
(5,2,'Family','Package 5',351.85),
(6,9,'Family','Package 6',280.18),
(7,7,'Family','Package 7',230.35),
(8,5,'Family','Package 8',423.13),
(9,7,'Family','Package 9',136.98),
(10,2,'Premium','Package 10',402.98);
/*!40000 ALTER TABLE `Package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reservation_date` date NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `customer_id` (`customer_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `Package` (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES
(21,11,8,'2024-08-23','2024-08-30','2024-08-19',331.08),
(22,7,2,'2024-06-01','2024-06-03','2024-05-06',434.95),
(23,13,8,'2024-09-21','2024-09-23','2024-08-24',391.26),
(24,12,5,'2025-03-24','2025-03-31','2025-03-15',568.85),
(25,10,8,'2024-10-26','2024-11-01','2024-10-23',316.87),
(26,12,3,'2025-02-25','2025-02-26','2025-02-19',716.82),
(27,6,2,'2024-09-21','2024-09-25','2024-09-05',881.55),
(28,7,6,'2024-12-31','2025-01-04','2024-12-20',616.42),
(29,6,1,'2025-03-29','2025-04-01','2025-03-19',504.53),
(30,4,2,'2024-05-20','2024-05-26','2024-05-02',258.88);
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_type` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES
(1,'Suite',1,'Important trial any participant thus. Also expect join out do.'),
(2,'Double',4,'Push purpose claim bank usually spring. Commercial make scene.'),
(3,'Single',5,'Enter onto character discover keep candidate. Over mention risk.'),
(4,'Double',5,'Economy ago move especially. Out head pick push.'),
(5,'Double',1,'Each general size through voice you show. Seat picture mission.'),
(6,'Single',2,'Local this notice but. Defense bed state seem enjoy everyone.'),
(7,'Suite',5,'Source win quickly really. Determine store street easy senior.'),
(8,'Suite',4,'State little game station fill card like. Black knowledge you.'),
(9,'Single',4,'Product magazine fill. Your discover seat blood through.'),
(10,'Single',3,'Exist station dark usually hit. Require road they court.');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SkiPass`
--

DROP TABLE IF EXISTS `SkiPass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SkiPass` (
  `skipass_id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) NOT NULL,
  `resort_id` int(11) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  PRIMARY KEY (`skipass_id`),
  KEY `reservation_id` (`reservation_id`),
  KEY `resort_id` (`resort_id`),
  CONSTRAINT `SkiPass_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation` (`reservation_id`),
  CONSTRAINT `SkiPass_ibfk_2` FOREIGN KEY (`resort_id`) REFERENCES `SkiResort` (`resort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SkiPass`
--

LOCK TABLES `SkiPass` WRITE;
/*!40000 ALTER TABLE `SkiPass` DISABLE KEYS */;
INSERT INTO `SkiPass` VALUES
(11,21,1,'2024-06-11','2024-06-16'),
(12,22,2,'2024-12-24','2024-12-27'),
(13,23,3,'2024-09-25','2024-09-28'),
(14,24,4,'2025-03-05','2025-03-09'),
(15,25,5,'2024-12-26','2024-12-30'),
(16,26,6,'2025-01-02','2025-01-06'),
(17,27,7,'2025-01-12','2025-01-17'),
(18,28,8,'2025-01-26','2025-01-29'),
(19,29,9,'2024-07-01','2024-07-06'),
(20,30,10,'2024-06-25','2024-06-26');
/*!40000 ALTER TABLE `SkiPass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SkiResort`
--

DROP TABLE IF EXISTS `SkiResort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SkiResort` (
  `resort_id` int(11) NOT NULL AUTO_INCREMENT,
  `resort_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `difficulty` varchar(100) NOT NULL,
  `size` int(11) NOT NULL,
  PRIMARY KEY (`resort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SkiResort`
--

LOCK TABLES `SkiResort` WRITE;
/*!40000 ALTER TABLE `SkiResort` DISABLE KEYS */;
INSERT INTO `SkiResort` VALUES
(1,'Robinstad Resort','New Kenneth','Hard',53),
(2,'Port Victoriaberg Resort','East Elizabethland','Easy',180),
(3,'West Randallfort Resort','Williamshaven','Medium',197),
(4,'Chandlerview Resort','North Brianshire','Easy',150),
(5,'Carmenland Resort','Valeriestad','Easy',71),
(6,'Marytown Resort','Stevenland','Hard',133),
(7,'South Matthew Resort','Michaelberg','Hard',173),
(8,'Port William Resort','Shahfort','Easy',180),
(9,'Port Andrew Resort','Josemouth','Hard',156),
(10,'Bennettstad Resort','Annchester','Easy',56);
/*!40000 ALTER TABLE `SkiResort` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-05-11 16:33:03
