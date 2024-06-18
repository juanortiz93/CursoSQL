CREATE DATABASE  IF NOT EXISTS `tecnodomesticos` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tecnodomesticos`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tecnodomesticos
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `auditoria_clientes`
--

DROP TABLE IF EXISTS `auditoria_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_clientes` (
  `idAuditoria` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `campo_modificado` varchar(100) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `valor_anterior` varchar(100) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `valor_nuevo` varchar(100) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `fecha_cambio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAuditoria`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `auditoria_clientes_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `idCiudad` int NOT NULL AUTO_INCREMENT,
  `nombreCiudad` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idDepartamento` int NOT NULL,
  PRIMARY KEY (`idCiudad`),
  UNIQUE KEY `idCiudad_UNIQUE` (`idCiudad`),
  KEY `departamento_idx` (`idDepartamento`),
  CONSTRAINT `departamento` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenas las ciudades colombianas para las direcciones de envio y facturación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `cedulaCliente` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombreCliente` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `apellidoCliente` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `emailCliente` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `telefonoCliente` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `ultimaCompraCliente` datetime DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `idCliente_UNIQUE` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los datos necesarios de los clientes para la facturación de las ventas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cupon`
--

DROP TABLE IF EXISTS `cupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupon` (
  `idCupon` int NOT NULL AUTO_INCREMENT,
  `codigoCupon` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `descripcionCupon` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `porcentajeDescuentoCupon` int NOT NULL,
  `estadoCupon` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idCupon`),
  UNIQUE KEY `idCupon_UNIQUE` (`idCupon`),
  UNIQUE KEY `descripcionCupon_UNIQUE` (`descripcionCupon`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los cupones de descuento que se pueden aplicar en la compra de productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `idDepartamento` int NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  UNIQUE KEY `idDepartamento_UNIQUE` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los departamentos de Colombia para la facturación y envio de los productos comprados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `idDireccion` int NOT NULL AUTO_INCREMENT,
  `descripcionDireccion` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idCiudad` int NOT NULL,
  `idCliente` int NOT NULL,
  `estadoDireccion` int NOT NULL,
  PRIMARY KEY (`idDireccion`),
  UNIQUE KEY `id_direccion_UNIQUE` (`idDireccion`),
  KEY `ciudad_idx` (`idCiudad`),
  KEY `cliente_direccion_idx` (`idCliente`),
  CONSTRAINT `ciudad_direccion` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`),
  CONSTRAINT `cliente_direccion` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar las direcciones de los clientes para la facturación y envio de los productos comprados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idFactura` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `fechaFactura` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL DEFAULT 'now()',
  `subTotalFactura` double DEFAULT NULL,
  `IVAFactura` double DEFAULT NULL,
  `totalFactura` double DEFAULT NULL,
  `idMedioDePago` int NOT NULL,
  `idCupon` int NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `factura_cliente_idx` (`idCliente`),
  KEY `factura_medio_de_pago_idx` (`idMedioDePago`),
  KEY `factura_cupon_idx` (`idCupon`),
  CONSTRAINT `factura_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `factura_cupon` FOREIGN KEY (`idCupon`) REFERENCES `cupon` (`idCupon`),
  CONSTRAINT `factura_medio_de_pago` FOREIGN KEY (`idMedioDePago`) REFERENCES `medios_de_pago` (`idMedioDePago`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los datos de la facturación de cada venta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factura_detalle`
--

DROP TABLE IF EXISTS `factura_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_detalle` (
  `idFacturaDetalle` int NOT NULL AUTO_INCREMENT,
  `idFactura` int NOT NULL,
  `idProducto` int NOT NULL,
  `cantidadProducto` int NOT NULL,
  `valorTotal` double NOT NULL,
  PRIMARY KEY (`idFacturaDetalle`),
  UNIQUE KEY `idFacturaDetalle_UNIQUE` (`idFacturaDetalle`),
  KEY `factura_detalle_idx` (`idFactura`),
  KEY `factura_detalle_producto_idx` (`idProducto`),
  CONSTRAINT `factura_detalle` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`),
  CONSTRAINT `factura_detalle_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los detalles de cada factura, como sus productos y cantidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medios_de_pago`
--

DROP TABLE IF EXISTS `medios_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios_de_pago` (
  `idMedioDePago` int NOT NULL AUTO_INCREMENT,
  `nombreMedioDePago` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idMedioDePago`),
  UNIQUE KEY `idMedioDePago_UNIQUE` (`idMedioDePago`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los medios de pago disponibles para realizar la compra de productos y el descuento que puede tener';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idTipoProducto` int NOT NULL,
  `cantidadProducto` int NOT NULL,
  `precioProducto` double NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `tipoProducto_idx` (`idTipoProducto`),
  CONSTRAINT `tipoProducto` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipo_producto` (`idTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los productos disponibles para la venta\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `idTipoProducto` int NOT NULL AUTO_INCREMENT,
  `nombreTipoProducto` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idTipoProducto`),
  UNIQUE KEY `idTipoProducto_UNIQUE` (`idTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los tipos de producto para catalogarlos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_clientes_compras`
--

DROP TABLE IF EXISTS `v_clientes_compras`;
/*!50001 DROP VIEW IF EXISTS `v_clientes_compras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_clientes_compras` AS SELECT 
 1 AS `idCliente`,
 1 AS `cedulaCliente`,
 1 AS `nombreCliente`,
 1 AS `apellidoCliente`,
 1 AS `emailCliente`,
 1 AS `telefonoCliente`,
 1 AS `idFactura`,
 1 AS `fechaFactura`,
 1 AS `totalFactura`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_clientes_direccion_ciudad`
--

DROP TABLE IF EXISTS `v_clientes_direccion_ciudad`;
/*!50001 DROP VIEW IF EXISTS `v_clientes_direccion_ciudad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_clientes_direccion_ciudad` AS SELECT 
 1 AS `idCliente`,
 1 AS `cedulaCliente`,
 1 AS `nombreCliente`,
 1 AS `apellidoCliente`,
 1 AS `emailCliente`,
 1 AS `telefonoCliente`,
 1 AS `descripcionDireccion`,
 1 AS `nombreCiudad`,
 1 AS `estadoDireccion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_factura_detalle`
--

DROP TABLE IF EXISTS `v_factura_detalle`;
/*!50001 DROP VIEW IF EXISTS `v_factura_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_factura_detalle` AS SELECT 
 1 AS `idFactura`,
 1 AS `idCliente`,
 1 AS `fechaFactura`,
 1 AS `idProducto`,
 1 AS `nombreProducto`,
 1 AS `cantidadProducto`,
 1 AS `valorTotal`,
 1 AS `subTotalFactura`,
 1 AS `IVAFactura`,
 1 AS `totalFactura`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_facturas_con_cupones`
--

DROP TABLE IF EXISTS `v_facturas_con_cupones`;
/*!50001 DROP VIEW IF EXISTS `v_facturas_con_cupones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_facturas_con_cupones` AS SELECT 
 1 AS `idFactura`,
 1 AS `idCliente`,
 1 AS `fechaFactura`,
 1 AS `subTotalFactura`,
 1 AS `IVAFactura`,
 1 AS `totalFactura`,
 1 AS `codigoCupon`,
 1 AS `descripcionCupon`,
 1 AS `porcentajeDescuentoCupon`,
 1 AS `estadoCupon`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_facturas_por_medio_pago`
--

DROP TABLE IF EXISTS `v_facturas_por_medio_pago`;
/*!50001 DROP VIEW IF EXISTS `v_facturas_por_medio_pago`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_facturas_por_medio_pago` AS SELECT 
 1 AS `idMedioDePago`,
 1 AS `nombreMedioDePago`,
 1 AS `totalFacturas`,
 1 AS `totalIngresos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_productos_mas_vendidos`
--

DROP TABLE IF EXISTS `v_productos_mas_vendidos`;
/*!50001 DROP VIEW IF EXISTS `v_productos_mas_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_productos_mas_vendidos` AS SELECT 
 1 AS `idProducto`,
 1 AS `nombreProducto`,
 1 AS `totalCantidadVendida`,
 1 AS `totalValorGenerado`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_clientes_compras`
--

/*!50001 DROP VIEW IF EXISTS `v_clientes_compras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_clientes_compras` AS select `c`.`idCliente` AS `idCliente`,`c`.`cedulaCliente` AS `cedulaCliente`,`c`.`nombreCliente` AS `nombreCliente`,`c`.`apellidoCliente` AS `apellidoCliente`,`c`.`emailCliente` AS `emailCliente`,`c`.`telefonoCliente` AS `telefonoCliente`,`f`.`idFactura` AS `idFactura`,`f`.`fechaFactura` AS `fechaFactura`,`f`.`totalFactura` AS `totalFactura` from (`cliente` `c` join `factura` `f` on((`c`.`idCliente` = `f`.`idCliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_clientes_direccion_ciudad`
--

/*!50001 DROP VIEW IF EXISTS `v_clientes_direccion_ciudad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_clientes_direccion_ciudad` AS select `c`.`idCliente` AS `idCliente`,`c`.`cedulaCliente` AS `cedulaCliente`,`c`.`nombreCliente` AS `nombreCliente`,`c`.`apellidoCliente` AS `apellidoCliente`,`c`.`emailCliente` AS `emailCliente`,`c`.`telefonoCliente` AS `telefonoCliente`,`d`.`descripcionDireccion` AS `descripcionDireccion`,`ciu`.`nombreCiudad` AS `nombreCiudad`,`d`.`estadoDireccion` AS `estadoDireccion` from ((`cliente` `c` join `direccion` `d` on((`c`.`idCliente` = `d`.`idCliente`))) join `ciudad` `ciu` on((`d`.`idCiudad` = `ciu`.`idCiudad`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_factura_detalle`
--

/*!50001 DROP VIEW IF EXISTS `v_factura_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_factura_detalle` AS select `f`.`idFactura` AS `idFactura`,`f`.`idCliente` AS `idCliente`,`f`.`fechaFactura` AS `fechaFactura`,`fd`.`idProducto` AS `idProducto`,`p`.`nombreProducto` AS `nombreProducto`,`fd`.`cantidadProducto` AS `cantidadProducto`,`fd`.`valorTotal` AS `valorTotal`,`f`.`subTotalFactura` AS `subTotalFactura`,`f`.`IVAFactura` AS `IVAFactura`,`f`.`totalFactura` AS `totalFactura` from ((`factura` `f` join `factura_detalle` `fd` on((`f`.`idFactura` = `fd`.`idFactura`))) join `producto` `p` on((`fd`.`idProducto` = `p`.`idProducto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_facturas_con_cupones`
--

/*!50001 DROP VIEW IF EXISTS `v_facturas_con_cupones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_facturas_con_cupones` AS select `f`.`idFactura` AS `idFactura`,`f`.`idCliente` AS `idCliente`,`f`.`fechaFactura` AS `fechaFactura`,`f`.`subTotalFactura` AS `subTotalFactura`,`f`.`IVAFactura` AS `IVAFactura`,`f`.`totalFactura` AS `totalFactura`,`cup`.`codigoCupon` AS `codigoCupon`,`cup`.`descripcionCupon` AS `descripcionCupon`,`cup`.`porcentajeDescuentoCupon` AS `porcentajeDescuentoCupon`,`cup`.`estadoCupon` AS `estadoCupon` from (`factura` `f` join `cupon` `cup` on((`f`.`idCupon` = `cup`.`idCupon`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_facturas_por_medio_pago`
--

/*!50001 DROP VIEW IF EXISTS `v_facturas_por_medio_pago`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_facturas_por_medio_pago` AS select `mp`.`idMedioDePago` AS `idMedioDePago`,`mp`.`nombreMedioDePago` AS `nombreMedioDePago`,count(`f`.`idFactura`) AS `totalFacturas`,sum(`f`.`totalFactura`) AS `totalIngresos` from (`factura` `f` join `medios_de_pago` `mp` on((`f`.`idMedioDePago` = `mp`.`idMedioDePago`))) group by `mp`.`idMedioDePago`,`mp`.`nombreMedioDePago` order by `totalFacturas` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_productos_mas_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `v_productos_mas_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_productos_mas_vendidos` AS select `p`.`idProducto` AS `idProducto`,`p`.`nombreProducto` AS `nombreProducto`,sum(`fd`.`cantidadProducto`) AS `totalCantidadVendida`,sum(`fd`.`valorTotal`) AS `totalValorGenerado` from (`producto` `p` join `factura_detalle` `fd` on((`p`.`idProducto` = `fd`.`idProducto`))) group by `p`.`idProducto`,`p`.`nombreProducto` order by `totalCantidadVendida` desc */;
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

-- Dump completed on 2024-06-17 20:59:27
