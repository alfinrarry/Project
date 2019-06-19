-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pis_ecommerce
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `em_carts`
--

DROP TABLE IF EXISTS `em_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_guest` text COLLATE utf8_unicode_ci,
  `qty` int(11) NOT NULL,
  `id_variation` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_carts_id_product_foreign` (`id_product`) USING BTREE,
  CONSTRAINT `em_carts_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `em_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_carts`
--

LOCK TABLES `em_carts` WRITE;
/*!40000 ALTER TABLE `em_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_product_categories`
--

DROP TABLE IF EXISTS `em_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug_category` text COLLATE utf8_unicode_ci NOT NULL,
  `icon_category` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_product_categories`
--

LOCK TABLES `em_product_categories` WRITE;
/*!40000 ALTER TABLE `em_product_categories` DISABLE KEYS */;
INSERT INTO `em_product_categories` VALUES (1,'Alat Dapur','alat-dapur',NULL,'2019-03-28 03:24:34','2019-03-28 03:24:34',NULL),(2,'Ototmotif','ototmotif',NULL,'2019-03-28 03:24:34','2019-03-28 03:24:34',NULL),(3,'Kriya','kriya',NULL,'2019-03-28 03:24:34','2019-03-28 03:24:34',NULL),(4,'Fashion (Wanita)','fashion-wanita',NULL,'2019-03-28 03:24:34','2019-03-28 03:24:34',NULL),(5,'Fashion (Pria)','fashion-pria',NULL,'2019-03-28 03:24:34','2019-03-28 03:24:34',NULL),(7,'aa','aa',NULL,'2019-03-28 03:24:34','2019-03-28 03:24:34',NULL),(8,'uji coba','uji-coba',NULL,'2019-03-28 03:24:34','2019-03-28 03:24:34',NULL),(9,'Makanan','makanan',NULL,'2019-03-28 03:24:34','2019-03-28 03:24:34',NULL);
/*!40000 ALTER TABLE `em_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_product_comments`
--

DROP TABLE IF EXISTS `em_product_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_product_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_product_comments_id_product_foreign` (`id_product`) USING BTREE,
  KEY `em_product_comments_id_user_foreign` (`id_user`) USING BTREE,
  CONSTRAINT `em_product_comments_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `em_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `em_product_comments_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `em_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_product_comments`
--

LOCK TABLES `em_product_comments` WRITE;
/*!40000 ALTER TABLE `em_product_comments` DISABLE KEYS */;
INSERT INTO `em_product_comments` VALUES (1,2,1,'1',0,'2019-04-11 08:21:20',NULL),(2,2,1,'LORem',1,'2019-04-11 08:21:20',NULL),(3,2,1,'asaasas',0,'2019-04-11 08:21:20',NULL),(4,2,1,'LORem',1,'2019-04-11 08:21:20',NULL);
/*!40000 ALTER TABLE `em_product_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_product_img_temps`
--

DROP TABLE IF EXISTS `em_product_img_temps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_product_img_temps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_path` longtext,
  `token` text NOT NULL,
  `token_backup` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_product_img_temps`
--

LOCK TABLES `em_product_img_temps` WRITE;
/*!40000 ALTER TABLE `em_product_img_temps` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_product_img_temps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_product_imgs`
--

DROP TABLE IF EXISTS `em_product_imgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_product_imgs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `img_path` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_product_imgs_id_product_foreign` (`id_product`) USING BTREE,
  CONSTRAINT `em_product_imgs_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `em_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_product_imgs`
--

LOCK TABLES `em_product_imgs` WRITE;
/*!40000 ALTER TABLE `em_product_imgs` DISABLE KEYS */;
INSERT INTO `em_product_imgs` VALUES (1,2,'product/product-detail.jpg',NULL,NULL);
/*!40000 ALTER TABLE `em_product_imgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_product_measurements`
--

DROP TABLE IF EXISTS `em_product_measurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_product_measurements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_product_measurements`
--

LOCK TABLES `em_product_measurements` WRITE;
/*!40000 ALTER TABLE `em_product_measurements` DISABLE KEYS */;
INSERT INTO `em_product_measurements` VALUES (1,'Buah','','2019-03-04 13:36:21','2018-12-11 21:59:21'),(2,'Biji','','2019-01-06 13:38:21','2019-03-06 22:18:21'),(3,'Batang','','2019-02-04 01:13:21','2018-12-28 22:29:21'),(4,'Potong','','2019-02-08 20:01:21','2019-02-21 05:12:21'),(5,'Bungkus','','2019-02-06 00:45:21','2018-12-07 05:40:21'),(6,'Kg','Berat','2019-01-03 10:21:21','2019-02-10 05:04:21'),(7,'Gram','Berat','2019-03-10 19:20:21','2019-01-08 08:41:21'),(8,'Ons','Berat','2019-02-19 05:39:21','2019-01-19 06:21:21'),(9,'Meter','Panjang','2018-12-17 18:14:21','2019-02-19 09:26:21'),(10,'CM','Panjang','2018-12-06 05:39:21','2018-12-06 22:58:21'),(11,'Liter','Volume','2019-02-11 07:14:21','2018-12-31 16:57:21'),(12,'Galon','Volume','2019-02-05 01:50:21','2019-01-09 05:21:21'),(13,'CC','Volume','2019-02-28 03:29:21','2019-01-24 15:57:21'),(14,'Lusin','','2018-12-17 16:39:21','2019-01-10 03:49:21'),(15,'Kodi','','2018-12-11 20:26:21','2019-02-10 04:12:21');
/*!40000 ALTER TABLE `em_product_measurements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_product_reviews`
--

DROP TABLE IF EXISTS `em_product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `rating` int(1) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_product_reviews_id_product_foreign` (`id_product`) USING BTREE,
  KEY `em_product_reviews_id_user_foreign` (`id_user`) USING BTREE,
  CONSTRAINT `em_product_reviews_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `em_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `em_product_reviews_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `em_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_product_reviews`
--

LOCK TABLES `em_product_reviews` WRITE;
/*!40000 ALTER TABLE `em_product_reviews` DISABLE KEYS */;
INSERT INTO `em_product_reviews` VALUES (1,2,1,2,'asas',NULL,NULL),(2,2,1,2,'223','2019-04-11 07:23:53',NULL);
/*!40000 ALTER TABLE `em_product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_product_variations`
--

DROP TABLE IF EXISTS `em_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_product_variations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `variation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_product_extras_id_product_foreign` (`id_product`) USING BTREE,
  CONSTRAINT `em_product_extras_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `em_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_product_variations`
--

LOCK TABLES `em_product_variations` WRITE;
/*!40000 ALTER TABLE `em_product_variations` DISABLE KEYS */;
INSERT INTO `em_product_variations` VALUES (1,2,5,'DeepSkyBlue','43','2019-02-16 00:47:49','2019-02-16 00:47:49'),(2,2,4,'DarkCyan','43','2018-12-18 14:00:49','2018-12-18 14:00:49'),(3,2,9,'Gold','43','2019-01-01 14:06:49','2019-01-01 14:06:49'),(4,2,3,'YellowGreen','43','2019-01-04 16:35:49','2019-01-04 16:35:49'),(5,2,3,'LightSalmon','43','2019-02-02 21:49:49','2019-02-02 21:49:49'),(6,1,8,'Fuchsia','43','2019-02-27 02:40:49','2019-02-27 02:40:49'),(7,1,6,'Ivory','43','2019-01-29 22:19:49','2019-01-29 22:19:49'),(8,1,8,'FireBrick','43','2019-01-02 22:11:49','2019-01-02 22:11:49'),(9,1,9,'LightSkyBlue','43','2019-01-15 11:53:49','2019-01-15 11:53:49'),(10,1,6,'HoneyDew','43','2019-02-01 20:38:49','2019-02-01 20:38:49'),(11,1,5,'LightSkyBlue','43','2019-02-23 00:36:49','2019-02-23 00:36:49'),(12,1,15,'Navy','43','2019-01-26 14:40:49','2019-01-26 14:40:49'),(13,1,3,'SpringGreen','43','2018-12-08 05:24:49','2018-12-08 05:24:49'),(14,1,4,'Blue','43','2019-02-19 11:47:49','2019-02-19 11:47:49'),(15,1,3,'Aqua','43','2019-01-27 22:25:49','2019-01-27 22:25:49'),(16,1,14,'Green','43','2019-02-12 08:44:49','2019-02-12 08:44:49'),(17,1,15,'Orange','43','2018-12-22 10:03:49','2018-12-22 10:03:49'),(18,1,5,'DarkSlateGray','43','2019-01-08 09:29:49','2019-01-08 09:29:49'),(19,1,2,'Lavender','43','2019-02-10 00:34:49','2019-02-10 00:34:49'),(20,1,2,'WhiteSmoke','43','2019-02-20 09:54:49','2019-02-20 09:54:49'),(21,1,9,'Maroon','43','2019-01-23 22:52:49','2019-01-23 22:52:49'),(22,1,6,'MediumOrchid','43','2019-03-03 01:31:49','2019-03-03 01:31:49'),(23,1,14,'Beige','43','2019-01-08 09:50:49','2019-01-08 09:50:49'),(24,1,9,'Linen','43','2018-12-31 23:16:49','2018-12-31 23:16:49'),(25,1,6,'BurlyWood','43','2018-12-21 10:58:49','2018-12-21 10:58:49'),(26,1,3,'Blue','43','2019-03-03 21:43:49','2019-03-03 21:43:49'),(27,1,7,'GoldenRod','43','2019-01-31 06:33:49','2019-01-31 06:33:49'),(28,1,13,'Azure','43','2018-12-15 16:48:49','2018-12-15 16:48:49'),(29,1,14,'MediumBlue','43','2019-02-03 05:56:49','2019-02-03 05:56:49'),(30,1,6,'SlateGray','43','2019-02-16 08:23:49','2019-02-16 08:23:49'),(31,1,3,'MediumPurple','43','2019-01-09 18:29:49','2019-01-09 18:29:49'),(32,1,13,'DarkMagenta','43','2019-01-15 22:10:49','2019-01-15 22:10:49'),(33,1,7,'LightCoral','43','2018-12-16 05:30:49','2018-12-16 05:30:49'),(34,1,7,'MediumTurquoise','43','2019-02-25 01:29:49','2019-02-25 01:29:49'),(35,1,11,'DarkGray','43','2019-03-08 07:26:49','2019-03-08 07:26:49'),(36,1,12,'Crimson','43','2019-01-27 16:53:49','2019-01-27 16:53:49'),(37,1,5,'Brown','43','2019-01-11 22:37:49','2019-01-11 22:37:49'),(38,1,15,'Brown','43','2019-02-26 06:08:49','2019-02-26 06:08:49'),(39,1,5,'MediumOrchid','43','2019-01-28 18:16:49','2019-01-28 18:16:49'),(40,1,13,'MediumTurquoise','43','2019-02-22 10:18:49','2019-02-22 10:18:49'),(41,1,13,'DarkCyan','43','2019-01-27 11:24:49','2019-01-27 11:24:49'),(42,1,6,'BurlyWood','43','2018-12-05 02:51:49','2018-12-05 02:51:49'),(43,1,14,'MediumSeaGreen','43','2019-02-28 09:55:49','2019-02-28 09:55:49'),(44,1,3,'CadetBlue','43','2018-12-10 22:35:49','2018-12-10 22:35:49'),(45,1,9,'HotPink','43','2019-01-19 06:32:49','2019-01-19 06:32:49'),(46,1,11,'MediumTurquoise','43','2019-01-17 07:44:49','2019-01-17 07:44:49'),(47,1,7,'Bisque','43','2019-02-15 14:27:49','2019-02-15 14:27:49'),(48,1,7,'DarkSeaGreen','43','2018-12-26 07:29:49','2018-12-26 07:29:49'),(49,1,15,'LightYellow','43','2018-12-26 03:25:49','2018-12-26 03:25:49'),(50,1,10,'PeachPuff','43','2019-03-05 19:37:50','2019-03-05 19:37:50'),(51,1,3,'LightCyan','43','2019-01-18 07:12:50','2019-01-18 07:12:50'),(52,1,7,'RosyBrown','43','2019-02-04 12:20:50','2019-02-04 12:20:50'),(53,1,13,'WhiteSmoke','43','2019-02-19 20:53:50','2019-02-19 20:53:50'),(54,1,12,'Maroon','43','2019-01-16 03:29:50','2019-01-16 03:29:50'),(55,1,8,'MintCream','43','2019-01-21 02:10:50','2019-01-21 02:10:50'),(56,1,11,'SandyBrown','43','2019-01-04 03:32:50','2019-01-04 03:32:50'),(57,1,11,'Tomato','43','2019-03-13 01:02:50','2019-03-13 01:02:50'),(58,1,5,'LightSlateGray','43','2018-12-16 04:51:50','2018-12-16 04:51:50'),(59,1,13,'SandyBrown','43','2019-01-09 05:15:50','2019-01-09 05:15:50'),(60,1,5,'MistyRose','43','2019-02-14 15:40:50','2019-02-14 15:40:50'),(61,1,2,'Chartreuse','43','2019-01-24 19:34:50','2019-01-24 19:34:50'),(62,1,11,'HotPink','43','2018-12-13 17:03:50','2018-12-13 17:03:50'),(63,1,11,'Aqua','43','2019-01-24 22:43:50','2019-01-24 22:43:50'),(64,1,12,'PeachPuff','43','2019-02-04 12:26:50','2019-02-04 12:26:50'),(65,1,3,'ForestGreen','43','2019-02-25 04:44:50','2019-02-25 04:44:50'),(66,1,9,'DimGrey','43','2019-01-18 08:58:50','2019-01-18 08:58:50'),(67,1,7,'Cornsilk','43','2019-01-21 15:22:50','2019-01-21 15:22:50'),(68,1,3,'LavenderBlush','43','2018-12-06 19:35:50','2018-12-06 19:35:50'),(69,1,8,'PaleVioletRed','43','2019-03-02 22:13:50','2019-03-02 22:13:50'),(70,1,2,'Wheat','43','2019-02-02 13:57:50','2019-02-02 13:57:50'),(71,1,5,'Aquamarine','43','2019-01-11 05:24:50','2019-01-11 05:24:50'),(72,1,4,'DarkKhaki','43','2018-12-13 09:26:50','2018-12-13 09:26:50'),(73,1,11,'MediumVioletRed','43','2019-02-21 09:10:50','2019-02-21 09:10:50'),(74,1,13,'LightCyan','43','2019-01-19 22:51:50','2019-01-19 22:51:50'),(75,1,4,'Cyan','43','2019-01-29 09:11:50','2019-01-29 09:11:50'),(76,1,9,'DarkSalmon','43','2018-12-30 23:52:50','2018-12-30 23:52:50'),(77,1,7,'Bisque','43','2018-12-10 05:32:50','2018-12-10 05:32:50'),(78,1,8,'LightSkyBlue','43','2019-01-22 09:16:50','2019-01-22 09:16:50'),(79,1,5,'HotPink','43','2019-03-12 22:37:50','2019-03-12 22:37:50'),(80,1,12,'LightPink','43','2018-12-15 02:05:50','2018-12-15 02:05:50'),(81,1,2,'LightPink','43','2019-03-03 10:16:50','2019-03-03 10:16:50'),(82,1,1,'SandyBrown','43','2019-01-31 11:29:50','2019-01-31 11:29:50'),(83,1,2,'Chartreuse','43','2019-01-08 17:16:50','2019-01-08 17:16:50'),(84,1,9,'Brown','43','2019-01-25 14:45:50','2019-01-25 14:45:50'),(85,1,2,'Peru','43','2019-01-29 23:14:50','2019-01-29 23:14:50'),(86,1,5,'DarkBlue','43','2018-12-17 09:09:50','2018-12-17 09:09:50'),(87,1,8,'Yellow','43','2019-02-27 00:47:50','2019-02-27 00:47:50'),(88,1,2,'Gold','43','2019-02-17 17:33:50','2019-02-17 17:33:50'),(89,1,9,'SeaShell','43','2018-12-06 09:34:50','2018-12-06 09:34:50'),(90,1,11,'Silver','43','2018-12-04 20:21:50','2018-12-04 20:21:50'),(91,1,9,'Plum','43','2018-12-07 16:43:50','2018-12-07 16:43:50'),(92,1,14,'Red','43','2018-12-11 05:38:50','2018-12-11 05:38:50'),(93,1,7,'ForestGreen','43','2019-01-02 06:02:50','2019-01-02 06:02:50'),(94,1,8,'MistyRose','43','2019-01-29 21:41:50','2019-01-29 21:41:50'),(95,1,13,'Magenta','43','2019-02-08 23:30:50','2019-02-08 23:30:50'),(96,1,6,'Lavender','43','2019-03-11 08:56:50','2019-03-11 08:56:50'),(97,1,12,'MediumSeaGreen','43','2019-02-06 07:15:50','2019-02-06 07:15:50'),(98,1,9,'DarkSlateGray','43','2018-12-08 03:07:50','2018-12-08 03:07:50'),(99,1,11,'AntiqueWhite','43','2018-12-09 07:04:50','2018-12-09 07:04:50'),(100,1,8,'HotPink','43','2019-03-03 07:16:50','2019-03-03 07:16:50'),(101,1,9,'SpringGreen','43','2018-12-28 19:03:50','2018-12-28 19:03:50'),(102,1,6,'Chocolate','43','2019-01-07 08:45:50','2019-01-07 08:45:50'),(103,1,9,'MediumSpringGreen','43','2019-01-23 14:55:50','2019-01-23 14:55:50'),(104,1,3,'RosyBrown','43','2019-02-09 08:47:50','2019-02-09 08:47:50'),(105,1,3,'Wheat','43','2019-02-21 18:48:50','2019-02-21 18:48:50'),(106,1,5,'DarkSeaGreen','43','2019-02-04 03:44:50','2019-02-04 03:44:50'),(107,1,2,'Sienna','43','2018-12-17 00:42:50','2018-12-17 00:42:50'),(108,1,6,'LightSlateGray','43','2019-02-20 14:28:50','2019-02-20 14:28:50'),(109,1,7,'MediumPurple','43','2018-12-07 03:50:50','2018-12-07 03:50:50'),(110,1,13,'Red','43','2018-12-23 12:05:50','2018-12-23 12:05:50'),(111,1,15,'PaleTurquoise','43','2019-02-24 23:00:50','2019-02-24 23:00:50'),(112,1,9,'Wheat','43','2019-01-07 06:04:50','2019-01-07 06:04:50'),(113,1,10,'MediumOrchid','43','2019-03-08 08:24:50','2019-03-08 08:24:50'),(114,1,2,'Snow','43','2019-02-26 23:43:50','2019-02-26 23:43:50'),(115,1,1,'Lime','43','2019-02-05 00:34:50','2019-02-05 00:34:50'),(116,1,4,'SlateGray','43','2019-01-16 23:22:50','2019-01-16 23:22:50'),(117,1,11,'Chartreuse','43','2019-02-17 03:15:50','2019-02-17 03:15:50'),(118,1,14,'LightYellow','43','2019-01-01 18:01:50','2019-01-01 18:01:50'),(119,1,10,'SlateGray','43','2018-12-15 17:12:50','2018-12-15 17:12:50'),(120,1,14,'Lime','43','2019-02-05 02:34:51','2019-02-05 02:34:51'),(121,1,15,'White','43','2019-02-02 01:49:51','2019-02-02 01:49:51'),(122,1,11,'Gold','43','2018-12-10 08:49:51','2018-12-10 08:49:51'),(123,1,6,'DimGray','43','2019-03-03 18:30:51','2019-03-03 18:30:51'),(124,1,14,'DarkOliveGreen','43','2019-02-18 03:33:51','2019-02-18 03:33:51'),(125,1,14,'Wheat','43','2018-12-26 10:09:51','2018-12-26 10:09:51'),(126,1,4,'DarkTurquoise','43','2019-01-18 09:26:51','2019-01-18 09:26:51'),(127,1,13,'FireBrick','43','2019-02-27 21:53:51','2019-02-27 21:53:51'),(128,1,13,'Teal','43','2019-01-02 11:02:51','2019-01-02 11:02:51'),(129,1,7,'DimGray','43','2019-01-12 11:20:51','2019-01-12 11:20:51'),(130,1,6,'YellowGreen','43','2019-01-07 01:46:51','2019-01-07 01:46:51'),(131,1,11,'DarkGoldenRod','43','2019-01-19 06:31:51','2019-01-19 06:31:51'),(132,1,1,'Teal','43','2019-03-01 08:34:51','2019-03-01 08:34:51'),(133,1,14,'Gold','43','2019-01-06 16:28:51','2019-01-06 16:28:51'),(134,1,1,'OldLace','43','2018-12-09 06:02:51','2018-12-09 06:02:51'),(135,1,5,'MediumAquaMarine','43','2019-01-27 08:51:51','2019-01-27 08:51:51'),(136,1,9,'PaleTurquoise','43','2018-12-17 07:36:51','2018-12-17 07:36:51'),(137,1,4,'Chartreuse','43','2019-02-08 06:20:51','2019-02-08 06:20:51'),(138,1,1,'MistyRose','43','2018-12-31 02:19:51','2018-12-31 02:19:51'),(139,1,10,'Turquoise','43','2019-01-24 16:11:51','2019-01-24 16:11:51'),(140,1,11,'DarkGray','43','2018-12-30 02:24:51','2018-12-30 02:24:51'),(141,1,1,'DimGrey','43','2018-12-28 05:39:51','2018-12-28 05:39:51'),(142,1,8,'LightYellow','43','2019-02-27 18:11:51','2019-02-27 18:11:51'),(143,1,12,'Gold','43','2018-12-10 10:07:51','2018-12-10 10:07:51'),(144,1,8,'Sienna','43','2018-12-16 04:58:51','2018-12-16 04:58:51'),(145,1,11,'Bisque','43','2019-01-05 09:59:51','2019-01-05 09:59:51'),(146,1,10,'Cornsilk','43','2019-03-08 05:53:51','2019-03-08 05:53:51'),(147,1,6,'MidnightBlue','43','2018-12-24 18:53:51','2018-12-24 18:53:51'),(148,1,13,'PowderBlue','43','2018-12-18 08:34:51','2018-12-18 08:34:51'),(149,1,8,'DeepSkyBlue','43','2019-01-01 01:03:51','2019-01-01 01:03:51'),(150,1,9,'LightGoldenRodYellow','43','2019-02-27 20:26:51','2019-02-27 20:26:51'),(157,1,1,'variasi 123','23','2019-04-06 10:25:21',NULL),(158,1,2,'variasi 224','24','2019-04-06 10:25:21',NULL),(159,1,3,'variasi 325','25','2019-04-06 10:25:21',NULL),(160,1,4,'variasi 426','26','2019-04-06 10:25:21',NULL),(161,1,2,'merah','22','2019-04-06 10:31:50',NULL),(162,1,22,'hijau','29','2019-04-06 10:31:50',NULL);
/*!40000 ALTER TABLE `em_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_product_views`
--

DROP TABLE IF EXISTS `em_product_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_product_views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `ipaddress` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `browser` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_product_views_id_product_foreign` (`id_product`) USING BTREE,
  CONSTRAINT `em_product_views_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `em_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_product_views`
--

LOCK TABLES `em_product_views` WRITE;
/*!40000 ALTER TABLE `em_product_views` DISABLE KEYS */;
INSERT INTO `em_product_views` VALUES (1,1,'234.79.87.52','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5311 (KHTML, like Gecko) Chrome/40.0.809.0 Mobile Safari/5311','Windows 10','2019-03-10 18:37:06','2019-02-20 22:55:06'),(2,1,'207.125.207.108','Mozilla/5.0 (Windows; U; Windows NT 5.0) AppleWebKit/531.31.2 (KHTML, like Gecko) Version/5.0.3 Safari/531.31.2','Windows 10','2019-02-15 22:02:06','2018-12-07 03:46:06'),(3,1,'41.240.46.50','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 5.01; Trident/4.1)','OSX','2019-02-17 05:55:06','2019-01-01 08:32:06'),(4,1,'229.61.193.104','Opera/9.18 (X11; Linux x86_64; en-US) Presto/2.12.212 Version/12.00','Linux','2019-01-19 22:33:06','2019-03-08 20:00:06'),(5,1,'164.143.99.176','Opera/8.13 (X11; Linux x86_64; en-US) Presto/2.12.311 Version/11.00','Windows 10','2019-02-11 22:23:06','2019-03-13 06:42:06'),(6,1,'139.0.192.4','Opera/9.84 (X11; Linux x86_64; sl-SI) Presto/2.10.264 Version/11.00','Windows 10','2019-01-03 08:28:06','2019-02-15 08:39:06'),(7,1,'41.84.189.10','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_7_6) AppleWebKit/5332 (KHTML, like Gecko) Chrome/40.0.819.0 Mobile Safari/5332','OSX','2018-12-26 14:33:06','2019-02-25 00:39:06'),(8,1,'71.20.178.22','Mozilla/5.0 (Windows NT 4.0; sl-SI; rv:1.9.1.20) Gecko/20180801 Firefox/36.0','Windows 10','2019-01-22 21:56:06','2019-01-30 17:51:06'),(9,1,'89.140.112.108','Mozilla/5.0 (Windows 98; Win 9x 4.90; en-US; rv:1.9.2.20) Gecko/20160402 Firefox/35.0','Windows 10','2019-02-28 23:38:06','2019-03-13 10:47:06'),(10,1,'104.126.197.120','Mozilla/5.0 (Windows NT 6.0; en-US; rv:1.9.1.20) Gecko/20100709 Firefox/36.0','OSX','2019-01-19 17:00:06','2019-02-27 15:33:06'),(11,1,'135.193.79.186','Mozilla/5.0 (iPad; CPU OS 8_2_1 like Mac OS X; sl-SI) AppleWebKit/531.23.1 (KHTML, like Gecko) Version/4.0.5 Mobile/8B114 Safari/6531.23.1','Linux','2018-12-20 01:02:06','2019-02-27 02:10:06'),(12,1,'122.110.127.123','Opera/9.29 (X11; Linux x86_64; sl-SI) Presto/2.10.234 Version/10.00','Windows 10','2019-03-03 04:02:06','2018-12-11 00:02:06'),(13,1,'41.188.31.60','Mozilla/5.0 (compatible; MSIE 8.0; Windows 98; Win 9x 4.90; Trident/4.0)','Windows 10','2019-03-13 07:22:06','2019-02-18 03:00:06'),(14,1,'1.148.151.169','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_9) AppleWebKit/5361 (KHTML, like Gecko) Chrome/38.0.834.0 Mobile Safari/5361','Linux','2018-12-07 07:13:07','2019-02-02 01:01:07'),(15,1,'81.71.228.3','Opera/8.73 (Windows 95; sl-SI) Presto/2.10.303 Version/12.00','Linux','2019-02-25 08:27:07','2019-01-30 21:39:07'),(16,1,'49.32.0.40','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_1 like Mac OS X; en-US) AppleWebKit/534.12.7 (KHTML, like Gecko) Version/3.0.5 Mobile/8B115 Safari/6534.12.7','Windows 10','2019-01-27 12:10:07','2019-02-21 17:04:07'),(17,1,'136.59.104.63','Mozilla/5.0 (Windows NT 6.2) AppleWebKit/5310 (KHTML, like Gecko) Chrome/38.0.878.0 Mobile Safari/5310','Windows 10','2019-01-17 01:37:07','2018-12-31 04:20:07'),(18,1,'240.1.251.228','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/4.0)','OSX','2018-12-26 15:18:07','2019-03-11 14:16:07'),(19,1,'218.167.224.114','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_8_5 rv:5.0; en-US) AppleWebKit/534.8.1 (KHTML, like Gecko) Version/4.1 Safari/534.8.1','OSX','2019-02-03 11:37:07','2019-01-16 20:41:07'),(20,1,'6.95.86.102','Opera/8.28 (Windows NT 5.0; en-US) Presto/2.11.191 Version/11.00','Linux','2019-01-22 21:27:07','2018-12-09 23:14:07'),(21,1,'108.69.4.63','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_8_2 rv:3.0; en-US) AppleWebKit/534.13.2 (KHTML, like Gecko) Version/5.0.2 Safari/534.13.2','OSX','2019-01-10 08:01:07','2018-12-27 00:43:07'),(22,1,'163.255.29.82','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_8_8 rv:4.0) Gecko/20160412 Firefox/35.0','Linux','2018-12-10 08:17:07','2018-12-18 14:46:07'),(23,1,'136.254.120.124','Mozilla/5.0 (Windows NT 6.0; sl-SI; rv:1.9.1.20) Gecko/20120220 Firefox/37.0','OSX','2018-12-17 12:25:07','2019-01-13 23:32:07'),(24,1,'202.172.32.66','Mozilla/5.0 (compatible; MSIE 11.0; Windows NT 5.01; Trident/4.0)','OSX','2019-02-05 12:00:07','2019-03-11 16:21:07'),(25,1,'37.65.252.180','Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_1 like Mac OS X; en-US) AppleWebKit/535.30.6 (KHTML, like Gecko) Version/4.0.5 Mobile/8B118 Safari/6535.30.6','Linux','2018-12-19 01:36:07','2018-12-31 22:35:07'),(26,1,'91.121.208.160','Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X; en-US) AppleWebKit/533.15.3 (KHTML, like Gecko) Version/3.0.5 Mobile/8B114 Safari/6533.15.3','Windows 10','2019-03-07 21:03:07','2019-02-25 14:02:07'),(27,1,'228.96.9.0','Mozilla/5.0 (compatible; MSIE 8.0; Windows 98; Win 9x 4.90; Trident/5.0)','Linux','2019-01-09 05:37:07','2019-01-29 00:28:07'),(28,1,'70.9.19.237','Opera/9.40 (Windows NT 4.0; sl-SI) Presto/2.10.272 Version/11.00','OSX','2018-12-19 14:38:07','2019-03-13 05:49:07'),(29,1,'138.146.80.52','Mozilla/5.0 (Windows; U; Windows 98; Win 9x 4.90) AppleWebKit/534.46.2 (KHTML, like Gecko) Version/4.1 Safari/534.46.2','OSX','2019-03-01 01:48:07','2019-01-11 00:50:07'),(30,1,'93.131.223.69','Mozilla/5.0 (compatible; MSIE 11.0; Windows NT 4.0; Trident/5.1)','Linux','2018-12-31 23:35:07','2019-02-20 06:12:07'),(31,1,'252.66.28.39','Opera/9.77 (X11; Linux i686; sl-SI) Presto/2.10.282 Version/10.00','Linux','2018-12-08 03:45:07','2019-01-13 01:34:07'),(32,1,'181.187.222.85','Mozilla/5.0 (compatible; MSIE 8.0; Windows 95; Trident/4.1)','OSX','2018-12-23 21:07:07','2018-12-22 08:45:07'),(33,1,'174.174.223.143','Mozilla/5.0 (X11; Linux x86_64; rv:5.0) Gecko/20100905 Firefox/37.0','OSX','2019-02-06 01:44:07','2018-12-23 02:03:07'),(34,1,'70.23.63.134','Mozilla/5.0 (compatible; MSIE 10.0; Windows 98; Trident/5.0)','Linux','2018-12-26 08:42:07','2019-01-25 15:46:07'),(35,1,'145.19.176.71','Mozilla/5.0 (compatible; MSIE 5.0; Windows 95; Trident/3.0)','Linux','2018-12-06 15:30:07','2019-03-03 20:16:07'),(36,1,'174.179.243.186','Mozilla/5.0 (compatible; MSIE 8.0; Windows 98; Trident/4.0)','OSX','2019-02-20 22:09:07','2019-01-24 02:34:07'),(37,1,'11.62.61.5','Mozilla/5.0 (Windows NT 5.1) AppleWebKit/5330 (KHTML, like Gecko) Chrome/40.0.879.0 Mobile Safari/5330','Linux','2019-01-27 14:45:07','2018-12-15 22:42:07'),(38,1,'102.108.44.231','Mozilla/5.0 (iPad; CPU OS 8_2_2 like Mac OS X; sl-SI) AppleWebKit/535.31.1 (KHTML, like Gecko) Version/4.0.5 Mobile/8B116 Safari/6535.31.1','Windows 10','2019-01-30 18:31:07','2019-02-17 02:41:07'),(39,1,'130.253.97.194','Opera/9.28 (X11; Linux x86_64; sl-SI) Presto/2.8.338 Version/11.00','Windows 10','2019-01-13 05:10:07','2019-02-01 15:16:07'),(40,1,'110.166.83.6','Opera/9.83 (Windows CE; sl-SI) Presto/2.10.165 Version/10.00','Windows 10','2019-02-18 01:53:07','2019-01-23 23:55:07'),(41,1,'163.136.80.208','Opera/8.35 (Windows NT 5.0; sl-SI) Presto/2.11.187 Version/11.00','OSX','2019-01-13 09:54:07','2018-12-26 19:54:07'),(42,1,'178.15.137.229','Mozilla/5.0 (compatible; MSIE 5.0; Windows 98; Trident/3.0)','OSX','2019-02-01 04:03:07','2019-01-26 08:06:07'),(43,1,'37.140.213.194','Mozilla/5.0 (Windows NT 5.01; en-US; rv:1.9.0.20) Gecko/20190215 Firefox/35.0','Windows 10','2019-03-13 05:01:07','2019-03-06 08:34:07'),(44,1,'157.30.104.141','Mozilla/5.0 (Windows CE; en-US; rv:1.9.1.20) Gecko/20171010 Firefox/35.0','Linux','2019-01-10 00:52:07','2018-12-29 14:35:07'),(45,1,'34.22.111.237','Opera/9.29 (Windows NT 5.01; en-US) Presto/2.9.260 Version/10.00','Linux','2019-01-21 14:37:07','2019-03-08 18:48:07'),(46,1,'101.20.148.189','Mozilla/5.0 (compatible; MSIE 6.0; Windows CE; Trident/3.1)','OSX','2019-01-15 00:45:07','2018-12-30 08:37:07'),(47,1,'182.223.69.36','Opera/9.76 (Windows NT 5.01; en-US) Presto/2.10.247 Version/11.00','Linux','2019-01-04 02:56:07','2019-01-07 21:26:07'),(48,1,'217.7.10.119','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5360 (KHTML, like Gecko) Chrome/37.0.892.0 Mobile Safari/5360','OSX','2019-01-21 10:00:07','2019-01-30 22:13:07'),(49,1,'254.161.84.155','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5350 (KHTML, like Gecko) Chrome/38.0.885.0 Mobile Safari/5350','OSX','2019-02-26 23:39:07','2019-02-04 01:35:07'),(50,1,'162.239.145.82','Mozilla/5.0 (compatible; MSIE 5.0; Windows CE; Trident/5.1)','Linux','2019-02-17 23:10:07','2018-12-31 16:09:07'),(51,1,'127.76.203.208','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_1 rv:5.0) Gecko/20140123 Firefox/36.0','Linux','2018-12-16 04:58:07','2018-12-25 01:33:07'),(52,1,'194.186.169.125','Mozilla/5.0 (compatible; MSIE 6.0; Windows NT 6.0; Trident/5.0)','OSX','2018-12-14 11:34:07','2018-12-28 00:48:07'),(53,1,'124.123.246.178','Mozilla/5.0 (iPad; CPU OS 7_1_1 like Mac OS X; en-US) AppleWebKit/535.30.6 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6535.30.6','Windows 10','2018-12-21 05:05:07','2019-03-07 11:20:07'),(54,1,'145.87.214.235','Opera/8.18 (Windows NT 5.01; en-US) Presto/2.11.221 Version/11.00','OSX','2019-01-23 09:06:07','2019-01-15 20:10:07'),(55,1,'238.219.52.229','Opera/8.98 (X11; Linux x86_64; sl-SI) Presto/2.12.237 Version/11.00','Linux','2019-02-18 00:30:07','2019-01-15 16:14:07'),(56,1,'133.210.159.11','Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/3.0)','OSX','2019-01-24 15:14:07','2019-02-17 01:32:07'),(57,1,'164.120.32.252','Opera/9.16 (Windows 95; en-US) Presto/2.8.341 Version/10.00','OSX','2019-03-04 12:11:07','2019-02-02 20:54:07'),(58,1,'130.66.140.16','Opera/8.76 (X11; Linux i686; sl-SI) Presto/2.11.188 Version/11.00','OSX','2019-02-09 19:21:07','2019-03-01 18:36:07'),(59,1,'19.217.40.170','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_0 rv:3.0; en-US) AppleWebKit/535.2.5 (KHTML, like Gecko) Version/4.1 Safari/535.2.5','Linux','2019-02-25 09:43:07','2019-02-14 17:57:07'),(60,1,'49.37.222.204','Opera/8.89 (Windows NT 5.01; en-US) Presto/2.10.308 Version/11.00','Linux','2019-02-24 08:04:07','2019-01-14 12:07:07'),(61,1,'117.155.214.23','Opera/8.28 (X11; Linux x86_64; en-US) Presto/2.12.284 Version/12.00','Windows 10','2018-12-31 15:07:07','2019-01-02 10:42:07'),(62,1,'229.82.44.103','Mozilla/5.0 (Windows; U; Windows 98; Win 9x 4.90) AppleWebKit/533.44.2 (KHTML, like Gecko) Version/4.0 Safari/533.44.2','Linux','2019-03-12 23:19:07','2019-01-27 14:29:07'),(63,1,'195.75.121.117','Mozilla/5.0 (Windows NT 5.01) AppleWebKit/5340 (KHTML, like Gecko) Chrome/37.0.896.0 Mobile Safari/5340','Windows 10','2019-02-18 01:07:07','2019-01-07 11:53:07'),(64,1,'169.31.244.166','Opera/9.90 (Windows NT 4.0; en-US) Presto/2.9.244 Version/12.00','OSX','2019-01-29 08:13:07','2018-12-20 16:09:07'),(65,1,'181.51.106.186','Mozilla/5.0 (X11; Linux x86_64; rv:7.0) Gecko/20140413 Firefox/36.0','Windows 10','2019-03-14 11:40:07','2019-01-19 19:33:07'),(66,1,'91.95.35.169','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_7_0) AppleWebKit/5352 (KHTML, like Gecko) Chrome/40.0.872.0 Mobile Safari/5352','Linux','2019-01-26 08:41:07','2019-01-26 12:09:07'),(67,1,'224.108.126.17','Mozilla/5.0 (iPhone; CPU iPhone OS 7_2_2 like Mac OS X; en-US) AppleWebKit/534.11.5 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6534.11.5','Linux','2018-12-31 18:22:07','2019-01-08 22:37:07'),(68,1,'73.158.249.28','Opera/9.77 (Windows 98; sl-SI) Presto/2.12.178 Version/10.00','OSX','2019-02-17 11:20:07','2019-02-12 05:27:07'),(69,1,'40.7.204.44','Opera/9.98 (X11; Linux x86_64; sl-SI) Presto/2.9.247 Version/12.00','OSX','2018-12-29 22:28:07','2018-12-30 12:24:07'),(70,1,'207.41.28.92','Opera/8.71 (X11; Linux i686; en-US) Presto/2.10.287 Version/10.00','OSX','2019-01-02 20:48:07','2018-12-28 19:26:07'),(71,1,'190.62.173.122','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5340 (KHTML, like Gecko) Chrome/36.0.817.0 Mobile Safari/5340','OSX','2019-02-08 23:05:07','2019-01-12 12:03:07'),(72,1,'126.246.210.91','Opera/8.37 (X11; Linux i686; sl-SI) Presto/2.10.336 Version/11.00','OSX','2018-12-14 12:18:07','2019-01-11 11:57:07'),(73,1,'88.158.232.82','Mozilla/5.0 (Windows; U; Windows 98; Win 9x 4.90) AppleWebKit/535.11.5 (KHTML, like Gecko) Version/4.0 Safari/535.11.5','Linux','2018-12-27 09:43:07','2019-03-06 10:06:07'),(74,1,'150.219.10.124','Mozilla/5.0 (compatible; MSIE 9.0; Windows 98; Trident/4.1)','OSX','2018-12-10 20:40:07','2018-12-09 22:43:07'),(75,1,'174.150.101.66','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7 rv:3.0) Gecko/20100922 Firefox/35.0','OSX','2019-01-31 06:33:07','2019-02-02 04:28:07'),(76,1,'67.111.133.108','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5322 (KHTML, like Gecko) Chrome/39.0.852.0 Mobile Safari/5322','OSX','2019-01-15 17:19:07','2018-12-29 07:23:07'),(77,1,'126.116.246.12','Mozilla/5.0 (iPhone; CPU iPhone OS 8_0_2 like Mac OS X; en-US) AppleWebKit/533.8.7 (KHTML, like Gecko) Version/3.0.5 Mobile/8B111 Safari/6533.8.7','Windows 10','2019-02-27 11:43:07','2019-02-10 18:12:07'),(78,1,'212.67.12.190','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_7_7 rv:3.0) Gecko/20150510 Firefox/36.0','Windows 10','2019-02-18 19:15:07','2019-01-14 12:32:07'),(79,1,'171.255.99.117','Mozilla/5.0 (compatible; MSIE 9.0; Windows 95; Trident/4.0)','Linux','2019-03-11 18:52:07','2019-01-19 05:22:07'),(80,1,'215.44.74.169','Mozilla/5.0 (X11; Linux x86_64; rv:5.0) Gecko/20140219 Firefox/37.0','Linux','2019-02-24 06:29:07','2019-02-08 19:45:07'),(81,1,'133.108.198.123','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_7_9) AppleWebKit/5351 (KHTML, like Gecko) Chrome/39.0.844.0 Mobile Safari/5351','OSX','2019-01-01 02:16:07','2018-12-09 19:50:07'),(82,1,'98.37.211.126','Mozilla/5.0 (compatible; MSIE 5.0; Windows CE; Trident/4.1)','OSX','2019-03-04 22:09:07','2018-12-09 04:01:07'),(83,1,'79.100.202.164','Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 4.0; Trident/5.0)','OSX','2018-12-12 16:13:07','2018-12-28 05:49:07'),(84,1,'229.231.181.210','Opera/8.15 (X11; Linux x86_64; en-US) Presto/2.11.223 Version/12.00','Linux','2019-01-27 23:05:07','2019-02-07 01:16:07'),(85,1,'126.160.212.7','Mozilla/5.0 (compatible; MSIE 6.0; Windows NT 6.2; Trident/5.0)','Linux','2019-01-04 14:01:07','2018-12-23 17:28:07'),(86,1,'248.97.81.213','Opera/8.89 (Windows NT 5.01; en-US) Presto/2.8.216 Version/11.00','Linux','2019-01-12 19:19:07','2019-03-14 10:34:07'),(87,1,'219.42.188.32','Mozilla/5.0 (Windows; U; Windows NT 5.0) AppleWebKit/534.45.6 (KHTML, like Gecko) Version/4.0.5 Safari/534.45.6','OSX','2018-12-11 03:02:07','2019-01-13 15:04:07'),(88,1,'73.47.26.34','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5342 (KHTML, like Gecko) Chrome/38.0.812.0 Mobile Safari/5342','Windows 10','2019-02-22 03:43:07','2019-01-17 03:22:07'),(89,1,'137.51.200.200','Mozilla/5.0 (Windows 98; Win 9x 4.90) AppleWebKit/5341 (KHTML, like Gecko) Chrome/37.0.808.0 Mobile Safari/5341','OSX','2019-03-13 11:46:07','2019-01-18 16:54:07'),(90,1,'10.220.172.174','Opera/9.37 (X11; Linux i686; en-US) Presto/2.10.351 Version/11.00','OSX','2019-01-30 04:52:07','2019-02-03 04:59:07'),(91,1,'124.62.222.102','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5310 (KHTML, like Gecko) Chrome/38.0.896.0 Mobile Safari/5310','OSX','2019-01-15 02:35:07','2019-03-01 20:46:07'),(92,1,'244.81.5.171','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3 rv:2.0) Gecko/20100823 Firefox/35.0','Windows 10','2019-03-11 19:38:07','2019-02-15 10:55:07'),(93,1,'49.130.180.161','Mozilla/5.0 (compatible; MSIE 5.0; Windows 95; Trident/4.1)','Linux','2019-02-06 04:35:07','2018-12-23 11:03:07'),(94,1,'252.110.181.177','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5321 (KHTML, like Gecko) Chrome/38.0.802.0 Mobile Safari/5321','Linux','2019-03-08 01:43:07','2019-02-10 19:32:07'),(95,1,'139.58.16.191','Mozilla/5.0 (Windows 95; sl-SI; rv:1.9.0.20) Gecko/20140503 Firefox/35.0','Linux','2018-12-19 15:14:07','2018-12-30 12:05:07'),(96,1,'130.25.132.79','Opera/9.38 (Windows NT 6.1; en-US) Presto/2.8.209 Version/12.00','Windows 10','2018-12-31 22:56:07','2019-03-09 21:13:07'),(97,1,'61.17.76.125','Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 6.1; Trident/4.0)','Windows 10','2019-02-06 05:43:07','2018-12-13 15:31:07'),(98,1,'196.148.251.198','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_7 rv:5.0; en-US) AppleWebKit/535.33.2 (KHTML, like Gecko) Version/4.0.3 Safari/535.33.2','OSX','2019-02-10 01:22:07','2018-12-16 10:19:07'),(99,1,'155.150.226.37','Mozilla/5.0 (compatible; MSIE 11.0; Windows 98; Win 9x 4.90; Trident/5.1)','OSX','2019-03-01 07:22:07','2018-12-27 23:42:07'),(100,1,'87.77.119.108','Mozilla/5.0 (Windows CE; sl-SI; rv:1.9.2.20) Gecko/20171203 Firefox/35.0','OSX','2019-02-28 06:04:07','2018-12-23 12:02:07'),(101,1,'24.241.32.205','Mozilla/5.0 (Windows NT 6.2) AppleWebKit/5342 (KHTML, like Gecko) Chrome/37.0.857.0 Mobile Safari/5342','Linux','2019-02-09 06:10:07','2018-12-27 22:09:07'),(102,1,'24.31.143.197','Opera/8.11 (X11; Linux x86_64; en-US) Presto/2.8.193 Version/12.00','Linux','2018-12-30 18:43:07','2019-03-08 14:56:07'),(103,1,'32.12.250.91','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5332 (KHTML, like Gecko) Chrome/40.0.822.0 Mobile Safari/5332','OSX','2019-01-29 11:00:07','2018-12-23 14:58:07'),(104,1,'225.232.60.119','Opera/9.96 (X11; Linux x86_64; sl-SI) Presto/2.12.264 Version/11.00','Linux','2019-01-06 17:18:07','2018-12-13 23:20:07'),(105,1,'106.17.80.143','Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 6.2; Trident/3.1)','OSX','2019-03-13 19:01:07','2019-02-15 14:02:07'),(106,1,'19.47.30.252','Mozilla/5.0 (X11; Linux x86_64; rv:5.0) Gecko/20110907 Firefox/36.0','Windows 10','2018-12-11 01:33:07','2019-01-31 22:19:07'),(107,1,'190.132.117.30','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5360 (KHTML, like Gecko) Chrome/36.0.856.0 Mobile Safari/5360','OSX','2018-12-21 21:54:07','2019-02-28 01:37:07'),(108,1,'68.243.22.83','Mozilla/5.0 (Windows 95; en-US; rv:1.9.2.20) Gecko/20120703 Firefox/35.0','Windows 10','2019-03-02 00:50:07','2018-12-17 01:05:07'),(109,1,'46.32.78.91','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_5_8 rv:4.0; sl-SI) AppleWebKit/535.47.4 (KHTML, like Gecko) Version/4.0.1 Safari/535.47.4','Windows 10','2019-02-03 09:32:07','2018-12-11 00:08:07'),(110,1,'64.58.214.58','Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 4.0; Trident/4.1)','OSX','2019-02-01 08:49:07','2018-12-06 16:23:07'),(111,1,'107.192.162.251','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 4.0; Trident/4.1)','Windows 10','2019-02-15 23:24:07','2019-02-05 01:38:07'),(112,1,'55.32.17.71','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5361 (KHTML, like Gecko) Chrome/39.0.867.0 Mobile Safari/5361','Linux','2019-01-03 01:02:07','2019-01-18 14:44:07'),(113,1,'207.64.163.120','Mozilla/5.0 (compatible; MSIE 11.0; Windows NT 5.2; Trident/5.1)','Linux','2019-01-13 17:33:07','2019-01-03 08:25:07'),(114,1,'218.52.207.248','Opera/9.21 (X11; Linux i686; en-US) Presto/2.9.323 Version/11.00','Windows 10','2019-01-22 16:32:07','2018-12-28 17:48:07'),(115,1,'196.26.121.69','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/5362 (KHTML, like Gecko) Chrome/40.0.864.0 Mobile Safari/5362','OSX','2019-03-10 18:14:07','2019-02-26 11:03:07'),(116,1,'89.49.226.161','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_8_3 rv:2.0; en-US) AppleWebKit/532.1.2 (KHTML, like Gecko) Version/5.1 Safari/532.1.2','Linux','2019-01-10 19:43:07','2019-02-02 00:44:07'),(117,1,'222.105.61.237','Mozilla/5.0 (X11; Linux i686) AppleWebKit/5331 (KHTML, like Gecko) Chrome/40.0.834.0 Mobile Safari/5331','Linux','2018-12-14 18:03:07','2018-12-21 23:33:07'),(118,1,'193.51.225.38','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_4 rv:6.0) Gecko/20100710 Firefox/35.0','OSX','2019-02-17 05:38:07','2019-01-01 05:21:07'),(119,1,'5.245.113.125','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_8_9) AppleWebKit/5311 (KHTML, like Gecko) Chrome/37.0.844.0 Mobile Safari/5311','OSX','2019-02-21 19:56:07','2019-02-22 22:00:07'),(120,1,'1.33.71.235','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5342 (KHTML, like Gecko) Chrome/36.0.856.0 Mobile Safari/5342','OSX','2019-02-12 10:39:07','2019-03-13 18:35:07'),(121,1,'39.90.236.39','Mozilla/5.0 (compatible; MSIE 8.0; Windows 98; Win 9x 4.90; Trident/4.0)','OSX','2018-12-16 02:49:07','2019-03-05 19:18:07'),(122,1,'127.193.84.97','Mozilla/5.0 (Windows NT 5.01) AppleWebKit/5321 (KHTML, like Gecko) Chrome/39.0.842.0 Mobile Safari/5321','OSX','2018-12-13 09:29:07','2019-02-19 08:56:07'),(123,1,'99.145.79.33','Mozilla/5.0 (Windows; U; Windows NT 5.1) AppleWebKit/534.44.1 (KHTML, like Gecko) Version/5.1 Safari/534.44.1','Windows 10','2019-01-21 19:19:07','2019-01-11 08:24:07'),(124,1,'33.63.44.52','Mozilla/5.0 (compatible; MSIE 11.0; Windows NT 6.2; Trident/4.1)','Linux','2018-12-23 15:00:08','2018-12-20 08:44:08'),(125,1,'16.15.48.143','Mozilla/5.0 (Windows CE) AppleWebKit/5340 (KHTML, like Gecko) Chrome/39.0.878.0 Mobile Safari/5340','OSX','2019-01-16 11:34:08','2019-01-23 04:20:08'),(126,1,'183.107.241.28','Mozilla/5.0 (compatible; MSIE 11.0; Windows NT 4.0; Trident/3.0)','OSX','2019-03-05 07:31:08','2018-12-06 21:02:08'),(127,1,'193.172.47.173','Opera/8.93 (Windows 98; Win 9x 4.90; sl-SI) Presto/2.8.177 Version/12.00','Linux','2019-02-21 23:45:08','2018-12-05 20:24:08'),(128,1,'211.244.35.118','Opera/9.33 (Windows NT 5.01; en-US) Presto/2.10.312 Version/10.00','OSX','2019-01-29 07:52:08','2019-01-18 05:00:08'),(129,1,'189.112.114.152','Opera/9.58 (X11; Linux i686; sl-SI) Presto/2.9.203 Version/11.00','OSX','2019-02-12 23:26:08','2019-01-27 15:01:08'),(130,1,'204.215.64.214','Mozilla/5.0 (compatible; MSIE 11.0; Windows NT 5.0; Trident/3.1)','OSX','2019-02-20 02:25:08','2019-01-28 01:27:08'),(131,1,'228.47.110.62','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 5.1; Trident/4.0)','Windows 10','2019-02-17 14:18:08','2018-12-05 21:16:08'),(132,1,'241.224.0.149','Opera/8.49 (Windows 95; sl-SI) Presto/2.9.324 Version/11.00','Windows 10','2018-12-12 04:57:08','2018-12-20 02:43:08'),(133,1,'37.63.106.184','Opera/9.98 (Windows NT 5.2; sl-SI) Presto/2.11.210 Version/11.00','OSX','2019-02-22 02:13:08','2019-01-27 02:18:08'),(134,1,'138.162.251.30','Opera/9.95 (Windows NT 6.2; sl-SI) Presto/2.9.166 Version/10.00','Linux','2018-12-22 22:24:08','2019-02-22 17:32:08'),(135,1,'174.234.85.171','Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_8_3) AppleWebKit/5351 (KHTML, like Gecko) Chrome/36.0.863.0 Mobile Safari/5351','OSX','2019-02-19 08:52:08','2019-01-01 03:16:08'),(136,1,'109.203.151.111','Opera/9.98 (Windows NT 5.0; en-US) Presto/2.11.201 Version/12.00','OSX','2018-12-25 15:06:08','2019-02-10 18:39:08'),(137,1,'35.237.81.85','Opera/9.14 (Windows NT 5.01; en-US) Presto/2.8.211 Version/12.00','Windows 10','2018-12-26 11:36:08','2018-12-31 13:53:08'),(138,1,'239.41.54.146','Opera/9.97 (Windows NT 5.2; en-US) Presto/2.12.292 Version/11.00','OSX','2018-12-28 06:02:08','2018-12-13 00:29:08'),(139,1,'245.7.176.114','Mozilla/5.0 (iPad; CPU OS 8_1_2 like Mac OS X; sl-SI) AppleWebKit/532.13.5 (KHTML, like Gecko) Version/4.0.5 Mobile/8B116 Safari/6532.13.5','Windows 10','2019-01-29 22:57:08','2019-02-09 02:38:08'),(140,1,'177.232.95.15','Mozilla/5.0 (compatible; MSIE 11.0; Windows NT 6.0; Trident/4.0)','Windows 10','2019-01-24 10:43:08','2018-12-17 19:11:08'),(141,1,'60.172.50.112','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_8_9 rv:5.0; sl-SI) AppleWebKit/535.12.4 (KHTML, like Gecko) Version/5.1 Safari/535.12.4','Linux','2019-01-12 22:30:08','2018-12-13 11:37:08'),(142,1,'19.151.194.35','Mozilla/5.0 (Windows NT 5.0; en-US; rv:1.9.2.20) Gecko/20161115 Firefox/37.0','OSX','2019-03-01 12:17:08','2019-03-05 23:53:08'),(143,1,'129.66.24.127','Mozilla/5.0 (Windows 95) AppleWebKit/5312 (KHTML, like Gecko) Chrome/36.0.850.0 Mobile Safari/5312','OSX','2019-02-26 02:32:08','2019-03-03 18:31:08'),(144,1,'90.47.173.210','Mozilla/5.0 (Macintosh; PPC Mac OS X 10_7_7 rv:4.0; sl-SI) AppleWebKit/532.32.2 (KHTML, like Gecko) Version/4.0 Safari/532.32.2','Linux','2019-02-11 05:46:08','2019-02-06 07:46:08'),(145,1,'48.107.231.133','Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20170421 Firefox/37.0','Linux','2019-03-13 05:48:08','2018-12-28 15:31:08'),(146,1,'222.89.131.56','Mozilla/5.0 (Windows CE) AppleWebKit/5362 (KHTML, like Gecko) Chrome/36.0.822.0 Mobile Safari/5362','Windows 10','2019-01-09 19:51:08','2019-01-16 10:00:08'),(147,1,'234.62.244.109','Mozilla/5.0 (Windows; U; Windows CE) AppleWebKit/533.22.2 (KHTML, like Gecko) Version/4.0 Safari/533.22.2','Windows 10','2018-12-05 21:55:08','2019-01-30 18:53:08'),(148,1,'45.33.164.207','Opera/8.56 (X11; Linux x86_64; en-US) Presto/2.9.219 Version/11.00','Windows 10','2019-01-26 22:25:08','2018-12-13 22:29:08'),(149,1,'175.231.239.151','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/5331 (KHTML, like Gecko) Chrome/40.0.819.0 Mobile Safari/5331','OSX','2019-01-25 02:26:08','2019-02-06 06:45:08'),(150,1,'186.116.138.175','Opera/9.59 (X11; Linux i686; sl-SI) Presto/2.9.250 Version/10.00','OSX','2019-02-24 08:55:08','2019-02-17 08:43:08');
/*!40000 ALTER TABLE `em_product_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_product_wishlists`
--

DROP TABLE IF EXISTS `em_product_wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_product_wishlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_product_wishlists_id_product_foreign` (`id_product`) USING BTREE,
  KEY `em_product_wishlists_id_user_foreign` (`id_user`) USING BTREE,
  CONSTRAINT `em_product_wishlists_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `em_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `em_product_wishlists_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `em_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_product_wishlists`
--

LOCK TABLES `em_product_wishlists` WRITE;
/*!40000 ALTER TABLE `em_product_wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_product_wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_products`
--

DROP TABLE IF EXISTS `em_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_useradmin` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  `title_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `simple_description` text COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `id_measurement` int(10) unsigned NOT NULL,
  `url_vidio` longtext COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_products_id_user_foreign` (`id_useradmin`) USING BTREE,
  KEY `em_products_id_categories_foreign` (`id_category`) USING BTREE,
  KEY `em_products_id_measurement_foreign` (`id_measurement`) USING BTREE,
  CONSTRAINT `em_products_id_categories_foreign` FOREIGN KEY (`id_category`) REFERENCES `em_product_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `em_products_id_measurement_foreign` FOREIGN KEY (`id_measurement`) REFERENCES `em_product_measurements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `em_products_id_user_foreign` FOREIGN KEY (`id_useradmin`) REFERENCES `em_useradmins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_products`
--

LOCK TABLES `em_products` WRITE;
/*!40000 ALTER TABLE `em_products` DISABLE KEYS */;
INSERT INTO `em_products` VALUES (1,1,1,'Veniam rem dignissimos sed voluptatem eveniet reiciendis culpa eos.','veniam-rem-dignissimos-sed-voluptatem-eveniet-reiciendis-culpa-eos',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Deleniti voluptas possimus cumque blanditiis non quia. Fuga natus quo commodi molestiae perferendis et ipsa. Temporibus explicabo fugit dolores necessitatibus ea sit qui iure. Atque enim maiores tempora modi. Harum laborum et adipisci laboriosam rem modi. Ut laudantium consectetur nostrum. Incidunt tempore rerum sed itaque beatae occaecati quibusdam corporis. Eos ipsa autem delectus quidem eaque consequatur necessitatibus. Iste tenetur totam quos ab aut est. Neque ut quis reiciendis nobis optio aut sint tempore. Asperiores omnis laboriosam incidunt harum. Eum aut est consequatur harum. Eum non facilis cumque dicta. Natus animi amet incidunt laboriosam sit provident. Quod a ea perferendis consequatur dolore. Officiis non in non commodi vero ut quis. Dolorem eum repellat omnis minima. Quod quos odit facilis sint non facere. Harum et dicta qui occaecati facere pariatur esse. Illo repudiandae laborum occaecati et error rerum.',1,NULL,1,'2019-03-28 00:01:14','2019-03-28 03:45:34','2019-03-28 03:45:34'),(2,1,1,'Aut omnis temporibus ipsam nam voluptatem mollitia doloremque cumque suscipit aut culpa.','aut-omnis-temporibus-ipsam-nam-voluptatem-mollitia-doloremque-cumque-suscipit-aut-culpa',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Adipisci molestiae minus inventore. Quia inventore incidunt aut quia eum molestiae fuga. Eum qui blanditiis commodi quidem nulla quis. Nesciunt error cumque aliquam placeat sit. Hic et odit voluptate modi repellendus excepturi tempora voluptate. Cumque quia exercitationem similique sed eos et dolor. Asperiores similique et unde quo neque. Aut voluptas culpa quis. Non et dignissimos assumenda omnis. Rem et ad et sunt quam. Totam quo laborum odit aut accusantium hic aperiam corporis. Sed modi non consequatur corporis aspernatur aut consequatur ad. Quia reprehenderit ratione aut ut molestias eos esse est. Fugit qui quod quos vitae ut ut. Odio est velit non optio. Vero deserunt iusto at aliquam odio. Iure dolorem occaecati et sit culpa. Provident non et enim voluptatem modi est. Quis architecto at molestiae et repudiandae quas nulla aut. Nihil nobis vero ipsum atque. Alias nesciunt odit et incidunt optio quia vel reprehenderit.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(3,1,1,'Minus ut molestiae quos sint vel error explicabo perferendis.','minus-ut-molestiae-quos-sint-vel-error-explicabo-perferendis',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Quibusdam sint culpa ducimus reiciendis. Dolores officia et ullam culpa et. Magni ullam voluptatem deleniti repellendus incidunt est debitis sed. Totam quo deserunt quibusdam soluta. Laboriosam error consectetur hic accusantium. Aut sed et animi error voluptates ipsa ut. Vitae rerum sed animi perferendis. Est repellat neque accusantium laudantium repellat laudantium cum accusantium. Iste quia enim voluptatibus eius omnis odit laboriosam. Ut voluptas et et aut consequatur quam accusamus. Ut quia commodi quam rerum possimus rerum. Id soluta necessitatibus quia aut sit assumenda. Dolore dolor et aut atque ducimus corporis. Est repudiandae commodi ipsum itaque ad rerum. Provident nihil quia aliquid laboriosam et. Possimus voluptates omnis et voluptas numquam vitae. Ducimus voluptatem distinctio quisquam non. Ut ex saepe voluptatem. Expedita ab dolore est molestiae officiis.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(4,1,1,'Enim sed autem cum molestias in et quis aut rem dolor praesentium assumenda adipisci.','enim-sed-autem-cum-molestias-in-et-quis-aut-rem-dolor-praesentium-assumenda-adipisci',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Rerum molestiae porro ipsum in aliquid. Sint dolores quo quisquam ipsam placeat aliquid earum. Doloremque deserunt itaque molestias sit. Assumenda omnis laborum sint atque sit. Quo saepe aut nihil ut dolorum. Reiciendis sunt quaerat cumque voluptatem velit non laudantium. Vel qui voluptatem tempora eos tenetur quia eum aperiam. Fuga quibusdam debitis natus sed enim hic nobis. Et cupiditate quis quos aspernatur et fugiat eum. Fuga quis ut eum harum est earum. Totam pariatur rem ut maiores. Itaque recusandae ex beatae. Perspiciatis dolores sunt dolor. Ad voluptas aut accusamus amet quidem. Incidunt distinctio ratione sed sed perferendis voluptatibus autem. Dolorem animi voluptas est asperiores deleniti. Vel saepe rerum velit molestiae. Quod autem tempore autem consequatur voluptatem. Molestias rem veniam placeat ullam id soluta est minus. Natus facere voluptas reprehenderit velit molestiae sapiente.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(5,1,1,'Eos tempore reprehenderit itaque deleniti consequatur quia fugit exercitationem tempora.','eos-tempore-reprehenderit-itaque-deleniti-consequatur-quia-fugit-exercitationem-tempora',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Non ut perspiciatis tempore enim. Sunt consequatur id distinctio officiis. Ipsa qui dolor hic distinctio veniam et nisi ullam. Voluptate similique fuga illum deserunt ducimus. Iste veritatis nisi nihil sed sint dolorum at. At dolore asperiores aliquam est. Nisi veniam consectetur eveniet voluptate et. Sit dolor repellendus accusantium consequatur ipsa sit sed. Dolor voluptatem commodi quia. Soluta eveniet debitis qui repudiandae laborum neque. Consequatur labore ab nobis animi velit incidunt exercitationem sunt. Officia fuga numquam corporis autem. Modi ea beatae voluptates omnis repellat. Consequatur ex in reprehenderit quae quod. Eaque tenetur reiciendis ut provident quisquam. Placeat pariatur officiis harum rerum ut quod. Distinctio eveniet tenetur praesentium quisquam recusandae est. Possimus quasi eum assumenda et sunt sint. Et ducimus illum deleniti suscipit est dolore. Quo delectus eveniet autem.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(6,1,1,'Et ut in aut numquam omnis quos quod necessitatibus tempora alias similique animi dolor.','et-ut-in-aut-numquam-omnis-quos-quod-necessitatibus-tempora-alias-similique-animi-dolor',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Unde accusantium eos voluptatem at aliquam omnis. Quibusdam impedit omnis rerum eum fuga est ipsum. Dolor eaque tempore autem. Et quod in qui qui dolorem. Sit unde tenetur magnam dolor. Beatae aut dolorem quas recusandae consequatur. Sint atque at alias est rerum iusto. Dicta nihil necessitatibus est totam iusto pariatur numquam. Vero eius expedita minima et rerum vero. Rem occaecati ullam quam. Aliquid ut adipisci eum incidunt nisi dolor inventore dolores. Repudiandae tenetur omnis ullam omnis. Dolorum blanditiis nostrum sed incidunt accusantium sunt. Architecto dolorum impedit voluptatem porro repudiandae nihil. Est eveniet provident aliquid provident. Voluptatem laboriosam voluptatem eaque. Porro eum fugiat qui quam laudantium perspiciatis. Magni eius qui aut laboriosam. Porro qui eum doloremque maxime quae aliquid quo. Et odio labore quod et et et occaecati. Velit placeat dolore nemo minima velit sit. Fuga tempore est ex aut molestiae commodi architecto ut.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(7,1,1,'Unde labore quaerat et repellendus dolor accusamus consequuntur ut nemo.','unde-labore-quaerat-et-repellendus-dolor-accusamus-consequuntur-ut-nemo',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Praesentium officiis aut eligendi alias illum. Incidunt qui et sed dolorem. Omnis veritatis consequuntur ex alias eius maiores perferendis officiis. Amet et et delectus repellat. Non nesciunt sit totam eos amet sequi. Odit accusamus amet voluptas aspernatur distinctio adipisci. Nemo quia nam fugiat blanditiis rerum possimus magni. Distinctio reprehenderit deleniti iure quia. Reiciendis magnam earum rerum ipsum et. In nulla et itaque dolorum dolor tenetur voluptatem velit. Autem atque non et dolor delectus qui quae. Explicabo asperiores est sed tempore quae quo et veniam. Aut nihil consequatur odit et voluptatem. Ratione nisi dolores omnis exercitationem molestias. Eos eos qui adipisci sit modi. Aspernatur nihil aut quia eos omnis qui fugiat neque. Dicta nostrum mollitia quaerat aliquid. Numquam sit nihil doloribus quaerat. Id itaque modi dicta ut voluptates id.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(8,1,1,'Libero consectetur aut ducimus hic quo itaque modi voluptates tenetur molestiae nostrum.','libero-consectetur-aut-ducimus-hic-quo-itaque-modi-voluptates-tenetur-molestiae-nostrum',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Soluta sed ipsa illo ex. Ut velit libero unde aut quasi quisquam laborum ipsa. Hic repellat vero similique qui. Amet aliquam quis qui vel quia id praesentium. Dolore amet ea aspernatur a ut nulla et. Illum et optio dignissimos dolores ut et eius. Consequuntur deserunt iste fuga velit deleniti et quasi magnam. Et sequi dicta totam. Et cum tenetur et atque dolorem. Voluptas voluptas inventore nostrum dolor totam sed placeat. Tenetur qui vel magnam dolores dolorem placeat architecto. Recusandae animi eum nihil quia. Non molestiae neque magnam non. Dolorem voluptas reiciendis placeat est voluptas voluptas. Rem natus ut earum minima odit autem. Doloribus voluptas quibusdam sapiente libero doloribus. Repellendus ut est saepe illo quia aspernatur sint sapiente. Quia atque aliquam maxime ratione velit voluptatem voluptatem. Tempore aut dignissimos doloribus dolore aut fugit voluptates quia. Iste nisi corporis iste. Occaecati occaecati unde vero dolores.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(9,1,1,'Eos voluptas dignissimos aut temporibus at nemo doloremque sapiente.','eos-voluptas-dignissimos-aut-temporibus-at-nemo-doloremque-sapiente',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Deserunt aut sequi alias quo. Unde qui sunt illum. Accusantium sit error et id quo dolores. Enim id laborum sit. Esse quia incidunt dicta ipsum ut maxime molestiae. Provident explicabo suscipit neque autem est debitis beatae. Ut necessitatibus quis sunt repudiandae perferendis. Hic nesciunt et adipisci nulla vel ipsa quo. Reprehenderit sed eaque sed et. Consequatur qui quibusdam laudantium aut. Eius dolore quae incidunt maiores voluptas. Atque omnis occaecati totam. Ut dolore et voluptatem fuga vitae at laboriosam. Unde sed nihil consequatur ut aliquid aspernatur perferendis pariatur. Mollitia aspernatur nihil ipsum pariatur itaque eius. Eaque ut exercitationem aut itaque tempore hic quaerat reprehenderit. Ullam quisquam quia explicabo aut. Ullam impedit qui porro enim. Nobis vel est sed. Optio officia est rerum quia quas.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(10,1,1,'Voluptatum enim delectus sed a accusamus molestiae odio.','voluptatum-enim-delectus-sed-a-accusamus-molestiae-odio',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Voluptas libero et quis dolorem vel enim similique praesentium. Et dolor ipsum sint et et. Voluptatibus officiis aut quisquam omnis. Odit dignissimos nihil nulla non rerum dolor magnam. Architecto dolores libero pariatur error. Dolores commodi vitae quia sequi sed. Pariatur illum maxime molestiae. Asperiores est at sed autem veritatis enim. Et vitae enim placeat rerum odio ea voluptatibus. Consequuntur tempora dignissimos inventore non. Laboriosam est sed sint. Id nisi accusantium et autem natus aliquid quia. Quae reprehenderit molestiae perspiciatis commodi impedit error. Omnis quasi eaque qui sunt. Necessitatibus suscipit in et vel sequi illum repellat et. Qui quis nemo omnis maxime ut et. Reprehenderit alias culpa qui tempora voluptas. Laboriosam reiciendis nihil fugit et ipsa autem. Rerum perspiciatis nihil illo repellendus porro.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(11,1,1,'Aut minus vel cumque tenetur quia quis voluptates tempora autem.','aut-minus-vel-cumque-tenetur-quia-quis-voluptates-tempora-autem',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Dolor rerum eius et consectetur quia molestiae in. Eum porro rerum aut voluptas. Alias est excepturi architecto quisquam. Ipsa vero repellat aperiam nostrum voluptatem quia facere vel. Sunt quia voluptatibus ut id ducimus. Similique culpa consequatur inventore nostrum dolorum dolorem. Quia animi laudantium consequuntur id aliquid enim ut aperiam. Qui error sunt illum sit. Tempore at sed error delectus et aliquam. Possimus pariatur non et voluptatibus maxime. Labore non necessitatibus eveniet est. Quisquam eaque id aut voluptatem voluptatem est. Sunt quia provident impedit. Reprehenderit officia delectus dolorem fuga consequatur aut numquam amet. Et nihil maiores quia nam. Assumenda voluptatem dolorem qui facilis. Cupiditate neque veniam ut voluptas. Aut ad hic aspernatur alias et. Qui ut aut unde commodi qui perferendis.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(12,1,1,'In consectetur quia mollitia voluptatem culpa eos et quibusdam perferendis.','in-consectetur-quia-mollitia-voluptatem-culpa-eos-et-quibusdam-perferendis',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Natus aut dignissimos soluta. Harum vero natus eligendi totam possimus unde. Eius voluptas aliquid minus tempora. Sint quasi voluptas veritatis eos sunt dolores. Eius illo qui rerum numquam quos sunt. Ducimus laboriosam eum voluptate deserunt sit omnis omnis. Fuga sint facilis id vitae natus. Adipisci omnis nostrum ad temporibus recusandae. Voluptatem numquam officia corrupti voluptas qui. Rerum sint quia vel. Reiciendis laborum assumenda vero. Deserunt aut iste voluptatibus iste. Optio odio placeat sit dignissimos et. Eos necessitatibus maiores ut pariatur perferendis et et. Ab consequuntur consequatur iusto aut dicta et natus. Nisi laudantium totam dolorum maxime. Ipsam quisquam ut rerum consequatur error nihil voluptatem. Mollitia et provident eius neque. Necessitatibus ut et cupiditate eligendi. Repellendus id non pariatur nisi incidunt cumque ea provident. Doloribus dolore omnis facilis aut nam odio. Omnis voluptate et totam iure sit sed cupiditate ut.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(13,1,1,'Accusamus id eligendi voluptatum delectus reiciendis culpa harum.','accusamus-id-eligendi-voluptatum-delectus-reiciendis-culpa-harum',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Reprehenderit voluptatem quo laboriosam architecto. Doloribus qui aut qui ducimus et. Aut unde aut natus. Mollitia nesciunt ea veritatis tempora quia et. Iste ut qui velit hic qui. Voluptatibus aut sed modi rem in. Nihil doloribus eligendi architecto molestiae cum quis accusamus. Necessitatibus a quia et. Veniam maiores omnis doloribus facilis necessitatibus. Dolorem inventore quis odio et totam hic ea. Culpa voluptas quis dolor ipsa id optio. Reprehenderit nam alias et sint similique. Aut quod fugiat accusamus illo et odit. Quis ducimus omnis id sed occaecati. Qui sint ad omnis dolor veritatis molestiae. Quia eveniet laudantium corrupti ut est expedita. Odio voluptas ut et fugiat. Aliquid praesentium velit doloribus molestiae id dolores. Quidem sapiente maxime cupiditate quia eos laborum. Quo sequi architecto sapiente ipsam aut dolor. Beatae culpa sint nulla. Eaque doloribus est delectus molestiae praesentium. Nostrum consequatur ratione quia ut rerum.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(14,1,1,'Laudantium corporis et natus eum voluptatum voluptatem dolor minima voluptas aspernatur vero.','laudantium-corporis-et-natus-eum-voluptatum-voluptatem-dolor-minima-voluptas-aspernatur-vero',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Quasi incidunt et ut eveniet. Voluptas ut cupiditate omnis necessitatibus voluptatum tempora. Debitis maxime ut beatae nihil id. Ex aliquam voluptas doloremque sit eos dolorem officiis. Sit reprehenderit perspiciatis est et. Aliquam accusantium quaerat tempore ut voluptates illum. Consequatur quidem mollitia dolore ipsa sed et voluptatem. Non quae minus eos ipsum voluptatum impedit. Ut eos blanditiis excepturi nemo quia est hic. Aut voluptatem consequuntur molestiae voluptate. Id et aut iusto ipsa natus est asperiores. Id atque labore facere magni ullam optio delectus. Accusantium qui ut voluptatibus enim architecto. Animi voluptates amet accusamus minus animi. Ex iste sint omnis sit autem. Dolor natus dolor quae voluptas perferendis culpa ut. At doloribus ut molestiae sed. Quis tempore sit consectetur esse et.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(15,1,1,'In sed et in et quia expedita id veniam et quis quod ipsa.','in-sed-et-in-et-quia-expedita-id-veniam-et-quis-quod-ipsa',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Minus expedita non iusto molestiae voluptas nam est inventore. Recusandae voluptas eum quae doloribus modi omnis iusto rem. Blanditiis non assumenda distinctio libero totam. Modi nemo aut in sit sunt. Fugit ut molestiae vel rerum tempora fugit tempora. Dolorem accusantium quisquam culpa. Enim necessitatibus dolores ut fugit voluptas. Fugit voluptatum quis voluptatem qui aliquam enim repellendus. Tenetur delectus nisi repellat non amet. Assumenda nisi accusantium nostrum rerum rerum voluptatem eum occaecati. Ipsam itaque veritatis qui est est. Voluptatem quaerat eum iusto. Vel assumenda asperiores quam aut totam. Distinctio deleniti dolorum maxime ullam esse et. Temporibus mollitia nemo impedit. Ratione est et ratione quaerat consequatur. Ipsa culpa aspernatur corrupti fugit dignissimos est amet. Sequi repellendus aspernatur assumenda. Aut illum sint perferendis aliquid sed voluptate vitae. Impedit commodi doloribus illum quaerat a nesciunt. Nostrum ea et cumque qui.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(16,1,1,'Id est aut consequatur officiis est esse adipisci ut earum ut dignissimos.','id-est-aut-consequatur-officiis-est-esse-adipisci-ut-earum-ut-dignissimos',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Ut quo enim quis porro qui corrupti quos. Tenetur corporis aut aperiam aspernatur. Quo reiciendis ut aperiam ut quis non. Suscipit non esse ipsum sunt rerum. Libero laudantium autem recusandae. Cum reprehenderit quam ut facere aspernatur ab explicabo. Eligendi sit voluptatem omnis et. Quae itaque eum vel odit magnam corporis qui. Quia expedita et voluptas. Nam error assumenda placeat occaecati. Quo aut vero aliquam officia consectetur. Sit aliquam nulla illum hic porro rerum qui. Ut dignissimos quia tempora in. Eius et impedit aut itaque. Nulla aspernatur nihil consequatur velit nihil. Natus omnis itaque qui deserunt excepturi itaque tempora doloribus. Voluptas et adipisci itaque similique. Totam ullam doloribus ad fugit possimus. Nam aperiam ex soluta consequatur. Porro ut et quia alias quia. Maiores id rerum accusantium et. Quam praesentium ipsum quis eum consequatur.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(17,1,1,'Accusantium nemo dolorem aliquam fugit eaque itaque doloremque asperiores nesciunt quam.','accusantium-nemo-dolorem-aliquam-fugit-eaque-itaque-doloremque-asperiores-nesciunt-quam',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Iusto tempora quo eaque et. Maiores sequi debitis illo et officiis saepe et. Qui dolores voluptate quia fugiat. Amet nihil quam repellat id. Magnam maiores facilis unde reiciendis ut perferendis quia dolorem. Sapiente odio blanditiis consequatur rerum perspiciatis. Animi iure qui aliquam sunt cupiditate. Autem sint consequatur repellendus voluptatum hic. Doloribus id quis vitae aliquam perspiciatis pariatur. Voluptatum commodi labore aut omnis a voluptas magnam. Provident sit doloribus qui ducimus ipsa. Consequuntur corporis sunt tenetur nulla ut voluptatem modi. Qui laudantium sed nobis deleniti expedita. Voluptatem delectus blanditiis commodi accusantium debitis vel non. Totam quidem totam dolorum pariatur id. Culpa ratione est eum quia illum. Aut voluptates itaque voluptatum est dolorum in rerum. Quo aspernatur error laudantium voluptas. Maxime laboriosam non id adipisci enim magni. Quo nostrum animi natus debitis dolorum eum iusto. Consequuntur in dolorem aperiam animi atque.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(18,1,1,'Eum eveniet labore possimus sed quas praesentium possimus neque omnis consequatur temporibus.','eum-eveniet-labore-possimus-sed-quas-praesentium-possimus-neque-omnis-consequatur-temporibus',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Voluptatem aliquid ut rerum odit assumenda non omnis. Ut aliquid consequatur dolor hic. Omnis beatae pariatur iusto omnis est. Iusto ea consectetur eius ducimus et molestias est at. Consectetur necessitatibus eum consequatur voluptas nobis. Eum cupiditate harum sed iusto consequuntur praesentium. Consequatur labore tempora placeat est. Nisi unde sit qui possimus corrupti. Neque et iure nam aliquam. Sequi quae dolor culpa harum enim dolor ducimus. Molestiae ipsam deleniti velit laborum reprehenderit aspernatur. Laborum voluptate nulla facilis ad voluptatem quia maiores. Et sed vero qui dolorem. Nulla aut deleniti quia et eius consequuntur similique porro. Repudiandae et quia unde maiores repellat sed. Ut nostrum qui voluptas et ea modi. Quia facere voluptate voluptate ut voluptatem quia. Esse aspernatur placeat ut dolor. Eveniet doloremque in error laudantium vero. Voluptatum aut non quia incidunt occaecati. Laborum blanditiis consequuntur maiores laudantium omnis.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(19,1,1,'Dolorum aut repellat fugit rerum sit veritatis consequatur optio saepe.','dolorum-aut-repellat-fugit-rerum-sit-veritatis-consequatur-optio-saepe',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Incidunt quas deserunt omnis eum. Dolores fugit nisi aut est ullam molestiae et amet. Officiis eveniet minima quia excepturi et. Velit laboriosam quia laboriosam totam repudiandae dolorem. Quas culpa dolorum magni magnam cupiditate necessitatibus. Ut eligendi ad sit et animi voluptas. Incidunt dolorum facilis cumque tempore libero perspiciatis et. Laudantium necessitatibus dolore praesentium atque est quis et. Laboriosam dolores doloribus natus ut et sint. Nemo consequatur nesciunt sit quis. Perspiciatis quas rerum qui magnam dolores porro voluptate. Eos qui non sapiente nam unde consequatur. Facere enim totam facere nulla. Aspernatur sapiente magnam unde. Eius corrupti aut eius illo recusandae aliquam. Et ex ducimus dolore dicta dolorem. Fugiat assumenda placeat quis numquam. Et odit vel voluptatum magni qui dolorum et.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(20,1,1,'Ea assumenda pariatur ducimus eos sit iusto labore qui illo facilis quia.','ea-assumenda-pariatur-ducimus-eos-sit-iusto-labore-qui-illo-facilis-quia',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Fugit aspernatur est laborum error dolor exercitationem. Laudantium labore debitis quaerat commodi sequi. Velit quibusdam minus est in consectetur maxime. Eum quia tempore velit sit in. Eius vitae eum sit. Ea at nobis doloremque provident laboriosam. A iste omnis et autem in. Ut maxime est libero praesentium enim. Qui mollitia eveniet numquam distinctio non ab est. Deserunt qui harum totam. Excepturi alias deleniti impedit natus a. Perspiciatis aspernatur est beatae odit adipisci illum sed. Occaecati magnam tempora atque odit ut. Magni et soluta porro cum quas. Quaerat rem saepe vel accusantium. Et dolorum aut ab. Ea voluptatum quam laudantium sapiente quia et explicabo qui. Omnis aut accusantium sit sit. Temporibus ut est laudantium magnam voluptatem ad consequuntur. Quam ut distinctio sit optio deserunt reiciendis. Et et nemo reprehenderit distinctio perferendis. Rerum fugiat nihil quia qui distinctio qui enim.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(21,1,1,'Voluptas enim rerum veritatis ullam alias quae ut consequatur a dolor non ut.','voluptas-enim-rerum-veritatis-ullam-alias-quae-ut-consequatur-a-dolor-non-ut',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Quo numquam sunt nobis porro quas omnis. Illo et minus aperiam. Eius accusantium sint aut voluptatem doloremque. Beatae sit in laudantium ipsa repellendus accusantium voluptas sit. Asperiores ut id minima. Non nihil quibusdam fugit nam minima. Voluptates ut adipisci ipsam porro qui est natus. Delectus minima itaque nesciunt labore maiores facere dolores. Eius assumenda tempore in quisquam. Nobis quam culpa ad est. Nulla tenetur ea molestias voluptas quaerat ab cum. Sit ut iure est placeat totam fuga repellat. Voluptatem nihil repellat blanditiis. At dolor aspernatur voluptates vel numquam. Et ratione numquam est voluptas dolore necessitatibus molestiae. Dolorem eligendi aliquid harum quia quasi. Sit sed architecto odit commodi expedita nemo inventore. Et nihil mollitia repellat asperiores. Laudantium dolor placeat atque a qui sint necessitatibus nesciunt. Et officia aut eum consectetur recusandae aut et.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(22,1,1,'Excepturi enim nihil optio aut voluptas sit repellat rerum aliquid facilis autem optio.','excepturi-enim-nihil-optio-aut-voluptas-sit-repellat-rerum-aliquid-facilis-autem-optio',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Voluptate eum vel inventore provident magni et. Sed qui quibusdam laudantium voluptatem sapiente voluptatem accusamus. Delectus ipsa corporis velit dolor error consequuntur et reiciendis. Nihil nobis omnis adipisci fugit. Voluptatem aut atque doloribus. Sint ut aperiam incidunt dolores tempore et. Possimus error vel qui dolore doloribus. Odio dolore quisquam cum quo dolorum. Nulla qui commodi suscipit voluptatem repellendus. Autem cupiditate labore et temporibus eveniet sint id qui. Officiis numquam blanditiis excepturi error nihil. Omnis numquam ex et in magnam dolorum ipsam. Aspernatur commodi reiciendis ratione molestiae explicabo perspiciatis. Eius tenetur alias repudiandae voluptatem corrupti aut accusamus. Est magni libero voluptas. Voluptate id et odit enim nobis dolorem. Inventore saepe unde facilis necessitatibus incidunt dolor. Incidunt maxime nisi laudantium dolores sunt quia repudiandae.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(23,1,1,'Iste aut temporibus eos debitis quia impedit omnis voluptas sint modi rerum reiciendis.','iste-aut-temporibus-eos-debitis-quia-impedit-omnis-voluptas-sint-modi-rerum-reiciendis',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Impedit pariatur sed sint assumenda officiis. Voluptatem sed nostrum architecto laudantium ab in eos voluptas. Eum aut maiores inventore perspiciatis eos aut mollitia. Quidem doloremque quasi quia et voluptatibus. Dolores ea quam voluptatem non. Aut molestiae repellendus nesciunt quibusdam in placeat nobis. Quasi facilis illum ab consectetur. Quod animi repellat totam repudiandae qui. Illo quia quia fugit. Exercitationem temporibus ab accusamus odio. Vero quo enim reprehenderit et consequuntur earum. Doloremque fuga vel et dolorem. Quae sit voluptate beatae occaecati ut et occaecati. At totam ut incidunt est aperiam. Et illo voluptatem et possimus voluptatibus. Placeat sunt labore omnis consectetur. Laudantium neque aut consequatur itaque velit minus ea. Quia ullam sequi ipsum ratione ipsum dolores. Ex commodi et deserunt aut qui pariatur. Dignissimos quia magnam et ex illo.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(24,1,1,'Amet quaerat saepe totam quidem perspiciatis quo sed delectus ad natus et architecto minima.','amet-quaerat-saepe-totam-quidem-perspiciatis-quo-sed-delectus-ad-natus-et-architecto-minima',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Nam et eligendi enim odio. Expedita ea quos cumque. Ullam autem praesentium at odio veritatis qui. Ratione cupiditate earum hic vel a aut rerum. Quam beatae qui eos ut dolor. Qui quis recusandae et. Eos qui ea in illum vel. Nostrum vel ex deleniti nam saepe ipsam neque. Libero consequatur ad tempore quisquam explicabo nemo. Ea rerum necessitatibus perspiciatis omnis officiis ut dolores. Et eos exercitationem animi. Placeat harum similique alias eligendi dolor vel voluptatum. Sunt sequi eveniet voluptas sed reprehenderit tempore pariatur. Possimus corrupti enim omnis est. Rem molestiae asperiores odio voluptate sit. Nisi et perspiciatis aut beatae molestiae ipsum quibusdam. Est dolorem neque vel velit eius adipisci architecto. Molestias quas quam inventore enim omnis commodi dolorum. Consequatur repudiandae qui voluptas aspernatur sit.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(25,1,1,'Non non magni provident nihil asperiores magni voluptatem earum nisi.','non-non-magni-provident-nihil-asperiores-magni-voluptatem-earum-nisi',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Aut debitis aut aut et quam itaque. Quo cupiditate dolor reiciendis dignissimos odit accusantium autem. Veritatis repudiandae rerum esse. Ut vitae tempora animi accusamus eos similique quis. Est consequuntur mollitia velit omnis hic est cum. Provident cumque voluptatem animi at ullam. Dolores tempore molestiae blanditiis eaque voluptatibus praesentium. Sed ut ut assumenda. Suscipit ducimus consequatur in omnis. Molestiae sed blanditiis fuga accusantium doloribus sit. Dolor itaque eos nam et aut. Aperiam rerum ducimus autem velit maiores praesentium odit. Est ad odit fugiat in quis qui qui. Id praesentium quia perferendis nesciunt. Natus sequi animi quibusdam debitis rerum quam alias. Consectetur deserunt voluptas et aspernatur quos voluptas. Ipsa non repudiandae rerum ea et sunt. Ex sit modi a dicta eos ullam. Blanditiis asperiores amet culpa sequi eius rerum. Dolore esse sunt non velit qui perspiciatis. Et nesciunt qui ad nostrum modi optio.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(26,1,1,'Suscipit perspiciatis ipsum ut velit quos nihil voluptatem quidem quae voluptatem dolore consequatur eum.','suscipit-perspiciatis-ipsum-ut-velit-quos-nihil-voluptatem-quidem-quae-voluptatem-dolore-consequatur-eum',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Architecto quis dolore culpa excepturi rerum unde quo. Vitae magnam ratione repudiandae nulla rerum vero hic. Praesentium ducimus aperiam sunt eos unde aperiam. Vel labore error quo sed. Quos minus corporis fugiat provident molestiae fuga. Eius aspernatur enim et debitis. Pariatur molestiae ipsam fugit doloribus saepe blanditiis. Non consequatur et eveniet animi delectus. Sint culpa dolore veritatis qui libero veritatis. Adipisci perferendis itaque sequi molestias vel nobis quod qui. Sit veniam repellendus quis sit. Unde et sunt ipsa. Rem aspernatur voluptatem esse esse quis quisquam repudiandae. Provident nesciunt id qui id blanditiis exercitationem. Ad quos ex pariatur omnis autem. Qui delectus sint doloribus nihil nihil fugiat. Eaque consequatur rerum error. Doloremque ut iusto suscipit est non velit sed. Et ut et est. Molestias quo quaerat laudantium rerum. Ipsum sed laboriosam omnis. Maxime aliquam omnis dolorum ducimus. Sit consequatur labore omnis aut.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(27,1,1,'Illo vitae omnis eaque id ut incidunt animi sint.','illo-vitae-omnis-eaque-id-ut-incidunt-animi-sint',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Et aut quibusdam unde quia ut reiciendis. Animi sint consequatur dignissimos asperiores quia dolor. Quas ex vel sit. Ut voluptas quod qui. Quae qui rerum perferendis illo ut sit quibusdam. Molestias qui dolor laudantium non cumque aliquam. Earum aliquam maxime ab illo officiis sequi. Eum et labore similique expedita ut sint ea dolores. Ut laudantium unde rerum quo. Dolores veritatis sint inventore sit itaque est. Cum eligendi enim ab. Occaecati vitae laudantium quae aut quod nihil. Aut distinctio provident quos totam. Aliquid nulla harum accusantium et quam. Nam neque nesciunt tempore suscipit. In veritatis ut officiis beatae. Ut molestias labore ipsa ipsum adipisci dolore. Facere consectetur tempore voluptatem. Officiis illo nulla esse sit. Sint beatae ipsam sequi quo consequatur. At commodi ipsam ipsum fuga. Debitis ratione dignissimos in amet. Eligendi cum eligendi sit commodi esse laboriosam.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(28,1,1,'Facilis et officia placeat rerum nisi sit voluptas eligendi.','facilis-et-officia-placeat-rerum-nisi-sit-voluptas-eligendi',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Assumenda consequatur minima aut et commodi. Est accusantium ea consequatur delectus omnis hic quod. Qui commodi sit quia amet voluptas iste illo. Aperiam voluptate numquam deleniti minus fugit. Aut sed omnis neque animi corporis. Consequatur vel incidunt qui ut. Ea voluptatibus aspernatur id. Deleniti ipsam molestias totam necessitatibus adipisci. Accusantium aut rerum blanditiis distinctio magnam dolore eos. Nemo quae culpa voluptas eos voluptas rerum. Voluptatibus saepe natus necessitatibus aperiam blanditiis. Sunt quia non est omnis ipsa modi voluptatem. Sint non excepturi ut consequatur eos et aut. Sit neque aut eos. Qui ipsam provident sed illo non. Reprehenderit dolorem aut quod sequi. Rerum nobis consectetur perspiciatis est ratione doloremque. Quidem dolores aut consectetur aperiam. Voluptas facilis velit aut in libero magnam quod quam. Occaecati aut dignissimos dolores dicta et rerum qui. Ut ipsum quos qui qui hic error ipsum. Aut corporis error et nulla et.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(29,1,1,'Dolores voluptas fugiat ut neque non tenetur corrupti maxime officia culpa et quasi perspiciatis.','dolores-voluptas-fugiat-ut-neque-non-tenetur-corrupti-maxime-officia-culpa-et-quasi-perspiciatis',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Facilis hic quisquam aut ut et porro. Magni deleniti qui voluptas quas voluptas dolor ut. Facere rem sequi tempora quas cumque commodi. Nihil voluptatibus aperiam excepturi hic fuga quas. Nam aut rerum itaque porro natus. Aliquid nam aperiam deserunt quas qui quod magni fugiat. Voluptatum consequatur sint nam. Eos enim aspernatur iste quia. Quaerat corrupti necessitatibus qui ducimus blanditiis. Tenetur quos quod eos laudantium sapiente ut. Enim est qui eius id vero magnam. Omnis et fuga accusamus. Corporis modi iste id in repellat autem possimus et. Cum nostrum facere facilis voluptatum itaque. Sit non vel rerum autem ea. Et doloremque neque alias et aperiam. Soluta consectetur ut ut maxime veritatis alias magni nam. Occaecati sit qui consequuntur facere. Placeat eum sit accusantium est. Non quis et odit fuga consequatur nesciunt. Vel est hic voluptate autem et. Exercitationem ducimus sequi sit et.',1,NULL,1,NULL,'2019-03-28 03:45:34','2019-03-28 03:45:34'),(30,1,1,'Rem repellat et dolores magni quasi ab aut quia impedit ducimus non nesciunt quis.','rem-repellat-et-dolores-magni-quasi-ab-aut-quia-impedit-ducimus-non-nesciunt-quis',9,9,9,9,9,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','Tenetur tempora provident ea qui quas minima eligendi. Nobis quisquam architecto illo consequatur voluptas. Et et voluptatum perspiciatis esse vitae hic architecto. Nihil illum necessitatibus enim est rerum. Quis nam neque nostrum et. Aut odio sapiente vero. Vero qui consequatur omnis nulla enim laborum numquam. Illum est consequatur corporis laborum. Consequatur eum aspernatur eos voluptatum sed similique asperiores. Autem odio facilis voluptate quis architecto quia quibusdam. Consequuntur ad nihil similique vitae quibusdam sit. Amet nesciunt quo repudiandae eius. Voluptate velit nisi quidem ex quasi. Optio tempora reprehenderit assumenda occaecati. Eaque expedita praesentium ipsum voluptas et impedit. Aut et eveniet sint quia molestias aut. Odio architecto recusandae voluptatibus impedit. Voluptas qui sed a. Sit amet voluptatibus quo distinctio eos aliquid nostrum. Maiores quas saepe quo hic quo nisi ducimus.',1,NULL,1,'2019-03-28 00:02:04','2019-03-28 03:45:34','2019-03-28 03:45:34'),(32,1,1,'11asas','507189020_11asas',1212,1212,1,1,1,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','1111<!-- \r\n<div style=\"border:1px solid #990000;padding-left:20px;margin:0 0 10px 0;\">\r\n\r\n<h4>A PHP Error was encountered</h4>\r\n\r\n<p>Severity: Notice</p>\r\n<p>Message:  Undefined variable: isEdit</p>\r\n<p>Filename: back/productAdd.php</p>\r\n<p>Line Number: 110</p>\r\n\r\n\r\n	<p>Backtrace:</p>\r\n	\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\views\\site\\back\\productAdd.php<br />\r\n			Line: 110<br />\r\n			Function: _error_handler			</p>\r\n\r\n		\r\n	\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\libraries\\Template.php<br />\r\n			Line: 17<br />\r\n			Function: view			</p>\r\n\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\controllers\\admin\\Product.php<br />\r\n			Line: 77<br />\r\n			Function: back_views			</p>\r\n\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\index.php<br />\r\n			Line: 315<br />\r\n			Function: require_once			</p>\r\n\r\n		\r\n	\r\n\r\n</div> -->',1,NULL,1,NULL,'2019-04-06 07:59:36',NULL),(33,1,1,'121212','418726774_121212',1212,12,1,1,1,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','12<!-- \r\n<div style=\"border:1px solid #990000;padding-left:20px;margin:0 0 10px 0;\">\r\n\r\n<h4>A PHP Error was encountered</h4>\r\n\r\n<p>Severity: Notice</p>\r\n<p>Message:  Undefined variable: isEdit</p>\r\n<p>Filename: back/productAdd.php</p>\r\n<p>Line Number: 110</p>\r\n\r\n\r\n	<p>Backtrace:</p>\r\n	\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\views\\site\\back\\productAdd.php<br />\r\n			Line: 110<br />\r\n			Function: _error_handler			</p>\r\n\r\n		\r\n	\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\libraries\\Template.php<br />\r\n			Line: 17<br />\r\n			Function: view			</p>\r\n\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\controllers\\admin\\Product.php<br />\r\n			Line: 77<br />\r\n			Function: back_views			</p>\r\n\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\index.php<br />\r\n			Line: 315<br />\r\n			Function: require_once			</p>\r\n\r\n		\r\n	\r\n\r\n</div> -->\r\n									',1,NULL,1,'2019-04-06 08:06:41','2019-04-06 08:00:54',NULL),(34,1,1,'121212','418726774_121212',1212,12,1,1,1,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','12<!-- \r\n<div style=\"border:1px solid #990000;padding-left:20px;margin:0 0 10px 0;\">\r\n\r\n<h4>A PHP Error was encountered</h4>\r\n\r\n<p>Severity: Notice</p>\r\n<p>Message:  Undefined variable: isEdit</p>\r\n<p>Filename: back/productAdd.php</p>\r\n<p>Line Number: 110</p>\r\n\r\n\r\n	<p>Backtrace:</p>\r\n	\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\views\\site\\back\\productAdd.php<br />\r\n			Line: 110<br />\r\n			Function: _error_handler			</p>\r\n\r\n		\r\n	\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\libraries\\Template.php<br />\r\n			Line: 17<br />\r\n			Function: view			</p>\r\n\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\controllers\\admin\\Product.php<br />\r\n			Line: 77<br />\r\n			Function: back_views			</p>\r\n\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\index.php<br />\r\n			Line: 315<br />\r\n			Function: require_once			</p>\r\n\r\n		\r\n	\r\n\r\n</div> -->\r\n									',1,NULL,1,'2019-04-06 08:06:32','2019-04-06 08:05:47',NULL),(35,1,2,'product baru','2078676789_product-baru',11,0,111,11,11,'City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara City Juara ','asasasasas<!-- \r\n<div style=\"border:1px solid #990000;padding-left:20px;margin:0 0 10px 0;\">\r\n\r\n<h4>A PHP Error was encountered</h4>\r\n\r\n<p>Severity: Notice</p>\r\n<p>Message:  Undefined variable: isEdit</p>\r\n<p>Filename: back/productAdd.php</p>\r\n<p>Line Number: 110</p>\r\n\r\n\r\n	<p>Backtrace:</p>\r\n	\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\views\\site\\back\\productAdd.php<br />\r\n			Line: 110<br />\r\n			Function: _error_handler			</p>\r\n\r\n		\r\n	\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\libraries\\Template.php<br />\r\n			Line: 17<br />\r\n			Function: view			</p>\r\n\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\application\\controllers\\admin\\Product.php<br />\r\n			Line: 89<br />\r\n			Function: back_views			</p>\r\n\r\n		\r\n	\r\n		\r\n	\r\n		\r\n			<p style=\"margin-left:10px\">\r\n			File: D:\\mylab\\base_ci\\index.php<br />\r\n			Line: 315<br />\r\n			Function: require_once			</p>\r\n\r\n		\r\n	\r\n\r\n</div> -->',3,NULL,1,NULL,'2019-04-06 10:31:49',NULL);
/*!40000 ALTER TABLE `em_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_addresses`
--

DROP TABLE IF EXISTS `em_site_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_addresses` (
  `id` int(11) NOT NULL,
  `id_site` int(10) unsigned NOT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_province` int(11) NOT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_city` int(11) NOT NULL,
  `subdistrict` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_subdistrict` int(11) NOT NULL,
  `complete_address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_site` (`id_site`) USING BTREE,
  CONSTRAINT `id_site` FOREIGN KEY (`id_site`) REFERENCES `em_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_addresses`
--

LOCK TABLES `em_site_addresses` WRITE;
/*!40000 ALTER TABLE `em_site_addresses` DISABLE KEYS */;
INSERT INTO `em_site_addresses` VALUES (1,1,'Jawa Timur',2,'Kota Malang',1,'Lowokwaru',1,'Malang ','1212');
/*!40000 ALTER TABLE `em_site_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_banks`
--

DROP TABLE IF EXISTS `em_site_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_banks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_banks`
--

LOCK TABLES `em_site_banks` WRITE;
/*!40000 ALTER TABLE `em_site_banks` DISABLE KEYS */;
INSERT INTO `em_site_banks` VALUES (1,'Bank BCA',NULL,NULL,'BCA','12112121212',NULL,NULL,1,NULL,'2018-12-25 11:46:21','2019-01-09 23:14:21'),(2,'Bank ABC',NULL,NULL,'ABC','212',NULL,NULL,1,NULL,'2018-12-20 01:27:21','2018-12-29 11:39:21');
/*!40000 ALTER TABLE `em_site_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_confs`
--

DROP TABLE IF EXISTS `em_site_confs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_confs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conf_page_search` int(11) DEFAULT NULL,
  `conf_page_product` int(11) DEFAULT NULL,
  `conf_page_category` int(11) DEFAULT NULL,
  `conf_page_topsell` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_site` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `site` (`id_site`) USING BTREE,
  CONSTRAINT `site` FOREIGN KEY (`id_site`) REFERENCES `em_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_confs`
--

LOCK TABLES `em_site_confs` WRITE;
/*!40000 ALTER TABLE `em_site_confs` DISABLE KEYS */;
INSERT INTO `em_site_confs` VALUES (1,8,8,8,8,'2019-04-10 02:44:08','2019-04-10 02:44:11',1);
/*!40000 ALTER TABLE `em_site_confs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_img_defaults`
--

DROP TABLE IF EXISTS `em_site_img_defaults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_img_defaults` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_site` int(10) unsigned NOT NULL,
  `img_product` longtext,
  `img_category` longtext,
  `img_user` longtext,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ste` (`id_site`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_img_defaults`
--

LOCK TABLES `em_site_img_defaults` WRITE;
/*!40000 ALTER TABLE `em_site_img_defaults` DISABLE KEYS */;
INSERT INTO `em_site_img_defaults` VALUES (1,1,'product/product-detail.jpg','front/img/pagetitle.jpg','/user/user.svg');
/*!40000 ALTER TABLE `em_site_img_defaults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_notifications`
--

DROP TABLE IF EXISTS `em_site_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `desc` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0' COMMENT '0 = system, 1=user',
  `id_invoice` int(11) DEFAULT '0',
  `id_ticket` int(11) DEFAULT NULL,
  `id_comment` int(11) DEFAULT NULL,
  `id_review` int(11) DEFAULT '0',
  `read_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_user` (`id_user`) USING BTREE,
  CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `em_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_notifications`
--

LOCK TABLES `em_site_notifications` WRITE;
/*!40000 ALTER TABLE `em_site_notifications` DISABLE KEYS */;
INSERT INTO `em_site_notifications` VALUES (75,1,'Nomor Resi untuk invoice EM2323 telah tersedia.(123456543245667564)','2019-04-08 19:57:46','2019-04-09 14:57:46',0,1,NULL,NULL,0,NULL),(76,1,'Nomor Resi untuk invoice EM2323 telah tersedia.(23234343434)','2019-04-08 19:58:45','2019-04-09 14:58:45',0,1,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `em_site_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_pages`
--

DROP TABLE IF EXISTS `em_site_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_pages` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug_pages` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_pages_id_user_foreign` (`id_user`) USING BTREE,
  CONSTRAINT `em_pages_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `em_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_pages`
--

LOCK TABLES `em_site_pages` WRITE;
/*!40000 ALTER TABLE `em_site_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_site_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_payments`
--

DROP TABLE IF EXISTS `em_site_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_payment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `id_bank` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_payments`
--

LOCK TABLES `em_site_payments` WRITE;
/*!40000 ALTER TABLE `em_site_payments` DISABLE KEYS */;
INSERT INTO `em_site_payments` VALUES (1,'Transfer','Tranfer Bank BCA',0,1,'2019-04-09 03:38:25',NULL,NULL),(2,'Virtual Account','VA',1,1,'0000-00-00 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `em_site_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_rests`
--

DROP TABLE IF EXISTS `em_site_rests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_rests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_site` int(10) unsigned NOT NULL,
  `auth_key` longtext,
  `rest_token` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `s` (`id_site`) USING BTREE,
  CONSTRAINT `s` FOREIGN KEY (`id_site`) REFERENCES `em_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_rests`
--

LOCK TABLES `em_site_rests` WRITE;
/*!40000 ALTER TABLE `em_site_rests` DISABLE KEYS */;
INSERT INTO `em_site_rests` VALUES (1,1,'https://pro.rajaongkir.com/api/','b5ba0d8b6cb1f83d2119741402839753',NULL,NULL);
/*!40000 ALTER TABLE `em_site_rests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_sliders`
--

DROP TABLE IF EXISTS `em_site_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img_path` text COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_sliders_id_user_foreign` (`id_user`) USING BTREE,
  CONSTRAINT `em_sliders_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `em_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_sliders`
--

LOCK TABLES `em_site_sliders` WRITE;
/*!40000 ALTER TABLE `em_site_sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_site_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_ticket_details`
--

DROP TABLE IF EXISTS `em_site_ticket_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_ticket_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ticket` int(10) unsigned NOT NULL,
  `invoice_code` text,
  `id_payment` int(10) DEFAULT NULL,
  `bank_name` text,
  `no_bank` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_ticket_details`
--

LOCK TABLES `em_site_ticket_details` WRITE;
/*!40000 ALTER TABLE `em_site_ticket_details` DISABLE KEYS */;
INSERT INTO `em_site_ticket_details` VALUES (1,7,'EM2323',1,'1212','232','2019-04-23 03:58:33',NULL),(2,9,'EM2323',1,'','','2019-04-23 04:02:01',NULL),(3,10,'EM2323',0,'','','2019-04-23 04:13:55',NULL),(4,11,'EM2323',0,'','','2019-04-23 04:14:20',NULL);
/*!40000 ALTER TABLE `em_site_ticket_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_ticket_files`
--

DROP TABLE IF EXISTS `em_site_ticket_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_ticket_files` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_ticket` int(10) NOT NULL,
  `path_file` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_ticket_files`
--

LOCK TABLES `em_site_ticket_files` WRITE;
/*!40000 ALTER TABLE `em_site_ticket_files` DISABLE KEYS */;
INSERT INTO `em_site_ticket_files` VALUES (1,1,'asas',NULL),(2,1,'asa',NULL);
/*!40000 ALTER TABLE `em_site_ticket_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_ticket_replys`
--

DROP TABLE IF EXISTS `em_site_ticket_replys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_ticket_replys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ticket` int(10) unsigned DEFAULT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_admin` int(10) unsigned NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_ticket` (`id_ticket`) USING BTREE,
  CONSTRAINT `id_ticket` FOREIGN KEY (`id_ticket`) REFERENCES `em_site_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_ticket_replys`
--

LOCK TABLES `em_site_ticket_replys` WRITE;
/*!40000 ALTER TABLE `em_site_ticket_replys` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_site_ticket_replys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_ticket_types`
--

DROP TABLE IF EXISTS `em_site_ticket_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_ticket_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_ticket_types`
--

LOCK TABLES `em_site_ticket_types` WRITE;
/*!40000 ALTER TABLE `em_site_ticket_types` DISABLE KEYS */;
INSERT INTO `em_site_ticket_types` VALUES (1,'Order','2019-04-15 06:46:16','2019-04-15 06:46:19',NULL,1),(2,'Account','2019-04-15 06:47:04','2019-04-15 06:47:08',NULL,1),(3,'Complaint','2019-04-15 06:48:37','2019-04-15 06:48:40',NULL,1),(4,'Payment','2019-04-15 06:49:01','2019-04-15 06:49:04',NULL,1);
/*!40000 ALTER TABLE `em_site_ticket_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_tickets`
--

DROP TABLE IF EXISTS `em_site_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no_ticket` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `id_ticket_type` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `parent` int(10) DEFAULT '0',
  `info` int(1) DEFAULT NULL,
  `id_admin` int(10) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_tickets_id_user_foreign` (`id_user`) USING BTREE,
  KEY `em_tickets_id_ticket_types_foreign` (`id_ticket_type`) USING BTREE,
  CONSTRAINT `em_tickets_id_ticket_types_foreign` FOREIGN KEY (`id_ticket_type`) REFERENCES `em_site_ticket_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `em_tickets_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `em_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_tickets`
--

LOCK TABLES `em_site_tickets` WRITE;
/*!40000 ALTER TABLE `em_site_tickets` DISABLE KEYS */;
INSERT INTO `em_site_tickets` VALUES (1,'TX1',1,2,'TEst TIcket','Test 121212','2019-04-15 09:26:48','2019-04-15 09:26:51',NULL,0,NULL,0),(3,'TX3',1,1,'Tentang kami','asasasa',NULL,NULL,0,1,0,1),(4,'TX4',1,4,'Tentang kami','asasasa',NULL,NULL,0,1,1,1),(5,'TX5',1,4,'Tentang kami','asasa',NULL,NULL,0,1,0,1),(6,'TX6',1,4,'Tentang kami','asasa',NULL,NULL,0,1,1,1),(7,'TX7',1,4,'Tentang kami','asasas',NULL,NULL,0,0,0,0),(8,'TX8',1,2,'Hubungi kami','asasasas',NULL,NULL,0,0,NULL,0),(9,'TX9',1,3,'revisi','asasas',NULL,NULL,0,0,NULL,0),(10,'TX20',1,3,'tes no ticket','asas',NULL,NULL,0,0,NULL,0),(11,'TXT11',1,3,'Hubungi kami no ticket','asas',NULL,NULL,0,0,NULL,0);
/*!40000 ALTER TABLE `em_site_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_site_visitors`
--

DROP TABLE IF EXISTS `em_site_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_site_visitors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `browser` text COLLATE utf8_unicode_ci NOT NULL,
  `platform` text COLLATE utf8_unicode_ci NOT NULL,
  `ip` text COLLATE utf8_unicode_ci NOT NULL,
  `country` text COLLATE utf8_unicode_ci NOT NULL,
  `region` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_site_visitors`
--

LOCK TABLES `em_site_visitors` WRITE;
/*!40000 ALTER TABLE `em_site_visitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_site_visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_sites`
--

DROP TABLE IF EXISTS `em_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_site` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` longtext COLLATE utf8_unicode_ci,
  `meta` longtext COLLATE utf8_unicode_ci,
  `logo` text COLLATE utf8_unicode_ci,
  `favicon` text COLLATE utf8_unicode_ci,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_sites`
--

LOCK TABLES `em_sites` WRITE;
/*!40000 ALTER TABLE `em_sites` DISABLE KEYS */;
INSERT INTO `em_sites` VALUES (1,'Template PIS',NULL,NULL,NULL,NULL,'1212',NULL,NULL,NULL);
/*!40000 ALTER TABLE `em_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_transaction_addresses`
--

DROP TABLE IF EXISTS `em_transaction_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_transaction_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_transaction` int(10) unsigned NOT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_province` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_city` int(11) NOT NULL,
  `subdistrict` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_subdistrict` int(11) NOT NULL,
  `complete_address` text COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_transaction_addresses_id_transaction_foreign` (`id_transaction`) USING BTREE,
  CONSTRAINT `em_transaction_addresses_id_transaction_foreign` FOREIGN KEY (`id_transaction`) REFERENCES `em_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_transaction_addresses`
--

LOCK TABLES `em_transaction_addresses` WRITE;
/*!40000 ALTER TABLE `em_transaction_addresses` DISABLE KEYS */;
INSERT INTO `em_transaction_addresses` VALUES (1,1,'Jawa Timur',2,'Kota Malang',1,'Lowokwaru',1,'Malang ','1212');
/*!40000 ALTER TABLE `em_transaction_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_transaction_details`
--

DROP TABLE IF EXISTS `em_transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_transaction_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_transaction` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `id_variant` int(10) unsigned NOT NULL,
  `price` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_transaction_details_id_transaction_foreign` (`id_transaction`) USING BTREE,
  KEY `em_transaction_details_id_product_foreign` (`id_product`) USING BTREE,
  KEY `em_transaction_details_id_extra_foreign` (`id_variant`) USING BTREE,
  CONSTRAINT `em_transaction_details_id_extra_foreign` FOREIGN KEY (`id_variant`) REFERENCES `em_product_variations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `em_transaction_details_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `em_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `em_transaction_details_id_transaction_foreign` FOREIGN KEY (`id_transaction`) REFERENCES `em_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_transaction_details`
--

LOCK TABLES `em_transaction_details` WRITE;
/*!40000 ALTER TABLE `em_transaction_details` DISABLE KEYS */;
INSERT INTO `em_transaction_details` VALUES (1,1,1,12,1,100,108,'Coba Barang',0,'2019-04-09 03:41:16','2019-04-09 03:41:26'),(2,1,2,22,5,22,222,'Coba Barang',0,'2019-04-09 03:41:16','2019-04-09 03:41:26');
/*!40000 ALTER TABLE `em_transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_transaction_users`
--

DROP TABLE IF EXISTS `em_transaction_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_transaction_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_transaction` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_transaction_peoples_id_transaction_foreign` (`id_transaction`) USING BTREE,
  CONSTRAINT `em_transaction_peoples_id_transaction_foreign` FOREIGN KEY (`id_transaction`) REFERENCES `em_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_transaction_users`
--

LOCK TABLES `em_transaction_users` WRITE;
/*!40000 ALTER TABLE `em_transaction_users` DISABLE KEYS */;
INSERT INTO `em_transaction_users` VALUES (1,1,'Wildan Mukafi','085232323','2019-04-09 03:42:04',NULL);
/*!40000 ALTER TABLE `em_transaction_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_transactions`
--

DROP TABLE IF EXISTS `em_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_unique` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `id_payment` int(10) unsigned NOT NULL,
  `id_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `courier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_price` int(11) DEFAULT NULL,
  `receipt` longtext COLLATE utf8_unicode_ci,
  `delivery_fee` int(11) DEFAULT NULL,
  `courier_service` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expired_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expired_receipt` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_transactions_id_payment_foreign` (`id_payment`) USING BTREE,
  CONSTRAINT `em_transactions_id_payment_foreign` FOREIGN KEY (`id_payment`) REFERENCES `em_site_payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_transactions`
--

LOCK TABLES `em_transactions` WRITE;
/*!40000 ALTER TABLE `em_transactions` DISABLE KEYS */;
INSERT INTO `em_transactions` VALUES (1,'EM2323',123,240123,1,'1',3,'JNE',NULL,NULL,'23234343434',11111,NULL,'2019-04-10 03:39:19','2019-04-09 03:39:24',NULL,'2019-04-16 07:58:45',NULL);
/*!40000 ALTER TABLE `em_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_user_addresses`
--

DROP TABLE IF EXISTS `em_user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_user_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `title_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_province` int(11) NOT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_city` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_subdistrict` int(11) NOT NULL,
  `subdistrict` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `complete_address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `primary` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_user_addresses_id_user_foreign` (`id_user`) USING BTREE,
  CONSTRAINT `em_user_addresses_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `em_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_user_addresses`
--

LOCK TABLES `em_user_addresses` WRITE;
/*!40000 ALTER TABLE `em_user_addresses` DISABLE KEYS */;
INSERT INTO `em_user_addresses` VALUES (2,1,'085736816571','wildan mukafi','85736816571',4,'Bengkulu',65,'Kabupaten Bengkulu Utara ',874,'Napal Putih ','65146','jalan gunungagung\r\npisang candi',0,'2019-04-30 02:14:40',NULL),(3,1,'085736816571','wildan mukafi','85736816571',11,'Jawa Timur',74,'Kabupaten Blitar ',992,'Wates ','65146','jalan gunungagung\r\npisang candi',1,'2019-04-30 02:25:27',NULL);
/*!40000 ALTER TABLE `em_user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_user_dateofbirths`
--

DROP TABLE IF EXISTS `em_user_dateofbirths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_user_dateofbirths` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `day` int(11) NOT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_user_dateofbirths_id_user_foreign` (`id_user`) USING BTREE,
  CONSTRAINT `em_user_dateofbirths_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `em_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_user_dateofbirths`
--

LOCK TABLES `em_user_dateofbirths` WRITE;
/*!40000 ALTER TABLE `em_user_dateofbirths` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_user_dateofbirths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_user_details`
--

DROP TABLE IF EXISTS `em_user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_user_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `img_path` longtext COLLATE utf8_unicode_ci,
  `phone` text COLLATE utf8_unicode_ci,
  `gender` int(11) NOT NULL,
  `line` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telegram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_user_details_id_user_foreign` (`id_user`) USING BTREE,
  CONSTRAINT `em_user_details_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `em_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_user_details`
--

LOCK TABLES `em_user_details` WRITE;
/*!40000 ALTER TABLE `em_user_details` DISABLE KEYS */;
INSERT INTO `em_user_details` VALUES (2,'wildanmfk',1,'/user/list_pengajuan_toko.png','085736816571aa',0,'085736816571ln','85736816571wa','tele',NULL,'2019-05-03 03:01:19'),(3,NULL,2,NULL,'085736816571',0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `em_user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_user_resets`
--

DROP TABLE IF EXISTS `em_user_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_user_resets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `token_reset` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `em_user_resets_email_unique` (`email`) USING BTREE,
  KEY `em_user_resets_id_user_foreign` (`id_user`) USING BTREE,
  CONSTRAINT `em_user_resets_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `em_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_user_resets`
--

LOCK TABLES `em_user_resets` WRITE;
/*!40000 ALTER TABLE `em_user_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_user_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_user_roles`
--

DROP TABLE IF EXISTS `em_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_user_roles`
--

LOCK TABLES `em_user_roles` WRITE;
/*!40000 ALTER TABLE `em_user_roles` DISABLE KEYS */;
INSERT INTO `em_user_roles` VALUES (1,'Superadmin','2019-02-17 23:29:13','2019-02-24 12:23:13'),(2,'Admin','2019-02-21 18:28:13','2018-12-06 19:45:13'),(3,'Karyawan','2018-12-15 10:43:13','2018-12-04 13:40:13'),(4,'Pemilik Toko','2018-12-30 20:34:13','2019-02-28 08:25:13'),(5,'Reseller','2018-12-26 01:15:13','2018-12-08 10:34:13'),(6,'member','2019-01-24 00:55:13','2018-12-14 04:13:13');
/*!40000 ALTER TABLE `em_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_useradmin_addresses`
--

DROP TABLE IF EXISTS `em_useradmin_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_useradmin_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_useradmin` int(10) unsigned NOT NULL,
  `title_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_province` int(11) NOT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_city` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_subdistrict` int(11) NOT NULL,
  `subdistrict` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `complete_address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `primary` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_user_addresses_id_user_foreign` (`id_useradmin`) USING BTREE,
  CONSTRAINT `em_useradmin_addresses_ibfk_1` FOREIGN KEY (`id_useradmin`) REFERENCES `em_useradmins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_useradmin_addresses`
--

LOCK TABLES `em_useradmin_addresses` WRITE;
/*!40000 ALTER TABLE `em_useradmin_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_useradmin_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_useradmin_dateofbirths`
--

DROP TABLE IF EXISTS `em_useradmin_dateofbirths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_useradmin_dateofbirths` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_useradmin` int(10) unsigned NOT NULL,
  `day` int(11) NOT NULL,
  `month` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_user_dateofbirths_id_user_foreign` (`id_useradmin`) USING BTREE,
  CONSTRAINT `em_useradmin_dateofbirths_ibfk_1` FOREIGN KEY (`id_useradmin`) REFERENCES `em_useradmins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_useradmin_dateofbirths`
--

LOCK TABLES `em_useradmin_dateofbirths` WRITE;
/*!40000 ALTER TABLE `em_useradmin_dateofbirths` DISABLE KEYS */;
/*!40000 ALTER TABLE `em_useradmin_dateofbirths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_useradmin_details`
--

DROP TABLE IF EXISTS `em_useradmin_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_useradmin_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_useradmin` int(10) unsigned NOT NULL,
  `fullname` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8_unicode_ci,
  `gender` int(11) NOT NULL,
  `line` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `whastapp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telegram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `em_user_details_id_user_foreign` (`id_useradmin`) USING BTREE,
  CONSTRAINT `em_useradmin_details_ibfk_1` FOREIGN KEY (`id_useradmin`) REFERENCES `em_useradmins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_useradmin_details`
--

LOCK TABLES `em_useradmin_details` WRITE;
/*!40000 ALTER TABLE `em_useradmin_details` DISABLE KEYS */;
INSERT INTO `em_useradmin_details` VALUES (1,1,'Wildan Mukafi','',0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `em_useradmin_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_useradmin_roles`
--

DROP TABLE IF EXISTS `em_useradmin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_useradmin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_useradmin_roles`
--

LOCK TABLES `em_useradmin_roles` WRITE;
/*!40000 ALTER TABLE `em_useradmin_roles` DISABLE KEYS */;
INSERT INTO `em_useradmin_roles` VALUES (1,'Superadmin','2019-02-17 23:29:13','2019-02-24 12:23:13'),(2,'Admin','2019-02-21 18:28:13','2018-12-06 19:45:13'),(3,'Karyawan','2018-12-15 10:43:13','2018-12-04 13:40:13'),(4,'Pemilik Toko','2018-12-30 20:34:13','2019-02-28 08:25:13'),(5,'Reseller','2018-12-26 01:15:13','2018-12-08 10:34:13'),(6,'member','2019-01-24 00:55:13','2018-12-14 04:13:13');
/*!40000 ALTER TABLE `em_useradmin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_useradmins`
--

DROP TABLE IF EXISTS `em_useradmins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_useradmins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img_path` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_ban` int(11) NOT NULL DEFAULT '0',
  `id_role` int(10) unsigned NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `em_users_email_unique` (`email`) USING BTREE,
  KEY `em_users_id_role_foreign` (`id_role`) USING BTREE,
  CONSTRAINT `em_useradmins_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `em_useradmin_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_useradmins`
--

LOCK TABLES `em_useradmins` WRITE;
/*!40000 ALTER TABLE `em_useradmins` DISABLE KEYS */;
INSERT INTO `em_useradmins` VALUES (1,'wildanmkf','wildan mukafi','wildankafie@yahoo.co.id','$2y$10$8or8jmv29.G1J.yj6AdHhuAJ0v3rRN0xdL7KBimYHqUOJBFoC9p5i','',0,1,0,'2019-03-27 20:33:48',NULL);
/*!40000 ALTER TABLE `em_useradmins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `em_users`
--

DROP TABLE IF EXISTS `em_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `em_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_ban` timestamp(1) NULL DEFAULT NULL,
  `id_role` int(10) unsigned NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `em_users_email_unique` (`email`) USING BTREE,
  KEY `em_users_id_role_foreign` (`id_role`) USING BTREE,
  CONSTRAINT `em_users_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `em_user_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `em_users`
--

LOCK TABLES `em_users` WRITE;
/*!40000 ALTER TABLE `em_users` DISABLE KEYS */;
INSERT INTO `em_users` VALUES (1,'wildanmkf','wildan mukafi','wildankafie@yahoo.co.id','$2y$10$8or8jmv29.G1J.yj6AdHhuAJ0v3rRN0xdL7KBimYHqUOJBFoC9p5i',NULL,1,0,'2019-03-27 20:33:48',NULL),(2,'www','Abimanyu Stone','abimanyustone9@gmail.com','$2y$10$rxh7Qs9wIlXuYik6gDEJ.OePshQtXq4bJw.LrQgKc9CyGAHfgZ//e',NULL,1,0,'2019-04-19 04:00:16',NULL);
/*!40000 ALTER TABLE `em_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-03 14:08:47
