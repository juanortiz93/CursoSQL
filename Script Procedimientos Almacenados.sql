/*!50003 DROP PROCEDURE IF EXISTS `actualizar_estado_cupon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_estado_cupon`(
    IN p_codigoCupon VARCHAR(45),
    IN p_nuevoEstado VARCHAR(45)
)
BEGIN
    UPDATE cupon
    SET estadoCupon = p_nuevoEstado
    WHERE codigoCupon = p_codigoCupon;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_productos_por_nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_productos_por_nombre`(
    IN p_nombreProducto VARCHAR(100)
)
BEGIN
    SELECT idProducto, nombreProducto, precioProducto
    FROM producto
    WHERE nombreProducto LIKE CONCAT('%', p_nombreProducto, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generarFactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generarFactura`(
    IN p_idCliente INT,
    IN p_idMedioDePago INT,
    IN p_idCupon INT
)
BEGIN
    DECLARE totalFactura DOUBLE;
    DECLARE subTotalFactura DOUBLE;
    DECLARE IVAFactura DOUBLE;
    DECLARE porcentajeDescuento INT;
    DECLARE estadoCuponActivo INT;

    -- Obtener el porcentaje de descuento del cupón
    SELECT estadoCupon INTO estadoCuponActivo  FROM cupon WHERE idCupon = p_idCupon;
    IF estadoCuponActivo = 1 THEN
		SELECT porcentajeDescuentoCupon INTO porcentajeDescuento FROM cupon WHERE idCupon = p_idCupon;
	ELSE 
		SELECT porcentajeDescuento = 0;
	end if;

    -- Insertar la factura principal
    INSERT INTO factura (idCliente, fechaFactura, subTotalFactura, IVAFactura, totalFactura, idMedioDePago, idCupon)
    VALUES (p_idCliente, NOW(), 0, 0, 0, p_idMedioDePago, p_idCupon);

    -- Obtener el último id de factura insertado
    SET @last_idFactura = LAST_INSERT_ID();

    -- Insertar los detalles de la factura
    INSERT INTO factura_detalle (idFactura, idProducto, cantidadProducto, valorTotal)
    SELECT 
        @last_idFactura,
        tp.idProducto,
        tp.cantidad,
        ROUND(p.precioProducto * tp.cantidad * (1 - (porcentajeDescuento / 100)), 2) AS valorTotal
    FROM temp_productos tp
    JOIN producto p ON tp.idProducto = p.idProducto;

    -- Calcular el subtotal, IVA y total de la factura
    SELECT 
        ROUND(SUM(fd.valorTotal), 2),
        ROUND(SUM(fd.valorTotal) * 0.19, 2),
        ROUND(SUM(fd.valorTotal) * 1.19, 2)
    INTO 
        subTotalFactura,
        IVAFactura,
        totalFactura
    FROM factura_detalle fd
    WHERE fd.idFactura = @last_idFactura;

    -- Actualizar la factura con los valores calculados
    UPDATE factura
    SET 
        subTotalFactura = subTotalFactura,
        IVAFactura = IVAFactura,
        totalFactura = totalFactura
    WHERE idFactura = @last_idFactura;

    -- Limpiar la tabla temporal
    TRUNCATE TABLE temp_productos;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_clientes_por_ciudad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_clientes_por_ciudad`(
    IN p_idCiudad INT
)
BEGIN
    SELECT idCliente, nombreCliente, apellidoCliente
    FROM cliente c
    JOIN direccion d ON c.idCliente = d.idCliente
    WHERE d.idCiudad = p_idCiudad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_detalle_factura_por_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_detalle_factura_por_id`(
    IN p_idFactura INT
)
BEGIN
    SELECT 
        CONCAT(
            'ID Factura: ', fd.idFactura, '\n',
            'ID Producto: ', p.idProducto, '\n',
            'Nombre Producto: ', p.nombreProducto, '\n',
            'Cantidad: ', fd.cantidadProducto, '\n',
            'Valor Total: ', fd.valorTotal
        ) AS detalle_factura
    FROM factura_detalle fd
    JOIN producto p ON fd.idProducto = p.idProducto
    WHERE fd.idFactura = p_idFactura;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;