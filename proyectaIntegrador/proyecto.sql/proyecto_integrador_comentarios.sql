-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto_integrador
-- ------------------------------------------------------
-- Server version	5.7.39

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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id_comentario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuarios_id` int(10) unsigned DEFAULT NULL,
  `productos_id` int(10) unsigned DEFAULT NULL,
  `texto` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `fk_usuarios_id` (`usuarios_id`),
  KEY `fk_productos_id` (`productos_id`),
  CONSTRAINT `fk_productos_id` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_usuarios_id` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,1,1,'Buenisimoo me encanto','2023-04-11 17:27:19','2023-04-11 17:27:19',NULL),(3,1,7,'Buenisimoo me encanto','2023-04-11 17:27:52','2023-04-11 17:27:52',NULL),(4,1,8,'Buenisimoo me encanto','2023-04-11 17:27:56','2023-04-11 17:27:56',NULL),(5,1,9,'Buenisimoo me encanto','2023-04-11 17:28:00','2023-04-11 17:28:00',NULL),(6,1,10,'Buenisimoo me encanto','2023-04-11 17:28:05','2023-04-11 17:28:05',NULL),(7,1,11,'Buenisimoo me encanto','2023-04-11 17:28:10','2023-04-11 17:28:10',NULL),(8,1,12,'Buenisimoo me encanto','2023-04-11 17:28:26','2023-04-11 17:28:26',NULL),(9,1,13,'Buenisimoo me encanto','2023-04-11 17:28:29','2023-04-11 17:28:29',NULL),(10,1,14,'Buenisimoo me encanto','2023-04-11 17:28:32','2023-04-11 17:28:32',NULL),(11,1,6,'Buenisimoo me encanto','2023-04-11 17:28:57','2023-04-11 17:28:57',NULL),(12,7,1,'No me gusta este estilo de album','2023-04-11 17:29:23','2023-04-11 17:29:23',NULL),(13,7,6,'No me gusta este estilo de album','2023-04-11 17:29:28','2023-04-11 17:29:28',NULL),(14,7,7,'No me gusta este estilo de album','2023-04-11 17:29:30','2023-04-11 17:29:30',NULL),(15,7,8,'No me gusta este estilo de album','2023-04-11 17:29:31','2023-04-11 17:29:31',NULL),(16,7,9,'No me gusta este estilo de album','2023-04-11 17:29:34','2023-04-11 17:29:34',NULL),(17,7,10,'No me gusta este estilo de album','2023-04-11 17:29:36','2023-04-11 17:29:36',NULL),(18,7,11,'No me gusta este estilo de album','2023-04-11 17:29:38','2023-04-11 17:29:38',NULL),(19,7,12,'No me gusta este estilo de album','2023-04-11 17:29:40','2023-04-11 17:29:40',NULL),(20,7,13,'No me gusta este estilo de album','2023-04-11 17:29:41','2023-04-11 17:29:41',NULL),(21,7,14,'No me gusta este estilo de album','2023-04-11 17:29:47','2023-04-11 17:29:47',NULL),(22,8,1,'Amo a este artista!!!!','2023-04-11 17:30:09','2023-04-11 17:30:09',NULL),(23,8,6,'Amo a este artista!!!!','2023-04-11 17:30:11','2023-04-11 17:30:11',NULL),(24,8,7,'Amo a este artista!!!!','2023-04-11 17:30:13','2023-04-11 17:30:13',NULL),(25,8,8,'Amo a este artista!!!!','2023-04-11 17:30:14','2023-04-11 17:30:14',NULL),(26,8,9,'Amo a este artista!!!!','2023-04-11 17:30:16','2023-04-11 17:30:16',NULL),(27,8,10,'Amo a este artista!!!!','2023-04-11 17:30:18','2023-04-11 17:30:18',NULL),(28,8,11,'Amo a este artista!!!!','2023-04-11 17:30:19','2023-04-11 17:30:19',NULL),(29,8,12,'Amo a este artista!!!!','2023-04-11 17:30:21','2023-04-11 17:30:21',NULL),(30,8,13,'Amo a este artista!!!!','2023-04-11 17:30:22','2023-04-11 17:30:22',NULL),(31,8,13,'Amo a este artista!!!!','2023-04-11 17:30:23','2023-04-11 17:30:23',NULL),(32,8,1,'Amo a este artista!!!!','2023-04-11 17:30:28','2023-04-11 17:30:28',NULL),(33,8,14,'Amo a este artista!!!!','2023-04-11 17:30:31','2023-04-11 17:30:31',NULL),(34,9,1,'Cada album es mejor!','2023-04-11 17:30:53','2023-04-11 17:30:53',NULL),(36,9,6,'Cada album es mejor!','2023-04-11 17:30:58','2023-04-11 17:30:58',NULL),(37,9,7,'Cada album es mejor!','2023-04-11 17:31:00','2023-04-11 17:31:00',NULL),(38,9,8,'Cada album es mejor!','2023-04-11 17:31:01','2023-04-11 17:31:01',NULL),(39,9,9,'Cada album es mejor!','2023-04-11 17:31:03','2023-04-11 17:31:03',NULL),(40,9,10,'Cada album es mejor!','2023-04-11 17:31:05','2023-04-11 17:31:05',NULL),(41,9,11,'Cada album es mejor!','2023-04-11 17:31:07','2023-04-11 17:31:07',NULL),(42,9,12,'Cada album es mejor!','2023-04-11 17:31:09','2023-04-11 17:31:09',NULL),(43,9,13,'Cada album es mejor!','2023-04-11 17:31:11','2023-04-11 17:31:11',NULL),(44,9,14,'Cada album es mejor!','2023-04-11 17:31:12','2023-04-11 17:31:12',NULL);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11 17:17:07
