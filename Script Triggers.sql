DELIMITER ;;
CREATE DEFINER=`root`@`localhost` TRIGGER `auditoria_cliente` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
    DECLARE campo_modificado VARCHAR(100);
    
    IF NOT OLD.nombreCliente <=> NEW.nombreCliente THEN
        SET campo_modificado = 'nombreCliente';
        INSERT INTO auditoria_clientes (idCliente, campo_modificado, valor_anterior, valor_nuevo, fecha_cambio)
        VALUES (OLD.idCliente, campo_modificado, OLD.nombreCliente, NEW.nombreCliente, NOW());
    END IF;
    
    IF NOT OLD.apellidoCliente <=> NEW.apellidoCliente THEN
        SET campo_modificado = 'apellidoCliente';
        INSERT INTO auditoria_clientes (idCliente, campo_modificado, valor_anterior, valor_nuevo, fecha_cambio)
        VALUES (OLD.idCliente, campo_modificado, OLD.apellidoCliente, NEW.apellidoCliente, NOW());
    END IF;
    
    IF NOT OLD.emailCliente <=> NEW.emailCliente THEN
        SET campo_modificado = 'emailCliente';
        INSERT INTO auditoria_clientes (idCliente, campo_modificado, valor_anterior, valor_nuevo, fecha_cambio)
        VALUES (OLD.idCliente, campo_modificado, OLD.emailCliente, NEW.emailCliente, NOW());
    END IF;
    
    IF NOT OLD.telefonoCliente <=> NEW.telefonoCliente THEN
        SET campo_modificado = 'telefonoCliente';
        INSERT INTO auditoria_clientes (idCliente, campo_modificado, valor_anterior, valor_nuevo, fecha_cambio)
        VALUES (OLD.idCliente, campo_modificado, OLD.telefonoCliente, NEW.telefonoCliente, NOW());
    END IF;
    
    -- Agregar más condicionales IF para otros campos de la tabla cliente según sea necesario
    
END ;;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` TRIGGER `validar_cupon_factura` BEFORE INSERT ON `factura` FOR EACH ROW BEGIN
    DECLARE cupon_valido INT;
    
    -- Verificar si el cupón está activo y válido
    SELECT COUNT(*)
    INTO cupon_valido
    FROM cupon
    WHERE idCupon = NEW.idCupon AND estadoCupon = 1;
    
    IF cupon_valido = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cupón seleccionado no es válido.';
    END IF;
END ;;

CREATE DEFINER=`root`@`localhost` TRIGGER `evitar_eliminacion_producto` BEFORE DELETE ON `producto` FOR EACH ROW BEGIN
    DECLARE cantidad_facturas INT;
    
    -- Verificar si el producto está asociado a alguna factura
    SELECT COUNT(*)
    INTO cantidad_facturas
    FROM factura_detalle
    WHERE idProducto = OLD.idProducto;
    
    IF cantidad_facturas > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar el producto porque está asociado a facturas existentes.';
    END IF;
END ;;

DELIMITER ;;
 CREATE DEFINER=`root`@`localhost` TRIGGER `actualizar_ultima_compra_cliente` AFTER INSERT ON `factura` FOR EACH ROW BEGIN
    UPDATE cliente
    SET ultimaCompraCliente = NOW()
    WHERE idCliente = NEW.idCliente;
END ;;

