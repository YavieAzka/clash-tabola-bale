-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: tubes_basdat
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `akun`
--

DROP TABLE IF EXISTS `akun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `akun` (
  `akun_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jumlah_emas` int(11) NOT NULL DEFAULT 0 CHECK (`jumlah_emas` >= 0),
  `jumlah_piala` int(11) NOT NULL DEFAULT 0 CHECK (`jumlah_piala` >= 0),
  `klan_id` int(11) DEFAULT NULL,
  `role` enum('member','elder','co-leader','leader') DEFAULT NULL,
  `waktu_bergabung` datetime DEFAULT NULL,
  PRIMARY KEY (`akun_id`),
  UNIQUE KEY `username` (`username`),
  KEY `klan_id` (`klan_id`),
  CONSTRAINT `akun_ibfk_1` FOREIGN KEY (`klan_id`) REFERENCES `klan` (`klan_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akun`
--

LOCK TABLES `akun` WRITE;
/*!40000 ALTER TABLE `akun` DISABLE KEYS */;
INSERT INTO `akun` VALUES (1,'ThunderFalcon294','hashed_pw_0001',340723,11004,17,'leader','2024-12-02 08:37:24'),(2,'StormBear990','hashed_pw_0002',129973,1982,11,'leader','2023-02-02 16:12:50'),(3,'NeonTiger104','hashed_pw_0003',290414,9638,8,'leader','2023-01-12 04:05:38'),(4,'CrystalTiger377','hashed_pw_0004',371112,1163,8,'member','2023-02-18 19:09:35'),(5,'VoidGhost280','hashed_pw_0005',37149,5413,9,'leader','2025-11-05 05:17:57'),(6,'BravePhoenix559','hashed_pw_0006',112321,7953,19,'leader','2025-06-14 02:43:38'),(7,'IronCobra90','hashed_pw_0007',127400,7744,14,'leader','2023-10-23 18:59:46'),(8,'CosmicViper859','hashed_pw_0008',50819,1545,12,'leader','2024-10-20 00:09:20'),(9,'MightyRaven601','hashed_pw_0009',244855,6735,NULL,NULL,NULL),(10,'BlazeWolf56','hashed_pw_0010',353036,887,21,'leader','2023-06-02 21:17:03'),(11,'ShadowViper91','hashed_pw_0011',211089,993,4,'leader','2024-01-22 06:34:48'),(12,'ShadowTiger399','hashed_pw_0012',99724,3139,5,'leader','2024-10-17 08:53:15'),(13,'GoldPhoenix660','hashed_pw_0013',146037,3006,3,'leader','2024-11-19 09:06:41'),(14,'VoidFox389','hashed_pw_0014',51332,9016,18,'leader','2023-01-23 22:12:45'),(15,'VoidBear696','hashed_pw_0015',485683,1528,8,'member','2024-09-23 08:12:51'),(16,'GoldWolf633','hashed_pw_0016',252370,7956,13,'leader','2023-04-02 02:05:10'),(17,'FrostDemon756','hashed_pw_0017',198691,2697,13,'member','2024-12-07 19:56:29'),(18,'ShadowFox483','hashed_pw_0018',221777,4673,18,'elder','2023-08-29 11:14:38'),(19,'CrystalLion957','hashed_pw_0019',155560,3111,2,'leader','2025-06-18 17:24:22'),(20,'CosmicHawk711','hashed_pw_0020',31959,8883,2,'member','2025-06-26 11:43:09'),(21,'NeonDragon244','hashed_pw_0021',263638,7811,NULL,NULL,NULL),(22,'BraveFalcon420','hashed_pw_0022',82540,8701,17,'member','2023-10-16 16:03:24'),(23,'GoldWolf226','hashed_pw_0023',311969,1122,8,'elder','2023-07-06 05:41:48'),(24,'InfernalFalcon227','hashed_pw_0024',129087,9333,2,'co-leader','2023-05-08 08:33:46'),(25,'PhantomCobra915','hashed_pw_0025',344652,6868,17,'member','2024-02-10 02:02:59'),(26,'AncientEagle281','hashed_pw_0026',351129,3346,8,'member','2024-09-06 19:57:57'),(27,'StormHawk772','hashed_pw_0027',352159,2144,15,'leader','2024-05-06 03:56:24'),(28,'CosmicDemon279','hashed_pw_0028',4883,1188,19,'member','2023-04-24 19:21:27'),(29,'InfernalPanda929','hashed_pw_0029',111754,8808,5,'member','2023-04-17 20:43:33'),(30,'InfernalCobra380','hashed_pw_0030',193738,4002,15,'co-leader','2025-12-28 21:52:10'),(31,'ShadowEagle531','hashed_pw_0031',320695,4956,NULL,NULL,NULL),(32,'PhantomWolf783','hashed_pw_0032',277317,10714,18,'member','2025-10-27 12:55:26'),(33,'BraveTiger166','hashed_pw_0033',492269,1697,NULL,NULL,NULL),(34,'FrostPanda620','hashed_pw_0034',60517,4333,NULL,NULL,NULL),(35,'DarkCobra400','hashed_pw_0035',81499,9064,20,'leader','2023-11-24 04:50:33'),(36,'MightyPhoenix551','hashed_pw_0036',179768,11757,21,'member','2025-02-24 03:00:55'),(37,'GoldDemon891','hashed_pw_0037',131659,8004,NULL,NULL,NULL),(38,'SwiftTiger708','hashed_pw_0038',48390,832,9,'member','2023-01-06 12:11:34'),(39,'CosmicLion797','hashed_pw_0039',404288,5464,9,'member','2024-11-17 08:49:18'),(40,'NeonTiger310','hashed_pw_0040',369972,9038,1,'leader','2023-06-23 18:57:38'),(41,'ThunderFox474','hashed_pw_0041',495478,1232,NULL,NULL,NULL),(42,'SwiftLion522','hashed_pw_0042',286046,2442,12,'co-leader','2025-05-08 07:37:43'),(43,'FrostGiant944','hashed_pw_0043',225332,2426,10,'leader','2024-07-20 11:11:37'),(44,'IronViper871','hashed_pw_0044',471295,653,22,'leader','2024-01-23 15:08:34'),(45,'StellarGhost213','hashed_pw_0045',53893,10927,18,'elder','2025-08-22 03:56:17'),(46,'StormRaven790','hashed_pw_0046',485366,2532,NULL,NULL,NULL),(47,'FrostDemon986','hashed_pw_0047',419371,2662,NULL,NULL,NULL),(48,'StellarKnight623','hashed_pw_0048',12995,6755,11,'elder','2025-11-06 15:56:52'),(49,'NeonTitan29','hashed_pw_0049',139883,4065,4,'elder','2023-03-02 03:45:28'),(50,'IronRaven909','hashed_pw_0050',116619,7711,15,'member','2024-04-19 02:20:24'),(51,'SilverHawk69','hashed_pw_0051',116876,3728,7,'leader','2024-09-10 23:53:18'),(52,'ShadowAngel979','hashed_pw_0052',146068,5378,NULL,NULL,NULL),(53,'DarkWolf759','hashed_pw_0053',184101,4573,13,'co-leader','2024-05-29 10:09:42'),(54,'PhantomWolf788','hashed_pw_0054',60472,452,NULL,NULL,NULL),(55,'CosmicEagle141','hashed_pw_0055',93620,4279,9,'member','2023-06-18 09:32:23'),(56,'PhantomDemon179','hashed_pw_0056',227836,9774,11,'elder','2025-07-30 17:06:14'),(57,'GoldGiant903','hashed_pw_0057',60631,8379,19,'member','2024-01-31 16:44:36'),(58,'MightyPanda997','hashed_pw_0058',371607,727,17,'co-leader','2025-12-02 23:53:25'),(59,'BlazeDemon783','hashed_pw_0059',492968,11787,22,'member','2024-07-19 19:09:38'),(60,'BlazeViper418','hashed_pw_0060',36686,7066,NULL,NULL,NULL);
/*!40000 ALTER TABLE `akun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `akunarena`
--

DROP TABLE IF EXISTS `akunarena`;
/*!50001 DROP VIEW IF EXISTS `akunarena`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `akunarena` AS SELECT 
 1 AS `akun_id`,
 1 AS `username`,
 1 AS `jumlah_piala`,
 1 AS `current_arena_id`,
 1 AS `current_arena_nama`,
 1 AS `current_arena_piala_min`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `arena`
--

DROP TABLE IF EXISTS `arena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arena` (
  `arena_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_arena` varchar(100) NOT NULL,
  `piala_dibutuhkan` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`arena_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arena`
--

LOCK TABLES `arena` WRITE;
/*!40000 ALTER TABLE `arena` DISABLE KEYS */;
INSERT INTO `arena` VALUES (1,'Goblin Stadium',0),(2,'Bone Pit',400),(3,'Barbarian Bowl',800),(4,'P.E.K.K.A\'s Playhouse',1100),(5,'Spell Valley',1400),(6,'Builder\'s Workshop',1700),(7,'Royal Arena',2000),(8,'Frozen Peak',2300),(9,'Jungle Arena',2600),(10,'Hog Mountain',3000),(11,'Electro Valley',3400),(12,'Master I',4000),(13,'Master II',4300),(14,'Master III',4600),(15,'Champion',5000),(16,'Grand Champion',6000),(17,'Royal Champion',7000),(18,'Ultimate Champion',8000),(19,'Titan League',9000),(20,'Legend League',10000),(21,'Legendary Arena',12000);
/*!40000 ALTER TABLE `arena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bangunan`
--

DROP TABLE IF EXISTS `bangunan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bangunan` (
  `kartu_id` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `target_serangan` enum('darat','udara','keduanya') NOT NULL,
  `lifetime` varchar(50) DEFAULT NULL,
  `jarak_serangan` int(11) DEFAULT NULL,
  `kecepatan_menyerang` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`kartu_id`),
  CONSTRAINT `bangunan_ibfk_1` FOREIGN KEY (`kartu_id`) REFERENCES `kartu` (`kartu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangunan`
--

LOCK TABLES `bangunan` WRITE;
/*!40000 ALTER TABLE `bangunan` DISABLE KEYS */;
INSERT INTO `bangunan` VALUES (1,1167,'keduanya','3 menit',3,2.79),(2,3041,'keduanya','3 menit',7,1.48),(3,1194,'udara','2 menit',5,2.11),(4,3190,'darat','3 menit',7,2.57),(5,4812,'darat','3 menit',7,1.56),(8,3464,'darat','90 detik',4,0.95),(9,2254,'udara','permanent',5,0.98),(10,1626,'darat','30 detik',4,2.61),(13,1328,'keduanya','permanent',6,2.59),(14,4813,'darat','3 menit',4,2.69),(15,1573,'keduanya','120 detik',3,0.91),(20,1856,'keduanya','120 detik',2,1.53),(24,2445,'udara','2 menit',4,2.38),(29,4177,'darat','2 menit',3,1.27),(30,4342,'darat','90 detik',7,2.87),(31,4109,'udara','permanent',4,2.45),(32,4619,'keduanya','120 detik',3,2.54),(33,1633,'udara','30 detik',7,1.70),(34,3540,'keduanya','30 detik',7,2.61),(35,1521,'udara','30 detik',8,0.90),(38,4180,'keduanya','60 detik',8,1.59),(39,2318,'udara','90 detik',2,1.54),(45,3747,'keduanya','90 detik',3,1.47),(50,1168,'udara','60 detik',2,1.30),(52,1311,'keduanya','3 menit',4,2.48),(55,1627,'darat','90 detik',8,1.68),(61,1636,'keduanya','120 detik',5,2.04),(64,1149,'darat','90 detik',3,2.59),(67,4995,'keduanya','2 menit',6,1.56),(68,2860,'darat','90 detik',2,0.62),(70,3939,'keduanya','permanent',6,1.64),(73,1408,'udara','2 menit',6,0.54),(75,4721,'keduanya','60 detik',7,0.86),(79,4016,'darat','2 menit',4,1.10),(80,3912,'darat','3 menit',7,0.71),(81,3454,'darat','2 menit',6,1.77),(84,4658,'keduanya','30 detik',5,2.68),(87,856,'keduanya','120 detik',4,1.13),(89,633,'udara','permanent',2,1.36),(90,1349,'keduanya','3 menit',8,1.33),(94,863,'udara','2 menit',4,2.53),(99,1934,'keduanya','120 detik',7,1.70),(104,1993,'darat','30 detik',7,2.44),(109,4249,'darat','90 detik',3,0.61),(111,2134,'darat','90 detik',4,1.79),(113,4948,'udara','90 detik',2,2.38),(116,2065,'udara','90 detik',8,2.45),(117,3219,'udara','30 detik',8,1.42),(120,3776,'keduanya','120 detik',5,1.35),(121,2030,'udara','3 menit',5,1.42),(128,4753,'udara','permanent',2,2.32),(131,1146,'udara','2 menit',8,0.95),(133,2906,'udara','30 detik',2,1.32),(136,2921,'udara','120 detik',6,2.29),(140,1865,'keduanya','120 detik',4,1.62),(142,3388,'keduanya','120 detik',4,2.10),(143,969,'darat','3 menit',7,1.52),(144,4703,'keduanya','3 menit',3,2.88),(147,1669,'keduanya','3 menit',8,1.60),(148,1534,'darat','60 detik',8,2.11);
/*!40000 ALTER TABLE `bangunan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `berbagireplay`
--

DROP TABLE IF EXISTS `berbagireplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `berbagireplay` (
  `klan_id` int(11) NOT NULL,
  `urutan` int(11) NOT NULL,
  `deskripsi_tambahan` text DEFAULT NULL,
  `pertarungan_id` int(11) NOT NULL,
  PRIMARY KEY (`klan_id`,`urutan`),
  KEY `pertarungan_id` (`pertarungan_id`),
  CONSTRAINT `berbagireplay_ibfk_1` FOREIGN KEY (`klan_id`, `urutan`) REFERENCES `chat` (`klan_id`, `urutan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `berbagireplay_ibfk_2` FOREIGN KEY (`pertarungan_id`) REFERENCES `pertarungan` (`pertarungan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berbagireplay`
--

LOCK TABLES `berbagireplay` WRITE;
/*!40000 ALTER TABLE `berbagireplay` DISABLE KEYS */;
INSERT INTO `berbagireplay` VALUES (1,6,'Bisa belajar dari replay ini.',34),(2,3,'Timing elixir terbaik yang pernah ada.',7),(2,6,'Lihat combo aku yang gila ini.',13),(2,16,'Lihat combo aku yang gila ini.',37),(2,17,'Taktik jitu menang dengan 3 crown.',68),(2,18,'Bisa belajar dari replay ini.',86),(3,2,'Taktik jitu menang dengan 3 crown.',2),(3,4,'Taktik jitu menang dengan 3 crown.',28),(4,1,'GG buat lawannya.',6),(4,2,'Strategi defensif sempurna.',14),(4,7,'Strategi defensif sempurna.',32),(4,8,'Strategi defensif sempurna.',66),(5,7,'Timing elixir terbaik yang pernah ada.',62),(5,8,'Deck aku OP banget di match ini.',92),(7,4,'GG buat lawannya.',82),(8,11,'Hampir kalah tapi comeback!',8),(8,12,'Timing elixir terbaik yang pernah ada.',20),(8,13,'Taktik jitu menang dengan 3 crown.',9),(8,18,'Lihat combo aku yang gila ini.',30),(8,19,'Taktik jitu menang dengan 3 crown.',43),(8,20,'Timing elixir terbaik yang pernah ada.',48),(8,21,'Bisa belajar dari replay ini.',63),(8,22,'Counter deck meta pakai ini.',69),(8,23,'GG buat lawannya.',72),(8,24,'Lihat combo aku yang gila ini.',88),(9,5,'Counter deck meta pakai ini.',12),(9,7,'Deck aku OP banget di match ini.',11),(9,22,'Deck aku OP banget di match ini.',22),(9,23,'Lihat combo aku yang gila ini.',26),(9,24,'Timing elixir terbaik yang pernah ada.',27),(9,25,'Counter deck meta pakai ini.',33),(9,26,'Deck aku OP banget di match ini.',35),(9,27,'Hampir kalah tapi comeback!',38),(9,28,'Strategi defensif sempurna.',39),(9,29,'GG buat lawannya.',52),(9,30,'GG buat lawannya.',55),(9,31,'Counter deck meta pakai ini.',57),(9,32,'Counter deck meta pakai ini.',59),(9,33,'Pertarungan seru banget!',91),(9,34,'Pertarungan seru banget!',99),(10,3,'Strategi defensif sempurna.',49),(11,8,'Lihat combo aku yang gila ini.',24),(11,9,'Hampir kalah tapi comeback!',29),(11,10,'Strategi defensif sempurna.',42),(11,11,'Bisa belajar dari replay ini.',74),(11,12,'Timing elixir terbaik yang pernah ada.',84),(11,13,'Deck aku OP banget di match ini.',87),(11,14,'Hampir kalah tapi comeback!',93),(11,15,'Counter deck meta pakai ini.',95),(11,16,'Deck aku OP banget di match ini.',100),(12,8,'Hampir kalah tapi comeback!',40),(12,9,'Bisa belajar dari replay ini.',41),(12,10,'Deck aku OP banget di match ini.',44),(12,11,'Timing elixir terbaik yang pernah ada.',56),(13,3,'Taktik jitu menang dengan 3 crown.',5),(13,4,'Hampir kalah tapi comeback!',17),(13,9,'Deck aku OP banget di match ini.',58),(13,10,'Hampir kalah tapi comeback!',80),(13,11,'Hampir kalah tapi comeback!',81),(15,7,'Bisa belajar dari replay ini.',10),(15,13,'Timing elixir terbaik yang pernah ada.',23),(15,14,'Bisa belajar dari replay ini.',46),(15,15,'Bisa belajar dari replay ini.',75),(15,16,'Taktik jitu menang dengan 3 crown.',76),(15,17,'Lihat combo aku yang gila ini.',77),(15,18,'Deck aku OP banget di match ini.',90),(15,19,'Strategi defensif sempurna.',96),(15,20,'Bisa belajar dari replay ini.',97),(17,6,'Deck aku OP banget di match ini.',15),(17,7,'Pertarungan seru banget!',18),(17,15,'Timing elixir terbaik yang pernah ada.',31),(17,16,'Counter deck meta pakai ini.',50),(17,17,'Deck aku OP banget di match ini.',67),(17,18,'Deck aku OP banget di match ini.',78),(17,19,'Bisa belajar dari replay ini.',79),(17,20,'Deck aku OP banget di match ini.',85),(18,13,'Bisa belajar dari replay ini.',21),(18,14,'Bisa belajar dari replay ini.',45),(18,15,'Timing elixir terbaik yang pernah ada.',64),(18,16,'Pertarungan seru banget!',65),(18,17,'GG buat lawannya.',70),(18,18,'Hampir kalah tapi comeback!',83),(19,3,'Deck aku OP banget di match ini.',1),(19,6,'Strategi defensif sempurna.',4),(19,8,'Hampir kalah tapi comeback!',16),(19,9,'Strategi defensif sempurna.',51),(19,10,'Strategi defensif sempurna.',54),(20,2,'Counter deck meta pakai ini.',3),(20,8,'Taktik jitu menang dengan 3 crown.',36),(20,9,'Hampir kalah tapi comeback!',47),(20,10,'GG buat lawannya.',89),(21,7,'Pertarungan seru banget!',53),(21,8,'Strategi defensif sempurna.',61),(21,9,'Deck aku OP banget di match ini.',71),(21,10,'Counter deck meta pakai ini.',94),(22,2,'Hampir kalah tapi comeback!',19),(22,10,'Timing elixir terbaik yang pernah ada.',25),(22,11,'Hampir kalah tapi comeback!',60),(22,12,'Hampir kalah tapi comeback!',73),(22,13,'Bisa belajar dari replay ini.',98);
/*!40000 ALTER TABLE `berbagireplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `klan_id` int(11) NOT NULL,
  `urutan` int(11) NOT NULL,
  `waktu_kirim` datetime NOT NULL DEFAULT current_timestamp(),
  `akun_id_pengirim` int(11) NOT NULL,
  PRIMARY KEY (`klan_id`,`urutan`),
  KEY `akun_id_pengirim` (`akun_id_pengirim`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`klan_id`) REFERENCES `klan` (`klan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`akun_id_pengirim`) REFERENCES `akun` (`akun_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,1,'2025-01-14 23:35:55',40),(1,2,'2024-01-26 09:50:11',40),(1,3,'2025-10-06 08:06:57',40),(1,4,'2025-05-15 17:33:27',40),(1,5,'2025-05-11 06:49:35',40),(1,6,'2025-08-19 04:34:52',40),(2,1,'2024-06-19 18:22:02',24),(2,2,'2025-04-13 20:35:25',20),(2,3,'2024-11-26 19:23:36',20),(2,4,'2025-06-26 04:41:16',19),(2,5,'2025-07-25 11:34:30',24),(2,6,'2024-07-04 08:26:09',24),(2,7,'2025-01-26 03:09:00',19),(2,8,'2024-02-12 07:12:28',19),(2,9,'2024-12-17 01:29:15',20),(2,10,'2024-11-19 12:48:21',20),(2,11,'2024-05-26 20:20:46',20),(2,12,'2024-11-15 18:29:24',24),(2,13,'2024-11-20 00:21:57',20),(2,14,'2025-01-17 23:07:20',19),(2,15,'2024-08-14 13:00:46',20),(2,16,'2025-05-29 06:18:44',20),(2,17,'2024-09-05 22:13:55',20),(2,18,'2024-05-11 20:54:52',24),(3,1,'2025-09-05 12:02:00',13),(3,2,'2024-08-11 23:39:23',13),(3,3,'2025-01-17 01:25:44',13),(3,4,'2024-10-24 04:47:44',13),(4,1,'2025-02-25 07:43:23',49),(4,2,'2025-11-15 04:10:58',49),(4,3,'2024-10-12 22:44:09',49),(4,4,'2025-01-20 12:14:17',11),(4,5,'2025-11-10 15:03:15',11),(4,6,'2024-09-05 07:17:16',11),(4,7,'2024-03-15 19:47:20',49),(4,8,'2025-06-09 10:38:46',49),(5,1,'2024-05-12 23:25:25',29),(5,2,'2025-09-05 06:13:19',12),(5,3,'2025-03-25 00:57:53',12),(5,4,'2025-10-27 15:08:55',29),(5,5,'2024-08-02 07:56:43',12),(5,6,'2025-02-26 07:31:57',12),(5,7,'2025-01-28 13:17:38',12),(5,8,'2024-07-26 02:08:10',29),(7,1,'2025-03-10 00:36:32',51),(7,2,'2025-01-06 15:45:52',51),(7,3,'2024-01-17 16:27:32',51),(7,4,'2024-08-30 09:57:24',51),(8,1,'2024-08-05 22:50:26',4),(8,2,'2025-04-04 11:52:00',15),(8,3,'2024-12-03 06:58:58',23),(8,4,'2024-02-01 02:44:52',3),(8,5,'2024-04-13 01:55:51',15),(8,6,'2025-05-01 20:36:11',26),(8,7,'2025-09-03 19:38:24',15),(8,8,'2025-02-03 19:23:00',4),(8,9,'2024-03-27 04:33:58',4),(8,10,'2024-10-10 22:44:24',3),(8,11,'2024-05-16 03:13:16',26),(8,12,'2024-04-17 12:04:16',15),(8,13,'2025-02-08 10:19:15',15),(8,14,'2024-07-30 18:56:37',4),(8,15,'2024-11-21 20:18:28',26),(8,16,'2025-11-08 15:31:07',23),(8,17,'2025-10-04 05:04:44',23),(8,18,'2024-04-28 15:13:03',23),(8,19,'2024-11-30 07:21:24',3),(8,20,'2024-05-17 09:04:49',3),(8,21,'2024-10-30 23:56:30',4),(8,22,'2024-01-22 20:41:52',4),(8,23,'2024-09-27 23:32:04',26),(8,24,'2024-01-30 00:46:09',23),(9,1,'2024-01-27 02:43:57',39),(9,2,'2024-07-05 19:27:33',38),(9,3,'2024-03-03 21:11:09',55),(9,4,'2024-10-09 17:16:30',55),(9,5,'2024-11-24 11:58:13',55),(9,6,'2024-10-16 13:45:09',5),(9,7,'2025-01-24 11:42:26',38),(9,8,'2025-10-03 02:10:48',55),(9,9,'2025-06-22 10:36:53',55),(9,10,'2024-05-26 07:09:54',5),(9,11,'2024-03-25 22:42:35',5),(9,12,'2025-02-24 13:04:44',55),(9,13,'2024-01-18 02:47:32',5),(9,14,'2024-02-02 19:16:42',38),(9,15,'2025-03-10 09:45:16',38),(9,16,'2025-04-10 04:08:36',5),(9,17,'2025-01-04 18:02:31',55),(9,18,'2025-07-23 07:18:49',39),(9,19,'2025-02-03 03:09:56',5),(9,20,'2025-09-13 06:47:30',55),(9,21,'2025-06-26 03:03:26',55),(9,22,'2024-06-28 06:49:48',38),(9,23,'2025-01-21 21:54:27',5),(9,24,'2024-01-21 18:38:07',55),(9,25,'2025-05-28 11:26:08',5),(9,26,'2025-09-07 17:35:04',38),(9,27,'2025-01-15 18:55:44',38),(9,28,'2024-07-22 05:47:39',39),(9,29,'2024-11-30 12:28:40',38),(9,30,'2025-08-16 10:11:59',38),(9,31,'2025-01-16 00:35:02',55),(9,32,'2025-02-22 23:00:10',55),(9,33,'2025-12-01 03:29:50',39),(9,34,'2024-03-18 17:11:30',38),(10,1,'2025-10-26 02:25:48',43),(10,2,'2025-07-04 23:00:09',43),(10,3,'2025-05-27 04:18:44',43),(11,1,'2025-03-17 16:41:58',56),(11,2,'2025-09-29 21:58:47',56),(11,3,'2024-09-15 13:49:12',56),(11,4,'2024-06-11 22:50:35',56),(11,5,'2025-05-15 19:40:45',56),(11,6,'2025-09-27 13:51:34',56),(11,7,'2024-04-15 05:51:16',56),(11,8,'2024-03-18 08:44:30',2),(11,9,'2025-06-11 13:17:13',48),(11,10,'2025-08-16 09:20:17',2),(11,11,'2025-08-17 08:15:01',2),(11,12,'2024-02-20 21:00:46',56),(11,13,'2025-02-22 04:49:00',2),(11,14,'2025-06-24 13:36:22',2),(11,15,'2024-09-02 20:15:17',2),(11,16,'2025-06-08 08:59:12',56),(12,1,'2024-03-29 04:52:06',42),(12,2,'2024-12-31 04:29:21',8),(12,3,'2025-11-29 14:59:08',42),(12,4,'2025-06-25 10:33:08',8),(12,5,'2025-05-22 19:57:25',8),(12,6,'2025-08-16 23:23:00',8),(12,7,'2024-10-16 20:59:36',8),(12,8,'2024-09-23 21:27:35',42),(12,9,'2025-02-28 13:44:09',42),(12,10,'2024-10-24 23:22:45',8),(12,11,'2025-03-17 20:13:47',8),(13,1,'2024-03-08 03:59:54',16),(13,2,'2024-07-11 11:54:46',17),(13,3,'2025-05-18 00:53:17',17),(13,4,'2024-09-05 21:52:42',16),(13,5,'2025-10-10 12:32:59',16),(13,6,'2024-01-21 20:20:02',16),(13,7,'2025-11-24 08:52:58',53),(13,8,'2024-01-23 02:12:29',17),(13,9,'2025-03-06 03:16:48',53),(13,10,'2024-07-08 16:45:23',53),(13,11,'2024-07-01 05:40:21',17),(14,1,'2024-12-17 10:07:06',7),(14,2,'2025-04-10 01:44:30',7),(15,1,'2025-04-19 23:42:35',50),(15,2,'2025-07-25 19:22:06',30),(15,3,'2025-02-16 12:49:35',30),(15,4,'2024-01-02 01:25:12',50),(15,5,'2024-02-24 21:55:02',50),(15,6,'2025-11-24 22:49:30',27),(15,7,'2024-10-10 23:06:27',27),(15,8,'2024-01-18 14:58:38',50),(15,9,'2025-10-09 23:25:04',50),(15,10,'2025-01-02 00:48:21',50),(15,11,'2025-12-09 10:51:44',50),(15,12,'2024-05-22 07:58:51',50),(15,13,'2024-04-14 13:16:55',50),(15,14,'2024-12-09 17:50:40',27),(15,15,'2024-09-22 01:28:57',50),(15,16,'2024-03-16 14:44:11',27),(15,17,'2024-09-25 01:55:56',30),(15,18,'2025-03-17 05:12:30',30),(15,19,'2025-03-19 00:09:38',27),(15,20,'2024-09-07 10:22:11',27),(17,1,'2025-07-21 00:31:02',1),(17,2,'2024-11-20 11:49:54',1),(17,3,'2025-06-22 09:26:09',1),(17,4,'2024-11-11 19:54:37',58),(17,5,'2024-08-17 17:55:59',25),(17,6,'2024-05-05 16:13:24',22),(17,7,'2025-11-28 10:41:06',25),(17,8,'2024-12-17 09:32:44',25),(17,9,'2024-11-22 07:47:25',25),(17,10,'2025-10-10 05:47:44',22),(17,11,'2024-04-29 15:12:53',1),(17,12,'2024-05-06 20:17:51',25),(17,13,'2024-02-07 20:06:41',25),(17,14,'2024-07-29 20:21:43',22),(17,15,'2025-04-28 02:18:02',22),(17,16,'2025-11-18 04:00:27',22),(17,17,'2025-08-18 08:03:02',25),(17,18,'2024-11-15 22:55:27',25),(17,19,'2024-02-13 20:17:24',25),(17,20,'2024-03-29 21:53:58',22),(18,1,'2024-06-21 17:57:34',45),(18,2,'2024-04-25 16:59:47',45),(18,3,'2024-01-19 23:06:00',45),(18,4,'2025-11-07 15:03:57',45),(18,5,'2025-07-26 23:53:49',32),(18,6,'2024-08-24 01:22:28',45),(18,7,'2024-08-21 03:33:47',18),(18,8,'2025-01-08 04:54:23',45),(18,9,'2025-05-02 18:41:41',18),(18,10,'2024-05-06 11:41:32',18),(18,11,'2024-02-15 10:42:46',45),(18,12,'2025-08-18 07:31:21',14),(18,13,'2025-01-15 01:59:04',18),(18,14,'2024-09-01 07:48:30',32),(18,15,'2025-01-19 05:42:39',18),(18,16,'2024-10-20 10:39:34',45),(18,17,'2024-02-05 01:04:08',45),(18,18,'2024-03-06 23:25:43',45),(19,1,'2025-01-07 06:13:40',28),(19,2,'2025-03-09 18:57:05',6),(19,3,'2024-01-13 08:57:35',6),(19,4,'2024-12-22 17:39:09',57),(19,5,'2024-11-10 20:27:54',57),(19,6,'2024-02-22 01:04:50',57),(19,7,'2025-02-17 03:25:05',57),(19,8,'2024-10-30 10:50:58',6),(19,9,'2024-05-07 11:52:13',57),(19,10,'2024-10-29 04:59:09',57),(20,1,'2024-12-22 04:31:50',35),(20,2,'2024-08-04 20:07:20',35),(20,3,'2024-12-26 05:07:29',35),(20,4,'2025-06-30 17:41:07',35),(20,5,'2025-04-25 21:29:02',35),(20,6,'2024-03-08 19:33:11',35),(20,7,'2025-11-13 05:01:13',35),(20,8,'2024-06-05 20:16:50',35),(20,9,'2024-01-28 22:44:12',35),(20,10,'2025-05-25 21:40:48',35),(21,1,'2024-03-27 07:13:36',10),(21,2,'2025-10-12 02:36:22',36),(21,3,'2025-07-23 16:59:21',36),(21,4,'2025-06-03 15:43:39',36),(21,5,'2025-11-10 00:15:04',10),(21,6,'2025-01-03 02:13:40',10),(21,7,'2024-08-30 16:40:13',10),(21,8,'2025-03-12 17:12:01',36),(21,9,'2025-10-12 01:35:00',10),(21,10,'2025-04-01 16:54:49',36),(22,1,'2025-11-28 16:37:37',44),(22,2,'2025-08-03 10:26:01',44),(22,3,'2025-09-09 02:09:26',44),(22,4,'2025-12-30 10:59:10',59),(22,5,'2025-08-13 23:56:28',59),(22,6,'2024-12-25 23:22:06',59),(22,7,'2024-10-07 23:41:09',59),(22,8,'2024-12-04 16:54:22',44),(22,9,'2024-01-14 15:03:50',44),(22,10,'2024-02-11 01:14:25',59),(22,11,'2024-12-30 22:02:57',44),(22,12,'2025-03-29 13:56:00',59),(22,13,'2024-03-16 21:44:18',44);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deck`
--

DROP TABLE IF EXISTS `deck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deck` (
  `akun_id` int(11) NOT NULL,
  `nomor_slot` tinyint(4) NOT NULL CHECK (`nomor_slot` between 1 and 5),
  `status_aktif` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`akun_id`,`nomor_slot`),
  CONSTRAINT `deck_ibfk_1` FOREIGN KEY (`akun_id`) REFERENCES `akun` (`akun_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deck`
--

LOCK TABLES `deck` WRITE;
/*!40000 ALTER TABLE `deck` DISABLE KEYS */;
INSERT INTO `deck` VALUES (1,1,1),(2,1,0),(2,2,0),(2,3,0),(2,4,1),(2,5,0),(3,1,0),(3,2,1),(3,3,0),(3,4,0),(3,5,0),(4,3,1),(5,1,1),(5,2,0),(5,3,0),(5,4,0),(6,1,1),(6,2,0),(6,3,0),(6,4,0),(6,5,0),(7,1,1),(7,3,0),(7,4,0),(8,2,0),(8,4,1),(9,1,0),(9,3,1),(10,3,1),(10,4,0),(11,1,0),(11,2,1),(11,5,0),(12,1,0),(12,2,1),(12,3,0),(13,2,0),(13,3,1),(13,4,0),(13,5,0),(14,1,0),(14,2,0),(14,3,1),(15,2,0),(15,3,0),(15,4,0),(15,5,1),(16,1,0),(16,2,0),(16,3,0),(16,4,0),(16,5,1),(17,1,0),(17,4,1),(17,5,0),(18,1,0),(18,2,1),(18,3,0),(18,4,0),(18,5,0),(19,4,0),(19,5,1),(20,1,0),(20,2,0),(20,3,0),(20,4,0),(20,5,1),(21,1,0),(21,2,1),(21,3,0),(21,4,0),(21,5,0),(22,1,1),(22,2,0),(22,3,0),(23,4,1),(24,5,1),(25,4,1),(26,1,1),(26,2,0),(26,4,0),(27,2,0),(27,3,0),(27,4,0),(27,5,1),(28,5,1),(29,1,0),(29,2,1),(29,3,0),(30,1,0),(30,2,0),(30,3,1),(30,4,0),(30,5,0),(31,1,1),(31,2,0),(31,3,0),(31,4,0),(31,5,0),(32,2,0),(32,3,1),(33,4,1),(34,1,0),(34,2,1),(35,1,1),(35,2,0),(35,3,0),(35,4,0),(35,5,0),(36,1,0),(36,2,0),(36,3,0),(36,4,1),(37,3,0),(37,5,1),(38,1,0),(38,2,0),(38,3,0),(38,4,1),(38,5,0),(39,3,1),(39,4,0),(40,5,1),(41,1,0),(41,2,1),(41,4,0),(41,5,0),(42,1,1),(42,2,0),(42,3,0),(42,4,0),(42,5,0),(43,4,0),(43,5,1),(44,2,1),(44,3,0),(45,5,1),(46,1,0),(46,2,0),(46,4,1),(46,5,0),(47,1,1),(47,3,0),(48,1,0),(48,2,1),(48,5,0),(49,1,1),(49,3,0),(49,4,0),(49,5,0),(50,1,0),(50,2,0),(50,3,1),(50,5,0),(51,1,1),(51,4,0),(52,1,0),(52,2,0),(52,3,0),(52,4,0),(52,5,1),(53,2,1),(53,3,0),(53,4,0),(53,5,0),(54,1,0),(54,2,0),(54,3,0),(54,4,0),(54,5,1),(55,1,1),(55,3,0),(55,4,0),(56,1,1),(56,2,0),(57,1,0),(57,2,1),(57,3,0),(57,4,0),(57,5,0),(58,2,1),(58,4,0),(59,1,0),(59,2,0),(59,3,0),(59,4,0),(59,5,1),(60,2,0),(60,3,1),(60,5,0);
/*!40000 ALTER TABLE `deck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kartu`
--

DROP TABLE IF EXISTS `kartu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kartu` (
  `kartu_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `tipe` enum('pasukan','sihir','bangunan') NOT NULL,
  `damage` int(11) DEFAULT 0,
  `elixir` int(11) NOT NULL CHECK (`elixir` between 1 and 10),
  `nama_rarity` varchar(50) DEFAULT NULL,
  `arena_id_unlocked` int(11) DEFAULT NULL,
  PRIMARY KEY (`kartu_id`),
  KEY `nama_rarity` (`nama_rarity`),
  KEY `arena_id_unlocked` (`arena_id_unlocked`),
  CONSTRAINT `kartu_ibfk_1` FOREIGN KEY (`nama_rarity`) REFERENCES `rarity` (`nama_rarity`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `kartu_ibfk_2` FOREIGN KEY (`arena_id_unlocked`) REFERENCES `arena` (`arena_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kartu`
--

LOCK TABLES `kartu` WRITE;
/*!40000 ALTER TABLE `kartu` DISABLE KEYS */;
INSERT INTO `kartu` VALUES (1,'Frost Bunker','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1602,4,'Frost',21),(2,'Frost Beacon','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1673,1,'Epic',10),(3,'Shadow Fortress','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1466,4,'Celestial',19),(4,'Void Launcher','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1183,9,'Shadow',14),(5,'Phantom Turret','Kartu bangunan dengan kekuatan luar biasa.','bangunan',770,8,'Ancient',10),(6,'Thunder Minion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',297,4,'Void',4),(7,'Phantom Wizard','Kartu pasukan dengan kekuatan luar biasa.','pasukan',442,4,'Frost',9),(8,'Solar Sniper','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1272,5,'Legendary',7),(9,'Crystal Tombstone','Kartu bangunan dengan kekuatan luar biasa.','bangunan',789,3,'Celestial',1),(10,'Phantom Inferno','Kartu bangunan dengan kekuatan luar biasa.','bangunan',611,1,'Rare',18),(11,'Crystal Freeze','Kartu sihir dengan kekuatan luar biasa.','sihir',1356,8,'Legendary',1),(12,'Solar Valkyrie','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1011,8,'Storm',11),(13,'Iron Cannon','Kartu bangunan dengan kekuatan luar biasa.','bangunan',567,8,'Legendary',3),(14,'Neon Launcher','Kartu bangunan dengan kekuatan luar biasa.','bangunan',201,10,'Rare',5),(15,'Swift Wall','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1993,5,'Epic',8),(16,'Stone Specter','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1615,7,'Spectral',20),(17,'Lunar Minion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1638,9,'Crystal',15),(18,'Blaze Valkyrie','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1811,10,'Infernal',10),(19,'Solar Flare','Kartu sihir dengan kekuatan luar biasa.','sihir',173,10,'Legendary',7),(20,'Golden Furnace','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1402,2,'Ultra',8),(21,'Iron Strike','Kartu sihir dengan kekuatan luar biasa.','sihir',203,3,'Common',14),(22,'Blaze Flare','Kartu sihir dengan kekuatan luar biasa.','sihir',1012,5,'Rare',8),(23,'Crystal Valkyrie','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1489,8,'Epic',8),(24,'Thunder Wall','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1404,4,'Infernal',4),(25,'Phantom Minion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1376,3,'Ancient',5),(26,'Dark Archer','Kartu pasukan dengan kekuatan luar biasa.','pasukan',389,5,'Spectral',19),(27,'Crystal Champion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',304,8,'Celestial',13),(28,'Thunder Blast','Kartu sihir dengan kekuatan luar biasa.','sihir',1155,8,'Storm',3),(29,'Lunar Cannon','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1871,7,'Void',20),(30,'Thunder Tower','Kartu bangunan dengan kekuatan luar biasa.','bangunan',237,4,'Nature',19),(31,'Flame Furnace','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1230,1,'Ultra',16),(32,'Infernal Beacon','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1926,5,'Ultra',19),(33,'Storm Launcher','Kartu bangunan dengan kekuatan luar biasa.','bangunan',236,8,'Shadow',14),(34,'Ancient Turret','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1422,2,'Ultra',11),(35,'Crystal Fortress','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1716,9,'Rare',15),(36,'Dark Blizzard','Kartu sihir dengan kekuatan luar biasa.','sihir',566,6,'Legendary',13),(37,'Infernal Fireball','Kartu sihir dengan kekuatan luar biasa.','sihir',1396,9,'Storm',14),(38,'Ice X-Bow','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1111,6,'Spectral',16),(39,'Blaze Cannon','Kartu bangunan dengan kekuatan luar biasa.','bangunan',466,5,'Blaze',5),(40,'Crystal Wave','Kartu sihir dengan kekuatan luar biasa.','sihir',1853,8,'Legendary',1),(41,'Iron Valkyrie','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1178,1,'Blaze',14),(42,'Dark Minion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1773,2,'Storm',4),(43,'Swift Rider','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1960,5,'Thunder',9),(44,'Storm Rider','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1017,4,'Storm',18),(45,'Swift Fortress','Kartu bangunan dengan kekuatan luar biasa.','bangunan',440,10,'Thunder',5),(46,'Dark Dragon','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1632,7,'Void',17),(47,'Thunder Knight','Kartu pasukan dengan kekuatan luar biasa.','pasukan',629,5,'Nature',19),(48,'Frost Witch','Kartu pasukan dengan kekuatan luar biasa.','pasukan',964,9,'Frost',12),(49,'Ancient Strike','Kartu sihir dengan kekuatan luar biasa.','sihir',1612,9,'Crystal',15),(50,'Ancient X-Bow','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1478,4,'Nature',13),(51,'Shadow Pulse','Kartu sihir dengan kekuatan luar biasa.','sihir',139,6,'Frost',13),(52,'Neon Inferno','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1064,1,'Champion',17),(53,'Solar Musketeer','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1831,2,'Storm',4),(54,'Infernal Champion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',81,3,'Infernal',21),(55,'Swift Mortar','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1011,5,'Void',20),(56,'Neon Arrows','Kartu sihir dengan kekuatan luar biasa.','sihir',1794,6,'Blaze',13),(57,'Ancient Burst','Kartu sihir dengan kekuatan luar biasa.','sihir',1836,9,'Rare',20),(58,'Crystal Minion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1579,2,'Infernal',4),(59,'Stone Champion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',390,5,'Common',2),(60,'Ancient Lightning','Kartu sihir dengan kekuatan luar biasa.','sihir',650,6,'Shadow',14),(61,'Swift Tombstone','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1137,7,'Nature',6),(62,'Iron Rage','Kartu sihir dengan kekuatan luar biasa.','sihir',211,10,'Crystal',20),(63,'Shadow Rider','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1919,10,'Champion',8),(64,'Blaze Furnace','Kartu bangunan dengan kekuatan luar biasa.','bangunan',991,5,'Common',15),(65,'Crystal Specter','Kartu pasukan dengan kekuatan luar biasa.','pasukan',373,2,'Storm',12),(66,'Storm Dragon','Kartu pasukan dengan kekuatan luar biasa.','pasukan',985,5,'SuperRare',13),(67,'Frost Tesla','Kartu bangunan dengan kekuatan luar biasa.','bangunan',535,7,'Nature',12),(68,'Solar Cage','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1482,5,'Common',13),(69,'Solar Archer','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1914,10,'Frost',10),(70,'Shadow Gate','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1692,6,'Mythic',21),(71,'Golden Warrior','Kartu pasukan dengan kekuatan luar biasa.','pasukan',563,3,'Legendary',21),(72,'Ice Rocket','Kartu sihir dengan kekuatan luar biasa.','sihir',1665,8,'Rare',19),(73,'Void Inferno','Kartu bangunan dengan kekuatan luar biasa.','bangunan',234,5,'Void',14),(74,'Iron Zap','Kartu sihir dengan kekuatan luar biasa.','sihir',320,9,'Shadow',17),(75,'Infernal Furnace','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1750,3,'Ancient',16),(76,'Crystal Musketeer','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1697,2,'Storm',3),(77,'Swift Minion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1811,7,'Blaze',12),(78,'Dark Hunter','Kartu pasukan dengan kekuatan luar biasa.','pasukan',78,5,'Blaze',4),(79,'Blaze Barrier','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1427,5,'Nature',13),(80,'Void Tesla','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1432,4,'Frost',1),(81,'Lunar Bunker','Kartu bangunan dengan kekuatan luar biasa.','bangunan',721,10,'Mythic',21),(82,'Dark Wave','Kartu sihir dengan kekuatan luar biasa.','sihir',1912,5,'Infernal',4),(83,'Swift Archer','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1987,1,'Celestial',16),(84,'Stone Tesla','Kartu bangunan dengan kekuatan luar biasa.','bangunan',530,9,'Champion',13),(85,'Blaze Bandit','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1423,9,'Infernal',19),(86,'Swift Pulse','Kartu sihir dengan kekuatan luar biasa.','sihir',1391,2,'Frost',20),(87,'Storm Furnace','Kartu bangunan dengan kekuatan luar biasa.','bangunan',117,6,'SuperRare',15),(88,'Blaze Minion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1801,6,'Legendary',12),(89,'Phantom Barrier','Kartu bangunan dengan kekuatan luar biasa.','bangunan',174,7,'Ancient',7),(90,'Stone Beacon','Kartu bangunan dengan kekuatan luar biasa.','bangunan',237,4,'Spectral',1),(91,'Ice Musketeer','Kartu pasukan dengan kekuatan luar biasa.','pasukan',548,3,'Nature',7),(92,'Dark Specter','Kartu pasukan dengan kekuatan luar biasa.','pasukan',474,10,'SuperRare',8),(93,'Ancient Witch','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1665,10,'Common',9),(94,'Swift Inferno','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1156,5,'Ultra',4),(95,'Flame Freeze','Kartu sihir dengan kekuatan luar biasa.','sihir',80,6,'Mythic',19),(96,'Ancient Knight','Kartu pasukan dengan kekuatan luar biasa.','pasukan',406,5,'Rare',5),(97,'Storm Lancer','Kartu pasukan dengan kekuatan luar biasa.','pasukan',282,2,'Frost',15),(98,'Void Lancer','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1265,2,'Storm',17),(99,'Ice Sniper','Kartu bangunan dengan kekuatan luar biasa.','bangunan',667,8,'Common',2),(100,'Frost Hunter','Kartu pasukan dengan kekuatan luar biasa.','pasukan',923,2,'Frost',15),(101,'Dark Arrows','Kartu sihir dengan kekuatan luar biasa.','sihir',709,10,'Champion',3),(102,'Swift Tornado','Kartu sihir dengan kekuatan luar biasa.','sihir',1328,10,'Blaze',11),(103,'Neon Warrior','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1136,5,'Storm',17),(104,'Lunar Bastion','Kartu bangunan dengan kekuatan luar biasa.','bangunan',253,2,'Blaze',7),(105,'Storm Champion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1868,4,'Infernal',11),(106,'Blaze Hunter','Kartu pasukan dengan kekuatan luar biasa.','pasukan',901,2,'Void',14),(107,'Ancient Tornado','Kartu sihir dengan kekuatan luar biasa.','sihir',816,3,'Frost',3),(108,'Dark Pulse','Kartu sihir dengan kekuatan luar biasa.','sihir',247,6,'Champion',18),(109,'Ice Wall','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1200,9,'Void',4),(110,'Storm Bandit','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1839,7,'Rare',10),(111,'Lunar Cage','Kartu bangunan dengan kekuatan luar biasa.','bangunan',770,2,'Nature',17),(112,'Golden Witch','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1394,8,'Mythic',4),(113,'Void Bunker','Kartu bangunan dengan kekuatan luar biasa.','bangunan',802,2,'Ancient',19),(114,'Phantom Flare','Kartu sihir dengan kekuatan luar biasa.','sihir',1306,9,'Common',20),(115,'Iron Dragon','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1489,5,'Void',12),(116,'Flame Bomb','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1831,3,'Nature',13),(117,'Dark Inferno','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1567,1,'Epic',17),(118,'Golden Hunter','Kartu pasukan dengan kekuatan luar biasa.','pasukan',909,8,'Void',6),(119,'Void Rocket','Kartu sihir dengan kekuatan luar biasa.','sihir',1527,6,'Nature',20),(120,'Dark Cannon','Kartu bangunan dengan kekuatan luar biasa.','bangunan',368,3,'Spectral',2),(121,'Dark Furnace','Kartu bangunan dengan kekuatan luar biasa.','bangunan',957,7,'Frost',20),(122,'Blaze Monk','Kartu pasukan dengan kekuatan luar biasa.','pasukan',609,4,'Thunder',4),(123,'Void Pulse','Kartu sihir dengan kekuatan luar biasa.','sihir',277,5,'Nature',16),(124,'Infernal Valkyrie','Kartu pasukan dengan kekuatan luar biasa.','pasukan',143,4,'Crystal',20),(125,'Ice Knight','Kartu pasukan dengan kekuatan luar biasa.','pasukan',468,5,'SuperRare',5),(126,'Thunder Valkyrie','Kartu pasukan dengan kekuatan luar biasa.','pasukan',721,2,'Common',16),(127,'Storm Wizard','Kartu pasukan dengan kekuatan luar biasa.','pasukan',314,7,'Blaze',8),(128,'Infernal Bunker','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1756,6,'Epic',13),(129,'Ice Monk','Kartu pasukan dengan kekuatan luar biasa.','pasukan',88,8,'Epic',11),(130,'Solar Monk','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1224,7,'Infernal',10),(131,'Stone Fortress','Kartu bangunan dengan kekuatan luar biasa.','bangunan',92,6,'Ultra',20),(132,'Dark Monk','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1779,2,'Mythic',14),(133,'Solar Fortress','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1123,2,'Crystal',10),(134,'Ancient Minion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',732,3,'Epic',17),(135,'Stone Blast','Kartu sihir dengan kekuatan luar biasa.','sihir',1094,4,'Shadow',12),(136,'Stone Inferno','Kartu bangunan dengan kekuatan luar biasa.','bangunan',574,4,'Ultra',20),(137,'Swift Goblin','Kartu pasukan dengan kekuatan luar biasa.','pasukan',412,8,'Storm',19),(138,'Solar Wave','Kartu sihir dengan kekuatan luar biasa.','sihir',1444,10,'Spectral',11),(139,'Blaze Goblin','Kartu pasukan dengan kekuatan luar biasa.','pasukan',1010,8,'Celestial',9),(140,'Solar Cannon','Kartu bangunan dengan kekuatan luar biasa.','bangunan',770,9,'Epic',10),(141,'Blaze Champion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',127,1,'Shadow',10),(142,'Dark Mortar','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1309,10,'Thunder',13),(143,'Blaze Wall','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1185,1,'Storm',19),(144,'Golden Turret','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1289,8,'Thunder',5),(145,'Ice Champion','Kartu pasukan dengan kekuatan luar biasa.','pasukan',261,6,'Epic',17),(146,'Iron Lightning','Kartu sihir dengan kekuatan luar biasa.','sihir',557,8,'Storm',17),(147,'Infernal Gate','Kartu bangunan dengan kekuatan luar biasa.','bangunan',375,6,'Shadow',10),(148,'Neon Bastion','Kartu bangunan dengan kekuatan luar biasa.','bangunan',1636,6,'Spectral',2),(149,'Ancient Goblin','Kartu pasukan dengan kekuatan luar biasa.','pasukan',725,2,'Blaze',13),(150,'Crystal Tornado','Kartu sihir dengan kekuatan luar biasa.','sihir',1532,10,'Champion',11),(151,'Golden Flare','Kartu sihir dengan daya serang tinggi.','sihir',466,4,'Mythic',5),(152,'Thunder Inferno','Kartu sihir dengan daya serang tinggi.','sihir',884,9,'Blaze',3),(153,'Frost Zap','Kartu sihir dengan daya serang tinggi.','sihir',963,10,'Nature',7),(154,'Void Cascade','Kartu sihir dengan daya serang tinggi.','sihir',894,4,'Champion',15),(155,'Solar Blizzard','Kartu sihir dengan daya serang tinggi.','sihir',269,9,'Epic',16),(156,'Ice Tornado','Kartu sihir dengan daya serang tinggi.','sihir',1242,1,'Infernal',7),(157,'Phantom Arrows','Kartu sihir dengan daya serang tinggi.','sihir',1046,9,'SuperRare',20),(158,'Ice Meteor','Kartu sihir dengan daya serang tinggi.','sihir',364,4,'Ultra',15),(159,'Iron Blast','Kartu sihir dengan daya serang tinggi.','sihir',1452,3,'Rare',4),(160,'Frost Vortex','Kartu sihir dengan daya serang tinggi.','sihir',958,2,'Infernal',21),(161,'Crystal Flare','Kartu sihir dengan daya serang tinggi.','sihir',111,7,'Void',5),(162,'Golden Maelstrom','Kartu sihir dengan daya serang tinggi.','sihir',213,4,'Storm',9),(163,'Swift Meteor','Kartu sihir dengan daya serang tinggi.','sihir',1075,1,'Champion',20),(164,'Swift Flare','Kartu sihir dengan daya serang tinggi.','sihir',936,2,'Legendary',4),(165,'Storm Freeze','Kartu sihir dengan daya serang tinggi.','sihir',525,9,'Void',16),(166,'Thunder Poison','Kartu sihir dengan daya serang tinggi.','sihir',840,3,'Epic',17),(167,'Solar Cascade','Kartu sihir dengan daya serang tinggi.','sihir',197,6,'SuperRare',13),(168,'Storm Cascade','Kartu sihir dengan daya serang tinggi.','sihir',859,9,'Epic',6),(169,'Void Inferno','Kartu sihir dengan daya serang tinggi.','sihir',916,8,'Mythic',10),(170,'Shadow Surge','Kartu sihir dengan daya serang tinggi.','sihir',736,2,'Void',7);
/*!40000 ALTER TABLE `kartu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kartudeck`
--

DROP TABLE IF EXISTS `kartudeck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kartudeck` (
  `akun_id` int(11) NOT NULL,
  `nomor_slot` tinyint(4) NOT NULL,
  `kartu_id` int(11) NOT NULL,
  PRIMARY KEY (`akun_id`,`nomor_slot`,`kartu_id`),
  KEY `kartu_id` (`kartu_id`),
  CONSTRAINT `kartudeck_ibfk_1` FOREIGN KEY (`akun_id`, `nomor_slot`) REFERENCES `deck` (`akun_id`, `nomor_slot`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kartudeck_ibfk_2` FOREIGN KEY (`kartu_id`) REFERENCES `kartu` (`kartu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kartudeck`
--

LOCK TABLES `kartudeck` WRITE;
/*!40000 ALTER TABLE `kartudeck` DISABLE KEYS */;
INSERT INTO `kartudeck` VALUES (11,5,1),(15,4,1),(22,2,1),(47,1,1),(4,3,2),(7,4,2),(16,1,2),(20,2,2),(26,2,2),(38,3,2),(38,4,2),(42,5,2),(49,1,2),(30,3,3),(37,5,3),(41,1,3),(50,2,3),(55,3,3),(5,2,4),(15,4,4),(28,5,4),(35,5,4),(46,1,4),(52,2,4),(4,3,5),(20,5,5),(21,3,5),(31,1,5),(38,4,5),(49,5,5),(14,3,6),(35,1,6),(41,1,6),(53,5,6),(54,3,6),(2,2,7),(21,1,7),(52,2,7),(57,3,7),(19,4,8),(56,1,8),(56,2,8),(59,3,8),(59,4,8),(18,1,9),(23,4,9),(36,2,9),(3,3,10),(22,2,10),(26,2,10),(40,5,10),(46,4,10),(53,2,10),(60,3,10),(2,3,11),(3,2,11),(19,5,11),(30,5,11),(42,5,11),(52,1,11),(57,1,11),(59,1,11),(59,5,11),(5,2,12),(5,4,12),(6,3,12),(13,2,12),(30,5,12),(53,4,12),(55,3,12),(57,2,12),(14,3,13),(16,3,13),(35,1,13),(35,4,13),(42,2,13),(45,5,13),(11,5,14),(13,4,14),(13,5,14),(31,5,14),(40,5,14),(46,1,14),(51,4,14),(59,1,14),(60,2,14),(13,4,15),(16,1,15),(17,1,15),(18,3,15),(21,4,15),(36,2,15),(7,1,16),(15,5,16),(26,1,16),(54,5,16),(4,3,17),(5,2,17),(18,3,17),(19,5,17),(38,2,17),(53,4,17),(17,5,18),(38,5,18),(48,2,18),(57,5,18),(21,1,19),(23,4,19),(27,5,19),(40,5,19),(48,2,19),(53,5,19),(58,4,19),(6,1,20),(11,1,20),(22,1,20),(34,1,20),(43,4,20),(49,3,20),(18,1,21),(20,4,21),(32,3,21),(6,2,22),(6,3,22),(44,2,22),(7,3,23),(11,5,23),(14,1,23),(15,4,23),(20,5,23),(25,4,23),(36,1,23),(40,5,23),(6,1,24),(19,4,24),(22,2,24),(31,3,24),(34,1,24),(46,2,24),(47,3,24),(52,4,24),(2,2,25),(6,3,25),(17,4,25),(42,2,25),(47,1,25),(55,3,25),(2,4,26),(6,1,26),(16,3,26),(27,4,26),(41,5,26),(42,4,26),(48,2,26),(57,4,26),(57,5,26),(13,3,27),(20,5,27),(21,1,27),(30,5,27),(32,2,27),(35,4,27),(49,4,27),(53,5,27),(54,5,27),(5,4,28),(13,2,28),(14,3,28),(20,4,28),(32,2,28),(36,1,28),(38,2,28),(49,5,28),(52,2,28),(3,5,29),(15,4,29),(34,2,29),(12,2,30),(14,3,30),(31,3,30),(32,2,30),(32,3,30),(42,1,30),(42,3,30),(47,1,30),(55,3,30),(4,3,31),(10,3,31),(20,5,31),(21,5,31),(32,2,31),(51,4,31),(55,4,31),(3,3,32),(37,5,32),(42,5,32),(3,1,33),(27,2,33),(48,5,33),(57,5,33),(59,2,33),(14,2,34),(25,4,34),(41,1,34),(49,4,34),(49,5,34),(50,5,34),(54,3,34),(6,5,35),(21,2,35),(47,3,35),(52,1,35),(59,3,35),(13,5,36),(21,4,36),(22,1,36),(27,3,36),(38,3,36),(41,5,36),(50,2,36),(51,1,36),(2,5,37),(15,2,37),(29,2,37),(30,3,37),(46,4,37),(13,4,38),(26,1,38),(59,5,38),(6,1,39),(13,5,39),(15,5,39),(18,5,39),(30,2,39),(49,3,39),(60,2,39),(11,5,40),(21,1,40),(37,5,40),(38,1,40),(59,1,40),(18,3,41),(25,4,41),(41,4,41),(50,1,41),(54,5,41),(56,1,41),(59,3,41),(59,5,41),(2,5,42),(9,3,42),(12,2,42),(13,4,42),(14,2,42),(19,4,42),(34,1,42),(57,1,42),(17,1,43),(31,1,43),(34,2,43),(38,5,43),(43,4,43),(49,3,43),(50,2,43),(56,1,43),(2,2,44),(20,3,44),(25,4,44),(29,2,44),(34,1,44),(36,4,44),(49,1,44),(16,3,45),(20,4,45),(22,3,45),(33,4,45),(41,1,45),(46,4,45),(48,5,45),(54,2,45),(55,4,45),(8,4,46),(29,3,46),(40,5,46),(48,5,46),(50,5,46),(59,5,46),(14,1,47),(15,2,47),(16,4,47),(29,2,47),(31,3,47),(36,4,47),(56,2,47),(2,5,48),(27,5,48),(46,2,48),(49,3,48),(54,2,48),(57,2,48),(5,1,49),(7,3,49),(18,5,49),(2,5,50),(6,3,50),(11,2,50),(29,3,50),(57,5,50),(59,2,50),(22,1,51),(45,5,51),(48,2,51),(50,3,51),(8,2,52),(13,4,52),(13,5,52),(36,2,52),(41,2,52),(49,5,52),(52,5,52),(2,2,53),(5,1,53),(19,5,53),(21,1,53),(26,1,53),(30,4,53),(37,5,53),(12,2,54),(25,4,54),(31,2,54),(44,2,54),(57,1,54),(7,3,55),(31,2,55),(44,2,55),(49,3,55),(52,4,55),(54,3,55),(59,2,55),(60,3,55),(10,3,56),(13,3,56),(15,3,56),(30,1,56),(41,2,56),(2,5,57),(14,1,57),(27,5,57),(29,2,57),(30,4,57),(47,1,57),(49,1,57),(52,4,57),(54,1,57),(59,3,57),(59,5,57),(11,1,58),(15,5,58),(30,4,58),(35,4,58),(36,3,58),(37,3,58),(38,4,58),(39,4,58),(41,1,58),(7,1,59),(21,5,59),(31,1,59),(38,5,59),(49,3,59),(54,4,59),(57,4,59),(6,1,60),(19,5,60),(15,4,61),(16,5,61),(18,1,61),(35,1,61),(35,4,61),(42,2,61),(57,5,61),(2,3,62),(43,4,62),(50,2,62),(59,4,62),(2,3,63),(53,3,63),(12,3,64),(36,2,64),(38,4,64),(49,1,64),(60,2,64),(2,5,65),(11,1,65),(13,3,65),(37,5,65),(40,5,65),(46,1,65),(48,2,65),(6,1,66),(14,2,66),(14,3,66),(16,2,66),(50,3,66),(5,2,67),(17,1,67),(17,5,67),(18,5,67),(19,4,67),(37,3,67),(53,2,67),(53,5,67),(60,3,67),(5,1,68),(14,2,68),(16,3,68),(19,5,68),(22,1,68),(33,4,68),(43,5,68),(46,2,68),(52,5,68),(57,2,68),(13,4,69),(15,5,69),(30,4,69),(31,3,69),(35,1,69),(41,5,70),(6,5,71),(12,3,71),(18,5,71),(25,4,71),(28,5,71),(45,5,71),(46,4,71),(60,5,71),(14,2,72),(43,4,72),(49,3,72),(57,4,72),(1,1,73),(19,4,73),(32,2,73),(36,1,73),(38,2,73),(57,5,73),(13,4,74),(35,4,74),(52,2,74),(5,4,75),(26,4,75),(36,1,75),(48,2,75),(50,5,75),(6,3,76),(11,5,76),(12,3,76),(26,1,76),(29,3,76),(30,1,76),(30,3,76),(36,4,76),(57,1,76),(6,4,77),(18,1,77),(18,5,77),(30,3,77),(36,4,77),(38,2,77),(42,2,77),(53,4,77),(13,3,78),(22,2,78),(36,1,78),(57,4,78),(59,1,78),(20,4,79),(32,3,79),(37,3,79),(38,1,79),(44,2,79),(49,4,79),(60,5,79),(49,4,80),(57,4,80),(5,2,81),(15,2,81),(16,1,81),(20,5,81),(41,2,81),(46,1,81),(49,1,81),(55,3,81),(17,5,82),(21,4,82),(27,5,82),(53,5,82),(2,3,83),(6,3,83),(6,4,83),(29,1,83),(30,5,83),(35,5,83),(43,4,83),(59,1,83),(18,5,84),(28,5,84),(6,5,85),(12,1,85),(12,2,85),(20,3,85),(30,1,85),(37,3,85),(38,1,85),(40,5,85),(43,4,85),(57,5,85),(58,2,85),(14,1,86),(24,5,86),(13,2,87),(17,4,87),(55,1,87),(12,3,88),(20,1,88),(31,3,88),(31,5,88),(38,5,88),(47,1,88),(54,1,88),(6,2,89),(38,3,89),(43,5,89),(44,2,89),(50,5,89),(60,2,89),(8,4,90),(52,4,90),(60,5,90),(42,1,91),(2,1,92),(20,1,92),(20,3,92),(52,5,92),(56,2,92),(57,5,92),(59,5,92),(6,5,93),(11,5,93),(19,5,93),(21,5,93),(30,1,93),(45,5,93),(3,3,94),(11,1,94),(31,5,94),(36,3,94),(50,2,94),(19,5,95),(39,4,95),(45,5,95),(46,2,95),(5,4,96),(18,3,96),(30,3,96),(31,3,96),(35,1,96),(35,5,96),(37,3,96),(57,3,96),(3,2,97),(11,1,97),(16,5,97),(34,1,97),(60,5,97),(2,3,98),(37,5,98),(46,2,98),(52,3,98),(56,2,98),(59,3,98),(16,2,99),(19,4,99),(26,2,99),(34,2,99),(43,5,99),(49,4,99),(49,5,99),(60,2,99),(3,4,100),(4,3,100),(7,1,100),(9,1,100),(29,1,100),(35,4,100),(46,1,100),(46,2,100),(53,2,100),(10,3,101),(36,3,101),(42,2,101),(12,3,102),(13,3,102),(18,1,102),(32,3,102),(45,5,102),(48,1,102),(59,3,102),(31,3,103),(46,4,103),(3,4,104),(10,4,104),(11,1,104),(16,5,104),(20,5,104),(21,2,104),(21,4,104),(26,2,104),(31,1,104),(46,4,104),(52,4,104),(53,2,104),(3,4,105),(5,1,105),(15,2,105),(51,1,105),(12,2,106),(13,5,106),(27,3,106),(29,2,106),(43,5,106),(7,3,107),(13,2,107),(14,3,107),(30,2,107),(46,1,107),(7,1,108),(12,3,108),(28,5,108),(34,2,108),(37,3,108),(41,5,108),(53,2,108),(5,3,109),(52,2,109),(60,5,109),(11,5,110),(26,2,110),(49,1,110),(55,3,110),(3,4,111),(56,1,111),(8,2,112),(21,1,112),(55,1,112),(56,1,112),(5,2,113),(56,2,113),(57,2,113),(6,4,114),(7,3,114),(18,2,114),(39,4,114),(2,3,115),(6,5,115),(8,4,115),(15,3,115),(20,5,115),(29,3,115),(55,4,115),(57,2,115),(3,4,116),(12,3,116),(23,4,116),(35,2,116),(38,1,116),(47,1,116),(6,1,117),(12,1,117),(30,5,117),(31,3,117),(31,5,117),(38,5,117),(55,1,117),(10,3,118),(15,2,118),(18,2,118),(28,5,118),(35,2,118),(6,5,119),(16,3,119),(45,5,119),(47,3,119),(51,4,119),(13,3,120),(57,2,120),(3,1,121),(11,2,121),(30,5,121),(51,4,121),(60,3,121),(8,4,122),(12,1,122),(18,1,122),(30,1,122),(32,3,122),(35,1,122),(37,5,122),(41,1,122),(46,4,122),(54,1,122),(59,3,122),(6,5,123),(11,5,123),(12,2,123),(26,2,123),(34,2,123),(42,1,123),(3,5,124),(12,2,124),(29,2,124),(38,2,124),(38,3,124),(48,5,124),(56,1,124),(56,2,124),(57,1,124),(59,5,124),(60,2,124),(3,5,125),(6,3,125),(18,3,125),(20,4,125),(24,5,125),(38,1,125),(38,3,125),(8,4,126),(20,1,126),(25,4,126),(43,4,126),(46,2,126),(57,4,126),(59,1,126),(43,4,127),(51,1,127),(7,4,128),(20,5,128),(32,2,128),(39,3,128),(57,1,128),(18,1,129),(36,1,129),(38,3,129),(47,3,129),(49,4,129),(50,2,129),(21,2,130),(21,3,130),(36,4,130),(41,4,130),(44,3,130),(45,5,130),(49,5,130),(54,3,130),(6,1,131),(22,2,131),(29,2,131),(32,2,131),(35,3,131),(35,4,131),(47,3,131),(48,5,131),(57,3,131),(2,5,132),(6,3,132),(18,3,132),(27,3,132),(41,1,132),(49,3,132),(50,2,132),(52,1,132),(57,3,132),(10,4,133),(11,1,133),(17,4,133),(18,3,133),(19,5,133),(57,3,133),(5,4,134),(7,1,134),(13,3,134),(17,4,134),(27,5,134),(28,5,134),(30,5,134),(41,5,134),(49,5,134),(52,2,134),(52,5,134),(55,1,134),(5,2,135),(21,2,135),(27,5,135),(55,1,135),(7,4,136),(30,1,136),(35,5,136),(52,3,136),(4,3,137),(14,3,137),(20,2,137),(26,2,137),(52,2,137),(54,1,137),(59,3,137),(7,1,138),(20,2,138),(21,1,138),(22,1,138),(43,5,138),(44,2,138),(52,4,138),(5,1,139),(26,1,139),(60,3,139),(30,3,140),(33,4,140),(39,4,140),(46,2,140),(52,4,140),(60,3,140),(5,4,141),(16,5,141),(22,2,141),(34,1,141),(37,5,141),(41,2,141),(44,2,141),(46,5,141),(48,2,141),(57,1,141),(59,1,141),(5,1,142),(7,1,142),(8,4,142),(18,4,142),(20,4,142),(28,5,142),(30,3,142),(41,2,142),(46,1,142),(60,3,142),(9,1,143),(14,2,143),(22,2,143),(36,4,143),(40,5,143),(60,2,143),(12,1,144),(14,1,144),(35,4,144),(38,2,144),(42,1,144),(2,4,145),(10,4,145),(15,5,145),(59,5,145),(15,2,146),(16,4,146),(21,2,146),(33,4,146),(42,4,146),(56,2,146),(15,4,147),(18,1,147),(42,1,147),(46,4,147),(59,1,147),(25,4,148),(54,4,148),(31,4,149),(33,4,149),(48,2,149),(48,5,149),(13,3,150),(14,2,150),(29,2,150),(38,1,150),(42,1,150),(42,4,150),(48,5,150),(51,4,150);
/*!40000 ALTER TABLE `kartudeck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klan`
--

DROP TABLE IF EXISTS `klan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klan` (
  `klan_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_klan` varchar(100) NOT NULL,
  `negara_asal` varchar(100) DEFAULT NULL,
  `piala_dibutuhkan` int(11) DEFAULT 0,
  `deskripsi` text DEFAULT NULL,
  `tipe` enum('Public','Private') DEFAULT 'Public',
  PRIMARY KEY (`klan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klan`
--

LOCK TABLES `klan` WRITE;
/*!40000 ALTER TABLE `klan` DISABLE KEYS */;
INSERT INTO `klan` VALUES (1,'Dragon Fire','Indonesia',0,'Klan kompetitif untuk pemain berpengalaman.','Public'),(2,'Shadow Knights','Malaysia',200,'Bergabunglah dan raih kejayaan bersama!','Public'),(3,'Ice Wolves','Singapore',500,'Klan santai namun aktif bermain setiap hari.','Private'),(4,'Thunder Clan','Thailand',800,'Kami mencari anggota yang dedikasi tinggi.','Public'),(5,'Phantom Force','Philippines',1200,'Klan terbuka untuk semua level pemain.','Public'),(6,'Steel Titans','Vietnam',1500,'Elite clan, invitation only.','Public'),(7,'Golden Eagles','Japan',2000,'Fokus pada strategi dan kerja sama tim.','Public'),(8,'Crimson Tide','South Korea',2500,'Fun clan for casual players.','Public'),(9,'Silver Serpents','Brazil',3000,'Klan legendaris dengan sejarah panjang.','Private'),(10,'Neon Warriors','USA',3500,'Kami adalah yang terkuat di region ini.','Public'),(11,'Eternal Frost','Germany',4000,'Klan kompetitif untuk pemain berpengalaman.','Public'),(12,'Blazing Stars','France',4500,'Bergabunglah dan raih kejayaan bersama!','Public'),(13,'Storm Riders','Australia',5000,'Klan santai namun aktif bermain setiap hari.','Public'),(14,'Dark Phoenix','India',5500,'Kami mencari anggota yang dedikasi tinggi.','Public'),(15,'Iron Legion','Mexico',6000,'Klan terbuka untuk semua level pemain.','Public'),(16,'Crystal Vanguard','Argentina',6500,'Elite clan, invitation only.','Public'),(17,'Solar Flare','Netherlands',7000,'Fokus pada strategi dan kerja sama tim.','Private'),(18,'Lunar Pack','Sweden',7500,'Fun clan for casual players.','Public'),(19,'Void Hunters','Canada',8000,'Klan legendaris dengan sejarah panjang.','Private'),(20,'Nebula Squad','UK',9000,'Kami adalah yang terkuat di region ini.','Private'),(21,'Apex Predators','Indonesia',10000,'Klan kompetitif untuk pemain berpengalaman.','Public'),(22,'Rogue Alliance','Malaysia',12000,'Bergabunglah dan raih kejayaan bersama!','Public');
/*!40000 ALTER TABLE `klan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koleksikartu`
--

DROP TABLE IF EXISTS `koleksikartu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `koleksikartu` (
  `akun_id` int(11) NOT NULL,
  `kartu_id` int(11) NOT NULL,
  `level` int(11) DEFAULT 1,
  `jumlah_kartu` int(11) DEFAULT 0,
  PRIMARY KEY (`akun_id`,`kartu_id`),
  KEY `kartu_id` (`kartu_id`),
  CONSTRAINT `koleksikartu_ibfk_1` FOREIGN KEY (`akun_id`) REFERENCES `akun` (`akun_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `koleksikartu_ibfk_2` FOREIGN KEY (`kartu_id`) REFERENCES `kartu` (`kartu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koleksikartu`
--

LOCK TABLES `koleksikartu` WRITE;
/*!40000 ALTER TABLE `koleksikartu` DISABLE KEYS */;
INSERT INTO `koleksikartu` VALUES (1,2,11,158),(1,9,9,117),(1,13,10,164),(1,16,12,39),(1,20,6,16),(1,36,8,5),(1,48,14,162),(1,106,8,169),(1,135,1,56),(1,139,4,18),(2,106,5,138),(2,137,1,5),(2,142,9,185),(3,5,3,62),(3,25,2,96),(3,28,5,102),(3,46,14,91),(3,111,9,65),(3,129,4,159),(3,135,7,118),(4,9,1,180),(4,21,1,164),(4,24,3,22),(4,58,7,97),(4,77,9,122),(4,104,8,112),(5,11,10,169),(5,25,2,176),(5,55,14,81),(5,59,1,46),(5,122,10,37),(5,136,5,140),(5,145,5,12),(5,146,1,54),(6,20,7,194),(6,42,13,177),(6,62,9,191),(6,77,12,36),(6,85,6,155),(6,100,2,112),(6,139,4,20),(6,145,12,21),(6,146,6,14),(7,8,11,150),(7,59,13,64),(7,70,11,98),(7,84,7,48),(7,92,12,19),(7,97,3,98),(7,116,2,198),(7,126,10,76),(7,142,2,69),(8,24,2,48),(8,28,2,34),(8,82,8,93),(8,93,13,70),(8,100,1,79),(9,7,13,22),(9,23,12,144),(9,27,7,100),(9,91,4,147),(9,105,1,75),(9,115,2,153),(9,132,14,99),(9,142,9,44),(9,143,10,84),(10,17,10,158),(10,36,5,124),(10,38,11,127),(10,43,4,118),(10,44,5,108),(10,69,13,20),(10,78,6,65),(10,112,2,35),(10,127,4,185),(11,2,14,167),(11,85,4,123),(11,86,5,83),(11,98,10,178),(11,102,10,35),(11,111,7,82),(11,113,6,46),(12,63,10,140),(12,72,1,187),(12,84,3,175),(12,97,13,141),(12,101,8,182),(12,126,6,30),(12,148,10,52),(13,18,11,40),(13,36,2,115),(13,75,4,65),(13,105,12,109),(13,113,11,78),(13,128,13,97),(14,10,11,166),(14,22,2,3),(14,93,7,193),(14,103,4,169),(14,108,10,12),(14,130,3,166),(14,137,11,91),(14,138,6,111),(14,140,10,166),(14,150,2,197),(15,57,12,148),(15,67,9,149),(15,131,4,115),(15,133,6,101),(16,7,8,53),(16,22,8,82),(16,27,6,122),(16,30,2,77),(16,39,3,90),(16,76,2,113),(16,89,5,88),(16,107,12,179),(16,124,9,124),(16,129,14,187),(17,6,11,43),(17,30,11,28),(17,88,12,63),(18,41,13,104),(18,85,11,48),(18,110,11,111),(18,142,8,60),(18,144,3,164),(19,2,6,51),(19,8,13,181),(19,51,13,17),(19,53,5,172),(19,55,8,30),(19,72,14,126),(19,100,3,94),(19,110,13,138),(19,116,10,27),(20,30,3,81),(20,45,12,37),(20,77,9,100),(20,90,2,62),(20,91,5,30),(20,100,10,152),(20,101,2,173),(20,118,3,96),(21,36,3,126),(21,45,3,50),(21,48,10,14),(21,99,3,81),(21,109,14,116),(21,125,14,92),(21,138,1,125),(21,143,14,99),(21,148,5,36),(22,8,9,29),(22,22,13,197),(22,43,10,191),(22,57,10,30),(22,75,5,199),(22,105,1,71),(22,107,5,44),(22,114,13,118),(22,126,4,138),(22,145,8,141),(23,11,8,68),(23,27,10,177),(23,56,13,61),(23,64,6,182),(23,109,4,189),(23,113,6,23),(23,139,5,9),(23,140,8,31),(24,16,5,132),(24,36,12,75),(24,43,3,83),(24,53,5,147),(24,72,1,71),(24,90,3,193),(24,137,13,106),(24,138,14,168),(24,146,11,25),(25,34,8,37),(25,38,5,161),(25,64,10,162),(25,83,7,97),(25,101,8,20),(26,72,1,199),(26,95,14,188),(26,104,8,125),(26,132,6,149),(27,17,8,69),(27,92,7,55),(27,118,7,56),(27,137,6,73),(28,12,3,167),(28,13,4,177),(28,34,1,32),(28,88,1,110),(28,125,8,117),(28,141,2,161),(28,145,14,41),(28,148,13,118),(29,22,4,110),(29,24,7,161),(29,41,11,167),(29,65,12,194),(29,71,3,14),(29,93,5,186),(29,96,11,24),(30,1,3,152),(30,20,1,3),(30,55,4,133),(30,123,11,114),(31,19,13,193),(31,23,3,18),(31,31,12,27),(31,34,6,77),(31,59,14,35),(31,99,11,174),(31,109,2,81),(31,123,3,98),(32,43,12,55),(32,90,3,106),(32,113,11,192),(33,23,2,64),(33,26,9,154),(33,32,10,73),(33,36,10,185),(33,56,5,166),(33,64,9,49),(33,81,9,156),(33,90,1,169),(33,99,13,177),(33,110,5,53),(34,14,6,34),(34,19,2,5),(34,29,3,196),(34,62,7,146),(34,76,1,93),(34,99,9,175),(34,127,7,94),(34,128,8,198),(34,136,10,18),(35,11,11,183),(35,56,9,74),(35,68,1,102),(36,21,12,112),(36,22,7,151),(36,40,14,167),(36,72,11,165),(36,80,2,80),(36,103,9,84),(36,109,4,40),(36,131,12,62),(36,138,11,196),(37,23,10,156),(37,63,2,117),(37,112,1,80),(38,3,5,43),(38,4,9,133),(38,31,8,89),(38,36,13,185),(38,42,6,33),(39,8,10,161),(39,17,3,95),(39,31,5,183),(39,70,6,15),(39,86,2,128),(39,110,8,131),(39,135,8,146),(40,27,1,12),(40,30,4,12),(40,59,8,94),(40,66,12,131),(40,147,14,4),(41,10,10,96),(41,39,12,82),(41,46,5,20),(41,58,3,58),(41,64,1,103),(41,83,13,133),(41,107,2,120),(41,108,11,14),(41,142,2,129),(42,3,8,198),(42,23,12,160),(42,80,4,75),(42,84,10,78),(42,95,13,51),(42,117,6,152),(42,142,4,119),(43,2,14,178),(43,7,1,195),(43,39,6,163),(43,60,11,97),(43,105,1,86),(43,139,14,189),(44,16,12,22),(44,27,3,183),(44,53,5,24),(44,61,14,134),(44,108,7,180),(44,126,6,118),(44,136,1,60),(45,20,4,75),(45,35,1,112),(45,101,11,34),(45,130,10,146),(46,60,6,105),(46,70,8,120),(46,81,2,52),(46,82,2,40),(46,84,13,150),(46,101,3,200),(46,116,2,43),(47,54,2,41),(47,92,5,31),(47,116,13,176),(47,138,5,119),(48,11,7,132),(48,24,1,104),(48,38,14,45),(48,56,1,174),(48,64,14,116),(48,84,5,67),(48,92,9,192),(49,4,2,150),(49,25,1,200),(49,27,4,103),(49,32,11,166),(49,36,6,176),(49,119,4,34),(50,6,2,11),(50,17,8,13),(50,20,14,85),(50,24,1,98),(50,33,7,128),(50,51,3,147),(50,114,7,186),(51,9,4,165),(51,39,3,108),(51,45,10,159),(51,48,8,106),(51,55,11,76),(51,71,9,123),(51,72,1,23),(51,91,10,63),(51,115,5,99),(52,5,9,83),(52,92,3,7),(52,98,7,70),(52,123,6,153),(52,125,4,8),(52,140,6,145),(53,15,2,64),(53,41,14,100),(53,60,4,148),(53,92,14,189),(53,121,11,62),(53,136,5,137),(53,150,1,196),(54,8,1,24),(54,45,10,37),(54,46,10,49),(54,61,14,127),(54,82,9,80),(54,91,1,60),(54,92,3,126),(54,146,10,57),(55,1,6,184),(55,123,4,34),(55,135,6,158),(56,6,14,94),(56,16,14,135),(56,37,12,170),(56,38,2,96),(56,83,13,29),(57,26,3,182),(57,35,10,45),(57,41,7,79),(57,78,10,92),(57,82,3,187),(57,83,4,171),(57,87,9,178),(57,112,12,177),(57,125,5,33),(58,101,10,82),(58,146,13,157),(58,147,1,47),(59,20,12,86),(59,27,6,43),(59,37,14,182),(59,85,11,164),(59,128,11,23),(59,145,4,89),(60,1,11,195),(60,3,7,113),(60,13,11,58),(60,18,6,140),(60,28,13,148),(60,54,3,106),(60,64,8,97),(60,66,14,123),(60,68,12,108),(60,90,7,26);
/*!40000 ALTER TABLE `koleksikartu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasukan`
--

DROP TABLE IF EXISTS `pasukan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasukan` (
  `kartu_id` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `target_serangan` enum('darat','udara','keduanya') NOT NULL,
  `jarak_serangan` int(11) DEFAULT NULL,
  `kecepatan_gerak` varchar(50) DEFAULT NULL,
  `kecepatan_menyerang` decimal(5,2) DEFAULT NULL,
  `tipe_pasukan` enum('darat','udara') NOT NULL,
  PRIMARY KEY (`kartu_id`),
  CONSTRAINT `pasukan_ibfk_1` FOREIGN KEY (`kartu_id`) REFERENCES `kartu` (`kartu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasukan`
--

LOCK TABLES `pasukan` WRITE;
/*!40000 ALTER TABLE `pasukan` DISABLE KEYS */;
INSERT INTO `pasukan` VALUES (6,1683,'udara',5,'lambat',1.71,'udara'),(7,1719,'udara',4,'lambat',1.65,'udara'),(12,1830,'udara',6,'cepat',1.00,'darat'),(16,306,'keduanya',2,'sangat cepat',1.54,'darat'),(17,1272,'udara',6,'sangat cepat',0.93,'udara'),(18,3042,'udara',2,'lambat',0.77,'darat'),(23,2051,'darat',6,'sangat cepat',2.49,'udara'),(25,2935,'udara',6,'lambat',1.60,'udara'),(26,3850,'udara',2,'sedang',2.09,'darat'),(27,697,'darat',2,'sedang',2.08,'darat'),(41,1678,'keduanya',5,'cepat',1.43,'darat'),(42,2706,'darat',1,'cepat',1.30,'udara'),(43,2353,'udara',4,'lambat',0.75,'udara'),(44,2831,'darat',4,'sangat cepat',1.86,'udara'),(46,725,'keduanya',6,'sedang',2.04,'darat'),(47,1972,'keduanya',1,'lambat',1.54,'udara'),(48,874,'darat',3,'sedang',1.19,'udara'),(53,3664,'darat',3,'sedang',1.77,'udara'),(54,712,'keduanya',3,'lambat',1.51,'darat'),(58,2624,'keduanya',2,'sedang',1.82,'udara'),(59,3651,'keduanya',1,'lambat',0.66,'udara'),(63,2867,'darat',5,'sangat cepat',1.74,'darat'),(65,2239,'keduanya',5,'cepat',1.78,'udara'),(66,2178,'darat',6,'sangat cepat',1.09,'darat'),(69,3020,'darat',2,'sangat cepat',1.33,'udara'),(71,1035,'udara',5,'sedang',1.13,'udara'),(76,3207,'udara',4,'sedang',2.02,'darat'),(77,1507,'darat',4,'lambat',1.03,'darat'),(78,777,'darat',1,'cepat',2.39,'udara'),(83,1216,'darat',3,'cepat',0.88,'darat'),(85,2240,'keduanya',4,'sangat cepat',2.26,'udara'),(88,294,'darat',4,'sangat cepat',2.43,'darat'),(91,2589,'udara',1,'lambat',1.06,'udara'),(92,1370,'keduanya',1,'lambat',1.36,'udara'),(93,3179,'udara',4,'cepat',0.59,'darat'),(96,2535,'keduanya',2,'cepat',1.61,'darat'),(97,1782,'keduanya',4,'cepat',2.15,'darat'),(98,727,'darat',4,'cepat',2.09,'udara'),(100,2484,'udara',2,'sedang',1.70,'udara'),(103,2248,'darat',1,'lambat',0.77,'udara'),(105,3493,'udara',5,'sangat cepat',0.80,'darat'),(106,1543,'keduanya',3,'sedang',1.29,'udara'),(110,2631,'udara',5,'sangat cepat',1.92,'udara'),(112,2145,'darat',3,'cepat',1.85,'udara'),(115,2590,'udara',6,'lambat',1.69,'udara'),(118,2885,'keduanya',5,'sedang',1.94,'udara'),(122,898,'keduanya',6,'sangat cepat',0.80,'darat'),(124,329,'keduanya',6,'lambat',0.88,'udara'),(125,1484,'udara',2,'sangat cepat',1.88,'udara'),(126,2255,'keduanya',4,'lambat',1.91,'darat'),(127,2497,'udara',6,'sangat cepat',1.55,'udara'),(129,909,'udara',5,'cepat',1.59,'udara'),(130,2698,'udara',2,'sedang',1.06,'udara'),(132,1121,'udara',3,'sedang',1.88,'udara'),(134,1498,'udara',3,'cepat',1.08,'udara'),(137,3869,'udara',3,'sedang',1.08,'udara'),(139,3125,'darat',3,'sangat cepat',1.81,'udara'),(141,1076,'darat',5,'cepat',2.37,'udara'),(145,762,'darat',5,'sedang',0.98,'darat'),(149,2813,'darat',1,'lambat',1.33,'udara');
/*!40000 ALTER TABLE `pasukan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permintaandonasi`
--

DROP TABLE IF EXISTS `permintaandonasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permintaandonasi` (
  `klan_id` int(11) NOT NULL,
  `urutan` int(11) NOT NULL,
  `jumlah_kartu_diterima` int(11) DEFAULT 0,
  `kartu_id` int(11) NOT NULL,
  PRIMARY KEY (`klan_id`,`urutan`),
  KEY `kartu_id` (`kartu_id`),
  CONSTRAINT `permintaandonasi_ibfk_1` FOREIGN KEY (`klan_id`, `urutan`) REFERENCES `chat` (`klan_id`, `urutan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permintaandonasi_ibfk_2` FOREIGN KEY (`kartu_id`) REFERENCES `kartu` (`kartu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permintaandonasi`
--

LOCK TABLES `permintaandonasi` WRITE;
/*!40000 ALTER TABLE `permintaandonasi` DISABLE KEYS */;
INSERT INTO `permintaandonasi` VALUES (1,3,4,31),(1,5,1,104),(2,1,1,29),(2,2,9,72),(2,4,7,107),(2,8,1,51),(2,9,1,8),(2,13,1,81),(2,14,1,11),(2,15,9,52),(3,3,1,120),(4,4,9,53),(4,5,3,37),(4,6,6,27),(5,1,7,36),(5,2,2,56),(5,3,2,4),(5,6,5,103),(7,1,1,20),(8,1,1,42),(8,2,7,5),(8,3,10,78),(8,4,5,106),(8,5,5,90),(8,6,4,133),(8,14,9,103),(8,15,2,27),(8,16,10,122),(8,17,7,104),(9,3,8,62),(9,9,2,91),(9,10,2,57),(9,11,2,79),(9,14,3,56),(9,15,3,26),(9,16,7,84),(9,17,6,142),(9,18,10,122),(9,19,6,60),(9,20,4,131),(9,21,1,28),(10,1,8,135),(10,2,2,54),(11,2,0,111),(11,4,9,137),(11,5,2,134),(11,6,6,75),(11,7,1,22),(12,1,5,80),(12,3,2,52),(12,5,3,132),(12,6,8,74),(12,7,1,49),(13,2,10,9),(13,5,4,45),(13,6,9,94),(13,7,1,105),(13,8,5,127),(14,1,7,96),(14,2,10,70),(15,2,2,24),(15,6,1,93),(15,9,6,91),(15,10,3,109),(15,11,5,17),(15,12,9,149),(17,3,1,142),(17,10,2,73),(17,11,7,48),(17,12,6,37),(17,13,5,51),(17,14,7,38),(18,1,8,4),(18,2,9,132),(18,3,5,123),(18,4,1,3),(18,5,8,49),(18,6,0,138),(18,7,2,28),(18,8,7,73),(18,9,3,114),(18,10,10,4),(18,11,10,126),(18,12,4,128),(19,1,1,146),(19,2,9,26),(19,5,8,42),(19,7,0,34),(20,3,0,90),(20,5,1,12),(20,6,9,32),(20,7,8,113),(21,3,5,134),(21,4,6,21),(22,1,7,16),(22,5,3,129),(22,6,7,130),(22,7,6,30),(22,8,10,80),(22,9,2,95);
/*!40000 ALTER TABLE `permintaandonasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertarungan`
--

DROP TABLE IF EXISTS `pertarungan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pertarungan` (
  `pertarungan_id` int(11) NOT NULL AUTO_INCREMENT,
  `akun1_id` int(11) NOT NULL,
  `akun2_id` int(11) NOT NULL,
  `nomor_slot_akun1` tinyint(4) NOT NULL,
  `nomor_slot_akun2` tinyint(4) NOT NULL,
  `arena_id` int(11) NOT NULL,
  `pemenang_id` int(11) NOT NULL,
  `waktu_pertarungan` datetime NOT NULL DEFAULT current_timestamp(),
  `replay_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pertarungan_id`),
  KEY `pemenang_id` (`pemenang_id`),
  KEY `akun1_id` (`akun1_id`,`nomor_slot_akun1`),
  KEY `akun2_id` (`akun2_id`,`nomor_slot_akun2`),
  KEY `arena_id` (`arena_id`),
  CONSTRAINT `pertarungan_ibfk_1` FOREIGN KEY (`akun1_id`) REFERENCES `akun` (`akun_id`),
  CONSTRAINT `pertarungan_ibfk_2` FOREIGN KEY (`akun2_id`) REFERENCES `akun` (`akun_id`),
  CONSTRAINT `pertarungan_ibfk_3` FOREIGN KEY (`pemenang_id`) REFERENCES `akun` (`akun_id`),
  CONSTRAINT `pertarungan_ibfk_4` FOREIGN KEY (`akun1_id`, `nomor_slot_akun1`) REFERENCES `deck` (`akun_id`, `nomor_slot`),
  CONSTRAINT `pertarungan_ibfk_5` FOREIGN KEY (`akun2_id`, `nomor_slot_akun2`) REFERENCES `deck` (`akun_id`, `nomor_slot`),
  CONSTRAINT `pertarungan_ibfk_6` FOREIGN KEY (`arena_id`) REFERENCES `arena` (`arena_id`),
  CONSTRAINT `chk_beda_pemain` CHECK (`akun1_id` <> `akun2_id`),
  CONSTRAINT `chk_pemenang` CHECK (`pemenang_id` = `akun1_id` or `pemenang_id` = `akun2_id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertarungan`
--

LOCK TABLES `pertarungan` WRITE;
/*!40000 ALTER TABLE `pertarungan` DISABLE KEYS */;
INSERT INTO `pertarungan` VALUES (1,44,27,3,4,6,27,'2025-12-01 07:11:43','/replays/battle_00039.json'),(2,39,3,3,1,16,39,'2025-12-01 14:12:52','/replays/battle_00038.json'),(3,35,53,1,3,17,53,'2024-10-14 16:20:09','/replays/battle_00002.json'),(4,45,34,5,1,16,34,'2024-09-29 06:07:32','/replays/battle_00037.json'),(5,52,48,1,1,14,52,'2024-07-16 16:33:35','/replays/battle_00030.json'),(6,50,15,1,4,20,15,'2024-07-19 05:49:59','/replays/battle_00012.json'),(7,1,46,1,2,17,1,'2024-10-18 07:03:49','/replays/battle_00041.json'),(8,14,45,3,5,12,14,'2024-04-30 05:16:54','/replays/battle_00027.json'),(9,42,38,1,1,18,38,'2025-03-14 14:12:58','/replays/battle_00023.json'),(10,40,18,5,3,14,18,'2024-05-18 19:34:29','/replays/battle_00023.json'),(11,36,31,1,5,19,31,'2025-08-24 08:01:52','/replays/battle_00045.json'),(12,26,48,2,2,4,26,'2024-12-12 21:07:54','/replays/battle_00050.json'),(13,45,11,5,5,17,11,'2025-09-02 13:36:51','/replays/battle_00021.json'),(14,52,36,1,2,6,36,'2025-05-08 21:35:57',NULL),(15,52,6,5,3,20,6,'2024-03-09 11:03:41','/replays/battle_00004.json'),(16,17,15,4,5,20,17,'2025-07-16 17:33:37','/replays/battle_00024.json'),(17,60,26,3,1,17,26,'2025-07-06 17:17:38','/replays/battle_00038.json'),(18,4,50,3,2,15,4,'2024-06-05 16:05:43','/replays/battle_00042.json'),(19,60,52,3,2,7,60,'2025-08-31 22:03:47','/replays/battle_00038.json'),(20,33,34,4,1,2,34,'2024-07-04 20:04:00','/replays/battle_00041.json'),(21,1,11,1,2,13,11,'2025-06-04 03:24:19','/replays/battle_00025.json'),(22,26,38,2,5,1,26,'2025-12-14 22:42:32','/replays/battle_00005.json'),(23,36,19,1,5,9,36,'2025-04-15 23:25:59','/replays/battle_00012.json'),(24,30,60,3,3,1,60,'2024-05-15 22:53:05','/replays/battle_00026.json'),(25,33,7,4,4,10,7,'2024-03-31 21:12:20','/replays/battle_00032.json'),(26,17,57,1,5,9,57,'2024-10-19 21:17:09','/replays/battle_00036.json'),(27,31,50,3,5,15,50,'2025-11-27 08:24:55','/replays/battle_00037.json'),(28,56,2,2,2,9,56,'2024-10-24 05:32:46','/replays/battle_00040.json'),(29,51,15,4,4,14,15,'2025-02-05 04:20:11','/replays/battle_00034.json'),(30,1,45,1,5,10,1,'2024-11-05 20:36:21','/replays/battle_00043.json'),(31,48,53,5,5,18,48,'2025-01-05 03:38:15','/replays/battle_00020.json'),(32,23,14,4,1,7,14,'2025-07-26 12:46:05','/replays/battle_00012.json'),(33,16,48,3,5,7,16,'2024-06-06 11:50:33','/replays/battle_00015.json'),(34,54,40,5,5,4,54,'2025-12-15 17:33:00','/replays/battle_00005.json'),(35,44,43,2,5,18,44,'2025-10-20 16:03:47','/replays/battle_00030.json'),(36,24,40,5,5,19,40,'2025-01-16 05:16:29','/replays/battle_00011.json'),(37,49,59,3,3,8,49,'2024-02-12 01:23:42','/replays/battle_00033.json'),(38,52,28,4,5,17,28,'2024-11-01 19:24:55','/replays/battle_00043.json'),(39,50,12,2,1,17,12,'2024-09-02 04:09:57','/replays/battle_00044.json'),(40,1,44,1,2,19,1,'2024-09-09 18:34:13','/replays/battle_00023.json'),(41,40,56,5,1,18,56,'2024-07-03 04:35:39','/replays/battle_00017.json'),(42,31,40,5,5,6,40,'2024-11-25 06:52:05','/replays/battle_00013.json'),(43,27,45,5,5,13,45,'2024-12-16 02:11:50','/replays/battle_00011.json'),(44,37,9,3,1,9,37,'2025-03-07 08:17:19','/replays/battle_00027.json'),(45,55,25,4,4,5,25,'2025-09-17 18:44:48',NULL),(46,12,27,3,3,21,27,'2025-09-01 23:40:01','/replays/battle_00031.json'),(47,20,17,4,1,2,17,'2024-03-17 21:01:26','/replays/battle_00044.json'),(48,11,4,5,3,16,11,'2024-12-15 09:54:05','/replays/battle_00047.json'),(49,22,17,2,4,18,17,'2024-09-24 07:14:23','/replays/battle_00001.json'),(50,27,8,5,2,19,27,'2025-08-29 02:00:57','/replays/battle_00018.json'),(51,23,21,4,3,3,21,'2025-04-21 15:31:18','/replays/battle_00018.json'),(52,30,41,4,5,21,41,'2024-11-23 15:13:45','/replays/battle_00040.json'),(53,40,37,5,3,3,40,'2024-09-23 21:38:36','/replays/battle_00014.json'),(54,21,42,1,1,20,42,'2024-07-29 16:25:51','/replays/battle_00028.json'),(55,50,56,5,2,14,50,'2024-05-22 19:53:13','/replays/battle_00001.json'),(56,9,47,1,3,3,9,'2024-05-09 15:26:11','/replays/battle_00025.json'),(57,7,5,3,1,1,5,'2025-02-10 23:44:49','/replays/battle_00048.json'),(58,6,7,1,4,5,6,'2025-05-23 14:57:56','/replays/battle_00024.json'),(59,20,15,3,4,15,20,'2024-04-11 23:10:57','/replays/battle_00033.json'),(60,54,11,1,5,12,11,'2025-11-02 06:37:21','/replays/battle_00030.json'),(61,30,56,5,2,18,56,'2024-04-14 22:43:27','/replays/battle_00044.json'),(62,35,12,4,2,15,12,'2025-02-10 13:59:52','/replays/battle_00040.json'),(63,41,35,2,5,16,41,'2025-09-17 00:50:24','/replays/battle_00005.json'),(64,29,20,3,2,9,29,'2024-08-23 19:00:33',NULL),(65,1,34,1,2,10,34,'2025-02-19 14:57:58',NULL),(66,45,60,5,2,10,45,'2025-08-17 20:50:12','/replays/battle_00027.json'),(67,52,19,1,4,1,19,'2024-05-26 11:13:04','/replays/battle_00026.json'),(68,57,36,3,3,8,57,'2025-07-09 07:24:35','/replays/battle_00047.json'),(69,42,25,3,4,9,42,'2024-11-23 23:06:45','/replays/battle_00040.json'),(70,16,34,4,2,10,34,'2024-11-16 17:05:10','/replays/battle_00012.json'),(71,55,5,4,3,10,55,'2025-05-09 16:32:26','/replays/battle_00029.json'),(72,40,29,5,2,20,29,'2024-05-25 20:38:56','/replays/battle_00020.json'),(73,2,10,2,3,6,2,'2024-08-07 02:59:46','/replays/battle_00017.json'),(74,9,46,3,2,8,9,'2024-04-27 00:56:51',NULL),(75,32,14,2,3,10,14,'2024-10-15 11:20:36','/replays/battle_00029.json'),(76,45,51,5,1,3,45,'2024-02-13 12:37:49','/replays/battle_00017.json'),(77,50,26,1,1,16,50,'2024-05-29 06:43:26','/replays/battle_00016.json'),(78,53,25,5,4,8,25,'2025-08-22 00:40:55','/replays/battle_00028.json'),(79,16,48,1,1,15,16,'2025-02-08 18:44:14','/replays/battle_00042.json'),(80,14,31,3,5,11,14,'2025-05-03 16:28:18','/replays/battle_00046.json'),(81,3,48,4,2,4,48,'2025-01-08 18:46:11','/replays/battle_00040.json'),(82,20,13,5,3,7,20,'2024-07-02 06:43:19','/replays/battle_00040.json'),(83,28,21,5,4,9,28,'2024-11-03 10:24:05','/replays/battle_00050.json'),(84,16,1,1,1,20,16,'2024-10-15 11:22:22','/replays/battle_00049.json'),(85,6,16,4,2,3,16,'2025-12-24 00:16:44','/replays/battle_00048.json'),(86,41,4,1,3,21,41,'2025-06-28 17:42:14','/replays/battle_00034.json'),(87,51,7,4,3,8,7,'2025-03-09 16:24:23','/replays/battle_00050.json'),(88,42,49,1,5,7,42,'2025-06-19 08:33:03','/replays/battle_00024.json'),(89,23,47,4,3,2,47,'2025-07-02 20:27:46','/replays/battle_00028.json'),(90,36,19,3,4,19,36,'2025-02-26 05:49:17','/replays/battle_00022.json'),(91,21,47,3,3,20,21,'2024-02-23 11:57:09','/replays/battle_00033.json'),(92,10,29,4,3,18,29,'2024-12-18 16:38:44',NULL),(93,50,41,2,5,1,41,'2025-08-25 17:59:50','/replays/battle_00039.json'),(94,16,21,1,5,13,16,'2025-02-11 01:22:06','/replays/battle_00043.json'),(95,32,50,3,5,11,50,'2025-05-12 19:18:54','/replays/battle_00020.json'),(96,8,7,2,1,5,8,'2025-11-09 11:05:08','/replays/battle_00002.json'),(97,13,7,4,1,4,13,'2025-03-19 12:26:18','/replays/battle_00041.json'),(98,54,25,2,4,2,25,'2024-06-20 10:34:15','/replays/battle_00038.json'),(99,46,5,2,3,21,5,'2025-12-22 02:41:58','/replays/battle_00005.json'),(100,30,52,2,2,18,52,'2025-09-30 11:41:05','/replays/battle_00023.json'),(101,51,46,4,1,17,51,'2025-07-24 08:21:01','/replays/battle_00004.json'),(102,54,20,1,3,17,54,'2024-03-19 14:58:22','/replays/battle_00046.json'),(103,15,35,3,3,7,15,'2025-03-18 18:05:09','/replays/battle_00040.json'),(104,12,36,2,3,4,36,'2025-06-07 21:27:09','/replays/battle_00029.json'),(105,45,43,5,5,6,45,'2025-03-03 04:05:57','/replays/battle_00025.json'),(106,33,22,4,1,20,22,'2025-12-26 02:04:24','/replays/battle_00022.json'),(107,58,21,4,1,14,21,'2025-10-03 16:38:41','/replays/battle_00046.json'),(108,21,39,4,3,13,39,'2024-10-06 15:02:44','/replays/battle_00028.json'),(109,29,26,1,1,2,26,'2025-04-07 17:49:26','/replays/battle_00001.json'),(110,34,9,2,1,10,34,'2024-06-15 20:35:14','/replays/battle_00020.json'),(111,2,50,1,3,4,2,'2024-12-23 13:54:54','/replays/battle_00022.json'),(112,10,9,4,3,19,10,'2024-06-29 23:19:32','/replays/battle_00016.json'),(113,52,20,3,4,13,52,'2025-07-24 07:42:34','/replays/battle_00004.json'),(114,47,21,3,4,16,47,'2025-04-07 07:54:49','/replays/battle_00041.json'),(115,20,3,4,2,3,20,'2025-12-17 00:55:48','/replays/battle_00049.json'),(116,22,23,2,4,4,22,'2025-08-03 17:44:25','/replays/battle_00041.json'),(117,55,39,4,4,2,39,'2025-02-11 07:12:51','/replays/battle_00002.json'),(118,21,35,5,3,11,21,'2024-04-28 23:48:29','/replays/battle_00003.json'),(119,44,47,2,3,20,44,'2024-06-21 11:58:34','/replays/battle_00027.json'),(120,19,51,5,4,5,51,'2024-03-05 02:45:08','/replays/battle_00030.json'),(121,37,48,3,2,13,48,'2024-03-07 01:59:14','/replays/battle_00025.json'),(122,33,28,4,5,16,33,'2025-01-13 22:23:24','/replays/battle_00025.json'),(123,42,37,4,3,8,42,'2024-07-25 19:23:30','/replays/battle_00049.json'),(124,28,21,5,2,14,21,'2024-10-10 17:04:56','/replays/battle_00022.json'),(125,13,21,2,5,21,13,'2025-08-20 19:53:57','/replays/battle_00019.json'),(126,11,23,1,4,20,11,'2024-12-08 02:50:00','/replays/battle_00002.json'),(127,60,53,5,2,12,60,'2025-08-11 13:10:53','/replays/battle_00046.json'),(128,55,6,4,2,8,55,'2025-11-05 18:43:03','/replays/battle_00018.json'),(129,1,22,1,2,15,22,'2024-01-18 16:03:20','/replays/battle_00021.json'),(130,14,48,2,1,7,48,'2025-03-02 06:22:28','/replays/battle_00030.json'),(131,40,47,5,1,13,40,'2024-07-17 10:03:05','/replays/battle_00010.json'),(132,4,19,3,5,2,19,'2025-05-23 13:34:16',NULL),(133,5,25,2,4,4,5,'2024-08-15 04:30:45','/replays/battle_00041.json'),(134,25,15,4,5,11,15,'2025-11-04 05:48:54','/replays/battle_00038.json'),(135,35,6,3,4,17,6,'2025-03-11 11:58:23','/replays/battle_00045.json'),(136,2,3,4,4,10,3,'2025-01-15 13:00:36','/replays/battle_00025.json'),(137,48,11,1,2,12,11,'2025-04-30 15:09:00','/replays/battle_00019.json'),(138,16,33,5,4,21,33,'2025-11-13 11:43:53','/replays/battle_00024.json'),(139,57,53,2,4,8,57,'2024-09-22 11:21:20','/replays/battle_00025.json'),(140,43,9,5,3,17,43,'2024-11-20 03:39:26','/replays/battle_00015.json'),(141,37,10,5,4,20,10,'2024-12-14 21:07:13','/replays/battle_00034.json'),(142,9,14,1,2,18,9,'2025-10-31 23:47:58','/replays/battle_00008.json'),(143,20,45,4,5,14,20,'2025-05-24 17:02:47','/replays/battle_00036.json'),(144,59,11,1,5,18,59,'2024-05-23 00:31:45','/replays/battle_00020.json'),(145,54,57,3,2,11,57,'2024-11-15 10:17:18','/replays/battle_00019.json'),(146,29,48,2,2,9,29,'2025-08-28 03:37:25','/replays/battle_00012.json'),(147,7,9,1,1,20,9,'2025-04-15 09:17:10','/replays/battle_00036.json'),(148,40,15,5,2,1,15,'2024-03-02 17:31:45','/replays/battle_00044.json'),(149,50,31,3,4,20,31,'2025-07-07 00:59:54','/replays/battle_00041.json'),(150,24,12,5,3,16,24,'2024-05-07 05:11:57','/replays/battle_00012.json'),(151,15,3,3,1,9,3,'2024-06-21 20:42:40','/replays/battle_00047.json'),(152,43,13,5,3,6,13,'2025-11-04 12:27:22','/replays/battle_00039.json'),(153,32,45,2,5,8,45,'2024-11-10 11:15:48','/replays/battle_00049.json'),(154,3,39,2,4,13,3,'2025-02-08 09:36:09','/replays/battle_00006.json'),(155,29,30,1,4,17,30,'2025-07-25 00:33:49','/replays/battle_00002.json'),(156,36,25,2,4,10,25,'2024-11-05 04:00:04','/replays/battle_00019.json'),(157,50,53,5,3,6,53,'2024-08-16 16:22:53','/replays/battle_00039.json'),(158,59,4,5,3,15,4,'2024-03-11 05:56:19','/replays/battle_00046.json'),(159,33,8,4,2,13,8,'2024-09-08 05:44:55','/replays/battle_00028.json'),(160,2,12,3,2,7,12,'2024-03-11 01:04:14','/replays/battle_00016.json'),(161,21,45,4,5,3,21,'2025-07-02 13:01:12','/replays/battle_00028.json'),(162,41,24,1,5,17,41,'2024-10-21 03:04:52','/replays/battle_00035.json'),(163,25,3,4,5,19,25,'2024-05-05 22:12:43','/replays/battle_00009.json'),(164,12,50,2,1,14,50,'2024-08-28 09:50:21','/replays/battle_00046.json'),(165,50,29,5,2,6,50,'2025-11-28 22:02:07','/replays/battle_00008.json'),(166,13,1,2,1,15,1,'2025-10-26 10:01:04','/replays/battle_00031.json'),(167,35,52,1,1,16,35,'2024-06-17 10:49:17','/replays/battle_00037.json'),(168,43,31,4,2,15,43,'2025-04-11 23:29:20','/replays/battle_00038.json'),(169,1,16,1,4,21,1,'2024-02-07 23:54:45','/replays/battle_00011.json'),(170,10,4,4,3,5,10,'2025-06-02 01:43:00','/replays/battle_00036.json'),(171,54,39,5,4,3,54,'2024-03-25 13:48:46','/replays/battle_00026.json'),(172,12,11,2,2,20,12,'2024-12-19 16:06:44','/replays/battle_00047.json'),(173,38,24,2,5,10,24,'2024-10-13 06:37:55','/replays/battle_00024.json'),(174,53,5,3,1,10,5,'2024-04-14 12:06:55','/replays/battle_00007.json'),(175,45,56,5,2,17,56,'2025-02-11 12:06:51','/replays/battle_00013.json'),(176,45,14,5,1,19,45,'2025-01-10 16:07:53','/replays/battle_00046.json'),(177,45,39,5,4,20,39,'2024-07-20 16:24:50','/replays/battle_00033.json'),(178,37,40,5,5,20,40,'2025-02-07 16:01:05','/replays/battle_00046.json'),(179,41,32,4,3,20,41,'2025-07-04 09:01:13','/replays/battle_00018.json'),(180,13,1,3,1,15,13,'2025-07-26 19:24:24','/replays/battle_00013.json'),(181,52,40,4,5,2,40,'2024-09-28 13:56:57','/replays/battle_00035.json'),(182,52,41,5,1,21,52,'2025-06-19 22:51:01','/replays/battle_00018.json'),(183,17,51,5,1,10,51,'2025-08-18 18:31:26',NULL),(184,8,44,4,2,13,8,'2025-10-08 06:24:05','/replays/battle_00011.json'),(185,13,22,2,1,16,22,'2025-09-11 05:53:56','/replays/battle_00002.json'),(186,42,9,3,1,21,9,'2025-11-23 21:10:20','/replays/battle_00034.json'),(187,58,22,4,2,2,22,'2025-03-14 19:17:38','/replays/battle_00046.json'),(188,44,21,3,4,19,21,'2025-09-13 00:25:07','/replays/battle_00050.json'),(189,23,5,4,2,1,5,'2024-10-18 10:59:42','/replays/battle_00040.json'),(190,35,54,3,4,20,54,'2024-05-25 12:59:45','/replays/battle_00038.json'),(191,8,56,4,2,2,56,'2024-11-17 11:05:16','/replays/battle_00005.json'),(192,32,57,3,1,15,57,'2024-06-16 21:08:21','/replays/battle_00033.json'),(193,20,12,1,3,2,20,'2025-12-10 10:08:59','/replays/battle_00005.json'),(194,29,33,1,4,17,29,'2024-05-27 17:48:09','/replays/battle_00021.json'),(195,60,31,3,4,10,31,'2024-04-21 07:12:47','/replays/battle_00049.json'),(196,56,7,1,1,2,7,'2024-10-28 01:10:04','/replays/battle_00045.json'),(197,56,34,1,1,10,56,'2025-06-17 15:35:01','/replays/battle_00038.json'),(198,56,6,2,3,2,56,'2025-02-08 08:16:18','/replays/battle_00049.json'),(199,43,48,4,1,19,48,'2025-05-11 05:02:34','/replays/battle_00013.json'),(200,21,13,4,2,9,13,'2025-08-23 05:47:44','/replays/battle_00028.json'),(201,43,8,4,2,6,8,'2024-03-29 21:41:47',NULL),(202,40,36,5,4,18,36,'2025-03-02 16:55:05','/replays/battle_00020.json'),(203,18,10,5,3,6,18,'2024-08-29 20:29:54','/replays/battle_00039.json'),(204,58,22,4,3,5,58,'2024-12-31 15:08:49','/replays/battle_00043.json'),(205,4,7,3,1,3,7,'2024-10-31 09:51:28','/replays/battle_00011.json'),(206,46,39,5,4,10,39,'2025-09-26 22:13:22','/replays/battle_00012.json'),(207,46,49,2,5,19,46,'2024-03-13 04:04:58','/replays/battle_00044.json'),(208,30,7,3,3,21,7,'2024-12-31 11:36:39','/replays/battle_00014.json'),(209,15,10,4,4,13,15,'2025-06-27 09:45:42','/replays/battle_00042.json'),(210,22,51,2,1,16,22,'2024-02-20 18:29:44','/replays/battle_00030.json'),(211,8,23,4,4,6,23,'2025-08-19 11:28:02','/replays/battle_00022.json'),(212,39,37,3,3,13,39,'2024-09-10 02:39:07','/replays/battle_00035.json'),(213,42,5,1,4,13,5,'2024-07-04 07:21:56','/replays/battle_00039.json'),(214,16,36,3,3,13,16,'2024-09-21 15:22:20','/replays/battle_00013.json'),(215,53,45,3,5,19,45,'2025-02-26 22:43:00','/replays/battle_00044.json'),(216,16,12,1,2,19,12,'2024-03-29 19:07:57','/replays/battle_00037.json'),(217,39,30,4,5,4,30,'2024-05-16 20:07:17','/replays/battle_00019.json'),(218,26,5,1,1,20,5,'2024-09-11 07:19:55','/replays/battle_00031.json'),(219,42,43,2,5,7,42,'2025-11-20 03:45:13','/replays/battle_00037.json'),(220,58,49,2,1,5,49,'2025-02-16 15:19:34','/replays/battle_00018.json'),(221,25,40,4,5,7,40,'2024-08-20 19:28:17','/replays/battle_00036.json'),(222,51,59,1,3,12,51,'2025-03-28 14:49:05',NULL),(223,40,33,5,4,10,40,'2024-10-13 18:48:48','/replays/battle_00035.json'),(224,4,1,3,1,10,4,'2024-07-01 17:12:47','/replays/battle_00027.json'),(225,45,38,5,1,13,38,'2024-10-23 08:53:16','/replays/battle_00027.json'),(226,35,14,3,3,5,35,'2025-03-07 09:48:31','/replays/battle_00024.json'),(227,54,60,5,2,5,60,'2025-11-08 20:58:20','/replays/battle_00042.json'),(228,9,1,1,1,5,1,'2025-05-26 00:38:33','/replays/battle_00027.json'),(229,9,6,1,3,15,6,'2025-04-29 02:11:37','/replays/battle_00011.json'),(230,30,33,3,4,13,33,'2024-06-24 08:06:56','/replays/battle_00011.json'),(231,28,39,5,4,8,39,'2024-11-15 02:34:18','/replays/battle_00034.json'),(232,37,24,3,5,19,24,'2025-07-01 11:57:46','/replays/battle_00023.json'),(233,8,38,4,2,5,38,'2024-12-27 03:02:28','/replays/battle_00033.json'),(234,6,34,5,1,8,34,'2025-05-04 20:24:27','/replays/battle_00047.json'),(235,43,5,4,1,11,43,'2024-12-30 04:20:53','/replays/battle_00029.json'),(236,33,58,4,4,14,58,'2025-09-11 23:57:33','/replays/battle_00018.json'),(237,19,11,4,1,20,11,'2025-07-18 15:44:05','/replays/battle_00050.json'),(238,37,17,3,1,16,37,'2025-03-20 22:53:03','/replays/battle_00003.json'),(239,43,19,5,5,16,43,'2024-04-08 12:07:15','/replays/battle_00032.json'),(240,5,55,2,1,5,55,'2024-08-01 18:25:07','/replays/battle_00016.json'),(241,1,48,1,2,6,1,'2025-05-26 23:33:06','/replays/battle_00028.json'),(242,24,52,5,2,8,52,'2024-05-20 10:31:39','/replays/battle_00033.json'),(243,56,3,2,1,5,56,'2025-10-12 14:15:38','/replays/battle_00031.json'),(244,49,27,5,3,15,49,'2024-06-12 18:39:16','/replays/battle_00036.json'),(245,47,54,3,1,21,54,'2025-08-09 19:14:28','/replays/battle_00007.json'),(246,4,11,3,2,16,11,'2025-01-04 22:14:46','/replays/battle_00047.json'),(247,49,60,1,2,13,60,'2024-07-22 23:41:15','/replays/battle_00009.json'),(248,34,56,2,1,10,56,'2024-10-23 17:04:20','/replays/battle_00043.json'),(249,21,34,2,1,18,34,'2025-10-17 17:45:39','/replays/battle_00027.json'),(250,40,59,5,1,9,59,'2025-09-15 04:15:39','/replays/battle_00006.json'),(251,17,42,1,3,15,17,'2025-07-24 08:35:41','/replays/battle_00043.json'),(252,38,50,4,5,6,50,'2025-03-01 08:14:16',NULL),(253,44,1,3,1,14,44,'2025-02-11 23:38:08','/replays/battle_00006.json'),(254,44,29,2,1,10,29,'2024-05-29 23:15:48','/replays/battle_00002.json'),(255,2,40,2,5,20,2,'2025-04-10 13:20:44','/replays/battle_00040.json'),(256,8,46,2,2,20,8,'2024-10-19 00:22:23','/replays/battle_00042.json'),(257,49,58,1,2,6,58,'2024-08-16 19:09:25','/replays/battle_00029.json'),(258,43,60,5,3,15,60,'2025-08-20 13:53:37','/replays/battle_00027.json'),(259,45,58,5,4,6,45,'2024-08-03 09:00:47','/replays/battle_00049.json'),(260,4,25,3,4,2,25,'2025-09-23 07:42:22','/replays/battle_00016.json'),(261,12,29,1,3,7,29,'2024-05-18 14:24:11','/replays/battle_00041.json'),(262,32,7,3,4,14,32,'2025-04-21 21:09:40','/replays/battle_00041.json'),(263,7,59,3,1,4,7,'2024-02-26 15:19:05','/replays/battle_00004.json'),(264,37,47,5,3,1,47,'2024-04-25 14:50:41','/replays/battle_00041.json'),(265,41,1,1,1,9,41,'2025-06-27 17:58:29','/replays/battle_00021.json'),(266,58,26,2,1,16,26,'2024-12-04 16:42:14','/replays/battle_00025.json'),(267,55,47,4,1,1,47,'2025-06-19 08:45:43','/replays/battle_00049.json'),(268,31,8,4,4,11,8,'2024-11-07 04:00:04','/replays/battle_00003.json'),(269,41,42,1,1,18,42,'2024-03-03 11:49:23','/replays/battle_00029.json'),(270,49,50,3,3,6,49,'2024-10-25 09:19:47','/replays/battle_00042.json'),(271,13,20,4,1,21,20,'2025-01-12 21:05:00','/replays/battle_00005.json'),(272,57,41,3,5,5,57,'2024-05-29 23:30:33','/replays/battle_00001.json'),(273,47,38,1,3,13,47,'2025-09-07 17:43:45','/replays/battle_00034.json'),(274,42,20,3,4,15,42,'2024-01-29 18:31:32','/replays/battle_00021.json'),(275,4,22,3,2,4,4,'2025-09-18 21:30:12','/replays/battle_00041.json'),(276,43,34,4,1,19,43,'2025-12-19 07:48:58','/replays/battle_00004.json'),(277,3,48,3,5,21,3,'2025-01-01 00:10:14','/replays/battle_00039.json'),(278,3,16,3,1,6,3,'2025-12-03 16:07:42','/replays/battle_00019.json'),(279,53,51,5,1,20,53,'2025-10-10 20:05:34','/replays/battle_00037.json'),(280,5,53,1,5,16,5,'2024-02-19 00:27:27','/replays/battle_00012.json'),(281,28,22,5,2,4,28,'2024-09-06 18:52:11','/replays/battle_00050.json'),(282,14,49,1,1,11,14,'2024-04-03 18:51:32','/replays/battle_00017.json'),(283,10,49,4,1,12,10,'2024-12-06 17:14:15','/replays/battle_00015.json'),(284,60,38,5,4,4,38,'2025-08-27 00:39:49','/replays/battle_00010.json'),(285,2,57,3,2,1,2,'2024-05-19 08:29:52','/replays/battle_00005.json'),(286,46,42,1,3,16,46,'2024-06-09 03:06:18','/replays/battle_00009.json'),(287,41,18,4,2,8,41,'2025-04-19 05:15:10','/replays/battle_00044.json'),(288,3,39,3,4,20,3,'2025-05-02 03:41:59','/replays/battle_00050.json'),(289,20,23,2,4,18,20,'2024-05-29 01:19:43','/replays/battle_00007.json'),(290,34,7,2,4,17,34,'2024-12-26 13:36:48','/replays/battle_00049.json'),(291,41,43,5,4,2,41,'2024-03-28 12:29:27','/replays/battle_00050.json'),(292,10,44,4,2,6,10,'2025-06-04 12:21:50','/replays/battle_00002.json'),(293,4,42,3,1,7,42,'2024-07-14 06:05:45','/replays/battle_00021.json'),(294,40,52,5,3,4,40,'2025-12-19 08:39:54','/replays/battle_00034.json'),(295,12,11,1,2,17,12,'2024-02-25 00:55:00','/replays/battle_00015.json'),(296,47,29,3,3,7,29,'2024-06-27 16:41:22','/replays/battle_00049.json'),(297,8,21,2,2,8,21,'2025-11-06 15:51:21','/replays/battle_00012.json'),(298,25,58,4,2,16,58,'2024-02-12 04:57:32','/replays/battle_00027.json'),(299,10,14,4,1,13,14,'2024-04-15 22:45:58','/replays/battle_00029.json'),(300,47,13,3,2,7,13,'2024-04-08 19:23:57','/replays/battle_00002.json');
/*!40000 ALTER TABLE `pertarungan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanbiasa`
--

DROP TABLE IF EXISTS `pesanbiasa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesanbiasa` (
  `klan_id` int(11) NOT NULL,
  `urutan` int(11) NOT NULL,
  `pesan_teks` text NOT NULL,
  PRIMARY KEY (`klan_id`,`urutan`),
  CONSTRAINT `pesanbiasa_ibfk_1` FOREIGN KEY (`klan_id`, `urutan`) REFERENCES `chat` (`klan_id`, `urutan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanbiasa`
--

LOCK TABLES `pesanbiasa` WRITE;
/*!40000 ALTER TABLE `pesanbiasa` DISABLE KEYS */;
INSERT INTO `pesanbiasa` VALUES (1,1,'Butuh co-leader baru.'),(1,2,'Push trophy yuk!'),(1,4,'Yang aktif like ya.'),(2,5,'Congrats naik arena!'),(2,7,'Keren banget main tadi.'),(2,10,'Lawan tadi kuat banget.'),(2,11,'Tolong donasi Goblin.'),(2,12,'Deck apa yang OP sekarang?'),(3,1,'GG semua!'),(4,3,'Congrats naik arena!'),(5,4,'Ada yang online?'),(5,5,'Ayo aktif semuanya.'),(7,2,'Selamat bergabung!'),(7,3,'Ayo aktif semuanya.'),(8,7,'Selamat bergabung!'),(8,8,'Ada yang online?'),(8,9,'Ada yang online?'),(8,10,'Ayo aktif semuanya.'),(9,1,'Keren banget main tadi.'),(9,2,'Keren banget main tadi.'),(9,4,'Next war harus menang.'),(9,6,'Deck apa yang OP sekarang?'),(9,8,'Ada yang online?'),(9,12,'Push trophy yuk!'),(9,13,'Selamat bergabung!'),(11,1,'Yang aktif like ya.'),(11,3,'Mari push bareng!'),(12,2,'GG semua!'),(12,4,'Ayo aktif semuanya.'),(13,1,'Next war harus menang.'),(15,1,'Push trophy yuk!'),(15,3,'Congrats naik arena!'),(15,4,'Yang aktif like ya.'),(15,5,'Push trophy yuk!'),(15,8,'Butuh co-leader baru.'),(17,1,'Ada yang online?'),(17,2,'Butuh co-leader baru.'),(17,4,'Kapan war berikutnya?'),(17,5,'Butuh co-leader baru.'),(17,8,'Request donasi dong.'),(17,9,'Congrats naik arena!'),(19,4,'Selamat bergabung!'),(20,1,'Request donasi dong.'),(20,4,'Congrats naik arena!'),(21,1,'Next war harus menang.'),(21,2,'Deck apa yang OP sekarang?'),(21,5,'Deck apa yang OP sekarang?'),(21,6,'Congrats naik arena!'),(22,3,'Request donasi dong.'),(22,4,'Salut buat yang top donor!');
/*!40000 ALTER TABLE `pesanbiasa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rarity`
--

DROP TABLE IF EXISTS `rarity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rarity` (
  `nama_rarity` varchar(50) NOT NULL,
  `max_terima_donasi` int(11) NOT NULL,
  `jumlah_untuk_upgrade` int(11) NOT NULL,
  `gold_dibutuhkan` int(11) NOT NULL,
  PRIMARY KEY (`nama_rarity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rarity`
--

LOCK TABLES `rarity` WRITE;
/*!40000 ALTER TABLE `rarity` DISABLE KEYS */;
INSERT INTO `rarity` VALUES ('Ancient',2,4,90000),('Blaze',4,11,35000),('Celestial',1,2,120000),('Champion',1,3,100000),('Common',10,50,2000),('Crystal',7,25,15000),('Epic',4,10,50000),('Frost',6,18,22000),('Infernal',3,7,70000),('Legendary',2,5,80000),('Mythic',3,8,60000),('Nature',8,28,12000),('Rare',8,30,10000),('Shadow',5,15,25000),('Spectral',2,3,110000),('Storm',4,12,40000),('SuperRare',6,20,30000),('Thunder',5,14,28000),('Ultra',1,2,150000),('Void',1,1,200000);
/*!40000 ALTER TABLE `rarity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sihir`
--

DROP TABLE IF EXISTS `sihir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sihir` (
  `kartu_id` int(11) NOT NULL,
  `radius_serangan` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`kartu_id`),
  CONSTRAINT `sihir_ibfk_1` FOREIGN KEY (`kartu_id`) REFERENCES `kartu` (`kartu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sihir`
--

LOCK TABLES `sihir` WRITE;
/*!40000 ALTER TABLE `sihir` DISABLE KEYS */;
INSERT INTO `sihir` VALUES (11,1.70),(19,6.40),(21,1.04),(22,4.85),(28,7.50),(36,3.85),(37,7.55),(40,7.15),(49,4.34),(51,2.40),(56,7.75),(57,3.25),(60,5.52),(62,7.36),(72,1.63),(74,5.02),(82,4.75),(86,6.06),(95,7.56),(101,7.39),(102,2.23),(107,7.18),(108,2.23),(114,7.44),(119,7.98),(123,3.78),(135,4.47),(138,7.56),(146,7.73),(150,7.48),(151,6.32),(152,7.57),(153,6.55),(154,5.62),(155,3.21),(156,3.54),(157,4.24),(158,5.17),(159,1.16),(160,1.60),(161,4.66),(162,4.82),(163,6.45),(164,2.01),(165,6.59),(166,3.01),(167,3.79),(168,7.16),(169,6.98),(170,6.35);
/*!40000 ALTER TABLE `sihir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `akunarena`
--

/*!50001 DROP VIEW IF EXISTS `akunarena`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `akunarena` AS select `a`.`akun_id` AS `akun_id`,`a`.`username` AS `username`,`a`.`jumlah_piala` AS `jumlah_piala`,`ar`.`arena_id` AS `current_arena_id`,`ar`.`nama_arena` AS `current_arena_nama`,`ar`.`piala_dibutuhkan` AS `current_arena_piala_min` from (`akun` `a` join `arena` `ar` on(`ar`.`arena_id` = (select `arena`.`arena_id` from `arena` where `arena`.`piala_dibutuhkan` <= `a`.`jumlah_piala` order by `arena`.`piala_dibutuhkan` desc limit 1))) */;
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

-- Dump completed on 2026-05-09 21:42:13
