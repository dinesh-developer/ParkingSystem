-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: parking_db
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1

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
-- Table structure for table `app1_parkingcompany`
--

DROP TABLE IF EXISTS `app1_parkingcompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app1_parkingcompany` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app1_parkingcompany_name_location_1e2f7ed6_uniq` (`name`,`location`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app1_parkingcompany`
--

LOCK TABLES `app1_parkingcompany` WRITE;
/*!40000 ALTER TABLE `app1_parkingcompany` DISABLE KEYS */;
INSERT INTO `app1_parkingcompany` VALUES (1,'2021-03-01 12:14:14.905237','2021-03-01 12:14:30.130753','Park At Easy','Gurgaon'),(2,'2021-03-01 12:14:45.432525','2021-03-01 12:14:45.432617','Park At Easy','Delhi'),(3,'2021-03-01 12:15:05.630255','2021-03-01 12:15:05.630313','Park Your Car','Noida'),(4,'2021-03-01 13:05:47.389490','2021-03-01 13:09:15.627834','Smart Park','Gurgaon');
/*!40000 ALTER TABLE `app1_parkingcompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app1_vehicleparkingdata`
--

DROP TABLE IF EXISTS `app1_vehicleparkingdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app1_vehicleparkingdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `vehicle_type` varchar(15) NOT NULL,
  `vehicle_number` varchar(20) NOT NULL,
  `in_time` datetime(6) DEFAULT NULL,
  `out_time` datetime(6) DEFAULT NULL,
  `total_park_hour` int(11) NOT NULL,
  `total_park_min` int(11) NOT NULL,
  `parking_amount` decimal(6,2) DEFAULT NULL,
  `payment_mode` varchar(15) NOT NULL,
  `parking_company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app1_vehicleparkingdata`
--

LOCK TABLES `app1_vehicleparkingdata` WRITE;
/*!40000 ALTER TABLE `app1_vehicleparkingdata` DISABLE KEYS */;
INSERT INTO `app1_vehicleparkingdata` VALUES (5,'2021-03-01 13:22:48.176186','2021-03-01 13:38:43.744228','2 Wheelers','DL 21 XY 8748','2021-03-01 13:22:48.175452','2021-03-01 13:38:43.743987',0,16,20.00,'Card',3);
/*!40000 ALTER TABLE `app1_vehicleparkingdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app1_vehicleslotprice`
--

DROP TABLE IF EXISTS `app1_vehicleslotprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app1_vehicleslotprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) NOT NULL,
  `vehicle_type` varchar(15) NOT NULL,
  `max_slot` int(11) NOT NULL,
  `hour` int(11) NOT NULL,
  `hour_price` decimal(5,2) NOT NULL,
  `additional_charge_per_hour` int(11) NOT NULL,
  `parking_company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app1_vehicleslotprice_parking_company_id_vehic_9d706d3b_uniq` (`parking_company_id`,`vehicle_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app1_vehicleslotprice`
--

LOCK TABLES `app1_vehicleslotprice` WRITE;
/*!40000 ALTER TABLE `app1_vehicleslotprice` DISABLE KEYS */;
INSERT INTO `app1_vehicleslotprice` VALUES (3,'2021-03-01 12:16:46.877829','2021-03-01 12:16:46.877888','2 Wheelers',10,2,20.00,10,1),(4,'2021-03-01 12:17:13.055745','2021-03-01 12:17:13.055800','4 Wheelers',10,2,50.00,10,2),(5,'2021-03-01 12:17:45.689512','2021-03-01 12:17:45.689568','2 Wheelers',20,2,20.00,10,3),(6,'2021-03-01 12:43:42.619930','2021-03-01 12:43:42.619988','4 Wheelers',10,2,50.00,10,1);
/*!40000 ALTER TABLE `app1_vehicleslotprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add group',3,'add_group'),(6,'Can change group',3,'change_group'),(7,'Can delete group',3,'delete_group'),(8,'Can view group',3,'view_group'),(9,'Can add user',2,'add_user'),(10,'Can change user',2,'change_user'),(11,'Can delete user',2,'delete_user'),(12,'Can view user',2,'view_user'),(13,'Can add permission',4,'add_permission'),(14,'Can change permission',4,'change_permission'),(15,'Can delete permission',4,'delete_permission'),(16,'Can view permission',4,'view_permission'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add vehicle parking data',7,'add_vehicleparkingdata'),(26,'Can change vehicle parking data',7,'change_vehicleparkingdata'),(27,'Can delete vehicle parking data',7,'delete_vehicleparkingdata'),(28,'Can view vehicle parking data',7,'view_vehicleparkingdata'),(29,'Can add vehicle slot price',8,'add_vehicleslotprice'),(30,'Can change vehicle slot price',8,'change_vehicleslotprice'),(31,'Can delete vehicle slot price',8,'delete_vehicleslotprice'),(32,'Can view vehicle slot price',8,'view_vehicleslotprice'),(33,'Can add parking company',9,'add_parkingcompany'),(34,'Can change parking company',9,'change_parkingcompany'),(35,'Can delete parking company',9,'delete_parkingcompany'),(36,'Can view parking company',9,'view_parkingcompany');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$TkpX5NhfAPnH$1lzEpItZ1vJVr7AbtTA1ajtrCafm+NxCpdru6GfQAR8=','2021-02-28 07:52:10.536363',1,'parking_admin','','','parking_admin@yopmail.com',1,1,'2021-02-28 07:50:51.685220');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-02-28 08:02:10.588516','1','VehicleSlotPrice object (1)',1,'[{\"added\": {}}]',8,1),(2,'2021-02-28 08:02:35.860018','2','VehicleSlotPrice object (2)',1,'[{\"added\": {}}]',8,1),(3,'2021-02-28 09:12:39.450237','1','VehicleParkingData object (1)',3,'',7,1),(4,'2021-03-01 11:50:25.617413','4','VehicleParkingData object (4)',3,'',7,1),(5,'2021-03-01 12:11:17.667104','3','VehicleParkingData object (3)',3,'',7,1),(6,'2021-03-01 12:11:17.722872','2','VehicleParkingData object (2)',3,'',7,1),(7,'2021-03-01 12:11:31.624727','2','VehicleSlotPrice object (2)',3,'',8,1),(8,'2021-03-01 12:11:31.678850','1','VehicleSlotPrice object (1)',3,'',8,1),(9,'2021-03-01 12:14:14.906404','1','ParkingCompany object (1)',1,'[{\"added\": {}}]',9,1),(10,'2021-03-01 12:14:30.153681','1','ParkingCompany object (1)',2,'[]',9,1),(11,'2021-03-01 12:14:45.434671','2','ParkingCompany object (2)',1,'[{\"added\": {}}]',9,1),(12,'2021-03-01 12:15:05.630897','3','ParkingCompany object (3)',1,'[{\"added\": {}}]',9,1),(13,'2021-03-01 12:16:46.878610','3','VehicleSlotPrice object (3)',1,'[{\"added\": {}}]',8,1),(14,'2021-03-01 12:17:13.056553','4','VehicleSlotPrice object (4)',1,'[{\"added\": {}}]',8,1),(15,'2021-03-01 12:17:45.690393','5','VehicleSlotPrice object (5)',1,'[{\"added\": {}}]',8,1),(16,'2021-03-01 12:43:42.620744','6','VehicleSlotPrice object (6)',1,'[{\"added\": {}}]',8,1),(17,'2021-03-01 13:05:47.391649','4','Test | Gurgaon',1,'[{\"added\": {}}]',9,1),(18,'2021-03-01 13:09:15.629118','4','Smart Park | Gurgaon',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'app1','parkingcompany'),(7,'app1','vehicleparkingdata'),(8,'app1','vehicleslotprice'),(3,'auth','group'),(4,'auth','permission'),(2,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-28 07:49:17.658460'),(2,'auth','0001_initial','2021-02-28 07:49:20.575192'),(3,'admin','0001_initial','2021-02-28 07:49:29.612888'),(4,'admin','0002_logentry_remove_auto_add','2021-02-28 07:49:31.698200'),(5,'admin','0003_logentry_add_action_flag_choices','2021-02-28 07:49:31.824873'),(6,'app1','0001_initial','2021-02-28 07:49:32.765767'),(7,'contenttypes','0002_remove_content_type_name','2021-02-28 07:49:34.292247'),(8,'auth','0002_alter_permission_name_max_length','2021-02-28 07:49:34.458641'),(9,'auth','0003_alter_user_email_max_length','2021-02-28 07:49:34.614771'),(10,'auth','0004_alter_user_username_opts','2021-02-28 07:49:34.670082'),(11,'auth','0005_alter_user_last_login_null','2021-02-28 07:49:35.319598'),(12,'auth','0006_require_contenttypes_0002','2021-02-28 07:49:35.374459'),(13,'auth','0007_alter_validators_add_error_messages','2021-02-28 07:49:35.446894'),(14,'auth','0008_alter_user_username_max_length','2021-02-28 07:49:35.640980'),(15,'auth','0009_alter_user_last_name_max_length','2021-02-28 07:49:35.808134'),(16,'auth','0010_alter_group_name_max_length','2021-02-28 07:49:35.964201'),(17,'auth','0011_update_proxy_permissions','2021-02-28 07:49:36.034924'),(18,'sessions','0001_initial','2021-02-28 07:49:36.611342'),(19,'app1','0002_auto_20210228_0910','2021-02-28 09:10:36.626191'),(20,'app1','0003_auto_20210301_1210','2021-03-01 12:10:35.029395');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('mn0mdeb8xn3yzhrtvpnzzg5ucaqn8ic5','ZmQwM2I3MjZkYTdmZTMzZWJjYThjZjE5YWU3MDNhNjQxMGFmODZjNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmJhY2EzOTE0MTYzOGNkMzM3Nzk4OTk5N2QzZDM3OWEyYWIxMzUwNSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2021-03-14 07:52:10.591864');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-01 19:22:16
