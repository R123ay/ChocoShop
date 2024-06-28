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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (14,'黑松露巧克力禮盒','精品系列',599.00,'/static/upload/1_dark_chocolate_truffle.png','2024-06-28 07:20:14','2024-06-28 07:20:47'),(15,'金箔黑巧克力','精品系列',499.00,'/static/upload/2_dark chocolate_gold.png','2024-06-28 07:20:14','2024-06-28 07:20:52'),(16,'黑巧克力杏仁脆片','精品系列',299.00,'/static/upload/3_dark_chocolate_almond_crisps.png','2024-06-28 07:20:14','2024-06-28 07:20:56'),(17,'黑莓巧克力','精品系列',399.00,'/static/upload/4_dark_chocolate_blackberry.png','2024-06-28 07:20:14','2024-06-28 07:21:01'),(18,'牛奶巧克力榛果禮盒','送禮首選',399.00,'/static/upload/1_milk_chocolate_hazelnut.png','2024-06-28 07:20:14','2024-06-28 07:21:08'),(19,'白巧克力莓果禮盒','送禮首選',459.00,'/static/upload/2_white_chocolate_berry.png','2024-06-28 07:20:14','2024-06-28 07:21:13'),(20,'焦糖牛奶巧克力禮盒','送禮首選',429.00,'/static/upload/3_milk chocolate_caramel.png','2024-06-28 07:20:14','2024-06-28 07:21:17'),(21,'抹茶白巧克力','送禮首選',479.00,'/static/upload/4_matcha_white_chocolate.png','2024-06-28 07:20:14','2024-06-28 07:21:22'),(22,'春季櫻花巧克力','季節限定',539.00,'/static/upload/1_spring_sakura.png','2024-06-28 07:20:14','2024-06-28 07:21:43'),(23,'夏季薄荷巧克力','季節限定',509.00,'/static/upload/2_summer mint.png','2024-06-28 07:20:14','2024-06-28 07:22:19'),(24,'秋季南瓜香料巧克力','季節限定',559.00,'/static/upload/3_fall_pumpkin.png','2024-06-28 07:20:14','2024-06-28 07:22:25'),(25,'冬季熱可可巧克力','季節限定',589.00,'/static/upload/4_winter_hot_cocoa.png','2024-06-28 07:20:14','2024-06-28 07:22:30'),(26,'低糖黑巧克力','健康享受',349.00,'/static/upload/1_low_sugar_dark_chocolate.png','2024-06-28 07:20:14','2024-06-28 07:26:00'),(27,'高纖燕麥牛奶巧克力','健康享受',369.00,'/static/upload/2_high_fiber_oat_milk_chocolate.png','2024-06-28 07:20:14','2024-06-28 07:26:08'),(28,'純素白巧克力','健康享受',399.00,'/static/upload/3_vegan_white_chocolate.png','2024-06-28 07:20:14','2024-06-28 07:26:14'),(29,'綜合堅果黑巧克力','健康享受',459.00,'/static/upload/4_mixed_nut_dark_chocolate.png','2024-06-28 07:20:14','2024-06-28 07:26:19');
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

-- Dump completed on 2024-06-28 16:32:05
