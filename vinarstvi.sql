-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: vinarstvi-vinarstvi.l.aivencloud.com    Database: defaultdb
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;


--
-- GTID state at the beginning of the backup 
--

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `id_role` int NOT NULL,
  `nazev` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `popis` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_role`),
  UNIQUE KEY `role_nazev_unique` (`nazev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Administrator','Plná správa aplikace a databáze. Pro testování.'),(2,'Pracovník','Zaznamenávání ošetření a sklizní.'),(3,'Vinař','Spravuje vinohradnické řádky a plánuje ošetření.'),(4,'Zákazník','Možnost objednávat víno a sledovat stav objednávek.');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Uzivatel`
--

DROP TABLE IF EXISTS `Uzivatel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Uzivatel` (
  `id_uzivatele` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jmeno` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prijmeni` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heslo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `id_role` int NOT NULL,
  PRIMARY KEY (`id_uzivatele`),
  UNIQUE KEY `uzivatel_email_unique` (`email`),
  KEY `uzivatel_id_role_foreign` (`id_role`),
  CONSTRAINT `uzivatel_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `Role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Uzivatel`
--

LOCK TABLES `Uzivatel` WRITE;
/*!40000 ALTER TABLE `Uzivatel` DISABLE KEYS */;
INSERT INTO `Uzivatel` VALUES (1,'Jan','Admin','admin@vinarstvi.cz','$2y$12$MQDemyMjBDas98SR/gL.l.sSyS77iIPt1zsT1.f9aDFaeIyl83cWG',1,1),(2,'Petr','Pracovník','pracovnik@vinarstvi.cz','$2y$12$aoYK50APEXpjh2asyztP1Okr.6sa4CZ/xT8PLm6a2iPH9hrIM1LW.',1,2),(3,'David','Vinař','vinar@vinarstvi.cz','$2y$12$bvdr4Fzj.wO0OLZ.vUpSD.GlFCe6Y9nvlEkmrwTdehq0XoHabzlvy',1,3),(4,'Martin','Zákazník','zakaznik@vinarstvi.cz','$2y$12$zFhwnOHE7t1bVsIqAOUwRuR5db.OWP5tECMIpmJwAWs6tbdlL3dwC',1,4),(5,'Pavel','Pracovník','pavel@vinarstvi.cz','$2y$12$6B88RrWSL3RgxiPAhk3iaOxp9PhUYWqJB9z/jtAqpSNXRHFwVhoIG',1,2),(6,'Petr','Nakupovac','nakupovac@vinarstvi.cz','$2y$12$c05ZBWzzO/c9JA5tvIv.Yu/q4F1fqVRNnj10e2hKOJtOlFbUk8ZCa',1,4);
/*!40000 ALTER TABLE `Uzivatel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vinohradsky_radek`
--

DROP TABLE IF EXISTS `Vinohradsky_radek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vinohradsky_radek` (
  `id_radku` bigint unsigned NOT NULL AUTO_INCREMENT,
  `odruda` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pocet_hlav` int DEFAULT NULL,
  `rok_vysadby` year NOT NULL,
  `barva_hroznu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_radku`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vinohradsky_radek`
--

LOCK TABLES `Vinohradsky_radek` WRITE;
/*!40000 ALTER TABLE `Vinohradsky_radek` DISABLE KEYS */;
INSERT INTO `Vinohradsky_radek` VALUES (1,'Odruda 1',100,2024,'červená'),(2,'Odruda 2',200,2025,'bílá'),(3,'Odruda 3',300,2026,'růžová'),(4,'Odruda 4',400,2027,'modrá'),(5,'Odruda 5',500,2028,'šedá');
/*!40000 ALTER TABLE `Vinohradsky_radek` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Sklizen`
--

DROP TABLE IF EXISTS `Sklizen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sklizen` (
  `id_sklizne` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_radku` bigint unsigned NOT NULL,
  `id_pracovnika` bigint unsigned DEFAULT NULL,
  `datum_planovany` date NOT NULL,
  `datum_provedeni` date DEFAULT NULL,
  `hmotnost_sklizenych_hroznu` decimal(10,2) DEFAULT NULL,
  `cukernatost` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_sklizne`),
  KEY `sklizen_id_radku_foreign` (`id_radku`),
  KEY `sklizen_id_pracovnika_foreign` (`id_pracovnika`),
  CONSTRAINT `sklizen_id_pracovnika_foreign` FOREIGN KEY (`id_pracovnika`) REFERENCES `Uzivatel` (`id_uzivatele`) ON DELETE SET NULL,
  CONSTRAINT `sklizen_id_radku_foreign` FOREIGN KEY (`id_radku`) REFERENCES `Vinohradsky_radek` (`id_radku`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sklizen`
--

LOCK TABLES `Sklizen` WRITE;
/*!40000 ALTER TABLE `Sklizen` DISABLE KEYS */;
INSERT INTO `Sklizen` VALUES (1,1,2,'2025-09-10','2025-11-23',100.00,10.00),(2,2,2,'2025-09-15',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Sklizen` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Vino`
--

DROP TABLE IF EXISTS `Vino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vino` (
  `id_vina` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_sklizne` bigint unsigned DEFAULT NULL,
  `rocnik` year NOT NULL,
  `odruda` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datum_lahvovani` date DEFAULT NULL,
  `procenta_alkoholu` decimal(4,2) DEFAULT NULL,
  `pocet_lahvi` int NOT NULL,
  `v_prodeji` tinyint(1) NOT NULL DEFAULT '0',
  `cena_za_lahev` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id_vina`),
  KEY `vino_id_sklizne_foreign` (`id_sklizne`),
  CONSTRAINT `vino_id_sklizne_foreign` FOREIGN KEY (`id_sklizne`) REFERENCES `Sklizen` (`id_sklizne`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vino`
--

LOCK TABLES `Vino` WRITE;
/*!40000 ALTER TABLE `Vino` DISABLE KEYS */;
INSERT INTO `Vino` VALUES (1,1,2024,'Ryzlink rýnský','2025-11-23',10.00,100,0,199.00),(2,2,2025,'Frankovka','2025-11-23',12.00,200,0,120.00),(3,2,2025,'Sauvignon','2025-11-23',12.00,200,1,150.00),(4,2,2023,'Modrý Portugal','2025-11-23',12.00,200,1,189.00);
/*!40000 ALTER TABLE `Vino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hnojivo`
--

DROP TABLE IF EXISTS `Hnojivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hnojivo` (
  `id_osetreni` bigint unsigned NOT NULL,
  `hnojivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_osetreni`),
  CONSTRAINT `hnojivo_id_osetreni_foreign` FOREIGN KEY (`id_osetreni`) REFERENCES `Osetreni` (`id_osetreni`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hnojivo`
--

LOCK TABLES `Hnojivo` WRITE;
/*!40000 ALTER TABLE `Hnojivo` DISABLE KEYS */;
INSERT INTO `Hnojivo` VALUES (5,'Hnojivo 1');
/*!40000 ALTER TABLE `Hnojivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Objednavka`
--

DROP TABLE IF EXISTS `Objednavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Objednavka` (
  `id_objednavka` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_zakaznik` bigint unsigned NOT NULL,
  `datum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stav` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celkova_cena` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_objednavka`),
  KEY `objednavka_id_zakaznik_foreign` (`id_zakaznik`),
  CONSTRAINT `objednavka_id_zakaznik_foreign` FOREIGN KEY (`id_zakaznik`) REFERENCES `Uzivatel` (`id_uzivatele`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Objednavka`
--

LOCK TABLES `Objednavka` WRITE;
/*!40000 ALTER TABLE `Objednavka` DISABLE KEYS */;
INSERT INTO `Objednavka` VALUES (1,4,'2025-11-23 23:40:01','Nová',199.00),(2,4,'2025-11-23 23:40:01','Vyřízená',240.00);
/*!40000 ALTER TABLE `Objednavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Objednavka_polozka`
--

DROP TABLE IF EXISTS `Objednavka_polozka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Objednavka_polozka` (
  `id_polozka` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_objednavka` bigint unsigned NOT NULL,
  `id_vina` bigint unsigned NOT NULL,
  `mnozstvi` int NOT NULL,
  PRIMARY KEY (`id_polozka`),
  KEY `objednavka_polozka_id_objednavka_foreign` (`id_objednavka`),
  KEY `objednavka_polozka_id_vina_foreign` (`id_vina`),
  CONSTRAINT `objednavka_polozka_id_objednavka_foreign` FOREIGN KEY (`id_objednavka`) REFERENCES `Objednavka` (`id_objednavka`) ON DELETE CASCADE,
  CONSTRAINT `objednavka_polozka_id_vina_foreign` FOREIGN KEY (`id_vina`) REFERENCES `Vino` (`id_vina`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Objednavka_polozka`
--

LOCK TABLES `Objednavka_polozka` WRITE;
/*!40000 ALTER TABLE `Objednavka_polozka` DISABLE KEYS */;
INSERT INTO `Objednavka_polozka` VALUES (1,1,1,1),(2,2,2,2);
/*!40000 ALTER TABLE `Objednavka_polozka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Osetreni`
--

DROP TABLE IF EXISTS `Osetreni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Osetreni` (
  `id_osetreni` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_radku` bigint unsigned NOT NULL,
  `id_pracovnika` bigint unsigned DEFAULT NULL,
  `id_typ_osetreni` int NOT NULL,
  `datum_planovany` date NOT NULL,
  `datum_provedeni` date DEFAULT NULL,
  `poznamka` text COLLATE utf8mb4_unicode_ci,
  `replikace` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_osetreni`),
  KEY `osetreni_id_radku_foreign` (`id_radku`),
  KEY `osetreni_id_pracovnika_foreign` (`id_pracovnika`),
  KEY `osetreni_id_typ_osetreni_foreign` (`id_typ_osetreni`),
  CONSTRAINT `osetreni_id_pracovnika_foreign` FOREIGN KEY (`id_pracovnika`) REFERENCES `Uzivatel` (`id_uzivatele`) ON DELETE SET NULL,
  CONSTRAINT `osetreni_id_radku_foreign` FOREIGN KEY (`id_radku`) REFERENCES `Vinohradsky_radek` (`id_radku`) ON DELETE RESTRICT,
  CONSTRAINT `osetreni_id_typ_osetreni_foreign` FOREIGN KEY (`id_typ_osetreni`) REFERENCES `Typ_osetreni` (`id_typ`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Osetreni`
--

LOCK TABLES `Osetreni` WRITE;
/*!40000 ALTER TABLE `Osetreni` DISABLE KEYS */;
INSERT INTO `Osetreni` VALUES (1,3,5,1,'2024-04-10','2025-11-07','Jarní postřik proti škůdcům',1),(2,3,5,4,'2024-04-22',NULL,'První jarní závlaha po suchu',0),(3,1,5,3,'2024-05-01',NULL,'Tvarovací řez mladých keřů',0),(4,2,2,1,'2024-05-08',NULL,'Postřik proti plísni',0),(5,2,2,2,'2024-05-20',NULL,'Aplikace dusíkatého hnojiva',0),(6,1,2,4,'2024-06-02',NULL,'Pravidelná závlaha',0),(7,4,2,1,'2024-06-10','2024-06-10','Opakovaný postřik – nízká účinnost',1),(8,3,2,2,'2024-06-12',NULL,'Doplnění minerálů',0),(9,5,5,3,'2024-07-01',NULL,'Letní řez keřů',0),(10,5,5,4,'2024-07-14',NULL,'Zvýšená závlaha při vedrech',0);
/*!40000 ALTER TABLE `Osetreni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Postrik`
--

DROP TABLE IF EXISTS `Postrik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Postrik` (
  `id_osetreni` bigint unsigned NOT NULL,
  `postrik` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `koncentrace` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_osetreni`),
  CONSTRAINT `postrik_id_osetreni_foreign` FOREIGN KEY (`id_osetreni`) REFERENCES `Osetreni` (`id_osetreni`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Postrik`
--

LOCK TABLES `Postrik` WRITE;
/*!40000 ALTER TABLE `Postrik` DISABLE KEYS */;
INSERT INTO `Postrik` VALUES (1,'Postřik 1',10.00);
/*!40000 ALTER TABLE `Postrik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rez`
--

DROP TABLE IF EXISTS `Rez`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rez` (
  `id_osetreni` bigint unsigned NOT NULL,
  `technika` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nastroj` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_osetreni`),
  CONSTRAINT `rez_id_osetreni_foreign` FOREIGN KEY (`id_osetreni`) REFERENCES `Osetreni` (`id_osetreni`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rez`
--

LOCK TABLES `Rez` WRITE;
/*!40000 ALTER TABLE `Rez` DISABLE KEYS */;
INSERT INTO `Rez` VALUES (3,'Technika 1','Nastroj 1');
/*!40000 ALTER TABLE `Rez` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `Typ_osetreni`
--

DROP TABLE IF EXISTS `Typ_osetreni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Typ_osetreni` (
  `id_typ` int NOT NULL,
  `nazev` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_typ`),
  UNIQUE KEY `typ_osetreni_nazev_unique` (`nazev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Typ_osetreni`
--

LOCK TABLES `Typ_osetreni` WRITE;
/*!40000 ALTER TABLE `Typ_osetreni` DISABLE KEYS */;
INSERT INTO `Typ_osetreni` VALUES (2,'Hnojivo'),(1,'Postřik'),(3,'Řez'),(4,'Zavlažování');
/*!40000 ALTER TABLE `Typ_osetreni` ENABLE KEYS */;
UNLOCK TABLES;





--
-- Table structure for table `Zavlazovani`
--

DROP TABLE IF EXISTS `Zavlazovani`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zavlazovani` (
  `id_osetreni` bigint unsigned NOT NULL,
  `mnozstvi_vody` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_osetreni`),
  CONSTRAINT `zavlazovani_id_osetreni_foreign` FOREIGN KEY (`id_osetreni`) REFERENCES `Osetreni` (`id_osetreni`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zavlazovani`
--

LOCK TABLES `Zavlazovani` WRITE;
/*!40000 ALTER TABLE `Zavlazovani` DISABLE KEYS */;
INSERT INTO `Zavlazovani` VALUES (2,150.00);
/*!40000 ALTER TABLE `Zavlazovani` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_tables',1),(2,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-24  0:47:07