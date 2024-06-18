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

/*!50001 DROP VIEW IF EXISTS `v_facturas_por_medio_pago`
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