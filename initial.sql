-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: ProgEdu
-- ------------------------------------------------------
-- Server version	5.7.36

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

CREATE SCHEMA ProgEdu DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;


use ProgEdu;
--
-- Table structure for table `Assessment_Action`
--

DROP TABLE IF EXISTS `Assessment_Action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assessment_Action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assessment_Action`
--

LOCK TABLES `Assessment_Action` WRITE;
/*!40000 ALTER TABLE `Assessment_Action` DISABLE KEYS */;
INSERT INTO `Assessment_Action` VALUES (1,'Auto'),(2,'Do'),(3,'Review');
/*!40000 ALTER TABLE `Assessment_Action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assessment_Time`
--

DROP TABLE IF EXISTS `Assessment_Time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assessment_Time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aId` int(11) DEFAULT NULL,
  `aaId` int(11) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY ` A_T_aaId_idx` (`aaId`),
  KEY `A_T_aId_idx` (`aId`),
  CONSTRAINT ` A_T_aaId` FOREIGN KEY (`aaId`) REFERENCES `Assessment_Action` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `A_T_aId` FOREIGN KEY (`aId`) REFERENCES `Assignment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assessment_Time`
--

LOCK TABLES `Assessment_Time` WRITE;
/*!40000 ALTER TABLE `Assessment_Time` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assessment_Time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assignment`
--

DROP TABLE IF EXISTS `Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(3000) CHARACTER SET utf8 DEFAULT NULL,
  `hasTemplate` tinyint(1) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `zipChecksum` bigint(19) DEFAULT NULL,
  `zipUrl` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `gitLabId` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `A_type_idx` (`type`),
  CONSTRAINT `A_type` FOREIGN KEY (`type`) REFERENCES `Assignment_Type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment`
--

LOCK TABLES `Assignment` WRITE;
/*!40000 ALTER TABLE `Assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assignment_Assessment`
--

DROP TABLE IF EXISTS `Assignment_Assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assignment_Assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `A_S_id_idx` (`status`),
  CONSTRAINT `A_A_status` FOREIGN KEY (`status`) REFERENCES `Commit_Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment_Assessment`
--

LOCK TABLES `Assignment_Assessment` WRITE;
/*!40000 ALTER TABLE `Assignment_Assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assignment_Assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assignment_Score`
--

DROP TABLE IF EXISTS `Assignment_Score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assignment_Score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auId` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY ` A_U_auId_idx` (`auId`),
  CONSTRAINT ` A_S_auId` FOREIGN KEY (`auId`) REFERENCES `Assignment_User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment_Score`
--

LOCK TABLES `Assignment_Score` WRITE;
/*!40000 ALTER TABLE `Assignment_Score` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assignment_Score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assignment_Type`
--

DROP TABLE IF EXISTS `Assignment_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assignment_Type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment_Type`
--

LOCK TABLES `Assignment_Type` WRITE;
/*!40000 ALTER TABLE `Assignment_Type` DISABLE KEYS */;
INSERT INTO `Assignment_Type` VALUES (1,'javac'),(2,'maven'),(3,'web'),(4,'android'),(5,'python'),(6,'exam');
/*!40000 ALTER TABLE `Assignment_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assignment_User`
--

DROP TABLE IF EXISTS `Assignment_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Assignment_User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aId` int(11) DEFAULT NULL,
  `uId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `A_id_idx` (`aId`),
  KEY `A_U_uid_idx` (`uId`),
  CONSTRAINT `A_U_aid` FOREIGN KEY (`aId`) REFERENCES `Assignment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `A_U_uid` FOREIGN KEY (`uId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment_User`
--

LOCK TABLES `Assignment_User` WRITE;
/*!40000 ALTER TABLE `Assignment_User` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assignment_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commit_Record`
--

DROP TABLE IF EXISTS `Commit_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Commit_Record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auId` int(11) DEFAULT NULL,
  `commitNumber` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `A_U_id_idx` (`auId`),
  KEY `C_S_id_idx` (`status`),
  CONSTRAINT `C_R_auid` FOREIGN KEY (`auId`) REFERENCES `Assignment_User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `C_R_status` FOREIGN KEY (`status`) REFERENCES `Commit_Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commit_Record`
--

LOCK TABLES `Commit_Record` WRITE;
/*!40000 ALTER TABLE `Commit_Record` DISABLE KEYS */;
/*!40000 ALTER TABLE `Commit_Record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commit_Status`
--

DROP TABLE IF EXISTS `Commit_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Commit_Status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commit_Status`
--

LOCK TABLES `Commit_Status` WRITE;
/*!40000 ALTER TABLE `Commit_Status` DISABLE KEYS */;
INSERT INTO `Commit_Status` VALUES (1,'bs'),(2,'csf'),(3,'cpf'),(4,'ini'),(5,'utf'),(6,'whf'),(7,'wsf'),(8,'wef'),(9,'uitf'),(10,'alf'),(11,'cpfout');
/*!40000 ALTER TABLE `Commit_Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gitLabId` int(11) DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leader` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Group_User`
--

DROP TABLE IF EXISTS `Group_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Group_User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) DEFAULT NULL,
  `gId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `U_id_idx` (`uId`),
  KEY `G_id_idx` (`gId`),
  KEY `G_U_uid_idx` (`uId`),
  KEY `G_U_gid_idx` (`gId`),
  CONSTRAINT `G_U_gid` FOREIGN KEY (`gId`) REFERENCES `Group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `G_U_uid` FOREIGN KEY (`uId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group_User`
--

LOCK TABLES `Group_User` WRITE;
/*!40000 ALTER TABLE `Group_User` DISABLE KEYS */;
/*!40000 ALTER TABLE `Group_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pair_Matching`
--

DROP TABLE IF EXISTS `Pair_Matching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pair_Matching` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auId` int(11) DEFAULT NULL,
  `reviewId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_M_reviewId_idx` (`reviewId`),
  KEY `P_M_auId_idx` (`auId`),
  CONSTRAINT `P_M_auId` FOREIGN KEY (`auId`) REFERENCES `Assignment_User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `P_M_reviewId` FOREIGN KEY (`reviewId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pair_Matching`
--

LOCK TABLES `Pair_Matching` WRITE;
/*!40000 ALTER TABLE `Pair_Matching` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pair_Matching` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `description` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `gitLabId` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `releaseTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `A_T_id_idx` (`type`),
  KEY `P_type_idx` (`type`),
  CONSTRAINT `P_type` FOREIGN KEY (`type`) REFERENCES `Assignment_Type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_Commit_Record`
--

DROP TABLE IF EXISTS `Project_Commit_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project_Commit_Record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pgId` int(11) DEFAULT NULL,
  `commitNumber` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `commitStudent` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_C_R_pgid_idx` (`pgId`),
  KEY `P_C_R_status_idx` (`status`),
  CONSTRAINT `P_C_R_pgid` FOREIGN KEY (`pgId`) REFERENCES `Project_Group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `P_C_R_status` FOREIGN KEY (`status`) REFERENCES `Commit_Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_Commit_Record`
--

LOCK TABLES `Project_Commit_Record` WRITE;
/*!40000 ALTER TABLE `Project_Commit_Record` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_Commit_Record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_Group`
--

DROP TABLE IF EXISTS `Project_Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project_Group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pId` int(11) DEFAULT NULL,
  `gId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_G_pid_idx` (`pId`),
  KEY `P_G_gid_idx` (`gId`),
  CONSTRAINT `P_G_gid` FOREIGN KEY (`gId`) REFERENCES `Group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `P_G_pid` FOREIGN KEY (`pId`) REFERENCES `Project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_Group`
--

LOCK TABLES `Project_Group` WRITE;
/*!40000 ALTER TABLE `Project_Group` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_Screenshot_Record`
--

DROP TABLE IF EXISTS `Project_Screenshot_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project_Screenshot_Record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcrid` int(11) DEFAULT NULL,
  `pngUrl` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `P_S_R_pcrid_idx` (`pcrid`),
  CONSTRAINT `P_S_R_pcrid` FOREIGN KEY (`pcrid`) REFERENCES `Project_Commit_Record` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_Screenshot_Record`
--

LOCK TABLES `Project_Screenshot_Record` WRITE;
/*!40000 ALTER TABLE `Project_Screenshot_Record` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_Screenshot_Record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review_Category`
--

DROP TABLE IF EXISTS `Review_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review_Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `metrics` varchar(3000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review_Category`
--

LOCK TABLES `Review_Category` WRITE;
/*!40000 ALTER TABLE `Review_Category` DISABLE KEYS */;
INSERT INTO `Review_Category` VALUES (1,'功能性Functionality','身為審查人員通常需要考量到極端案例, 尋找併發性問題並且確保功能沒有錯誤, 試著像客戶方使用及思考'),(2,'可讀性Readability','包括函數的命名是否淺顯易懂, 程式碼是否整齊讓人容易閱讀, 讓審查人員能有清晰的思緒去審查程式碼'),(3,'註解Comments','註解是為了解釋為什麼某些程式碼存在是有用的, 因此有兩個要件:1. 作者能夠完整表達意思 2. 讀者能夠清楚理解作者的意思'),(4,'複雜度Complexity','\"太複雜\"通常表示閱讀人員很難立即理解, 也表示開發人員在飲用或修改此程式碼時可能引入錯誤, 或者是過度設計導致, 造成效率降低');
/*!40000 ALTER TABLE `Review_Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review_Metrics`
--

DROP TABLE IF EXISTS `Review_Metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review_Metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL,
  `mode` int(11) DEFAULT NULL,
  `metrics` varchar(3000) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(3000) COLLATE utf8_bin DEFAULT NULL,
  `link` varchar(3000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `R_M_category_idx` (`category`),
  KEY `R_M_mode_idx` (`mode`),
  CONSTRAINT `R_M_category` FOREIGN KEY (`category`) REFERENCES `Review_Category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_M_mode` FOREIGN KEY (`mode`) REFERENCES `Score_Mode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review_Metrics`
--

LOCK TABLES `Review_Metrics` WRITE;
/*!40000 ALTER TABLE `Review_Metrics` DISABLE KEYS */;
INSERT INTO `Review_Metrics` VALUES (1,1,1,'符合題目要求','這次的提交是否達到開發者的預期目的?也就是學生是否達到老師題目要求','https://www.w3schools.com/'),(2,2,1,'排版是否整齊','不規則的排版會造成審查人員在閱讀上會有困難，因此會花更多的時間去理解造成效率低','https://github.com/twitter-archive/commons/blob/master/src/java/com/twitter/common/styleguide.md'),(3,2,1,'符合變數名稱格式','審查人員需要找到一個對應的、真實的實質資料時，好的命名能減少審查人員的理解時間並提高效率','https://github.com/twitter-archive/commons/blob/master/src/java/com/twitter/common/styleguide.md'),(4,3,1,'函式標示註解','註解是\"解釋函式為什麼有時是有用的\"，而不是解釋函式裡面在做什麼，註解像是決策背後的原因','https://github.com/twitter-archive/commons/blob/master/src/java/com/twitter/common/styleguide.md'),(5,4,1,'是否過度設計','太複雜通常表示\"審查人員很難立即理解\"，這也表示\"開發人員在引用或修改此程式碼可能引入錯誤\"','https://www.w3schools.com/'),(6,2,1,'括號是否一致','括號對齊有助於排版的整潔性，整齊的排版能讓審查人員更輕易的讀懂程式碼','https://google.github.io/styleguide/javaguide.html'),(7,2,1,'變數命名是否符合程式撰寫標準','每次只宣告一個變數，且需要使用變數時才宣告變數，並對變數進行初始化','https://google.github.io/styleguide/javaguide.html'),(8,2,1,'類別命名是否符合程式撰寫標準','類別命名需以UpperCamelCase(每一個單字的首字母都採用大寫字母)的方法命名，通常會以名詞或形容詞組成\n','https://google.github.io/styleguide/javaguide.html'),(9,2,1,'方法命名是否符合程式撰寫標準','方法命名需以lowerCamelCase(第一個單字以小寫字母開始，第二個單字的首字母大寫)的方法命名，通常會以動詞組成\n','https://google.github.io/styleguide/javaguide.html'),(10,2,1,'是否每行程式碼只有一個陳述(Statement)','每行只能有一個陳述 (Statement)會使程式碼較容易閱讀','https://google.github.io/styleguide/javaguide.html'),(11,3,1,'是否有註解說明類別用途','易理解的註解能讓閱讀者更容易理解該類別之用途','https://google.github.io/styleguide/javaguide.html'),(12,3,1,'是否有註解說明方法用途','易理解的註解能讓閱讀者更容易理解該方法之用途','https://google.github.io/styleguide/javaguide.html'),(13,3,1,'註解是否符合JavaDoc規範','撰寫JavaDoc可以讓其他人在閱讀程式碼時，更容易理解該類別或該方法的規格','https://google.github.io/styleguide/javaguide.html'),(14,1,1,'是否編譯成功','在執行程式碼時，程式碼是否能夠被編譯成功','');
/*!40000 ALTER TABLE `Review_Metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review_Record`
--

DROP TABLE IF EXISTS `Review_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review_Record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rrsId` int(11) DEFAULT NULL,
  `rsmId` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `feedback` varchar(3000) COLLATE utf8_bin DEFAULT NULL,
  `reviewScore` int(11) DEFAULT '-1',
  `teacherReview` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `R_R_armId_idx` (`rsmId`),
  KEY `R_R_rrsId` (`rrsId`),
  CONSTRAINT `R_R_rrsId` FOREIGN KEY (`rrsId`) REFERENCES `Review_Record_Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_R_rsmId` FOREIGN KEY (`rsmId`) REFERENCES `Review_Setting_Metrics` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review_Record`
--

LOCK TABLES `Review_Record` WRITE;
/*!40000 ALTER TABLE `Review_Record` DISABLE KEYS */;
/*!40000 ALTER TABLE `Review_Record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review_Record_Status`
--

DROP TABLE IF EXISTS `Review_Record_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review_Record_Status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pmId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `round` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `R_R_S_pmId_idx` (`pmId`),
  KEY `R_R_S_status_idx` (`status`),
  CONSTRAINT `R_R_S_pmId` FOREIGN KEY (`pmId`) REFERENCES `Pair_Matching` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_R_S_status` FOREIGN KEY (`status`) REFERENCES `Review_Status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review_Record_Status`
--

LOCK TABLES `Review_Record_Status` WRITE;
/*!40000 ALTER TABLE `Review_Record_Status` DISABLE KEYS */;
/*!40000 ALTER TABLE `Review_Record_Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review_Setting`
--

DROP TABLE IF EXISTS `Review_Setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review_Setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aId` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `round` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `R_S_aId_idx` (`aId`),
  CONSTRAINT `R_S_aId` FOREIGN KEY (`aId`) REFERENCES `Assignment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review_Setting`
--

LOCK TABLES `Review_Setting` WRITE;
/*!40000 ALTER TABLE `Review_Setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `Review_Setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review_Setting_Metrics`
--

DROP TABLE IF EXISTS `Review_Setting_Metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review_Setting_Metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rsId` int(11) DEFAULT NULL,
  `rmId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `A_R_M_rmId_idx` (`rmId`),
  KEY `A_R_M_aId_idx` (`rsId`),
  CONSTRAINT `R_S_M_rmId` FOREIGN KEY (`rmId`) REFERENCES `Review_Metrics` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_S_M_rsId` FOREIGN KEY (`rsId`) REFERENCES `Review_Setting` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review_Setting_Metrics`
--

LOCK TABLES `Review_Setting_Metrics` WRITE;
/*!40000 ALTER TABLE `Review_Setting_Metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `Review_Setting_Metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review_Status`
--

DROP TABLE IF EXISTS `Review_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review_Status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review_Status`
--

LOCK TABLES `Review_Status` WRITE;
/*!40000 ALTER TABLE `Review_Status` DISABLE KEYS */;
INSERT INTO `Review_Status` VALUES (1,'initialization'),(2,'uncompleted'),(3,'completed');
/*!40000 ALTER TABLE `Review_Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'teacher'),(2,'student');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role_User`
--

DROP TABLE IF EXISTS `Role_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role_User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) DEFAULT NULL,
  `rId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `R_U_uid_idx` (`uId`),
  KEY `R_U_rid_idx` (`rId`),
  CONSTRAINT `R_U_rid` FOREIGN KEY (`rId`) REFERENCES `Role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_U_uid` FOREIGN KEY (`uId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role_User`
--

LOCK TABLES `Role_User` WRITE;
/*!40000 ALTER TABLE `Role_User` DISABLE KEYS */;
/*!40000 ALTER TABLE `Role_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Score_Mode`
--

DROP TABLE IF EXISTS `Score_Mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Score_Mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Score_Mode`
--

LOCK TABLES `Score_Mode` WRITE;
/*!40000 ALTER TABLE `Score_Mode` DISABLE KEYS */;
INSERT INTO `Score_Mode` VALUES (1,'yesNoMode'),(2,'numberScoreMode');
/*!40000 ALTER TABLE `Score_Mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Screenshot_Record`
--

DROP TABLE IF EXISTS `Screenshot_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Screenshot_Record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crId` int(11) DEFAULT NULL,
  `pngUrl` varchar(2083) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `S_R_crid_idx` (`crId`),
  CONSTRAINT `S_R_crid` FOREIGN KEY (`crId`) REFERENCES `Commit_Record` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Screenshot_Record`
--

LOCK TABLES `Screenshot_Record` WRITE;
/*!40000 ALTER TABLE `Screenshot_Record` DISABLE KEYS */;
/*!40000 ALTER TABLE `Screenshot_Record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gitLabId` int(11) DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gitLabToken` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `gitLabUsername` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ProgEdu'
--

--
-- Dumping routines for database 'ProgEdu'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-14 14:30:10
-- Update on 2021-12-14 18:45
