-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: food_application
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
-- Temporary view structure for view `activeusers`
--

DROP TABLE IF EXISTS `activeusers`;
/*!50001 DROP VIEW IF EXISTS `activeusers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `activeusers` AS SELECT 
 1 AS `UserID`,
 1 AS `Username`,
 1 AS `Password`,
 1 AS `Email`,
 1 AS `Address`,
 1 AS `Role`,
 1 AS `CreatedDate`,
 1 AS `LastLoginDate`,
 1 AS `IsDeleted`,
 1 AS `UpdatedDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `RestaurantID` int NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `Description` text,
  `Price` decimal(10,2) NOT NULL,
  `IsAvailable` tinyint(1) DEFAULT '1',
  `ImagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `fk_menu_restaurant` (`RestaurantID`),
  CONSTRAINT `fk_menu_restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Margherita Pizza','Classic cheese pizza with fresh basil',299.00,1,'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=600&q=80'),(2,1,'Farmhouse Pizza','Loaded with fresh farmhouse veggies',349.00,1,'https://images.unsplash.com/photo-1565299624-2999522123ee?auto=format&fit=crop&w=600&q=80'),(3,1,'Garlic Bread','Garlic butter toasted french bread',149.00,1,'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=600&q=80'),(4,1,'Pasta Alfredo','Creamy white sauce penne pasta',249.00,1,'https://images.unsplash.com/photo-1621996346565-e3bb64e8150a?auto=format&fit=crop&w=600&q=80'),(5,1,'Chocolate Lava Cake','Warm chocolate dessert with gooey center',199.00,1,'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=600&q=80'),(6,2,'Chicken Biryani','Spicy fragrant basmati rice with chicken',249.00,1,'https://images.unsplash.com/photo-1631515243361-c5e324d1db14?auto=format&fit=crop&w=600&q=80'),(7,2,'Mutton Biryani','Hyderabadi style slow cooked mutton biryani',329.00,1,'https://images.unsplash.com/photo-1701579230301-20465344c747?auto=format&fit=crop&w=600&q=80'),(8,2,'Egg Biryani','Fragrant biryani rice with boiled eggs',199.00,1,'https://images.unsplash.com/photo-1633945274405-b6c8069047b0?auto=format&fit=crop&w=600&q=80'),(9,2,'Chicken 65','Spicy deep fried chicken chunks',179.00,1,'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?auto=format&fit=crop&w=600&q=80'),(10,2,'Gulab Jamun','Sweet milk-solid balls in sugar syrup',89.00,1,'https://images.unsplash.com/photo-1601050690597-df056fb4ce78?auto=format&fit=crop&w=600&q=80'),(11,3,'Whopper Burger','Signature flame-grilled veg burger',169.00,1,'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=600&q=80'),(12,3,'Crispy Chicken Burger','Crispy chicken patty with mayo and lettuce',149.00,1,'https://images.unsplash.com/photo-1625813506062-0aeb1d7a094b?auto=format&fit=crop&w=600&q=80'),(13,3,'Peri Peri Fries','Spicy french fries tossed in peri peri mix',119.00,1,'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?auto=format&fit=crop&w=600&q=80'),(14,3,'Strawberry Milkshake','Creamy milkshake made with fresh strawberries',139.00,1,'https://images.unsplash.com/photo-1579954115545-a95591f28bfc?auto=format&fit=crop&w=600&q=80'),(15,4,'Masala Dosa','Crispy crepe with spiced potato filling',90.00,1,'https://images.unsplash.com/photo-1668236543090-82eba5ee5976?auto=format&fit=crop&w=600&q=80'),(16,4,'Idli Sambar','Steamed rice cakes served with sambar and chutney',60.00,1,'https://images.unsplash.com/photo-1589301760014-d929f3979dbc?auto=format&fit=crop&w=600&q=80'),(17,4,'Medu Vada','Crispy deep fried lentil donuts',70.00,1,'https://images.unsplash.com/photo-1626132647523-66f5bf380027?auto=format&fit=crop&w=600&q=80'),(18,4,'Filter Coffee','Traditional South Indian frothy coffee',45.00,1,'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=600&q=80'),(19,5,'Hakka Noodles','Stir fried noodles with fresh vegetables',160.00,1,'https://images.unsplash.com/photo-1585032226651-759b368d7246?auto=format&fit=crop&w=600&q=80'),(20,5,'Schezwan Fried Rice','Spicy fried rice with schezwan sauce',180.00,1,'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=600&q=80'),(21,5,'Gobi Manchurian','Crispy cauliflower florets in spicy sauce',150.00,1,'https://images.unsplash.com/photo-1626132647523-66f5bf380027?auto=format&fit=crop&w=600&q=80'),(22,5,'Chicken Momos','Steamed dumplings filled with minced chicken',140.00,1,'https://images.unsplash.com/photo-1625220194771-7ebdea0b70b4?auto=format&fit=crop&w=600&q=80'),(23,6,'Arrabiata Pasta','Spicy red sauce penne pasta with olives',230.00,1,'https://images.unsplash.com/photo-1608897013039-887f21d8c804?auto=format&fit=crop&w=600&q=80'),(24,6,'Cheesy Garlic Bread','Toasted bread with melted mozzarella cheese',160.00,1,'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=600&q=80'),(25,6,'Creamy Pesto Pasta','Penne tossed in rich basil pesto sauce',260.00,1,'https://images.unsplash.com/photo-1621996346565-e3bb64e8150a?auto=format&fit=crop&w=600&q=80'),(26,7,'Pani Puri','Crispy hollow puris filled with spicy mint water',60.00,1,'https://images.unsplash.com/photo-1601050690597-df056fb4ce78?auto=format&fit=crop&w=600&q=80'),(27,7,'Samosa Chat','Crushed samosa topped with chole and chutneys',80.00,1,'https://images.unsplash.com/photo-1626132647523-66f5bf380027?auto=format&fit=crop&w=600&q=80'),(28,7,'Pav Bhaji','Spiced mixed vegetable mash with buttered buns',100.00,1,'https://images.unsplash.com/photo-1601050690597-df056fb4ce78?auto=format&fit=crop&w=600&q=80'),(29,8,'Butter Chicken','Tandoori chicken chunks in rich tomato gravy',280.00,1,'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?auto=format&fit=crop&w=600&q=80'),(30,8,'Paneer Butter Masala','Soft cottage cheese cubes in creamy gravy',240.00,1,'https://images.unsplash.com/photo-1631452180519-c014fe946bc7?auto=format&fit=crop&w=600&q=80'),(31,8,'Garlic Naan','Traditional clay oven flatbread with garlic',60.00,1,'https://images.unsplash.com/photo-1601050690597-df056fb4ce78?auto=format&fit=crop&w=600&q=80'),(32,8,'Dal Makhani','Slow cooked black lentils with rich cream',190.00,1,'https://images.unsplash.com/photo-1546833999-b9f581a1996d?auto=format&fit=crop&w=600&q=80'),(33,9,'Tandoori Chicken','Spicy yogurt marinated grilled chicken legs',250.00,1,'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?auto=format&fit=crop&w=600&q=80'),(34,9,'Chicken Tikka','Boneless chargrilled spicy chicken chunks',220.00,1,'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?auto=format&fit=crop&w=600&q=80'),(35,9,'Barbecue Wings','Smoked chicken wings glazed in BBQ sauce',180.00,1,'https://images.unsplash.com/photo-1567620832903-9fc6debc209f?auto=format&fit=crop&w=600&q=80'),(36,10,'Choco Fudge Sundae','Vanilla ice cream with hot chocolate fudge',179.00,1,'https://images.unsplash.com/photo-1563805042-7684c019e1cb?auto=format&fit=crop&w=600&q=80'),(37,10,'Red Velvet Pastry','Rich red velvet sponge layer cake slice',120.00,1,'https://images.unsplash.com/photo-1588195538326-c5b1e9f80a1b?auto=format&fit=crop&w=600&q=80'),(38,10,'Mango Waffle','Freshly baked waffle with mango compote',199.00,1,'https://images.unsplash.com/photo-1592417817098-8f3d6eb19675?auto=format&fit=crop&w=600&q=80'),(39,10,'Brownie with Ice Cream','Sizzling brownie topped with vanilla scoop',159.00,1,'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=600&q=80');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `OrderItemID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `Quantity` int NOT NULL,
  `ItemTotal` decimal(10,2) DEFAULT NULL,
  `MenuID` int NOT NULL,
  PRIMARY KEY (`OrderItemID`),
  KEY `fk_orderitem_order` (`OrderID`),
  KEY `fk_orderitem_menu` (`MenuID`),
  CONSTRAINT `fk_orderitem_menu` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`) ON DELETE CASCADE,
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`OrderID`) REFERENCES `ordertable` (`OrderID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordertable`
--

DROP TABLE IF EXISTS `ordertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordertable` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `OrderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `Status` enum('PENDING','CONFIRMED','PREPARING','OUT_FOR_DELIVERY','DELIVERED','CANCELLED') DEFAULT 'PENDING',
  `PaymentMethod` enum('CASH','CARD','UPI') DEFAULT NULL,
  `RestaurantID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_order_user` (`UserID`),
  KEY `fk_order_restaurant` (`RestaurantID`),
  CONSTRAINT `fk_order_restaurant` FOREIGN KEY (`RestaurantID`) REFERENCES `restaurant` (`RestaurantID`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertable`
--

LOCK TABLES `ordertable` WRITE;
/*!40000 ALTER TABLE `ordertable` DISABLE KEYS */;
INSERT INTO `ordertable` VALUES (3,11,'2026-06-01 19:21:00',79.00,'PENDING','CASH',6),(4,12,'2026-06-01 19:21:28',600.00,'DELIVERED','CASH',7),(5,12,'2026-06-01 19:22:28',89.00,'DELIVERED','CARD',5);
/*!40000 ALTER TABLE `ordertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `RestaurantID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `CuisineType` varchar(100) DEFAULT NULL,
  `DeliveryTime` int DEFAULT NULL,
  `Address` text,
  `Rating` decimal(2,1) DEFAULT '0.0',
  `IsActive` tinyint(1) DEFAULT '1',
  `ImagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RestaurantID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Pizza Palace','Italian',30,'T Nagar, Chennai',4.5,1,'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38'),(2,'Biryani House','Biryani',25,'Velachery, Chennai',4.7,1,'https://images.unsplash.com/photo-1589302168068-964664d93dc0'),(3,'Burger King','Fast Food',20,'Anna Nagar, Chennai',4.3,1,'https://images.unsplash.com/photo-1550547660-d9450f859349'),(4,'Dosa Corner','South Indian',15,'Tambaram, Chennai',4.8,1,'https://images.unsplash.com/photo-1631452180519-c014fe946bc7'),(5,'Wok Express','Chinese',35,'OMR, Chennai',4.4,1,'https://images.unsplash.com/photo-1603133872878-684f208fb84b'),(6,'Pasta Point','Italian',40,'Adyar, Chennai',4.2,1,'https://images.unsplash.com/photo-1628294896516-344152572ee8'),(7,'Chat Bazaar','Street Food',20,'Kodambakkam, Chennai',4.1,1,'https://images.unsplash.com/photo-1601050690597-df0568f70950'),(8,'The Spice Table','North Indian',30,'Nungambakkam, Chennai',4.9,1,'https://images.unsplash.com/photo-1563379926898-05f4575a45d8'),(9,'Grill Hub','Grill & BBQ',35,'Porur, Chennai',4.6,1,'https://images.unsplash.com/photo-1571091718767-18b5b1457add'),(10,'Dessert Studio','Desserts',25,'Vadapalani, Chennai',4.8,1,'https://images.unsplash.com/photo-1565958011703-44f9829ba187');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Role` enum('Customer','Restaurant Owner','Delivery Partner','Admin') NOT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LastLoginDate` timestamp NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `UpdatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `idx_user_role` (`Role`),
  KEY `idx_user_deleted` (`IsDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'iamkr27','$2a$12$9yJe.k/rrMWGgkQB3anpSOnMTkHl3xVdEkDxOqtYgUCK5ehmAjKjy','kathir@gmail.com','chennai','Customer','2026-06-16 12:54:23',NULL,0,'2026-06-16 12:54:23'),(3,'kathirvel balan','$2a$12$O0h2MTO2Fo0c4KeFIzov2OC.eTRFkQnnqV1V6xeNHt4JCu2y0MFuW','kathir12@gmail.com','chennai','Customer','2026-06-16 13:24:51',NULL,0,'2026-06-16 13:24:51'),(4,'kathirvel ','$2a$12$HAanVdhVwwXwqYh8PM02AOCBU1lIkP5cJIT6XmKCFAKDbG2eFiHsy','kathir27@gmail.com','chennai','Customer','2026-06-16 13:26:25',NULL,0,'2026-06-16 13:26:25'),(5,'ANNAMALAI','$2a$12$W8qLZO2AS9XAH3zxMccVeOexbSaXKhO8S8lQ8B8kJg1l6ksvODJ7q','annamalai@gmail.com','kalakad','Customer','2026-06-16 16:18:11',NULL,0,'2026-06-16 16:18:11'),(6,'kathir','$2a$12$qSow7sqntt7atubY33Kp1uNYB23TotvU0rWnTW/33byRBbBABr8D.','vel@gmail.com','chennai','Restaurant Owner','2026-06-18 17:11:40',NULL,0,'2026-06-18 17:11:40'),(7,'k','$2a$12$vYmdFW/J/mmjQTVWppphP.y.M4zsWw9UaKJ8xTu2GTdVuofCj/0ci','k@gmail.com','kalakad','Customer','2026-06-22 18:18:39',NULL,0,'2026-06-22 18:18:39'),(8,'saravanan','$2a$12$dfapW2vrslgMFv5AquY9RukNhcIXxrWjoi9DURVCB349OFyzwsyv6','saravanan@gmail.com','chennai','Restaurant Owner','2026-06-23 07:40:02',NULL,0,'2026-06-23 07:40:02'),(9,'s','$2a$12$yKmpxnYkFbpR5HyPLYJN5e9UuffZ85KxDXYGdyc9ApdsjDVojqLQu','s@gmail.com','chennai','Restaurant Owner','2026-06-23 07:40:44',NULL,0,'2026-06-23 07:40:44'),(10,'kathirkathirkathir','$2a$12$1A8J.Zyz6eZFAbru/XA7IuhOzUQZHwS/vY9kUT/NzcX5do/.RlpZW','kkk@gmail.com','kalakad','Restaurant Owner','2026-06-29 06:00:27',NULL,0,'2026-06-29 06:00:27');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `activeusers`
--

/*!50001 DROP VIEW IF EXISTS `activeusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `activeusers` AS select `user`.`UserID` AS `UserID`,`user`.`Username` AS `Username`,`user`.`Password` AS `Password`,`user`.`Email` AS `Email`,`user`.`Address` AS `Address`,`user`.`Role` AS `Role`,`user`.`CreatedDate` AS `CreatedDate`,`user`.`LastLoginDate` AS `LastLoginDate`,`user`.`IsDeleted` AS `IsDeleted`,`user`.`UpdatedDate` AS `UpdatedDate` from `user` where (`user`.`IsDeleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-29 11:57:20
