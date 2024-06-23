-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: chocoshop
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'巧克力蛋糕123','甜點1',15.00,'/static/upload/1_spring_sakura.png','2024-06-21 03:28:08','2024-06-23 03:34:03'),(2,'草莓蛋糕','甜點',12.00,'/static/upload/4_dark_chocolate_blackberry.png','2024-06-21 03:28:08','2024-06-21 03:44:53'),(3,'藍莓鬆餅','早餐',8.00,'/static/upload/1_dark_chocolate_truffle.png','2024-06-21 03:28:08','2024-06-21 03:44:58'),(4,'123','456',789.00,'/static/upload/2_dark chocolate_gold.png','2024-06-21 03:45:26','2024-06-21 03:48:17'),(5,'564','789',10.00,'/static/upload/3_fall_pumpkin.png','2024-06-21 03:48:28','2024-06-21 06:52:31'),(6,'Product A','Category1',10.00,'/static/upload/1_spring_sakura.png','2024-06-21 04:07:04','2024-06-21 06:52:14'),(7,'Product B12','Category2',20.00,'/static/upload/3_fall_pumpkin.png','2024-06-21 04:07:04','2024-06-21 06:56:21'),(8,'123','123',123.00,'/static/upload/3_fall_pumpkin.png','2024-06-21 04:21:30','2024-06-21 06:59:52'),(9,'123','123',123.00,'/static/upload/4_winter_hot_cocoa.png','2024-06-21 06:52:41','2024-06-23 03:30:33'),(12,'777','777',777.00,'/static/upload/4_winter_hot_cocoa.png','2024-06-22 10:19:51','2024-06-23 03:30:39'),(13,'777','xxxssssssss',777.00,'/static/upload/2_summer mint.png','2024-06-23 03:33:00','2024-06-23 03:33:00');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-23 11:34:47
