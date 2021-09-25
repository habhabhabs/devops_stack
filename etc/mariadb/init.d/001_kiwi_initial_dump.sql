-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: default
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB-1:10.6.4+maria~focal

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

USE kiwi;

--
-- Table structure for table `attachments_attachment`
--

DROP TABLE IF EXISTS `attachments_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_file` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_attachme_content_type_id_35dd9d5d_fk_django_co` (`content_type_id`),
  KEY `attachments_attachment_creator_id_d471ef83_fk_auth_user_id` (`creator_id`),
  KEY `attachments_attachment_created_96fbcd43` (`created`),
  KEY `attachments_attachment_modified_1d39a3d7` (`modified`),
  KEY `attachments_attachment_object_id_102ce831` (`object_id`),
  CONSTRAINT `attachments_attachme_content_type_id_35dd9d5d_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `attachments_attachment_creator_id_d471ef83_fk_auth_user_id` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments_attachment`
--

LOCK TABLES `attachments_attachment` WRITE;
/*!40000 ALTER TABLE `attachments_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Administrator'),(2,'Tester');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,1,81),(82,1,82),(83,1,83),(84,1,84),(85,1,85),(86,1,86),(87,1,87),(88,1,88),(89,1,89),(90,1,90),(91,1,91),(92,1,92),(93,1,93),(94,1,94),(95,1,95),(96,1,96),(97,1,97),(98,1,98),(99,1,99),(100,1,100),(101,1,101),(102,1,102),(103,1,103),(104,1,104),(105,1,105),(106,1,106),(107,1,107),(108,1,108),(109,1,109),(110,1,110),(111,1,111),(112,1,112),(113,1,113),(114,1,114),(115,1,115),(116,1,116),(117,1,117),(118,1,118),(119,1,119),(120,1,120),(121,1,121),(122,1,122),(123,1,123),(124,1,124),(125,1,125),(126,1,126),(127,1,127),(128,1,128),(129,1,129),(130,1,130),(131,1,131),(132,1,132),(133,1,133),(134,1,134),(135,1,135),(136,1,136),(137,1,137),(138,1,138),(139,1,139),(140,1,140),(141,1,141),(142,1,142),(143,1,143),(144,1,144),(145,1,145),(146,1,146),(147,1,147),(148,1,148),(149,1,149),(150,1,150),(151,1,151),(152,1,152),(153,1,153),(154,1,154),(155,1,155),(156,1,156),(157,1,157),(158,1,158),(159,1,159),(160,1,160),(161,1,161),(162,1,162),(163,1,163),(164,1,164),(165,1,165),(166,1,166),(167,1,167),(168,1,168),(169,1,169),(170,1,170),(171,1,171),(172,1,172),(173,1,173),(174,1,174),(175,1,175),(176,1,176),(177,1,177),(178,1,178),(179,1,179),(180,1,180),(181,1,181),(182,1,182),(321,2,13),(322,2,14),(323,2,15),(320,2,16),(195,2,18),(196,2,19),(197,2,20),(198,2,21),(199,2,22),(200,2,23),(201,2,24),(202,2,25),(203,2,26),(204,2,27),(205,2,28),(206,2,29),(207,2,30),(208,2,31),(209,2,32),(210,2,33),(211,2,34),(212,2,35),(213,2,36),(214,2,37),(215,2,38),(216,2,39),(217,2,40),(218,2,41),(219,2,42),(220,2,43),(221,2,44),(222,2,45),(223,2,46),(224,2,47),(225,2,48),(226,2,49),(227,2,50),(228,2,51),(229,2,52),(230,2,53),(231,2,54),(232,2,55),(233,2,56),(234,2,57),(235,2,58),(236,2,59),(237,2,60),(238,2,61),(239,2,62),(240,2,63),(241,2,64),(242,2,65),(243,2,66),(244,2,67),(245,2,68),(246,2,69),(247,2,70),(248,2,71),(249,2,72),(250,2,73),(251,2,74),(252,2,75),(253,2,76),(254,2,77),(255,2,78),(256,2,79),(257,2,80),(258,2,81),(259,2,82),(260,2,83),(261,2,84),(262,2,85),(263,2,86),(264,2,87),(265,2,88),(266,2,89),(267,2,90),(268,2,91),(269,2,92),(270,2,93),(271,2,94),(272,2,95),(273,2,96),(274,2,97),(275,2,98),(276,2,99),(277,2,100),(278,2,101),(279,2,102),(280,2,103),(281,2,104),(282,2,105),(283,2,106),(284,2,107),(285,2,108),(286,2,109),(287,2,110),(288,2,111),(289,2,112),(290,2,113),(291,2,114),(307,2,115),(308,2,116),(309,2,117),(310,2,118),(311,2,119),(312,2,120),(313,2,121),(314,2,122),(315,2,123),(316,2,124),(317,2,125),(318,2,126),(319,2,127),(292,2,128),(293,2,129),(294,2,130),(295,2,131),(296,2,132),(297,2,133),(298,2,134),(299,2,135),(300,2,136),(301,2,137),(302,2,138),(303,2,139),(304,2,140),(305,2,141),(306,2,142),(183,2,143),(184,2,144),(185,2,145),(186,2,146),(187,2,147),(188,2,148),(189,2,149),(190,2,150),(191,2,151),(192,2,152),(193,2,153),(194,2,154);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add site',1,'add_site'),(2,'Can change site',1,'change_site'),(3,'Can delete site',1,'delete_site'),(4,'Can view site',1,'view_site'),(5,'Can add group object permission',2,'add_groupobjectpermission'),(6,'Can change group object permission',2,'change_groupobjectpermission'),(7,'Can delete group object permission',2,'delete_groupobjectpermission'),(8,'Can view group object permission',2,'view_groupobjectpermission'),(9,'Can add user object permission',3,'add_userobjectpermission'),(10,'Can change user object permission',3,'change_userobjectpermission'),(11,'Can delete user object permission',3,'delete_userobjectpermission'),(12,'Can view user object permission',3,'view_userobjectpermission'),(13,'Can add attachment',4,'add_attachment'),(14,'Can change attachment',4,'change_attachment'),(15,'Can delete attachment',4,'delete_attachment'),(16,'Can view attachment',4,'view_attachment'),(17,'Can delete foreign attachments',4,'delete_foreign_attachments'),(18,'Can add comment',5,'add_comment'),(19,'Can change comment',5,'change_comment'),(20,'Can delete comment',5,'delete_comment'),(21,'Can view comment',5,'view_comment'),(22,'Can moderate comments',5,'can_moderate'),(23,'Can add comment flag',6,'add_commentflag'),(24,'Can change comment flag',6,'change_commentflag'),(25,'Can delete comment flag',6,'delete_commentflag'),(26,'Can view comment flag',6,'view_commentflag'),(27,'Can add link reference',7,'add_linkreference'),(28,'Can change link reference',7,'change_linkreference'),(29,'Can delete link reference',7,'delete_linkreference'),(30,'Can view link reference',7,'view_linkreference'),(31,'Can add classification',8,'add_classification'),(32,'Can change classification',8,'change_classification'),(33,'Can delete classification',8,'delete_classification'),(34,'Can view classification',8,'view_classification'),(35,'Can add component',9,'add_component'),(36,'Can change component',9,'change_component'),(37,'Can delete component',9,'delete_component'),(38,'Can view component',9,'view_component'),(39,'Can add priority',10,'add_priority'),(40,'Can change priority',10,'change_priority'),(41,'Can delete priority',10,'delete_priority'),(42,'Can view priority',10,'view_priority'),(43,'Can add product',11,'add_product'),(44,'Can change product',11,'change_product'),(45,'Can delete product',11,'delete_product'),(46,'Can view product',11,'view_product'),(47,'Can add Build',12,'add_build'),(48,'Can change Build',12,'change_build'),(49,'Can delete Build',12,'delete_build'),(50,'Can view Build',12,'view_build'),(51,'Can add tag',13,'add_tag'),(52,'Can change tag',13,'change_tag'),(53,'Can delete tag',13,'delete_tag'),(54,'Can view tag',13,'view_tag'),(55,'Can add version',14,'add_version'),(56,'Can change version',14,'change_version'),(57,'Can delete version',14,'delete_version'),(58,'Can view version',14,'view_version'),(59,'Can add Test case status',15,'add_testcasestatus'),(60,'Can change Test case status',15,'change_testcasestatus'),(61,'Can delete Test case status',15,'delete_testcasestatus'),(62,'Can view Test case status',15,'view_testcasestatus'),(63,'Can add category',16,'add_category'),(64,'Can change category',16,'change_category'),(65,'Can delete category',16,'delete_category'),(66,'Can view category',16,'view_category'),(67,'Can add test case',17,'add_testcase'),(68,'Can change test case',17,'change_testcase'),(69,'Can delete test case',17,'delete_testcase'),(70,'Can view test case',17,'view_testcase'),(71,'Can add test case component',18,'add_testcasecomponent'),(72,'Can change test case component',18,'change_testcasecomponent'),(73,'Can delete test case component',18,'delete_testcasecomponent'),(74,'Can view test case component',18,'view_testcasecomponent'),(75,'Can add test case plan',19,'add_testcaseplan'),(76,'Can change test case plan',19,'change_testcaseplan'),(77,'Can delete test case plan',19,'delete_testcaseplan'),(78,'Can view test case plan',19,'view_testcaseplan'),(79,'Can add test case tag',20,'add_testcasetag'),(80,'Can change test case tag',20,'change_testcasetag'),(81,'Can delete test case tag',20,'delete_testcasetag'),(82,'Can view test case tag',20,'view_testcasetag'),(83,'Can add historical test case',21,'add_historicaltestcase'),(84,'Can change historical test case',21,'change_historicaltestcase'),(85,'Can delete historical test case',21,'delete_historicaltestcase'),(86,'Can view historical test case',21,'view_historicaltestcase'),(87,'Can add Bug tracker',22,'add_bugsystem'),(88,'Can change Bug tracker',22,'change_bugsystem'),(89,'Can delete Bug tracker',22,'delete_bugsystem'),(90,'Can view Bug tracker',22,'view_bugsystem'),(91,'Can add test case email settings',23,'add_testcaseemailsettings'),(92,'Can change test case email settings',23,'change_testcaseemailsettings'),(93,'Can delete test case email settings',23,'delete_testcaseemailsettings'),(94,'Can view test case email settings',23,'view_testcaseemailsettings'),(95,'Can add test plan',24,'add_testplan'),(96,'Can change test plan',24,'change_testplan'),(97,'Can delete test plan',24,'delete_testplan'),(98,'Can view test plan',24,'view_testplan'),(99,'Can add test plan email settings',25,'add_testplanemailsettings'),(100,'Can change test plan email settings',25,'change_testplanemailsettings'),(101,'Can delete test plan email settings',25,'delete_testplanemailsettings'),(102,'Can view test plan email settings',25,'view_testplanemailsettings'),(103,'Can add test plan tag',26,'add_testplantag'),(104,'Can change test plan tag',26,'change_testplantag'),(105,'Can delete test plan tag',26,'delete_testplantag'),(106,'Can view test plan tag',26,'view_testplantag'),(107,'Can add plan type',27,'add_plantype'),(108,'Can change plan type',27,'change_plantype'),(109,'Can delete plan type',27,'delete_plantype'),(110,'Can view plan type',27,'view_plantype'),(111,'Can add historical test plan',28,'add_historicaltestplan'),(112,'Can change historical test plan',28,'change_historicaltestplan'),(113,'Can delete historical test plan',28,'delete_historicaltestplan'),(114,'Can view historical test plan',28,'view_historicaltestplan'),(115,'Can add test run',29,'add_testrun'),(116,'Can change test run',29,'change_testrun'),(117,'Can delete test run',29,'delete_testrun'),(118,'Can view test run',29,'view_testrun'),(119,'Can add test run cc',30,'add_testruncc'),(120,'Can change test run cc',30,'change_testruncc'),(121,'Can delete test run cc',30,'delete_testruncc'),(122,'Can view test run cc',30,'view_testruncc'),(123,'Can add test run tag',31,'add_testruntag'),(124,'Can change test run tag',31,'change_testruntag'),(125,'Can delete test run tag',31,'delete_testruntag'),(126,'Can view test run tag',31,'view_testruntag'),(127,'Can add historical test run',32,'add_historicaltestrun'),(128,'Can change historical test run',32,'change_historicaltestrun'),(129,'Can delete historical test run',32,'delete_historicaltestrun'),(130,'Can view historical test run',32,'view_historicaltestrun'),(131,'Can add test execution',33,'add_testexecution'),(132,'Can change test execution',33,'change_testexecution'),(133,'Can delete test execution',33,'delete_testexecution'),(134,'Can view test execution',33,'view_testexecution'),(135,'Can add test execution status',34,'add_testexecutionstatus'),(136,'Can change test execution status',34,'change_testexecutionstatus'),(137,'Can delete test execution status',34,'delete_testexecutionstatus'),(138,'Can view test execution status',34,'view_testexecutionstatus'),(139,'Can add historical test execution',35,'add_historicaltestexecution'),(140,'Can change historical test execution',35,'change_historicaltestexecution'),(141,'Can delete historical test execution',35,'delete_historicaltestexecution'),(142,'Can view historical test execution',35,'view_historicaltestexecution'),(143,'Can add bug-testexecution relationship',37,'add_bug_executions'),(144,'Can change bug-testexecution relationship',37,'change_bug_executions'),(145,'Can delete bug-testexecution relationship',37,'delete_bug_executions'),(146,'Can view bug-testexecution relationship',37,'view_bug_executions'),(147,'Can add bug-tag relationship',38,'add_bug_tags'),(148,'Can change bug-tag relationship',38,'change_bug_tags'),(149,'Can delete bug-tag relationship',38,'delete_bug_tags'),(150,'Can view bug-tag relationship',38,'view_bug_tags'),(151,'Can add bug',36,'add_bug'),(152,'Can change bug',36,'change_bug'),(153,'Can delete bug',36,'delete_bug'),(154,'Can view bug',36,'view_bug'),(155,'Can add log entry',39,'add_logentry'),(156,'Can change log entry',39,'change_logentry'),(157,'Can delete log entry',39,'delete_logentry'),(158,'Can view log entry',39,'view_logentry'),(159,'Can add permission',40,'add_permission'),(160,'Can change permission',40,'change_permission'),(161,'Can delete permission',40,'delete_permission'),(162,'Can view permission',40,'view_permission'),(163,'Can add group',41,'add_group'),(164,'Can change group',41,'change_group'),(165,'Can delete group',41,'delete_group'),(166,'Can view group',41,'view_group'),(167,'Can add user',42,'add_user'),(168,'Can change user',42,'change_user'),(169,'Can delete user',42,'delete_user'),(170,'Can view user',42,'view_user'),(171,'Can add content type',43,'add_contenttype'),(172,'Can change content type',43,'change_contenttype'),(173,'Can delete content type',43,'delete_contenttype'),(174,'Can view content type',43,'view_contenttype'),(175,'Can add session',44,'add_session'),(176,'Can change session',44,'change_session'),(177,'Can delete session',44,'delete_session'),(178,'Can view session',44,'view_session'),(179,'Can add user activation key',45,'add_useractivationkey'),(180,'Can change user activation key',45,'change_useractivationkey'),(181,'Can delete user activation key',45,'delete_useractivationkey'),(182,'Can view user activation key',45,'view_useractivationkey');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'!f5rlYku7ZWZ6cQ8jPqEl1kMSOPj8j91wNl2B0tbO',NULL,0,'AnonymousUser','','','',0,1,'2021-09-24 12:44:23.549320'),(2,'pbkdf2_sha256$260000$hRfafSBYtmHZhl0bZgJiBd$B0VKu9bO3hEzghNVSfV40rQSLuqUmMipBd84rYplCd0=',NULL,1,'sysadmin','','','sysadmin@noreply.sgdevlab.com',1,1,'2021-09-24 12:44:57.761763');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs_bug`
--

DROP TABLE IF EXISTS `bugs_bug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs_bug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `build_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `version_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bugs_bug_assignee_id_2006cbf7_fk_auth_user_id` (`assignee_id`),
  KEY `bugs_bug_build_id_f3b6bc1b_fk_management_build_build_id` (`build_id`),
  KEY `bugs_bug_product_id_a052f422_fk_management_product_id` (`product_id`),
  KEY `bugs_bug_reporter_id_f3c433c0_fk_auth_user_id` (`reporter_id`),
  KEY `bugs_bug_version_id_9e5c9e9d_fk_management_version_id` (`version_id`),
  KEY `bugs_bug_summary_8321d37f` (`summary`),
  KEY `bugs_bug_created_at_f132529e` (`created_at`),
  KEY `bugs_bug_status_3e54f71f` (`status`),
  CONSTRAINT `bugs_bug_assignee_id_2006cbf7_fk_auth_user_id` FOREIGN KEY (`assignee_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `bugs_bug_build_id_f3b6bc1b_fk_management_build_build_id` FOREIGN KEY (`build_id`) REFERENCES `management_build` (`id`),
  CONSTRAINT `bugs_bug_product_id_a052f422_fk_management_product_id` FOREIGN KEY (`product_id`) REFERENCES `management_product` (`id`),
  CONSTRAINT `bugs_bug_reporter_id_f3c433c0_fk_auth_user_id` FOREIGN KEY (`reporter_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `bugs_bug_version_id_9e5c9e9d_fk_management_version_id` FOREIGN KEY (`version_id`) REFERENCES `management_version` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs_bug`
--

LOCK TABLES `bugs_bug` WRITE;
/*!40000 ALTER TABLE `bugs_bug` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs_bug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs_bug_executions`
--

DROP TABLE IF EXISTS `bugs_bug_executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs_bug_executions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL,
  `testexecution_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugs_bug_executions_bug_id_testexecution_id_0fd55cb1_uniq` (`bug_id`,`testexecution_id`),
  KEY `bugs_bug_executions_testexecution_id_b835d93d_fk_testruns_` (`testexecution_id`),
  CONSTRAINT `bugs_bug_executions_bug_id_3a87c570_fk_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs_bug` (`id`),
  CONSTRAINT `bugs_bug_executions_testexecution_id_b835d93d_fk_testruns_` FOREIGN KEY (`testexecution_id`) REFERENCES `testruns_testexecution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs_bug_executions`
--

LOCK TABLES `bugs_bug_executions` WRITE;
/*!40000 ALTER TABLE `bugs_bug_executions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs_bug_executions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs_bug_tags`
--

DROP TABLE IF EXISTS `bugs_bug_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs_bug_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugs_bug_tags_bug_id_tag_id_e88c85cd_uniq` (`bug_id`,`tag_id`),
  KEY `bugs_bug_tags_tag_id_c3ddee2f_fk_management_tag_tag_id` (`tag_id`),
  CONSTRAINT `bugs_bug_tags_bug_id_d465bac2_fk_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs_bug` (`id`),
  CONSTRAINT `bugs_bug_tags_tag_id_c3ddee2f_fk_management_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `management_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs_bug_tags`
--

LOCK TABLES `bugs_bug_tags` WRITE;
/*!40000 ALTER TABLE `bugs_bug_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs_bug_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_flags`
--

DROP TABLE IF EXISTS `django_comment_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag_date` datetime(6) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_comment_flags_user_id_comment_id_flag_537f77a7_uniq` (`user_id`,`comment_id`,`flag`),
  KEY `django_comment_flags_comment_id_d8054933_fk_django_comments_id` (`comment_id`),
  KEY `django_comment_flags_flag_8b141fcb` (`flag`),
  CONSTRAINT `django_comment_flags_comment_id_d8054933_fk_django_comments_id` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `django_comment_flags_user_id_f3f81f0a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_flags`
--

LOCK TABLES `django_comment_flags` WRITE;
/*!40000 ALTER TABLE `django_comment_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comments`
--

DROP TABLE IF EXISTS `django_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `submit_date` datetime(6) NOT NULL,
  `ip_address` char(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comments_content_type_id_c4afe962_fk_django_co` (`content_type_id`),
  KEY `django_comments_site_id_9dcf666e_fk_django_site_id` (`site_id`),
  KEY `django_comments_user_id_a0a440a1_fk_auth_user_id` (`user_id`),
  KEY `django_comments_submit_date_514ed2d9` (`submit_date`),
  KEY `django_comments_is_removed_52a03ae3` (`is_removed`),
  KEY `django_comments_object_pk_7fc98e83` (`object_pk`),
  CONSTRAINT `django_comments_content_type_id_c4afe962_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_comments_site_id_9dcf666e_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `django_comments_user_id_a0a440a1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comments`
--

LOCK TABLES `django_comments` WRITE;
/*!40000 ALTER TABLE `django_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (39,'admin','logentry'),(4,'attachments','attachment'),(41,'auth','group'),(40,'auth','permission'),(42,'auth','user'),(36,'bugs','bug'),(37,'bugs','bug_executions'),(38,'bugs','bug_tags'),(43,'contenttypes','contenttype'),(5,'django_comments','comment'),(6,'django_comments','commentflag'),(2,'guardian','groupobjectpermission'),(3,'guardian','userobjectpermission'),(45,'kiwi_auth','useractivationkey'),(7,'linkreference','linkreference'),(12,'management','build'),(8,'management','classification'),(9,'management','component'),(10,'management','priority'),(11,'management','product'),(13,'management','tag'),(14,'management','version'),(44,'sessions','session'),(1,'sites','site'),(22,'testcases','bugsystem'),(16,'testcases','category'),(21,'testcases','historicaltestcase'),(17,'testcases','testcase'),(18,'testcases','testcasecomponent'),(23,'testcases','testcaseemailsettings'),(19,'testcases','testcaseplan'),(15,'testcases','testcasestatus'),(20,'testcases','testcasetag'),(28,'testplans','historicaltestplan'),(27,'testplans','plantype'),(24,'testplans','testplan'),(25,'testplans','testplanemailsettings'),(26,'testplans','testplantag'),(35,'testruns','historicaltestexecution'),(32,'testruns','historicaltestrun'),(33,'testruns','testexecution'),(34,'testruns','testexecutionstatus'),(29,'testruns','testrun'),(30,'testruns','testruncc'),(31,'testruns','testruntag');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-24 12:43:37.803056'),(2,'auth','0001_initial','2021-09-24 12:43:37.956754'),(3,'admin','0001_initial','2021-09-24 12:43:37.998735'),(4,'admin','0002_logentry_remove_auto_add','2021-09-24 12:43:38.005472'),(5,'admin','0003_logentry_add_action_flag_choices','2021-09-24 12:43:38.012266'),(6,'attachments','0001_initial','2021-09-24 12:43:38.062311'),(7,'attachments','0002_auto_20180104_1247','2021-09-24 12:43:38.070591'),(8,'attachments','0003_auto_20190722_1216','2021-09-24 12:43:38.103857'),(9,'attachments','0004_db_index','2021-09-24 12:43:38.144413'),(10,'attachments','0005_object_id_charfield','2021-09-24 12:43:38.180613'),(11,'contenttypes','0002_remove_content_type_name','2021-09-24 12:43:38.224263'),(12,'auth','0002_alter_permission_name_max_length','2021-09-24 12:43:38.247715'),(13,'auth','0003_alter_user_email_max_length','2021-09-24 12:43:38.267013'),(14,'auth','0004_alter_user_username_opts','2021-09-24 12:43:38.298992'),(15,'auth','0005_alter_user_last_login_null','2021-09-24 12:43:38.324213'),(16,'auth','0006_require_contenttypes_0002','2021-09-24 12:43:38.326702'),(17,'auth','0007_alter_validators_add_error_messages','2021-09-24 12:43:38.336578'),(18,'auth','0008_alter_user_username_max_length','2021-09-24 12:43:38.356757'),(19,'auth','0009_alter_user_last_name_max_length','2021-09-24 12:43:38.375635'),(20,'auth','0010_alter_group_name_max_length','2021-09-24 12:43:38.396614'),(21,'auth','0011_update_proxy_permissions','2021-09-24 12:43:38.406552'),(22,'auth','0012_alter_user_first_name_max_length','2021-09-24 12:43:38.435564'),(23,'sites','0001_initial','2021-09-24 12:43:38.443524'),(24,'core','0001_squashed','2021-09-24 12:43:38.468860'),(25,'management','0003_squashed','2021-09-24 12:43:38.704416'),(26,'testplans','0005_squashed','2021-09-24 12:43:39.192412'),(27,'testcases','0001_initial','2021-09-24 12:43:40.441364'),(28,'testruns','0004_squashed','2021-09-24 12:43:42.396930'),(29,'testruns','0005_remove_unused_fields','2021-09-24 12:43:43.063459'),(30,'testcases','0004_squashed','2021-09-24 12:43:43.277583'),(31,'testcases','0005_remove_unused_fields','2021-09-24 12:43:43.673685'),(32,'testcases','0006_merge_text_field_into_testcase_model','2021-09-24 12:43:44.391751'),(33,'testcases','0007_convert_is_automated_to_boolean','2021-09-24 12:43:45.166306'),(34,'testcases','0008_notifications_default_true','2021-09-24 12:43:45.589825'),(35,'management','0004_remove_sortkey_description','2021-09-24 12:43:45.745029'),(36,'management','0005_order_by_name','2021-09-24 12:43:46.006881'),(37,'linkreference','0001_squashed','2021-09-24 12:43:46.224460'),(38,'testruns','0006_rename_test_case_run_to_test_execution','2021-09-24 12:43:47.594766'),(39,'bugs','0001_initial','2021-09-24 12:43:48.021875'),(40,'bugs','0002_add_permissions','2021-09-24 12:43:48.240736'),(41,'django_comments','0001_initial','2021-09-24 12:43:48.901674'),(42,'django_comments','0002_update_user_email_field_length','2021-09-24 12:43:49.021222'),(43,'django_comments','0003_add_submit_date_index','2021-09-24 12:43:49.147819'),(44,'django_comments','0004_add_object_pk_is_removed_index','2021-09-24 12:43:49.451660'),(45,'guardian','0001_initial','2021-09-24 12:43:50.187181'),(46,'guardian','0002_generic_permissions_index','2021-09-24 12:43:50.423681'),(47,'kiwi_auth','0001_initial','2021-09-24 12:43:50.676868'),(48,'linkreference','0002_update_fields','2021-09-24 12:43:50.950857'),(49,'linkreference','0003_add_db_index_to_url_field','2021-09-24 12:43:51.036596'),(50,'management','0006_remove_autofield_max_length','2021-09-24 12:43:52.187698'),(51,'management','0007_remove_autofield','2021-09-24 12:43:55.756417'),(52,'management','0008_increase_product_name_size','2021-09-24 12:43:55.851364'),(53,'management','0009_build_to_version','2021-09-24 12:43:57.112782'),(54,'sessions','0001_initial','2021-09-24 12:43:57.162902'),(55,'sites','0002_alter_domain_unique','2021-09-24 12:43:57.204856'),(56,'testcases','0009_populate_missing_text_history','2021-09-24 12:43:57.506629'),(57,'testcases','0010_remove_bug','2021-09-24 12:43:57.901436'),(58,'testcases','0011_trim_bugsystem_fields','2021-09-24 12:43:58.243690'),(59,'testcases','0012_remove_autofield_max_length','2021-09-24 12:43:58.524303'),(60,'testcases','0013_remove_autofield','2021-09-24 12:44:00.763103'),(61,'testcases','0014_update_issutracker_types','2021-09-24 12:44:01.112102'),(62,'testcases','0015_add_summary_db_index','2021-09-24 12:44:01.631145'),(63,'testcases','0016_testcasestatus_is_confirmed','2021-09-24 12:44:01.985352'),(64,'testcases','0017_rename_related_names','2021-09-24 12:44:02.423719'),(65,'testcases','0018_add_testcase_duration_fields','2021-09-24 12:44:03.504498'),(66,'testplans','0006_remove_testplan_owner','2021-09-24 12:44:04.344399'),(67,'testplans','0007_notifications_default_true','2021-09-24 12:44:05.092585'),(68,'testplans','0008_remove_autofield','2021-09-24 12:44:08.827389'),(69,'testplans','0009_tree','2021-09-24 12:44:09.679734'),(70,'testruns','0007_test_execution_statuses','2021-09-24 12:44:10.210859'),(71,'testruns','0008_test_execution_status_color_field','2021-09-24 12:44:10.304305'),(72,'testruns','0009_remove_autofield','2021-09-24 12:44:14.916103'),(73,'testruns','0010_rename_related_names','2021-09-24 12:44:16.622495'),(74,'testruns','0011_add_planning_fields','2021-09-24 12:44:18.095758'),(75,'testruns','0012_test_execusion_add_fields','2021-09-24 12:44:20.828224'),(76,'testruns','0013_remove_product_version','2021-09-24 12:44:22.142371'),(77,'testruns','0014_remove_auto_setting_start_date','2021-09-24 12:44:22.960775');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'sgdevlab.duckdns.org','Kiwi TCMS');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_groupobjectpermission`
--

DROP TABLE IF EXISTS `guardian_groupobjectpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardian_groupobjectpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq` (`group_id`,`permission_id`,`object_pk`),
  KEY `guardian_groupobject_permission_id_36572738_fk_auth_perm` (`permission_id`),
  KEY `guardian_gr_content_ae6aec_idx` (`content_type_id`,`object_pk`),
  CONSTRAINT `guardian_groupobject_content_type_id_7ade36b8_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `guardian_groupobject_group_id_4bbbfb62_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `guardian_groupobject_permission_id_36572738_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_groupobjectpermission`
--

LOCK TABLES `guardian_groupobjectpermission` WRITE;
/*!40000 ALTER TABLE `guardian_groupobjectpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardian_groupobjectpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_userobjectpermission`
--

DROP TABLE IF EXISTS `guardian_userobjectpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardian_userobjectpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq` (`user_id`,`permission_id`,`object_pk`),
  KEY `guardian_userobjectp_permission_id_71807bfc_fk_auth_perm` (`permission_id`),
  KEY `guardian_us_content_179ed2_idx` (`content_type_id`,`object_pk`),
  CONSTRAINT `guardian_userobjectp_content_type_id_2e892405_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `guardian_userobjectp_permission_id_71807bfc_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_userobjectpermission`
--

LOCK TABLES `guardian_userobjectpermission` WRITE;
/*!40000 ALTER TABLE `guardian_userobjectpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardian_userobjectpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kiwi_auth_useractivationkey`
--

DROP TABLE IF EXISTS `kiwi_auth_useractivationkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kiwi_auth_useractivationkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_key` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_expires` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kiwi_auth_useractivationkey_user_id_cb6f6f73_fk_auth_user_id` (`user_id`),
  CONSTRAINT `kiwi_auth_useractivationkey_user_id_cb6f6f73_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kiwi_auth_useractivationkey`
--

LOCK TABLES `kiwi_auth_useractivationkey` WRITE;
/*!40000 ALTER TABLE `kiwi_auth_useractivationkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `kiwi_auth_useractivationkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linkreference_linkreference`
--

DROP TABLE IF EXISTS `linkreference_linkreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linkreference_linkreference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `execution_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `is_defect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `linkreference_linkre_execution_id_0f007e30_fk_testruns_` (`execution_id`),
  KEY `linkreference_linkreference_created_on_9a8e5281` (`created_on`),
  KEY `linkreference_linkreference_is_defect_1afb0f5c` (`is_defect`),
  KEY `linkreference_linkreference_url_a67ef7ca` (`url`),
  CONSTRAINT `linkreference_linkre_execution_id_0f007e30_fk_testruns_` FOREIGN KEY (`execution_id`) REFERENCES `testruns_testexecution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linkreference_linkreference`
--

LOCK TABLES `linkreference_linkreference` WRITE;
/*!40000 ALTER TABLE `linkreference_linkreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `linkreference_linkreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_build`
--

DROP TABLE IF EXISTS `management_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management_build` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `management_build_version_id_name_0ca02373_uniq` (`version_id`,`name`),
  KEY `management_build_version_id_b16465e8` (`version_id`),
  CONSTRAINT `management_build_version_id_b16465e8_fk_management_version_id` FOREIGN KEY (`version_id`) REFERENCES `management_version` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_build`
--

LOCK TABLES `management_build` WRITE;
/*!40000 ALTER TABLE `management_build` DISABLE KEYS */;
/*!40000 ALTER TABLE `management_build` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_classification`
--

DROP TABLE IF EXISTS `management_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_classification`
--

LOCK TABLES `management_classification` WRITE;
/*!40000 ALTER TABLE `management_classification` DISABLE KEYS */;
/*!40000 ALTER TABLE `management_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_component`
--

DROP TABLE IF EXISTS `management_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_owner_id` int(11) DEFAULT NULL,
  `initial_qa_contact_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `management_component_product_id_name_2bff48aa_uniq` (`product_id`,`name`),
  KEY `management_component_initial_owner_id_983a4de8_fk_auth_user_id` (`initial_owner_id`),
  KEY `management_component_initial_qa_contact_i_00659846_fk_auth_user` (`initial_qa_contact_id`),
  CONSTRAINT `management_component_initial_owner_id_983a4de8_fk_auth_user_id` FOREIGN KEY (`initial_owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `management_component_initial_qa_contact_i_00659846_fk_auth_user` FOREIGN KEY (`initial_qa_contact_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `management_component_product_id_82d6de7e_fk_managemen` FOREIGN KEY (`product_id`) REFERENCES `management_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_component`
--

LOCK TABLES `management_component` WRITE;
/*!40000 ALTER TABLE `management_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `management_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_priority`
--

DROP TABLE IF EXISTS `management_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_priority`
--

LOCK TABLES `management_priority` WRITE;
/*!40000 ALTER TABLE `management_priority` DISABLE KEYS */;
INSERT INTO `management_priority` VALUES (1,'P1',1),(2,'P2',1),(3,'P3',1),(4,'P4',1),(5,'P5',1);
/*!40000 ALTER TABLE `management_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_product`
--

DROP TABLE IF EXISTS `management_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `classification_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `management_product_classification_id_e4e18e09_fk_managemen` (`classification_id`),
  CONSTRAINT `management_product_classification_id_e4e18e09_fk_managemen` FOREIGN KEY (`classification_id`) REFERENCES `management_classification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_product`
--

LOCK TABLES `management_product` WRITE;
/*!40000 ALTER TABLE `management_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `management_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_tag`
--

DROP TABLE IF EXISTS `management_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_tag`
--

LOCK TABLES `management_tag` WRITE;
/*!40000 ALTER TABLE `management_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `management_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_version`
--

DROP TABLE IF EXISTS `management_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `management_version_product_id_value_97d2c1b8_uniq` (`product_id`,`value`),
  CONSTRAINT `management_version_product_id_f1cf2daf_fk_management_product_id` FOREIGN KEY (`product_id`) REFERENCES `management_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_version`
--

LOCK TABLES `management_version` WRITE;
/*!40000 ALTER TABLE `management_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `management_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcases_bugsystem`
--

DROP TABLE IF EXISTS `testcases_bugsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcases_bugsystem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_url` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_password` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_username` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_url` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcases_bugsystem`
--

LOCK TABLES `testcases_bugsystem` WRITE;
/*!40000 ALTER TABLE `testcases_bugsystem` DISABLE KEYS */;
INSERT INTO `testcases_bugsystem` VALUES (1,'Bugzilla',NULL,NULL,NULL,'tcms.issuetracker.types.IssueTrackerType',NULL),(2,'JIRA',NULL,NULL,NULL,'tcms.issuetracker.types.IssueTrackerType',NULL);
/*!40000 ALTER TABLE `testcases_bugsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcases_category`
--

DROP TABLE IF EXISTS `testcases_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcases_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testcases_category_product_id_name_6f991fe0_uniq` (`product_id`,`name`),
  CONSTRAINT `testcases_category_product_id_f26067e7_fk_management_product_id` FOREIGN KEY (`product_id`) REFERENCES `management_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcases_category`
--

LOCK TABLES `testcases_category` WRITE;
/*!40000 ALTER TABLE `testcases_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcases_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcases_historicaltestcase`
--

DROP TABLE IF EXISTS `testcases_historicaltestcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcases_historicaltestcase` (
  `id` int(11) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `script` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arguments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_link` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_change_reason` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `case_status_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `default_tester_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_automated` tinyint(1) NOT NULL,
  `setup_duration` bigint(20) DEFAULT NULL,
  `testing_duration` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `testcases_historical_history_user_id_7091ce1e_fk_auth_user` (`history_user_id`),
  KEY `testcases_historicaltestcase_case_id_5aa11a82` (`id`),
  KEY `testcases_historicaltestcase_author_id_0cb2d010` (`author_id`),
  KEY `testcases_historicaltestcase_case_status_id_35c6b721` (`case_status_id`),
  KEY `testcases_historicaltestcase_category_id_05519a7a` (`category_id`),
  KEY `testcases_historicaltestcase_default_tester_id_4096f1c6` (`default_tester_id`),
  KEY `testcases_historicaltestcase_priority_id_defa02c4` (`priority_id`),
  KEY `testcases_historicaltestcase_reviewer_id_33c64d01` (`reviewer_id`),
  KEY `testcases_historicaltestcase_summary_92d50821` (`summary`),
  KEY `testcases_historicaltestcase_setup_duration_2342e865` (`setup_duration`),
  KEY `testcases_historicaltestcase_testing_duration_63c88e57` (`testing_duration`),
  CONSTRAINT `testcases_historical_history_user_id_7091ce1e_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcases_historicaltestcase`
--

LOCK TABLES `testcases_historicaltestcase` WRITE;
/*!40000 ALTER TABLE `testcases_historicaltestcase` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcases_historicaltestcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcases_testcase`
--

DROP TABLE IF EXISTS `testcases_testcase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcases_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `script` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arguments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_link` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `case_status_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `default_tester_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_automated` tinyint(1) NOT NULL,
  `setup_duration` bigint(20) DEFAULT NULL,
  `testing_duration` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `testcases_testcase_author_id_40ee8140_fk_auth_user_id` (`author_id`),
  KEY `testcases_testcase_case_status_id_506e2b3f_fk_testcases` (`case_status_id`),
  KEY `testcases_testcase_category_id_f52a4b36_fk_testcases` (`category_id`),
  KEY `testcases_testcase_default_tester_id_d9c8faf2_fk_auth_user_id` (`default_tester_id`),
  KEY `testcases_testcase_priority_id_06e62b85_fk_managemen` (`priority_id`),
  KEY `testcases_testcase_reviewer_id_4be5756e_fk_auth_user_id` (`reviewer_id`),
  KEY `testcases_testcase_summary_511d8323` (`summary`),
  KEY `testcases_testcase_setup_duration_56e5887d` (`setup_duration`),
  KEY `testcases_testcase_testing_duration_3ae6ba2d` (`testing_duration`),
  CONSTRAINT `testcases_testcase_author_id_40ee8140_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `testcases_testcase_case_status_id_506e2b3f_fk_testcases` FOREIGN KEY (`case_status_id`) REFERENCES `testcases_testcasestatus` (`id`),
  CONSTRAINT `testcases_testcase_category_id_f52a4b36_fk_testcases` FOREIGN KEY (`category_id`) REFERENCES `testcases_category` (`id`),
  CONSTRAINT `testcases_testcase_default_tester_id_d9c8faf2_fk_auth_user_id` FOREIGN KEY (`default_tester_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `testcases_testcase_priority_id_06e62b85_fk_managemen` FOREIGN KEY (`priority_id`) REFERENCES `management_priority` (`id`),
  CONSTRAINT `testcases_testcase_reviewer_id_4be5756e_fk_auth_user_id` FOREIGN KEY (`reviewer_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcases_testcase`
--

LOCK TABLES `testcases_testcase` WRITE;
/*!40000 ALTER TABLE `testcases_testcase` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcases_testcase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcases_testcasecomponent`
--

DROP TABLE IF EXISTS `testcases_testcasecomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcases_testcasecomponent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testcases_testcaseco_case_id_fc27e38a_fk_testcases` (`case_id`),
  KEY `testcases_testcaseco_component_id_edd78178_fk_managemen` (`component_id`),
  CONSTRAINT `testcases_testcaseco_case_id_fc27e38a_fk_testcases` FOREIGN KEY (`case_id`) REFERENCES `testcases_testcase` (`id`),
  CONSTRAINT `testcases_testcaseco_component_id_edd78178_fk_managemen` FOREIGN KEY (`component_id`) REFERENCES `management_component` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcases_testcasecomponent`
--

LOCK TABLES `testcases_testcasecomponent` WRITE;
/*!40000 ALTER TABLE `testcases_testcasecomponent` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcases_testcasecomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcases_testcaseemailsettings`
--

DROP TABLE IF EXISTS `testcases_testcaseemailsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcases_testcaseemailsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notify_on_case_update` tinyint(1) NOT NULL,
  `notify_on_case_delete` tinyint(1) NOT NULL,
  `auto_to_case_author` tinyint(1) NOT NULL,
  `auto_to_case_tester` tinyint(1) NOT NULL,
  `auto_to_run_manager` tinyint(1) NOT NULL,
  `auto_to_run_tester` tinyint(1) NOT NULL,
  `auto_to_execution_assignee` tinyint(1) NOT NULL,
  `case_id` int(11) NOT NULL,
  `cc_list` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `case_id` (`case_id`),
  CONSTRAINT `testcases_testcaseem_case_id_76dfe19b_fk_testcases` FOREIGN KEY (`case_id`) REFERENCES `testcases_testcase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcases_testcaseemailsettings`
--

LOCK TABLES `testcases_testcaseemailsettings` WRITE;
/*!40000 ALTER TABLE `testcases_testcaseemailsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcases_testcaseemailsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcases_testcaseplan`
--

DROP TABLE IF EXISTS `testcases_testcaseplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcases_testcaseplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortkey` int(11) DEFAULT NULL,
  `case_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testcases_testcaseplan_plan_id_case_id_16d50827_uniq` (`plan_id`,`case_id`),
  KEY `testcases_testcasepl_case_id_89f638fc_fk_testcases` (`case_id`),
  CONSTRAINT `testcases_testcasepl_case_id_89f638fc_fk_testcases` FOREIGN KEY (`case_id`) REFERENCES `testcases_testcase` (`id`),
  CONSTRAINT `testcases_testcasepl_plan_id_40b3d762_fk_testplans` FOREIGN KEY (`plan_id`) REFERENCES `testplans_testplan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcases_testcaseplan`
--

LOCK TABLES `testcases_testcaseplan` WRITE;
/*!40000 ALTER TABLE `testcases_testcaseplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcases_testcaseplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcases_testcasestatus`
--

DROP TABLE IF EXISTS `testcases_testcasestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcases_testcasestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_confirmed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testcases_testcasestatus_is_confirmed_ba7f915d` (`is_confirmed`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcases_testcasestatus`
--

LOCK TABLES `testcases_testcasestatus` WRITE;
/*!40000 ALTER TABLE `testcases_testcasestatus` DISABLE KEYS */;
INSERT INTO `testcases_testcasestatus` VALUES (1,'PROPOSED','',0),(2,'CONFIRMED','',1),(3,'DISABLED','',0),(4,'NEED_UPDATE','',0);
/*!40000 ALTER TABLE `testcases_testcasestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcases_testcasetag`
--

DROP TABLE IF EXISTS `testcases_testcasetag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcases_testcasetag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testcases_testcaseta_case_id_338ecd07_fk_testcases` (`case_id`),
  KEY `testcases_testcasetag_tag_id_b16f414a_fk_management_tag_tag_id` (`tag_id`),
  CONSTRAINT `testcases_testcaseta_case_id_338ecd07_fk_testcases` FOREIGN KEY (`case_id`) REFERENCES `testcases_testcase` (`id`),
  CONSTRAINT `testcases_testcasetag_tag_id_b16f414a_fk_management_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `management_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcases_testcasetag`
--

LOCK TABLES `testcases_testcasetag` WRITE;
/*!40000 ALTER TABLE `testcases_testcasetag` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcases_testcasetag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplans_historicaltestplan`
--

DROP TABLE IF EXISTS `testplans_historicaltestplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplans_historicaltestplan` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `extra_link` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_change_reason` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_version_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `testplans_historical_history_user_id_0b43ff14_fk_auth_user` (`history_user_id`),
  KEY `testplans_historicaltestplan_plan_id_91d31b13` (`id`),
  KEY `testplans_historicaltestplan_name_d1afc49f` (`name`),
  KEY `testplans_historicaltestplan_isactive_110bcb89` (`is_active`),
  KEY `testplans_historicaltestplan_author_id_7de6569d` (`author_id`),
  KEY `testplans_historicaltestplan_parent_id_4d7e6ee8` (`parent_id`),
  KEY `testplans_historicaltestplan_product_id_2410d78b` (`product_id`),
  KEY `testplans_historicaltestplan_product_version_id_4598a8b7` (`product_version_id`),
  KEY `testplans_historicaltestplan_type_id_65c12bbd` (`type_id`),
  CONSTRAINT `testplans_historical_history_user_id_0b43ff14_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplans_historicaltestplan`
--

LOCK TABLES `testplans_historicaltestplan` WRITE;
/*!40000 ALTER TABLE `testplans_historicaltestplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplans_historicaltestplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplans_plantype`
--

DROP TABLE IF EXISTS `testplans_plantype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplans_plantype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplans_plantype`
--

LOCK TABLES `testplans_plantype` WRITE;
/*!40000 ALTER TABLE `testplans_plantype` DISABLE KEYS */;
INSERT INTO `testplans_plantype` VALUES (1,'Unit',''),(2,'Integration',''),(3,'Function',''),(4,'System',''),(5,'Acceptance',''),(6,'Installation',''),(7,'Performance',''),(8,'Product',''),(9,'Interoperability',''),(10,'Smoke',''),(11,'Regression','');
/*!40000 ALTER TABLE `testplans_plantype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplans_testplan`
--

DROP TABLE IF EXISTS `testplans_testplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplans_testplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `extra_link` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_version_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testplans_testplan_author_id_8fc1910b_fk_auth_user_id` (`author_id`),
  KEY `testplans_testplan_parent_id_c3460a73_fk_testplans` (`parent_id`),
  KEY `testplans_testplan_product_version_id_0ad731f7_fk_managemen` (`product_version_id`),
  KEY `testplans_testplan_type_id_b83ae87b_fk_testplans` (`type_id`),
  KEY `testplans_testplan_name_0bcb1318` (`name`),
  KEY `testplans_testplan_isactive_4efcc884` (`is_active`),
  KEY `testplans_testplan_product_id_6e99180c` (`product_id`),
  CONSTRAINT `testplans_testplan_author_id_8fc1910b_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `testplans_testplan_parent_id_c3460a73_fk_testplans` FOREIGN KEY (`parent_id`) REFERENCES `testplans_testplan` (`id`),
  CONSTRAINT `testplans_testplan_product_id_6e99180c_fk_management_product_id` FOREIGN KEY (`product_id`) REFERENCES `management_product` (`id`),
  CONSTRAINT `testplans_testplan_product_version_id_0ad731f7_fk_managemen` FOREIGN KEY (`product_version_id`) REFERENCES `management_version` (`id`),
  CONSTRAINT `testplans_testplan_type_id_b83ae87b_fk_testplans` FOREIGN KEY (`type_id`) REFERENCES `testplans_plantype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplans_testplan`
--

LOCK TABLES `testplans_testplan` WRITE;
/*!40000 ALTER TABLE `testplans_testplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplans_testplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplans_testplanemailsettings`
--

DROP TABLE IF EXISTS `testplans_testplanemailsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplans_testplanemailsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_to_plan_author` tinyint(1) NOT NULL,
  `auto_to_case_owner` tinyint(1) NOT NULL,
  `auto_to_case_default_tester` tinyint(1) NOT NULL,
  `notify_on_plan_update` tinyint(1) NOT NULL,
  `notify_on_case_update` tinyint(1) NOT NULL,
  `plan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plan_id` (`plan_id`),
  CONSTRAINT `testplans_testplanem_plan_id_036c434f_fk_testplans` FOREIGN KEY (`plan_id`) REFERENCES `testplans_testplan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplans_testplanemailsettings`
--

LOCK TABLES `testplans_testplanemailsettings` WRITE;
/*!40000 ALTER TABLE `testplans_testplanemailsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplans_testplanemailsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplans_testplantag`
--

DROP TABLE IF EXISTS `testplans_testplantag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplans_testplantag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testplans_testplanta_plan_id_f5c9e46a_fk_testplans` (`plan_id`),
  KEY `testplans_testplantag_tag_id_4a5c61b6_fk_management_tag_tag_id` (`tag_id`),
  CONSTRAINT `testplans_testplanta_plan_id_f5c9e46a_fk_testplans` FOREIGN KEY (`plan_id`) REFERENCES `testplans_testplan` (`id`),
  CONSTRAINT `testplans_testplantag_tag_id_4a5c61b6_fk_management_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `management_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplans_testplantag`
--

LOCK TABLES `testplans_testplantag` WRITE;
/*!40000 ALTER TABLE `testplans_testplantag` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplans_testplantag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testruns_historicaltestexecution`
--

DROP TABLE IF EXISTS `testruns_historicaltestexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testruns_historicaltestexecution` (
  `id` int(11) NOT NULL,
  `case_text_version` int(11) NOT NULL,
  `stop_date` datetime(6) DEFAULT NULL,
  `sortkey` int(11) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_change_reason` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `build_id` int(11) DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `run_id` int(11) DEFAULT NULL,
  `tested_by_id` int(11) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `testruns_historicalt_history_user_id_d11b82d1_fk_auth_user` (`history_user_id`),
  KEY `testruns_historicaltestcaserun_case_run_id_870e6917` (`id`),
  KEY `testruns_historicaltestcaserun_assignee_id_d29156d3` (`assignee_id`),
  KEY `testruns_historicaltestcaserun_build_id_a1f62a12` (`build_id`),
  KEY `testruns_historicaltestcaserun_case_id_4dad63dd` (`case_id`),
  KEY `testruns_historicaltestcaserun_case_run_status_id_8e094bc0` (`status_id`),
  KEY `testruns_historicaltestcaserun_run_id_cbe73584` (`run_id`),
  KEY `testruns_historicaltestcaserun_tested_by_id_58ab895b` (`tested_by_id`),
  KEY `testruns_historicaltestexecution_stop_date_d659f81c` (`stop_date`),
  KEY `testruns_historicaltestexecution_start_date_3e5ed561` (`start_date`),
  CONSTRAINT `testruns_historicalt_history_user_id_d11b82d1_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testruns_historicaltestexecution`
--

LOCK TABLES `testruns_historicaltestexecution` WRITE;
/*!40000 ALTER TABLE `testruns_historicaltestexecution` DISABLE KEYS */;
/*!40000 ALTER TABLE `testruns_historicaltestexecution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testruns_historicaltestrun`
--

DROP TABLE IF EXISTS `testruns_historicaltestrun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testruns_historicaltestrun` (
  `id` int(11) NOT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `stop_date` datetime(6) DEFAULT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_change_reason` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `build_id` int(11) DEFAULT NULL,
  `default_tester_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `planned_start` datetime(6) DEFAULT NULL,
  `planned_stop` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `testruns_historicalt_history_user_id_8021d038_fk_auth_user` (`history_user_id`),
  KEY `testruns_historicaltestrun_run_id_0ef66b6e` (`id`),
  KEY `testruns_historicaltestrun_start_date_2966e83c` (`start_date`),
  KEY `testruns_historicaltestrun_stop_date_df8f576c` (`stop_date`),
  KEY `testruns_historicaltestrun_build_id_83cb88d1` (`build_id`),
  KEY `testruns_historicaltestrun_default_tester_id_bfc251b2` (`default_tester_id`),
  KEY `testruns_historicaltestrun_manager_id_48e016d3` (`manager_id`),
  KEY `testruns_historicaltestrun_plan_id_adfcb9d1` (`plan_id`),
  KEY `testruns_historicaltestrun_planned_start_614a868d` (`planned_start`),
  KEY `testruns_historicaltestrun_planned_stop_f3a63beb` (`planned_stop`),
  CONSTRAINT `testruns_historicalt_history_user_id_8021d038_fk_auth_user` FOREIGN KEY (`history_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testruns_historicaltestrun`
--

LOCK TABLES `testruns_historicaltestrun` WRITE;
/*!40000 ALTER TABLE `testruns_historicaltestrun` DISABLE KEYS */;
/*!40000 ALTER TABLE `testruns_historicaltestrun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testruns_testexecution`
--

DROP TABLE IF EXISTS `testruns_testexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testruns_testexecution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_text_version` int(11) NOT NULL,
  `stop_date` datetime(6) DEFAULT NULL,
  `sortkey` int(11) DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `build_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `run_id` int(11) NOT NULL,
  `tested_by_id` int(11) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testruns_testcaserun_case_id_run_id_case_text_8e2fe8df_uniq` (`case_id`,`run_id`,`case_text_version`),
  KEY `testruns_testcaserun_run_id_749e1f8b_fk_testruns_testrun_run_id` (`run_id`),
  KEY `testruns_testcaserun_tested_by_id_f03a7efe_fk_auth_user_id` (`tested_by_id`),
  KEY `testruns_testcaserun_assignee_id_0953e76e_fk_auth_user_id` (`assignee_id`),
  KEY `testruns_testcaserun_build_id_377936c9_fk_managemen` (`build_id`),
  KEY `testruns_testexecuti_status_id_82e677b4_fk_testruns_` (`status_id`),
  KEY `testruns_testexecution_stop_date_1e245a90` (`stop_date`),
  KEY `testruns_testexecution_start_date_d50373f5` (`start_date`),
  CONSTRAINT `testruns_testcaserun_assignee_id_0953e76e_fk_auth_user_id` FOREIGN KEY (`assignee_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `testruns_testcaserun_build_id_377936c9_fk_managemen` FOREIGN KEY (`build_id`) REFERENCES `management_build` (`id`),
  CONSTRAINT `testruns_testcaserun_case_id_391a4725_fk_testcases` FOREIGN KEY (`case_id`) REFERENCES `testcases_testcase` (`id`),
  CONSTRAINT `testruns_testcaserun_run_id_749e1f8b_fk_testruns_testrun_run_id` FOREIGN KEY (`run_id`) REFERENCES `testruns_testrun` (`id`),
  CONSTRAINT `testruns_testcaserun_tested_by_id_f03a7efe_fk_auth_user_id` FOREIGN KEY (`tested_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `testruns_testexecuti_status_id_82e677b4_fk_testruns_` FOREIGN KEY (`status_id`) REFERENCES `testruns_testexecutionstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testruns_testexecution`
--

LOCK TABLES `testruns_testexecution` WRITE;
/*!40000 ALTER TABLE `testruns_testexecution` DISABLE KEYS */;
/*!40000 ALTER TABLE `testruns_testexecution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testruns_testexecutionstatus`
--

DROP TABLE IF EXISTS `testruns_testexecutionstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testruns_testexecutionstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testruns_testexecutionstatus`
--

LOCK TABLES `testruns_testexecutionstatus` WRITE;
/*!40000 ALTER TABLE `testruns_testexecutionstatus` DISABLE KEYS */;
INSERT INTO `testruns_testexecutionstatus` VALUES (1,'IDLE','fa fa-question-circle-o','#72767b',0),(2,'RUNNING','fa fa-play-circle-o','#72767b',0),(3,'PAUSED','fa fa-pause-circle-o','#72767b',0),(4,'PASSED','fa fa-check-circle-o','#92d400',20),(5,'FAILED','fa fa-times-circle-o','#cc0000',-30),(6,'BLOCKED','fa fa-stop-circle-o','#cc0000',-10),(7,'ERROR','fa fa-minus-circle','#cc0000',-20),(8,'WAIVED','fa fa-commenting-o','#92d400',10);
/*!40000 ALTER TABLE `testruns_testexecutionstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testruns_testrun`
--

DROP TABLE IF EXISTS `testruns_testrun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testruns_testrun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime(6) DEFAULT NULL,
  `stop_date` datetime(6) DEFAULT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `build_id` int(11) NOT NULL,
  `default_tester_id` int(11) DEFAULT NULL,
  `manager_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `planned_start` datetime(6) DEFAULT NULL,
  `planned_stop` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `testruns_testrun_default_tester_id_cfd29db3_fk_auth_user_id` (`default_tester_id`),
  KEY `testruns_testrun_manager_id_3b380cf6_fk_auth_user_id` (`manager_id`),
  KEY `testruns_testrun_plan_id_6c5c942a_fk_testplans_testplan_plan_id` (`plan_id`),
  KEY `testruns_testrun_build_id_fca012cf_fk_management_build_build_id` (`build_id`),
  KEY `testruns_testrun_start_date_069af648` (`start_date`),
  KEY `testruns_testrun_stop_date_ef2271e8` (`stop_date`),
  KEY `testruns_testrun_planned_start_ea8990da` (`planned_start`),
  KEY `testruns_testrun_planned_stop_db2c9977` (`planned_stop`),
  CONSTRAINT `testruns_testrun_build_id_fca012cf_fk_management_build_build_id` FOREIGN KEY (`build_id`) REFERENCES `management_build` (`id`),
  CONSTRAINT `testruns_testrun_default_tester_id_cfd29db3_fk_auth_user_id` FOREIGN KEY (`default_tester_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `testruns_testrun_manager_id_3b380cf6_fk_auth_user_id` FOREIGN KEY (`manager_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `testruns_testrun_plan_id_6c5c942a_fk_testplans_testplan_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `testplans_testplan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testruns_testrun`
--

LOCK TABLES `testruns_testrun` WRITE;
/*!40000 ALTER TABLE `testruns_testrun` DISABLE KEYS */;
/*!40000 ALTER TABLE `testruns_testrun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testruns_testruncc`
--

DROP TABLE IF EXISTS `testruns_testruncc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testruns_testruncc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testruns_testruncc_run_id_who_c5339b99_uniq` (`run_id`,`user_id`),
  KEY `testruns_testruncc_user_id_d87465d8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `testruns_testruncc_run_id_e1329c9b_fk_testruns_testrun_run_id` FOREIGN KEY (`run_id`) REFERENCES `testruns_testrun` (`id`),
  CONSTRAINT `testruns_testruncc_user_id_d87465d8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testruns_testruncc`
--

LOCK TABLES `testruns_testruncc` WRITE;
/*!40000 ALTER TABLE `testruns_testruncc` DISABLE KEYS */;
/*!40000 ALTER TABLE `testruns_testruncc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testruns_testruntag`
--

DROP TABLE IF EXISTS `testruns_testruntag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testruns_testruntag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `run_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testruns_testruntag_run_id_08efd935_fk_testruns_testrun_run_id` (`run_id`),
  KEY `testruns_testruntag_tag_id_71c717c0_fk_management_tag_tag_id` (`tag_id`),
  CONSTRAINT `testruns_testruntag_run_id_08efd935_fk_testruns_testrun_run_id` FOREIGN KEY (`run_id`) REFERENCES `testruns_testrun` (`id`),
  CONSTRAINT `testruns_testruntag_tag_id_71c717c0_fk_management_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `management_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testruns_testruntag`
--

LOCK TABLES `testruns_testruntag` WRITE;
/*!40000 ALTER TABLE `testruns_testruntag` DISABLE KEYS */;
/*!40000 ALTER TABLE `testruns_testruntag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-24 12:46:40
