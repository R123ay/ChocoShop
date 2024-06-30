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
  `description` text,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (14,'黑松露巧克力禮盒','精品系列',599.00,'/static/upload/1_dark_chocolate_truffle.png','2024-06-28 07:20:14','2024-06-30 07:11:21','精緻的松露巧克力，每顆巧克力都包裹著濃郁的可可粉，內餡柔滑，為您帶來極致的味覺享受。精美禮盒包裝，是送禮的絕佳選擇。'),(15,'金箔黑巧克力','精品系列',499.00,'/static/upload/2_dark chocolate_gold.png','2024-06-28 07:20:14','2024-06-30 06:39:22','高級黑巧克力外層覆蓋一層薄薄的金箔，口感豐富且帶有微苦的可可風味，帶給您尊貴的品味體驗。'),(16,'黑巧克力杏仁脆片','精品系列',299.00,'/static/upload/3_dark_chocolate_almond_crisps.png','2024-06-28 07:20:14','2024-06-30 06:39:22','香脆的杏仁包裹在濃郁的黑巧克力中，每一口都充滿驚喜與美味。精美包裝，適合送禮或自用。'),(17,'黑莓巧克力','精品系列',399.00,'/static/upload/4_dark_chocolate_blackberry.png','2024-06-28 07:20:14','2024-06-30 06:39:22','這款黑莓酒心巧克力結合了濃郁的黑巧克力外殼和香甜的黑莓酒心，每一口都能享受到細膩的巧克力香氣和微醺的酒香，為您帶來前所未有的味覺享受。高貴的禮盒包裝，既適合送禮又適合自用，讓您在任何時刻都能享受高端巧克力的奢華。'),(18,'牛奶巧克力榛果禮盒','送禮首選',399.00,'/static/upload/1_milk_chocolate_hazelnut.png','2024-06-28 07:20:14','2024-06-30 06:39:22','順滑的牛奶巧克力包裹著香脆的榛果，每一口都充滿甜美與香脆。高級禮盒包裝，送禮體面又貼心。'),(19,'白巧克力莓果禮盒','送禮首選',459.00,'/static/upload/2_white_chocolate_berry.png','2024-06-28 07:20:14','2024-06-30 06:39:22','香甜的白巧克力與混合莓果的完美結合，酸甜可口。精緻的禮盒包裝，讓您在送禮時傳達心意與祝福。'),(20,'焦糖牛奶巧克力禮盒','送禮首選',429.00,'/static/upload/3_milk chocolate_caramel.png','2024-06-28 07:20:14','2024-06-30 06:39:22','濃郁的牛奶巧克力與甜蜜的焦糖相融合，口感香甜濃郁。高級禮盒包裝，適合送給親朋好友。'),(21,'抹茶白巧克力','送禮首選',479.00,'/static/upload/4_matcha_white_chocolate.png','2024-06-28 07:20:14','2024-06-30 06:39:22','這款抹茶白巧克力結合了細膩的白巧克力與清新的抹茶風味，每一口都能品嚐到兩者完美的融合。抹茶的微苦和白巧克力的甜美相互平衡，帶來絕妙的味覺享受。高級禮盒包裝，無論是送禮還是自用，都能彰顯您的高雅品味，讓您在任何時刻都能享受高端巧克力的奢華。'),(22,'春季櫻花巧克力','季節限定',539.00,'/static/upload/1_spring_sakura.png','2024-06-28 07:20:14','2024-06-30 06:39:22','春季限定的櫻花口味巧克力，淡淡的櫻花香氣與甜美的巧克力完美結合，為您帶來春天的味道。限定包裝，數量有限。'),(23,'夏季薄荷巧克力','季節限定',509.00,'/static/upload/2_summer mint.png','2024-06-28 07:20:14','2024-06-30 06:39:22','夏季限定的薄荷口味巧克力，清新的薄荷香氣與濃郁的黑巧克力相結合，為您帶來清涼一夏的感受。清爽包裝，適合夏日享用。'),(24,'秋季南瓜香料巧克力','季節限定',559.00,'/static/upload/3_fall_pumpkin.png','2024-06-28 07:20:14','2024-06-30 06:39:22','秋季限定的南瓜香料巧克力，濃郁的南瓜香氣與巧克力完美結合，為您帶來秋天的豐收味道。溫暖包裝，適合秋季享用。'),(25,'冬季熱可可巧克力','季節限定',589.00,'/static/upload/4_winter_hot_cocoa.png','2024-06-28 07:20:14','2024-06-30 06:56:35','冬季限定的熱可可口味巧克力，濃郁的巧克力香氣與暖暖的可可風味，為您帶來冬天的溫暖感受。溫馨包裝，適合冬季享用。'),(26,'低糖黑巧克力','健康享受',349.00,'/static/upload/1_low_sugar_dark_chocolate.png','2024-06-28 07:20:14','2024-06-30 06:39:22','低糖配方的黑巧克力，保持濃郁的可可風味，適合關注健康的您。健康包裝，無負擔的美味選擇。'),(27,'高纖燕麥牛奶巧克力','健康享受',369.00,'/static/upload/2_high_fiber_oat_milk_chocolate.png','2024-06-28 07:20:14','2024-06-30 06:39:22','富含高纖維的燕麥與順滑的牛奶巧克力結合，口感香甜且富有營養。健康包裝，適合日常享用。'),(28,'純素白巧克力','健康享受',399.00,'/static/upload/3_vegan_white_chocolate.png','2024-06-28 07:20:14','2024-06-30 06:39:22','純素配方的白巧克力，不含任何動物成分，適合素食者和乳糖不耐症人士。環保包裝，健康又美味。'),(29,'綜合堅果黑巧克力','健康享受',459.00,'/static/upload/4_mixed_nut_dark_chocolate.png','2024-06-28 07:20:14','2024-06-30 06:39:22','這款綜合堅果黑巧克力結合了濃郁的黑巧克力與多種營養豐富的堅果，包括杏仁、核桃和腰果。每一口都能品嚐到堅果的香脆和黑巧克力的濃郁，既健康又美味。環保包裝，適合關注健康的您，無論是日常享用還是作為送禮選擇，都能彰顯您的健康生活理念和高雅品味。');
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

-- Dump completed on 2024-06-30 15:19:20
