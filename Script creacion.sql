CREATE DATABASE  IF NOT EXISTS `tecnodomesticos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tecnodomesticos`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tecnodomesticos
-- ------------------------------------------------------
-- Server version	8.0.38

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
  `campo_modificado` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `valor_anterior` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `valor_nuevo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `fecha_cambio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAuditoria`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `auditoria_clientes_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_clientes`
--

LOCK TABLES `auditoria_clientes` WRITE;
/*!40000 ALTER TABLE `auditoria_clientes` DISABLE KEYS */;
INSERT INTO `auditoria_clientes` VALUES (1,128,'nombreCliente','Alexandra','Juan','2024-06-17 20:15:44'),(2,128,'apellidoCliente','Zapata','Ortiz','2024-06-17 20:15:44'),(24,125,'telefonoCliente','34497243607','3123550095','2024-06-17 20:32:13');
/*!40000 ALTER TABLE `auditoria_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `idCiudad` int NOT NULL AUTO_INCREMENT,
  `nombreCiudad` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idDepartamento` int NOT NULL,
  `latitud` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `longitud` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idCiudad`),
  UNIQUE KEY `idCiudad_UNIQUE` (`idCiudad`),
  KEY `departamento_idx` (`idDepartamento`),
  CONSTRAINT `departamento` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenas las ciudades colombianas para las direcciones de envio y facturación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Leticia',1,'-4.215','-69.9406'),(2,'Puerto Nariño',1,'-3.7706','-70.3569'),(3,'Medellín',2,'6.2442','-75.5812'),(4,'Bello',2,'6.3373','-75.5575'),(5,'Itagüí',2,'6.1846','-75.5991'),(6,'Envigado',2,'6.1735','-75.5917'),(7,'Apartadó',2,'7.8833','-76.625'),(8,'Turbo',2,'8.0947','-76.7284'),(9,'Rionegro',2,'6.1552','-75.375'),(10,'Caucasia',2,'7.9868','-75.1936'),(11,'Arauca',3,'7.0847','-70.7591'),(12,'Arauquita',3,'7.0281','-71.4283'),(13,'Saravena',3,'6.9511','-71.8806'),(14,'Tame',3,'6.4603','-71.7362'),(15,'Barranquilla',4,'10.9639','-74.7964'),(16,'Soledad',4,'10.9184','-74.7646'),(17,'Malambo',4,'10.859','-74.7739'),(18,'Puerto Colombia',4,'10.9878','-74.9545'),(19,'Galapa',4,'10.896','-74.8834'),(20,'Sabanalarga',4,'10.6295','-74.9221'),(21,'Cartagena',5,'10.391','-75.4794'),(22,'Magangué',5,'9.242','-74.7546'),(23,'Turbaco',5,'10.3295','-75.4111'),(24,'Arjona',5,'10.2508','-75.3436'),(25,'Mompox',5,'9.2417','-74.4269'),(26,'Tunja',6,'5.5353','-73.3678'),(27,'Duitama',6,'5.8269','-73.0342'),(28,'Sogamoso',6,'5.7204','-72.9245'),(29,'Chiquinquirá',6,'5.6181','-73.8188'),(30,'Moniquirá',6,'5.875','-73.572'),(31,'Manizales',7,'5.07','-75.5133'),(32,'Villamaría',7,'5.0447','-75.514'),(33,'Chinchiná',7,'4.9826','-75.6039'),(34,'La Dorada',7,'5.4494','-74.6658'),(35,'Riosucio',7,'5.4215','-75.7028'),(36,'Florencia',8,'1.6153','-75.6062'),(37,'San Vicente del Caguán',8,'2.1131','-74.7756'),(38,'Puerto Rico',8,'1.909','-75.1453'),(39,'El Doncello',8,'1.6781','-75.2806'),(40,'Cartagena del Chairá',8,'1.3343','-74.8447'),(41,'Yopal',9,'5.3471','-72.4066'),(42,'Aguazul',9,'5.1812','-72.5535'),(43,'Villanueva',9,'4.6144','-72.9273'),(44,'Tauramena',9,'4.9041','-72.8334'),(45,'Monterrey',9,'4.957','-72.902'),(46,'Popayán',10,'2.4448','-76.6147'),(47,'Santander de Quilichao',10,'3.0074','-76.4843'),(48,'Puerto Tejada',10,'3.2308','-76.4122'),(49,'Guapi',10,'2.5695','-77.8993'),(50,'Piendamó',10,'2.6412','-76.6402'),(51,'Valledupar',11,'10.4631','-73.2532'),(52,'Aguachica',11,'8.3115','-73.6012'),(53,'Bosconia',11,'9.9747','-73.8908'),(54,'Curumaní',11,'9.1998','-73.5448'),(55,'El Copey',11,'10.1496','-73.9652'),(56,'Quibdó',12,'5.6944','-76.6611'),(57,'Istmina',12,'5.1574','-76.6838'),(58,'Tadó',12,'5.2667','-76.5597'),(59,'Condoto',12,'5.0969','-76.6489'),(60,'Riosucio',12,'5.4074','-76.9499'),(61,'Montería',13,'8.7575','-75.8896'),(62,'Lorica',13,'9.2373','-75.8158'),(63,'Sahagún',13,'8.9463','-75.4424'),(64,'Cereté',13,'8.8844','-75.7911'),(65,'Montelíbano',13,'7.9797','-75.4187'),(66,'Bogotá',14,'4.711','-74.0721'),(67,'Soacha',14,'4.579','-74.2168'),(68,'Girardot',14,'4.3066','-74.8039'),(69,'Facatativá',14,'4.8139','-74.3542'),(70,'Zipaquirá',14,'5.0226','-73.9749'),(71,'Inírida',15,'3.8655','-67.923'),(72,'San José del Guaviare',16,'2.5706','-72.6369'),(73,'Neiva',17,'2.9345','-75.2809'),(74,'Pitalito',17,'1.8532','-76.0491'),(75,'Garzón',17,'2.1957','-75.6312'),(76,'La Plata',17,'2.3933','-75.8916'),(77,'Villavieja',17,'3.2195','-75.2177'),(78,'Riohacha',18,'11.5444','-72.907'),(79,'Maicao',18,'11.3843','-72.242'),(80,'Uribia',18,'11.5265','-72.2653'),(81,'Manaure',18,'11.7757','-72.4449'),(82,'Santa Marta',19,'11.2418','-74.199'),(83,'Ciénaga',19,'11.0079','-74.247'),(84,'Fundación',19,'10.5205','-73.769'),(85,'Aracataca',19,'10.5911','-74.2244'),(86,'El Banco',19,'9.0023','-73.975'),(87,'Villavicencio',20,'4.142','-73.6266'),(88,'Acacías',20,'3.9861','-73.757'),(89,'Granada',20,'3.5369','-73.7063'),(90,'San Martín',20,'3.6965','-73.699'),(91,'Pasto',21,'1.2078','-77.2772'),(92,'Ipiales',21,'0.8303','-77.6494'),(93,'Tumaco',21,'1.7975','-78.7763'),(94,'Túquerres',21,'1.0865','-77.6186'),(95,'Ocaña',22,'8.2361','-73.3578'),(96,'Cúcuta',22,'7.8939','-72.5078'),(97,'Pamplona',22,'7.3772','-72.6526'),(98,'Villa del Rosario',22,'7.8345','-72.4745'),(99,'San Gil',27,'6.5533','-73.1313'),(100,'Barrancabermeja',27,'7.0653','-73.854'),(101,'Bucaramanga',27,'7.1254','-73.1198'),(102,'Floridablanca',27,'7.0622','-73.0905'),(103,'Ciénaga de Oro',13,'8.8761','-75.6259'),(104,'El Carmen de Bolívar',5,'9.7178','-75.1254'),(105,'Tuluá',30,'4.0847','-76.1954'),(106,'Buenaventura',30,'3.8933','-77.0702');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `cedulaCliente` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nombreCliente` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `apellidoCliente` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `emailCliente` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `telefonoCliente` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `ultimaCompraCliente` datetime DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `idCliente_UNIQUE` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los datos necesarios de los clientes para la facturación de las ventas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'30896525842','Juan','Gomez','Juan.Gomez@universidad.edu.co','37731642851',NULL),(2,'30188176388','Carlos','Rodriguez','Carlos.Rodriguez@outlook.es','35424164454',NULL),(3,'30847914910','Maria','Martinez','Maria.Martinez@outlook.es','35178815382',NULL),(4,'30752431978','Luis','Hernandez','Luis.Hernandez@yahoo.com','37852806316',NULL),(5,'30300857267','Andres','Perez','Andres.Perez@outlook.com','38396505972',NULL),(6,'30752919595','Sofia','Gonzalez','Sofia.Gonzalez@yahoo.com','39694723253',NULL),(7,'30110423009','Ana','Ramirez','Ana.Ramirez@outlook.es','38872215020',NULL),(8,'30505013241','Pedro','Torres','Pedro.Torres@universidad.edu.co','38019689757',NULL),(9,'30419639707','Laura','Flores','Laura.Flores@outlook.es','32025391023',NULL),(10,'30935820626','Daniel','Diaz','Daniel.Diaz@gmail.com','35499674422',NULL),(11,'30535379666','Felipe','Vargas','Felipe.Vargas@gmail.com','35288412119',NULL),(12,'30563217982','Manuel','Castro','Manuel.Castro@yahoo.com','34581776144',NULL),(13,'30602189184','Juliana','Rojas','Juliana.Rojas@outlook.es','33754980316',NULL),(14,'30968250855','Diego','Alvarez','Diego.Alvarez@hotmail.co','36690485371',NULL),(15,'30200962072','Valentina','Ortiz','Valentina.Ortiz@empresa.com.co','33854377198',NULL),(16,'30934194286','David','Jimenez','David.Jimenez@hotmail.es','37707086845',NULL),(17,'30309568546','Camila','Sanchez','Camila.Sanchez@yahoo.com','32498779289',NULL),(18,'30542239553','Santiago','Rivera','Santiago.Rivera@empresa.com.co','31811014331',NULL),(19,'30020815158','Paula','Cruz','Paula.Cruz@hotmail.es','37414121690',NULL),(20,'30024746308','Alejandro','Ruiz','Alejandro.Ruiz@universidad.edu.co','34232364272',NULL),(21,'30417696974','Mateo','Moreno','Mateo.Moreno@universidad.edu.co','38407872168',NULL),(22,'30747609249','Natalia','Alonso','Natalia.Alonso@yahoo.com','38355954110',NULL),(23,'30530923209','Andrea','Alvarez','Andrea.Alvarez@outlook.com','31463796302',NULL),(24,'30288408644','Adriana','Blanco','Adriana.Blanco@gmail.com','31492959159',NULL),(25,'30737766518','Gabriel','Camacho','Gabriel.Camacho@yahoo.com','39914248613',NULL),(26,'30234289705','Mariana','Castillo','Mariana.Castillo@outlook.com','32830007749',NULL),(27,'30823481989','Cristian','De la Cruz','Cristian.De la Cruz@yahoo.com','38715923371',NULL),(28,'30552738750','Sara','Estrada','Sara.Estrada@outlook.com','30863676463',NULL),(29,'30985087941','Jorge','Fernandez','Jorge.Fernandez@outlook.es','33764202002',NULL),(30,'30883090635','Javier','Garcia','Javier.Garcia@yahoo.com','37816911654',NULL),(31,'30049878032','Daniela','Herrera','Daniela.Herrera@empresa.com.co','33719494271',NULL),(32,'30146797069','Antonio','Iglesias','Antonio.Iglesias@outlook.es','36502943054',NULL),(33,'30397060267','Valeria','Juarez','Valeria.Juarez@gmail.com','39809114988',NULL),(34,'30801302161','Ricardo','Lopez','Ricardo.Lopez@gmail.com','39149752612',NULL),(35,'30383547307','Fernanda','Mendoza','Fernanda.Mendoza@outlook.com','37134120275',NULL),(36,'30048627817','Eduardo','Nunez','Eduardo.Nunez@outlook.com','33686317478',NULL),(37,'30534449669','Alejandra','Olivares','Alejandra.Olivares@hotmail.es','32284166861',NULL),(38,'30443024063','Isabella','Paz','Isabella.Paz@hotmail.es','33202792977',NULL),(39,'30011785644','Esteban','Quintero','Esteban.Quintero@gmail.com','34550948892',NULL),(40,'30981203402','Vanessa','Rodriguez','Vanessa.Rodriguez@hotmail.es','37600516982',NULL),(41,'30178061396','Juanita','Santos','Juanita.Santos@outlook.es','35165754449',NULL),(42,'30752421492','Catalina','Torres','Catalina.Torres@yahoo.com','38046413444',NULL),(43,'30386063278','Julio','Urena','Julio.Urena@hotmail.es','34237721361',NULL),(44,'30569683547','Cesar','Vega','Cesar.Vega@hotmail.es','31764561908',NULL),(45,'30150976902','Monica','Wong','Monica.Wong@yahoo.com','36746491870',NULL),(46,'30696698046','Carlos','Xiong','Carlos.Xiong@icloud.com','32076194111',NULL),(47,'30659468973','Alberto','Yanez','Alberto.Yanez@outlook.es','33940264381','2024-06-17 20:24:13'),(48,'30946672224','Victoria','Zambrano','Victoria.Zambrano@hotmail.es','39163925488',NULL),(49,'30928117260','Roberto','Aguilar','Roberto.Aguilar@universidad.edu.co','36726916773',NULL),(50,'30689232361','Juan','Benitez','Juan.Benitez@icloud.com','30727369702',NULL),(51,'30079424467','Pablo','Cortes','Pablo.Cortes@outlook.com','36562839258',NULL),(52,'30744685280','Carolina','Dominguez','Carolina.Dominguez@hotmail.co','35388174741',NULL),(53,'30430363430','Luisa','Escobar','Luisa.Escobar@hotmail.es','33857335340',NULL),(54,'30322573424','Miguel','Flores','Miguel.Flores@icloud.com','33106125158',NULL),(55,'30186062954','Alexandra','Gomez','Alexandra.Gomez@empresa.com.co','34341974467',NULL),(56,'30175555496','Juan','Hernandez','Juan.Hernandez@hotmail.es','33492594094',NULL),(57,'30020741556','Carlos','Ibarra','Carlos.Ibarra@gmail.com','32174232920','2024-06-17 20:24:10'),(58,'30919327732','Maria','Juarez','Maria.Juarez@empresa.com.co','39638609094',NULL),(59,'30986198132','Luis','Kim','Luis.Kim@gmail.com','32384454656',NULL),(60,'30074003459','Andres','Lopez','Andres.Lopez@outlook.es','30513942977',NULL),(61,'30292928733','Sofia','Morales','Sofia.Morales@hotmail.com','36735178480',NULL),(62,'30436206860','Ana','Nunez','Ana.Nunez@outlook.com','34937834027',NULL),(63,'30987474671','Pedro','Ortiz','Pedro.Ortiz@icloud.com','33176919178',NULL),(64,'30220390078','Laura','Perez','Laura.Perez@outlook.com','30832031509',NULL),(65,'30969391771','Daniel','Quevedo','Daniel.Quevedo@hotmail.es','30785718942',NULL),(66,'30600811195','Felipe','Ramirez','Felipe.Ramirez@hotmail.co','30392680643',NULL),(67,'30891319380','Manuel','Sanchez','Manuel.Sanchez@hotmail.com','30200056005',NULL),(68,'30083649805','Juliana','Torres','Juliana.Torres@hotmail.com','35402119043',NULL),(69,'30626362777','Diego','Uribe','Diego.Uribe@hotmail.es','36768027326',NULL),(70,'30850479072','Valentina','Vasquez','Valentina.Vasquez@yahoo.com','35584987947',NULL),(71,'30126532415','David','Wu','David.Wu@empresa.com.co','34062313944',NULL),(72,'30159659837','Camila','Xu','Camila.Xu@hotmail.es','34190456936',NULL),(73,'30356413393','Santiago','Yang','Santiago.Yang@hotmail.es','35554094394','2024-06-17 20:24:14'),(74,'30202257474','Paula','Zapata','Paula.Zapata@hotmail.com','31185230241',NULL),(75,'30557437901','Alejandro','Zapata','Alejandro.Zapata@icloud.com','34857886643',NULL),(76,'30134081948','Mateo','Zapata','Mateo.Zapata@yahoo.com','36629730906',NULL),(77,'30675734140','Natalia','Zapata','Natalia.Zapata@hotmail.com','39215549173',NULL),(78,'30438520232','Andrea','Zapata','Andrea.Zapata@icloud.com','38241215411',NULL),(79,'30836798411','Adriana','Zapata','Adriana.Zapata@hotmail.co','30477421228',NULL),(80,'30103828248','Gabriel','Zapata','Gabriel.Zapata@hotmail.com','35680898125',NULL),(81,'30712704376','Mariana','Zapata','Mariana.Zapata@universidad.edu.co','31581492891',NULL),(82,'30212989042','Cristian','Zapata','Cristian.Zapata@hotmail.es','33135197873',NULL),(83,'30796106836','Sara','Zapata','Sara.Zapata@gmail.com','38115537788',NULL),(84,'30937844370','Jorge','Zapata','Jorge.Zapata@yahoo.com','34592696507',NULL),(85,'30532666645','Javier','Zapata','Javier.Zapata@yahoo.com','38296216249',NULL),(86,'30291535237','Daniela','Zapata','Daniela.Zapata@empresa.com.co','39694510269',NULL),(87,'30940821140','Antonio','Zapata','Antonio.Zapata@hotmail.co','31562998808',NULL),(88,'30394241471','Valeria','Zapata','Valeria.Zapata@hotmail.es','33288143382',NULL),(89,'30137148489','Ricardo','Zapata','Ricardo.Zapata@outlook.es','30850518765',NULL),(90,'30327361025','Fernanda','Zapata','Fernanda.Zapata@hotmail.com','39261645906',NULL),(91,'30485874402','Eduardo','Zapata','Eduardo.Zapata@outlook.es','37967681854',NULL),(92,'30031206140','Alejandra','Zapata','Alejandra.Zapata@hotmail.co','37350124891','2024-06-17 20:21:43'),(93,'30377883948','Isabella','Zapata','Isabella.Zapata@outlook.es','32882597197',NULL),(94,'30388151708','Esteban','Zapata','Esteban.Zapata@gmail.com','32154419731',NULL),(95,'30849271655','Vanessa','Zapata','Vanessa.Zapata@outlook.es','34523470163',NULL),(96,'30461637940','Juanita','Zapata','Juanita.Zapata@empresa.com.co','33708296337',NULL),(97,'30000702144','Catalina','Zapata','Catalina.Zapata@universidad.edu.co','34530028583',NULL),(98,'30591948765','Julio','Zapata','Julio.Zapata@outlook.es','32278301578',NULL),(99,'30336944965','Cesar','Zapata','Cesar.Zapata@gmail.com','39953370476',NULL),(100,'30972982121','Monica','Zapata','Monica.Zapata@universidad.edu.co','34755511455',NULL),(101,'30741057270','Carlos','Zapata','Carlos.Zapata@yahoo.com','31699929602',NULL),(102,'30014065986','Alberto','Zapata','Alberto.Zapata@hotmail.es','37595574844','2024-06-17 20:24:14'),(103,'30116734204','Victoria','Zapata','Victoria.Zapata@hotmail.com','31747904263',NULL),(104,'30958956356','Roberto','Zapata','Roberto.Zapata@yahoo.com','34751836242',NULL),(105,'30564686555','Juan','Zapata','Juan.Zapata@hotmail.com','32953500303',NULL),(106,'30283104383','Pablo','Zapata','Pablo.Zapata@hotmail.es','37980461696','2024-06-17 20:24:15'),(107,'30401815304','Carolina','Zapata','Carolina.Zapata@outlook.es','38692443481',NULL),(108,'30501407632','Luisa','Zapata','Luisa.Zapata@universidad.edu.co','39923028694',NULL),(109,'30263598936','Miguel','Zapata','Miguel.Zapata@hotmail.com','39146337536',NULL),(110,'30549910478','Alexandra','Zapata','Alexandra.Zapata@gmail.com','33785244136',NULL),(111,'30875668607','Alexandra','Zapata','Alexandra.Zapata@yahoo.com','35868433449',NULL),(112,'30205907273','Alexandra','Zapata','Alexandra.Zapata@yahoo.com','37273100230',NULL),(113,'30829531058','Alexandra','Zapata','Alexandra.Zapata@empresa.com.co','33400331263',NULL),(114,'30802989899','Alexandra','Zapata','Alexandra.Zapata@empresa.com.co','35652810871',NULL),(115,'30841855012','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','30415941561',NULL),(116,'30667675313','Alexandra','Zapata','Alexandra.Zapata@yahoo.com','30649447339',NULL),(117,'30683941314','Alexandra','Zapata','Alexandra.Zapata@yahoo.com','30725380974',NULL),(118,'30688073311','Alexandra','Zapata','Alexandra.Zapata@yahoo.com','30495415786',NULL),(119,'30579451034','Alexandra','Zapata','Alexandra.Zapata@hotmail.co','30047992607',NULL),(120,'30778104934','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','30463198349',NULL),(121,'30603218440','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','35760083520',NULL),(122,'30248643605','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','38300342195',NULL),(123,'30604592125','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','38505136527',NULL),(124,'30653994295','Alexandra','Zapata','Alexandra.Zapata@hotmail.co','36301698923',NULL),(125,'30995557843','Carlos','Alvarez','carlosalvarez@gmail.com','3123550095',NULL),(126,'30986783117','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','39633633680',NULL),(127,'30062589256','Alexandra','Zapata','Alexandra.Zapata@icloud.com','39265132992',NULL),(128,'30363997904','Juan','Ortiz','juan.ortiz@gmail.com','31102546035',NULL),(129,'30429924075','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','38045108009',NULL),(130,'30565984236','Alexandra','Zapata','Alexandra.Zapata@icloud.com','33839913759',NULL),(131,'30670790477','Alexandra','Zapata','Alexandra.Zapata@yahoo.com','39975200472',NULL),(132,'30381665397','Alexandra','Zapata','Alexandra.Zapata@empresa.com.co','34338382272',NULL),(133,'30421890532','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','37740185016',NULL),(134,'30446278497','Alexandra','Zapata','Alexandra.Zapata@empresa.com.co','32078495949',NULL),(135,'30311236972','Alexandra','Zapata','Alexandra.Zapata@empresa.com.co','37294696501',NULL),(136,'30849439959','Alexandra','Zapata','Alexandra.Zapata@gmail.com','37456345481',NULL),(137,'30551800133','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','39550848938',NULL),(138,'30209133342','Alexandra','Zapata','Alexandra.Zapata@outlook.com','32746603035',NULL),(139,'30832065368','Alexandra','Zapata','Alexandra.Zapata@hotmail.com','31855337463',NULL),(140,'30918630869','Alexandra','Zapata','Alexandra.Zapata@gmail.com','34268731087',NULL),(141,'30024706163','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','31404391491',NULL),(142,'30173461211','Alexandra','Zapata','Alexandra.Zapata@icloud.com','37095595912',NULL),(143,'30209832070','Alexandra','Zapata','Alexandra.Zapata@empresa.com.co','39729118691',NULL),(144,'30103114546','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','36748421673',NULL),(145,'30583699402','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','37187545185',NULL),(146,'30911861007','Alexandra','Zapata','Alexandra.Zapata@icloud.com','32796245611',NULL),(147,'30188998305','Alexandra','Zapata','Alexandra.Zapata@outlook.com','39635944869',NULL),(148,'30499618841','Alexandra','Zapata','Alexandra.Zapata@outlook.es','35376974004',NULL),(149,'30866554695','Alexandra','Zapata','Alexandra.Zapata@hotmail.co','39987424891',NULL),(150,'30834668548','Alexandra','Zapata','Alexandra.Zapata@outlook.com','33815709169',NULL),(151,'30376508696','Alexandra','Zapata','Alexandra.Zapata@hotmail.co','35596277495',NULL),(152,'30584646493','Alexandra','Zapata','Alexandra.Zapata@yahoo.com','34678068034',NULL),(153,'30605986295','Alexandra','Zapata','Alexandra.Zapata@outlook.es','33145966402',NULL),(154,'30693449933','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','35369491228',NULL),(155,'30114366308','Alexandra','Zapata','Alexandra.Zapata@empresa.com.co','34618221376',NULL),(156,'30426158098','Alexandra','Zapata','Alexandra.Zapata@hotmail.co','34481462952',NULL),(157,'30004759170','Alexandra','Zapata','Alexandra.Zapata@outlook.es','33825074987',NULL),(158,'30874466537','Alexandra','Zapata','Alexandra.Zapata@yahoo.com','35006515257',NULL),(159,'30828826995','Alexandra','Zapata','Alexandra.Zapata@outlook.es','37244211963',NULL),(160,'30695564721','Alexandra','Zapata','Alexandra.Zapata@hotmail.com','34361061103',NULL),(161,'30266850436','Alexandra','Zapata','Alexandra.Zapata@gmail.com','33291181282',NULL),(162,'30567789027','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','35545868767',NULL),(163,'30218162056','Alexandra','Zapata','Alexandra.Zapata@icloud.com','34807622716',NULL),(164,'30122662343','Alexandra','Zapata','Alexandra.Zapata@outlook.com','34871376599',NULL),(165,'30922613535','Alexandra','Zapata','Alexandra.Zapata@outlook.com','39904330558',NULL),(166,'30497201132','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','30819292525',NULL),(167,'30865526722','Alexandra','Zapata','Alexandra.Zapata@gmail.com','38126492936',NULL),(168,'30817708840','Alexandra','Zapata','Alexandra.Zapata@outlook.es','37998552693',NULL),(169,'30047487321','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','30468922146',NULL),(170,'30720848615','Alexandra','Zapata','Alexandra.Zapata@icloud.com','31552864957',NULL),(171,'30385733123','Alexandra','Zapata','Alexandra.Zapata@icloud.com','31568314611',NULL),(172,'30395738856','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','33537831058',NULL),(173,'30244315773','Alexandra','Zapata','Alexandra.Zapata@outlook.com','30682006134',NULL),(174,'30860314356','Alexandra','Zapata','Alexandra.Zapata@gmail.com','39039068155',NULL),(175,'30228624196','Alexandra','Zapata','Alexandra.Zapata@icloud.com','34711302830',NULL),(176,'30061449740','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','32849402216',NULL),(177,'30743127492','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','30747016845',NULL),(178,'30791057975','Alexandra','Zapata','Alexandra.Zapata@hotmail.co','32827503823','2024-06-17 20:23:48'),(179,'30220197375','Alexandra','Zapata','Alexandra.Zapata@yahoo.com','36030867021',NULL),(180,'30257226263','Alexandra','Zapata','Alexandra.Zapata@icloud.com','36126774471',NULL),(181,'30632773542','Alexandra','Zapata','Alexandra.Zapata@hotmail.com','37308564109',NULL),(182,'30676775880','Alexandra','Zapata','Alexandra.Zapata@outlook.com','39262233981',NULL),(183,'30057186415','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','33647503530',NULL),(184,'30301966054','Alexandra','Zapata','Alexandra.Zapata@icloud.com','31719980912',NULL),(185,'30613252752','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','39115893625',NULL),(186,'30907138290','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','32832021417',NULL),(187,'30013240549','Alexandra','Zapata','Alexandra.Zapata@yahoo.com','30432601515',NULL),(188,'30566511726','Alexandra','Zapata','Alexandra.Zapata@hotmail.co','38143558947','2024-06-17 20:19:29'),(189,'30963444878','Alexandra','Zapata','Alexandra.Zapata@hotmail.com','39804490860',NULL),(190,'30779775246','Alexandra','Zapata','Alexandra.Zapata@empresa.com.co','34483193228',NULL),(191,'30369009625','Alexandra','Zapata','Alexandra.Zapata@hotmail.es','33934221029',NULL),(192,'30466839976','Alexandra','Zapata','Alexandra.Zapata@outlook.com','33691481150',NULL),(193,'30383939798','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','39094540224',NULL),(194,'30110506110','Alexandra','Zapata','Alexandra.Zapata@universidad.edu.co','37893242880',NULL),(195,'30474115916','Alexandra','Zapata','Alexandra.Zapata@gmail.com','35906860368',NULL),(196,'30945609960','Alexandra','Zapata','Alexandra.Zapata@empresa.com.co','39431287664',NULL),(197,'30847668692','Alexandra','Zapata','Alexandra.Zapata@icloud.com','35017799190',NULL),(198,'30282028046','Alexandra','Zapata','Alexandra.Zapata@empresa.com.co','36779184263',NULL),(199,'30675190641','Alexandra','Zapata','Alexandra.Zapata@hotmail.com','36854178958','2024-06-17 20:24:12'),(200,'30400495636','Alexandra','Zapata','Alexandra.Zapata@empresa.com.co','35296357530',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auditoria_cliente` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
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
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cupon`
--

DROP TABLE IF EXISTS `cupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupon` (
  `idCupon` int NOT NULL AUTO_INCREMENT,
  `codigoCupon` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `descripcionCupon` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `porcentajeDescuentoCupon` int NOT NULL,
  `estadoCupon` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idCupon`),
  UNIQUE KEY `idCupon_UNIQUE` (`idCupon`),
  UNIQUE KEY `descripcionCupon_UNIQUE` (`descripcionCupon`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los cupones de descuento que se pueden aplicar en la compra de productos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupon`
--

LOCK TABLES `cupon` WRITE;
/*!40000 ALTER TABLE `cupon` DISABLE KEYS */;
INSERT INTO `cupon` VALUES (1,'CUPON10','Descuento del 10%',10,'1'),(2,'CUPON15','Descuento del 15%',15,'1'),(3,'CUPON20','Descuento del 20%',20,'1'),(4,'CUPON25','Descuento del 25%',25,'1'),(5,'CUPON30','Descuento del 30%',30,'1'),(6,'CUPON35','Descuento del 35%',35,'1'),(7,'CUPON40','Descuento del 40%',40,'1'),(8,'CUPON45','Descuento del 45%',45,'1'),(9,'CUPON50','Descuento del 50%',50,'1'),(10,'CUPON55','Descuento del 55%',55,'1');
/*!40000 ALTER TABLE `cupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `idDepartamento` int NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  UNIQUE KEY `idDepartamento_UNIQUE` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los departamentos de Colombia para la facturación y envio de los productos comprados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Amazonas'),(2,'Antioquia'),(3,'Arauca'),(4,'Atlántico'),(5,'Bolívar'),(6,'Boyacá'),(7,'Caldas'),(8,'Caquetá'),(9,'Casanare'),(10,'Cauca'),(11,'Cesar'),(12,'Chocó'),(13,'Córdoba'),(14,'Cundinamarca'),(15,'Guainía'),(16,'Guaviare'),(17,'Huila'),(18,'La Guajira'),(19,'Magdalena'),(20,'Meta'),(21,'Nariño'),(22,'Norte de Santander'),(23,'Putumayo'),(24,'Quindío'),(25,'Risaralda'),(26,'San Andrés y Providencia'),(27,'Santander'),(28,'Sucre'),(29,'Tolima'),(30,'Valle del Cauca'),(31,'Vaupés'),(32,'Vichada');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `idDireccion` int NOT NULL AUTO_INCREMENT,
  `descripcionDireccion` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
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
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Calle 81, Cra 10, Casa 173',48,1,1),(2,'Calle 15, Cra 18, Casa 182',47,2,1),(3,'Calle 95, Cra 19, Casa 166',18,3,1),(4,'Calle 25, Cra 5, Casa 51',34,4,1),(5,'Calle 60, Cra 20, Casa 15',23,5,1),(6,'Calle 2, Cra 15, Casa 128',49,6,1),(7,'Calle 95, Cra 17, Casa 48',38,7,1),(8,'Calle 100, Cra 15, Casa 152',28,8,1),(9,'Calle 45, Cra 12, Casa 124',17,9,1),(10,'Calle 76, Cra 17, Casa 166',35,10,1),(11,'Calle 95, Cra 14, Casa 95',19,11,1),(12,'Calle 47, Cra 5, Casa 125',26,12,1),(13,'Calle 64, Cra 14, Casa 95',17,13,1),(14,'Calle 22, Cra 2, Casa 168',45,14,1),(15,'Calle 98, Cra 4, Casa 195',16,15,1),(16,'Calle 69, Cra 10, Casa 53',47,16,1),(17,'Calle 82, Cra 7, Casa 37',47,17,1),(18,'Calle 11, Cra 15, Casa 64',21,18,1),(19,'Calle 10, Cra 6, Casa 9',21,19,1),(20,'Calle 90, Cra 6, Casa 141',34,20,1),(21,'Calle 28, Cra 7, Casa 181',25,21,1),(22,'Calle 70, Cra 1, Casa 21',20,22,1),(23,'Calle 67, Cra 3, Casa 143',8,23,1),(24,'Calle 57, Cra 8, Casa 60',15,24,1),(25,'Calle 54, Cra 17, Casa 110',12,25,1),(26,'Calle 55, Cra 1, Casa 95',16,26,1),(27,'Calle 9, Cra 11, Casa 70',9,27,1),(28,'Calle 81, Cra 11, Casa 51',33,28,1),(29,'Calle 51, Cra 12, Casa 68',49,29,1),(30,'Calle 87, Cra 9, Casa 93',4,30,1),(31,'Calle 99, Cra 15, Casa 112',34,31,1),(32,'Calle 73, Cra 12, Casa 147',46,32,1),(33,'Calle 37, Cra 2, Casa 70',25,33,1),(34,'Calle 36, Cra 7, Casa 119',48,34,1),(35,'Calle 3, Cra 6, Casa 37',8,35,1),(36,'Calle 23, Cra 14, Casa 136',19,36,1),(37,'Calle 84, Cra 1, Casa 141',20,37,1),(38,'Calle 86, Cra 3, Casa 193',25,38,1),(39,'Calle 54, Cra 5, Casa 103',45,39,1),(40,'Calle 90, Cra 17, Casa 67',13,40,1),(41,'Calle 28, Cra 13, Casa 42',12,41,1),(42,'Calle 50, Cra 17, Casa 124',32,42,1),(43,'Calle 28, Cra 11, Casa 144',3,43,1),(44,'Calle 13, Cra 10, Casa 186',13,44,1),(45,'Calle 48, Cra 13, Casa 128',18,45,1),(46,'Calle 85, Cra 4, Casa 83',24,46,1),(47,'Calle 15, Cra 7, Casa 14',22,47,1),(48,'Calle 99, Cra 13, Casa 28',42,48,1),(49,'Calle 71, Cra 2, Casa 41',42,49,1),(50,'Calle 54, Cra 4, Casa 49',37,50,1),(51,'Calle 88, Cra 4, Casa 73',12,51,1),(52,'Calle 3, Cra 10, Casa 44',36,52,1),(53,'Calle 92, Cra 9, Casa 69',23,53,1),(54,'Calle 27, Cra 20, Casa 11',17,54,1),(55,'Calle 55, Cra 14, Casa 170',8,55,1),(56,'Calle 24, Cra 14, Casa 160',45,56,1),(57,'Calle 6, Cra 13, Casa 186',40,57,1),(58,'Calle 12, Cra 5, Casa 172',28,58,1),(59,'Calle 21, Cra 8, Casa 44',50,59,1),(60,'Calle 32, Cra 12, Casa 7',19,60,1),(61,'Calle 77, Cra 15, Casa 47',3,61,1),(62,'Calle 54, Cra 11, Casa 22',46,62,1),(63,'Calle 20, Cra 6, Casa 148',45,63,1),(64,'Calle 26, Cra 12, Casa 28',48,64,1),(65,'Calle 31, Cra 15, Casa 133',9,65,1),(66,'Calle 82, Cra 13, Casa 116',4,66,1),(67,'Calle 62, Cra 18, Casa 87',30,67,1),(68,'Calle 67, Cra 12, Casa 169',25,68,1),(69,'Calle 97, Cra 7, Casa 140',27,69,1),(70,'Calle 59, Cra 7, Casa 161',4,70,1),(71,'Calle 99, Cra 14, Casa 93',14,71,1),(72,'Calle 96, Cra 20, Casa 191',44,72,1),(73,'Calle 49, Cra 17, Casa 142',2,73,1),(74,'Calle 8, Cra 5, Casa 197',10,74,1),(75,'Calle 98, Cra 7, Casa 156',44,75,1),(76,'Calle 1, Cra 9, Casa 6',47,76,1),(77,'Calle 53, Cra 18, Casa 148',6,77,1),(78,'Calle 30, Cra 4, Casa 2',25,78,1),(79,'Calle 45, Cra 15, Casa 79',37,79,1),(80,'Calle 50, Cra 5, Casa 154',5,80,1),(81,'Calle 15, Cra 10, Casa 173',47,81,1),(82,'Calle 5, Cra 10, Casa 28',16,82,1),(83,'Calle 19, Cra 20, Casa 57',25,83,1),(84,'Calle 66, Cra 16, Casa 190',20,84,1),(85,'Calle 13, Cra 9, Casa 159',34,85,1),(86,'Calle 94, Cra 15, Casa 144',24,86,1),(87,'Calle 20, Cra 12, Casa 55',33,87,1),(88,'Calle 42, Cra 3, Casa 90',41,88,1),(89,'Calle 75, Cra 6, Casa 43',9,89,1),(90,'Calle 27, Cra 16, Casa 32',21,90,1),(91,'Calle 59, Cra 14, Casa 140',21,91,1),(92,'Calle 97, Cra 12, Casa 199',12,92,1),(93,'Calle 18, Cra 4, Casa 81',24,93,1),(94,'Calle 12, Cra 4, Casa 108',8,94,1),(95,'Calle 17, Cra 8, Casa 57',17,95,1),(96,'Calle 86, Cra 6, Casa 148',45,96,1),(97,'Calle 29, Cra 15, Casa 158',39,97,1),(98,'Calle 44, Cra 19, Casa 41',16,98,1),(99,'Calle 94, Cra 15, Casa 170',3,99,1),(100,'Calle 73, Cra 10, Casa 34',22,100,1),(101,'Calle 65, Cra 19, Casa 137',33,101,1),(102,'Calle 23, Cra 3, Casa 9',40,102,1),(103,'Calle 83, Cra 16, Casa 71',23,103,1),(104,'Calle 24, Cra 17, Casa 74',20,104,1),(105,'Calle 86, Cra 2, Casa 180',12,105,1),(106,'Calle 42, Cra 9, Casa 162',40,106,1),(107,'Calle 56, Cra 8, Casa 63',19,107,1),(108,'Calle 90, Cra 8, Casa 57',12,108,1),(109,'Calle 29, Cra 15, Casa 159',39,109,1),(110,'Calle 49, Cra 3, Casa 33',22,110,1),(111,'Calle 69, Cra 3, Casa 121',31,111,1),(112,'Calle 23, Cra 7, Casa 183',30,112,1),(113,'Calle 26, Cra 10, Casa 124',34,113,1),(114,'Calle 46, Cra 7, Casa 30',41,114,1),(115,'Calle 64, Cra 15, Casa 160',39,115,1),(116,'Calle 45, Cra 19, Casa 56',31,116,1),(117,'Calle 22, Cra 6, Casa 123',16,117,1),(118,'Calle 68, Cra 10, Casa 69',15,118,1),(119,'Calle 46, Cra 8, Casa 114',34,119,1),(120,'Calle 65, Cra 5, Casa 30',4,120,1),(121,'Calle 96, Cra 12, Casa 186',49,121,1),(122,'Calle 3, Cra 5, Casa 25',45,122,1),(123,'Calle 10, Cra 16, Casa 136',1,123,1),(124,'Calle 100, Cra 20, Casa 161',8,124,1),(125,'Calle 33, Cra 4, Casa 186',5,125,1),(126,'Calle 71, Cra 5, Casa 18',37,126,1),(127,'Calle 34, Cra 11, Casa 117',18,127,1),(128,'Calle 3, Cra 2, Casa 44',47,128,1),(129,'Calle 96, Cra 20, Casa 16',22,129,1),(130,'Calle 95, Cra 9, Casa 45',45,130,1),(131,'Calle 78, Cra 4, Casa 136',40,131,1),(132,'Calle 92, Cra 4, Casa 45',28,132,1),(133,'Calle 7, Cra 14, Casa 54',13,133,1),(134,'Calle 44, Cra 9, Casa 158',35,134,1),(135,'Calle 6, Cra 5, Casa 7',22,135,1),(136,'Calle 9, Cra 3, Casa 79',29,136,1),(137,'Calle 64, Cra 10, Casa 96',48,137,1),(138,'Calle 36, Cra 18, Casa 77',14,138,1),(139,'Calle 16, Cra 20, Casa 95',20,139,1),(140,'Calle 55, Cra 11, Casa 9',32,140,1),(141,'Calle 98, Cra 1, Casa 27',32,141,1),(142,'Calle 71, Cra 14, Casa 60',22,142,1),(143,'Calle 27, Cra 1, Casa 74',37,143,1),(144,'Calle 58, Cra 14, Casa 120',50,144,1),(145,'Calle 19, Cra 19, Casa 10',25,145,1),(146,'Calle 30, Cra 1, Casa 43',50,146,1),(147,'Calle 36, Cra 16, Casa 184',10,147,1),(148,'Calle 21, Cra 9, Casa 113',26,148,1),(149,'Calle 89, Cra 18, Casa 148',3,149,1),(150,'Calle 3, Cra 20, Casa 170',15,150,1),(151,'Calle 89, Cra 12, Casa 51',27,151,1),(152,'Calle 84, Cra 13, Casa 123',10,152,1),(153,'Calle 12, Cra 1, Casa 145',29,153,1),(154,'Calle 70, Cra 15, Casa 120',40,154,1),(155,'Calle 15, Cra 8, Casa 74',38,155,1),(156,'Calle 66, Cra 1, Casa 14',17,156,1),(157,'Calle 43, Cra 3, Casa 87',38,157,1),(158,'Calle 42, Cra 17, Casa 182',4,158,1),(159,'Calle 58, Cra 15, Casa 156',40,159,1),(160,'Calle 60, Cra 13, Casa 70',43,160,1),(161,'Calle 21, Cra 10, Casa 138',3,161,1),(162,'Calle 23, Cra 19, Casa 13',24,162,1),(163,'Calle 20, Cra 11, Casa 31',7,163,1),(164,'Calle 18, Cra 11, Casa 198',22,164,1),(165,'Calle 18, Cra 12, Casa 73',4,165,1),(166,'Calle 32, Cra 7, Casa 144',30,166,1),(167,'Calle 79, Cra 4, Casa 87',35,167,1),(168,'Calle 19, Cra 17, Casa 129',35,168,1),(169,'Calle 53, Cra 11, Casa 27',3,169,1),(170,'Calle 83, Cra 20, Casa 90',15,170,1),(171,'Calle 10, Cra 13, Casa 168',16,171,1),(172,'Calle 3, Cra 5, Casa 4',22,172,1),(173,'Calle 7, Cra 2, Casa 20',16,173,1),(174,'Calle 23, Cra 5, Casa 91',30,174,1),(175,'Calle 59, Cra 4, Casa 22',1,175,1),(176,'Calle 71, Cra 11, Casa 97',43,176,1),(177,'Calle 82, Cra 11, Casa 24',3,177,1),(178,'Calle 94, Cra 10, Casa 138',48,178,1),(179,'Calle 68, Cra 11, Casa 113',14,179,1),(180,'Calle 64, Cra 8, Casa 198',41,180,1),(181,'Calle 8, Cra 19, Casa 94',27,181,1),(182,'Calle 25, Cra 13, Casa 83',9,182,1),(183,'Calle 64, Cra 13, Casa 63',32,183,1),(184,'Calle 24, Cra 6, Casa 123',15,184,1),(185,'Calle 57, Cra 20, Casa 55',19,185,1),(186,'Calle 2, Cra 20, Casa 188',35,186,1),(187,'Calle 64, Cra 2, Casa 118',33,187,1),(188,'Calle 51, Cra 12, Casa 69',50,188,1),(189,'Calle 91, Cra 12, Casa 31',3,189,1),(190,'Calle 76, Cra 14, Casa 11',14,190,1),(191,'Calle 18, Cra 2, Casa 163',44,191,1),(192,'Calle 89, Cra 17, Casa 88',37,192,1),(193,'Calle 34, Cra 11, Casa 103',3,193,1),(194,'Calle 73, Cra 9, Casa 13',49,194,1),(195,'Calle 69, Cra 11, Casa 99',47,195,1),(196,'Calle 19, Cra 3, Casa 13',48,196,1),(197,'Calle 54, Cra 17, Casa 111',14,197,1),(198,'Calle 72, Cra 15, Casa 115',33,198,1),(199,'Calle 50, Cra 11, Casa 31',10,199,1),(200,'Calle 53, Cra 1, Casa 113',37,200,1);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idFactura` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `fechaFactura` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL DEFAULT 'now()',
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
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (2,2,'2024-01-02 17:46:24',7735000,1469650,9204650,3,2),(3,178,'2024-01-02 18:07:30',1520000,288800,1808800,16,9),(4,29,'2024-01-02 18:07:33',5491000,1043290,6534290,3,2),(5,25,'2024-01-03 18:07:37',8649000,1643310,10292310,10,1),(6,184,'2024-01-03 18:07:44',10492500,1993575,12486075,1,4),(7,26,'2024-01-03 18:07:46',4035000,766650,4801650,16,4),(8,55,'2024-01-06 18:07:47',1755000,333450,2088450,10,4),(9,21,'2024-01-07 18:07:48',6139250,1166457.5,7305707.5,13,6),(10,63,'2024-02-08 18:07:49',3468000,658920,4126920,8,7),(11,56,'2024-02-08 18:07:50',8244000,1566360,9810360,4,1),(12,12,'2024-02-08 18:08:04',4173500,792965,4966465,2,2),(13,144,'2024-02-08 18:08:06',4012500,762375,4774875,3,4),(14,115,'2024-02-12 18:08:08',4320000,820800,5140800,5,3),(15,198,'2024-02-12 18:08:09',2256000,428640,2684640,8,7),(16,41,'2024-02-12 18:08:10',5562500,1056875,6619375,3,9),(17,37,'2024-02-12 18:08:11',7784000,1478960,9262960,13,5),(18,150,'2024-02-20 18:08:12',10275000,1952250,12227250,11,4),(19,38,'2024-02-20 18:08:13',6836000,1298840,8134840,16,3),(20,29,'2024-02-20 18:08:14',3048000,579120,3627120,4,3),(21,77,'2024-02-28 18:08:15',2497000,474430,2971430,21,8),(22,179,'2024-02-28 18:08:16',5670000,1077300,6747300,3,9),(23,41,'2024-02-28 18:08:17',3870000,735300,4605300,2,7),(24,27,'2024-02-28 18:08:19',12980000,2466200,15446200,1,8),(25,112,'2024-03-04 18:08:20',4158750,790162.5,4948912.5,17,4),(26,52,'2024-03-04 18:08:21',15120000,2872800,17992800,17,1),(27,72,'2024-03-04 18:08:22',3762500,714875,4477375,9,9),(28,13,'2024-03-04 18:08:23',7551500,1434785,8986285,17,8),(29,79,'2024-03-14 18:08:24',5880000,1117200,6997200,17,7),(30,5,'2024-03-14 18:08:25',12057500,2290925,14348425,16,6),(31,128,'2024-03-14 18:08:25',9900000,1881000,11781000,9,1),(32,81,'2024-03-14 18:08:26',2655000,504450,3159450,6,1),(33,111,'2024-03-14 18:08:27',3756000,713640,4469640,2,7),(34,122,'2024-03-23 18:08:28',5852250,1111927.5,6964177.5,13,2),(35,94,'2024-03-23 18:08:29',6799000,1291810,8090810,17,6),(36,154,'2024-03-23 18:08:30',2976000,565440,3541440,9,7),(37,34,'2024-03-23 18:08:31',12495000,2374050,14869050,6,9),(38,103,'2024-04-05 18:08:32',4203750,798712.5,5002462.5,21,4),(39,170,'2024-04-05 18:08:33',3708000,704520,4412520,16,1),(40,184,'2024-04-05 18:08:34',2543750,483312.5,3027062.5,3,8),(41,163,'2024-04-05 18:08:35',5106750,970282.5,6077032.5,18,8),(42,50,'2024-04-05 18:08:36',7910000,1502900,9412900,10,5),(43,51,'2024-04-09 18:08:37',6892500,1309575,8202075,16,9),(44,142,'2024-04-09 18:08:38',9900000,1881000,11781000,18,1),(45,137,'2024-04-09 18:08:39',6273750,1192012.5,7465762.5,2,4),(46,44,'2024-04-09 18:08:40',5761000,1094590,6855590,5,5),(47,169,'2024-04-21 18:08:41',7266000,1380540,8646540,17,5),(48,182,'2024-04-21 18:08:43',3582000,680580,4262580,16,1),(49,43,'2024-04-21 18:08:44',4086000,776340,4862340,11,7),(50,165,'2024-04-21 18:08:45',3476500,660535,4137035,7,2),(51,85,'2024-05-02 18:08:46',3320000,630800,3950800,11,3),(52,86,'2024-05-02 18:10:20',4428500,841415,5269915,3,2),(53,128,'2024-05-02 18:10:21',3915000,743850,4658850,21,1),(54,132,'2024-05-02 18:10:22',6318000,1200420,7518420,9,1),(55,27,'2024-05-17 18:10:23',3997500,759525,4757025,4,4),(56,11,'2024-05-17 18:10:24',3600000,684000,4284000,20,4),(57,170,'2024-05-17 18:10:25',6800000,1292000,8092000,17,3),(58,102,'2024-05-29 18:10:26',8360000,1588400,9948400,12,3),(59,45,'2024-05-29 18:10:27',3419000,649610,4068610,14,6),(60,164,'2024-05-29 18:10:28',1287500,244625,1532125,19,9),(61,61,'2024-05-29 18:10:29',6381000,1212390,7593390,4,1),(62,184,'2024-05-29 18:10:30',9900000,1881000,11781000,8,9),(63,167,'2024-06-02 18:10:31',7872000,1495680,9367680,21,3),(64,124,'2024-06-02 18:10:32',8679000,1649010,10328010,8,8),(65,105,'2024-06-02 18:10:33',4753000,903070,5656070,9,5),(66,174,'2024-06-02 18:10:34',5536000,1051840,6587840,13,3),(67,7,'2024-06-02 18:10:35',1505000,285950,1790950,12,5),(68,72,'2024-06-02 18:10:36',6461000,1227590,7688590,12,6),(69,48,'2024-06-09 18:10:37',7597500,1443525,9041025,18,4),(70,161,'2024-06-09 18:10:38',5688000,1080720,6768720,2,1),(71,87,'2024-06-09 18:10:39',3228500,613415,3841915,18,8),(72,73,'2024-06-09 18:10:40',6258000,1189020,7447020,12,7),(73,127,'2024-06-11 18:10:41',1930500,366795,2297295,15,6),(74,147,'2024-06-11 18:10:42',4679250,889057.5,5568307.5,10,2),(75,89,'2024-06-11 18:10:46',7042000,1337980,8379980,16,5),(76,101,'2024-06-11 18:10:48',4389000,833910,5222910,14,8),(77,35,'2024-06-11 18:10:49',3646500,692835,4339335,6,8),(78,37,'2024-06-11 18:10:50',2522500,479275,3001775,3,9),(79,188,'2024-06-17 20:19:29',0,0,0,17,2),(80,92,'2024-06-17 20:21:43',0,0,0,9,7),(81,178,'2024-06-17 20:23:48',0,0,0,9,4),(82,57,'2024-06-17 20:24:10',1800000,342000,2142000,21,9),(83,199,'2024-06-17 20:24:12',1760000,334400,2094400,6,3),(84,47,'2024-06-17 20:24:13',759000,144210,903210,7,8),(85,102,'2024-06-17 20:24:14',1521000,288990,1809990,18,6),(86,73,'2024-06-17 20:24:14',2150000,408500,2558500,9,9),(87,106,'2024-06-17 20:24:15',4565000,867350,5432350,15,8);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validar_cupon_factura` BEFORE INSERT ON `factura` FOR EACH ROW BEGIN
    DECLARE cupon_valido INT;
    
    -- Verificar si el cupón está activo y válido
    SELECT COUNT(*)
    INTO cupon_valido
    FROM cupon
    WHERE idCupon = NEW.idCupon AND estadoCupon = 1;
    
    IF cupon_valido = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cupón seleccionado no es válido.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_ultima_compra_cliente` AFTER INSERT ON `factura` FOR EACH ROW BEGIN
    UPDATE cliente
    SET ultimaCompraCliente = NOW()
    WHERE idCliente = NEW.idCliente;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los detalles de cada factura, como sus productos y cantidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalle`
--

LOCK TABLES `factura_detalle` WRITE;
/*!40000 ALTER TABLE `factura_detalle` DISABLE KEYS */;
INSERT INTO `factura_detalle` VALUES (1,2,1,2,5100000),(2,2,3,1,1275000),(3,2,5,4,1360000),(4,3,102,2,550000),(5,3,107,1,60000),(6,3,45,1,100000),(7,3,14,3,450000),(8,3,119,3,360000),(11,4,87,1,476000),(12,4,93,2,1700000),(13,4,47,1,255000),(14,4,44,3,1530000),(15,4,8,3,1530000),(18,5,86,2,1026000),(19,5,133,1,585000),(20,5,1,2,5400000),(21,5,33,3,1350000),(22,5,80,2,288000),(25,6,79,3,1462500),(26,6,118,2,375000),(27,6,59,2,2250000),(28,6,51,3,6300000),(29,6,31,2,105000),(32,7,122,1,270000),(33,7,122,2,540000),(34,7,9,2,1800000),(35,7,8,1,450000),(36,7,61,1,975000),(39,8,68,2,480000),(40,8,117,3,585000),(41,8,132,1,495000),(42,8,113,3,135000),(43,8,13,1,60000),(46,9,66,2,520000),(47,9,54,3,4680000),(48,9,31,2,91000),(49,9,99,1,48750),(50,9,126,3,799500),(53,10,28,1,1800000),(54,10,83,2,156000),(55,10,126,2,492000),(56,10,32,2,120000),(57,10,3,1,900000),(60,11,107,3,324000),(61,11,9,1,1080000),(62,11,8,2,1080000),(63,11,57,2,3060000),(64,11,64,3,2700000),(67,12,79,3,1657500),(68,12,77,1,569500),(69,12,83,1,110500),(70,12,78,1,561000),(71,12,59,1,1275000),(74,13,68,1,240000),(75,13,132,2,990000),(76,13,12,2,225000),(77,13,108,1,82500),(78,13,63,3,2475000),(81,14,85,3,1392000),(82,14,4,1,400000),(83,14,105,2,224000),(84,14,85,3,1392000),(85,14,129,3,912000),(88,15,99,3,135000),(89,15,25,1,1200000),(90,15,110,1,45000),(91,15,125,3,756000),(92,15,45,1,120000),(95,16,105,2,140000),(96,16,95,3,142500),(97,16,54,3,3600000),(98,16,27,2,1500000),(99,16,29,3,180000),(102,17,54,1,1680000),(103,17,78,2,924000),(104,17,55,3,4620000),(105,17,67,1,245000),(106,17,104,1,315000),(109,18,104,1,337500),(110,18,23,3,337500),(111,18,32,1,75000),(112,18,123,2,525000),(113,18,43,3,9000000),(116,19,39,2,1280000),(117,19,110,1,60000),(118,19,121,1,296000),(119,19,103,3,1200000),(120,19,50,1,4000000),(123,20,119,3,576000),(124,20,4,3,1200000),(125,20,70,3,912000),(126,20,81,2,240000),(127,20,110,2,120000),(130,21,15,2,440000),(131,21,92,2,1155000),(132,21,132,1,363000),(133,21,74,2,363000),(134,21,80,2,176000),(137,22,38,3,3600000),(138,22,39,3,1200000),(139,22,128,3,585000),(140,22,74,1,165000),(141,22,119,1,120000),(144,23,66,2,480000),(145,23,11,3,1260000),(146,23,7,3,270000),(147,23,32,1,60000),(148,23,3,2,1800000),(151,24,50,3,8250000),(152,24,62,1,660000),(153,24,51,2,3080000),(154,24,4,3,825000),(155,24,10,3,165000),(158,25,10,3,225000),(159,25,123,1,262500),(160,25,95,1,71250),(161,25,18,3,3375000),(162,25,20,3,225000),(165,26,37,2,5040000),(166,26,3,3,4050000),(167,26,109,1,90000),(168,26,26,2,3240000),(169,26,42,3,2700000),(172,27,27,3,2250000),(173,27,104,3,675000),(174,27,112,3,97500),(175,27,123,2,350000),(176,27,117,3,390000),(179,28,63,2,1210000),(180,28,41,3,990000),(181,28,67,3,577500),(182,28,105,2,154000),(183,28,51,3,4620000),(186,29,104,2,540000),(187,29,49,3,1080000),(188,29,3,2,1800000),(189,29,2,1,1200000),(190,29,11,3,1260000),(193,30,37,1,1820000),(194,30,28,2,3900000),(195,30,56,3,3510000),(196,30,2,2,2600000),(197,30,72,1,227500),(200,31,109,1,90000),(201,31,103,1,450000),(202,31,37,1,2520000),(203,31,39,2,1440000),(204,31,2,3,5400000),(207,32,117,1,234000),(208,32,4,1,450000),(209,32,100,1,585000),(210,32,120,3,1026000),(211,32,24,2,360000),(214,33,41,2,720000),(215,33,76,2,816000),(216,33,2,1,1200000),(217,33,14,2,360000),(218,33,102,2,660000),(221,34,20,3,255000),(222,34,17,2,1190000),(223,34,6,3,1785000),(224,34,97,1,72250),(225,34,36,2,2550000),(228,35,3,2,1950000),(229,35,133,1,422500),(230,35,86,3,1111500),(231,35,36,3,2925000),(232,35,35,3,390000),(235,36,92,2,1260000),(236,36,102,1,330000),(237,36,33,3,900000),(238,36,112,2,78000),(239,36,73,2,408000),(242,37,50,3,7500000),(243,37,52,3,4050000),(244,37,131,2,670000),(245,37,7,1,75000),(246,37,19,2,200000),(249,38,97,3,191250),(250,38,23,1,112500),(251,38,94,3,2137500),(252,38,94,1,712500),(253,38,6,2,1050000),(256,39,130,3,1836000),(257,39,69,2,540000),(258,39,127,1,360000),(259,39,45,3,540000),(260,39,119,2,432000),(263,40,46,2,770000),(264,40,112,1,35750),(265,40,100,2,715000),(266,40,85,2,638000),(267,40,40,1,385000),(270,41,88,3,907500),(271,41,53,2,2750000),(272,41,87,1,308000),(273,41,99,1,41250),(274,41,25,1,1100000),(277,42,81,2,210000),(278,42,103,1,350000),(279,42,15,3,840000),(280,42,25,3,4200000),(281,42,63,3,2310000),(284,43,38,3,3600000),(285,43,23,2,150000),(286,43,97,1,42500),(287,43,28,1,1500000),(288,43,58,2,1600000),(291,44,65,2,810000),(292,44,60,2,2520000),(293,44,11,3,1890000),(294,44,63,2,1980000),(295,44,21,1,2700000),(298,45,2,3,4500000),(299,45,73,2,510000),(300,45,27,1,1125000),(301,45,110,1,56250),(302,45,114,2,82500),(305,46,78,3,1386000),(306,46,41,1,420000),(307,46,64,1,700000),(308,46,43,1,2800000),(309,46,100,1,455000),(312,47,94,1,665000),(313,47,36,1,1050000),(314,47,99,2,105000),(315,47,85,1,406000),(316,47,54,3,5040000),(319,48,115,3,756000),(320,48,14,3,810000),(321,48,34,1,810000),(322,48,119,1,216000),(323,48,63,1,990000),(326,49,125,2,504000),(327,49,123,3,630000),(328,49,131,1,402000),(329,49,46,2,840000),(330,49,94,3,1710000),(333,50,42,1,850000),(334,50,75,3,1759500),(335,50,105,1,119000),(336,50,119,3,612000),(337,50,98,2,136000),(340,51,92,1,840000),(341,51,10,1,80000),(342,51,33,1,400000),(343,51,123,2,560000),(344,51,26,1,1440000),(347,52,107,1,102000),(348,52,79,2,1105000),(349,52,130,3,1734000),(350,52,4,3,1275000),(351,52,118,1,212500),(354,53,104,1,405000),(355,53,101,1,540000),(356,53,46,2,1260000),(357,53,101,3,1620000),(358,53,32,1,90000),(361,54,31,1,63000),(362,54,62,1,1080000),(363,54,90,3,3105000),(364,54,66,2,720000),(365,54,36,1,1350000),(368,55,12,1,112500),(369,55,1,1,2250000),(370,55,33,2,750000),(371,55,82,2,210000),(372,55,47,3,675000),(375,56,62,1,900000),(376,56,39,1,600000),(377,56,42,2,1500000),(378,56,35,3,450000),(379,56,10,2,150000),(382,57,22,3,1680000),(383,57,116,1,216000),(384,57,131,3,1608000),(385,57,107,1,96000),(386,57,43,1,3200000),(389,58,24,3,480000),(390,58,49,3,1440000),(391,58,46,1,560000),(392,58,25,3,4800000),(393,58,65,3,1080000),(396,59,101,3,1170000),(397,59,22,1,455000),(398,59,39,3,1560000),(399,59,10,2,130000),(400,59,98,2,104000),(403,60,40,2,700000),(404,60,83,2,130000),(405,60,132,1,330000),(406,60,19,1,100000),(407,60,114,1,27500),(410,61,1,1,2700000),(411,61,34,2,1620000),(412,61,100,1,585000),(413,61,115,2,504000),(414,61,71,3,972000),(417,62,71,2,360000),(418,62,43,3,6000000),(419,62,33,3,750000),(420,62,96,2,90000),(421,62,52,2,2700000),(424,63,107,1,96000),(425,63,134,3,1536000),(426,63,99,2,120000),(427,63,7,3,360000),(428,63,38,3,5760000),(431,64,91,2,1210000),(432,64,28,3,4950000),(433,64,103,3,825000),(434,64,91,1,605000),(435,64,132,3,1089000),(438,65,23,2,210000),(439,65,27,3,3150000),(440,65,40,2,980000),(441,65,111,2,98000),(442,65,7,3,315000),(445,66,36,3,3600000),(446,66,44,1,480000),(447,66,110,2,120000),(448,66,77,1,536000),(449,66,64,1,800000),(452,67,81,1,105000),(453,67,32,2,140000),(454,67,7,2,210000),(455,67,113,2,84000),(456,67,75,2,966000),(459,68,22,1,455000),(460,68,38,3,4680000),(461,68,121,2,481000),(462,68,67,2,455000),(463,68,49,1,390000),(466,69,38,3,5400000),(467,69,75,3,1552500),(468,69,7,3,337500),(469,69,115,1,210000),(470,69,106,1,97500),(473,70,77,2,1206000),(474,70,68,2,576000),(475,70,55,1,1980000),(476,70,26,1,1620000),(477,70,124,1,306000),(480,71,102,3,907500),(481,71,83,3,214500),(482,71,124,2,374000),(483,71,133,3,1072500),(484,71,66,3,660000),(487,72,88,3,990000),(488,72,1,2,3600000),(489,72,34,1,540000),(490,72,86,2,684000),(491,72,121,2,444000),(494,73,5,3,780000),(495,73,78,1,429000),(496,73,82,3,273000),(497,73,44,1,390000),(498,73,96,1,58500),(501,74,99,3,191250),(502,74,104,3,1147500),(503,74,8,3,1530000),(504,74,23,3,382500),(505,74,87,3,1428000),(508,75,54,2,3360000),(509,75,40,3,1470000),(510,75,8,1,420000),(511,75,55,1,1540000),(512,75,29,3,252000),(515,76,10,3,165000),(516,76,64,2,1100000),(517,76,58,2,1760000),(518,76,120,1,209000),(519,76,11,3,1155000),(522,77,128,2,429000),(523,77,18,2,1650000),(524,77,123,1,192500),(525,77,34,2,990000),(526,77,67,2,385000),(529,78,59,2,1500000),(530,78,110,1,37500),(531,78,72,1,175000),(532,78,105,3,210000),(533,78,9,1,600000),(539,82,69,2,300000),(540,82,21,1,1500000),(542,83,8,1,480000),(543,83,39,2,1280000),(545,84,70,3,627000),(546,84,84,2,132000),(548,85,29,2,156000),(549,85,46,3,1365000),(551,86,64,2,1000000),(552,86,90,2,1150000),(554,87,50,1,2750000),(555,87,63,3,1815000);
/*!40000 ALTER TABLE `factura_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medios_de_pago`
--

DROP TABLE IF EXISTS `medios_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios_de_pago` (
  `idMedioDePago` int NOT NULL AUTO_INCREMENT,
  `nombreMedioDePago` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idMedioDePago`),
  UNIQUE KEY `idMedioDePago_UNIQUE` (`idMedioDePago`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los medios de pago disponibles para realizar la compra de productos y el descuento que puede tener';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios_de_pago`
--

LOCK TABLES `medios_de_pago` WRITE;
/*!40000 ALTER TABLE `medios_de_pago` DISABLE KEYS */;
INSERT INTO `medios_de_pago` VALUES (1,'Tarjeta de Crédito'),(2,'Tarjeta de Débito'),(3,'Transferencia Bancaria'),(4,'Pago en Efectivo'),(5,'Pago Contra Entrega'),(6,'PayPal'),(7,'Google Pay'),(8,'Apple Pay'),(9,'Bitcoin'),(10,'Ethereum'),(11,'Nequi'),(12,'Daviplata'),(13,'PSE'),(14,'Baloto'),(15,'Efecty'),(16,'Crédito de Tienda'),(17,'Western Union'),(18,'Giros Internacionales'),(19,'Criptomonedas (otras)'),(20,'Gift Card'),(21,'Código QR');
/*!40000 ALTER TABLE `medios_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idTipoProducto` int NOT NULL,
  `cantidadProducto` int NOT NULL,
  `precioProducto` double NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `tipoProducto_idx` (`idTipoProducto`),
  CONSTRAINT `tipoProducto` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipo_producto` (`idTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los productos disponibles para la venta\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Refrigerador Samsung',1,50,3000000),(2,'Lavadora LG',2,30,2000000),(3,'Secadora Whirlpool',3,20,1500000),(4,'Microondas Panasonic',4,100,500000),(5,'Horno Eléctrico Oster',5,75,400000),(6,'Horno a Gas Mabe',6,60,700000),(7,'Licuadora Oster',7,200,150000),(8,'Batidora KitchenAid',8,150,600000),(9,'Aspiradora Dyson',9,40,1200000),(10,'Plancha Black+Decker',10,180,100000),(11,'Cafetera Nespresso',11,100,700000),(12,'Tostadora Philips',12,90,150000),(13,'Sandwichera Hamilton Beach',13,70,80000),(14,'Freidora T-fal',14,55,300000),(15,'Freidora de Aire Ninja',15,80,400000),(16,'Extractora de Jugos Breville',16,60,450000),(17,'Procesadora de Alimentos Cuisinart',17,65,700000),(18,'Calentador de Agua Bosch',18,30,1500000),(19,'Purificador de Agua Brita',19,120,200000),(20,'Ventilador Honeywell',20,110,100000),(21,'Aire Acondicionado LG',21,25,3000000),(22,'Deshumidificador DeLonghi',22,35,700000),(23,'Humidificador Vicks',23,50,150000),(24,'Calefactor Lasko',24,45,200000),(25,'Placa de Inducción Teka',25,20,2000000),(26,'Placa de Gas Samsung',26,25,1800000),(27,'Congelador Frigidaire',27,20,1500000),(28,'Lavavajillas Bosch',28,15,3000000),(29,'Exprimidor de Cítricos Braun',29,85,120000),(30,'Máquina de Hielo Igloo',30,40,800000),(31,'Hervidor Eléctrico Hamilton Beach',31,90,70000),(32,'Termo Stanley',32,130,100000),(33,'Radiador Eléctrico DeLonghi',33,40,500000),(34,'Horno de Convección Breville',34,50,900000),(35,'Grill Eléctrico George Foreman',35,60,200000),(36,'Máquina de Coser Singer',36,50,1500000),(37,'Cocina de Inducción Whirlpool',37,15,2800000),(38,'Cocina de Gas Samsung',38,20,2400000),(39,'Campana Extractora Teka',39,30,800000),(40,'Estufa Eléctrica Oster',40,40,700000),(41,'Estufa de Gas Haceb',41,45,600000),(42,'Deshumidificador de Ropa Electrolux',42,20,1000000),(43,'Lavasecadora LG',43,25,4000000),(44,'Dispensador de Agua Whirlpool',44,35,600000),(45,'Máquina de Palomitas Nostalgia',45,40,200000),(46,'Máquina de Pan Panasonic',46,25,700000),(47,'Cafetera de Cápsulas Dolce Gusto',47,50,300000),(48,'Máquina de Café Espresso Breville',48,20,1500000),(49,'Cocina Multifunción Instant Pot',49,45,600000),(50,'Robot de Cocina Thermomix',50,30,5000000),(51,'Refrigerador LG',1,40,2800000),(52,'Refrigerador Whirlpool',1,35,2700000),(53,'Refrigerador Haceb',1,45,2500000),(54,'Refrigerador Mabe',1,30,2400000),(55,'Refrigerador Challenger',1,20,2200000),(56,'Lavadora Samsung',2,25,1800000),(57,'Lavadora Whirlpool',2,20,1700000),(58,'Lavadora Haceb',2,35,1600000),(59,'Lavadora Mabe',2,40,1500000),(60,'Lavadora Electrolux',2,30,1400000),(61,'Secadora Samsung',3,25,1300000),(62,'Secadora LG',3,20,1200000),(63,'Secadora Mabe',3,15,1100000),(64,'Secadora Electrolux',3,10,1000000),(65,'Microondas LG',4,100,450000),(66,'Microondas Whirlpool',4,80,400000),(67,'Microondas Haceb',4,90,350000),(68,'Microondas Mabe',4,70,320000),(69,'Microondas Electrolux',4,60,300000),(70,'Horno Eléctrico Mabe',5,70,380000),(71,'Horno Eléctrico Whirlpool',5,65,360000),(72,'Horno Eléctrico LG',5,75,350000),(73,'Horno Eléctrico Electrolux',5,55,340000),(74,'Horno Eléctrico Challenger',5,50,330000),(75,'Horno a Gas Whirlpool',6,40,690000),(76,'Horno a Gas Haceb',6,45,680000),(77,'Horno a Gas Mabe',6,50,670000),(78,'Horno a Gas Electrolux',6,35,660000),(79,'Horno a Gas Challenger',6,30,650000),(80,'Licuadora Philips',7,200,160000),(81,'Licuadora Oster',7,250,150000),(82,'Licuadora Hamilton Beach',7,180,140000),(83,'Licuadora Black+Decker',7,220,130000),(84,'Licuadora KitchenAid',7,210,120000),(85,'Batidora Oster',8,180,580000),(86,'Batidora Philips',8,170,570000),(87,'Batidora Black+Decker',8,160,560000),(88,'Batidora Hamilton Beach',8,150,550000),(89,'Batidora KitchenAid',8,140,540000),(90,'Aspiradora Philips',9,60,1150000),(91,'Aspiradora Electrolux',9,50,1100000),(92,'Aspiradora LG',9,55,1050000),(93,'Aspiradora Samsung',9,65,1000000),(94,'Aspiradora Black+Decker',9,70,950000),(95,'Plancha Philips',10,180,95000),(96,'Plancha Oster',10,190,90000),(97,'Plancha Black+Decker',10,200,85000),(98,'Plancha Hamilton Beach',10,170,80000),(99,'Plancha KitchenAid',10,160,75000),(100,'Cafetera Oster',11,110,650000),(101,'Cafetera Philips',11,120,600000),(102,'Cafetera Hamilton Beach',11,130,550000),(103,'Cafetera Black+Decker',11,140,500000),(104,'Cafetera KitchenAid',11,150,450000),(105,'Tostadora Oster',12,100,140000),(106,'Tostadora Philips',12,110,130000),(107,'Tostadora Hamilton Beach',12,120,120000),(108,'Tostadora Black+Decker',12,130,110000),(109,'Tostadora KitchenAid',12,140,100000),(110,'Sandwichera Oster',13,90,75000),(111,'Sandwichera Philips',13,80,70000),(112,'Sandwichera Hamilton Beach',13,70,65000),(113,'Sandwichera Black+Decker',13,60,60000),(114,'Sandwichera KitchenAid',13,50,55000),(115,'Freidora Oster',14,60,280000),(116,'Freidora Philips',14,70,270000),(117,'Freidora Hamilton Beach',14,50,260000),(118,'Freidora Black+Decker',14,80,250000),(119,'Freidora KitchenAid',14,90,240000),(120,'Freidora de Aire Oster',15,100,380000),(121,'Freidora de Aire Philips',15,90,370000),(122,'Freidora de Aire Hamilton Beach',15,110,360000),(123,'Freidora de Aire Black+Decker',15,120,350000),(124,'Freidora de Aire KitchenAid',15,130,340000),(125,'Extractora de Jugos Oster',16,60,420000),(126,'Extractora de Jugos Philips',16,70,410000),(127,'Extractora de Jugos Hamilton Beach',16,80,400000),(128,'Extractora de Jugos Black+Decker',16,90,390000),(129,'Extractora de Jugos KitchenAid',16,50,380000),(130,'Procesadora de Alimentos Oster',17,65,680000),(131,'Procesadora de Alimentos Philips',17,55,670000),(132,'Procesadora de Alimentos Hamilton Beach',17,75,660000),(133,'Procesadora de Alimentos Black+Decker',17,85,650000),(134,'Procesadora de Alimentos KitchenAid',17,95,640000);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `evitar_eliminacion_producto` BEFORE DELETE ON `producto` FOR EACH ROW BEGIN
    DECLARE cantidad_facturas INT;
    
    -- Verificar si el producto está asociado a alguna factura
    SELECT COUNT(*)
    INTO cantidad_facturas
    FROM factura_detalle
    WHERE idProducto = OLD.idProducto;
    
    IF cantidad_facturas > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar el producto porque está asociado a facturas existentes.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `idTipoProducto` int NOT NULL AUTO_INCREMENT,
  `nombreTipoProducto` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idTipoProducto`),
  UNIQUE KEY `idTipoProducto_UNIQUE` (`idTipoProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci COMMENT='Tabla para almacenar los tipos de producto para catalogarlos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'Refrigerador'),(2,'Lavadora'),(3,'Secadora'),(4,'Microondas'),(5,'Horno Eléctrico'),(6,'Horno a Gas'),(7,'Licuadora'),(8,'Batidora'),(9,'Aspiradora'),(10,'Plancha'),(11,'Cafetera'),(12,'Tostadora'),(13,'Sandwichera'),(14,'Freidora'),(15,'Freidora de Aire'),(16,'Extractora de Jugos'),(17,'Procesadora de Alimentos'),(18,'Calentador de Agua'),(19,'Purificador de Agua'),(20,'Ventilador'),(21,'Aire Acondicionado'),(22,'Deshumidificador'),(23,'Humidificador'),(24,'Calefactor'),(25,'Placa de Inducción'),(26,'Placa de Gas'),(27,'Congelador'),(28,'Lavavajillas'),(29,'Exprimidor de Cítricos'),(30,'Máquina de Hielo'),(31,'Hervidor Eléctrico'),(32,'Termo'),(33,'Radiador Eléctrico'),(34,'Horno de Convección'),(35,'Grill Eléctrico'),(36,'Máquina de Coser'),(37,'Cocina de Inducción'),(38,'Cocina de Gas'),(39,'Campana Extractora'),(40,'Estufa Eléctrica'),(41,'Estufa de Gas'),(42,'Deshumidificador de Ropa'),(43,'Lavasecadora'),(44,'Dispensador de Agua'),(45,'Máquina de Palomitas'),(46,'Máquina de Pan'),(47,'Cafetera de Cápsulas'),(48,'Máquina de Café Espresso'),(49,'Cocina Multifunción'),(50,'Robot de Cocina');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping events for database 'tecnodomesticos'
--

--
-- Dumping routines for database 'tecnodomesticos'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_descuento_cupon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_descuento_cupon`(p_idCupon INT, p_valorTotal DOUBLE) RETURNS double
    DETERMINISTIC
BEGIN
	DECLARE descuento DOUBLE;
    
    SELECT porcentajeDescuentoCupon * p_valorTotal / 100
    INTO descuento
    FROM cupon
    WHERE idCupon = p_idCupon;
    
    RETURN descuento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_total_compras_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_total_compras_cliente`(p_idCliente INT) RETURNS double
    DETERMINISTIC
BEGIN
	DECLARE total DOUBLE;
    
    SELECT SUM(totalFactura)
    INTO total
    FROM factura
    WHERE idCliente = p_idCliente;
    
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_total_ventas_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_total_ventas_producto`(p_idProducto INT) RETURNS int
    DETERMINISTIC
BEGIN
	 DECLARE totalVentas INT;
    
    SELECT SUM(cantidadProducto)
    INTO totalVentas
    FROM factura_detalle
    WHERE idProducto = p_idProducto;
    
    RETURN totalVentas;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtener_total_facturas_mes_anio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_total_facturas_mes_anio`(p_mes INT, p_anio INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE total INT;
    
    SELECT COUNT(*)
    INTO total
    FROM factura
    WHERE MONTH(fechaFactura) = p_mes AND YEAR(fechaFactura) = p_anio;
    
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `verificar_existencia_cupon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `verificar_existencia_cupon`(p_codigoCupon VARCHAR(45)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE existe BOOLEAN;
    
    SELECT EXISTS (
        SELECT 1
        FROM cupon
        WHERE codigoCupon = p_codigoCupon AND estadoCupon = 'Activo'
    )
    INTO existe;
    
    RETURN existe;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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

-- Dump completed on 2024-07-17 18:24:24
