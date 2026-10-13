-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: onlinefoodphp
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL AUTO_INCREMENT,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`adm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','0192023a7bbd73250516f069df18b500','admin@krishnabhojnalay.com','','2026-10-01 12:00:00'),(4,'admin_1','10cb9bfa0ec484ca977cd85e6aad60ef','admin1@gmail.com','','2026-10-01 12:49:04');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dishes` (
  `d_id` int(222) NOT NULL AUTO_INCREMENT,
  `rs_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL,
  PRIMARY KEY (`d_id`),
  KEY `rs_id` (`rs_id`),
  CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`rs_id`) REFERENCES `restaurant` (`rs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (1,1,'Paneer Butter Masala','Fresh paneer cubes simmered in rich tomato, butter, and cashew gravy with aromatic spices.',220.00,'paneer_butter_masala.jpg'),(2,1,'Veg Kolhapuri','Authentic spicy mixed vegetables cooked in traditional Kolhapuri red chili gravy.',190.00,'veg_kolhapuri.jpg'),(3,1,'Dal Tadka & Jeera Rice','Yellow lentils tempered with cumin, garlic and desi ghee served with fragrant basmati rice.',160.00,'dal_tadka_rice.jpg'),(4,1,'Kaju Curry','Roasted whole cashew nuts cooked in creamy onion and tomato rich gravy.',250.00,'kaju_curry.jpg'),(5,2,'Special Masala Dosa','Golden crispy crepe filled with spiced potato masala, served with coconut chutney and hot sambar.',90.00,'masala_dosa.jpg'),(6,2,'Paneer Tikka Masala','Tandoor-grilled cottage cheese cubes simmered in spicy and tangy masala gravy.',230.00,'paneer_tikka_masala.jpg'),(7,2,'Veg Hyderabadi Dum Biryani','Long-grain basmati rice layered with seasonal vegetables, saffron, and whole spices.',170.00,'veg_biryani.jpg'),(8,2,'Chole Bhature','Spicy chickpea curry served with two puffed golden bhaturas, pickled onions, and lemon.',130.00,'chole_bhature.jpg'),(9,3,'Shahi Paneer','Royal Mughlai preparation of cottage cheese in thick cashew-cream gravy with mild spices.',240.00,'shahi_paneer.jpg'),(10,3,'Kashmiri Veg Pulao','Sweet and savory fragrant basmati rice loaded with dry fruits, fruits, and green peas.',150.00,'veg_pulao.jpg'),(11,3,'Malai Kofta','Melt-in-mouth cottage cheese and potato dumplings cooked in rich velvety cashew gravy.',220.00,'malai_kofta.jpg'),(12,3,'Dal Makhani & Butter Naan','Slow-simmered black lentils cooked overnight with butter and cream, served with butter naan.',180.00,'dal_makhani.jpg'),(13,4,'Margherita Pizza','Classic thin crust pizza with basil, rich Italian tomato sauce, and double mozzarella cheese.',180.00,'margherita_pizza.jpg'),(14,4,'Veggie Farmhouse Pizza','Hand-tossed crust loaded with crisp capsicum, diced onion, sweet corn, and mozzarella.',230.00,'farmhouse_pizza.jpg'),(15,4,'Cheese Garlic Breadsticks','Freshly baked oven-crisp bread topped with roasted garlic butter and melted mozzarella.',120.00,'garlic_bread.jpg'),(16,4,'Paneer Makhani Burger','Crispy seasoned vegetable patty layered with tandoori paneer slice and creamy makhani dressing.',140.00,'veg_burger.jpg'),(17,1,'Dal Khichdi','A comforting, one-pot dish made with rice, yellow moong dal, mild spices, and ghee.',200.00,'6ace66f34dcec.jpg'),(18,1,'Lauki ki Sabji (Bottle Gourd Curry)','A light, easily digestible curry made with tender bottle gourd, cumin, and mild herbs.',140.00,'lauki_ki_sabji.jpg'),(19,1,'Sattvic Moong Dal Soup','A light split yellow lentil soup seasoned minimally to calm the mind and body.',120.00,'sattvic_moong_dal_soup.jpg'),(20,1,'Samak Rice Pulao (Barnyard Millet Pulao)','A delicate millet dish cooked with cumin, rock salt, and mild vegetables or peanuts.',160.00,'samak_rice_pulao.jpg'),(21,1,'Steamed Vegetable Bowl','Fresh seasonal vegetables lightly steamed and seasoned with herbs or a touch of ghee.',130.00,'steamed_vegetable_bowl.jpg'),(22,1,'Dal Palak (No Onion/Garlic)','Spinach and yellow lentils cooked together with gentle tempering.',150.00,'dal_palak.jpg');
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remark`
--

DROP TABLE IF EXISTS `remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `frm_id` (`frm_id`),
  CONSTRAINT `remark_ibfk_1` FOREIGN KEY (`frm_id`) REFERENCES `users_orders` (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remark`
--

LOCK TABLES `remark` WRITE;
/*!40000 ALTER TABLE `remark` DISABLE KEYS */;
INSERT INTO `remark` VALUES (13,11,'closed','Delivered hot and fresh','2026-09-20 07:35:00'),(14,12,'closed','Thank you for ordering','2026-09-21 09:15:00'),(15,13,'closed','Delivered on time','2026-09-22 14:50:00'),(16,14,'in process','Food is being prepared','2026-09-23 04:00:00'),(17,15,'closed','Enjoy your meal!','2026-09-23 05:10:00');
/*!40000 ALTER TABLE `remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_category`
--

DROP TABLE IF EXISTS `res_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_category` (
  `c_id` int(222) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_category`
--

LOCK TABLES `res_category` WRITE;
/*!40000 ALTER TABLE `res_category` DISABLE KEYS */;
INSERT INTO `res_category` VALUES (1,'Indian & North Indian','2026-09-23 04:30:00'),(5,'South Indian','2026-09-23 04:30:00'),(6,'Snacks & Chaat','2026-09-23 04:30:00'),(7,'Chinese & Continental','2026-09-23 04:30:00'),(8,'Pizza & Fast Food','2026-09-23 04:30:00');
/*!40000 ALTER TABLE `res_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `rs_id` int(222) NOT NULL AUTO_INCREMENT,
  `c_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rs_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `res_category` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,1,'Hotel Palavi Family Restaurant','palavi.shirpur@gmail.com','02563-255123','https://hotelpalavi.com','10am','11pm','24hr-x7','Mumbai - Agra National Highway 3, Near Tapi Bridge, Shirpur, Maharashtra 425405','606d720b5fc71.jpg','2026-09-23 04:30:00'),(2,5,'Sai Swad Pure Veg Restaurant','saiswad.shirpur@gmail.com','02563-256789','https://saiswadveg.com','8am','11pm','24hr-x7','Karvand Naka, Main Road, Shirpur, Dist. Dhule, Maharashtra 425405','6290860e72d1e.jpg','2026-09-23 04:30:00'),(3,1,'Utsav Pure Veg Restaurant','utsav.shirpur@gmail.com','02563-257321','https://utsavshirpur.com','9am','11pm','24hr-x7','Near New Bus Stand, Main Road, Shirpur, Dist. Dhule, Maharashtra 425405','6290877b473ce.jpg','2026-09-23 04:30:00'),(4,8,'Patil\'s Pizza & Fast Food','patilspizza.shirpur@gmail.com','02563-258456','https://patilspizza.com','11am','11pm','24hr-x7','Karvand Naka Road, Opp. Market Yard, Shirpur, Dist. Dhule, Maharashtra 425405','6290af6f81887.jpg','2026-09-23 04:30:00');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `u_id` int(222) NOT NULL AUTO_INCREMENT,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'emil','Emil','Bluemax','cyanide484@gmail.com','9449777791','0559101425e4431b0a929d5fb7ea3b83','Diagon Alley',1,'2022-10-23 11:14:26'),(8,'daniel','Daniel','Christopher','daniel@gmail.com','9237658891','0d9e37ca3b9cb8c5dc7d6b526bd78ea6','Victoria layout,Bangalore 45',1,'2022-10-23 11:16:19'),(9,'karan','Karan','Chauhan','karan@gmail.com','9444356891','6f2afabe045c75a525aac6f89f46b9fb','Garden of eden,electronic city,bangalore 85',1,'2022-10-23 11:17:34'),(10,'shadab','Shadab','Kouser','shadab@gmail.com','9449111891','f5fdba9291ec81fe87f7813c4d6522c7','World end, Indranager, Bangalore 35',1,'2022-10-23 11:19:46'),(11,'john','John','Doe','john@gmail.com','9422208891','6579e96f76baa00787a28653876c6127','Snake cabin, Banshankri, Bangalore 33',1,'2022-10-23 11:22:19'),(12,'Preet','Veer','Dhol','veerdhol@gmail.com','97612345674','28ffb619dd04e391a261481c91652692','Shirpur',1,'2026-09-23 05:48:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_orders`
--

DROP TABLE IF EXISTS `users_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_orders` (
  `o_id` int(222) NOT NULL AUTO_INCREMENT,
  `u_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`o_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `users_orders_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_orders`
--

LOCK TABLES `users_orders` WRITE;
/*!40000 ALTER TABLE `users_orders` DISABLE KEYS */;
INSERT INTO `users_orders` VALUES (11,8,'Paneer Butter Masala',1,220.00,'closed','2026-09-20 07:00:00'),(12,8,'Special Masala Dosa',2,180.00,'closed','2026-09-21 08:45:00'),(13,8,'Veg Hyderabadi Dum Biryani',1,170.00,'closed','2026-09-22 14:15:00'),(14,8,'Margherita Pizza',1,180.00,'in process','2026-09-23 03:50:00'),(15,8,'Shahi Paneer',1,240.00,'closed','2026-09-23 04:40:00'),(16,12,'Margherita Pizza',1,180.00,NULL,'2026-09-23 05:51:57');
/*!40000 ALTER TABLE `users_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-23 19:55:33
