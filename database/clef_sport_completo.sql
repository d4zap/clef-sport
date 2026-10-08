CREATE DATABASE  IF NOT EXISTS `clef_sport` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clef_sport`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: clef_sport
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `auditoria_stock`
--

DROP TABLE IF EXISTS `auditoria_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_stock` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `accion` varchar(50) NOT NULL,
  `stock_anterior` int DEFAULT NULL,
  `stock_nuevo` int DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `detalle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_stock`
--

LOCK TABLES `auditoria_stock` WRITE;
/*!40000 ALTER TABLE `auditoria_stock` DISABLE KEYS */;
INSERT INTO `auditoria_stock` VALUES (1,10,'ACTUALIZACION',50,40,'2026-06-02 21:08:11','Stock actualizado para: Puma RS-X Reinvention');
/*!40000 ALTER TABLE `auditoria_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Running','Zapatillas diseñadas para correr y entrenar'),(2,'Basketball','Calzado de alto rendimiento para baloncesto'),(3,'Casual','Estilo urbano para uso cotidiano'),(4,'Skate','Diseño resistente para skateboarding'),(5,'Coleccionable','Ediciones limitadas y colaboraciones especiales'),(6,'Training','Para entrenamiento funcional y gimnasio');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','Pérez','1001234561','3101112233','juan@gmail.com','Cali, Valle'),(2,'María','López','1001234562','3112223344','maria@gmail.com','Cali, Valle'),(3,'Carlos','Ruiz','1001234563','3123334455','carlos@gmail.com','Cali, Valle'),(4,'Ana','Torres','1001234564','3134445566','ana@gmail.com','Medellín, Ant'),(5,'Luis','García','1001234565','3145556677','luis@gmail.com','Bogotá, DC'),(6,'Sofía','Martínez','1001234566','3156667788','sofia@gmail.com','Cali, Valle'),(7,'Pedro','González','1001234567','3167778899','pedro@gmail.com','Cali, Valle'),(8,'Laura','Sánchez','1001234568','3178889900','laura@gmail.com','Cali, Valle'),(9,'Diego','Rodríguez','1001234569','3189990011','diego@gmail.com','Pereira, Ris'),(10,'Valentina','Díaz','1001234570','3190001122','valentina@gmail.com','Cali, Valle'),(11,'Andrés','Vargas','1001234571','3201112233','andres@gmail.com','Cali, Valle'),(12,'Camila','Moreno','1001234572','3212223344','camila@gmail.com','Bogotá, DC'),(13,'Sebastián','Jiménez','1001234573','3223334455','sebas@gmail.com','Cali, Valle'),(14,'Isabella','Herrera','1001234574','3234445566','isabella@gmail.com','Cali, Valle'),(15,'Tomás','Castro','1001234575','3245556677','tomas@gmail.com','Cali, Valle'),(16,'Natalia','Flores','1001234576','3256667788','natalia@gmail.com','Cali, Valle'),(17,'Felipe','Ortega','1001234577','3267778899','felipe@gmail.com','Bogotá, DC'),(18,'Daniela','Ramos','1001234578','3278889900','daniela@gmail.com','Cali, Valle'),(19,'Alejandro','Cruz','1001234579','3289990011','alejandro@gmail.com','Cali, Valle'),(20,'Mariana','Medina','1001234580','3290001122','mariana@gmail.com','Medellín, Ant'),(21,'Nicolás','Guerrero','1001234581','3301112233','nicolas@gmail.com','Cali, Valle'),(22,'Gabriela','Silva','1001234582','3312223344','gabriela@gmail.com','Cali, Valle'),(23,'Mateo','Pinto','1001234583','3323334455','mateo@gmail.com','Pereira, Ris'),(24,'Valeria','Castillo','1001234584','3334445566','valeria@gmail.com','Cali, Valle'),(25,'Esteban','Romero','1001234585','3345556677','esteban@gmail.com','Bogotá, DC'),(26,'Juliana','Peña','1001234586','3356667788','juliana@gmail.com','Cali, Valle'),(27,'Samuel','Aguilar','1001234587','3367778899','samuel@gmail.com','Cali, Valle'),(28,'Sara','Blanco','1001234588','3378889900','sara@gmail.com','Cali, Valle'),(29,'David','Molina','1001234589','3389990011','david2@gmail.com','Medellín, Ant'),(30,'Paula','Ríos','1001234590','3390001122','paula@gmail.com','Cali, Valle'),(31,'Cristian','Delgado','1001234591','3401112233','cristian@gmail.com','Cali, Valle'),(32,'Melissa','Rojas','1001234592','3412223344','melissa@gmail.com','Bogotá, DC'),(33,'Jhon','Navarrete','1001234593','3423334455','jhon@gmail.com','Cali, Valle'),(34,'Tatiana','Pineda','1001234594','3434445566','tatiana@gmail.com','Cali, Valle'),(35,'Andrés','Ospina','1001234595','3445556677','andres2@gmail.com','Pereira, Ris'),(36,'Lina','Cardona','1001234596','3456667788','lina@gmail.com','Cali, Valle'),(37,'Fabián','Zapata','1001234597','3467778899','fabian@gmail.com','Cali, Valle'),(38,'Luisa','Bernal','1001234598','3478889900','luisa@gmail.com','Bogotá, DC'),(39,'Iván','Castaño','1001234599','3489990011','ivan@gmail.com','Cali, Valle'),(40,'Ximena','Palacio','1001234600','3490001122','ximena@gmail.com','Medellín, Ant'),(41,'Gonzalo','Quintero','1001234601','3501112233','gonzalo@gmail.com','Cali, Valle'),(42,'Paola','Salcedo','1001234602','3512223344','paola@gmail.com','Cali, Valle'),(43,'Rodrigo','Velásquez','1001234603','3523334455','rodrigo@gmail.com','Cali, Valle'),(44,'Claudia','Arango','1001234604','3534445566','claudia@gmail.com','Bogotá, DC'),(45,'Héctor','Correa','1001234605','3545556677','hector@gmail.com','Cali, Valle'),(46,'Mónica','Espinosa','1001234606','3556667788','monica@gmail.com','Cali, Valle'),(47,'Javier','Franco','1001234607','3567778899','javier@gmail.com','Pereira, Ris'),(48,'Patricia','Gil','1001234608','3578889900','patricia@gmail.com','Cali, Valle'),(49,'Ricardo','Hoyos','1001234609','3589990011','ricardo@gmail.com','Cali, Valle'),(50,'Adriana','Ibáñez','1001234610','3590001122','adriana@gmail.com','Medellín, Ant');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` date NOT NULL,
  `total` decimal(14,2) NOT NULL DEFAULT '0.00',
  `estado` varchar(30) NOT NULL DEFAULT 'Recibida',
  PRIMARY KEY (`id_compra`),
  KEY `fk_compra_prov` (`id_proveedor`),
  KEY `fk_compra_usr` (`id_usuario`),
  CONSTRAINT `fk_compra_prov` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `fk_compra_usr` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,1,'2025-07-05',9500000.00,'Recibida'),(2,2,1,'2025-07-12',6500000.00,'Recibida'),(3,3,1,'2025-07-20',12000000.00,'Recibida'),(4,4,1,'2025-07-28',8800000.00,'Recibida'),(5,5,1,'2025-08-03',5400000.00,'Recibida'),(6,1,1,'2025-08-10',7200000.00,'Recibida'),(7,6,1,'2025-08-18',9100000.00,'Recibida'),(8,7,1,'2025-08-25',11500000.00,'Recibida'),(9,8,1,'2025-09-02',6800000.00,'Recibida'),(10,2,1,'2025-09-10',7500000.00,'Recibida'),(11,3,1,'2025-09-18',10200000.00,'Recibida'),(12,1,1,'2025-09-25',8400000.00,'Recibida'),(13,4,1,'2025-10-03',5900000.00,'Recibida'),(14,5,1,'2025-10-11',7100000.00,'Recibida'),(15,6,1,'2025-10-19',9800000.00,'Recibida'),(16,7,1,'2025-10-27',12500000.00,'Recibida'),(17,8,1,'2025-11-04',6300000.00,'Recibida'),(18,1,1,'2025-11-12',8700000.00,'Recibida'),(19,2,1,'2025-11-20',7900000.00,'Recibida'),(20,3,1,'2025-11-28',11000000.00,'Recibida'),(21,4,1,'2025-12-06',9200000.00,'Recibida'),(22,5,1,'2025-12-14',6600000.00,'Recibida'),(23,6,1,'2025-12-22',10500000.00,'Recibida'),(24,1,1,'2026-01-10',9500000.00,'Recibida'),(25,2,1,'2026-01-20',6500000.00,'Recibida'),(26,3,1,'2026-02-05',12000000.00,'Recibida'),(27,4,1,'2026-02-18',8800000.00,'Recibida'),(28,5,1,'2026-03-01',5400000.00,'Recibida'),(29,6,1,'2026-03-10',7300000.00,'Recibida'),(30,7,1,'2026-03-18',9600000.00,'Recibida'),(31,8,1,'2026-03-25',11200000.00,'Recibida'),(32,1,1,'2026-04-01',8100000.00,'Recibida'),(33,2,1,'2025-07-08',7600000.00,'Recibida'),(34,3,1,'2025-07-16',10800000.00,'Recibida'),(35,4,1,'2025-08-01',6200000.00,'Recibida'),(36,5,1,'2025-08-15',8300000.00,'Recibida'),(37,6,1,'2025-08-29',9700000.00,'Recibida'),(38,7,1,'2025-09-12',11800000.00,'Recibida'),(39,8,1,'2025-09-26',7400000.00,'Recibida'),(40,1,1,'2025-10-10',8900000.00,'Recibida'),(41,2,1,'2025-10-24',6700000.00,'Recibida'),(42,3,1,'2025-11-07',10100000.00,'Recibida'),(43,4,1,'2025-11-21',7800000.00,'Recibida'),(44,5,1,'2025-12-05',9300000.00,'Recibida'),(45,6,1,'2025-12-19',11600000.00,'Recibida'),(46,7,1,'2026-01-08',8200000.00,'Recibida'),(47,8,1,'2026-01-22',6900000.00,'Recibida'),(48,1,1,'2026-02-12',10400000.00,'Recibida'),(49,2,1,'2026-02-26',7700000.00,'Recibida'),(50,3,1,'2026-03-12',9000000.00,'Recibida');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id_detalle_compra` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `cantidad` int NOT NULL,
  `id_producto` int NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `fk_dc_compra` (`id_compra`),
  KEY `fk_dc_prod` (`id_producto`),
  CONSTRAINT `fk_dc_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `fk_dc_prod` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,1,5,1,600000.00),(2,1,4,6,680000.00),(3,2,8,2,380000.00),(4,2,10,11,160000.00),(5,3,3,5,750000.00),(6,3,6,7,620000.00),(7,4,10,8,310000.00),(8,4,12,3,280000.00),(9,5,14,9,220000.00),(10,5,20,10,190000.00),(11,6,15,4,200000.00),(12,6,18,12,140000.00),(13,7,10,13,250000.00),(14,7,8,14,350000.00),(15,8,12,15,270000.00),(16,8,7,16,660000.00),(17,9,10,17,300000.00),(18,9,15,18,160000.00),(19,10,20,19,140000.00),(20,10,25,20,130000.00),(21,11,18,21,130000.00),(22,11,12,22,170000.00),(23,12,6,23,460000.00),(24,12,8,24,400000.00),(25,13,5,25,640000.00),(26,13,10,26,290000.00),(27,14,4,27,900000.00),(28,14,12,28,370000.00),(29,15,15,29,250000.00),(30,15,10,30,350000.00),(31,16,20,31,120000.00),(32,16,12,32,200000.00),(33,17,10,33,310000.00),(34,17,15,34,220000.00),(35,18,25,35,120000.00),(36,18,6,36,610000.00),(37,19,20,37,270000.00),(38,19,15,38,220000.00),(39,20,8,39,420000.00),(40,20,18,40,150000.00),(41,21,20,41,140000.00),(42,21,12,42,190000.00),(43,22,8,43,440000.00),(44,22,5,44,670000.00),(45,23,12,45,180000.00),(46,23,15,46,290000.00),(47,24,10,47,330000.00),(48,24,12,48,170000.00),(49,25,15,49,180000.00),(50,25,18,50,160000.00);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `fk_dv_venta` (`id_venta`),
  KEY `idx_dv_prod_covering` (`id_producto`,`cantidad`,`subtotal`),
  CONSTRAINT `fk_dv_prod` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `fk_dv_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,1,950000.00,950000.00),(2,2,2,1,650000.00,650000.00),(3,3,3,1,480000.00,480000.00),(4,4,5,1,1200000.00,1200000.00),(5,5,4,1,350000.00,350000.00),(6,6,6,1,1100000.00,1100000.00),(7,7,7,1,980000.00,980000.00),(8,8,8,1,520000.00,520000.00),(9,9,9,1,380000.00,380000.00),(10,10,10,1,320000.00,320000.00),(11,11,11,1,280000.00,280000.00),(12,12,12,1,260000.00,260000.00),(13,13,13,1,420000.00,420000.00),(14,14,14,1,580000.00,580000.00),(15,15,15,1,450000.00,450000.00),(16,16,16,1,1050000.00,1050000.00),(17,17,17,1,520000.00,520000.00),(18,18,18,1,280000.00,280000.00),(19,19,19,1,240000.00,240000.00),(20,20,20,1,220000.00,220000.00),(21,21,21,1,230000.00,230000.00),(22,22,22,1,290000.00,290000.00),(23,23,23,1,750000.00,750000.00),(24,24,24,1,680000.00,680000.00),(25,25,25,1,1020000.00,1020000.00),(26,26,26,1,480000.00,480000.00),(27,27,27,1,1500000.00,1500000.00),(28,28,28,1,620000.00,620000.00),(29,29,29,1,420000.00,420000.00),(30,30,30,1,580000.00,580000.00),(31,31,31,1,200000.00,200000.00),(32,32,32,1,340000.00,340000.00),(33,33,33,1,520000.00,520000.00),(34,34,34,1,380000.00,380000.00),(35,35,35,1,210000.00,210000.00),(36,36,36,1,980000.00,980000.00),(37,37,37,1,460000.00,460000.00),(38,38,38,1,380000.00,380000.00),(39,39,39,1,680000.00,680000.00),(40,40,40,1,260000.00,260000.00),(41,41,41,1,240000.00,240000.00),(42,42,42,1,320000.00,320000.00),(43,43,43,1,720000.00,720000.00),(44,44,44,1,1080000.00,1080000.00),(45,45,45,1,310000.00,310000.00),(46,46,46,1,490000.00,490000.00),(47,47,47,1,560000.00,560000.00),(48,48,48,1,290000.00,290000.00),(49,49,49,1,310000.00,310000.00),(50,50,50,1,270000.00,270000.00),(51,51,10,10,320000.00,3200000.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `pais_origen` varchar(80) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Nike','Estados Unidos','Marca líder en calzado deportivo y streetwear'),(2,'Adidas','Alemania','Marca icónica con líneas clásicas y modernas'),(3,'Jordan','Estados Unidos','Sub-marca de Nike, icono del baloncesto'),(4,'New Balance','Estados Unidos','Reconocida por comodidad y ediciones limitadas'),(5,'Puma','Alemania','Calzado deportivo con estilo urbano'),(6,'Vans','Estados Unidos','Referente del skate y la cultura urbana'),(7,'Converse','Estados Unidos','Clásico del streetwear mundial'),(8,'Reebok','Reino Unido','Marca deportiva con fuerte presencia urbana');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_marca` int NOT NULL,
  `id_categoria` int NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `talla` varchar(10) NOT NULL,
  `color` varchar(60) DEFAULT NULL,
  `precio_venta` decimal(12,2) NOT NULL,
  `precio_costo` decimal(12,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_producto`),
  KEY `fk_prod_marca` (`id_marca`),
  KEY `fk_prod_cat` (`id_categoria`),
  CONSTRAINT `fk_prod_cat` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_prod_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,5,'Air Jordan 1 High OG Chicago','42','Rojo/Blanco/Negro',950000.00,600000.00,50),(2,1,5,'Nike Dunk Low Panda','41','Blanco/Negro',650000.00,380000.00,50),(3,1,1,'Nike Air Max 90','43','Blanco',480000.00,280000.00,50),(4,2,3,'Adidas Stan Smith','42','Blanco/Verde',350000.00,200000.00,50),(5,2,5,'Adidas Yeezy Boost 350 V2','44','Zebra',1200000.00,750000.00,50),(6,3,2,'Air Jordan 4 Retro Fire Red','41','Rojo/Negro/Blanco',1100000.00,680000.00,50),(7,3,2,'Air Jordan 11 Retro Bred','43','Negro/Rojo',980000.00,620000.00,50),(8,4,1,'New Balance 550 White Green','42','Blanco/Verde',520000.00,310000.00,50),(9,4,3,'New Balance 574 Grey','40','Gris',380000.00,220000.00,50),(10,5,3,'Puma RS-X Reinvention','41','Blanco/Azul',320000.00,190000.00,40),(11,6,4,'Vans Old Skool Black White','43','Negro/Blanco',280000.00,160000.00,50),(12,7,3,'Converse Chuck 70 Hi White','42','Blanco',260000.00,140000.00,50),(13,1,6,'Nike Metcon 8','42','Negro/Volt',420000.00,250000.00,50),(14,2,1,'Adidas Ultraboost 22','41','Negro',580000.00,350000.00,50),(15,1,5,'Nike Air Force 1 07 White','44','Blanco',450000.00,270000.00,50),(16,3,2,'Air Jordan 3 Retro White Cement','42','Blanco/Cemento',1050000.00,660000.00,50),(17,1,1,'Nike React Infinity Run','43','Azul/Blanco',520000.00,300000.00,50),(18,2,6,'Adidas Powerlift 5','42','Negro',280000.00,160000.00,50),(19,5,3,'Puma Suede Classic','41','Azul Marino',240000.00,140000.00,50),(20,6,4,'Vans Era Black','43','Negro',220000.00,130000.00,50),(21,7,3,'Converse All Star Hi Red','42','Rojo',230000.00,130000.00,50),(22,8,3,'Reebok Classic Leather','41','Blanco',290000.00,170000.00,50),(23,4,1,'New Balance 990v5 Grey','42','Gris',750000.00,460000.00,50),(24,1,2,'Nike LeBron 20','44','Morado/Dorado',680000.00,400000.00,50),(25,3,2,'Air Jordan 6 Retro Carmine','43','Rojo/Blanco',1020000.00,640000.00,50),(26,2,5,'Adidas NMD R1 Triple Black','42','Negro',480000.00,290000.00,50),(27,1,5,'Nike SB Dunk Low Travis Scott','41','Marrón/Blanco',1500000.00,900000.00,30),(28,3,2,'Air Jordan 1 Mid Chicago','43','Rojo/Blanco/Negro',620000.00,370000.00,50),(29,4,3,'New Balance 327 Varsity Green','42','Verde/Blanco',420000.00,250000.00,50),(30,5,1,'Puma Deviate Nitro Elite','41','Naranja/Negro',580000.00,350000.00,50),(31,6,4,'Vans Authentic White','43','Blanco',200000.00,120000.00,50),(32,8,6,'Reebok Nano X2','42','Negro/Rojo',340000.00,200000.00,50),(33,2,1,'Adidas Adizero Boston 11','41','Negro/Blanco',520000.00,310000.00,50),(34,1,6,'Nike Zoom SuperRep 4','42','Rosa/Blanco',380000.00,220000.00,50),(35,7,3,'Converse Chuck Taylor Low','43','Negro',210000.00,120000.00,50),(36,3,5,'Air Jordan 12 Retro Taxi','42','Amarillo/Negro',980000.00,610000.00,40),(37,1,1,'Nike Pegasus 40','41','Azul/Blanco',460000.00,270000.00,50),(38,2,3,'Adidas Gazelle Indoor','43','Rojo',380000.00,220000.00,50),(39,4,5,'New Balance 2002R Protection Pack','42','Gris/Beige',680000.00,420000.00,35),(40,5,3,'Puma Mayze Classic','41','Blanco',260000.00,150000.00,50),(41,6,3,'Vans Slip-On Checkerboard','43','Negro/Blanco',240000.00,140000.00,50),(42,8,1,'Reebok Floatride Energy 5','42','Azul/Blanco',320000.00,190000.00,50),(43,1,2,'Nike KD 15 All Star','41','Multicolor',720000.00,440000.00,45),(44,3,5,'Air Jordan 5 Retro Metallic','43','Plata/Negro',1080000.00,670000.00,30),(45,2,6,'Adidas Dropset 2 Trainer','42','Gris',310000.00,180000.00,50),(46,1,3,'Nike Air Max 270','44','Negro/Blanco',490000.00,290000.00,50),(47,4,1,'New Balance Fresh Foam X 1080','41','Blanco/Verde',560000.00,330000.00,50),(48,5,4,'Puma Slipstream Lo Retro','42','Blanco/Verde',290000.00,170000.00,50),(49,7,4,'Converse One Star Pro','43','Negro/Blanco/Rojo',310000.00,180000.00,50),(50,8,3,'Reebok Club C 85','42','Blanco/Verde',270000.00,160000.00,50),(51,1,5,'Air Jordan 1 High OG Chicago','42','Rojo/Blanco/Negro',950000.00,600000.00,50),(52,1,5,'Nike Dunk Low Panda','41','Blanco/Negro',650000.00,380000.00,50),(53,1,1,'Nike Air Max 90','43','Blanco',480000.00,280000.00,50),(54,2,3,'Adidas Stan Smith','42','Blanco/Verde',350000.00,200000.00,50),(55,2,5,'Adidas Yeezy Boost 350 V2','44','Zebra',1200000.00,750000.00,50),(56,3,2,'Air Jordan 4 Retro Fire Red','41','Rojo/Negro/Blanco',1100000.00,680000.00,50),(57,3,2,'Air Jordan 11 Retro Bred','43','Negro/Rojo',980000.00,620000.00,50),(58,4,1,'New Balance 550 White Green','42','Blanco/Verde',520000.00,310000.00,50),(59,4,3,'New Balance 574 Grey','40','Gris',380000.00,220000.00,50),(60,5,3,'Puma RS-X Reinvention','41','Blanco/Azul',320000.00,190000.00,50),(61,6,4,'Vans Old Skool Black White','43','Negro/Blanco',280000.00,160000.00,50),(62,7,3,'Converse Chuck 70 Hi White','42','Blanco',260000.00,140000.00,50),(63,1,6,'Nike Metcon 8','42','Negro/Volt',420000.00,250000.00,50),(64,2,1,'Adidas Ultraboost 22','41','Negro',580000.00,350000.00,50),(65,1,5,'Nike Air Force 1 07 White','44','Blanco',450000.00,270000.00,50),(66,3,2,'Air Jordan 3 Retro White Cement','42','Blanco/Cemento',1050000.00,660000.00,50),(67,1,1,'Nike React Infinity Run','43','Azul/Blanco',520000.00,300000.00,50),(68,2,6,'Adidas Powerlift 5','42','Negro',280000.00,160000.00,50),(69,5,3,'Puma Suede Classic','41','Azul Marino',240000.00,140000.00,50),(70,6,4,'Vans Era Black','43','Negro',220000.00,130000.00,50),(71,7,3,'Converse All Star Hi Red','42','Rojo',230000.00,130000.00,50),(72,8,3,'Reebok Classic Leather','41','Blanco',290000.00,170000.00,50),(73,4,1,'New Balance 990v5 Grey','42','Gris',750000.00,460000.00,50),(74,1,2,'Nike LeBron 20','44','Morado/Dorado',680000.00,400000.00,50),(75,3,2,'Air Jordan 6 Retro Carmine','43','Rojo/Blanco',1020000.00,640000.00,50),(76,2,5,'Adidas NMD R1 Triple Black','42','Negro',480000.00,290000.00,50),(77,1,5,'Nike SB Dunk Low Travis Scott','41','Marrón/Blanco',1500000.00,900000.00,30),(78,3,2,'Air Jordan 1 Mid Chicago','43','Rojo/Blanco/Negro',620000.00,370000.00,50),(79,4,3,'New Balance 327 Varsity Green','42','Verde/Blanco',420000.00,250000.00,50),(80,5,1,'Puma Deviate Nitro Elite','41','Naranja/Negro',580000.00,350000.00,50),(81,6,4,'Vans Authentic White','43','Blanco',200000.00,120000.00,50),(82,8,6,'Reebok Nano X2','42','Negro/Rojo',340000.00,200000.00,50),(83,2,1,'Adidas Adizero Boston 11','41','Negro/Blanco',520000.00,310000.00,50),(84,1,6,'Nike Zoom SuperRep 4','42','Rosa/Blanco',380000.00,220000.00,50),(85,7,3,'Converse Chuck Taylor Low','43','Negro',210000.00,120000.00,50),(86,3,5,'Air Jordan 12 Retro Taxi','42','Amarillo/Negro',980000.00,610000.00,40),(87,1,1,'Nike Pegasus 40','41','Azul/Blanco',460000.00,270000.00,50),(88,2,3,'Adidas Gazelle Indoor','43','Rojo',380000.00,220000.00,50),(89,4,5,'New Balance 2002R Protection Pack','42','Gris/Beige',680000.00,420000.00,35),(90,5,3,'Puma Mayze Classic','41','Blanco',260000.00,150000.00,50),(91,6,3,'Vans Slip-On Checkerboard','43','Negro/Blanco',240000.00,140000.00,50),(92,8,1,'Reebok Floatride Energy 5','42','Azul/Blanco',320000.00,190000.00,50),(93,1,2,'Nike KD 15 All Star','41','Multicolor',720000.00,440000.00,45),(94,3,5,'Air Jordan 5 Retro Metallic','43','Plata/Negro',1080000.00,670000.00,30),(95,2,6,'Adidas Dropset 2 Trainer','42','Gris',310000.00,180000.00,50),(96,1,3,'Nike Air Max 270','44','Negro/Blanco',490000.00,290000.00,50),(97,4,1,'New Balance Fresh Foam X 1080','41','Blanco/Verde',560000.00,330000.00,50),(98,5,4,'Puma Slipstream Lo Retro','42','Blanco/Verde',290000.00,170000.00,50),(99,7,4,'Converse One Star Pro','43','Negro/Blanco/Rojo',310000.00,180000.00,50),(100,8,3,'Reebok Club C 85','42','Blanco/Verde',270000.00,160000.00,50);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auditoria_stock` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN
    IF OLD.stock <> NEW.stock THEN
        INSERT INTO auditoria_stock
        (id_producto, accion, stock_anterior, stock_nuevo, detalle)
        VALUES (
            NEW.id_producto,
            'ACTUALIZACION',
            OLD.stock,
            NEW.stock,
            CONCAT('Stock actualizado para: ', NEW.nombre)
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `pais` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Sneakers Import SAS','Carlos Mejia','3001234567','carlos@sneakersimp.com','Colombia'),(2,'Urban Distribution','María Torres','3012345678','maria@urbandist.com','Colombia'),(3,'Miami Kicks LLC','John Smith','13055678901','john@miamikicks.com','Estados Unidos'),(4,'Footwear Global','Ana Reyes','3023456789','ana@footwearglobal.com','Colombia'),(5,'Elite Sneakers','Pedro Gómez','3034567890','pedro@elitesneakers.com','Colombia'),(6,'SneakerZone MX','Jorge Ramírez','525512345678','jorge@sneakerzone.mx','México'),(7,'KicksPro EU','Emma Müller','4930123456','emma@kickspro.eu','Alemania'),(8,'SportDeal USA','Robert Lee','13105551234','robert@sportdeal.com','Estados Unidos');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` enum('Admin','Vendedor') NOT NULL DEFAULT 'Vendedor',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'David Salazar','david@clef.com','$2b$10$hash1admin','Admin',1),(2,'Laura Martínez','laura@clef.com','$2b$10$hash2vend','Vendedor',1),(3,'Santiago Ríos','santiago@clef.com','$2b$10$hash3vend','Vendedor',1),(4,'Valentina Cruz','valentina@clef.com','$2b$10$hash4vend','Vendedor',1),(5,'Miguel Herrera','miguel@clef.com','$2b$10$hash5vend','Vendedor',1),(6,'Andrea Ospina','andrea@clef.com','$2b$10$hash6vend','Vendedor',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` date NOT NULL,
  `total` decimal(14,2) NOT NULL DEFAULT '0.00',
  `metodo_pago` varchar(40) NOT NULL DEFAULT 'Efectivo',
  `estado` varchar(30) NOT NULL DEFAULT 'Completada',
  PRIMARY KEY (`id_venta`),
  KEY `fk_venta_cli` (`id_cliente`),
  KEY `fk_venta_usr` (`id_usuario`),
  CONSTRAINT `fk_venta_cli` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_venta_usr` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,2,'2025-08-01',950000.00,'Efectivo','Completada'),(2,2,2,'2025-08-03',650000.00,'Transferencia','Completada'),(3,3,3,'2025-08-05',480000.00,'Tarjeta','Completada'),(4,4,2,'2025-08-07',1200000.00,'Efectivo','Completada'),(5,5,3,'2025-08-09',350000.00,'Transferencia','Completada'),(6,6,4,'2025-08-11',1100000.00,'Tarjeta','Completada'),(7,7,2,'2025-08-13',980000.00,'Efectivo','Completada'),(8,8,3,'2025-08-15',520000.00,'Transferencia','Completada'),(9,9,4,'2025-08-17',380000.00,'Tarjeta','Completada'),(10,10,2,'2025-08-19',320000.00,'Efectivo','Completada'),(11,11,3,'2025-08-21',280000.00,'Tarjeta','Completada'),(12,12,4,'2025-08-23',260000.00,'Efectivo','Completada'),(13,13,2,'2025-08-25',420000.00,'Transferencia','Completada'),(14,14,3,'2025-08-27',580000.00,'Tarjeta','Completada'),(15,15,4,'2025-08-29',450000.00,'Efectivo','Completada'),(16,16,2,'2025-09-01',1050000.00,'Tarjeta','Completada'),(17,17,3,'2025-09-03',520000.00,'Efectivo','Completada'),(18,18,4,'2025-09-05',280000.00,'Transferencia','Completada'),(19,19,2,'2025-09-07',240000.00,'Efectivo','Completada'),(20,20,3,'2025-09-09',220000.00,'Tarjeta','Completada'),(21,21,4,'2025-09-11',230000.00,'Efectivo','Completada'),(22,22,2,'2025-09-13',290000.00,'Transferencia','Completada'),(23,23,3,'2025-09-15',750000.00,'Tarjeta','Completada'),(24,24,4,'2025-09-17',680000.00,'Efectivo','Completada'),(25,25,2,'2025-09-19',1020000.00,'Tarjeta','Completada'),(26,26,3,'2025-09-21',480000.00,'Efectivo','Completada'),(27,27,4,'2025-09-23',1500000.00,'Transferencia','Completada'),(28,28,2,'2025-09-25',620000.00,'Tarjeta','Completada'),(29,29,3,'2025-09-27',420000.00,'Efectivo','Completada'),(30,30,4,'2025-09-29',580000.00,'Tarjeta','Completada'),(31,31,2,'2025-10-01',200000.00,'Efectivo','Completada'),(32,32,3,'2025-10-03',340000.00,'Transferencia','Completada'),(33,33,4,'2025-10-05',520000.00,'Tarjeta','Completada'),(34,34,2,'2025-10-07',380000.00,'Efectivo','Completada'),(35,35,3,'2025-10-09',210000.00,'Transferencia','Completada'),(36,36,4,'2025-10-11',980000.00,'Tarjeta','Completada'),(37,37,2,'2025-10-13',460000.00,'Efectivo','Completada'),(38,38,3,'2025-10-15',380000.00,'Transferencia','Completada'),(39,39,4,'2025-10-17',680000.00,'Tarjeta','Completada'),(40,40,2,'2025-10-19',260000.00,'Efectivo','Completada'),(41,41,3,'2025-10-21',240000.00,'Transferencia','Completada'),(42,42,4,'2025-10-23',320000.00,'Tarjeta','Completada'),(43,43,2,'2025-10-25',720000.00,'Efectivo','Completada'),(44,44,3,'2025-10-27',1080000.00,'Tarjeta','Completada'),(45,45,4,'2025-10-29',310000.00,'Efectivo','Completada'),(46,46,2,'2025-11-01',490000.00,'Transferencia','Completada'),(47,47,3,'2025-11-03',560000.00,'Tarjeta','Completada'),(48,48,4,'2025-11-05',290000.00,'Efectivo','Completada'),(49,49,2,'2025-11-07',310000.00,'Transferencia','Completada'),(50,50,3,'2025-11-09',270000.00,'Tarjeta','Completada'),(51,5,2,'2026-06-02',3200000.00,'Tarjeta','Completada');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'clef_sport'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_anular_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_anular_venta`(
    IN p_id_venta INT
)
BEGIN
    DECLARE v_id_producto INT;
    DECLARE v_cantidad INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT id_producto, cantidad INTO v_id_producto, v_cantidad
    FROM detalle_venta WHERE id_venta = p_id_venta LIMIT 1;

    UPDATE venta SET estado = 'Anulada' WHERE id_venta = p_id_venta;

    UPDATE producto SET stock = stock + v_cantidad
    WHERE id_producto = v_id_producto;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_historial_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_historial_cliente`(
    IN p_cedula VARCHAR(20)
)
BEGIN
    SELECT
        v.id_venta,
        v.fecha,
        p.nombre AS producto,
        p.talla,
        dv.cantidad,
        dv.precio_unitario,
        dv.subtotal,
        v.metodo_pago,
        v.estado
    FROM venta v
    INNER JOIN cliente c ON v.id_cliente = c.id_cliente
    INNER JOIN detalle_venta dv ON v.id_venta = dv.id_venta
    INNER JOIN producto p ON dv.id_producto = p.id_producto
    WHERE c.cedula = p_cedula
    ORDER BY v.fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_compra`(
    IN p_id_proveedor INT,
    IN p_id_usuario INT,
    IN p_fecha DATE,
    IN p_id_producto INT,
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(12,2)
)
BEGIN
    DECLARE v_id_compra INT;
    DECLARE v_total DECIMAL(14,2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SET v_total = p_cantidad * p_precio_unitario;

    INSERT INTO compra (id_proveedor, id_usuario, fecha, total, estado)
    VALUES (p_id_proveedor, p_id_usuario, p_fecha, v_total, 'Recibida');

    SET v_id_compra = LAST_INSERT_ID();

    INSERT INTO detalle_compra (id_compra, id_producto, cantidad, precio_unitario)
    VALUES (v_id_compra, p_id_producto, p_cantidad, p_precio_unitario);

    UPDATE producto SET stock = stock + p_cantidad
    WHERE id_producto = p_id_producto;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_venta`(
    IN p_id_cliente INT,
    IN p_id_usuario INT,
    IN p_fecha DATE,
    IN p_metodo_pago VARCHAR(40),
    IN p_id_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_precio DECIMAL(12,2);
    DECLARE v_subtotal DECIMAL(12,2);
    DECLARE v_id_venta INT;
    DECLARE v_stock INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT precio_venta, stock INTO v_precio, v_stock
    FROM producto WHERE id_producto = p_id_producto FOR UPDATE;

    IF v_stock < p_cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta';
    END IF;

    SET v_subtotal = v_precio * p_cantidad;

    INSERT INTO venta (id_cliente, id_usuario, fecha, total, metodo_pago)
    VALUES (p_id_cliente, p_id_usuario, p_fecha, v_subtotal, p_metodo_pago);

    SET v_id_venta = LAST_INSERT_ID();

    INSERT INTO detalle_venta
    (id_venta, id_producto, cantidad, precio_unitario, subtotal)
    VALUES (v_id_venta, p_id_producto, p_cantidad, v_precio, v_subtotal);

    UPDATE producto SET stock = stock - p_cantidad
    WHERE id_producto = p_id_producto;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_reporte_ventas_periodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reporte_ventas_periodo`(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT
        v.id_venta,
        v.fecha,
        CONCAT(c.nombre, ' ', c.apellido) AS cliente,
        p.nombre AS producto,
        dv.cantidad,
        dv.subtotal,
        v.metodo_pago,
        v.estado
    FROM venta v
    INNER JOIN cliente c ON v.id_cliente = c.id_cliente
    INNER JOIN detalle_venta dv ON v.id_venta = dv.id_venta
    INNER JOIN producto p ON dv.id_producto = p.id_producto
    WHERE v.fecha BETWEEN p_fecha_inicio AND p_fecha_fin
    ORDER BY v.fecha DESC;
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

-- Dump completed on 2026-06-03 16:39:53
