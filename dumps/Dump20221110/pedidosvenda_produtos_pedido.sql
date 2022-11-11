-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: pedidosvenda
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `produtos_pedido`
--

DROP TABLE IF EXISTS `produtos_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_pedido` (
  `id_produtos_pedido` int NOT NULL AUTO_INCREMENT,
  `id_numero_pedido` int NOT NULL,
  `id_produto` int NOT NULL,
  `vl_quantidade` decimal(15,2) DEFAULT NULL,
  `vl_unitario` decimal(15,2) DEFAULT NULL,
  `vl_total` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id_produtos_pedido`),
  KEY `fk_produtos_pedido_produtos1_idx` (`id_produto`),
  KEY `fk_produtos_pedido_dados_gerais_pedido1_idx` (`id_numero_pedido`),
  CONSTRAINT `fk_produtos_pedido_dados_gerais_pedido1` FOREIGN KEY (`id_numero_pedido`) REFERENCES `dados_gerais_pedido` (`id_numero_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_produtos_pedido_produtos1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_pedido`
--

LOCK TABLES `produtos_pedido` WRITE;
/*!40000 ALTER TABLE `produtos_pedido` DISABLE KEYS */;
INSERT INTO `produtos_pedido` VALUES (4,1,1,1.00,1.00,1.00),(5,1,2,1.00,2.00,2.00),(6,1,3,1.00,3.00,3.00),(7,1,4,2.00,4.00,8.00),(8,2,1,1.00,1.00,1.00),(10,2,2,1.00,2.00,2.00),(11,1,6,1.00,6.00,6.00),(12,1,20,1.00,20.00,20.00);
/*!40000 ALTER TABLE `produtos_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10 23:24:25
