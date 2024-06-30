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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `delivery_date` date NOT NULL,
  `purchase_date` datetime NOT NULL,
  `total_price` double NOT NULL,
  `status` varchar(255) DEFAULT '待確認',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Alice','0912345678','alice@example.com','貨到付款','2024-06-27','2024-06-23 15:25:00',507,'備貨中'),(2,'Bob','0923456789','bob@example.com','cash_on_delivery','2024-06-23','2024-06-23 15:26:00',0,'待確認'),(3,'Charlie','0934567890','charlie@example.com','cash_on_delivery','2024-07-03','2024-06-23 15:38:51',384,'待確認'),(4,'David','0945678901','david@example.com','cash_on_delivery','2024-06-23','2024-06-23 15:56:21',123,'運送中'),(5,'Eve','0956789012','eve@example.com','cash_on_delivery','2024-06-25','2024-06-25 22:49:15',8874,'待確認'),(6,'Frank','0967890123','frank@example.com','貨到付款','2024-06-26','2024-06-26 00:11:41',4881,'待確認'),(7,'Grace','0978901234','grace@example.com','貨到付款','2024-06-26','2024-06-26 00:12:24',0,'待確認'),(8,'Hannah','0989012345','hannah@example.com','貨到付款','2024-06-26','2024-06-26 00:12:40',0,'待確認'),(9,'Ivy','0990123456','ivy@example.com','貨到付款','2024-06-26','2024-06-26 11:32:42',0,'待確認'),(10,'Jack','0901234567','jack@example.com','貨到付款','2024-06-26','2024-06-26 11:37:09',0,'待確認'),(11,'Kathy','0912345678','kathy@example.com','貨到付款','2024-06-26','2024-06-26 11:48:28',600,'待確認'),(12,'Leo','0923456789','leo@example.com','貨到付款','2024-06-26','2024-06-26 13:44:21',600,'待確認'),(13,'Mona','0934567890','mona@example.com','貨到付款','2024-06-26','2024-06-26 13:48:03',600,'待確認'),(14,'Nina','0945678901','nina@example.com','貨到付款','2024-06-26','2024-06-26 13:52:30',600,'待確認'),(15,'Oscar','0956789012','oscar@example.com','貨到付款','2024-06-26','2024-06-26 13:52:57',0,'待確認'),(16,'Paul','0967890123','paul@example.com','貨到付款','2024-06-26','2024-06-26 13:53:51',0,'待確認'),(17,'Quincy','0978901234','quincy@example.com','貨到付款','2024-06-26','2024-06-26 14:24:01',600,'待確認'),(18,'Rita','0989012345','rita@example.com','貨到付款','2024-06-26','2024-06-26 14:28:39',0,'待確認'),(19,'Sam','0990123456','sam@example.com','貨到付款','2024-06-26','2024-06-26 14:29:51',0,'待確認'),(20,'Tina','0901234567','tina@example.com','貨到付款','2024-06-26','2024-06-26 14:35:15',600,'待確認'),(21,'Uma','0912345678','uma@example.com','貨到付款','2024-06-26','2024-06-26 14:41:32',0,'待確認'),(22,'Victor','0923456789','victor@example.com','貨到付款','2024-06-26','2024-06-26 14:41:37',0,'待確認'),(23,'Wendy','0934567890','wendy@example.com','貨到付款','2024-06-26','2024-06-26 14:43:15',0,'待確認'),(24,'Xander','0945678901','xander@example.com','貨到付款','2024-06-26','2024-06-26 14:47:30',0,'待確認'),(25,'Yvonne','0956789012','yvonne@example.com','貨到付款','2024-06-26','2024-06-26 15:00:42',0,'待確認'),(26,'Zach','0967890123','zach@example.com','貨到付款','2024-06-28','2024-06-28 13:50:41',1100,'待確認'),(27,'123','1234567890','123@123','貨到付款','2024-06-28','2024-06-28 14:07:51',600,'待確認'),(28,'123','4561234567','132@123','貨到付款','2024-06-28','2024-06-28 15:32:59',1800,'待確認'),(29,'123','4561234567','132@123','貨到付款','2024-06-28','2024-06-28 15:33:43',0,'待確認'),(30,'123','1231231231','123@123','貨到付款','2024-06-28','2024-06-28 15:36:02',599,'待確認'),(31,'Test','1234567890','jane@example.com','貨到付款','2024-06-29','2024-06-29 15:12:25',599,'待確認'),(32,'Test','1234567890','jane@example.com','貨到付款','2024-06-29','2024-06-29 15:16:50',0,'待確認'),(33,'Test','1234567890','jane@example.com','貨到付款','2024-06-29','2024-06-29 15:28:38',0,'待確認'),(34,'Test','1234567890','jane@example.com','貨到付款','2024-06-29','2024-06-29 15:29:50',0,'待確認'),(35,'Test','1234567890','jane@example.com','貨到付款','2024-06-29','2024-06-29 16:06:15',0,'待確認'),(36,'Test','1234567890','jane@example.com','貨到付款','2024-06-29','2024-06-29 16:06:22',0,'待確認'),(37,'Test','1234567890','jane@example.com','貨到付款','2024-06-29','2024-06-29 16:06:26',0,'待確認'),(38,'Test','1234567890','jane@example.com','貨到付款','2024-06-29','2024-06-29 16:06:31',0,'待確認'),(39,'Test','1234567890','jane@example.com','貨到付款','2024-06-29','2024-06-29 16:06:41',0,'待確認');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-30 15:19:20
