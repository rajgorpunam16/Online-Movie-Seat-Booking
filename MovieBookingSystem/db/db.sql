CREATE DATABASE  IF NOT EXISTS `movie_booking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `movie_booking`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: movie_booking
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `show_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `booking_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT 'CONFIRMED',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `show_id` (`show_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (27,1,11,500.00,'2026-08-12 05:00:00','CONFIRMED','2026-08-12 16:42:38'),(28,5,12,560.00,'2026-08-12 05:45:00','CONFIRMED','2026-08-12 16:42:38'),(31,9,8,460.00,'2026-08-12 08:40:00','CANCELLED','2026-08-12 16:42:38'),(33,12,13,1000.00,'2026-08-21 12:18:02','CONFIRMED','2026-08-21 12:18:02'),(34,12,8,720.00,'2026-08-25 11:04:10','CONFIRMED','2026-08-25 11:04:10'),(35,12,8,540.00,'2026-08-28 08:08:19','CONFIRMED','2026-08-28 08:08:19'),(36,12,8,540.00,'2026-08-28 08:11:11','CONFIRMED','2026-08-28 08:11:11'),(37,12,8,180.00,'2026-08-28 08:18:05','CONFIRMED','2026-08-28 08:18:05'),(38,12,13,500.00,'2026-08-28 10:56:52','CONFIRMED','2026-08-28 10:56:52'),(39,12,22,250.00,'2026-08-28 11:28:22','CONFIRMED','2026-08-28 11:28:22'),(40,12,7,150.00,'2026-09-02 13:10:40','CONFIRMED','2026-09-02 13:10:40'),(41,12,13,500.00,'2026-09-03 06:29:02','CONFIRMED','2026-09-03 06:29:02'),(42,12,13,250.00,'2026-09-03 07:16:42','CONFIRMED','2026-09-03 07:16:42'),(43,12,8,360.00,'2026-09-07 16:29:14','CONFIRMED','2026-09-07 16:29:14');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `description` text,
  `poster` text,
  `poster_data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (2,'Avengers: Endgame','Action',181,'The Avengers assemble for their final battle.','https://example.com/avengers.jpg',NULL),(3,'Inception','Sci-Fi',148,'A skilled thief enters dreams to steal secrets.','https://example.com/inception.jpg',NULL),(4,'The Dark Knight','Action',152,'Batman faces the Joker in Gotham City.','https://example.com/dark-knight.jpg',NULL),(5,'Inception','Sci-Fi',148,'A skilled thief enters the dreams of others to steal secrets and perform an impossible task.','https://image.tmdb.org/t/p/w500/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg',NULL),(6,'Interstellar','Sci-Fi',169,'A group of astronauts travel through a wormhole in search of a new home for humanity.','https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',NULL),(7,'The Dark Knight','Action',152,'Batman faces a criminal mastermind who creates chaos across Gotham City.','https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',NULL),(8,'ds','Action',3,'ds','https://www.bing.com/images/search?view=detailV2&ccid=DVYDQX85&id=1956BB808D32A981E27E8E37A47BF0D2288C124A&thid=OIP.DVYDQX85lQdcPGsSxAd-rgHaKy&mediaurl=https%3A%2F%2Foriginalvintagemovieposters.com%2Fwp-content%2Fuploads%2F2024%2F07%2FAVENGERS-END-GAME-10980-scaled.jpg&exph=2560&expw=1757&q=movie+psoter&ck=DACE177EC7CC05DB4285A8A4183E62A0&selectedindex=2&itb=0&ajaxhist=0&ajaxserp=0&first=1&shtc=0&shth=OIP.DVYDQX85lQdcPGsSxAd-rgHaKy&shsc=idp&form=EX0050&shid=ee9d6abf-cde8-48c4-9731-ec207d3f6df5&shtp=GetUrl&shtk=QVZFTkdFUlMgRU5ER0FNRSwgT3JpZ2luYWwgUm9sbGVkIE1hcnZlbCBTdHVkaW9zIE1vdmllIFBvc3RlciAuLi4%3D&shdk=Rm91bmQgb24gQmluZyBmcm9tIG9yaWdpbmFsdmludGFnZW1vdmllcG9zdGVycy5jb20%3D&shhk=DgIuMeMeWApZ2Tbxp0hDZVUJqthZfUVqTwev2uwa5x8%3D',NULL),(9,'sd','Horror',3,'sdc','https://www.bing.com/images/search?view=detailV2&ccid=DVYDQX85&id=1956BB808D32A981E27E8E37A47BF0D2288C124A&thid=OIP.DVYDQX85lQdcPGsSxAd-rgHaKy&mediaurl=https%3A%2F%2Foriginalvintagemovieposters.com%2Fwp-content%2Fuploads%2F2024%2F07%2FAVENGERS-END-GAME-10980-scaled.jpg&exph=2560&expw=1757&q=movie+psoter&ck=DACE177EC7CC05DB4285A8A4183E62A0&selectedindex=2&itb=0&ajaxhist=0&ajaxserp=0&first=1&shtc=0&shth=OIP.DVYDQX85lQdcPGsSxAd-rgHaKy&shsc=idp&form=EX0050&shid=ee9d6abf-cde8-48c4-9731-ec207d3f6df5&shtp=GetUrl&shtk=QVZFTkdFUlMgRU5ER0FNRSwgT3JpZ2luYWwgUm9sbGVkIE1hcnZlbCBTdHVkaW9zIE1vdmllIFBvc3RlciAuLi4%3D&shdk=Rm91bmQgb24gQmluZyBmcm9tIG9yaWdpbmFsdmludGFnZW1vdmllcG9zdGVycy5jb20%3D&shhk=DgIuMeMeWApZ2Tbxp0hDZVUJqthZfUVqTwev2uwa5x8%3D',NULL),(10,'dd','Action',3,'sfsf','https://www.bing.com/images/search?view=detailV2&ccid=DVYDQX85&id=1956BB808D32A981E27E8E37A47BF0D2288C124A&thid=OIP.DVYDQX85lQdcPGsSxAd-rgHaKy&mediaurl=https%3A%2F%2Foriginalvintagemovieposters.com%2Fwp-content%2Fuploads%2F2024%2F07%2FAVENGERS-END-GAME-10980-scaled.jpg&exph=2560&expw=1757&q=movie+psoter&ck=DACE177EC7CC05DB4285A8A4183E62A0&selectedindex=2&itb=0&ajaxhist=0&ajaxserp=0&first=1&shtc=0&shth=OIP.DVYDQX85lQdcPGsSxAd-rgHaKy&shsc=idp&form=EX0050&shid=ee9d6abf-cde8-48c4-9731-ec207d3f6df5&shtp=GetUrl&shtk=QVZFTkdFUlMgRU5ER0FNRSwgT3JpZ2luYWwgUm9sbGVkIE1hcnZlbCBTdHVkaW9zIE1vdmllIFBvc3RlciAuLi4%3D&shdk=Rm91bmQgb24gQmluZyBmcm9tIG9yaWdpbmFsdmludGFnZW1vdmllcG9zdGVycy5jb20%3D&shhk=DgIuMeMeWApZ2Tbxp0hDZVUJqthZfUVqTwev2uwa5x8%3D',NULL);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `payments_ibfk_1` (`booking_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (3,28,2323.00,'CREDIT_CARD','PENDING','23rrrrrr3','2026-08-12 22:51:12'),(4,33,1000.00,'WALLET','SUCCESS','TXN1787314682037','2026-08-21 17:48:02'),(5,34,720.00,'WALLET','SUCCESS','TXN1787655850060','2026-08-25 16:34:10'),(6,35,540.00,'WALLET','SUCCESS','TXN1787904499693','2026-08-28 13:38:19'),(7,36,540.00,'WALLET','SUCCESS','TXN1787904671151','2026-08-28 13:41:11'),(8,37,180.00,'WALLET','SUCCESS','TXN1787905085226','2026-08-28 13:48:05'),(9,38,500.00,'WALLET','SUCCESS','TXN1787914612480','2026-08-28 16:26:52'),(10,39,250.00,'WALLET','SUCCESS','TXN1787916502734','2026-08-28 16:58:22'),(11,40,150.00,'WALLET','SUCCESS','TXN1788354640352','2026-09-02 18:40:40'),(12,41,500.00,'WALLET','SUCCESS','TXN1788416942334','2026-09-03 11:59:02'),(13,42,250.00,'WALLET','SUCCESS','TXN1788419802437','2026-09-03 12:46:42'),(14,43,360.00,'WALLET','SUCCESS','TXN1788798554381','2026-09-07 21:59:14');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `show_id` int DEFAULT NULL,
  `seat_number` varchar(10) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'AVAILABLE',
  `blocked_by` varchar(255) DEFAULT NULL,
  `blocked_until` datetime DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_show_seat` (`show_id`,`seat_number`),
  CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (6,7,'A1','AVAILABLE',NULL,NULL,NULL),(7,7,'A2','BOOKED','3B08CC44B0960E2B8094733F271968EB','2026-09-02 18:42:27',40),(8,7,'A3','BOOKED',NULL,NULL,NULL),(9,7,'A4','AVAILABLE',NULL,NULL,NULL),(10,8,'A5','BOOKED','47C1D92AE7648830C50EF161FC3AFC56','2026-08-28 13:40:02',NULL),(27,22,'A1','BOOKED','3E7DAE4E063F624EC8BDB1A344FE16C7','2026-08-28 17:00:15',39),(33,13,'A2','BOOKED','3E7DAE4E063F624EC8BDB1A344FE16C7','2026-08-28 16:28:45',NULL),(34,13,'A3','BOOKED',NULL,NULL,NULL),(35,13,'A4','BOOKED',NULL,NULL,NULL),(36,13,'A5','BOOKED',NULL,NULL,NULL),(37,13,'B1','BOOKED',NULL,NULL,NULL),(38,13,'B2','BOOKED','3E7DAE4E063F624EC8BDB1A344FE16C7','2026-08-28 16:28:45',NULL),(39,13,'B3','BOOKED','13B38345CA75305488F4924003C45BFA','2026-09-03 12:00:27',41),(40,13,'B4','BOOKED','13B38345CA75305488F4924003C45BFA','2026-09-03 12:00:27',41),(41,13,'B5','AVAILABLE',NULL,NULL,NULL),(105,8,'A1','BOOKED','E64971F9DE6EB50C3C5694D1FFB545DD','2026-08-25 16:42:58',NULL),(106,8,'A2','BOOKED','E64971F9DE6EB50C3C5694D1FFB545DD','2026-08-25 16:42:58',NULL),(107,8,'A3','BOOKED','E64971F9DE6EB50C3C5694D1FFB545DD','2026-08-25 16:42:58',NULL),(108,8,'A4','BOOKED','E64971F9DE6EB50C3C5694D1FFB545DD','2026-08-25 16:42:58',NULL),(109,8,'A6','BOOKED','CEAF336F26AF364D723475C3310CE4D9','2026-09-07 22:00:09',43),(110,8,'A7','BOOKED','CEAF336F26AF364D723475C3310CE4D9','2026-09-07 22:00:09',43),(111,8,'A8','BOOKED','47C1D92AE7648830C50EF161FC3AFC56','2026-08-28 13:49:57',NULL),(112,8,'B1','BOOKED','47C1D92AE7648830C50EF161FC3AFC56','2026-08-28 13:43:03',NULL),(113,8,'B2','BOOKED','47C1D92AE7648830C50EF161FC3AFC56','2026-08-28 13:43:03',NULL),(114,8,'B3','BOOKED','47C1D92AE7648830C50EF161FC3AFC56','2026-08-28 13:43:03',NULL),(115,8,'B4','BOOKED','47C1D92AE7648830C50EF161FC3AFC56','2026-08-28 13:40:02',NULL),(116,8,'B5','BOOKED','47C1D92AE7648830C50EF161FC3AFC56','2026-08-28 13:40:02',NULL),(117,8,'B6','AVAILABLE',NULL,NULL,NULL),(118,8,'B7','AVAILABLE',NULL,NULL,NULL),(119,8,'B8','AVAILABLE',NULL,NULL,NULL);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int DEFAULT NULL,
  `show_time` datetime NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shows_movie` (`movie_id`),
  CONSTRAINT `fk_shows_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (7,4,'2026-08-15 10:00:00',150.00),(8,3,'2026-08-15 14:00:00',180.00),(9,3,'2026-08-15 18:00:00',200.00),(10,2,'2026-08-16 11:00:00',150.00),(11,2,'2026-08-16 15:30:00',180.00),(12,2,'2026-08-16 21:00:00',220.00),(13,2,'2026-08-15 10:00:00',250.00),(14,2,'2026-08-15 14:00:00',280.00),(15,2,'2026-08-15 19:00:00',320.00),(16,3,'2026-08-15 11:00:00',220.00),(17,3,'2026-08-15 16:00:00',250.00),(18,3,'2026-08-15 21:00:00',300.00),(19,4,'2026-08-15 10:30:00',200.00),(20,4,'2026-08-15 15:00:00',230.00),(21,4,'2026-08-15 20:30:00',280.00),(22,2,'2026-08-15 10:00:00',250.00),(23,2,'2026-08-15 14:00:00',300.00),(24,3,'2026-08-15 18:00:00',280.00),(25,4,'2026-08-15 21:00:00',350.00),(26,3,'2026-08-20 19:15:00',10000.00),(27,2,'2026-08-16 18:00:00',250.00),(28,2,'2026-08-16 18:00:00',250.00),(29,5,'2026-08-25 18:00:00',180.00),(30,5,'2026-08-25 21:00:00',220.00),(31,6,'2026-08-25 17:30:00',200.00),(32,6,'2026-08-25 21:00:00',250.00),(33,7,'2026-08-25 19:00:00',180.00);
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'USER',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `unique_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'PUNAM','PUNAM@GMAIL.COM','Punam@123','USER'),(5,'PUNAM','PUNAM@GMAIL.CO','15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225','USER'),(6,'Admin','admin@gmail.com','e86f78a8a3caf0b60d8e74e5942aa6d86dc150cd3c03338aef25b7d2d7e3acc7','ADMIN'),(8,'Admin1','admin','e86f78a8a3caf0b60d8e74e5942aa6d86dc150cd3c03338aef25b7d2d7e3acc7','ADMIN'),(9,'Admin2','admin@123','e86f78a8a3caf0b60d8e74e5942aa6d86dc150cd3c03338aef25b7d2d7e3acc7','ADMIN'),(10,'Admin2','punam@123','e86f78a8a3caf0b60d8e74e5942aa6d86dc150cd3c03338aef25b7d2d7e3acc7','ADMIN'),(12,'Test User','testuser@gmail.com','8776f108e247ab1e2b323042c049c266407c81fbad41bde1e8dfc1bb66fd267e','USER'),(13,'Test User','test@gmail.com','test123','USER'),(14,'Demo User','demo@gmail.com','demo123','USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-08 21:07:40
