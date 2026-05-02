-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: databass_db
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
-- Table structure for table `accreditation`
--

DROP TABLE IF EXISTS `accreditation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accreditation` (
  `accreditation_id` int NOT NULL,
  `song_id` int NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`accreditation_id`),
  UNIQUE KEY `uq_song_artist` (`song_id`,`artist_id`),
  KEY `fk_accreditation_artist` (`artist_id`),
  CONSTRAINT `fk_accreditation_artist` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`),
  CONSTRAINT `fk_accreditation_song` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accreditation`
--

LOCK TABLES `accreditation` WRITE;
/*!40000 ALTER TABLE `accreditation` DISABLE KEYS */;
INSERT INTO `accreditation` VALUES (0,0,0),(1,1,1),(2,2,2),(3,3,3),(4,4,1),(5,5,4),(6,6,5),(7,7,3),(8,8,6),(9,9,4),(10,10,1),(11,11,7),(12,12,8),(13,13,8),(14,14,8),(15,15,8),(16,16,8),(17,17,8),(18,18,8),(19,19,8),(20,20,8),(21,21,8),(22,22,8),(23,23,9),(24,24,10),(25,25,11),(26,26,12),(27,27,13),(28,28,14),(29,29,15),(30,30,16),(31,31,17),(32,32,18),(33,33,18),(34,34,19),(35,35,20),(36,36,21),(37,37,22),(38,38,23),(39,39,23),(40,40,24),(41,41,24),(42,42,25),(43,43,26),(44,44,26),(45,45,27),(46,46,27),(47,47,27),(48,48,28),(49,49,29),(50,50,29),(51,51,29),(52,52,29),(53,53,30),(54,54,30),(55,55,31),(56,56,32),(57,57,33),(58,58,34),(59,59,35),(60,60,36),(61,61,37),(62,62,38),(63,63,39),(64,64,40),(65,65,41),(66,66,41),(67,67,42),(68,68,43),(69,69,1),(70,70,44),(71,71,44),(72,72,45),(73,73,45),(74,74,45),(75,75,45),(76,76,45),(77,77,46),(78,78,47),(79,79,48),(80,80,48),(81,81,48),(82,82,48),(83,83,48),(84,84,49),(85,85,49),(86,86,49),(87,87,49),(88,88,49),(89,89,50),(90,90,51),(91,91,52),(92,92,49),(93,93,49),(94,94,49),(95,95,49),(96,96,53),(97,97,53),(98,98,27),(99,99,27),(100,100,54),(101,101,53),(102,102,27),(103,103,27),(104,104,55),(105,105,56),(106,106,57),(107,107,58),(109,109,50),(110,110,59),(111,111,60),(112,112,61),(113,113,62),(114,114,63),(115,115,64),(116,116,65),(117,117,66),(118,118,66),(119,119,66),(120,120,67),(121,121,67),(122,122,67),(123,123,67),(124,124,67),(125,125,67),(126,126,67),(127,127,67),(128,128,67),(129,129,67),(130,130,67),(131,131,67),(132,132,68),(133,133,69),(134,134,70),(135,135,71),(136,136,72),(137,137,73),(138,138,74),(139,139,69),(140,140,74),(141,141,75),(142,142,75),(143,143,75),(144,144,75),(145,145,76),(146,146,77),(147,147,77),(148,148,78),(149,149,29),(150,150,79),(151,151,79),(152,152,79),(153,153,80),(154,154,81),(155,155,82),(156,156,27),(157,157,83),(158,158,84),(159,159,85),(160,160,83),(161,161,83),(162,162,27),(163,163,56),(164,164,86),(165,165,87),(166,166,87),(167,167,87),(168,168,87),(169,169,87),(170,170,88),(171,171,88),(172,172,89),(173,173,89),(174,174,89),(175,175,89),(176,176,90),(177,177,0),(178,178,27),(179,179,91),(180,180,91),(181,181,91),(183,183,92),(184,184,93),(185,185,93),(186,186,94),(187,187,0),(188,188,0),(189,189,95),(190,190,96),(191,191,97),(192,192,97),(193,193,98),(194,194,99),(195,195,91),(196,196,27),(197,197,100),(198,198,54),(199,199,101),(200,200,102),(201,201,103),(202,202,0),(203,203,104),(204,204,105),(206,206,106),(207,207,107),(208,208,108),(209,209,109),(211,211,110),(212,212,111),(213,213,112),(214,214,112),(215,215,112),(216,216,112),(217,217,112),(218,218,112),(219,219,112),(220,220,4),(666,221,1),(222,222,4),(223,223,4),(224,224,113),(667,225,1),(668,226,1),(669,227,1),(670,228,1);
/*!40000 ALTER TABLE `accreditation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `album_id` int NOT NULL,
  `artist_id` int NOT NULL,
  `album_title` varchar(200) NOT NULL,
  `duration` decimal(10,2) DEFAULT NULL,
  `release_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`album_id`),
  UNIQUE KEY `uq_album_artist_title` (`artist_id`,`album_title`),
  CONSTRAINT `fk_albums_artist` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (0,0,'Cooler Than Me EP',16.83,'2010-06-15','2026-05-02 01:48:05'),(1,1,'Doo-Wops & Hooligans',35.82,'2010-10-04','2026-05-02 01:48:05'),(2,2,'x',50.62,'2014-06-20','2026-05-02 01:48:05'),(3,3,'Waking Up',45.55,'2009-11-17','2026-05-02 01:48:05'),(4,1,'Unorthodox Jukebox',34.82,'2012-12-07','2026-05-02 01:48:05'),(5,4,'V',40.23,'2014-08-29','2026-05-02 01:48:05'),(6,5,'What Dreams Are Made Of',3.83,'2015-11-20','2026-05-02 01:48:05'),(7,3,'Native',43.93,'2013-03-22','2026-05-02 01:48:05'),(8,6,'Love In The Future',60.12,'2013-08-30','2026-05-02 01:48:05'),(9,1,'It Will Rain',4.28,'2011-09-27','2026-05-02 01:48:05'),(10,7,'A Thousand Years',4.75,'2011-10-18','2026-05-02 01:48:05'),(11,8,'Tenboom',34.03,'2012-11-27','2026-05-02 01:48:05'),(12,8,'Struggle Pretty',39.80,'2011-06-14','2026-05-02 01:48:05'),(13,8,'Creature',41.88,'2013-10-08','2026-05-02 01:48:05'),(14,9,'Morning Phase',48.23,'2014-02-21','2026-05-02 01:48:05'),(15,10,'Old Thing Back (feat. Ja Rule and Ralph Tresvant)',3.78,'2015-04-14','2026-05-02 01:48:05'),(16,11,'The Way It Is',52.53,'2005-06-21','2026-05-02 01:48:05'),(17,12,'Delirium',55.07,'2015-11-06','2026-05-02 01:48:05'),(18,13,'1000 Forms Of Fear',38.68,'2014-07-04','2026-05-02 01:48:05'),(19,14,'MY HOUSE',18.32,'2015-04-07','2026-05-02 01:48:05'),(20,15,'Forever',44.22,'2015-05-22','2026-05-02 01:48:05'),(21,16,'Oh Wonder',41.97,'2015-09-04','2026-05-02 01:48:05'),(22,17,'Touch',3.00,'2015-02-11','2026-05-02 01:48:05'),(23,18,'Happy Little Pill',3.78,'2014-07-25','2026-05-02 01:48:05'),(24,18,'TRXYE',16.18,'2014-08-15','2026-05-02 01:48:05'),(25,19,'Peace Is The Mission',32.05,'2015-06-01','2026-05-02 01:48:05'),(26,20,'Cloud Nine',55.50,'2016-05-13','2026-05-02 01:48:05'),(27,21,'Kindred',39.17,'2015-04-21','2026-05-02 01:48:05'),(28,22,'Spreading Rumours',43.92,'2013-09-17','2026-05-02 01:48:05'),(29,23,'King Me',43.20,'2014-02-14','2026-05-02 01:48:05'),(30,24,'Boston\'s Boy',47.87,'2010-06-29','2026-05-02 01:48:05'),(31,25,'Torches',38.40,'2011-05-23','2026-05-02 01:48:05'),(32,26,'good kid, m.A.A.d city',68.40,'2012-10-22','2026-05-02 01:48:05'),(33,27,'Relapse: Refill',76.00,'2009-12-21','2026-05-02 01:48:05'),(34,27,'Thank Me Later',68.93,'2010-06-15','2026-05-02 01:48:05'),(35,27,'Nothing Was The Same',68.57,'2013-09-24','2026-05-02 01:48:05'),(36,28,'Despacito Feat. Justin Bieber',3.82,'2017-04-17','2026-05-02 01:48:05'),(37,29,'Melodrama',41.08,'2017-06-16','2026-05-02 01:48:05'),(38,30,'1989',48.68,'2014-10-27','2026-05-02 01:48:05'),(39,31,'Bad Liar',3.57,'2017-05-18','2026-05-02 01:48:05'),(40,32,'Grateful',90.03,'2017-06-23','2026-05-02 01:48:05'),(41,33,'Stay Together',3.60,'2017-04-14','2026-05-02 01:48:05'),(42,34,'Moana',27.72,'2016-11-18','2026-05-02 01:48:05'),(43,35,'Death Of A Bachelor',36.12,'2016-01-15','2026-05-02 01:48:05'),(44,36,'The Covers Record',39.28,'2000-03-21','2026-05-02 01:48:05'),(45,37,'Misery\'s End',21.27,'2010-09-28','2026-05-02 01:48:05'),(46,38,'Dear Billy',61.00,'2011-06-01','2026-05-02 01:48:05'),(47,39,'Zee Avi',38.93,'2009-05-19','2026-05-02 01:48:05'),(48,40,'J Boog - EP',20.23,'2011-01-01','2026-05-02 01:48:05'),(49,41,'For Love',13.42,'2013-11-12','2026-05-02 01:48:05'),(50,42,'Summer Anthems',19.63,'2013-10-08','2026-05-02 01:48:05'),(51,43,'Me. I Am Mariah…The Elusive Chanteuse',64.83,'2014-05-23','2026-05-02 01:48:05'),(52,44,'Be OK',33.47,'2008-08-19','2026-05-02 01:48:05'),(53,44,'Girls And Boys',26.20,'2006-01-17','2026-05-02 01:48:05'),(54,45,'Changes In Latitudes, Changes In Attitudes',37.82,'1977-01-20','2026-05-02 01:48:05'),(55,45,'Son Of A Son Of A Sailor',39.85,'1978-03-01','2026-05-02 01:48:05'),(56,45,'Fruitcakes',54.13,'1994-06-21','2026-05-02 01:48:05'),(57,45,'Take the Weather with You',54.08,'2006-10-10','2026-05-02 01:48:05'),(58,46,'Playlist: The Very Best Of Alan Jackson',59.70,'2008-04-22','2026-05-02 01:48:05'),(59,47,'Unleashed',44.75,'2002-08-06','2026-05-02 01:48:05'),(60,48,'Life On A Rock',47.30,'2013-04-30','2026-05-02 01:48:05'),(61,48,'Greatest Hits II',70.57,'2009-05-19','2026-05-02 01:48:05'),(62,48,'The Road And The Radio',46.13,'2005-11-08','2026-05-02 01:48:05'),(63,48,'When The Sun Goes Down',49.40,'2004-02-03','2026-05-02 01:48:05'),(64,49,'If you were a movie, this would be your soundtrack',17.55,'2012-06-26','2026-05-02 01:48:05'),(65,50,'Sempiternal (Deluxe)',71.08,'2013-04-01','2026-05-02 01:48:05'),(66,51,'Homesick',40.32,'2009-02-03','2026-05-02 01:48:05'),(67,52,'Collide With The Sky',43.47,'2012-07-17','2026-05-02 01:48:05'),(68,49,'With Ears To See And Eyes To Hear',40.02,'2010-03-23','2026-05-02 01:48:05'),(69,53,'Blonde',60.13,'2016-08-20','2026-05-02 01:48:05'),(70,27,'Take Care',80.30,'2011-11-15','2026-05-02 01:48:05'),(71,54,'The State vs. Radric Davis',73.42,'2009-12-08','2026-05-02 01:48:05'),(72,55,'Let Me Explain',43.22,'2016-05-06','2026-05-02 01:48:05'),(73,56,'These Things Happen',60.93,'2014-06-23','2026-05-02 01:48:05'),(74,57,'Waking at Dawn',21.72,'2016-07-01','2026-05-02 01:48:05'),(75,58,'Majid Jordan',53.38,'2016-02-05','2026-05-02 01:48:05'),(76,50,'2004 - 2013',213.00,'2017-12-01','2026-05-02 01:48:05'),(77,59,'Lost Highway',48.87,'2007-11-13','2026-05-02 01:48:05'),(78,60,'Thirteenth Step',57.63,'2003-09-16','2026-05-02 01:48:05'),(79,61,'The Black',39.50,'2016-03-25','2026-05-02 01:48:05'),(80,62,'Tonight The Stars Revolt',43.42,'1999-07-20','2026-05-02 01:48:05'),(81,63,'Vulgar Display Of Power',46.52,'1992-02-25','2026-05-02 01:48:05'),(82,64,'Load',78.98,'1996-06-04','2026-05-02 01:48:05'),(83,65,'THE E.N.D. (THE ENERGY NEVER DIES)',55.93,'2009-06-03','2026-05-02 01:48:05'),(84,66,'#willpower',77.57,'2013-04-19','2026-05-02 01:48:05'),(85,67,'Christmas',42.55,'2011-10-21','2026-05-02 01:48:05'),(86,68,'One Cell In The Sea',40.58,'2007-07-17','2026-05-02 01:48:05'),(87,69,'Lost in the Light',3.40,'2015-02-03','2026-05-02 01:48:05'),(88,70,'Dancing On My Own',3.97,'2016-06-10','2026-05-02 01:48:05'),(89,71,'Make Out',42.73,'2015-12-11','2026-05-02 01:48:05'),(90,72,'Back from the Edge',40.63,'2016-10-28','2026-05-02 01:48:05'),(91,73,'Chaos And The Calm',48.25,'2015-03-23','2026-05-02 01:48:05'),(92,74,'Birdy',44.73,'2011-11-07','2026-05-02 01:48:05'),(93,69,'The Other',40.42,'2015-03-31','2026-05-02 01:48:05'),(94,74,'Not About Angels',3.15,'2014-06-03','2026-05-02 01:48:05'),(95,75,'Stunt',52.42,'1998-07-07','2026-05-02 01:48:05'),(96,75,'Maroon',40.45,'2000-09-12','2026-05-02 01:48:05'),(97,75,'Gordon',47.28,'1992-07-28','2026-05-02 01:48:05'),(98,76,'Lunatic',33.58,'2014-01-28','2026-05-02 01:48:05'),(99,77,'The Resistance',54.28,'2009-09-11','2026-05-02 01:48:05'),(100,77,'The 2nd Law',53.78,'2012-09-28','2026-05-02 01:48:05'),(101,78,'Hozier',51.43,'2014-09-19','2026-05-02 01:48:05'),(102,29,'Yellow Flicker Beat',3.87,'2014-09-29','2026-05-02 01:48:05'),(103,79,'Only By The Night',43.68,'2008-09-19','2026-05-02 01:48:05'),(104,80,'Handwritten',39.48,'2015-04-14','2026-05-02 01:48:05'),(105,81,'Reflection',37.52,'2015-01-30','2026-05-02 01:48:05'),(106,82,'Late Nights: The Album',49.30,'2015-12-04','2026-05-02 01:48:05'),(107,27,'If You\'re Reading This It\'s Too Late',68.85,'2015-02-13','2026-05-02 01:48:05'),(108,83,'SremmLife',44.67,'2015-01-06','2026-05-02 01:48:05'),(109,84,'Rodeo',75.97,'2015-09-04','2026-05-02 01:48:05'),(110,85,'The Pinkprint',68.55,'2014-12-12','2026-05-02 01:48:05'),(111,86,'Dreams Worth More Than Money',64.92,'2015-06-29','2026-05-02 01:48:05'),(112,87,'Boys Like Girls',37.57,'2006-08-22','2026-05-02 01:48:05'),(113,88,'So Wrong, It\'s Right',39.30,'2007-09-25','2026-05-02 01:48:05'),(114,88,'Nothing Personal (Deluxe Version)',58.20,'2009-07-07','2026-05-02 01:48:05'),(115,89,'On Your Side',41.20,'2009-10-13','2026-05-02 01:48:05'),(116,89,'Greetings From... EP',19.10,'2009-10-27','2026-05-02 01:48:05'),(117,90,'Metro Station',37.10,'2007-09-18','2026-05-02 01:48:05'),(118,0,'31 Minutes to Takeoff',43.62,'2010-08-10','2026-05-02 01:48:05'),(119,91,'Kiss Land',55.38,'2013-09-10','2026-05-02 01:48:05'),(120,91,'Trilogy',159.60,'2012-11-13','2026-05-02 01:48:05'),(121,92,'Divenire',42.10,'2006-09-18','2026-05-02 01:48:05'),(122,93,'Dizzy Up The Girl',47.28,'1998-09-22','2026-05-02 01:48:05'),(123,94,'Breakthrough',42.50,'2009-08-25','2026-05-02 01:48:05'),(124,95,'The Remixes',15.13,'2015-02-10','2026-05-02 01:48:05'),(125,96,'I Can\'t Stop Drinking About You Remix EP',16.20,'2014-10-21','2026-05-02 01:48:05'),(126,97,'Room 93: The Remixes',16.87,'2015-03-03','2026-05-02 01:48:05'),(127,98,'HAIZ',16.97,'2015-11-13','2026-05-02 01:48:05'),(128,99,'Good Evening',4.45,'2014-06-17','2026-05-02 01:48:05'),(129,91,'Starboy',68.83,'2016-11-25','2026-05-02 01:48:05'),(130,27,'More Life',81.85,'2017-03-18','2026-05-02 01:48:05'),(131,100,'Rockabye (feat. Sean Paul & Anne-Marie)',4.18,'2016-10-21','2026-05-02 01:48:05'),(132,54,'The Return of East Atlanta Santa',76.37,'2016-12-16','2026-05-02 01:48:05'),(133,101,'I Decided.',49.15,'2017-02-03','2026-05-02 01:48:05'),(134,102,'Chief',41.55,'2011-07-26','2026-05-02 01:48:05'),(135,103,'Jordan Belfort',3.93,'2017-05-12','2026-05-02 01:48:05'),(136,0,'At Night, Alone.',41.13,'2016-05-06','2026-05-02 01:48:05'),(137,104,'Islah',58.30,'2016-01-29','2026-05-02 01:48:05'),(138,105,'Dark Night Sweet Light',43.85,'2015-05-15','2026-05-02 01:48:05'),(139,106,'Sex',3.80,'2016-03-04','2026-05-02 01:48:05'),(140,107,'So Good',47.22,'2017-03-17','2026-05-02 01:48:05'),(141,108,'Encore',35.62,'2016-08-05','2026-05-02 01:48:05'),(142,109,'EVOL',39.22,'2016-02-06','2026-05-02 01:48:05'),(143,110,'Oral Fixation Vol. 2',43.08,'2005-11-28','2026-05-02 01:48:05'),(144,111,'Bangerz (Deluxe Version)',50.77,'2013-10-04','2026-05-02 01:48:05'),(145,112,'American Beauty/American Psycho',38.27,'2015-01-16','2026-05-02 01:48:05'),(146,112,'Save Rock And Roll',41.60,'2013-04-12','2026-05-02 01:48:05'),(147,4,'Overexposed Track By Track',52.20,'2012-06-20','2026-05-02 01:48:05'),(148,113,'Uptown Special',47.50,'2015-01-13','2026-05-02 01:48:05');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int NOT NULL,
  `genre_id` int NOT NULL,
  `artist_name` varchar(150) NOT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Unknown',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`artist_id`),
  UNIQUE KEY `uq_artist_name` (`artist_name`),
  KEY `fk_artist_genre` (`genre_id`),
  CONSTRAINT `fk_artist_genre` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (0,6,'Mike Posner','United States','2026-05-02 01:48:05'),(1,6,'Bruno Mars','United States','2026-05-02 01:48:05'),(2,6,'Ed Sheeran','United Kingdom','2026-05-02 01:48:04'),(3,9,'OneRepublic','United States','2026-05-02 01:48:04'),(4,9,'Maroon 5','United States','2026-05-02 01:48:04'),(5,2,'R. City','United States','2026-05-02 01:48:04'),(6,13,'John Legend','United States','2026-05-02 01:48:04'),(7,6,'Christina Perri','United States','2026-05-02 01:48:04'),(8,4,'Penny and Sparrow','United States','2026-05-02 01:48:04'),(9,3,'Beck','United States','2026-05-02 01:48:04'),(10,5,'Matoma','Norway','2026-05-02 01:48:05'),(11,13,'Keyshia Cole','United States','2026-05-02 01:48:04'),(12,6,'Ellie Goulding','United Kingdom','2026-05-02 01:48:04'),(13,6,'Sia','Australia','2026-05-02 01:48:04'),(14,2,'Flo Rida','United States','2026-05-02 01:48:04'),(15,5,'Alesso','Sweden','2026-05-02 01:48:04'),(16,23,'Oh Wonder','United Kingdom','2026-05-02 01:48:05'),(17,5,'High Rule','United States','2026-05-02 01:48:04'),(18,6,'Troye Sivan','Australia','2026-05-02 01:48:04'),(19,5,'Major Lazer','United States','2026-05-02 01:48:04'),(20,5,'Kygo','Norway','2026-05-02 01:48:05'),(21,10,'Passion Pit','United States','2026-05-02 01:48:04'),(22,26,'Grouplove','United States','2026-05-02 01:48:04'),(23,2,'King Colee','United States','2026-05-02 01:48:04'),(24,2,'Sammy Adams','United States','2026-05-02 01:48:04'),(25,10,'Foster The People','United States','2026-05-02 01:48:04'),(26,2,'Kendrick Lamar','United States','2026-05-02 01:48:04'),(27,2,'Drake','Canada','2026-05-02 01:48:05'),(28,15,'Luis Fonsi','Puerto Rico','2026-05-02 01:48:04'),(29,23,'Lorde','New Zealand','2026-05-02 01:48:04'),(30,6,'Taylor Swift','United States','2026-05-02 01:48:04'),(31,6,'Selena Gomez','United States','2026-05-02 01:48:04'),(32,2,'DJ Khaled','United States','2026-05-02 01:48:04'),(33,6,'Noah Cyrus','United States','2026-05-02 01:48:04'),(34,11,'Auli\'i Cravalho','United States','2026-05-02 01:48:04'),(35,9,'Panic! At The Disco','United States','2026-05-02 01:48:04'),(36,24,'Cat Power','United States','2026-05-02 01:48:04'),(37,20,'Paula Fuga','United States','2026-05-02 01:48:04'),(38,7,'Spawnbreezie','New Zealand','2026-05-02 01:48:04'),(39,24,'Zee Avi','Malaysia','2026-05-02 01:48:05'),(40,7,'J Boog','United States','2026-05-02 01:48:04'),(41,7,'Anuhea','United States','2026-05-02 01:48:04'),(42,7,'Common Kings','United States','2026-05-02 01:48:05'),(43,6,'Mariah Carey','United States','2026-05-02 01:48:04'),(44,10,'Ingrid Michaelson','United States','2026-05-02 01:48:04'),(45,18,'Jimmy Buffett','United States','2026-05-02 01:48:05'),(46,18,'Alan Jackson','United States','2026-05-02 01:48:04'),(47,18,'Toby Keith','United States','2026-05-02 01:48:04'),(48,18,'Kenny Chesney','United States','2026-05-02 01:48:05'),(49,21,'Sleeping With Sirens','United States','2026-05-02 01:48:05'),(50,19,'Bring Me The Horizon','United Kingdom','2026-05-02 01:48:04'),(51,25,'A Day To Remember','United States','2026-05-02 01:48:05'),(52,21,'Pierce The Veil','United States','2026-05-02 01:48:04'),(53,13,'Frank Ocean','United States','2026-05-02 01:48:05'),(54,2,'Gucci Mane','United States','2026-05-02 01:48:05'),(55,13,'Bryson Tiller','United States','2026-05-02 01:48:04'),(56,2,'G-Eazy','United States','2026-05-02 01:48:04'),(57,2,'Roy Woods','Canada','2026-05-02 01:48:04'),(58,8,'Majid Jordan','Canada','2026-05-02 01:48:04'),(59,1,'Nine Inch Nails','United States','2026-05-02 01:48:04'),(60,3,'A Perfect Circle','United States','2026-05-02 01:48:04'),(61,19,'Asking Alexandria','United Kingdom','2026-05-02 01:48:04'),(62,22,'Powerman 5000','United States','2026-05-02 01:48:04'),(63,16,'Pantera','United States','2026-05-02 01:48:05'),(64,16,'Metallica','United States','2026-05-02 01:48:04'),(65,2,'The Black Eyed Peas','United States','2026-05-02 01:48:04'),(66,2,'will.i.am','United States','2026-05-02 01:48:04'),(67,6,'Michael Bublé','Canada','2026-05-02 01:48:05'),(68,14,'A Fine Frenzy','United States','2026-05-02 01:48:04'),(69,6,'Lauv','United States','2026-05-02 01:48:05'),(70,6,'Calum Scott','United Kingdom','2026-05-02 01:48:04'),(71,10,'LANY','United States','2026-05-02 01:48:04'),(72,6,'James Arthur','United Kingdom','2026-05-02 01:48:05'),(73,12,'James Bay','United Kingdom','2026-05-02 01:48:04'),(74,6,'Birdy','United Kingdom','2026-05-02 01:48:04'),(75,3,'Barenaked Ladies','Canada','2026-05-02 01:48:04'),(76,3,'KONGOS','South Africa','2026-05-02 01:48:04'),(77,3,'Muse','United Kingdom','2026-05-02 01:48:04'),(78,26,'Hozier','Ireland','2026-05-02 01:48:05'),(79,3,'Kings of Leon','United States','2026-05-02 01:48:05'),(80,6,'Shawn Mendes','Canada','2026-05-02 01:48:04'),(81,6,'Fifth Harmony','United States','2026-05-02 01:48:04'),(82,13,'Jeremih','United States','2026-05-02 01:48:05'),(83,2,'Rae Sremmurd','United States','2026-05-02 01:48:04'),(84,2,'Travis Scott','United States','2026-05-02 01:48:04'),(85,2,'Nicki Minaj','Trinidad and Tobago','2026-05-02 01:48:04'),(86,2,'Meek Mill','United States','2026-05-02 01:48:04'),(87,9,'Boys Like Girls','United States','2026-05-02 01:48:04'),(88,25,'All Time Low','United States','2026-05-02 01:48:04'),(89,9,'A Rocket To The Moon','United States','2026-05-02 01:48:04'),(90,9,'Metro Station','United States','2026-05-02 01:48:04'),(91,13,'The Weeknd','Canada','2026-05-02 01:48:04'),(92,17,'Ludovico Einaudi','Italy','2026-05-02 01:48:04'),(93,3,'The Goo Goo Dolls','United States','2026-05-02 01:48:04'),(94,6,'Colbie Caillat','United States','2026-05-02 01:48:04'),(95,5,'Mako','United States','2026-05-02 01:48:04'),(96,6,'Bebe Rexha','United States','2026-05-02 01:48:04'),(97,6,'Halsey','United States','2026-05-02 01:48:04'),(98,6,'Hailee Steinfeld','United States','2026-05-02 01:48:05'),(99,5,'Deorro','United States','2026-05-02 01:48:04'),(100,5,'Clean Bandit','United Kingdom','2026-05-02 01:48:04'),(101,2,'Big Sean','United States','2026-05-02 01:48:04'),(102,18,'Eric Church','United States','2026-05-02 01:48:05'),(103,2,'Wes Walker','United States','2026-05-02 01:48:04'),(104,2,'Kevin Gates','United States','2026-05-02 01:48:04'),(105,5,'Hermitude','Australia','2026-05-02 01:48:04'),(106,5,'Cheat Codes','United States','2026-05-02 01:48:04'),(107,6,'Zara Larsson','Sweden','2026-05-02 01:48:04'),(108,5,'DJ Snake','France','2026-05-02 01:48:04'),(109,2,'Future','United States','2026-05-02 01:48:05'),(110,15,'Shakira','Colombia','2026-05-02 01:48:04'),(111,6,'Miley Cyrus','United States','2026-05-02 01:48:04'),(112,25,'Fall Out Boy','United States','2026-05-02 01:48:04'),(113,6,'Mark Ronson','United Kingdom','2026-05-02 01:48:05');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `existence`
--

DROP TABLE IF EXISTS `existence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `existence` (
  `existence_id` int NOT NULL,
  `song_id` int NOT NULL,
  `playlist_id` int NOT NULL,
  PRIMARY KEY (`existence_id`),
  UNIQUE KEY `uq_playlist_song` (`playlist_id`,`song_id`),
  KEY `fk_existence_song` (`song_id`),
  CONSTRAINT `fk_existence_playlist` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`),
  CONSTRAINT `fk_existence_song` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `existence`
--

LOCK TABLES `existence` WRITE;
/*!40000 ALTER TABLE `existence` DISABLE KEYS */;
INSERT INTO `existence` VALUES (0,0,172000),(1,1,172000),(2,2,172000),(3,3,172000),(4,4,172000),(5,5,172000),(6,6,172000),(7,7,172000),(8,8,172000),(9,9,172000),(10,10,172000),(11,11,172000),(12,12,172001),(13,13,172001),(14,14,172001),(15,15,172001),(16,16,172001),(17,17,172001),(18,18,172001),(19,19,172001),(20,20,172001),(21,21,172001),(22,22,172001),(23,23,172001),(24,24,172002),(25,25,172002),(26,26,172002),(27,27,172002),(28,28,172002),(29,29,172002),(30,30,172002),(31,31,172002),(32,32,172002),(33,33,172002),(34,34,172002),(35,35,172002),(36,36,172003),(37,37,172003),(38,38,172003),(39,39,172003),(40,40,172003),(41,41,172003),(42,42,172003),(43,43,172003),(44,44,172003),(45,45,172003),(46,46,172003),(47,47,172003),(48,48,172004),(49,49,172004),(50,50,172004),(51,51,172004),(52,52,172004),(53,53,172004),(54,54,172004),(55,55,172004),(56,56,172004),(57,57,172004),(58,58,172004),(59,59,172004),(60,60,172005),(61,61,172005),(62,62,172005),(63,63,172005),(64,64,172005),(65,65,172005),(66,66,172005),(67,67,172005),(68,68,172005),(69,69,172005),(70,70,172005),(71,71,172005),(72,72,172006),(73,73,172006),(74,74,172006),(75,75,172006),(76,76,172006),(77,77,172006),(78,78,172006),(79,79,172006),(80,80,172006),(81,81,172006),(82,82,172006),(83,83,172006),(84,84,172007),(85,85,172007),(86,86,172007),(87,87,172007),(88,88,172007),(89,89,172007),(90,90,172007),(91,91,172007),(92,92,172007),(93,93,172007),(94,94,172007),(95,95,172007),(96,96,172008),(97,97,172008),(98,98,172008),(99,99,172008),(100,100,172008),(101,101,172008),(102,102,172008),(103,103,172008),(104,104,172008),(105,105,172008),(106,106,172008),(107,107,172008),(108,89,172009),(109,109,172009),(110,110,172009),(111,111,172009),(112,112,172009),(113,113,172009),(114,114,172009),(115,115,172009),(116,116,172009),(117,117,172009),(118,118,172009),(119,119,172009),(120,120,172010),(121,121,172010),(122,122,172010),(123,123,172010),(124,124,172010),(125,125,172010),(126,126,172010),(127,127,172010),(128,128,172010),(129,129,172010),(130,130,172010),(131,131,172010),(132,132,172011),(133,133,172011),(134,134,172011),(135,135,172011),(136,136,172011),(137,137,172011),(138,138,172011),(139,139,172011),(140,140,172011),(141,141,172012),(142,142,172012),(143,143,172012),(144,144,172012),(145,145,172012),(146,146,172012),(147,147,172012),(148,148,172012),(149,149,172012),(150,150,172012),(151,151,172012),(152,152,172012),(153,153,172013),(154,154,172013),(155,155,172013),(156,156,172013),(157,157,172013),(158,158,172013),(159,159,172013),(160,160,172013),(161,161,172013),(162,162,172013),(163,163,172013),(164,164,172013),(165,165,172014),(166,166,172014),(167,167,172014),(168,168,172014),(169,169,172014),(170,170,172014),(171,171,172014),(172,172,172014),(173,173,172014),(174,174,172014),(175,175,172014),(176,176,172014),(182,7,172015),(177,177,172015),(178,178,172015),(179,179,172015),(180,180,172015),(181,181,172015),(183,183,172015),(184,184,172015),(185,185,172015),(186,186,172015),(187,187,172015),(188,188,172015),(189,189,172016),(190,190,172016),(191,191,172016),(192,192,172016),(193,193,172016),(194,194,172016),(195,195,172016),(196,196,172016),(197,197,172016),(198,198,172016),(199,199,172016),(200,200,172016),(205,160,172017),(210,190,172017),(201,201,172017),(202,202,172017),(203,203,172017),(204,204,172017),(206,206,172017),(207,207,172017),(208,208,172017),(209,209,172017),(211,211,172017),(212,212,172017),(221,5,172018),(213,213,172018),(214,214,172018),(215,215,172018),(216,216,172018),(217,217,172018),(218,218,172018),(219,219,172018),(220,220,172018),(222,222,172018),(223,223,172018),(224,224,172018);
/*!40000 ALTER TABLE `existence` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_playlist_duration_after_insert` AFTER INSERT ON `existence` FOR EACH ROW BEGIN
    DECLARE song_duration DECIMAL(10,2);
    SELECT duration INTO song_duration FROM songs WHERE song_id = NEW.song_id;
    UPDATE playlists
    SET duration = duration + song_duration
    WHERE playlist_id = NEW.playlist_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_playlist_duration_after_update` AFTER UPDATE ON `existence` FOR EACH ROW BEGIN
    DECLARE old_song_duration DECIMAL(10,2);
    DECLARE new_song_duration DECIMAL(10,2);
    SELECT duration INTO old_song_duration FROM songs WHERE song_id = OLD.song_id;
    SELECT duration INTO new_song_duration FROM songs WHERE song_id = NEW.song_id;
    UPDATE playlists
    SET duration = duration - old_song_duration + new_song_duration
    WHERE playlist_id = NEW.playlist_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_playlist_duration_after_delete` AFTER DELETE ON `existence` FOR EACH ROW BEGIN
    DECLARE song_duration DECIMAL(10,2);
    SELECT duration INTO song_duration FROM songs WHERE song_id = OLD.song_id;
    UPDATE playlists
    SET duration = duration - song_duration
    WHERE playlist_id = OLD.playlist_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL,
  `genre_name` varchar(100) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `genre_name` (`genre_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (14,'Alternative'),(23,'Alternative Pop'),(8,'Alternative R&B'),(3,'Alternative Rock'),(17,'Classical'),(18,'Country'),(5,'Electronic'),(4,'Folk'),(12,'Folk Rock'),(20,'Hawaiian'),(16,'Heavy Metal'),(2,'Hip-Hop'),(24,'Indie Folk'),(10,'Indie Pop'),(26,'Indie Rock'),(22,'Industrial Metal'),(1,'Industrial Rock'),(15,'Latin Pop'),(19,'Metalcore'),(6,'Pop'),(25,'Pop Punk'),(9,'Pop Rock'),(21,'Post-Hardcore'),(13,'R&B'),(7,'Reggae'),(11,'Soundtrack');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `playlist_id` int NOT NULL,
  `user_id` int NOT NULL,
  `playlist_name` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duration` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`playlist_id`),
  UNIQUE KEY `uq_user_playlist_name` (`user_id`,`playlist_name`),
  CONSTRAINT `fk_playlists_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (172000,8,'#throwback','2026-05-02 01:48:06',48.28),(172001,7,'muse','2026-05-02 01:48:06',46.88),(172002,2,'Musica','2026-05-02 01:48:06',45.65),(172003,8,'Gym','2026-05-02 01:48:06',50.38),(172004,10,'Run, run, run','2026-05-02 01:48:06',47.67),(172005,4,'Baby Playlist','2026-05-02 01:48:06',39.52),(172006,6,'Beach ','2026-05-02 01:48:06',49.36),(172007,3,'2014','2026-05-02 01:48:06',43.45),(172008,1,'chill','2026-05-02 01:48:06',50.27),(172009,5,'My Heart','2026-05-02 01:48:06',48.97),(172010,8,'Christmas','2026-05-02 01:48:06',39.05),(172011,6,'mood','2026-05-02 01:48:06',64.56),(172012,10,'river','2026-05-02 01:48:06',47.86),(172013,3,'Best songs','2026-05-02 01:48:06',43.73),(172014,4,'White People','2026-05-02 01:48:06',41.17),(172015,10,'bAng','2026-05-02 01:48:06',48.60),(172016,1,'twerk','2026-05-02 01:48:06',44.18),(172017,10,'S16','2026-05-02 01:48:06',46.18),(172018,5,'My songs','2026-05-02 01:48:06',45.89),(172019,8,'Blue','2026-05-02 01:48:06',0.00);
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `song_id` int NOT NULL,
  `album_id` int NOT NULL,
  `song_title` varchar(250) NOT NULL,
  `duration` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`song_id`),
  UNIQUE KEY `uq_song_album_title` (`album_id`,`song_title`),
  CONSTRAINT `fk_songs_album` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`),
  CONSTRAINT `chk_song_duration` CHECK ((`duration` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (0,0,'Cooler Than Me',3.80,'2026-05-02 01:48:05'),(1,1,'Just the Way You Are',3.68,'2026-05-02 01:48:06'),(2,2,'Thinking Out Loud',4.69,'2026-05-02 01:48:06'),(3,3,'Secrets',3.74,'2026-05-02 01:48:05'),(4,4,'Treasure',2.98,'2026-05-02 01:48:06'),(5,5,'Animals',3.85,'2026-05-02 01:48:05'),(6,6,'Locked Away',3.79,'2026-05-02 01:48:05'),(7,7,'Counting Stars',4.29,'2026-05-02 01:48:05'),(8,8,'All of Me',4.49,'2026-05-02 01:48:05'),(9,5,'Sugar',3.92,'2026-05-02 01:48:06'),(10,9,'It Will Rain',4.30,'2026-05-02 01:48:05'),(11,10,'A Thousand Years',4.75,'2026-05-02 01:48:05'),(12,11,'Valjean',3.82,'2026-05-02 01:48:05'),(13,11,'Just and Just As',4.95,'2026-05-02 01:48:06'),(14,11,'Duet (feat. Stephanie Briggs)',3.70,'2026-05-02 01:48:05'),(15,12,'Serial Doubter',3.40,'2026-05-02 01:48:05'),(16,11,'La Reyna',3.83,'2026-05-02 01:48:05'),(17,12,'Bread and Bleeding',4.27,'2026-05-02 01:48:05'),(18,13,'Creature',3.68,'2026-05-02 01:48:05'),(19,11,'Bones',2.16,'2026-05-02 01:48:06'),(20,12,'Undress',5.28,'2026-05-02 01:48:06'),(21,12,'Rattle',4.66,'2026-05-02 01:48:06'),(22,12,'Honest Wage',6.47,'2026-05-02 01:48:06'),(23,14,'Cycle',0.66,'2026-05-02 01:48:05'),(24,15,'Old Thing Back (feat. Ja Rule and Ralph Tresvant)',5.36,'2026-05-02 01:48:06'),(25,16,'Love',4.26,'2026-05-02 01:48:05'),(26,17,'Love Me Like You Do - From Fifty Shades Of Grey\\',4.21,'2026-05-02 01:48:05'),(27,18,'Elastic Heart',4.29,'2026-05-02 01:48:06'),(28,19,'GDFR (feat. Sage The Gemini & Lookas)',3.17,'2026-05-02 01:48:06'),(29,20,'Heroes (we could be)',3.50,'2026-05-02 01:48:05'),(30,21,'Technicolour Beat',3.00,'2026-05-02 01:48:05'),(31,22,'Touch',3.84,'2026-05-02 01:48:06'),(32,23,'Happy Little Pill',3.75,'2026-05-02 01:48:05'),(33,24,'Touch',3.62,'2026-05-02 01:48:06'),(34,25,'Lean On (feat. Mu00d8 & DJ Snake)',2.94,'2026-05-02 01:48:05'),(35,26,'Stole the Show',3.71,'2026-05-02 01:48:06'),(36,27,'Lifted Up (1985)',4.39,'2026-05-02 01:48:06'),(37,28,'Ways To Go',3.59,'2026-05-02 01:48:05'),(38,29,'Home For The Holidays',3.91,'2026-05-02 01:48:05'),(39,29,'Blow Up',5.00,'2026-05-02 01:48:05'),(40,30,'Coast 2 Coast',3.36,'2026-05-02 01:48:05'),(41,30,'Driving Me Crazy',4.06,'2026-05-02 01:48:06'),(42,31,'Helena Beat',4.60,'2026-05-02 01:48:06'),(43,32,'Bitch, Donu2019t Kill My Vibe',5.18,'2026-05-02 01:48:05'),(44,32,'Backseat Freestyle',3.54,'2026-05-02 01:48:06'),(45,33,'Forever',5.96,'2026-05-02 01:48:05'),(46,34,'Over',3.89,'2026-05-02 01:48:06'),(47,35,'Started From the Bottom',2.90,'2026-05-02 01:48:05'),(48,36,'Despacito - Remix',3.81,'2026-05-02 01:48:05'),(49,37,'Green Light',3.91,'2026-05-02 01:48:05'),(50,37,'Hard Feelings/Loveless',6.12,'2026-05-02 01:48:05'),(51,37,'Supercut',4.63,'2026-05-02 01:48:05'),(52,37,'Perfect Places',3.70,'2026-05-02 01:48:05'),(53,38,'Blank Space',3.86,'2026-05-02 01:48:06'),(54,38,'Out Of The Woods',3.93,'2026-05-02 01:48:05'),(55,39,'Bad Liar',3.58,'2026-05-02 01:48:06'),(56,40,'I\'m the One',4.81,'2026-05-02 01:48:05'),(57,41,'Stay Together',3.21,'2026-05-02 01:48:06'),(58,42,'How Far I\'ll Go',2.72,'2026-05-02 01:48:05'),(59,43,'Death Of A Bachelor',3.39,'2026-05-02 01:48:05'),(60,44,'Sea of Love',2.32,'2026-05-02 01:48:06'),(61,45,'Misery\'s End',4.59,'2026-05-02 01:48:06'),(62,46,'Don\'t Let Go',3.78,'2026-05-02 01:48:05'),(63,47,'Honey Bee',3.11,'2026-05-02 01:48:06'),(64,48,'Waiting On The Rain',3.46,'2026-05-02 01:48:05'),(65,49,'Simple Love Song',3.75,'2026-05-02 01:48:06'),(66,49,'Come Over Love',4.10,'2026-05-02 01:48:05'),(67,50,'Wade In Your Water',3.07,'2026-05-02 01:48:06'),(68,51,'#Beautiful',3.33,'2026-05-02 01:48:06'),(69,1,'Count On Me',3.29,'2026-05-02 01:48:05'),(70,52,'You and I',2.47,'2026-05-02 01:48:06'),(71,53,'The Way I Am',2.25,'2026-05-02 01:48:05'),(72,54,'Margaritaville',4.18,'2026-05-02 01:48:06'),(73,55,'Cheeseburger In Paradise',2.93,'2026-05-02 01:48:05'),(74,56,'Everybody\'s Got A Cousin In Miami',7.32,'2026-05-02 01:48:06'),(75,57,'Party at the End of the World',3.76,'2026-05-02 01:48:05'),(76,57,'Everybody\'s on the Phone',4.45,'2026-05-02 01:48:05'),(77,58,'It\'s Five O\' Clock Somewhere',3.84,'2026-05-02 01:48:05'),(78,59,'Good To Go To Mexico',2.99,'2026-05-02 01:48:05'),(79,60,'Pirate Flag',3.75,'2026-05-02 01:48:05'),(80,61,'Out Last Night',3.33,'2026-05-02 01:48:06'),(81,62,'Summertime',3.44,'2026-05-02 01:48:06'),(82,62,'Beer In Mexico',4.53,'2026-05-02 01:48:05'),(83,63,'When the Sun Goes Down',4.84,'2026-05-02 01:48:05'),(84,64,'Scene One - James Dean & Audrey Hepburn',4.27,'2026-05-02 01:48:06'),(85,64,'Scene Two - Roger Rabbit',3.30,'2026-05-02 01:48:05'),(86,64,'Scene Three - Stomach Tied In Knots',3.49,'2026-05-02 01:48:05'),(87,64,'Scene Four - Don\'t You Ever Forget About Me',3.41,'2026-05-02 01:48:06'),(88,64,'Scene Five - With Ears To See and Eyes To Hear',3.79,'2026-05-02 01:48:06'),(89,65,'Can You Feel My Heart',3.80,'2026-05-02 01:48:06'),(90,66,'Have Faith In Me',3.15,'2026-05-02 01:48:05'),(91,67,'Props & Mayhem',3.63,'2026-05-02 01:48:06'),(92,68,'If I\'m James Dean, You\'re Audrey Hepburn',3.65,'2026-05-02 01:48:06'),(93,68,'Let Love Bleed Red',3.71,'2026-05-02 01:48:05'),(94,68,'The Bomb Dot Com V2.0',3.53,'2026-05-02 01:48:06'),(95,68,'With Ears to See, and Eyes to Hear',3.72,'2026-05-02 01:48:06'),(96,69,'Ivy',4.15,'2026-05-02 01:48:05'),(97,69,'White Ferrari',4.15,'2026-05-02 01:48:05'),(98,70,'Shot For Me',3.75,'2026-05-02 01:48:06'),(99,70,'Under Ground Kings',3.54,'2026-05-02 01:48:06'),(100,71,'Lemonade',4.10,'2026-05-02 01:48:06'),(101,69,'Nikes',5.23,'2026-05-02 01:48:05'),(102,34,'Find Your Love',3.48,'2026-05-02 01:48:06'),(103,35,'From Time',5.37,'2026-05-02 01:48:05'),(104,72,'Let Me Explain',3.73,'2026-05-02 01:48:05'),(105,73,'Tumblr Girls',4.26,'2026-05-02 01:48:06'),(106,74,'Why',4.37,'2026-05-02 01:48:06'),(107,75,'My Love (feat. Drake)',4.14,'2026-05-02 01:48:06'),(109,76,'Sleepwalking',3.83,'2026-05-02 01:48:05'),(110,77,'The Perfect Drug',5.26,'2026-05-02 01:48:06'),(111,78,'The Noose',4.89,'2026-05-02 01:48:05'),(112,79,'I Won\'t Give In',3.83,'2026-05-02 01:48:05'),(113,80,'When Worlds Collide',2.97,'2026-05-02 01:48:06'),(114,81,'A New Level',3.96,'2026-05-02 01:48:05'),(115,82,'Until It Sleeps',4.47,'2026-05-02 01:48:05'),(116,83,'Meet Me Halfway',4.74,'2026-05-02 01:48:05'),(117,84,'Good Morning',1.74,'2026-05-02 01:48:05'),(118,84,'Reach For The Stars',4.36,'2026-05-02 01:48:06'),(119,84,'Fall Down',5.12,'2026-05-02 01:48:05'),(120,85,'It\'s Beginning To Look A Lot Like Christmas',3.44,'2026-05-02 01:48:05'),(121,85,'Santa Claus Is Coming To Town',2.85,'2026-05-02 01:48:05'),(122,85,'Jingle Bells (feat. The Puppini Sisters)',2.67,'2026-05-02 01:48:06'),(123,85,'White Christmas (Duet With Shania Twain)',3.61,'2026-05-02 01:48:06'),(124,85,'All I Want For Christmas Is You',2.86,'2026-05-02 01:48:05'),(125,85,'Holly Jolly Christmas',2.00,'2026-05-02 01:48:05'),(126,85,'Santa Baby',3.86,'2026-05-02 01:48:06'),(127,85,'Have Yourself A Merry Little Christmas',3.84,'2026-05-02 01:48:06'),(128,85,'Christmas (Baby Please Come Home)',3.13,'2026-05-02 01:48:06'),(129,85,'Silent Night',3.79,'2026-05-02 01:48:05'),(130,85,'Blue Christmas',3.70,'2026-05-02 01:48:05'),(131,85,'Cold December Night',3.30,'2026-05-02 01:48:06'),(132,86,'Almost Lover',4.48,'2026-05-02 01:48:06'),(133,87,'Adrenaline',3.44,'2026-05-02 01:48:06'),(134,88,'Dancing On My Own',4.33,'2026-05-02 01:48:05'),(135,89,'ILYSB - STRIPPED',4.08,'2026-05-02 01:48:05'),(136,90,'Say You Won\'t Let Go',3.52,'2026-05-02 01:48:06'),(137,91,'Let It Go',4.34,'2026-05-02 01:48:05'),(138,92,'Skinny Love',3.35,'2026-05-02 01:48:05'),(139,93,'The Other',3.16,'2026-05-02 01:48:05'),(140,94,'Not About Angels',33.86,'2026-05-02 01:48:05'),(141,95,'One Week',2.83,'2026-05-02 01:48:05'),(142,96,'Pinch Me',4.75,'2026-05-02 01:48:05'),(143,97,'If I Had $1,000,000',4.45,'2026-05-02 01:48:05'),(144,95,'It\'s All Been Done',3.43,'2026-05-02 01:48:06'),(145,98,'Come with Me Now',3.53,'2026-05-02 01:48:06'),(146,99,'Uprising',5.08,'2026-05-02 01:48:06'),(147,100,'Madness',4.68,'2026-05-02 01:48:06'),(148,101,'Take Me To Church',4.03,'2026-05-02 01:48:05'),(149,102,'Yellow Flicker Beat - From The Hunger Games: Mockingjay Part 1',3.88,'2026-05-02 01:48:05'),(150,103,'Sex on Fire',3.39,'2026-05-02 01:48:06'),(151,103,'Use Somebody',3.85,'2026-05-02 01:48:05'),(152,103,'Closer',3.96,'2026-05-02 01:48:05'),(153,104,'Stitches',3.45,'2026-05-02 01:48:05'),(154,105,'Them Girls Be Like',2.71,'2026-05-02 01:48:06'),(155,106,'Planez',4.01,'2026-05-02 01:48:06'),(156,107,'Energy',3.03,'2026-05-02 01:48:05'),(157,108,'No Type',3.33,'2026-05-02 01:48:05'),(158,109,'Antidote',4.38,'2026-05-02 01:48:05'),(159,110,'Only',5.20,'2026-05-02 01:48:06'),(160,108,'Come Get Her',3.55,'2026-05-02 01:48:05'),(161,108,'This Could Be Us',3.44,'2026-05-02 01:48:06'),(162,107,'10 Bands',2.96,'2026-05-02 01:48:05'),(163,73,'I Mean It',3.94,'2026-05-02 01:48:06'),(164,111,'All Eyes On You (feat. Chris Brown & Nicki Minaj)',3.73,'2026-05-02 01:48:05'),(165,112,'The Great Escape',3.44,'2026-05-02 01:48:06'),(166,112,'Hero / Heroine',3.87,'2026-05-02 01:48:05'),(167,112,'Thunder',3.94,'2026-05-02 01:48:05'),(168,112,'Five Minutes to Midnight',3.79,'2026-05-02 01:48:05'),(169,112,'Dance Hall Drug',3.50,'2026-05-02 01:48:06'),(170,113,'Dear Maria, Count Me In',3.05,'2026-05-02 01:48:06'),(171,114,'Break Your Little Heart',2.86,'2026-05-02 01:48:05'),(172,115,'Like We Used To',3.40,'2026-05-02 01:48:05'),(173,115,'Baby Blue Eyes',3.67,'2026-05-02 01:48:05'),(174,116,'Dakota',3.52,'2026-05-02 01:48:06'),(175,115,'Annabelle',3.24,'2026-05-02 01:48:05'),(176,117,'Seventeen Forever',2.89,'2026-05-02 01:48:06'),(177,118,'Cooler Than Me - Single Mix',3.55,'2026-05-02 01:48:06'),(178,70,'We\'ll Be Fine',4.13,'2026-05-02 01:48:05'),(179,119,'Wanderlust',5.11,'2026-05-02 01:48:06'),(180,120,'Twenty Eight',4.31,'2026-05-02 01:48:06'),(181,119,'Adaptation',4.73,'2026-05-02 01:48:05'),(183,121,'Fly',4.65,'2026-05-02 01:48:05'),(184,122,'Black Balloon',4.16,'2026-05-02 01:48:05'),(185,122,'Slide',3.53,'2026-05-02 01:48:05'),(186,123,'Fallin\' For You',3.59,'2026-05-02 01:48:06'),(187,118,'Bow Chicka Wow Wow',3.27,'2026-05-02 01:48:06'),(188,118,'Please Don\'t Go',3.28,'2026-05-02 01:48:05'),(189,124,'I Won\'t Let You Walk Away - Lost Kings Remix',4.11,'2026-05-02 01:48:06'),(190,125,'I Can\'t Stop Drinking About You - Chainsmokers Remix',4.40,'2026-05-02 01:48:05'),(191,126,'Ghost - Lost Kings Remix',3.15,'2026-05-02 01:48:05'),(192,126,'Hurricane - Arty Remix',3.74,'2026-05-02 01:48:06'),(193,127,'Starving',3.03,'2026-05-02 01:48:05'),(194,128,'Bailar - Radio Edit',2.29,'2026-05-02 01:48:05'),(195,129,'I Feel It Coming',4.49,'2026-05-02 01:48:05'),(196,130,'Fake Love',3.52,'2026-05-02 01:48:05'),(197,131,'Rockabye (feat. Sean Paul & Anne-Marie)',4.18,'2026-05-02 01:48:05'),(198,132,'Both (feat. Drake)',3.17,'2026-05-02 01:48:05'),(199,133,'Bounce Back',3.71,'2026-05-02 01:48:06'),(200,134,'Springsteen',4.39,'2026-05-02 01:48:05'),(201,135,'Jordan Belfort',3.47,'2026-05-02 01:48:06'),(202,136,'I Took A Pill In Ibiza - Seeb Remix',3.30,'2026-05-02 01:48:06'),(203,137,'2 Phones',4.00,'2026-05-02 01:48:06'),(204,138,'The Buzz (feat. Mataya & Young Tapz)',3.70,'2026-05-02 01:48:05'),(206,139,'Sex',3.81,'2026-05-02 01:48:05'),(207,140,'Never Forget You',3.56,'2026-05-02 01:48:05'),(208,141,'Middle',3.68,'2026-05-02 01:48:05'),(209,142,'Low Life',5.23,'2026-05-02 01:48:05'),(211,143,'Hips Don\'t Lie',3.63,'2026-05-02 01:48:05'),(212,144,'We Can\'t Stop',3.85,'2026-05-02 01:48:06'),(213,145,'Centuries',3.81,'2026-05-02 01:48:06'),(214,145,'Uma Thurman',3.53,'2026-05-02 01:48:05'),(215,146,'The Phoenix',4.08,'2026-05-02 01:48:05'),(216,146,'Where Did The Party Go',4.05,'2026-05-02 01:48:06'),(217,146,'Just One Yesterday',4.08,'2026-05-02 01:48:05'),(218,146,'The Mighty Fall',3.54,'2026-05-02 01:48:05'),(219,146,'Death Valley',3.78,'2026-05-02 01:48:05'),(220,5,'Maps',3.17,'2026-05-02 01:48:06'),(221,1,'Grenade',3.70,'2026-05-02 01:48:10'),(222,147,'One More Night',3.66,'2026-05-02 01:48:06'),(223,147,'Payphone',3.85,'2026-05-02 01:48:05'),(224,148,'Uptown Funk',4.49,'2026-05-02 01:48:05'),(225,1,'Marry You',3.83,'2026-05-02 01:48:10'),(226,1,'Talking to the Moon',3.62,'2026-05-02 01:48:10'),(227,1,'Liquor Store Blues',3.82,'2026-05-02 01:48:10'),(228,1,'The Other Side',3.78,'2026-05-02 01:48:10');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jackson','Jackson','Miller','jacksons@gmail.com','pass123','1999-03-15','2026-05-02 01:48:04'),(2,'emily','Emily','Carter','emily_99@gmail.com','pass123','2000-07-21','2026-05-02 01:48:04'),(3,'ethan','Ethan','Brooks','ethan@gmail.com','pass123','1998-11-09','2026-05-02 01:48:04'),(4,'olivia','Olivia','Reed','olivia221@gmail.com','pass123','2001-05-12','2026-05-02 01:48:04'),(5,'logan','Logan','Hayes','logan555@gmail.com','pass123','2000-01-30','2026-05-02 01:48:04'),(6,'carlos','Carlos','Ramirez','carlos216@gmail.com','pass123','1999-09-18','2026-05-02 01:48:04'),(7,'sofia','Sofia','Martinez','sofia8048@gmail.com','pass123','2001-04-27','2026-05-02 01:48:04'),(8,'diego','Diego','Hernandez','diego_h@gmail.com','pass123','1998-12-05','2026-05-02 01:48:04'),(9,'valeria','Valeria','Lopez','valeria_lopez@gmail.com','pass123','2000-08-14','2026-05-02 01:48:04'),(10,'mateo','Mateo','Gonzalez','mateoeG@gmail.com','pass123','2002-02-22','2026-05-02 01:48:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'databass_db'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_total_songs_in_playlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_songs_in_playlist`(p_playlist_id INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE total_songs INT;

    SELECT COUNT(*)
    INTO total_songs
    FROM existence
    WHERE playlist_id = p_playlist_id;

    RETURN COALESCE(total_songs, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_song_full` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_song_full`(
    IN p_album INT,
    IN p_title VARCHAR(255),
    IN p_duration DECIMAL(5,2),
    IN p_artist_id INT
)
BEGIN
    DECLARE new_song_id INT;
    DECLARE new_accreditation_id INT;

    SELECT IFNULL(MAX(song_id), 0) + 1 INTO new_song_id FROM songs;

    INSERT INTO songs (song_id, album_id, song_title, duration)
    VALUES (new_song_id, p_album, p_title, p_duration);

    SELECT IFNULL(MAX(accreditation_id), 0) + 1 INTO new_accreditation_id FROM accredation;

    INSERT INTO accreditation (accreditation_id, song_id, artist_id)
    VALUES (new_accreditation_id, new_song_id, p_artist_id);

    SELECT new_song_id AS created_song_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_add_song_to_playlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_song_to_playlist`(
    IN p_existence_id INT,
    IN p_song_id INT,
    IN p_playlist_id INT
)
BEGIN
    -- check song if exists
    IF NOT EXISTS (
        SELECT 1
        FROM songs
        WHERE song_id = p_song_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Song does not exist';

    -- check playlist if exists
    ELSEIF NOT EXISTS (
        SELECT 1
        FROM playlists
        WHERE playlist_id = p_playlist_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Playlist does not exist';

    -- check duplicate if song in same playlist
    ELSEIF EXISTS (
        SELECT 1
        FROM existence
        WHERE song_id = p_song_id
          AND playlist_id = p_playlist_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This song is already in the playlist';

    -- if everything is valid, intert it
    ELSE
        INSERT INTO existence (existence_id, song_id, playlist_id)
        VALUES (p_existence_id, p_song_id, p_playlist_id);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-01 20:49:51
