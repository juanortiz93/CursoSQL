-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tecnodomesticos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tecnodomesticos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tecnodomesticos` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci ;
USE `tecnodomesticos` ;

-- -----------------------------------------------------
-- Table `tecnodomesticos`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tecnodomesticos`.`departamento` (
  `idDepartamento` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  UNIQUE INDEX `idDepartamento_UNIQUE` (`idDepartamento` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci
COMMENT = 'Tabla para almacenar los departamentos de Colombia para la facturación y envio de los productos comprados';


-- -----------------------------------------------------
-- Table `tecnodomesticos`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tecnodomesticos`.`ciudad` (
  `idCiudad` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreCiudad` VARCHAR(45) NOT NULL,
  `idDepartamento` INT(11) NOT NULL,
  PRIMARY KEY (`idCiudad`),
  UNIQUE INDEX `idCiudad_UNIQUE` (`idCiudad` ASC) VISIBLE,
  INDEX `departamento_idx` (`idDepartamento` ASC) VISIBLE,
  CONSTRAINT `departamento`
    FOREIGN KEY (`idDepartamento`)
    REFERENCES `tecnodomesticos`.`departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci
COMMENT = 'Tabla para almacenas las ciudades colombianas para las direcciones de envio y facturación';


-- -----------------------------------------------------
-- Table `tecnodomesticos`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tecnodomesticos`.`cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `cedulaCliente` VARCHAR(45) NOT NULL,
  `nombreCliente` VARCHAR(45) NOT NULL,
  `apellidoCliente` VARCHAR(45) NOT NULL,
  `emailCliente` VARCHAR(45) NOT NULL,
  `telefonoCliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci
COMMENT = 'Tabla para almacenar los datos necesarios de los clientes para la facturación de las ventas';


-- -----------------------------------------------------
-- Table `tecnodomesticos`.`cupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tecnodomesticos`.`cupon` (
  `idCupon` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcionCupon` VARCHAR(45) NOT NULL,
  `porcentajeDescuentoCupon` INT(11) NOT NULL,
  PRIMARY KEY (`idCupon`),
  UNIQUE INDEX `idCupon_UNIQUE` (`idCupon` ASC) VISIBLE,
  UNIQUE INDEX `descripcionCupon_UNIQUE` (`descripcionCupon` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci
COMMENT = 'Tabla para almacenar los cupones de descuento que se pueden aplicar en la compra de productos';


-- -----------------------------------------------------
-- Table `tecnodomesticos`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tecnodomesticos`.`direccion` (
  `idDireccion` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcionDireccion` VARCHAR(45) NOT NULL,
  `idCiudad` INT(11) NOT NULL,
  `idCliente` INT(11) NOT NULL,
  `estadoDireccion` INT(11) NOT NULL,
  PRIMARY KEY (`idDireccion`),
  UNIQUE INDEX `id_direccion_UNIQUE` (`idDireccion` ASC) VISIBLE,
  INDEX `ciudad_idx` (`idCiudad` ASC) VISIBLE,
  INDEX `cliente_direccion_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `ciudad_direccion`
    FOREIGN KEY (`idCiudad`)
    REFERENCES `tecnodomesticos`.`ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cliente_direccion`
    FOREIGN KEY (`idCliente`)
    REFERENCES `tecnodomesticos`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci
COMMENT = 'Tabla para almacenar las direcciones de los clientes para la facturación y envio de los productos comprados';


-- -----------------------------------------------------
-- Table `tecnodomesticos`.`medios_de_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tecnodomesticos`.`medios_de_pago` (
  `idMedioDePago` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreMedioDePago` VARCHAR(45) NOT NULL,
  `descuentoMedioDePago` INT(11) NOT NULL,
  PRIMARY KEY (`idMedioDePago`),
  UNIQUE INDEX `idMedioDePago_UNIQUE` (`idMedioDePago` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci
COMMENT = 'Tabla para almacenar los medios de pago disponibles para realizar la compra de productos y el descuento que puede tener';


-- -----------------------------------------------------
-- Table `tecnodomesticos`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tecnodomesticos`.`factura` (
  `idFactura` INT(11) NOT NULL AUTO_INCREMENT,
  `idCliente` INT(11) NOT NULL,
  `fechaFactura` VARCHAR(45) NOT NULL DEFAULT 'now()',
  `subTotalFactura` DOUBLE NOT NULL,
  `IVAFactura` DOUBLE NOT NULL,
  `totalFactura` DOUBLE NOT NULL,
  `idMedioDePago` INT(11) NOT NULL,
  `idCupon` INT(11) NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `factura_cliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `factura_medio_de_pago_idx` (`idMedioDePago` ASC) VISIBLE,
  INDEX `factura_cupon_idx` (`idCupon` ASC) VISIBLE,
  CONSTRAINT `factura_cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `tecnodomesticos`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `factura_cupon`
    FOREIGN KEY (`idCupon`)
    REFERENCES `tecnodomesticos`.`cupon` (`idCupon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `factura_medio_de_pago`
    FOREIGN KEY (`idMedioDePago`)
    REFERENCES `tecnodomesticos`.`medios_de_pago` (`idMedioDePago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci
COMMENT = 'Tabla para almacenar los datos de la facturación de cada venta';


-- -----------------------------------------------------
-- Table `tecnodomesticos`.`tipo_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tecnodomesticos`.`tipo_producto` (
  `idTipoProducto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoProducto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoProducto`),
  UNIQUE INDEX `idTipoProducto_UNIQUE` (`idTipoProducto` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci
COMMENT = 'Tabla para almacenar los tipos de producto para catalogarlos';


-- -----------------------------------------------------
-- Table `tecnodomesticos`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tecnodomesticos`.`producto` (
  `idProducto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `idTipoProducto` INT(11) NOT NULL,
  `cantidadProducto` INT(11) NOT NULL,
  `precioProducto` DOUBLE NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `tipoProducto_idx` (`idTipoProducto` ASC) VISIBLE,
  CONSTRAINT `tipoProducto`
    FOREIGN KEY (`idTipoProducto`)
    REFERENCES `tecnodomesticos`.`tipo_producto` (`idTipoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci
COMMENT = 'Tabla para almacenar los productos disponibles para la venta\\n';


-- -----------------------------------------------------
-- Table `tecnodomesticos`.`factura_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tecnodomesticos`.`factura_detalle` (
  `idFacturaDetalle` INT(11) NOT NULL AUTO_INCREMENT,
  `idFactura` INT(11) NOT NULL,
  `idProducto` INT(11) NOT NULL,
  `cantidadProducto` INT(11) NOT NULL,
  `valorTotal` DOUBLE NOT NULL,
  PRIMARY KEY (`idFacturaDetalle`),
  UNIQUE INDEX `idFacturaDetalle_UNIQUE` (`idFacturaDetalle` ASC) VISIBLE,
  INDEX `factura_detalle_idx` (`idFactura` ASC) VISIBLE,
  INDEX `factura_detalle_producto_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `factura_detalle`
    FOREIGN KEY (`idFactura`)
    REFERENCES `tecnodomesticos`.`factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `factura_detalle_producto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `tecnodomesticos`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci
COMMENT = 'Tabla para almacenar los detalles de cada factura, como sus productos y cantidades';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
