CREATE DATABASE  IF NOT EXISTS `masala_prueba` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `masala_prueba`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: masala_prueba
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `tipo_documento` varchar(50) NOT NULL,
  `numero_docuento` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `calle_nombre` varchar(50) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `piso` varchar(10) DEFAULT NULL,
  `dpto` varchar(10) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `codigo_postal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `numero_docuento` (`numero_docuento`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Fernando','Gomez','DNI',12345678,'fgomez@mail.com','Colon',1221,'A','3','Cordoba','5000'),(2,'Andrea','Ferrero','DNI',32348628,'andrea.ferrero@mail.com','Belgrano',153,NULL,NULL,'Santiago del Estero','5000'),(3,'Pedro','Alonzo','DNI',11385978,'palonzo@mail.com','General Paz',121,'E','1',' Buenos Aires','5000'),(4,'Felix','Gonzalez','DNI',10445578,'fgonzalez@mail.com','Santa Rosa',21,NULL,NULL,'Cordoba','5000');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `compra_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `fecha_compra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`compra_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,'2022-09-13 04:48:50',NULL),(3,2,'2022-09-13 04:48:50',NULL),(4,3,'2022-09-13 04:48:50',NULL),(5,1,'2022-09-13 04:48:50',NULL),(7,3,'2022-09-13 04:48:50',NULL),(8,4,'2022-09-13 04:48:50',NULL);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_entrega`
--

DROP TABLE IF EXISTS `empresa_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_entrega` (
  `empresa_entrega_id` int NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(50) DEFAULT NULL,
  `precio_km` decimal(9,2) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`empresa_entrega_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_entrega`
--

LOCK TABLES `empresa_entrega` WRITE;
/*!40000 ALTER TABLE `empresa_entrega` DISABLE KEYS */;
INSERT INTO `empresa_entrega` VALUES (1,'Transporte UNO SRL',20.00,'2022-09-13 04:48:51'),(2,'Entregas Oclock SA',22.00,'2022-09-13 04:48:51');
/*!40000 ALTER TABLE `empresa_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `envio_id` int NOT NULL AUTO_INCREMENT,
  `empresa_entrega_id` int NOT NULL,
  `kilometros` int NOT NULL,
  `fecha_envio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_envio` decimal(9,2) NOT NULL,
  PRIMARY KEY (`envio_id`),
  KEY `empresa_entrega_id` (`empresa_entrega_id`),
  CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`empresa_entrega_id`) REFERENCES `empresa_entrega` (`empresa_entrega_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES (1,1,35,'2022-09-13 04:48:51',700.00),(2,1,18,'2022-09-13 04:48:51',360.00),(3,2,7,'2022-09-13 04:48:51',154.00),(4,1,9,'2022-09-13 04:48:51',180.00),(5,1,3,'2022-09-13 04:48:51',60.00),(6,2,4,'2022-09-13 04:48:51',88.00);
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_compra`
--

DROP TABLE IF EXISTS `lista_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_compra` (
  `lista_compra_id` int NOT NULL AUTO_INCREMENT,
  `compra_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad_producto` int NOT NULL,
  `sub_total` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`lista_compra_id`),
  KEY `compra_id` (`compra_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `lista_compra_ibfk_1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`compra_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lista_compra_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_compra`
--

LOCK TABLES `lista_compra` WRITE;
/*!40000 ALTER TABLE `lista_compra` DISABLE KEYS */;
INSERT INTO `lista_compra` VALUES (1,1,2,5,4398.25),(2,1,4,3,2694.03),(3,1,1,2,1376.50),(4,5,4,3,2694.00),(6,3,6,8,5440.00),(7,5,4,5,4490.00),(8,4,2,3,1557.50),(9,4,1,2,1376.50),(11,7,1,2,1376.50),(12,8,1,2,1376.50);
/*!40000 ALTER TABLE `lista_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_table_audit`
--

DROP TABLE IF EXISTS `master_table_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_table_audit` (
  `master_table_id` int NOT NULL AUTO_INCREMENT,
  `table_audit_name` varchar(50) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deletes` tinyint(1) DEFAULT NULL,
  `updates` tinyint(1) DEFAULT NULL,
  `inserts` tinyint(1) DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `compra_id` int DEFAULT NULL,
  `empresa_entrega_id` int DEFAULT NULL,
  `envio_id` int DEFAULT NULL,
  `lista_compra_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `producto_proveedor_id` int DEFAULT NULL,
  `proveedor_id` int DEFAULT NULL,
  PRIMARY KEY (`master_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_table_audit`
--

LOCK TABLES `master_table_audit` WRITE;
/*!40000 ALTER TABLE `master_table_audit` DISABLE KEYS */;
INSERT INTO `master_table_audit` VALUES (1,'cliente','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'cliente','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'cliente','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'cliente','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'cliente','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'cliente','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'cliente','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(9,'compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,5,2,NULL,NULL,NULL,NULL,NULL,NULL),(10,'compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,2,3,NULL,NULL,NULL,NULL,NULL,NULL),(11,'compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,3,4,NULL,NULL,NULL,NULL,NULL,NULL),(12,'compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,1,5,NULL,NULL,NULL,NULL,NULL,NULL),(13,'compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,7,6,NULL,NULL,NULL,NULL,NULL,NULL),(14,'compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,3,7,NULL,NULL,NULL,NULL,NULL,NULL),(15,'compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,4,8,NULL,NULL,NULL,NULL,NULL,NULL),(16,'compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,6,9,NULL,NULL,NULL,NULL,NULL,NULL),(17,'producto','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(18,'producto','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(19,'producto','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL),(20,'producto','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),(21,'producto','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),(22,'producto','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),(23,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,1,NULL,NULL,1,2,NULL,NULL),(24,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,1,NULL,NULL,2,4,NULL,NULL),(25,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,1,NULL,NULL,3,1,NULL,NULL),(26,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,5,NULL,NULL,4,4,NULL,NULL),(27,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,2,NULL,NULL,5,6,NULL,NULL),(28,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,3,NULL,NULL,6,6,NULL,NULL),(29,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,5,NULL,NULL,7,4,NULL,NULL),(30,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,4,NULL,NULL,8,2,NULL,NULL),(31,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,4,NULL,NULL,9,1,NULL,NULL),(32,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,6,NULL,NULL,10,1,NULL,NULL),(33,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,7,NULL,NULL,11,1,NULL,NULL),(34,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,8,NULL,NULL,12,1,NULL,NULL),(35,'lista_compra','root@localhost','2022-09-13 04:48:50',NULL,NULL,1,NULL,9,NULL,NULL,13,1,NULL,NULL),(36,'empresa_entrega','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(37,'empresa_entrega','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL),(38,'envio','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,1,1,NULL,NULL,NULL,NULL),(39,'envio','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,1,2,NULL,NULL,NULL,NULL),(40,'envio','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,2,3,NULL,NULL,NULL,NULL),(41,'envio','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,1,4,NULL,NULL,NULL,NULL),(42,'envio','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,1,5,NULL,NULL,NULL,NULL),(43,'envio','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,2,6,NULL,NULL,NULL,NULL),(44,'proveedor','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(45,'proveedor','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(46,'producto_x_proveedor','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,3,1,1),(47,'producto_x_proveedor','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,2,1),(48,'producto_x_proveedor','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,4,3,2),(49,'producto_x_proveedor','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2,4,1),(50,'producto_x_proveedor','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,5,2),(51,'producto_x_proveedor','root@localhost','2022-09-13 04:48:51',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,5,6,1),(52,'cliente','root@localhost','2022-09-18 00:44:44',1,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'cliente','root@localhost','2022-09-18 00:44:44',1,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'cliente','root@localhost','2022-09-18 00:44:44',1,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'producto','root@localhost','2022-09-18 00:44:44',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL),(56,'producto','root@localhost','2022-09-18 00:44:45',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(57,'producto','root@localhost','2022-09-18 00:44:45',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL),(58,'producto','root@localhost','2022-09-18 00:44:45',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL),(59,'producto','root@localhost','2022-09-18 00:44:45',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,11,NULL,NULL),(60,'producto','root@localhost','2022-09-18 00:44:45',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,12,NULL,NULL),(61,'producto','root@localhost','2022-09-18 00:44:45',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,13,NULL,NULL),(62,'producto','root@localhost','2022-09-18 00:44:45',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,14,NULL,NULL);
/*!40000 ALTER TABLE `master_table_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `precio_producto` decimal(9,2) NOT NULL,
  `stock` int NOT NULL,
  `stock_minimo` int NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Cero Syrah','',688.25,25,5,'2022-09-13 04:48:50'),(2,'Chichero Malbec','',879.65,25,5,'2022-09-13 04:48:50'),(3,'Cuatro Vacas Locas Malbec','',778.75,25,5,'2022-09-13 04:48:50'),(4,'Cuatro Vacas Locas Cabernet','',898.01,25,5,'2022-09-13 04:48:50'),(5,'Esencia de la Tierra Malbec','',956.00,25,5,'2022-09-13 04:48:50'),(6,'Santa Irene Cabernet','',680.25,25,5,'2022-09-13 04:48:50'),(7,'Almohada Avellana','Lorem ipsum dolor sit',101.01,25,5,'2022-09-18 00:44:44'),(8,'Almohada Chocolate','Lorem ipsum dolor sit',102.21,25,5,'2022-09-18 00:44:45'),(9,'Almohada Frutilla','Lorem ipsum dolor sit',104.32,25,5,'2022-09-18 00:44:45'),(10,'Avena Tradicional','Lorem ipsum dolor sit',57.86,25,5,'2022-09-18 00:44:45'),(11,'Anillo Frutas','Lorem ipsum dolor sit',56.88,25,5,'2022-09-18 00:44:45'),(12,'Arroz Inflado Dulce','Lorem ipsum dolor sit',55.80,25,5,'2022-09-18 00:44:45'),(13,'Avena Instantanea','Lorem ipsum dolor sit',57.05,25,5,'2022-09-18 00:44:45'),(14,'Bolitas Chocolate','Lorem ipsum dolor sit',55.03,25,5,'2022-09-18 00:44:45');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_x_proveedor`
--

DROP TABLE IF EXISTS `producto_x_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_x_proveedor` (
  `producto_proveedor_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad_producto` int NOT NULL,
  `fecha_compra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sub_total` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`producto_proveedor_id`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `producto_x_proveedor_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producto_x_proveedor_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_x_proveedor`
--

LOCK TABLES `producto_x_proveedor` WRITE;
/*!40000 ALTER TABLE `producto_x_proveedor` DISABLE KEYS */;
INSERT INTO `producto_x_proveedor` VALUES (1,1,3,25,'2022-09-13 04:48:51',14650.00),(2,1,1,25,'2022-09-13 04:48:51',11568.00),(3,2,4,25,'2022-09-13 04:48:51',16200.00),(4,1,2,25,'2022-09-13 04:48:51',13846.00),(5,2,6,25,'2022-09-13 04:48:51',17258.00),(6,1,5,25,'2022-09-13 04:48:51',13664.00);
/*!40000 ALTER TABLE `producto_x_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(150) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `direccion` varchar(150) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ciudad` varchar(150) DEFAULT NULL,
  `provincia` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Bodega Santa Clara','2022-09-13 04:48:51','Alvear 55','santa_clara@bodegaUno.com','Capital','Mendoza'),(2,'Bodega Alvarez','2022-09-13 04:48:51','Irigoyen 356','bodega_alvear@gmail.com','Capital','San Juan');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-26 20:13:51
