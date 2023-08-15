CREATE DATABASE  IF NOT EXISTS `peliculas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `peliculas`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: peliculas
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `ID_genero` int NOT NULL,
  `nombre_genero` tinytext NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`ID_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Documentary|Drama','A classic tale of good versus evil'),(2,'Drama','A thought-provoking documentary that will change the way you see the world'),(3,'Documentary','A hilarious comedy that will have you in stitches'),(4,'Drama|Mystery|Romance|Thriller','A mind-bending sci-fi epic'),(5,'Comedy|Drama','A romantic comedy that will make you believe in love'),(6,'Animation|Sci-Fi','A spooky horror movie that will keep you on the edge of your seat'),(7,'Comedy|Fantasy|Romance','A romantic comedy that will make you believe in love'),(8,'Comedy|Horror|Mystery','A thought-provoking documentary that will change the way you see the world'),(9,'Children|Comedy|Drama','A heartwarming tale of friendship and adventure'),(10,'Comedy','A hilarious comedy that will have you in stitches'),(11,'Action|Comedy','A poignant drama that will tug at your heartstrings'),(12,'Action|Drama','A classic tale of good versus evil'),(13,'Drama','A poignant drama that will tug at your heartstrings'),(14,'Crime|Drama|Horror|Mystery|Thriller','A heartwarming tale of friendship and adventure'),(15,'Horror|Thriller','A heartwarming tale of friendship and adventure'),(16,'Action|Adventure|Animation|Children|Comedy|Fantasy','A heartwarming tale of friendship and adventure'),(17,'Action','A classic tale of good versus evil'),(18,'Comedy','A romantic comedy that will make you believe in love'),(19,'Animation|Children|Comedy|Western','A classic tale of good versus evil'),(20,'Horror|Sci-Fi|Thriller','A heartwarming tale of friendship and adventure'),(21,'Adventure|Animation|Children|Comedy|Sci-Fi','A heartwarming tale of friendship and adventure'),(22,'Documentary','A heartwarming tale of friendship and adventure'),(23,'Comedy|Drama','A heartwarming tale of friendship and adventure'),(24,'Comedy|Horror','A thought-provoking documentary that will change the way you see the world'),(25,'Drama|Romance','A mind-bending sci-fi epic'),(26,'Drama','A spooky horror movie that will keep you on the edge of your seat'),(27,'Documentary','A thought-provoking documentary that will change the way you see the world'),(28,'Sci-Fi','A spooky horror movie that will keep you on the edge of your seat'),(29,'Drama','A poignant drama that will tug at your heartstrings'),(30,'Action|Horror','A thought-provoking documentary that will change the way you see the world'),(31,'dinosaurios','este genero es especialmente diseñado solo para las peliculas sobre dinosaurios');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_peliculas`
--

DROP TABLE IF EXISTS `lista_peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_peliculas` (
  `ID_lista_peliculas` int NOT NULL AUTO_INCREMENT,
  `ID_listareproduccion` int NOT NULL,
  `ID_peliculas` int NOT NULL,
  PRIMARY KEY (`ID_lista_peliculas`),
  KEY `fk_listareproduccion_list_pel` (`ID_listareproduccion`),
  KEY `fk_peliculas_list_pel` (`ID_peliculas`),
  CONSTRAINT `fk_listareproduccion_list_pel` FOREIGN KEY (`ID_listareproduccion`) REFERENCES `lista_reproduccion` (`ID_listareproduccion`),
  CONSTRAINT `fk_peliculas_list_pel` FOREIGN KEY (`ID_peliculas`) REFERENCES `peliculas` (`ID_peliculas`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_peliculas`
--

LOCK TABLES `lista_peliculas` WRITE;
/*!40000 ALTER TABLE `lista_peliculas` DISABLE KEYS */;
INSERT INTO `lista_peliculas` VALUES (1,19,26),(2,27,26),(3,6,12),(4,30,16),(5,8,9),(6,22,16),(7,19,14),(8,26,8),(9,27,22),(10,13,24),(11,15,5),(12,24,23),(13,16,15),(14,8,2),(15,3,26),(16,18,4),(17,25,12),(18,15,9),(19,25,24),(20,21,13),(21,12,25),(22,14,3),(23,7,4),(24,17,4),(25,3,16),(26,27,27),(27,22,24),(28,10,14),(29,3,23),(30,30,13);
/*!40000 ALTER TABLE `lista_peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_reproduccion`
--

DROP TABLE IF EXISTS `lista_reproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_reproduccion` (
  `ID_listareproduccion` int NOT NULL,
  `nombre_lista` varchar(50) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `ID_usuarios` int NOT NULL,
  PRIMARY KEY (`ID_listareproduccion`),
  KEY `fk_usuarios_list_rep` (`ID_usuarios`),
  CONSTRAINT `fk_usuarios_list_rep` FOREIGN KEY (`ID_usuarios`) REFERENCES `usuarios` (`ID_usuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_reproduccion`
--

LOCK TABLES `lista_reproduccion` WRITE;
/*!40000 ALTER TABLE `lista_reproduccion` DISABLE KEYS */;
INSERT INTO `lista_reproduccion` VALUES (1,'Bamity','2015-06-17',1),(2,'Holdlamis','2019-05-14',2),(3,'Asoka','2021-04-04',3),(4,'Veribet','2021-03-28',4),(5,'Mat Lam Tam','2016-02-13',5),(6,'Job','2019-06-26',6),(7,'Otcom','2017-07-13',7),(8,'Toughjoyfax','2021-08-08',8),(9,'Hatity','2019-01-17',9),(10,'Regrant','2019-07-01',10),(11,'Bigtax','2017-07-30',11),(12,'Bigtax','2023-01-09',12),(13,'Namfix','2015-08-22',13),(14,'Daltfresh','2022-04-20',14),(15,'Overhold','2019-05-17',15),(16,'Vagram','2018-04-10',16),(17,'Vagram','2023-06-04',17),(18,'Treeflex','2018-06-16',18),(19,'Ronstring','2019-06-09',19),(20,'Y-Solowarm','2016-10-07',20),(21,'Daltfresh','2015-12-24',21),(22,'Trippledex','2022-08-29',22),(23,'Bytecard','2015-02-14',23),(24,'Asoka','2018-04-16',24),(25,'Daltfresh','2022-04-01',25),(26,'Tres-Zap','2019-08-01',26),(27,'Cardify','2016-12-19',27),(28,'Quo Lux','2020-02-16',28),(29,'Cardguard','2015-11-23',29),(30,'Toughjoyfax','2016-03-21',30);
/*!40000 ALTER TABLE `lista_reproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_auditoria`
--

DROP TABLE IF EXISTS `log_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `tabla` varchar(45) NOT NULL,
  `accion` varchar(15) NOT NULL,
  `mensaje` varchar(400) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auditoria`
--

LOCK TABLES `log_auditoria` WRITE;
/*!40000 ALTER TABLE `log_auditoria` DISABLE KEYS */;
INSERT INTO `log_auditoria` VALUES (1,'peliculas','Modificación','Se modificó la fecha de la Pelicula: 1 con el TITULO: Blade II * Antes la fecha era: 2008-06-10 * Ahora: 2023-07-07','root@localhost','2023-07-07 13:44:37'),(2,'NEW_Usuario','Eliminacion','Se elimino al usuario con ID: 94 con el NOMBRE DE USUARIO: allgr','root@localhost','2023-07-08 23:49:07');
/*!40000 ALTER TABLE `log_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mostrar_datos_usuario`
--

DROP TABLE IF EXISTS `mostrar_datos_usuario`;
/*!50001 DROP VIEW IF EXISTS `mostrar_datos_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_datos_usuario` AS SELECT 
 1 AS `nombre_usuario`,
 1 AS `correo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `new_usuarios`
--

DROP TABLE IF EXISTS `new_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_usuarios` (
  `ID_usuarios` int NOT NULL,
  `nombre_usuario` varchar(30) DEFAULT NULL,
  `contraseña` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_usuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_usuarios`
--

LOCK TABLES `new_usuarios` WRITE;
/*!40000 ALTER TABLE `new_usuarios` DISABLE KEYS */;
INSERT INTO `new_usuarios` VALUES (96,'allgr02','33333','allgr03@gmail.com'),(97,'allgr043','44444asd','allgr04@gmail.com'),(99,'alvarock25','asd12345','alvarock@gmail.com');
/*!40000 ALTER TABLE `new_usuarios` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_eliminacion_new_usuarios` AFTER DELETE ON `new_usuarios` FOR EACH ROW BEGIN
INSERT INTO log_auditoria(tabla, accion, mensaje, usuario, fecha) 
	VALUES ('NEW_Usuario' ,
			'Eliminacion' ,
            concat('Se elimino al usuario con ID: ', OLD.ID_usuarios , ' con el NOMBRE DE USUARIO: ' , OLD.nombre_usuario) ,
            USER() ,
            NOW() );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peliculas` (
  `ID_peliculas` int NOT NULL,
  `fecha_estreno` date DEFAULT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  `descripcion_pelicula` text,
  `ID_genero` int NOT NULL,
  PRIMARY KEY (`ID_peliculas`),
  KEY `fk_genero` (`ID_genero`),
  CONSTRAINT `fk_genero` FOREIGN KEY (`ID_genero`) REFERENCES `genero` (`ID_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (1,'2023-07-07','Blade II','but their relationship is complicated by his past.',1),(2,'2005-07-07','Death by China ','A team of scientists discover a way to travel through time and must navigate the consequences of their actions.',2),(3,'2016-01-04','Sahara','A team of scientists discover a way to travel through time and must navigate the consequences of their actions.',3),(4,'1996-04-17','Madison Avenue','A detective investigates a series of murders that seem to be connected to a popular video game.',4),(5,'1996-04-05','Crush, The','A group of friends go on a road trip and have wild adventures along the way.',5),(6,'2007-09-23','Sovereign\'s Company','A detective investigates a series of murders that seem to be connected to a popular video game.',6),(7,'1997-10-16','In the Heart of the Sea','but their relationship is complicated by his past.',7),(8,'2002-12-13','Butterfly Girl','A team of scientists discover a way to travel through time and must navigate the consequences of their actions.',8),(9,'2007-03-29','Opfergang','Poisn by antivaric drugs, inc scler agents, self-harm, subs',9),(10,'2009-08-18','That Sugar Film','A young woman falls in love with a wealthy businessman',10),(11,'2008-01-06','Valentine','A young boy befriends a friendly alien from another planet and helps him return home.',11),(12,'2005-03-12','They Came to Cordura','A team of scientists discover a way to travel through time and must navigate the consequences of their actions.',12),(13,'2002-04-21','Excuse My Dust','A group of friends go on a road trip and have wild adventures along the way.',13),(14,'2017-10-21','Scenic Route','A young woman falls in love with a wealthy businessman',14),(15,'2013-05-13','Turkish Dance, Ella Lola','A young woman falls in love with a wealthy businessman',15),(16,'1996-05-11','My Dear Secretary','A detective investigates a series of murders that seem to be connected to a popular video game.',16),(17,'1999-11-03','Man from Elysian Fields, The','A detective investigates a series of murders that seem to be connected to a popular video game.',17),(18,'2011-05-03','Carry on Spying (Agent Oooh!)','A group of friends go on a road trip and have wild adventures along the way.',18),(19,'2006-05-17','Mississippi Grind','A young boy befriends a friendly alien from another planet and helps him return home.',19),(20,'2016-03-06','Wind Across the Everglades','A young boy befriends a friendly alien from another planet and helps him return home.',20),(21,'2001-06-22','World Apart, A','A young woman falls in love with a wealthy businessman',21),(22,'1997-03-11','Attack of the Puppet People','but their relationship is complicated by his past.',22),(23,'2007-07-05','Spiral Staircase, The','A detective investigates a series of murders that seem to be connected to a popular video game.',23),(24,'2019-06-03','Max Manus','A detective investigates a series of murders that seem to be connected to a popular video game.',24),(25,'2009-06-10','Freedom','A young boy befriends a friendly alien from another planet and helps him return home.',25),(26,'2000-01-24','American Sniper','but their relationship is complicated by his past.',26),(27,'2014-02-18','Land of the Lost','A detective investigates a series of murders that seem to be connected to a popular video game.',27),(28,'2002-02-12','Link','A young woman falls in love with a wealthy businessman',28),(29,'2002-04-27','Tarzan the Ape Man','Other specified disorders of urethra',29),(30,'2013-04-27','EXPO: Magic of the White City','A team of scientists discover a way to travel through time and must navigate the consequences of their actions.',30);
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_peliculas_modificar_fecha` BEFORE UPDATE ON `peliculas` FOR EACH ROW BEGIN
INSERT INTO log_auditoria(tabla, accion, mensaje, usuario, fecha) 
	VALUES ('peliculas' ,
			'Modificación' ,
            concat('Se modificó la fecha de la Pelicula: ', NEW.ID_peliculas , ' con el TITULO: ' , NEW.titulo , ' * Antes la fecha era: ', OLD.fecha_estreno,' * Ahora: ', NEW.fecha_estreno) ,
            USER() ,
            NOW() );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `peliculas_por_año`
--

DROP TABLE IF EXISTS `peliculas_por_año`;
/*!50001 DROP VIEW IF EXISTS `peliculas_por_año`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `peliculas_por_año` AS SELECT 
 1 AS `año`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_usuarios` int NOT NULL,
  `nombre_usuario` varchar(30) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_usuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'jtester0','jP2.4xjq{y$g<qkJ1z','rcoche0@techcrunch.com'),(2,'ablackler1','kJ3\"xsC_lTD|)OoJu_\"','vskep1@usgs.gov'),(3,'rcoopman2','dA3(>#0r\"KYRNO\"','zdarke2@alexa.com'),(4,'jgoncaves3','nQ0=bfK<vL{L','kcoultard3@sciencedirect.com'),(5,'asponder4','qA8$Oq~/6c','bbarczynski4@whitehouse.gov'),(6,'thawyes5','hN5`a/pc0g','fhaborn5@go.com'),(7,'gbyrch6','fR7\"$rR`Md5ot8Po\'V\"','ugarbar6@youtube.com'),(8,'sreyner7','zO5#C).XBW%','nsamworth7@xinhuanet.com'),(9,'tmoyer8','tP7|3X~Gy/0S','rbroadnicke8@etsy.com'),(10,'rfaithorn9','cQ4(OLM6fxl','csilber9@netscape.com'),(11,'rrawcliffea','rG5<Mk\"}z','Z\"'),(12,'glinguardb','eB0?J4hDp=$VH!S/','mwassungb@aboutads.info'),(13,'sgoldsterc','rZ2|@\"ue@qy7/|3{s&3`\"','amarrowsc@baidu.com'),(14,'ahookd','mZ5{6!EeX\\!c|si\'/','fheephyd@mtv.com'),(15,'dcordobae','hG1~rF4uWODU$}p','aaseee@who.int'),(16,'alattief','uB4#k|<P{g2DH','nbrandlif@ucoz.com'),(17,'jnovotnig','xH5{7zZqE`Fpv5&%','rgookesg@kickstarter.com'),(18,'kdosdellh','pM6%~h|#/\'|<9','bsextieh@ibm.com'),(19,'hcrakeri','aF1.#dL7F948(','lduthiei@blogs.com'),(20,'esharmanj','bE2_FK\"N|SoF\"','hduckittj@stumbleupon.com'),(21,'mstennesk','vN3(%FcOt*8`V$5ArZf','bscripturek@dailymotion.com'),(22,'rcottaml','hB9!Aw@\"eT\"','isearstonl@shop-pro.jp'),(23,'hchristonm','hO4$flz!8_3\\kp7c\'!ls','rworsomm@cocolog-nifty.com'),(24,'mmallalln','kE6=u}0FL!0AfB\'lW','kkropachn@php.net'),(25,'rperoneo','rJ7{2?S}s$kpT7C>`as','wholborno@amazon.co.jp'),(26,'etatteshallp','pV8$i>jS1@4.\\5)','sstreetp@cloudflare.com'),(27,'bdodgsonq','hV5{}i.Xrj','ostorrarq@php.net'),(28,'hbarthelmesr','dA4_xUZZEgWw4#7w)','dbremenr@ezinearticles.com'),(29,'morganers','qD4))TdwSZzx','dfridds@creativecommons.org'),(30,'gtippellt','tO0#\'(LEIx2@','starrt@phpbb.com'),(94,'allgr','11111','allgr@gmail.com'),(95,'allgr01','22222','allgr02@gmail.com'),(96,'allgr02','33333','allgr03@gmail.com'),(97,'allgr043','44444asd','allgr04@gmail.com'),(99,'alvarock25','asd12345','alvarock@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_agregar_new_usuarios` AFTER INSERT ON `usuarios` FOR EACH ROW -- registra fila por fila 
INSERT INTO `new_usuarios` (ID_usuarios,nombre_usuario,contraseña,correo) VALUES (NEW.ID_usuarios,NEW.nombre_usuario,NEW.contraseña,NEW.correo) */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_eliminacion_usuarios` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
INSERT INTO log_auditoria(tabla, accion, mensaje, usuario, fecha) 
	VALUES ('Usuario' ,
			'Eliminacion' ,
            concat('Se elimino al usuario con ID: ', OLD.ID_usuarios , ' con el NOMBRE DE USUARIO: ' , OLD.nombre_usuario) ,
            USER() ,
            NOW() );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuarios_peliculas`
--

DROP TABLE IF EXISTS `usuarios_peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_peliculas` (
  `ID_usuario_pelicula` int NOT NULL AUTO_INCREMENT,
  `ID_usuarios` int NOT NULL,
  `ID_peliculas` int NOT NULL,
  PRIMARY KEY (`ID_usuario_pelicula`),
  KEY `fk_usuarios` (`ID_usuarios`),
  KEY `fk_peliculas` (`ID_peliculas`),
  CONSTRAINT `fk_peliculas` FOREIGN KEY (`ID_peliculas`) REFERENCES `peliculas` (`ID_peliculas`),
  CONSTRAINT `fk_usuarios` FOREIGN KEY (`ID_usuarios`) REFERENCES `usuarios` (`ID_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_peliculas`
--

LOCK TABLES `usuarios_peliculas` WRITE;
/*!40000 ALTER TABLE `usuarios_peliculas` DISABLE KEYS */;
INSERT INTO `usuarios_peliculas` VALUES (1,13,13),(2,7,14),(3,7,10),(4,6,27),(5,2,13),(6,20,28),(7,25,30),(8,19,12),(9,21,14),(10,5,1),(11,11,16),(12,11,17),(13,8,28),(14,1,29),(15,28,3),(16,1,8),(17,26,12),(18,16,10),(19,22,22),(20,1,20),(21,9,26),(22,17,19),(23,10,12),(24,7,30),(25,6,11),(26,4,8),(27,5,27),(28,22,25),(29,23,17),(30,21,1);
/*!40000 ALTER TABLE `usuarios_peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoracion`
--

DROP TABLE IF EXISTS `valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoracion` (
  `ID_valoracion` int NOT NULL,
  `puntuacion` int NOT NULL,
  `ID_usuarios` int NOT NULL,
  `ID_peliculas` int NOT NULL,
  PRIMARY KEY (`ID_valoracion`),
  KEY `fk_usuarios_val` (`ID_usuarios`),
  KEY `fk_peliculas_val` (`ID_peliculas`),
  CONSTRAINT `fk_peliculas_val` FOREIGN KEY (`ID_peliculas`) REFERENCES `peliculas` (`ID_peliculas`),
  CONSTRAINT `fk_usuarios_val` FOREIGN KEY (`ID_usuarios`) REFERENCES `usuarios` (`ID_usuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoracion`
--

LOCK TABLES `valoracion` WRITE;
/*!40000 ALTER TABLE `valoracion` DISABLE KEYS */;
INSERT INTO `valoracion` VALUES (1,3,1,1),(2,6,2,2),(3,5,3,3),(4,2,4,4),(5,10,5,5),(6,8,6,6),(7,1,7,7),(8,4,8,8),(9,5,9,9),(10,3,10,10),(11,9,11,11),(12,5,12,12),(13,3,13,13),(14,10,14,14),(15,9,15,15),(16,1,16,16),(17,2,17,17),(18,4,18,18),(19,10,19,19),(20,1,20,20),(21,4,21,21),(22,5,22,22),(23,4,23,23),(24,6,24,24),(25,5,25,25),(26,3,26,26),(27,3,27,27),(28,4,28,28),(29,1,29,29),(30,4,30,30);
/*!40000 ALTER TABLE `valoracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'peliculas'
--

--
-- Dumping routines for database 'peliculas'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_contar_genero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_contar_genero`(nom_genero varchar(50)) RETURNS int
    NO SQL
begin
	declare cantidad int;
    set nom_genero = concat('%', nom_genero, '%');
    select count(*) into cantidad from genero where nombre_genero like nom_genero;
    return cantidad;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_encontrar_pelicula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_encontrar_pelicula`(id int) RETURNS varchar(30) CHARSET utf8mb4
    READS SQL DATA
begin
	declare resultado varchar(30);
    set resultado = (select titulo from peliculas where ID_peliculas = id);
    if resultado is null
		then
			set resultado = (select "ERROR! El ID no se encuentra cargado");
	end if;
	return resultado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_informacion_pelicula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_informacion_pelicula`(IN pelicula_id INT)
BEGIN
    SELECT * FROM peliculas WHERE id_peliculas = pelicula_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERTAR_GENERO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERTAR_GENERO`(IN ID_NEW INT, NOM_GEN TEXT(50), DESCR TEXT(300))
BEGIN
	IF NOM_GEN <> '' THEN
		INSERT INTO genero (ID_genero,nombre_genero,descripcion)
        VALUES (ID_NEW,NOM_GEN,DESCR);
        SET @CLAUSULA = "SELECT * FROM genero";
    ELSE
		SET @CLAUSULA = "SELECT 'ERROR - DEBE AGREGAR EL NOMBRE DEL GENERO ' AS ERROR";
    END IF;
PREPARE RUNSQL FROM @CLAUSULA;
EXECUTE RUNSQL;
DEALLOCATE PREPARE RUNSQL;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_peli_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_peli_order`(IN field CHAR(20))
BEGIN
	IF field <> '' THEN
		SET @peli_order = concat('ORDER BY ', field);
	ELSE
		SET @peli_order = '';
	END IF;
    SET @clausula = concat('SELECT * FROM peliculas ', @peli_order);
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_todas_peliculas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_todas_peliculas`()
BEGIN
	SELECT * FROM peliculas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `mostrar_datos_usuario`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_datos_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_datos_usuario` AS select `usuarios`.`nombre_usuario` AS `nombre_usuario`,`usuarios`.`correo` AS `correo` from `usuarios` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `peliculas_por_año`
--

/*!50001 DROP VIEW IF EXISTS `peliculas_por_año`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `peliculas_por_año` AS select year(`peliculas`.`fecha_estreno`) AS `año`,count(0) AS `cantidad` from `peliculas` group by year(`peliculas`.`fecha_estreno`) order by `año` */;
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

-- Dump completed on 2023-07-28  0:10:17
