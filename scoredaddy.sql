-- MySQL dump 10.13  Distrib 5.7.20, for macos10.12 (x86_64)
--
-- Host: localhost    Database: scoredaddy
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `phone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Vinh\'s Shooting Academy','11634 Cannington Circle','Fishers','IN','46037','5743298039'),(2,'Tim\'s Shooting Academy','17777 Commerce Dr','Westfield','IN','46074','3173997918');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition`
--

DROP TABLE IF EXISTS `competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tournament_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `account_id_idx` (`account_id`),
  KEY `status_idx` (`status`),
  KEY `tournament_id_idx` (`tournament_id`),
  CONSTRAINT `account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `status` FOREIGN KEY (`status`) REFERENCES `status_codes` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tournament_id` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition`
--

LOCK TABLES `competition` WRITE;
/*!40000 ALTER TABLE `competition` DISABLE KEYS */;
INSERT INTO `competition` VALUES (1,1,1,'GSSF Winter 1','Winter Series 1','I'),(2,1,1,'GSSF Winter 2','Winter Series 2','I'),(3,2,2,'GSSF Winter 1','GSSF Winter Round 1','I'),(4,2,2,'GSSF Winter 2','GSSF Winter Round 2','I'),(5,1,1,'GSSF Winter 3','Winter Series 3','I'),(8,4,1,'Bullseye Winter Round 1','Bullseye Tournament','I');
/*!40000 ALTER TABLE `competition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition_codes`
--

DROP TABLE IF EXISTS `competition_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`code`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition_codes`
--

LOCK TABLES `competition_codes` WRITE;
/*!40000 ALTER TABLE `competition_codes` DISABLE KEYS */;
INSERT INTO `competition_codes` VALUES (1,'GSSFI','GSSF Indoor League'),(2,'BULLSEYE','BULLSEYE League');
/*!40000 ALTER TABLE `competition_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition_competitors`
--

DROP TABLE IF EXISTS `competition_competitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_competitors` (
  `competition_id` int(11) NOT NULL,
  `competitor_id` int(11) NOT NULL,
  PRIMARY KEY (`competition_id`,`competitor_id`),
  KEY `competitor_id_idx` (`competitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition_competitors`
--

LOCK TABLES `competition_competitors` WRITE;
/*!40000 ALTER TABLE `competition_competitors` DISABLE KEYS */;
INSERT INTO `competition_competitors` VALUES (1,2),(2,2),(8,2),(1,4),(2,4),(5,4),(1,5),(5,5),(1,6),(1,7),(1,8),(1,9),(2,9),(5,9),(1,10),(2,10),(1,11),(1,12),(2,12),(5,12),(1,13),(5,13),(3,14),(4,14),(3,15),(4,15),(3,16),(4,16),(3,17),(4,17),(3,18),(3,19),(4,19),(3,20),(4,20),(3,21),(4,21),(3,22),(4,22),(3,23),(4,23),(3,24),(4,24),(3,25),(3,26),(4,26),(3,27),(4,27),(3,29),(4,29),(3,30),(4,30),(3,31),(3,32),(4,32),(3,34),(4,34),(3,35),(4,35),(3,36),(3,37),(4,37),(3,39),(4,39),(3,40),(4,40),(3,41),(4,41),(3,42),(4,42),(3,43),(4,43),(3,44),(3,45),(4,45),(3,46),(4,46),(3,47),(3,48),(4,48),(3,49),(4,49),(3,50),(4,50),(3,51),(4,51),(3,53),(4,53),(3,54),(4,54),(3,55),(4,55),(3,56),(3,57),(4,57),(3,58),(3,59),(4,59),(3,60),(4,60),(4,61),(4,62),(4,63),(4,64),(4,65),(4,66),(4,67),(4,68),(4,69),(4,70),(4,71),(4,72),(4,73),(4,74),(4,75),(4,76),(4,77),(4,78),(4,79),(4,80),(4,81),(4,82),(5,84);
/*!40000 ALTER TABLE `competition_competitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition_details`
--

DROP TABLE IF EXISTS `competition_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_details` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `date` date NOT NULL,
  `course` varchar(1) NOT NULL,
  PRIMARY KEY (`id`,`code`),
  KEY `code_idx` (`code`),
  CONSTRAINT `code` FOREIGN KEY (`code`) REFERENCES `competition_codes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `competition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition_details`
--

LOCK TABLES `competition_details` WRITE;
/*!40000 ALTER TABLE `competition_details` DISABLE KEYS */;
INSERT INTO `competition_details` VALUES (1,1,'2018-01-06','A'),(2,1,'2018-02-06','A'),(3,1,'2017-12-02','A'),(4,1,'2018-01-06','A'),(5,1,'2018-03-06','A'),(8,2,'2018-01-27','A');
/*!40000 ALTER TABLE `competition_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition_results`
--

DROP TABLE IF EXISTS `competition_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_results` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `date` date NOT NULL,
  `competitor_id` int(11) NOT NULL,
  `firearm_id` int(11) NOT NULL,
  `stock_division` bit(1) NOT NULL,
  `unlimited_division` bit(1) NOT NULL,
  `pocket_division` bit(1) NOT NULL,
  `woman_division` bit(1) NOT NULL,
  `senior_division` bit(1) NOT NULL,
  `junior_division` bit(1) NOT NULL,
  `target_one_x` int(2) NOT NULL,
  `target_one_ten` int(2) NOT NULL,
  `target_one_eight` int(2) NOT NULL,
  `target_one_five` int(2) NOT NULL,
  `target_one_misses` int(2) NOT NULL,
  `target_two_x` int(2) NOT NULL,
  `target_two_ten` int(2) NOT NULL,
  `target_two_eight` int(2) NOT NULL,
  `target_two_five` int(2) NOT NULL,
  `target_two_misses` int(2) NOT NULL,
  `penalty` int(2) NOT NULL,
  `final_score` int(3) NOT NULL,
  `total_x` int(3) NOT NULL,
  `range_officer_initials` varchar(3) NOT NULL,
  `competitor_initials` varchar(3) NOT NULL,
  PRIMARY KEY (`id`,`code`,`date`,`competitor_id`,`firearm_id`,`stock_division`,`unlimited_division`,`pocket_division`),
  KEY `competitor_id_idx` (`competitor_id`),
  KEY `code_idx` (`code`),
  KEY `id_idx` (`id`),
  KEY `date_idx` (`date`),
  KEY `firearm_id_idx` (`firearm_id`),
  CONSTRAINT `competition_detail_code` FOREIGN KEY (`code`) REFERENCES `competition_details` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `competition_detail_id` FOREIGN KEY (`id`) REFERENCES `competition_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `competitor_id` FOREIGN KEY (`competitor_id`) REFERENCES `competitor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `firearm_id` FOREIGN KEY (`firearm_id`) REFERENCES `firearm_models` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition_results`
--

LOCK TABLES `competition_results` WRITE;
/*!40000 ALTER TABLE `competition_results` DISABLE KEYS */;
INSERT INTO `competition_results` VALUES (1,1,'2018-01-06',2,1,'','\0','\0','\0','','\0',20,0,0,0,0,10,7,10,3,0,0,465,30,'RO','BB'),(1,1,'2018-01-06',2,2,'\0','','\0','\0','\0','\0',20,0,0,0,0,25,1,2,2,0,0,486,45,'RO','BB'),(1,1,'2018-01-06',4,4,'\0','','\0','\0','\0','\0',20,0,0,0,0,27,1,2,0,0,0,496,47,'RO','EF'),(1,1,'2018-01-06',5,4,'\0','','\0','\0','\0','\0',20,0,0,0,0,20,5,3,2,0,0,484,40,'RO','EF'),(1,1,'2018-01-06',5,18,'','\0','\0','\0','','\0',19,0,1,0,0,18,9,2,1,0,0,489,37,'RO','DD'),(1,1,'2018-01-06',6,14,'','\0','\0','\0','\0','\0',19,0,1,0,0,18,9,3,0,0,0,492,37,'RO','DD'),(1,1,'2018-01-06',7,9,'','\0','\0','\0','\0','\0',15,3,2,0,0,15,5,5,5,0,0,461,30,'RO','DD'),(1,1,'2018-01-06',8,9,'','\0','\0','\0','','\0',15,3,2,0,0,16,4,5,5,0,0,461,31,'RO','MM'),(1,1,'2018-01-06',9,9,'','\0','\0','','\0','\0',16,4,0,0,0,16,4,5,5,0,0,465,32,'RO','MM'),(1,1,'2018-01-06',9,28,'\0','\0','','\0','\0','\0',10,0,0,0,0,12,2,1,0,0,0,248,22,'RO','MM'),(1,1,'2018-01-06',10,9,'','\0','\0','\0','\0','\0',15,4,1,0,0,16,4,4,6,0,0,460,31,'RO','KF'),(1,1,'2018-01-06',10,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,14,0,1,0,0,0,248,24,'RO','KF'),(1,1,'2018-01-06',11,9,'','\0','\0','\0','\0','',15,4,1,0,0,15,4,4,7,0,0,455,30,'RO','JM'),(1,1,'2018-01-06',12,21,'','\0','\0','\0','\0','',18,1,1,0,0,20,5,3,2,0,8,474,38,'RO','TC'),(1,1,'2018-01-06',13,6,'','\0','\0','\0','\0','',20,0,0,0,0,26,2,2,0,0,0,496,46,'',''),(2,1,'2018-02-06',2,1,'','\0','\0','\0','\0','\0',20,0,0,0,0,20,5,3,1,1,1,479,40,'RO','BB'),(2,1,'2018-02-06',4,26,'','\0','\0','\0','\0','\0',20,0,0,0,0,15,10,3,2,0,0,484,35,'RO','EF'),(2,1,'2018-02-06',9,9,'','\0','\0','','\0','\0',20,0,0,0,0,22,2,5,1,0,0,485,42,'RO','MM'),(2,1,'2018-02-06',10,9,'','\0','\0','\0','\0','\0',20,0,0,0,0,20,5,3,2,0,0,484,40,'RO','KF'),(2,1,'2018-02-06',12,21,'','\0','\0','\0','\0','',20,0,0,0,0,30,0,0,0,0,0,500,50,'',''),(2,1,'2018-02-06',12,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,15,0,0,0,0,0,250,25,'RO','VD'),(3,1,'2017-12-02',14,2,'','\0','\0','\0','\0','\0',20,0,0,0,0,15,6,9,0,0,0,482,35,'MR',''),(3,1,'2017-12-02',14,20,'\0','','\0','\0','\0','\0',18,2,0,0,0,17,8,5,0,0,0,490,35,'MR',''),(3,1,'2017-12-02',15,4,'','\0','\0','\0','\0','\0',18,2,0,0,0,10,5,10,5,0,0,455,28,'MR',''),(3,1,'2017-12-02',15,10,'','\0','\0','\0','\0','\0',14,6,0,0,0,9,10,5,4,2,0,450,23,'MR',''),(3,1,'2017-12-02',16,4,'','\0','\0','\0','\0','\0',8,4,2,6,0,0,2,6,16,6,0,314,8,'MR',''),(3,1,'2017-12-02',16,7,'','\0','\0','\0','\0','\0',6,10,3,1,0,1,3,4,12,10,0,321,7,'MR',''),(3,1,'2017-12-02',17,20,'','\0','\0','\0','','\0',15,5,0,0,0,6,13,3,8,0,0,454,21,'MR',''),(3,1,'2017-12-02',18,20,'','\0','\0','\0','\0','\0',2,10,4,3,1,23,6,1,0,0,0,465,25,'MR',''),(3,1,'2017-12-02',19,4,'','\0','\0','\0','\0','\0',8,8,1,3,0,6,5,3,11,5,0,372,14,'MR',''),(3,1,'2017-12-02',20,5,'','\0','\0','\0','\0','\0',19,1,0,0,0,16,12,1,1,0,0,493,35,'MR',''),(3,1,'2017-12-02',20,20,'\0','','\0','\0','\0','\0',20,0,0,0,0,22,7,1,0,0,0,498,42,'MR',''),(3,1,'2017-12-02',20,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,10,4,1,0,0,0,248,20,'MR',''),(3,1,'2017-12-02',21,3,'\0','','\0','\0','\0','\0',19,0,0,0,1,9,20,1,0,0,0,488,28,'MR',''),(3,1,'2017-12-02',21,27,'\0','','\0','\0','\0','\0',16,2,0,0,2,17,11,0,2,0,0,470,33,'MR',''),(3,1,'2017-12-02',22,1,'\0','','\0','\0','\0','\0',18,2,0,0,0,9,9,5,7,0,0,455,27,'MR',''),(3,1,'2017-12-02',23,20,'','\0','\0','\0','\0','\0',12,7,1,0,0,4,13,6,3,4,0,431,16,'MR',''),(3,1,'2017-12-02',24,4,'','\0','\0','\0','','\0',12,7,1,0,0,4,6,9,8,3,0,410,16,'MR',''),(3,1,'2017-12-02',24,20,'','\0','\0','\0','','\0',12,6,2,0,0,4,7,11,6,2,0,424,16,'MR',''),(3,1,'2017-12-02',24,29,'\0','\0','','\0','\0','\0',2,7,1,0,0,5,8,1,1,0,0,241,7,'MR',''),(3,1,'2017-12-02',25,1,'','\0','\0','\0','','\0',8,10,2,0,0,2,8,6,8,6,0,384,10,'MR',''),(3,1,'2017-12-02',25,20,'','\0','\0','\0','','\0',8,6,3,3,0,2,11,5,10,2,0,399,10,'MR',''),(3,1,'2017-12-02',26,4,'','\0','\0','\0','','\0',14,6,0,0,0,12,9,2,7,0,0,461,26,'MR',''),(3,1,'2017-12-02',27,4,'\0','','\0','\0','\0','\0',16,4,0,0,0,11,9,4,5,1,0,457,27,'MR',''),(3,1,'2017-12-02',27,28,'\0','\0','','\0','\0','\0',7,3,0,0,0,4,6,3,2,0,0,234,11,'MR',''),(3,1,'2017-12-02',29,1,'','\0','\0','\0','\0','\0',13,7,0,0,0,2,12,13,3,0,0,459,15,'MR',''),(3,1,'2017-12-02',29,29,'\0','\0','','\0','\0','\0',9,1,0,0,0,6,2,1,0,6,0,188,15,'MR',''),(3,1,'2017-12-02',30,20,'','\0','\0','\0','\0','\0',15,4,1,0,0,11,12,6,1,0,0,481,26,'MR',''),(3,1,'2017-12-02',31,1,'','\0','\0','\0','','\0',13,6,1,0,0,2,9,9,6,4,0,410,15,'MR',''),(3,1,'2017-12-02',31,20,'','\0','\0','\0','','\0',16,3,1,0,0,5,11,11,3,0,0,461,21,'MR',''),(3,1,'2017-12-02',31,29,'\0','\0','','\0','\0','\0',6,3,1,0,0,7,5,1,2,0,0,236,13,'MR',''),(3,1,'2017-12-02',32,1,'','\0','\0','\0','','\0',6,11,3,0,0,5,6,8,11,0,0,423,11,'MR',''),(3,1,'2017-12-02',32,20,'\0','','\0','\0','\0','\0',12,8,0,0,0,5,14,4,7,0,0,457,17,'MR',''),(3,1,'2017-12-02',34,4,'','\0','\0','\0','','\0',14,3,3,0,0,7,8,9,6,0,0,446,21,'MR',''),(3,1,'2017-12-02',34,29,'\0','\0','','\0','\0','\0',4,6,0,0,0,1,10,3,1,0,0,239,5,'MR',''),(3,1,'2017-12-02',35,2,'','\0','\0','','\0','\0',11,8,1,0,0,10,7,7,6,0,0,454,21,'MR',''),(3,1,'2017-12-02',36,2,'','\0','\0','\0','\0','\0',17,3,0,0,0,11,9,8,2,0,0,474,28,'MR',''),(3,1,'2017-12-02',36,20,'\0','','\0','\0','\0','\0',14,6,0,0,0,8,12,8,2,0,0,474,22,'MR',''),(3,1,'2017-12-02',37,1,'','\0','\0','\0','\0','\0',19,1,0,0,0,13,10,5,2,0,0,480,32,'MR',''),(3,1,'2017-12-02',37,20,'\0','','\0','\0','\0','\0',20,0,0,0,0,19,9,1,1,0,0,493,39,'MR',''),(3,1,'2017-12-02',37,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,10,5,0,0,0,0,250,20,'MR',''),(3,1,'2017-12-02',39,1,'','\0','\0','\0','\0','\0',17,3,0,0,0,5,14,5,6,0,0,460,22,'MR',''),(3,1,'2017-12-02',39,13,'','\0','\0','\0','\0','\0',10,10,0,0,0,7,13,6,4,0,0,468,17,'MR',''),(3,1,'2017-12-02',39,29,'\0','\0','','\0','\0','\0',6,4,0,0,0,3,3,6,3,0,0,223,9,'MR',''),(3,1,'2017-12-02',40,20,'\0','','\0','\0','\0','\0',3,4,3,10,0,4,5,8,11,2,0,353,7,'MR',''),(3,1,'2017-12-02',40,20,'','\0','\0','\0','\0','\0',15,5,0,0,0,5,5,12,8,0,0,436,20,'MR',''),(3,1,'2017-12-02',41,4,'','\0','\0','\0','\0','\0',12,8,0,0,0,8,8,11,3,0,0,463,20,'MR',''),(3,1,'2017-12-02',42,3,'','\0','\0','\0','\0','\0',15,5,0,0,0,4,13,7,6,0,0,456,19,'MR',''),(3,1,'2017-12-02',42,20,'\0','','\0','\0','\0','\0',18,2,0,0,0,19,8,3,0,0,0,494,37,'MR',''),(3,1,'2017-12-02',42,21,'\0','','\0','\0','\0','\0',15,5,0,0,0,12,12,6,0,0,0,488,27,'MR',''),(3,1,'2017-12-02',42,29,'\0','\0','','\0','\0','\0',9,1,0,0,0,10,4,1,0,0,0,248,19,'MR',''),(3,1,'2017-12-02',43,1,'','\0','\0','','\0','\0',3,7,3,6,1,1,4,3,10,12,0,278,4,'MR',''),(3,1,'2017-12-02',43,29,'\0','\0','','\0','\0','\0',4,3,3,0,0,1,2,2,7,3,0,175,5,'MR',''),(3,1,'2017-12-02',44,4,'\0','','\0','\0','\0','\0',16,4,0,0,0,5,5,12,8,0,0,436,21,'MR',''),(3,1,'2017-12-02',44,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,9,5,1,0,0,0,248,19,'MR',''),(3,1,'2017-12-02',45,1,'','\0','\0','\0','','\0',18,2,0,0,0,6,9,7,7,1,0,441,24,'MR',''),(3,1,'2017-12-02',45,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,5,4,3,3,0,0,229,15,'MR',''),(3,1,'2017-12-02',46,1,'','\0','\0','\0','\0','\0',10,4,6,0,0,3,12,3,5,7,0,387,13,'MR',''),(3,1,'2017-12-02',46,4,'','\0','\0','\0','\0','\0',10,8,2,0,0,4,8,5,12,1,0,416,14,'MR',''),(3,1,'2017-12-02',47,4,'','\0','\0','\0','\0','\0',3,1,5,9,2,3,2,1,13,11,0,248,6,'MR',''),(3,1,'2017-12-02',48,1,'','\0','\0','\0','','\0',1,3,10,5,1,1,7,3,11,8,0,304,2,'MR',''),(3,1,'2017-12-02',49,1,'','\0','\0','\0','\0','\0',17,3,0,0,0,6,6,8,10,0,0,434,23,'MR',''),(3,1,'2017-12-02',49,4,'','\0','\0','\0','\0','\0',18,2,0,0,0,13,9,4,4,0,0,472,31,'MR',''),(3,1,'2017-12-02',49,13,'','\0','\0','\0','\0','\0',8,3,0,0,9,14,6,4,6,0,0,372,22,'MR',''),(3,1,'2017-12-02',50,4,'','\0','\0','\0','','\0',18,2,0,0,0,15,10,5,0,0,0,490,33,'MR',''),(3,1,'2017-12-02',50,29,'\0','\0','','\0','\0','\0',8,2,0,0,0,7,5,2,1,0,0,241,15,'MR',''),(3,1,'2017-12-02',51,1,'','\0','\0','\0','\0','',8,12,0,0,0,1,3,6,11,9,0,343,9,'MR',''),(3,1,'2017-12-02',51,29,'\0','\0','','\0','\0','\0',2,3,3,2,0,0,1,8,5,1,0,183,2,'MR',''),(3,1,'2017-12-02',53,4,'','\0','\0','\0','\0','\0',10,8,2,0,0,2,9,8,6,5,0,400,12,'MR',''),(3,1,'2017-12-02',53,29,'\0','\0','','\0','\0','\0',7,3,0,0,0,5,6,2,2,0,0,236,12,'MR',''),(3,1,'2017-12-02',54,4,'','\0','\0','\0','','\0',13,4,2,1,0,4,7,7,12,0,0,417,17,'MR',''),(3,1,'2017-12-02',55,1,'','\0','\0','\0','\0','\0',12,7,1,0,0,8,11,5,6,0,0,458,20,'MR',''),(3,1,'2017-12-02',56,1,'','\0','\0','','','\0',2,8,5,5,0,3,2,6,12,7,0,323,5,'MR',''),(3,1,'2017-12-02',57,3,'','\0','\0','\0','\0','\0',9,5,4,2,0,4,8,5,12,1,0,402,13,'MR',''),(3,1,'2017-12-02',58,1,'','\0','\0','','\0','\0',4,6,2,7,1,0,4,3,15,8,0,290,4,'MR',''),(3,1,'2017-12-02',59,3,'','\0','\0','','\0','\0',9,6,2,0,3,2,2,3,2,21,0,240,11,'MR',''),(3,1,'2017-12-02',59,20,'','\0','\0','','\0','\0',6,4,4,4,2,1,4,7,12,6,0,318,7,'MR',''),(3,1,'2017-12-02',60,1,'','\0','\0','\0','','\0',2,6,5,5,2,9,13,5,3,0,0,420,11,'MR',''),(3,1,'2017-12-02',60,26,'\0','','\0','\0','\0','\0',1,4,5,5,5,15,9,5,1,0,0,400,16,'MR',''),(4,1,'2018-01-06',14,2,'','\0','\0','\0','\0','\0',16,4,0,0,0,11,12,4,3,0,0,477,27,'MR',''),(4,1,'2018-01-06',14,20,'\0','','\0','\0','\0','\0',19,1,0,0,0,18,8,0,4,0,0,480,37,'MR',''),(4,1,'2018-01-06',15,4,'','\0','\0','\0','\0','\0',17,3,0,0,0,11,8,5,5,1,1,455,28,'MR',''),(4,1,'2018-01-06',15,10,'','\0','\0','\0','\0','\0',16,3,1,0,0,8,12,5,5,0,0,463,24,'MR',''),(4,1,'2018-01-06',16,4,'','\0','\0','\0','\0','\0',6,5,7,2,0,1,6,8,11,4,4,365,7,'MR',''),(4,1,'2018-01-06',16,7,'','\0','\0','\0','\0','\0',4,8,3,5,0,3,8,2,5,12,12,320,7,'MR',''),(4,1,'2018-01-06',17,20,'','\0','\0','\0','\0','\0',14,5,1,0,0,9,10,5,6,0,0,458,23,'MR',''),(4,1,'2018-01-06',19,4,'','\0','\0','\0','\0','\0',3,11,5,0,1,3,8,4,8,7,8,362,6,'MR',''),(4,1,'2018-01-06',20,5,'','\0','\0','\0','\0','\0',20,0,0,0,0,10,15,4,1,0,0,487,30,'MR',''),(4,1,'2018-01-06',20,20,'\0','','\0','\0','\0','\0',20,0,0,0,0,20,10,0,0,0,0,500,40,'MR',''),(4,1,'2018-01-06',20,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,8,5,2,0,0,0,246,18,'MR',''),(4,1,'2018-01-06',21,3,'\0','','\0','\0','\0','\0',18,2,0,0,0,11,7,8,4,0,0,464,29,'MR',''),(4,1,'2018-01-06',21,27,'\0','','\0','\0','\0','\0',19,0,1,0,0,4,11,8,7,0,0,447,23,'MR',''),(4,1,'2018-01-06',22,1,'','\0','\0','\0','\0','\0',19,1,0,0,0,19,5,3,3,0,0,479,38,'MR',''),(4,1,'2018-01-06',23,20,'','\0','\0','\0','\0','\0',10,5,4,1,0,5,10,6,9,0,0,430,15,'MR',''),(4,1,'2018-01-06',24,4,'','\0','\0','\0','','\0',13,7,0,0,0,6,7,10,5,2,2,435,19,'MR',''),(4,1,'2018-01-06',24,20,'','\0','\0','\0','','\0',16,2,2,0,0,10,7,8,4,1,1,450,26,'MR',''),(4,1,'2018-01-06',24,29,'\0','\0','','\0','\0','\0',5,5,0,0,0,4,6,2,3,0,0,231,9,'MR',''),(4,1,'2018-01-06',26,4,'','\0','\0','\0','\0','\0',7,8,4,1,0,5,7,6,10,2,2,405,12,'MR',''),(4,1,'2018-01-06',27,4,'\0','','\0','\0','\0','\0',17,3,0,0,0,9,9,9,3,0,0,467,26,'MR',''),(4,1,'2018-01-06',27,28,'\0','\0','','\0','\0','\0',8,2,0,0,0,4,8,3,0,0,0,244,12,'MR',''),(4,1,'2018-01-06',29,1,'','\0','\0','\0','\0','\0',16,4,0,0,0,9,12,7,2,0,0,476,25,'MR',''),(4,1,'2018-01-06',29,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,4,4,5,2,0,0,230,14,'MR',''),(4,1,'2018-01-06',30,20,'','\0','\0','\0','\0','\0',13,6,1,0,0,14,7,6,3,0,0,471,27,'MR',''),(4,1,'2018-01-06',32,1,'','\0','\0','\0','','\0',13,6,1,0,0,6,11,6,6,1,1,446,19,'MR',''),(4,1,'2018-01-06',32,20,'\0','','\0','\0','\0','\0',14,5,0,1,0,7,11,8,4,0,0,459,21,'MR',''),(4,1,'2018-01-06',34,4,'','\0','\0','\0','','\0',12,7,1,0,0,4,11,6,9,0,0,441,16,'MR',''),(4,1,'2018-01-06',34,29,'\0','\0','','\0','\0','\0',8,2,0,0,0,6,5,1,3,0,0,233,14,'MR',''),(4,1,'2018-01-06',35,2,'','\0','\0','','\0','\0',17,3,0,0,0,9,6,8,6,1,1,444,26,'MR',''),(4,1,'2018-01-06',35,29,'\0','\0','','\0','\0','\0',9,1,0,0,0,7,6,1,1,0,0,243,16,'MR',''),(4,1,'2018-01-06',37,1,'','\0','\0','\0','\0','\0',20,0,0,0,0,14,8,5,3,0,0,475,34,'MR',''),(4,1,'2018-01-06',37,20,'\0','','\0','\0','\0','\0',20,0,0,0,0,14,15,1,0,0,0,498,34,'MR',''),(4,1,'2018-01-06',37,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,10,5,0,0,0,0,250,20,'MR',''),(4,1,'2018-01-06',39,1,'','\0','\0','\0','\0','\0',18,2,0,0,0,7,15,3,5,0,0,469,25,'MR',''),(4,1,'2018-01-06',39,13,'','\0','\0','\0','\0','\0',15,5,0,0,0,3,11,14,2,0,0,462,18,'MR',''),(4,1,'2018-01-06',39,29,'\0','\0','','\0','\0','\0',7,1,2,0,0,2,8,5,0,0,0,236,9,'MR',''),(4,1,'2018-01-06',40,20,'\0','','\0','\0','\0','\0',14,6,0,0,0,4,9,9,8,0,0,442,18,'MR',''),(4,1,'2018-01-06',40,20,'','\0','\0','\0','\0','\0',11,9,0,0,0,4,5,7,14,0,0,416,15,'MR',''),(4,1,'2018-01-06',41,4,'','\0','\0','\0','\0','\0',13,5,1,0,1,7,9,6,2,6,7,406,20,'MR',''),(4,1,'2018-01-06',42,3,'','\0','\0','\0','\0','\0',16,2,2,0,0,9,9,5,7,0,0,451,25,'MR',''),(4,1,'2018-01-06',42,20,'\0','','\0','\0','\0','\0',18,2,0,0,0,15,13,1,1,0,0,493,33,'MR',''),(4,1,'2018-01-06',42,21,'\0','','\0','\0','\0','\0',17,3,0,0,0,17,11,0,2,0,0,490,34,'MR',''),(4,1,'2018-01-06',42,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,6,6,3,0,0,0,244,16,'MR',''),(4,1,'2018-01-06',43,1,'','\0','\0','','\0','\0',5,3,6,6,0,1,1,2,13,13,13,259,6,'MR',''),(4,1,'2018-01-06',43,29,'\0','\0','','\0','\0','\0',3,3,1,3,0,2,1,2,6,4,4,159,5,'MR',''),(4,1,'2018-01-06',45,1,'','\0','\0','\0','','\0',14,6,0,0,0,6,13,6,4,1,1,458,20,'MR',''),(4,1,'2018-01-06',45,29,'\0','\0','','\0','\0','\0',9,1,0,0,0,8,3,2,2,0,0,236,17,'MR',''),(4,1,'2018-01-06',46,1,'','\0','\0','\0','\0','\0',14,5,1,0,0,2,10,4,13,1,1,415,16,'MR',''),(4,1,'2018-01-06',46,4,'','\0','\0','\0','\0','\0',15,4,1,0,0,5,8,4,11,2,2,415,20,'MR',''),(4,1,'2018-01-06',48,1,'','\0','\0','\0','\0','\0',8,7,2,3,0,2,5,5,10,8,8,341,10,'MR',''),(4,1,'2018-01-06',49,1,'','\0','\0','\0','\0','\0',14,6,0,0,0,9,12,5,4,0,0,470,23,'MR',''),(4,1,'2018-01-06',49,4,'','\0','\0','\0','\0','\0',17,3,0,0,0,7,10,9,4,0,0,462,24,'MR',''),(4,1,'2018-01-06',49,13,'','\0','\0','\0','\0','\0',19,1,0,0,0,9,5,9,7,0,0,447,28,'MR',''),(4,1,'2018-01-06',50,4,'','\0','\0','\0','','\0',20,0,0,0,0,13,7,3,7,0,0,459,33,'MR',''),(4,1,'2018-01-06',50,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,5,7,2,1,0,0,241,15,'MR',''),(4,1,'2018-01-06',51,4,'','\0','\0','\0','\0','',8,4,4,3,1,3,4,5,6,12,13,307,11,'MR',''),(4,1,'2018-01-06',51,29,'\0','\0','','\0','\0','\0',1,4,1,4,0,0,2,0,7,6,6,133,1,'MR',''),(4,1,'2018-01-06',53,4,'','\0','\0','\0','\0','\0',13,6,1,0,0,2,6,13,8,1,1,422,15,'MR',''),(4,1,'2018-01-06',53,29,'\0','\0','','\0','\0','\0',8,2,0,0,0,6,5,3,1,0,0,239,14,'MR',''),(4,1,'2018-01-06',54,4,'','\0','\0','\0','','\0',4,12,1,3,0,2,12,7,5,4,4,404,6,'MR',''),(4,1,'2018-01-06',55,1,'','\0','\0','\0','\0','\0',15,5,0,0,0,6,13,2,9,0,0,451,21,'MR',''),(4,1,'2018-01-06',55,7,'','\0','\0','\0','\0','\0',12,5,2,1,0,7,12,5,5,1,1,446,19,'MR',''),(4,1,'2018-01-06',57,3,'','\0','\0','\0','\0','\0',15,5,0,0,0,9,9,7,4,1,1,456,24,'MR',''),(4,1,'2018-01-06',59,3,'','\0','\0','','\0','\0',5,5,2,5,3,2,4,8,10,6,9,315,7,'MR',''),(4,1,'2018-01-06',59,20,'','\0','\0','','\0','\0',6,6,7,1,0,1,5,11,9,4,4,374,7,'MR',''),(4,1,'2018-01-06',59,29,'\0','\0','','\0','\0','\0',1,2,5,2,0,1,0,2,9,3,3,151,2,'MR',''),(4,1,'2018-01-06',60,1,'','\0','\0','\0','\0','\0',9,5,4,2,0,4,8,6,8,4,4,390,13,'MR',''),(4,1,'2018-01-06',60,26,'\0','','\0','\0','\0','\0',11,5,1,3,0,4,9,6,8,3,3,401,15,'MR',''),(4,1,'2018-01-06',61,27,'','\0','\0','\0','\0','\0',15,4,1,0,0,9,14,4,3,0,0,475,24,'MR',''),(4,1,'2018-01-06',61,29,'\0','\0','','\0','\0','\0',10,0,0,0,0,5,8,2,0,0,0,246,15,'MR',''),(4,1,'2018-01-06',62,4,'','\0','\0','\0','\0','\0',16,3,1,0,0,7,10,9,4,0,0,460,23,'MR',''),(4,1,'2018-01-06',63,4,'','\0','\0','\0','\0','\0',11,4,2,0,3,8,6,3,11,2,5,385,19,'MR',''),(4,1,'2018-01-06',64,4,'','\0','\0','\0','\0','\0',8,7,2,0,3,5,7,9,9,0,3,403,13,'MR',''),(4,1,'2018-01-06',65,4,'','\0','\0','\0','\0','\0',10,2,4,4,0,3,6,5,9,7,7,347,13,'MR',''),(4,1,'2018-01-06',66,1,'','\0','\0','\0','\0','\0',12,7,1,0,0,9,11,5,5,0,0,463,21,'MR',''),(4,1,'2018-01-06',66,26,'\0','','\0','\0','\0','\0',19,1,0,0,0,12,14,2,2,0,0,486,31,'MR',''),(4,1,'2018-01-06',67,28,'\0','\0','','\0','\0','\0',6,4,0,0,0,4,7,3,1,0,0,239,10,'MR',''),(4,1,'2018-01-06',67,29,'\0','\0','','\0','\0','\0',5,5,0,0,0,4,8,3,0,0,0,244,9,'MR',''),(4,1,'2018-01-06',68,1,'\0','','\0','\0','\0','\0',15,5,0,0,0,3,8,9,8,2,2,422,18,'MR',''),(4,1,'2018-01-06',69,20,'','\0','\0','\0','\0','\0',13,7,0,0,0,7,8,6,9,0,0,443,20,'MR',''),(4,1,'2018-01-06',70,20,'\0','','\0','\0','\0','\0',10,9,1,0,0,9,14,5,2,0,0,478,19,'MR',''),(4,1,'2018-01-06',71,1,'','\0','\0','\0','\0','\0',6,9,3,2,0,0,6,10,9,5,5,369,6,'MR',''),(4,1,'2018-01-06',72,13,'','\0','\0','\0','\0','\0',5,9,2,4,0,1,2,2,10,15,15,272,6,'MR',''),(4,1,'2018-01-06',73,2,'\0','','\0','\0','\0','\0',20,0,0,0,0,18,5,6,1,0,0,483,38,'MR',''),(4,1,'2018-01-06',74,2,'\0','','\0','\0','\0','\0',7,6,2,5,0,3,4,8,15,0,0,380,10,'MR',''),(4,1,'2018-01-06',75,4,'','\0','\0','\0','','\0',4,8,6,2,0,0,2,7,12,9,9,314,4,'MR',''),(4,1,'2018-01-06',75,28,'\0','\0','','\0','\0','\0',0,2,0,6,2,0,1,4,6,4,6,122,0,'MR',''),(4,1,'2018-01-06',76,1,'','\0','\0','\0','\0','\0',13,6,1,0,0,9,8,6,7,0,0,451,22,'MR',''),(4,1,'2018-01-06',76,29,'\0','\0','','\0','\0','\0',7,3,0,0,0,4,2,8,1,0,0,229,11,'MR',''),(4,1,'2018-01-06',77,1,'','\0','\0','\0','\0','\0',6,8,5,1,0,8,6,7,4,5,5,401,14,'MR',''),(4,1,'2018-01-06',78,4,'','\0','\0','','\0','\0',5,8,4,2,1,0,3,7,10,10,11,308,5,'MR',''),(4,1,'2018-01-06',79,29,'\0','\0','','\0','\0','\0',6,2,1,1,0,2,4,3,4,2,2,197,8,'MR',''),(4,1,'2018-01-06',80,1,'','\0','\0','\0','\0','\0',10,4,5,1,0,8,9,7,6,0,0,441,18,'MR',''),(4,1,'2018-01-06',81,4,'\0','','\0','\0','\0','\0',16,4,0,0,0,12,10,7,1,0,0,481,28,'MR',''),(4,1,'2018-01-06',81,21,'\0','','\0','\0','\0','\0',15,5,0,0,0,14,10,5,1,0,0,485,29,'MR',''),(4,1,'2018-01-06',82,8,'','\0','\0','\0','\0','\0',12,7,0,1,0,10,3,11,6,0,0,443,22,'MR',''),(5,1,'2018-03-06',4,26,'','\0','\0','\0','\0','\0',20,0,0,0,0,18,10,2,0,0,0,496,38,'RO','EF'),(5,1,'2018-03-06',5,18,'','\0','\0','\0','','\0',20,0,0,0,0,20,6,2,2,0,0,486,40,'RO','DD'),(5,1,'2018-03-06',9,9,'','\0','\0','','\0','\0',20,0,0,0,0,20,8,1,1,0,0,493,40,'RO','MM'),(5,1,'2018-03-06',13,6,'','\0','\0','\0','\0','',20,0,0,0,0,20,2,6,2,0,0,478,40,'RO','FB'),(8,1,'2018-01-27',2,33,'','\0','\0','\0','\0','\0',20,0,0,0,0,20,3,3,4,0,0,474,40,'RO','BB');
/*!40000 ALTER TABLE `competition_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitor`
--

DROP TABLE IF EXISTS `competitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `gssf_id` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitor`
--

LOCK TABLES `competitor` WRITE;
/*!40000 ALTER TABLE `competitor` DISABLE KEYS */;
INSERT INTO `competitor` VALUES (2,'Bugs','Bunny','1000 Looney Tunes','Hollywood','CA','12345','5555551212','','1'),(4,'Elmer','Fudd','1000 Looney Tunes','Hollywood','CA','12345','5555551212','','2'),(5,'Daffy','Duck','1000 Looney Tunes','Hollywood','CA','12345','5555551212','','3'),(6,'Porky','Pig','1000 Looney Tunes','Hollywood','CA','12345','5555551212','','4'),(7,'Donald','Duck','1000 Looney Tunes','Hollywood','CA','12345','5555551212','','5'),(8,'Mickey','Mouse','1000 Looney Tunes','Hollywood','CA','12345','5555551212','','6'),(9,'Minnie','Mouse','1000 Looney Tunes','Hollywood','CA','12345','5555551212','','7'),(10,'Kermit','Frog','1000 Looney Tunes','Hollywood','CA','12345','5555551212','','8'),(11,'Jerry','Mouse','1000 Looney Tunes','Hollywood','CA','12345','5555551212','','8'),(12,'Tom','Cat','1000 Looney Tunes','Hollywood','CA','12345','5555551212','','8'),(13,'Fozzy','Bear','1000 Looney Tunes','Hollywood','CA','12345','5555551212','',''),(14,'Mark','Reichanadter','','','','','','',''),(15,'Mark','Shriver','','','','','','',''),(16,'Michael','Jekinski','','','','','','',''),(17,'Eldan','Habegger','','','','','','',''),(18,'Leonard','Neisler','','','','','','',''),(19,'Ryan','Sherrill','','','','','','',''),(20,'Vinh','Dang','','','','','','',''),(21,'Wallace','Brown','','','','','','',''),(22,'Eric','Harris','','','','','','',''),(23,'Michael','Bird','','','','','','',''),(24,'John','Bates','','','','','','',''),(25,'David','Haines','','','','','','',''),(26,'Dean','Shriver','','','','','','',''),(27,'Willie','Bush JR','','','','','','',''),(29,'Joel','Nadler','','','','','','',''),(30,'Jeff','Detrick','','','','','','',''),(31,'Mike','Donnelly','','','','','','',''),(32,'Mark','Shockney','','','','','','',''),(34,'Ken','Carlson','','','','','','',''),(35,'Meghan','Lowery','','','','','','',''),(36,'Kevin','Green','','','','','','',''),(37,'Vince','Corvari','','','','','','',''),(39,'Jim','Mulligan','','','','','','',''),(40,'Joe','Drager','','','','','','',''),(41,'James','Cortecht','','','','','','',''),(42,'Fritz','McCorkle','','','','','','',''),(43,'Amy','Rapala','','','','','','',''),(44,'Benjamin','Beyler','','','','','','',''),(45,'Thomas','Rapala','','','','','','',''),(46,'Cory','Rapala','','','','','','',''),(47,'Connor','Rapala','','','','','','',''),(48,'Robert','Adie','','','','','','',''),(49,'David','Peters','','','','','','',''),(50,'Yuri','Zelenin','','','','','','',''),(51,'Cason','Rody','','','','','','',''),(53,'Tim','Rody','','','','','','',''),(54,'Jerry','Segal','','','','','','',''),(55,'Ed','Cortrecht','','','','','','',''),(56,'Janet','Rapala','','','','','','',''),(57,'Michael','Matthews','','','','','','',''),(58,'Kathryn','Smith','','','','','','',''),(59,'Sharon','Sullivan','','','','','','',''),(60,'Mike','McDonald','','','','','','',''),(61,'Joe','Enerick','','','','','','',''),(62,'Khali','Crespo','','','','','','',''),(63,'Alex','Crespo','','','','','','',''),(64,'Matt','Steger','','','','','','',''),(65,'Kevin ','Orr','','','','','','',''),(66,'Kelly','Newcomer','','','','','','',''),(67,'Yan','Guenette','','','','','','',''),(68,'Mark','Staggs','','','','','','',''),(69,'Randy','Schuetter','','','','','','',''),(70,'Keith','Schuetter','','','','','','',''),(71,'Gary','Kelley','','','','','','',''),(72,'Mark','Cichouski','','','','','','',''),(73,'Bill','Vernon','','','','','','',''),(74,'Abby','Vernon','','','','','','',''),(75,'Frank','Pope','','','','','','',''),(76,'Steve','Schnadenberg','','','','','','',''),(77,'Paul','Clayton','','','','','','',''),(78,'Elisha','Dunbar','','','','','','',''),(79,'Tari','Hendricks','','','','','','',''),(80,'Greg','Clayton','','','','','','',''),(81,'Doug','Melandor','','','','','','',''),(82,'William','Frankman','','','','','','',''),(84,'Woody','Woodpecker','','','','','','','');
/*!40000 ALTER TABLE `competitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_codes`
--

DROP TABLE IF EXISTS `course_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `course_UNIQUE` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_codes`
--

LOCK TABLES `course_codes` WRITE;
/*!40000 ALTER TABLE `course_codes` DISABLE KEYS */;
INSERT INTO `course_codes` VALUES (2,'A'),(3,'B'),(4,'C'),(5,'D'),(6,'E'),(1,'O');
/*!40000 ALTER TABLE `course_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division_codes`
--

DROP TABLE IF EXISTS `division_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `division_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` varchar(25) NOT NULL,
  PRIMARY KEY (`code`,`id`),
  KEY `id_idx` (`id`),
  CONSTRAINT `competition_code_id` FOREIGN KEY (`id`) REFERENCES `competition_codes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division_codes`
--

LOCK TABLES `division_codes` WRITE;
/*!40000 ALTER TABLE `division_codes` DISABLE KEYS */;
INSERT INTO `division_codes` VALUES (1,'GSSF_JUNIOR','GSSF Junior Division'),(1,'GSSF_POCKET','GSSF Pocket Division'),(1,'GSSF_SENIOR','GSSF Senior Divsion'),(1,'GSSF_STOCK','GSSF Stock Division'),(1,'GSSF_UNLIMITED','GSSF Unlimited Division'),(1,'GSSF_WOMAN','GSSF Woman Division');
/*!40000 ALTER TABLE `division_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firearm_brands`
--

DROP TABLE IF EXISTS `firearm_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firearm_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firearm_brands`
--

LOCK TABLES `firearm_brands` WRITE;
/*!40000 ALTER TABLE `firearm_brands` DISABLE KEYS */;
INSERT INTO `firearm_brands` VALUES (1,'Glock'),(2,'Accu-Tek'),(3,'American Derringer'),(4,'AMT'),(5,'Arcus'),(6,'ArmaLite'),(7,'Arminius'),(8,'Armscor-Rock Island Armory'),(9,'Astra'),(10,'Autauga Arms'),(11,'Auto-Ordnance'),(12,'Beretta'),(13,'Bersa'),(14,'Boberg'),(15,'Bond Arms'),(16,'Browning'),(17,'BUL'),(18,'Chiappa'),(19,'Citadel'),(20,'Cobra'),(21,'Colt'),(22,'CAG'),(23,'Canik'),(24,'Caracal'),(25,'Charles Daly'),(26,'Coonan'),(27,'CZ'),(28,'Daewoo'),(29,'Dan Wesson'),(30,'Detonics'),(31,'Diamond Back'),(32,'EAA'),(33,'Ed Brown'),(34,'Excel Arms'),(35,'FEG'),(36,'FIE'),(37,'Firestorm'),(38,'FMK'),(39,'FN'),(40,'Girsan'),(41,'Grand Power'),(42,'Heritage'),(43,'Hi-Point'),(44,'Hi-Standard'),(45,'HK'),(46,'Honor Defense'),(47,'ISSC'),(48,'IWI'),(49,'Jimenez'),(50,'Kahr Arms'),(51,'Kel-Tec'),(52,'Kimber'),(53,'Korth'),(54,'Les Baer'),(55,'Lionheart'),(56,'Liama'),(57,'Magnum Research'),(58,'Mauser'),(59,'Metro Arms'),(60,'NAA'),(61,'Norinco'),(62,'Olympic Arms'),(63,'Para'),(64,'Phoenix Arms'),(65,'Randall'),(66,'Raven'),(67,'Remington'),(68,'Rex'),(69,'Rexio'),(70,'Rohrbaugh'),(71,'Rossi'),(72,'RRA'),(73,'Ruger'),(74,'Sarsilmaz'),(75,'Sccy'),(76,'Seecamp'),(77,'SIG'),(78,'Smith & Wesson'),(79,'Sphinx'),(80,'Springfield Armory'),(81,'Star'),(82,'Stayr'),(83,'STI'),(84,'Stoeger'),(85,'Tanfoglio'),(86,'Taurus'),(87,'TriStar'),(88,'Uberti'),(89,'US Firearms'),(90,'Walther'),(91,'Wilson Combat'),(92,'Zastava');
/*!40000 ALTER TABLE `firearm_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firearm_calibers`
--

DROP TABLE IF EXISTS `firearm_calibers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firearm_calibers` (
  `caliber` varchar(15) NOT NULL,
  UNIQUE KEY `caliber_UNIQUE` (`caliber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firearm_calibers`
--

LOCK TABLES `firearm_calibers` WRITE;
/*!40000 ALTER TABLE `firearm_calibers` DISABLE KEYS */;
/*!40000 ALTER TABLE `firearm_calibers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firearm_models`
--

DROP TABLE IF EXISTS `firearm_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firearm_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `model` varchar(25) NOT NULL,
  `caliber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `firearm_model_id_idx` (`id`),
  KEY `brand_id_idx` (`brand_id`),
  CONSTRAINT `brand_id` FOREIGN KEY (`brand_id`) REFERENCES `firearm_brands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firearm_models`
--

LOCK TABLES `firearm_models` WRITE;
/*!40000 ALTER TABLE `firearm_models` DISABLE KEYS */;
INSERT INTO `firearm_models` VALUES (1,1,'G17','9X19'),(2,1,'G17C','9X19'),(3,1,'G17L','9X19'),(4,1,'G19','9X19'),(5,1,'G19C','9X19'),(6,1,'G20','10mm Auto'),(7,1,'G21','.45 Auto'),(8,1,'G22','.40'),(9,1,'G22C','.40'),(10,1,'G23','.40'),(11,1,'G23C','.40'),(12,1,'G24','.40'),(13,1,'G26','9X19'),(14,1,'G27','.40'),(15,1,'G29','10mm Auto'),(16,1,'G30','.45 Auto'),(17,1,'G31','.357'),(18,1,'G32','.357'),(19,1,'G33','.357'),(20,1,'G34','9X19'),(21,1,'G35','.40'),(22,1,'G36 ','.45 Auto'),(23,1,'G37','.45 G.A.P.'),(24,1,'G38','.45 G.A.P.'),(25,1,'G39','.45 G.A.P.'),(26,1,'G40','10mm Auto'),(27,1,'G41','.45 Auto'),(28,1,'G42','.380 Auto'),(29,1,'G43','9X19'),(33,27,'Czechmate',NULL),(34,27,'Tactical Sport Orange',NULL);
/*!40000 ALTER TABLE `firearm_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_codes`
--

DROP TABLE IF EXISTS `role_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_codes` (
  `code` varchar(1) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_codes`
--

LOCK TABLES `role_codes` WRITE;
/*!40000 ALTER TABLE `role_codes` DISABLE KEYS */;
INSERT INTO `role_codes` VALUES ('A','Admin'),('C','Competitor'),('M','Manager');
/*!40000 ALTER TABLE `role_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_codes`
--

DROP TABLE IF EXISTS `status_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_codes` (
  `code` varchar(1) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `id_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_codes`
--

LOCK TABLES `status_codes` WRITE;
/*!40000 ALTER TABLE `status_codes` DISABLE KEYS */;
INSERT INTO `status_codes` VALUES ('C','Complete'),('I','In Progress'),('N','Not Started');
/*!40000 ALTER TABLE `status_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tournament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'I',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `account_id_idx` (`account_id`),
  KEY `status_idx` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament`
--

LOCK TABLES `tournament` WRITE;
/*!40000 ALTER TABLE `tournament` DISABLE KEYS */;
INSERT INTO `tournament` VALUES (1,1,'GSSF Winter Tournament 2018','Vinh\'s Shooting Academy Winter GSSF tournament','I'),(2,2,'GSSF Winter Tournament 2018','Tim\'s Shooting Academy Winter GSSF Tournament','I'),(4,1,'Bullseye Winter Tournament','Bullseye Winter Tournament','I');
/*!40000 ALTER TABLE `tournament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(1) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(166) NOT NULL,
  `email` varchar(256) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `role_code_idx` (`role_code`),
  CONSTRAINT `role_code` FOREIGN KEY (`role_code`) REFERENCES `role_codes` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'A','Josh','Josh','josh','1000:cab7ff81f6a278e4548c2796de24a051:702ca8c53b59391f8e6905a81b42629af8e090f3453dda3fdeb21657d4f03585e7205bb8112e33d453798105100b9ced980e0f7d1ca9d96b79a87da158845889','',2,'2018-01-05 00:00:00',NULL),(5,'A','Vinh','Dang','vinh','1000:5cd340cb1227399f47db0c2d4e9c6afe:20df1b7e0334f4fdbe6b50d650843885396d6123698c0939d9d78d724549f1d62bc64847da132d005ea139afccf14a2fe966043e3922565fe7f9c6ba2ebcd25c','vinh@envisageconsulting.com',1,'2018-01-05 00:00:00',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-19  2:07:17
