-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: clothes_recycle
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cedula` int(15) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `codigo_postal` int(6) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `localidad` varchar(30) NOT NULL,
  `barrio` varchar(30) NOT NULL,
  `factura_cli` int(11) DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `factura_cli` (`factura_cli`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`factura_cli`) REFERENCES `materiaprima` (`factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (123456,'Juan','Rincon Gutierrez','Cra 80 #71-56',154263,'Bogota DC','Usaquen','Cedritos',1),(645198,'Cristiano','Ronaldo aveiro','Cra 21 #78-01',456891,'Bogota DC','Kennedy','Roma',3),(789456,'Lionel','Messi Pescculini','Cra 96 #11-45',235478,'Bogota DC','Engativa','La europa',2);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id_producto` int(30) NOT NULL,
  `costo` int(30) NOT NULL,
  `stock` varchar(10) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `disponibilidad` varchar(30) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,21000,'En descuen',150,'Disponible'),(2,55000,'Sin mercan',0,'No disponible'),(3,110000,'Sin descue',100,'Disponible');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiaprima`
--

DROP TABLE IF EXISTS `materiaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materiaprima` (
  `factura` int(30) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiaprima`
--

LOCK TABLES `materiaprima` WRITE;
/*!40000 ALTER TABLE `materiaprima` DISABLE KEYS */;
INSERT INTO `materiaprima` VALUES (1,'2021-12-01',250,'rojo','algodon'),(2,'2020-08-20',150,'amarillo','poliester'),(3,'2019-02-15',50,'azul','lino');
/*!40000 ALTER TABLE `materiaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id_factura` int(30) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `fecha_venta` date NOT NULL,
  `numero_compra` int(30) NOT NULL,
  `id_producto_disponibilidad` int(11) NOT NULL,
  `id_cedula_cliente` int(11) NOT NULL,
  KEY `id_producto_disponibilidad` (`id_producto_disponibilidad`),
  KEY `id_cedula_cliente` (`id_cedula_cliente`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_producto_disponibilidad`) REFERENCES `empresa` (`id_producto`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_cedula_cliente`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Camiseta tipo polo de algodon','2021-05-16',1,1,123456),(2,'Pantalon licrado negro','2019-07-28',2,2,645198),(3,'Pantalona gris cortavientos','2020-06-17',3,3,789456);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id_entidad` int(30) NOT NULL,
  `sede` varchar(30) NOT NULL,
  `residencia` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(30) NOT NULL,
  `reporte` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`id_entidad`),
  KEY `reporte` (`reporte`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`reporte`) REFERENCES `materiaprima` (`factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Bogota DC','Cra 70a #23-56',2147483647,'correo1@gamil.com','correo1contraseña',1,'usuario1'),(2,'Bogota DC','Cra 65 Bis #21-49',2147483647,'correo2@gamil.com','correo2contraseña',2,'usuario2'),(3,'Bogota DC','Cra 22 #47-12',2147483647,'correo3@gamil.com','correo3contraseña',3,'usuario3');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajadores` (
  `id` int(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `salario` int(10) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `constraseña_trabajador` varchar(50) NOT NULL,
  `usuario_trabajador` varchar(50) NOT NULL,
  `reporte_ventas` int(11) NOT NULL,
  `repote_materiaprima` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reporte_ventas` (`reporte_ventas`),
  KEY `repote_materiaprima` (`repote_materiaprima`),
  CONSTRAINT `trabajadores_ibfk_1` FOREIGN KEY (`reporte_ventas`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `trabajadores_ibfk_2` FOREIGN KEY (`repote_materiaprima`) REFERENCES `materiaprima` (`factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (1,'Neymar','Santos Junior',1200000,'administrador','contratrabajador1','usutrabajador1',1,1),(2,'Frank','Lampard',1250000,'Contador y gestion','contratrabajador2','usutrabajador2',2,2),(3,'Pedri','Gonzales',1250000,'Contador y gestion','contratrabajador3','usutrabajador3',3,3);
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id_venta` int(15) NOT NULL,
  `cantidad_vendidos` int(30) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `id_producto_vendido` int(11) NOT NULL,
  `id_cliente_compra` int(11) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_producto_vendido` (`id_producto_vendido`),
  KEY `id_cliente_compra` (`id_cliente_compra`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_producto_vendido`) REFERENCES `empresa` (`id_producto`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_cliente_compra`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,150,'Camiseta tipo polo de algodon',1,123456),(2,450,'Pantalon licrado negro',2,645198),(3,231,'Pantalona gris cortavientos',3,789456);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-21 21:57:18
