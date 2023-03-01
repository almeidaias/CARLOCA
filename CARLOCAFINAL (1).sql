-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: carloca
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `CARRO`
--

DROP TABLE IF EXISTS `CARRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARRO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MONTADORA` varchar(45) NOT NULL,
  `MODELO` varchar(45) NOT NULL,
  `VERSÃO` varchar(45) NOT NULL,
  `ANO` int NOT NULL,
  `CATEGORIA` varchar(45) NOT NULL,
  `PLACA` varchar(8) NOT NULL,
  `COR` enum('BRANCO','PRETO','PRATA') NOT NULL,
  `RODAGEM` decimal(6,2) NOT NULL,
  `VALOR_DIARIO` decimal(6,2) NOT NULL,
  `ID_UNIDADE` int NOT NULL,
  `DISPONIBILIDADE` enum('DISPONÍVEL','INDISPONÍVEL') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_UNIDADE_idx` (`ID_UNIDADE`),
  CONSTRAINT `ID_UNIDADE` FOREIGN KEY (`ID_UNIDADE`) REFERENCES `UNIDADE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARRO`
--

LOCK TABLES `CARRO` WRITE;
/*!40000 ALTER TABLE `CARRO` DISABLE KEYS */;
INSERT INTO `CARRO` VALUES (2,'VOLKSWAGEM','GOL','COMFORTLINE',2020,'HATCKBACK','ABC1234','PRATA',100.50,200.50,1,'INDISPONÍVEL'),(3,'CHEVROLET','ONIX','PLUS',2023,'SEDAN','CDE1234','PRETO',0.00,100.40,1,'INDISPONÍVEL'),(4,'RENAULT','LOGAN','ZEN',2022,'SEDAN','FGH1234','BRANCO',0.00,100.00,1,'DISPONÍVEL');
/*!40000 ALTER TABLE `CARRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARRO_CLIENTE`
--

DROP TABLE IF EXISTS `CARRO_CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARRO_CLIENTE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CARRO` int NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARRO_CLIENTE`
--

LOCK TABLES `CARRO_CLIENTE` WRITE;
/*!40000 ALTER TABLE `CARRO_CLIENTE` DISABLE KEYS */;
INSERT INTO `CARRO_CLIENTE` VALUES (18,2,1),(19,3,2),(20,2,3);
/*!40000 ALTER TABLE `CARRO_CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CPF` varchar(11) NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `CNH` varchar(45) NOT NULL,
  `ID_ENDEREÇO` int DEFAULT NULL,
  `ID_TELEFONE` int NOT NULL,
  `ID_CARRO_LOCADO` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_ENDEREÇO_idx` (`ID_ENDEREÇO`),
  KEY `ID_TELEFONE_idx` (`ID_TELEFONE`),
  KEY `ID_CARRO_LOCADO_idx` (`ID_CARRO_LOCADO`),
  CONSTRAINT `ID_CARRO_LOCADO` FOREIGN KEY (`ID_CARRO_LOCADO`) REFERENCES `CARRO` (`ID`),
  CONSTRAINT `ID_ENDEREÇO` FOREIGN KEY (`ID_ENDEREÇO`) REFERENCES `ENDEREÇO` (`ID`),
  CONSTRAINT `ID_TELEFONE` FOREIGN KEY (`ID_TELEFONE`) REFERENCES `TELEFONE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTE`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;
INSERT INTO `CLIENTE` VALUES (1,'15565443221','IASMINE ALMEIDA DE OLIVEIRA','012912',1,1,NULL),(2,'82098200232','ASSÍRIA CAMPOS MATOS','932230',2,2,3),(3,'91289111211','GEOVANNE SOUZA DA SILVA','928111',3,3,2);
/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENDEREÇO`
--

DROP TABLE IF EXISTS `ENDEREÇO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENDEREÇO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RUA` varchar(45) NOT NULL,
  `NÚMERO` varchar(45) NOT NULL,
  `COMPLEMENTO` varchar(45) DEFAULT NULL,
  `BAIRRO` varchar(45) NOT NULL,
  `CEP` varchar(45) NOT NULL,
  `CIDADE` varchar(45) NOT NULL,
  `ESTADO` varchar(45) NOT NULL,
  `PAÍS` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENDEREÇO`
--

LOCK TABLES `ENDEREÇO` WRITE;
/*!40000 ALTER TABLE `ENDEREÇO` DISABLE KEYS */;
INSERT INTO `ENDEREÇO` VALUES (1,'AVENIDA MARACANÃ','10','SALA A','MARACANÃ','2109121','RIO DE JANEIRO','RJ','BRASIL'),(2,'AVENIDA PAULISTA','3',NULL,'CENTRO','2021921','SÃO PAULO','SP','BRASIL'),(3,'ALAMEDA TRAVESSIA','1000','4','SAVASSI','9128911','BELO HORIZONTE','BH','BRASIL');
/*!40000 ALTER TABLE `ENDEREÇO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCACAO`
--

DROP TABLE IF EXISTS `LOCACAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOCACAO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CLIENTE` int NOT NULL,
  `ID_CARRO` int NOT NULL,
  `KMS_RODADOS` decimal(6,2) DEFAULT NULL,
  `ID_UNIDADE_RETIRADA` int NOT NULL,
  `ID_UNIDADE_ENTREGA` int DEFAULT NULL,
  `DATA_RETIRADA` datetime NOT NULL,
  `DATA_ENTREGA` datetime DEFAULT NULL,
  `CARRO_ENTREGUE` enum('SIM','NÃO') NOT NULL,
  `VALOR_TOTAL` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_CLIENTE_idx` (`ID_CLIENTE`),
  KEY `ID_CARRO_idx` (`ID_CARRO`),
  KEY `ID_UNIDADE_RETIRADA_idx` (`ID_UNIDADE_RETIRADA`),
  KEY `ID_UNIDADE_ENTREGA_idx` (`ID_UNIDADE_ENTREGA`),
  CONSTRAINT `ID_CARRO` FOREIGN KEY (`ID_CARRO`) REFERENCES `CARRO` (`ID`),
  CONSTRAINT `ID_CLIENTE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `CLIENTE` (`ID`),
  CONSTRAINT `ID_UNIDADE_ENTREGA` FOREIGN KEY (`ID_UNIDADE_ENTREGA`) REFERENCES `UNIDADE` (`ID`),
  CONSTRAINT `ID_UNIDADE_RETIRADA` FOREIGN KEY (`ID_UNIDADE_RETIRADA`) REFERENCES `UNIDADE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCACAO`
--

LOCK TABLES `LOCACAO` WRITE;
/*!40000 ALTER TABLE `LOCACAO` DISABLE KEYS */;
INSERT INTO `LOCACAO` VALUES (12,1,2,100.50,2,1,'2022-02-25 00:00:00','2022-02-28 00:00:00','SIM',601.50),(13,2,3,NULL,1,NULL,'2022-02-25 00:00:00',NULL,'NÃO',NULL),(14,3,2,NULL,1,NULL,'2023-02-28 00:00:00',NULL,'NÃO',NULL);
/*!40000 ALTER TABLE `LOCACAO` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CHECA_DISPONIBILIDADE` BEFORE INSERT ON `LOCACAO` FOR EACH ROW BEGIN 
    SET @DISPONIBILIDADE := (SELECT DISPONIBILIDADE FROM CARRO WHERE ID=NEW.ID_CARRO); 
    IF (@DISPONIBILIDADE != 'DISPONÍVEL') THEN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CARRO INDISPONÍVEL';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CHECA_CLIENTE` BEFORE INSERT ON `LOCACAO` FOR EACH ROW BEGIN
SET @CARRO_CLIENTE := (SELECT ID_CARRO_LOCADO FROM CLIENTE WHERE ID = NEW.ID_CLIENTE);
IF!(@CARRO_CLIENTE IS NULL) THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O CLIENTE JÁ ESTÁ COM UM CARRO ALUGADO';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CRIA_RELACAO` BEFORE INSERT ON `LOCACAO` FOR EACH ROW BEGIN
    INSERT INTO CARRO_CLIENTE (ID_CARRO, ID_CLIENTE)
    VALUES (NEW.ID_CARRO, NEW.ID_CLIENTE);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CHECA_UNIDADE` BEFORE INSERT ON `LOCACAO` FOR EACH ROW BEGIN
	SET @UNIDADE := (SELECT ID_UNIDADE FROM CARRO WHERE ID=NEW.ID_CARRO); 
    IF (@UNIDADE != NEW.ID_UNIDADE_RETIRADA) THEN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O CARRO NÃO ESTÁ NESSA UNIDADE.';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CARRO_DEVOLVIDO_INS` BEFORE INSERT ON `LOCACAO` FOR EACH ROW BEGIN
IF(NEW.CARRO_ENTREGUE = 'SIM') THEN
IF (NEW.KMS_RODADOS IS NULL) OR (NEW.ID_UNIDADE_ENTREGA IS NULL) OR (NEW.DATA_ENTREGA IS NULL) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'TODOS OS CAMPOS DEVEM SER PREENCHIDOS QUANDO O CARRO É DEVOLVIDO.';
ELSEIF (NEW.DATA_ENTREGA < NEW.DATA_RETIRADA) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A DATA DE ENTREGA DEVE SER POSTERIOR A DE RETIRADA.';
ELSE 
SET @INTERVALO := (SELECT DATEDIFF(NEW.DATA_ENTREGA, NEW.DATA_RETIRADA));
SET @DIARIA := (SELECT VALOR_DIARIO FROM CARRO WHERE ID=NEW.ID_CARRO);
SET NEW.VALOR_TOTAL = @INTERVALO * @DIARIA;
END IF; 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CARRO_RETIRADO_INS` BEFORE INSERT ON `LOCACAO` FOR EACH ROW BEGIN
IF(NEW.CARRO_ENTREGUE = 'NÃO') THEN
IF !(NEW.KMS_RODADOS IS NULL) OR !(NEW.ID_UNIDADE_ENTREGA IS NULL) OR !(NEW.DATA_ENTREGA IS NULL) OR !(NEW.VALOR_TOTAL IS NULL) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'OS CAMPOS REFERENTES A ENTREGA PODEM SER DEFINIDOS VIA UPDATE QUANDO O CARRO É DEVOLVIDO.';
END IF; 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `MUDA_DISPONIBILIDADE` AFTER INSERT ON `LOCACAO` FOR EACH ROW BEGIN
UPDATE CARRO
SET DISPONIBILIDADE = "INDISPONÍVEL"
WHERE ID = NEW.ID_CARRO;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ADD_CARRO_CLIENTE` AFTER INSERT ON `LOCACAO` FOR EACH ROW BEGIN
UPDATE CLIENTE
SET ID_CARRO_LOCADO = NEW.ID_CARRO
WHERE ID = NEW.ID_CLIENTE;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CARRO_UPDATE_INS` AFTER INSERT ON `LOCACAO` FOR EACH ROW BEGIN
IF(NEW.CARRO_ENTREGUE = 'SIM') THEN
UPDATE CARRO
SET DISPONIBILIDADE = "DISPONÍVEL"
WHERE ID = NEW.ID_CARRO;
UPDATE CARRO
SET ID_UNIDADE = NEW.ID_UNIDADE_ENTREGA
WHERE ID = NEW.ID_CARRO;
SET @KMS := (SELECT RODAGEM FROM CARRO WHERE ID = NEW.ID_CARRO);
UPDATE CARRO 
SET RODAGEM = @KMS + NEW.KMS_RODADOS
WHERE ID = NEW.ID_CARRO;
UPDATE CLIENTE
SET CARRO_ATUAL = NULL
WHERE ID = ID_CLIENTE;
UPDATE CLIENTE
SET CARRO_ATUAL = NULL
WHERE ID = NEW.ID_CLIENTE;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CARRO_DEVOLVIDO_UPD` BEFORE UPDATE ON `LOCACAO` FOR EACH ROW BEGIN
IF(NEW.CARRO_ENTREGUE = 'SIM') THEN
IF (NEW.KMS_RODADOS IS NULL) OR (NEW.ID_UNIDADE_ENTREGA IS NULL) OR (NEW.DATA_ENTREGA IS NULL) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'TODOS OS CAMPOS DEVEM SER PREENCHIDOS QUANDO O CARRO É DEVOLVIDO.';
ELSEIF (NEW.DATA_ENTREGA < NEW.DATA_RETIRADA) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A DATA DE ENTREGA DEVE SER POSTERIOR A DE RETIRADA.';
ELSE 
SET @INTERVALO := (SELECT DATEDIFF(NEW.DATA_ENTREGA, NEW.DATA_RETIRADA));
SET @DIARIA := (SELECT VALOR_DIARIO FROM CARRO WHERE ID=NEW.ID_CARRO);
SET NEW.VALOR_TOTAL = @INTERVALO * @DIARIA;
END IF; 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CARRO_RETIRADO_UPD` BEFORE UPDATE ON `LOCACAO` FOR EACH ROW BEGIN
IF(NEW.CARRO_ENTREGUE = 'NÃO') THEN
IF !(NEW.KMS_RODADOS IS NULL) OR !(NEW.ID_UNIDADE_ENTREGA IS NULL) OR !(NEW.DATA_ENTREGA IS NULL) OR !(NEW.VALOR_TOTAL IS NULL) THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'OS CAMPOS REFERENTES A ENTREGA PODEM SER DEFINIDOS VIA UPDATE QUANDO O CARRO É DEVOLVIDO.';
END IF; 
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CARRO_UPDATE_UPD` AFTER UPDATE ON `LOCACAO` FOR EACH ROW BEGIN
IF(NEW.CARRO_ENTREGUE = 'SIM') THEN
UPDATE CARRO
SET DISPONIBILIDADE = "DISPONÍVEL"
WHERE ID = NEW.ID_CARRO;
UPDATE CARRO
SET ID_UNIDADE = NEW.ID_UNIDADE_ENTREGA
WHERE ID = NEW.ID_CARRO;
SET @KMS := (SELECT RODAGEM FROM CARRO WHERE ID = NEW.ID_CARRO);
UPDATE CARRO 
SET RODAGEM = @KMS + NEW.KMS_RODADOS
WHERE ID = NEW.ID_CARRO;
UPDATE CLIENTE
SET ID_CARRO_LOCADO = NULL
WHERE ID = NEW.ID_CLIENTE;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TELEFONE`
--

DROP TABLE IF EXISTS `TELEFONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TELEFONE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PREFIXO` int DEFAULT NULL,
  `NUMERO` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TELEFONE`
--

LOCK TABLES `TELEFONE` WRITE;
/*!40000 ALTER TABLE `TELEFONE` DISABLE KEYS */;
INSERT INTO `TELEFONE` VALUES (1,21,965202193),(2,11,291011221),(3,10,912110112);
/*!40000 ALTER TABLE `TELEFONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UNIDADE`
--

DROP TABLE IF EXISTS `UNIDADE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UNIDADE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CIDADE` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UNIDADE`
--

LOCK TABLES `UNIDADE` WRITE;
/*!40000 ALTER TABLE `UNIDADE` DISABLE KEYS */;
INSERT INTO `UNIDADE` VALUES (1,'RIO DE JANEIRO'),(2,'SÃO PAULO'),(3,'MANAUS'),(4,'FLORIANÓPOLIS');
/*!40000 ALTER TABLE `UNIDADE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'carloca'
--

--
-- Dumping routines for database 'carloca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-28 23:19:36
