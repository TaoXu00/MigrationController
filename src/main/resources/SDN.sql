-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: SDN
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `StatisticsAggregate`
--

DROP TABLE IF EXISTS `StatisticsAggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatisticsAggregate` (
  `switchDPID` char(50) NOT NULL,
  `Time` char(100) NOT NULL,
  `flow_count` int(11) NOT NULL,
  `packet_count` int(11) NOT NULL,
  `PCDifference` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StatisticsAggregate`
--

LOCK TABLES `StatisticsAggregate` WRITE;
/*!40000 ALTER TABLE `StatisticsAggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `StatisticsAggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StatisticsBandwidth`
--

DROP TABLE IF EXISTS `StatisticsBandwidth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StatisticsBandwidth` (
  `switchDPID` char(50) NOT NULL,
  `port` char(10) NOT NULL,
  `time` datetime NOT NULL,
  `bitsPerSecondRX` bigint(20) NOT NULL,
  `bitsPerSecondTx` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StatisticsBandwidth`
--

LOCK TABLES `StatisticsBandwidth` WRITE;
/*!40000 ALTER TABLE `StatisticsBandwidth` DISABLE KEYS */;
/*!40000 ALTER TABLE `StatisticsBandwidth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connections` (
  `source` char(20) NOT NULL,
  `dstType` char(20) NOT NULL,
  `destination` char(20) NOT NULL,
  `destIP` char(20) DEFAULT NULL,
  `switchPortMAC` char(20) DEFAULT NULL,
  PRIMARY KEY (`source`,`destination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES ('s1-eth2','host','h1-eth1','10.0.0.1','02:6b:31:ff:d2:e1'),('s1-eth3','switch','s3-eth1',NULL,NULL),('s1-eth4','switch','s2-eth1',NULL,NULL),('s1-eth5','switch','s4-eth1',NULL,NULL),('s2-eth2','switch','s5-eth1',NULL,NULL),('s2-eth3','host','h2-eth1','10.0.0.2','02:61:8a:ce:6a:d1'),('s3-eth2','host','h3-eth1','10.0.0.3','02:37:bd:b5:cb:a5'),('s4-eth2','host','h4-eth1','10.0.0.4','02:62:ae:bd:c7:28'),('s5-eth2','host','h5-eth1','10.0.0.5','02:ce:5d:f2:4d:10');
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapping`
--

DROP TABLE IF EXISTS `mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapping` (
  `name` char(50) NOT NULL,
  `type` char(20) NOT NULL,
  `value` char(50) NOT NULL,
  PRIMARY KEY (`name`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapping`
--

LOCK TABLES `mapping` WRITE;
/*!40000 ALTER TABLE `mapping` DISABLE KEYS */;
INSERT INTO `mapping` VALUES ('h1','host','10.0.0.1'),('h2','host','10.0.0.2'),('h3','host','10.0.0.3'),('h4','host','10.0.0.4'),('h5','host','10.0.0.5');
/*!40000 ALTER TABLE `mapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-13  3:05:58
