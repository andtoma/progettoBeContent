CREATE DATABASE  IF NOT EXISTS `progettotdw` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `progettotdw`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: progettotdw
-- ------------------------------------------------------
-- Server version	5.5.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `availability`
--

DROP TABLE IF EXISTS `availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `availability` (
  `item` int(11) NOT NULL,
  `size` varchar(10) NOT NULL,
  `n_item` int(11) NOT NULL,
  PRIMARY KEY (`item`,`size`),
  KEY `availability_ibfk_2` (`size`),
  CONSTRAINT `availability_ibfk_2` FOREIGN KEY (`size`) REFERENCES `size_chart` (`size`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `availability_ibfk_1` FOREIGN KEY (`item`) REFERENCES `items` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability`
--

LOCK TABLES `availability` WRITE;
/*!40000 ALTER TABLE `availability` DISABLE KEYS */;
INSERT INTO `availability` VALUES (1,'38',3),(1,'40',2),(1,'42',3),(1,'46',1),(2,'M',2),(2,'S',3),(3,'one size',11);
/*!40000 ALTER TABLE `availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id_brand` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(45) NOT NULL,
  `brand_pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Armani Exchange',NULL),(2,'Miu Miu',NULL),(3,'Gucci',NULL),(4,'Givenchy',NULL),(5,'Versace',NULL),(6,'Burberry',NULL),(7,'Dolce and Gabbana',NULL),(8,'Chanel',NULL),(9,'Armani Exchange',NULL),(10,'Miu Miu',NULL),(11,'Gucci',NULL),(12,'Givenchy',NULL),(13,'Versace',NULL),(14,'Burberry',NULL),(15,'Dolce and Gabbana',NULL),(16,'Chanel',NULL),(17,'Armani Exchange',NULL),(18,'Miu Miu',NULL),(19,'Gucci',NULL),(20,'Givenchy',NULL),(21,'Versace',NULL),(22,'Burberry',NULL),(23,'Dolce and Gabbana',NULL),(24,'Chanel',NULL),(25,'Calvin Klein',NULL),(26,'Hugo Boss',NULL),(27,'Max Mara',NULL),(28,'Bisou Bisou',NULL),(29,'Marc Jacobs',NULL),(30,'Moschino',NULL),(31,'Ralph Lauren',NULL),(32,'Roberto Cavalli',NULL),(33,'McQ by Alexander McQueen',NULL),(34,'Valentino',NULL),(35,'Vera Wang',NULL),(36,'Miss Sixty',NULL),(37,'Oscar de la Renta',NULL),(38,'Juicy Couture',NULL),(39,'Elie Saab',NULL),(40,'Yves St. Laurent',NULL),(41,'Tommy Hilfiger',NULL),(42,'Guess',NULL),(43,'Dior',NULL),(44,'Hermes',NULL),(45,'Anna Sui',NULL),(46,'Blumarine',NULL),(47,'Bottega Veneta',NULL),(48,'Chloe',NULL),(49,'Christian Lacroix',NULL),(50,'Lanvin Paris',NULL),(51,'Max Azria',NULL),(52,'Salvatore Feragamo',NULL),(53,'Stella McCartney',NULL),(54,'Emilio Pucci',NULL),(55,'Vivienne Westwood',NULL),(56,'Nina Ricci',NULL),(57,'Marios Schwab',NULL),(58,'Fendi',NULL),(59,'Carolina Herrera',NULL),(60,'Emanuel Ungaro',NULL),(61,'Prada',NULL),(62,'Chloe',NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `user` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  PRIMARY KEY (`user`,`item`),
  KEY `cart_ibfk_2` (`item`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`item`) REFERENCES `items` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,2),(2,2),(5,2),(2,4);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `text` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `post` int(11) NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `comments_ibfk_1` (`post`),
  KEY `comments_ibfk_2_idx` (`username`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post`) REFERENCES `posts` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'very nice','giovannatuttapanna','nice post!!','2013-12-09','12:12:12',1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `furnishers`
--

DROP TABLE IF EXISTS `furnishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `furnishers` (
  `id_furnisher` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `vat_no` varchar(45) NOT NULL,
  `phone1` varchar(45) NOT NULL,
  `phone2` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id_furnisher`),
  UNIQUE KEY `vat_NO_UNIQUE` (`vat_no`),
  UNIQUE KEY `id_furnisher_UNIQUE` (`id_furnisher`),
  UNIQUE KEY `phone_UNIQUE` (`phone1`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furnishers`
--

LOCK TABLES `furnishers` WRITE;
/*!40000 ALTER TABLE `furnishers` DISABLE KEYS */;
INSERT INTO `furnishers` VALUES (1,'clothes srl','07643520567','3381891919',NULL,'clothes_srl@gmail.com'),(2,'bestbrand srl','07271836612','08529291031',NULL,'bestbrand@email.it'),(3,'justshirt srl','021818231237','0862371972',NULL,'justshirt@libero.it');
/*!40000 ALTER TABLE `furnishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id_group` smallint(6) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'admin'),(2,'superuser'),(3,'user'),(4,'banned');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `brand` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `price` float NOT NULL,
  `discount` float DEFAULT '0',
  `furnisher` int(11) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `item_ibfk_1` (`furnisher`),
  KEY `item_ibfk_1_idx` (`brand`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`furnisher`) REFERENCES `furnishers` (`id_furnisher`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`brand`) REFERENCES `brands` (`id_brand`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Striped colorfull dress',NULL,26,'dress',36.55,10,1),(2,'Basic sleeveless sweater',NULL,2,'sweater',45,0,3),(3,'Basic white foulard',NULL,3,'foulard',12,10,2),(4,'Elegant sweater with tie',NULL,4,'tie',22,0,2);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_images`
--

DROP TABLE IF EXISTS `items_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_images` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `colour` varchar(10) NOT NULL,
  `item` int(11) NOT NULL,
  PRIMARY KEY (`id_image`),
  KEY `item` (`item`),
  CONSTRAINT `items_images_ibfk_1` FOREIGN KEY (`item`) REFERENCES `items` (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_images`
--

LOCK TABLES `items_images` WRITE;
/*!40000 ALTER TABLE `items_images` DISABLE KEYS */;
INSERT INTO `items_images` VALUES (1,'skins/sb-admin/images/photos/photo-2.jpg','red',1),(2,'skins/sb-admin/images/photos/photo-2.jpg','green',1),(3,'skins/sb-admin/images/photos/photo-4.jpg','green',2),(4,'skins/sb-admin/images/photos/photo-8.jpg','white',3);
/*!40000 ALTER TABLE `items_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id_field` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Home','index.php'),(2,'Women','catalog.php'),(3,'Men','catalog.php'),(4,'Blog','blog.php'),(5,'Contact & Info','contact-form.php');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter` (
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
INSERT INTO `newsletter` VALUES ('aldod@gmail.com'),('mila88@yahoo.com'),('paodoc@hotmail.com'),('paoloc@yahoo.com');
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id_post` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `text` varchar(5000) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `picture` longblob,
  PRIMARY KEY (`id_post`),
  KEY `posts_ibfk_1_idx` (`username`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'superuser','Praesent feugiat felis congue nulla dapibus','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet eleifend felis. Aenean varius nibh viverra sit amet mollis dui laoreet. Praesent a magna sed ante vehicula egestas. Phasellus id consequat enim. Sed ornare, augue at aliquet pharetra, lectus augue pellentesque elit, et congue nulla sapien a nunc.\r\n\r\nVestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien.','2013-12-09','01:02:03','ÿØÿá\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0\0\0ÿì\0Ducky\0\0\0\0\0P\0\0ÿá)http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\" xmpMM:InstanceID=\"xmp.iid:2B582A62202311E294DFB793D40A3153\" xmpMM:DocumentID=\"xmp.did:2B582A63202311E294DFB793D40A3153\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:2B582A60202311E294DFB793D40A3153\" stRef:documentID=\"xmp.did:2B582A61202311E294DFB793D40A3153\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>ÿî\0Adobe\0dÀ\0\0\0ÿÛ\0„\0		\n\n				\r	\rÿÀ\0^¨\0ÿÄ\0¶\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0	\0!1AQa\"q‘2B¡ÁR#±Ñb$ğáñr‚3C	’¢Sc4²sƒ%5Â“DTE&\0\0\0\0!1AQaq\"ğ‘2¡±ÁÑáñB#R3bÿÚ\0\0\0?\0è@ü*„@0š Í¦€@	 „Ğ\0¶Ğ\0Âh\0A\0-¦€=·Æ€@Úh;h;o@R|§¸Ğ1¾óy×ıËËpşÙB}C„¶W“„\0tÇnı»åÛıÚNK\ZpSÉY}¸‘}Ä¨ÿ\0–İÅ”µ\0/§åH\ZR±hì_©}YI)¨ÁA§;c´?RÔ£d©fı/aãz£¼lYWÔT›ñ¶AŠÖdNsM¨Æ´\\*WBKÎ$¯h¿Æ”Õ™yB†.L¬ºĞˆxÇv—w:­{l‹\'Nİ)6º®ìÑ±,áøòHS°—›åÃàHÖ²Û:5,#ê\'²Sò•\"£¦Ö*sKƒØ*fCÅ_#k‘ı¼„ÆúEÄ[ÛB†ı¾dŞäßÂ®»L«Á[hS>í.K)À[q1¯¹µ£ş˜óØk~.Â±‡/YÔgà¹o\n¯èù7Š,•(—cÅ´¿áïI§Y+!åP|‹µ–+	jrZÛhíKàû›¢È¹·[Uiv´e²Q[U¸Ãã¹7q³Ò‡šJİ*ôä£¢e5rğp^àô?\Z½ë*ERĞÎ‚{=•5cJj1Dø…Bä´¡¸>‚?ÕXİl¬juW«GTq2ÛŸ,”Q§ÛK¬*âÊ\0Úã¯ZëÖÒ5”8,RIğ«•0\r‰Òİ\0zÔ\0¢€1·º€0R:Ğ\0l(M\0€j\0Å\0¤\n\0	 \0‘z\0	Nô\0\n\0	M\0-@± ß@Ûã@\0\"ô‚¨\0P\0lhÄ¦€\0Gm\0İâ€1a@\0 Zô‚<h\0³Ü:ÓA03ù®U8^7™É¸ÿ\0¢†bÒş\'U×A~”«8R3fÈã.œ©.>wn{$ú®²\r…Ïv>%F³r:êš	ŠNö=4Y±%h_]…=§­‚¿\Z™.©“àúâônt¤€H)Hÿ\0İPõZ¬$v±˜¡””„”DŒTËD]p—<×êÍ*öğ;?$&B³¹ÉÉ’Rá2fjR„ßò¢Ú•éjµ_Öu.G±>ÙËåó^&Ç\ZÇòş¶IüÄumÀ¤¨Ö>Öv´F¼aM»ğ)‹c#ÁŠ.\ZHI]¬THó+çY(ˆÍyc‡;Íx§\ZmÄå³±!¼Øº¡úÇ¾>š.®Ş–§-„ªYø\"ÔûéíÌ‰\r²sâ	}jDuOeÈ¾©O]¾ éâj±#~Íì<“66øÒY}µê‡ZXX7×ªI¶à+)™œt„‘cÔ\ZšØ³¤NB¤¸ÒŠ:í±øU™ER÷\r™”­XU¨«ÔzG;¹‘\\Ê^:8¤¨ø(Öü61ç ÇuEkZUútÛÙcùT+L˜íRŞı›óUñ¯qYÅ<»ÇÉ¡h-^Áwò©>6ÑCáIË£Le4v8¬pPí¡­µz\\•†x¤)’-«\0Gh è	 „Ğ\0‚h\0a4\0;t m „Ğ\0Âh\0A7 ìğ ĞvĞvøP\0¶Ğv\Z\0FÎÏkŒ1ç-CaÇŞyZ„$›;¯PÜÂÌyş_Éùw5˜TçıÉ“uØi ›ÇBŠ#\"ê¹Ûé€zÖ[9gG\ZŠÁ­7tùŸJÉimF#vıÉi u*Ú¨«øAøéI³”ËâryÏ×:e2ØƒNÿ\0.;	ì!\0%	6íÔ÷QRZ<#‰3’È2Ë%’°—e6€7ü ªê?\ZVk@ÜU:ì§·8<l6D÷®ÊSËN÷§yìğÒ°=Y­Ù¤Z¦8æ!-\0¨\r)G_QHZøÓ4Ä¼¶7S‹‚ÊQ»H×Zb¢Ey¶6ó8xï4²ˆèm¯¶¨è^·*¹şÜ±,<ãqÀÜ\0ĞŞ”Ó«4Ñ¦ ¡¼ÇÛ¨ğXT@‚’­ªÚö›ü)ôÌ/&$Èbdgq*SOä„İ\n\'Kr	øô=†´§ÉA’ÕucK9ú¦†È“~Ü«}Ú%äÛ»õxù†„Ó£A¢z­‰{Ú^U\"ÜD%º^jÿ\0I\rõJT¢KK7%Bàö‹Š]é¹zZ êÿ\0±<„døÛ˜g•¶fÄFä€Û¢í¥&Ã@¾W­=[McĞÃÛ¬Y?R{EˆĞX¤ÙWë¥kFC;|*@\r»¨Ö=Ô\0“@Û@±î m\0\Z\0Á\0P \0”Ú€¶€cİ@µ¨\0;E\0bÔ\0.(\0ij\0	\ZP\0h\0Z€0EÅ\0CZ\0\r¨\0Z€1j\0\r†´\0~Ê\0\r\0zİôS®¦;o>½Êã‡ Ú¸ÿ\0eRÎÕK+¾™mpÉÊnAm3XSî´OD$É?B@¤dzºÔ\\Î]rG•ëAeJ)T„$§¦Õy—ã­\"¯Sª© «´¹µÀ\0´r¤ÿ\07jo…C²±…¼€RÀl\\Ë’¤l½JnOËDÕgRêš\ZşáÎ\\h-bc8–ıF[\\å££-hHâ]†•I–>¸ş’-áØ	Ü¿–àø¦¥\'ËCI	ê£æqjí6×Â¦÷â¤e1K>½«öïÁ8/Œ†Ñ”&CÖó-`j¢|Ms\'“Èõ‚@ÊçXÀFSÏ\0P€JÉÓåó¦Òº‰uäU}÷G…ÇLVƒ€©(RôµÇËm		/It%RrîzVêÒÖ[ûU£—g%gæ^îq,äµ5Ãá&KV\\ˆÈaÏ)YM‹ÑÕÔ\ZUğ3^+¨Ñ³i„’‡xo —ˆyÀ}Ó ¸ş}ğ\"²ŞVè×T¬‹Å\'rÒ‚Ş}»©dÄèm/nšÖyô)“\Zó¹Å‹¹ÅújXèzŠb¸…JÓÏù?n+íÍË3H£ÚE^‰½‹ñ‚‚{—\'	!½ŒÉ7-æn°”öÚõ³¦#-S#&\\Ş–Õù¼¢×î°6şÚÕ&QûÀóñ®SÇù*Úq™&vÚynäøZ©}tĞNK3ñ&ÆW«c-½\rÓÚÚ“¸Sğ[éG±X³N iÒµš5%Y‹T•ÉOûh*áó „öP\0Âh\0{:P\0ÂE\0&€\0mû(\0A\"Ô¾\0-ºi@Ú(! ĞBh%#¯`ì \n¹÷[ÊßãËòg\"/fG’-h\'µ?Tv)_$…~Ê^Gf%69 ãÿ\0C$HûR¦’†ÇP¥’‘oˆ\0ÖfÎŠCãÜN+„JeYN[“\nyœ+fÆ:<ª’­vi­ºöz!Í†¯¤!X\\¶zJ~º`Z	úXÄ¢:Ş¥êU×¢nMK²H…VËí¯İ‘€Ò½Ad’”’µ²Â4ïìñ¬YòÁ·3¨¼#¬tqö\"ı;|Mg£—%²\"N(Ø€’oZS33´ÚçSØ/LEL<Ãe¨nIêš˜\"H¿”b•ôú`êwRïQô³)G¹ü](måÿ\0)*N½â³lÍkSŸ>à6¸Eá´¦×éåî­¸µFLê·òaŠ—ÙâÖúXÍÇV©(&ÈYáRµï\n\"´ºÊ1rãò*Ç\'Šò)-¼Ö!Å&TgwËmZV.IiVJˆó7vê)h—¡Ğß·NT\Zå0#½%.Ilº°«¿úÌºOæ!K6ø÷UğÍo¢{•>(¿iORt$êšÜp2‘Ù@Ùá@)ùP\0H ß@Û@ÛnŸ:\0Ô\0;\r\0bÂ€SÒ€S@\0#¾€Gu\0İA \0í j\0Ú\0	”\04şÚ\0	 \0‘@° \0h \0(\0$^€E¨\0¿…\0bÚĞJt¾¿:üª¤\'eRâ Jm¦ıE8ÒÑ¶ú›§[|*ãhµE;û“ÉµËË}°ÜøÏ1¡æº‘µ	ÛİªW©î=õ›-¡>–>Vª‚|!^oOÓW~â›üïzMY×á õq†½gJ,½\rm,}wmVKV‚1Ş™øä[FJ–QnŞ¿·AQÈoÛ\ZÜà”4µ8ÊNİÃ¦çV.‘ÿ\0\n5¥­	_ìÃÌ¯uEô….5¹‘r•¸v•ö€-Ií_H\\L¿Ç¯ù\r›ê@µ«=Y’ÕsØ˜ÙFÄ¤•¥I)hEÆ¤ÊbbÒ‚‡{£ì\n˜›3a09{2£Ê‹‘Åå§ŞK2™SJr*–¢q²­è)˜^¶bì&’±o·®\nŸˆàü:-Ëò_pLyN²¦İÀ*˜’÷¢J’Ël²Ó)@\0í÷2Ç‘ÛVĞËbµkOæI^ÔF•å\nÆ`£ÉDFÜ\n€ì£r¦PBÙWj“¸”k}º•–í½Í6¯\nIÔ®?íÃ`ÇL«ny¡m.o×öÕm#–ûNÅû˜Ì¿ÃòíÀhúlº…¯·@êE)ÊĞtpkNG;³¼Ó	”’è’#Ip,‚¤¨©]šk­l¦-ï]Hï+‘ÂË‰-à0ÚBK©l4½î)ª­1-&4¡3ºe!7ò÷XÙ•:L¶ ïÆÁSèÈ²€w¶´¼Ğ	º€J6#^ÁT»#çr}…Ëÿ\0\\ö—‡I7>”O§IQºö6FíNºÚ›×¶‡½H±.Ò{kf§= µ\Z¹V€ÛAV?@üjEƒZ\0Şê\0M\0áj\0M\0@Ûáj\0İ(\0A&ÚĞ\0¶ĞB|(\0[h!?:\0Í­Ù×²€Vå%[GDîşê\0çoßg|on¸˜UÃÓ%dljUé!³qşûÄ…\'+4uëä \rI‡ˆîZ`T™ÅE¬$ˆÜ6ù,‚ÓKj?hÍe:ªà‘1xÙcÿ\0¬å¾›\rv×¥Ou$¼êo¢Xi^sÜ\nºö\nLÆˆb^Y¡ÆùL¾aÊ ñ\rÄ1ê”LÌ¸JŸxßÍ´ë°vøÛJ¦wÂ²Æ`_rÑàë\'´~×Åâ¨:ÂW=ÖÂyZªçÆ¹*lå+İ-?«3†ã±Ä¬´ĞÊ	³m6…¼ëŠìJl)J?Z±ÔÇy¶Äo™û‰âØg38¯(D~lŠñÎ!°5×ió§m©ğ‘E¿\"§÷ÛÛ^rKxBÒ¥¥[LeíİÛşU.^6$³•emşoÍ­ÿ\0ÓZhFæVKe“kyºÕ]´U©]9ôF%D}E ÛKÒ.h¦ç3ıäÄ…=#Ñnê\0“n”ş½Šv¢¢0ŸMù±äåÈÚ•¶7)¿í®_“–ü–‹Íc;Ç12Å(™B¡ã§,è™H@(iÂodÈfÀ¦äŠ¤CĞ²zC%_j¹ı§Í¸Õ!âŞ?&Ô¸Í””ìe^GX:Á>¢¶ß¢O…ZÍèı\nqİz›EÈ@JÂÒ,úİ6ĞßÄk[““šÔm=,*H·ñ áz\0	OÊ€´Ğ\0vşÊ\0Å\0\0§¾€1·º€E\0i \0‘@ÛÃ¥\0\0‚(\0$^€c@#Qá@#º€E\0\0‹P-z\0ë@\0#º€A½è\0* \0Z€E¨\0\'Q@± “Ät¨,‘„¦×ïìøÔHÖ˜ãl²ëƒ± ‚[[[xÒì2«S–şûg&r\\îU‡‹ârLêINOtÿ\0=G½(E€¥ükŸ’Í‹©U|Y\nf\"%ù˜‡6…ly×oÒ¢lNtªVÆŞ\Z\nØHm$¡Ã¼ô$%\0øš«°Úã\Z8—²®©j²y,’M€Ì²>BÕTÇğ¼Õ‡q†ˆ»‹It¢w›©Døà*$u(N¿h¬ˆ|îB-ê26Ÿ‰“²åtŠ³°ØÙšA¸>4ª³ ¨ê÷ Üu¦‹tÙF’¶À£ÇıUVJ©r^\r‡ä.‡fã™’çk«H*=ÀŸ\n‰kaÔ³CŸÛŸj0¸¹ìä™ŠË.±ÿ\0+hğ¦ã_?g3ˆ,üD(ì7\r‹ÊÓ2ÎU’Hæ÷ßgk%1›‰\rI\0)\n)¸±6=„^ÚRgC­ĞnÔƒ•8|.?d“37\rõ¦Šu„Æloy@İt“`”–?\nÙLŠ vlV·ÉrT¼ì|ÎSéÕ	‰2†aşQ±d››wÚ§ŸoAÅ*‡\r$h¨ßÌ¶½Rlh«&&Õ%Î1ŒHÉ4ŞÍ_ô°íÜ›öéĞÒò=¥©Óß´éÍ¯€OÃ)^lEM„koMß2Iãm)½g2r}ÎÓ,í®?²º	œv€‘sV(ÂÕÖ¥d„R(M\0\r(\0a>\0`O…\0&€@	ğ m øP\0¶Ğ\0‚mÙ@Úh$ĞT‚¤º¢€06”“ce–è;¨ÿ\0y<…R=Ë…	¥Ş=…Úâ%Mºû«p÷\0l´Z²äscn+×ã¬H[ü‹9oéX4\Z:ºİ6Ø½¿îöŞÕ›%£C]+:‰œó5;&ñu÷V‚èsÒe6†€7µº¬ŞÎ‚¦Š]—CìWÚDH‡\'šÎ†\\_¥e=‰ÑDãûëŸÛ¿;ñ^\rØ)öñÏ–u\nQcòha¥)(+<ˆ˜ûÛƒ—dÈBÛ’	Dd4Òœ}Ãbv¡(GNêÑ†­†^1«*—0ûÚédSQÜ]ˆš‰3Á¥:v¶‡Ë¾ÓJY!+XUÁ­­{ndÿ\0#Jü[À½ÆÈ	À“Ãr²–^…Ä8ZiÒoPmT¡bv‹t$Rm\\˜öÕ\Zšy-/¶y?yø{Ñc»™ÿ\0î\'}J@uÛ‰±Çé7Ô~ÊÍ{ÖÚÄ1«Z7¡t%&Z°ªÊ:…4Ò›\n^‹ïªÃ‚S.÷GŞ¾/ÅÄ¨ù)uô(¡¨m¥¨{*qá¶G›äXÔ²…óßv2\\™ÇˆJ\r®å¹Ê@·YSvc¿aßdÊÖó¹O¯qì«\rÄ)°\nQ\nÜ>µ(ğe|¼’g\rÉ5!9c—[è	}¦B¶)ÕÇ%mì#_Q\"á6ë§Î¶Mœ“÷9DlnHKwú\"w«Id¸Ä–åÒ‹€à’£mİ½Éº¤¢¼š±Ø¿m³-çø~\njTVëq“QVªõcİ•_Äí½7š™3¨»Ô÷S„…”ƒÙ¯}\0&€<Sß@\0Û@µ\0`ê\0ÆÚ\0øĞv‚š\0øĞ\0l{¨\0P,{¨\0\n\0	\0;¨\06ï \0@\"ô\0Y \0‘j\0Å\0\0Â€E\0€j\0ğHğ\Zš‰ vÜµQ‰	mæ=›JµM\0R­åMÏy¥Y¢Ôâî_))Î]›ÄI(uÆ2²Şu(ıEo~`/k\r£ä+ŸkIëqcÑ5è‘#ëCUÂc—“~Â7[_ˆ¤¶j¥\rH²}V’ğ\'b7.ú¯ÌUñÚ‘û*­Tğ6c¶˜ÖŸõä—dĞw”›ö›Z¡1îš\Z9WÕ:t°¤¨İé¯š[cwìJ¯ßğz¥ °ßiØ—§r÷2,c…úJWb…®…õ5—-§BÙÚ­Öøqv6‘°§h¶µDr]¤İZT¨ì«ÉdÄiµî‘Òõ^E nÈII¸£‘#Ó‰H\nVÎ¤­–ÌV“\'b¤ÑSä! ¢ú$ôúÌ˜¬’E`û‹áçà†û‰.êGsCµÄê.{\'*iÉĞè\\å[}G£8ÊKì¨¡d€|ÉĞß¾¬­¡Øt+—¸x÷\ZÇäR¤şg\ZR\0Ğ\\,ßOÄÅ_\ZƒoÄ!°ÙO•¸éd(Fµ¢L©)°ğÇ9bG™+aÔbi$ƒØAëK°®%ñûI|©\\»ùªP›\Z<‚›Ü\0‡–ÕÇÈZ›ÕıĞr½Ö¿Jë¤Êé-\0jåXY&¤£$pú‘!4\00š\0\ZS@P\0Âu Ğ\0Âh\0A4\0 š\0Ú\0ß\n\0ÎÓ@J4 ”Š\0×u(BRÈChjQì\0Äü¨`póî\"rşês9.í7œa’w\0áX)ì¸\r‚Ÿ˜¬7z³¥±T5çg˜…†‡„a^”H>y¶¦à¨üVá¹ÿ\0ñ4”¥É¦aA\rJ¼Æ]“o_ ¤ÇJ¨m\nW˜‡J½Ÿ\ZÈQrº^§~~ßğĞx×\0ã¸x¨JDxmú‡¡*Ú\rë…¦Üú^ÍcbÉ7‰‡9ƒë4 ×J˜ÓG.÷uev÷gíÓ†ûƒ‘&21›vï£–ó( èR¤¶¤…ÜoDZš¢Êêê,Qş[ö—.-¬O§ Æ&2aaj+b3n-Ô%ö]AJËJYP!Z×©ÿ\0*ß™jõ¨ßÀTgÚIùSŠa¸ü>;Œã)›*\\ŸP…)Ç\nöuuÅ´eS`,j–ì;¤’‚ôëWwv–ËçÂı¶Çñ|6/k_şà\ZA”md•€‰¹ÛÛ¥ô¨ÉE\n7)\\·;Ÿr¶µÄ¥y\\(¬zŒª*Sï>w}ÛÎóyY¼¬Œf\"iD‰*K96[²ˆZP£ùJR-¯ZÓÖ¥x¦ÈìŞÜ´D=îhˆœÌß-A…Äu$”¸şóü•2ò”\nEÍ­c[i>{¾HÖdi±—{6JŞ±yl¯q²”‚\rÇvá}*-N;­İ·vÏ„ fá•nC¡§öŞê°Ş›ˆíU­®ô8z«bÎ{î–ƒ’–£¡ìæEjú˜2QhëÜdAµÉ\'Ê”ê£ÙWM$RgU>Ùù ÉaÇ­Ä©)e2ÛhoRÎÇ‰*66;I·}/†Ñ…)2ÔØ…BäwV“)¿:\0¦€Gûh\0|(wĞ\0H \0@Ûj\0.Ş4\0;(\064\0YÔ\0\Z\0\r¨\0$vP\0Hî \0‘z\0,ÏÛ@#º€\0Gã@\0 \0”÷Pï Î”\0\n\0	\ZĞIµÒ2í¨‘â’5*«Îå¹Oé\\Yr_)\n;Cr”ó¶B?¡¯÷\ZUÜ\ZpÒYÈ^}‡sî†U‡œiÇåËpKØ<¦ê;”‘ü;#å\\»Êpzş¼[\Zh*T5¸ä²SµI´`?ÂRˆ·qP¥½t¨„¤81dh”Ï’TÅúú;¬áHüj®ÆŠÓQ¿‘_£!Nº«¡””¤~«©!K\'Ä&ÃçKv\Z‹1äÁÀ«ÕÉr_Õ¸©6BpQ$Ÿ\r)w·€K_‘{¾ÆqíHƒyhØÓJ©\0¤øô¤Û[;ÖŠDúQ°€nsŒ®¨…CÌ-Ü\rÄIµV—ª46¹¼¸9pG[xUW…\"f+yˆßY¸¶/´é®„éV¥\nÚµÉ£Ğoç¹¼YRÀãøş=Å°hóKŸ˜ú™R,Æ(JGø·wS¾ıíğDÓ«Ö«ú›oà@^ïûÇ„Ü<ÌäÈÈ)»NÈ_¢‹&ÊRB¼ÆêÑ\"×ª»;ìnêõTÁC³2B}òuqjY$ëæ=¦¬™½P€¹Å¤¥\r+ò½!şYÜmñ°­…f¬#cE¶\\ ­«·p×ZĞ™ÍÉQc5%m£Ñ~İ5?†–ª¶)ÓC Ÿe­½\'Ê2®\\4Ú\"Ãdaçqç”?\0\rhê¯©œOwp’/\'ú\ZèTà0®U€\"¤£$ÀŸ\n°€a4\0`E\0\r) -ÓJ\0Oû(\0a4\0 š\0E\0\'Â€3·å@Ûá@Ù@	½‡K^ôâ„‹’‘ é@\rÎFÿ\0ÓâİMÈT¥%‹Ââ€VÖëU³-U©Áopr¿Ô½ÀåT 7å–û¦Öêú­køY5ŠÚ*x\"®S”q©Ç\n)K º­ºÆÖçaòªÔ½˜İà.g¸¸Xdî[o¡$v\\Oï¨ì(ÆËõ_ı¨úööbØÅâÁ;@i\0:Šàãqvÿ\0S,Î$•¡\0«Cm+«‡!ËÏŠcì5)€ß²¶4š0ê˜Ê›Æ`ÈR‹Ì¡dŸÔ/og¾1ÕÈÑìgÅcê5¤¸Oæ	Ö¨”¬Ø¡,…­)	èmnëÕlõ&©À×÷\"_’¹ÈÔj5lúT:úÜä¼Üö%©RööÀºOó©M\"·pmµ!Œ^Yí\"dg–î	Ò?ç¶“åüz^­L­=ÂØÓğS.gÁâ2Tì8û\ZõJzöùµøVêev0dÀ¨æş5èë\'ùß\nZØtõX=ŠlÙM“6âY—\"ŒTPêT])(\nB•mSØPOR›Ûµ5hL¤º–[ØÏ¹é^Ùeñ§+oãÒV•¶•(’•&ÇiMúu²“ãİP¨Ó’mejÁÖ¿d½ùoŞ2ŒLˆxæ˜õ#åîKJRWe6àRAJˆ±\0\\uÖ´ÖÒcµ8–>ç°^¬PÍ‰ê-@Û@)ùĞ\06øĞ\n~t\0Ÿ•\0\0Ê\0Ú\0Æß\n\0\0;¨\0 \0íğ \0@#¾€\0Gu\0;¨\0P\0 \0şÊ\0\r…\0\0‹P\0M¨\0²(\064ë^‚Éª1#Ö¶¿¶ jG”R¥¨ùR.¥xU[‘då¦dÜ~Zöã±ßå±ÈUÆ÷”KEÔä­·í¹¬îŞMø©¢¯–roêÍûœÊJ˜îM¥J}q&º T¶Zt¶‚ :] ×6Î\\Ãh’Ó¢º¨ªB\n“&i;\\×Ê]ó:«…*’Ù¢•6½-h=XØô¥¸íÚÅk!)ÿ\0‰Z\0M.×«2.¥yW¢ú¾«l ´©ÑN©_Ì_À›Hv‘‘¤šSm-õ8«©\0Ú@Ğ¦ÀïªZåvĞ»hü™+Åg ´µ†å¾”RàĞ5(_ÑX&é5\nŞ¦İ>å\\n½B([Ci\n¸ëMLà[s{ĞJ‡KŞ¬‘„ùÛ½Èµ»\rU¢õ¸ÔÉ=\n-ƒ¶Ñ*²Bˆ=ÕKY#E%‰9LßÁÆKùşCNöÚqcy¾P	©š¥«‡­Ÿ3ÿ\0®×3÷+‰dpòğøl´¯©œ=8³[Œ¿Cæ»ƒ­­ ª_êPÇ[ÚsÖÜ¬—ë©J½ÕÅfæ¢Ìã¹¨yIIŠ„e\"°I[/\'E‹”€zvQIOàn¦<•Oš‚™Lƒè¡²²¯*@oİML™H¯ÜŠKSsòâÇp9•ÇÊ·Æ¯)\'ÂÄ^µÓDfË¨âÅ>ÚhÙHJ.SÒÊ\0¤ü)’b½\r@ïªì6ĞI!´¦ÇK&ä|¨«zèu/ìæ	‡í¾A*JR©ÓX˜Ów×Ó-ÑˆEëWUêÏ9îËT[‚.İk£SˆÀo\Z±FÔ”d V3†¥\"€	í í @Ğ\0‚h\0ÀŠ\0M¨\0[h\0a4Ÿ\0d\"€0Pz‹PNWeú÷Â¡°œÚRãâ}ÍÓ2_$¢à%†oÿ\0©]j–ØµOŸ]1õ»–¥mZÔâÊúM¬IøişºË¡Óljòö’Û,J7!M2]î+	I ü:ÕVŒ›l#{~¿é¾ğğw·¥;(ÄwOéóŸŞ(Ì¹bh0ı9j}`à˜¢%#Ì–’4ïµyå±è+e$Ç§-…!*Öï5§á”ÏTÖ„ªÎa	dXƒ¥të—C‘|Zˆ9è@(úMò®&YÙR„6T”o5=ô¥vØËQ$:^Z\"8ËÒ7®8>}©Üe1ÄÈ¤›Zvy>:yàèm¥ ¡+PµühÏtÑn®&¬PÉuS‰Mdº@\"×J”Më\"7İj.ò4!ß	G•I:wéRZŠNxûÑé1\'%Á¤vÜs_“[zîZÚ¢Ul¨Xi‚N2:·’X -¹= xøÖë¨g\n—”n.a^…ĞmSto·ÀØj‚xû¸¦æœSmåw\n\0‘µ[R¥&¥ÙÁ5ªg`şÖ9¿\0N7\'\'LŒÛé,\'µÖÊuPJ@Uï}Änµ3´šNƒ4½èNŠ¹á]A4ó0nÛiÛ@#°Ğ\0vøĞ\0,(h\04\0¾\0?\Z\0ô\0;;è\0;h\0ë@\0#ğ \0‘z\0O}\0ÄP\0µ\0\0@\0#²€\0E\0Â€\0h\0$@\0\"€j	FvÚ ºFm—J©)Öª1!8ï¡–wmNÛoPH ~Ú]ÇQjC|¿ÈÀgl1œL™l8vAow•[T°A}gÈ´gO¬ß5ó9kÀa¶ÒÜ–úÃ¡´¶‡\r—¿y&¹èbêH–Ú`}b—èºò\\j:º›uuÁ~—7JiW´ªÔ`ddŒ>,>¤Ÿ¯š•}:{¶•\'iXñ	ĞYma±$Z!¸»²,™n€â\0Ô]&áR]‹¶n³k -°º;•Ú-Şi.å š±n=„ãßcùoCœC.e%HÄj:.*¹r}(Eıäu‹ØorÑÍø†=Ùƒ“ˆ„µ9$Ø¨¤XxÓğæä/w¯öíğ,_õ¡XÂÑ©5Õ-\'´ZõÄÕ¦wày#Éw°ôÔ2²ë)KÎ2R¾AM©\'NË›R~ÚnY»nø¿aç=ŒöéOddËÆËË¥ô‹\"Kê}@MƒÊ=Æ¬©O2wºŞõ‘¥Xªü¿±U¹Ç¤½ìŞ8rWó™Ğ’,Û…VÒ×\0Õj×†z:ßgGò+Ä¨ùÌ^Häm¹øÅJS(ËÁdìiÑ´úRTQ}ãÌt§$Ò–dÍ‘kVoû‹˜o‡ğµå£(#)—+…ƒ¿T:àºœ·ÿ\0-7?Uñ³¾«G„T|:6–RÙ+NÅ%kêTT{|MjL½õc¡*<{-{p¥\']Uõ?!¥LÉšõ2õåÌ@mN¼¤±¡Ô’šºi²#¯nğÛ†ÈÂd\0Ô61ñ\\)Uÿ\0™€T>Ev­-y3Í{·üK E»oİ]DÎ<zşú±FA©(É\\\'çV3øĞ4\00›P\0Â|-@Ğ\0Âh\0A?ì í m m í „øP¶Ğ\0‹èu½¾t\Z{£\råë\Zú| MÕd‚¦VA¿e­T¾Åé¹óı€œ–AØŠ\nS)uåÆ÷Ü^İ›+ptÒ‘¯ÈR2¸Ùn·ù~¡ßC_Ò€–€\0wj>U\nĞË5(±Ò‰üCebóPQ0§PÛÌ<‚’|Ø¸ø\ZcZ?ª¿©?F}3c›mØ¬<Ùm+îP¸¯?ÆâzŠ)ºV’{vÔ§¼Ê¿¨z\\yõúI@¹\'M</Zk}Íj5™+¾[Ç©­Ö\\“¢mÛkõªË³.â»’œ,KQ1Æ*“«ˆ!Åô;­pA·­*ªnòÈ3‘ğ\\Ë£g\'d^@cåı|¦ıßËBJ¿nÚOòiY[PŠµï_ºI™Ün=ç^ş•Qqæ´¼òbÅV	I·›Kš[NÆŠ%TÂó‘å0·Ñ}Jq\rw„üª­Áf¥É³ÊrÈLu‹şŸÇJ‡a¸êscîO:Ü<¤!A.ää\"+´‹î_şÑotzJl`÷;ñ¤z”Ë“v4ù±€ŞÛ‰+S]Š±PÆÚ…tì¤óÔ»ZôXqg¶ÒıBRòw5)±®¿Ä:í¤ËF”“5›dÂzéJRò­½ÂÀëÒÿ\0ÙQ2\rAd=°÷êw	ˆì%`!ÌajJĞòšJmä\\ ¡ÒÓâ^Ú*ø²oWc¨oÿ\0pR½Ï@VW$£‘JÅÄ‚à`%6ºñ)dêuøVŠ^L™qñ.S+mÄÔ¡{¾\"š„‡áA-@\0Úh\0…\0§¾€·º€\0Gã@\"€E\0FºĞ\0 \0í \0z\0”\0-ğ \0Ğ\0 \0@ô \0‘Û@µ\0Ga \0E\0cm’2TjFmj‰µ‰>ÿ\0Uc\ZÙ¾A‡Ç%P§½êÊdÄÄ²ÚäHxuK-«hu6Hï¥ZËÉ§6õE÷Ş–xZ²üVsê‡’n;Œ5„‡´äŒıÂ>µĞVÜP«(\\=,:Ö¹\"Qéz=¹[zøü½‘O0/K¸¤6”*cÛZØn¥*×\Z“ùSjÁgô|~¡Å+(‡]\r×ÂbB`	nö¥¦Æå¨|MÅf½å–áÌ»È2‹”¤©,’S9ÿ\0¦Èü‰ +=¬K¯ÎÉê2\n¸qvü‹Eâ:Ö{_Rìz#NÙÔÙ\r=^£Kuï—{i™<;èÙDÅÏJÜlõHm*Ô÷‹›\nVK§Xó\"êš¼ø‚söo›HâSbå`©KÆËÚ2Óúu± xKÇ›‹’™ñ,•†tÃ‹òüo ƒ\\GĞ´8‘¨:ƒÜk§2²8Ypº=Gº\n\0ƒr{)ÉÉèTE8‹kxUXVĞGyüsêiĞG–Ö4›U›1İIW¹„8ğŸu/FD„9}Èy ‹÷k6Ìì`ÍhÑZñq~Z`ÁDfä$¶û,”¸	Ñ+\0ëØi¸ìö“FL¶´;2–{Ïœo”òèxK‰s\rÃ™0št!Ùß-ÀG]@@·bk]|kŠmîÿ\0`Ç„äfÔ#¢ï¹p£A¸Ü\0¿9]Ü4ÄuRƒE[”®>¾ÁamMh«ĞUÉ\'Ún>¬÷/*Gÿ\0ÃñdH²?#MäüH¡ÛCaÂ:§öıC†¢ÒR¼ì©9»ózkwcwÿ\0…5¿§XG–÷WõÇ¡>¥íá[;#¡«”`®•\"Ù-„øUÌÀÂ|(\0Ğ<(\0a>\00Ÿ\n\0M\0·Â€@Ûá@	 íğ m\0-¾¾\0MĞ{F¿ Ÿ.ˆÜ¬v#Ä¡œ„\'#l\Z•¥Ä-*\0ZÇó__Rû2Õz£çÿ\0‘´¸ÉÂaÒFVnæeLWıè;K‹:õA\\ç¼½ÂZBÜ`eD\\|6aÇOò¡¶¿Ël)D›õ*:Ÿˆ¨N\\–z(DWq`ä§ãr?A’meÛU4´\0¦ä#_ÌÊÍÇ~ õ5¦ß´Ë[C>„=…÷79öï‹åQ-·ä/ÃÚOÔ0€Ó–·K”îù×5xÙ£µÍS\'Øéia=/ÛK[–°ÌĞ¹ÂÃ+)RÎÓ·©kìWä^â}ÜâĞÜÎpÈ8nT˜í…;Ær>´WÜJu?M!¢St¢‚UZ:é6hÇ[ªİÂ~Fbşä=éK±áä=¯ƒ„Ôç§5õ¸ät%¤o;r6‹µ½Ò7GS\'²upënvK~-?ìÄ<×½Ü½Æ1“¹§Dì|Ö}\\R1Á->©Ş.ZÍöÄ-:\n¥±ÖâkÕöû¦«•ÒË~Hª|óÜî;Ìs¯ËÆ4Èjx<¶Ô€.W`•^ıl)O®Ö¨/íõãô^¶üÅ3še¤Ş4ÔIC@eaIQê¶>u“%Z{]tb×.Í’ÙNâÀvöëşÚÌÅ¢9a÷\rÉÎ[š7‡iİÌ`š ½Ç¬è\nQù&Â»ı|i/ÉæıË7<œW‚ãÌ©üÜUÊ—	u]ÉZJ¾7­èsª‰3-Øªˆ„ªÅ§|È¹ìÔÚİ*–R†ÒÍg³¯6ù[ˆõRëEöÖP¯*I°]¿¶–è;¥Šö£‡Ìe±g)\"kÑ³ñ‚]I*m%«6RH\'i%:j+®Õj©Õ»à¾ØpŞ94Ş2Ïòßm·Ü7ZĞR\n\r“µK~TŠêRª48ù,ÛÔ–P×¦”§K\nbî”\0›Ğ\0,h\0$@\"€S@\0Ûá@\0\"€S@\0#¾€\"€c@#å@\0#³­\0\0Š\0,‹}\0‹ĞdP\0ï è\0$vŠ\0M\0× ”fÖ¨‘ëTHÏN•V1Y‡^)È\rKW¦¹­Ø-*ÚJR’ @Rµ±ıö¥ÙÈúTŒ9÷\"âÙñ>A!(¼k-*;©bL…)ùRe-µúN¸TTãçpÊĞ[°RrYUú¸¯ëIGó/8áqââX‘/!5Õ—&RœÜVVu%c©Q?……r¯‘3İàÇÇäl·N.&Ûy»Ü\rÃp“%)L€*~S3Zi%ùy7×¦Ø*;BŠBG^ËÖK°g¢â&bß[/Ãv3ÏRÛˆ(µÎ©;€½û+=¬ÑWdĞúâÜa¬ì‰,-a¤)»b…`«w$èiKê’ü@ÄNjk˜bÙş£òÊ#¤Û~£iGe¬AšÖ{ÉDøyhb2Y€ÊÃ‚(ôÖş¶[‡ó«ıÛè<)6¶¥S>Û¶‰-¡$5ê$ öw~ºÙ9\"ì²<k!—ã¦N.JšA·ªÁ$¡cÅ?¾­L®Pœ”­Ö¥‘ã^íÆZ[k(Ÿ¦|)WÜ›öë]]Åäçeé¿­šã%¡*bSn\\\\ mñ­µì¯7×²s¹èËŠò´©Í¾@mÊš’¯óäµ)İ»–nUû«#¹×Ä ¬>îóğŞ0ş/½ü«4Êƒa\Z˜±Õ¢ä+¸‘pÿ\0e7—ñŠœí/dRL.\'Õ_¨J–R’íŠJˆ¾oÔ›\Zum¡®öÔ“SÆKDe‰³*v×õ¹&Ö½®)Õl_1´î`>Q)åz`rµ«@‘Öö½jN\r–#ÅSÄ¸\\8Íù³ÜİÓœÌmR#¢–o§ğ‹öÓt“{óÈıÑÏl1hÅpü:ß¤¦m(Gğ¡)Òº½jÅQä;×ç•_¬oêwi[€x$ï§\'õA•Óé“`ÓÄ0¤[&\0š¹”0\'å@	 „ÿ\0¶€ „Ú€	½\0\'å@Ûj\0ß\Z\0ÈFµ $Ñ\0gmB(€	W<·&ˆ´}ÊsI\'ÛÌÄ¨òU~|§æ€. ÉºBS»MËNî´«¸Lv*òpqŞS,BŠúƒ¤y”æFB”V¢µşTz‡©é şÎ¼Ë>LìÕB’/ÊG.;glº”¹!MŒ îCv¾…fÅ_\0;MZ¬­–¤ííoÙWºŞåã“Ÿ‰c\r#ºCy|ÒÖÃ\nAPÊ•:´ëª¬ì¨·cÑØIjõdãí·÷í1ù‡”ò<o\'áR’…nG©bÉú†}]»ÑüiîÔt¬]ŒµÊôPÍılÆµzâ»ÉñP2Ø‰ÍNƒ=¤»S+BĞ®Š\n—TáµGc‘1h+¹±òï1!s´v”ÈJ@¶ºö\r*Õ”Q‘¿)ƒ’ÅIVcô² D¼&E ô7”MÂÇj“¨ ØôUï[±wt²”uú]ÚG³ğµ_Ô¾¥òHórçÈÌñŸRSéÆF9‡¸Ù. -e ¦ún=½;îÒÎdôô¯S%Wä½m\rÿ\0\"šò	Šä™Y’SÅÕˆè+’}E·CŠQÜ¤¶nU¦‚¢İšUi¹È÷×§ş¤¿!ïÁxÎ3\'Ñ„Èi”$ÈÔ•ÒMssewÔâÕj%ûÉca¢es^\rÃÆ°¹{(Ñ#ÄWÜ\"¹ò*VYÊiòåò¶G1(í{%%o¸Uú}CºÀ…6éâ’ô<®GÊÍúTD€<‹Z§	üÂê¸€½ªÉ)@6å„¶z¡à°±ÖÊ:şÊ±Z¡À\n‹¡dúIK¬Û¾à‘J¶ÃäİíŞAÖÓ†–›« §qBÒAı›mó‹2ÖY»Òâ}³{€ç2àQ\"ÊR\\Èâ”c-´®ê˜Qßa{ï­½Lœ«ts»xøÚVÌ²âÊîî\"µÀì í4\0^ß\Z\0	”\0\Z\0	\04øĞ\0Hî \0­\0\0§¾€\0SøP\0í \0z\04\0u È×Â€\0Gu\0\0Š\0,‹Ğ\0 \0*!)Tt\rÆ¤¥.˜äë¨¦;ò:­Gb¼Ö¾áJé]Y¿·ÚÚÛA˜Õn&DNFa²†‡aÅ‡…+Rä-A}çÛoÓ}k*÷òÕ(6?m§’.÷OÜÿ\0q½n&åˆÇd°’}&¡ağ¸‡ßfs®¼Ò\0Lã)o2µ%Ò[4”¨ ¢ş§]ÖÊøÌ¥ıŒØzêÖu†Å³ï*•†Îk‡»•ä^¼¾!6™+^´†rqeŒòG‘$$¨(hj—ìñªn\'á³ø¢Ë¯{ÂıDîW¸şàñ<Ï(áò`es:]ÁpÅC„oh¶ŸYÏRZk×õP§üÉBt\n5{W}Gı¬xî•æ=H[%îß?äùÇg:æ&àáá²\")x§ó)~%™aiõÒ¤úà‹‹V’ö•;zu±Uh¾?õÿ\0bª{µæù¹äE\"#[MKIQl¹µ;ËªQÚVn,€iJwõ;İ,x×íøÌgb6“e¹T­Ş±Õl®Ãş–¤µ\'FÎ6Ü73‚ãùd¢¾¬vBûò¼Ñä\'¥–ı5[´“Yî‘jŞËâ†¤2<S.Ä¶š@~6ğÙW™\nJúG^•šÖ-d®‡æg™»úgs@%\Zí%ÀtÓp\nIîÖ³f¿#=1*lÇ2\rã²­ÍB÷F˜•²åúQ6\nùiY9Á\\••òüs2ywó&îHôşš1î6³‹¿xhî½\"®e”Ëd´	ÌãPäÅB¤ºYH2éaÜ‘Ø;\0”‹=HVÜ#¥\r¥:•,ÚúëcğªÕèVîI½¦PÚ.|£¶‰)&œ¹)l])MÓÛşº9HdIæ®Áä<sÅ—èOä™àÇZz5ê¾ª…Á »é´m¸òÁ´”³k;Ë½àÁæ\ZÂãÇfÔáº„–FÖûT¥¡z[áL¦kòãi·[¯$\"åù÷:y•Gz*£Êô¤6ëŠIèJáÛ§şß¹iØ^•õ Ùpæ]n¨»šÉÉ_­’qÒV§RtVòt\0u:–Ôc_O¢\ZOñUqìÜÀ#:Î(\"#ËHIjçršYV—O@F„kÖµVŞ…•ñBôÌ‘Í!CoÑŒÈ²5¹ \rT¢{Oek£´$Á¢2–ù$Ğ•uÜluµµ @JºyÖ¢p&´S]ÌÙóÿ\0Å~dßúGÅx«2	¶İÉ¾”¯¨’G®O`;\0ü¢Õ³ÔªŒ?sèµßâ³*d<65”:´0Óm¸›\0ÛcÌh\0wšê\'òü]ìØÂáù—97/äS\nÜb\nÖ¡`¹n„)Mƒÿ\0ËB|Öè¥[²£åfıv)Ã\ZOvJ†µR-“0M\\È@	ùĞ4\00š\00\n\0\ZSá@	ùĞ\0‚oÔ|ê@G‡ã@	©\0[<(€·Æˆ;{µ¢\0×}\'hUÂ‡ï¡ 9S÷£Î¦e93Æ|/á2/¦4VïëO˜Û>”—¹	m•+ÓEÆªŞ®€VlÚ¨7uj“Ÿ%6ú9g¼ÆMÅj\"`Hf9ÚT›Ø­}J–oásY-XÑë®äÙöwíow}Í<“;Œ8	)˜¨ò¹¼A_ı2\\ó!*ºÈ?›nµLŠ4òJòıáˆÍ¡$6€ÒØl€‘`:\0:ìª@·oR\rç>Îcùì\\¼L“Fk\"ÊØeÖ@ÜÊJH\nMô$xõ¬wë¶åq÷8¨9Á/ÛŸw¾Ê¥HÌÃåıÏö¦\\…?•ã!§!dá¡JóIŠ…)Æ‰\0ùÒ’®¶IÖ™e\\VÚ[Ôf;YË®«Êô/W´ñpïu0lfø¶a¬ŒbBd#ò<Ë–ó4ójó!C¸ü©—ÆâÈ–Õ”Ô°qúRE•qzmj˜‹Y ™¼v<æ–Ó‹!.$¤§NÚgÙL¢ÌÑ_¹W´Qä¾µ7‘-% HmHı„ƒH¶\'Sn>Ëe@ç<M8yQ¹+RTFş·¤¶ĞşrDÎËN9‡ÖâÒÒR’¥©D¥#ó(“Ğ\n«ÕÁeô©{ı÷¿Üµs9«À`ßR¸üG·É–Çlÿ\0å ş_â:×k§ƒí©{œÿ\0oî¾+bˆÃqö»İÜJãŞ|+tÉÏC§’”)^¢QIOiZÓ`~V¨{—\rÆDfHu…hR•6Uş2’¯ŸB*JÕ‚@“ê$Y->’-ùÅĞ£“Tzè1\rÈFW§,Y/H$mÈvç@Q~½µŸ-\'SF+ûY÷&.¨R¥n-)#*ë\n)õa¬€ÜÖuÜÚµ7Ô&àÒ1[…¤¶zs¤Xc\"ŸY¸3T„Êu;¢ÉH³2“Ô)\ZùTAü¿1¥uy\"¦Ò5ÕC¥eX©â“Ù@ |(\0ğ \0‘@\0\"€nñ¥\0\0İ@\"€#²€#°Ğ\0JtÒ€\0E\0E\0\0Š\0â€\"Ô\0(\07éA!.)\r¡N8l”é§R{‡yªdÈ¨¥–¥Ü „Ävu”âv´?+=Ÿ>ó\\.ÇnÙ\\-ç_­\\J^æâq{R|¶#­«*F®B&M¢ÊI°$uùT±”z”ÇßBÖMÖ}¬âYäFÈ#\Zÿ\0&åÜjS\r­:Ì¶¤CD)íK”´ˆmVU‰)¶bÉgcD&ØÕ2+y7íw,î^fc\"Ï ÍÉŒÔÖØ/C”Ûw\r:„¥)|oRnH\nĞÄBxãÒ£-|—Õ¢7àóQ>áòØ<ï\"ÆHÌÿ\0Û²1˜V˜$/&ë’_ùî›MJv¬]a;I$Uëg©ëüÆäUûu·\'Uéó$YÓ\rÆXÇñ´{à¼Ÿ7üÛ¨¨Ğ²¹ˆúK[©;L£µ¥¶•…~`S«+g\Zşco’«µf>Iÿ\0bª{¡‰æ|‡Ûù»%ÉŸ…š}§‡5-JÆâ$º¨\rÄi{’u7Ü…cW³İiàîô•)“Š¯–¾\"&#ˆä?¥JÈJBbqiÒq“eø«~[ˆÃj*K€¨íº:ü*_jûË’^gøèƒ3\ZÌY@ >”´âÓ¯¦°,¤ªı\rë%Û6¸`B‚÷Åy)y‚\n›itô 	È«fÎ>úä]` ˜Î+¨Â{íYšB®ü‡1R\\jßQ.-hw»obÁìî5‹\"ğ-ú’Ä,¸ÁcJYérSèEm=©*Z¼{k=­Å²–)a ñ¾«‹õ¦ä[º£s°¤ø)3æQÚY-qÈ-4«%=|M…ª+f>•`À@×ãP	ŒìÜÓKó„% ’µtHäŸ€ ·\"¡dù¬—,‹˜‚â’¸3ãÿ\0G_êO¤êKj½D\\ÔRÿ\0T—Ó‹LéÎc-ˆãxùr²¸â¤åc¨œÊia:¤ _¥«©|”Ç2·Š¶Ë	=ŠKÉyŠ³¦°\'ö^dÇÒÃoº”¨Ü6.tåJ°“ü´FûÛŒüÂ=şëó´™’@vsëM¼öèIĞvWG.*YÎËÛäâ¤[îæ!Ê±ü…Ş!…%ˆ2™9ì‹\0zL¤tnÿ\0©v;ŠR.©¨MÙ»%¢5aj‰+=^ÅcãN©Æ_Vğ6\0BÉ°&ú£ÓÍZUËYjXŞÍ±8ˆCnCçÔ™)Xm.2óñÍÂ}d\0…*ÄôÖút­xì’ú¶9ùğ»9®â†İ./ÍËäù©îI’õ”ÄvR–µ\r ‘ ïëZñf\\¥‰ÍÕµ©Áhoã=Èç>òò¶áğ¨‹ÌOäŒ»èİ‹yßRz<ñ·ò’ocæ¶•²·¶G¡/[V“o÷.‡âĞx†•FRY*uç–IqçWú–µTk¡JñGÏ•ä·&9ˆ\0XSLì,Ô‹dØM1†Ñ\0&ˆ\0ÀŸ•\0P\0Âh\0A50\0öĞ\0€©\0Àš·ı´\0 ŸL\0-”@Û`hB[Í°•>ëÉe,§Ô.¯¢@?˜{ê\0âg¼Ù&ù§<›62a`xŞD˜Q2òÊV¹m©~ª_Cd¦ág[¨÷Ò2=tÔéõñÂÔcñ\\.uÉñœ“•ÉòœEØDÀŸ¥a1ÚRÖ÷¦ÚR”6„MÉîÖõ/8¸Õ\']NÉ{í>+Ún\ZÎ‚\\¹/*n[\"[K^«ë !	Ñ(m\0%#â{k:—«Ü^[ËÓb{6$õ$ŠºFvÍìa@›Øu>2ÔÜª~îûo÷&\\†Zp\"Ñ8ÄvW«jZÅ‰UbÉVí\'OUE§r^Ú{ëö»Ë›æ²p`HmÂ—â@[¯Æ“ªéD¦Ö\r¬T„VêßeÁ­J}»Uò«Ğé²?w<OÜ|8™•§Šòb€‰8Ùk³.¸	ú¬ğªÊÕøŞ6;Š²’ÖŞ1–„«êRA\0¡`èGx=´,ŒSÄˆû’ó8¨CÇ×U•æ¼U/q”ÄÊQîO)‡¬†_+5œf\"-×+#%a¶ÛS®—6è‘©î¬êná)5¸Æ¥œ±÷_Ş9ÜêTœ_SØş&•–üà7½Ú–ûB?õwW_­Ô®5/Vp»}Ëe|k±ùSå$Í‰\"µ£¦À-4¿7B¢şe¨qaŒJRd †\\mZ‚³æ±ï²†¼kªeÃé9³iH$kÔªÿ\0ÛS\ZbÓmˆ…ªöh¸–Ôu*I^áaó5RïaOËÌôË–X­@è,l/}\r»ê2)E¨á–oŠò¸ŞB$¶NØHz4¤¸@)I’ĞVÂE¼*é#^ÊÅzî‰ÁÜ¿fy<uíî12‹sLv[l…ye@–I\0îBÓb ·•·­~U‡º9İªq¼­™)HÆ„¢K«™èÜµùŸgü.ŸÖ‘ü›ø¯Ö´L…0»Fƒı•$)4\0-Û@\0\"úĞe?*\0	OÎ€·º€\0E\0S@\0 |h\0$vĞdP\0 \0P\0ì ˆì \0n½(\0§†Ğ§v¡#SoôëQk*©~V®Î©•äõV’hô¼øšóİÓÍhğwºıe†ºî=¡@	Ièm.”-k²b¶Ûj;A hi¯\"µ´²8Î¡+ñ×ı!£^4Txspàâ¹g…ÇãÉsÜ?9¾eÈ]*gúx‚‚qr\"Á	tİÔ´\n´RAĞ‘w`ÎëGXÿ\0}‹_®¯‘Y¸hGöòt·¸£9¯rğŠãÎqH‡–å–dÿ\0Môqé—¹Jl,”R÷qC[ZÔß³É}OR’ëh£™şckÜ(ñıÀçşØòV¸Æw’àÆò¬cÎÆGõjû7R€¤¥j¹O¨‹%C¨¥»ÒÖ„†¬3JYJÑéùî›â¸ecÆÆ³-½-!öâÆf*Ü\rGgÔØËO<şå^Äù‰ÖÖ],²./çşŒÛDñ}MÌ¡¿a¸\'²~çğNSƒzw9Èº‰ñ3®=zjqQåNÔ±¥)HswŸy\0…$¦¯¥ªÓZn¾~Tš«k_³KÕÅv†õù|Y?œ©áø7bËÅIá\\i‚ìéKrÙ’Ò\\*†ƒü´©¤,XT~ŒºA®xò¶ü­ú|Âxgv•QÔÜ¶\\Šı·úÃrARN„uëY,½\rY2$È™è(jt¸®ÊKe7½·qHºÒK¶(EÄÊ•27ĞÆSï	É¹Ôëÿ\0ëe²×AV´-G¦SŞ1g~üŒW_A[Úll/Ù­dÌ„ÖÒ&¸ËÉ{é”6úa%$õÚ ,/ğ¬94Ğ¬’V-›”7ü\r tòõ¬í”d³ˆFÄ%;l”öUÓØ¿%à–¬4Ó­D™^}Øä¿Kú,UÚVE?æ:¡ßıd[áz]î¶/R\0ÇÆ‰-íKÑvÉŠ•‹…8ÂÒ´§çkQ[j]¹:_È$+š{Ìã[¼|Î=©mo³ÔH*NÆâºy~ºJØWS\"¥áî){í>‡še!‡y&BV_sRÄ$ÿ\0ËBĞ)cÌ£× ­}<?jœšßù	ïv~íİk²ş`yÏ\"ŸË³øî	Å^W.ò˜„tm	Õéw6Òn¥ıµkd¶|Š•ü|FáÅ\\yoàœcqœ·<-¾?²ãÄiÅÎ–è\n\\Éç¾õÿ\02\'PtÛdôÖt¦,p¶ş”³_±—“9~÷²ÙŞeŸäŠöğˆ\\j—6céWÓ0Twì©:­B÷ô¤V.ºm8Øô9²Ò‘ÍêÆËŞÄòˆ™Ÿéyhq]ÛºY·µWB¤¡Áq~¤V¬Zé\"ï•*òJKÃ>Ïqğäc²\\Û2ç%5µ?ÑZÓĞ•æ±âMşuÓÃÕÛ‘Æìû³†¨¡—#q¼?ÅÇÅaqññğ#\Z‹´¶’muiUUóùrÛ#›9vÕ?.”È3°>^ÓL(À†¤£\'šq„0&€	ğ „Ğ\0öøP\0Âh\0a>\0;†¤mĞP\0Â|*@MH	·eH·](·Èy/FLœ£ÇÖ|v/¾®–m*)H\0\nÔBõ7 PĞD”¿İ?r9G(ƒ˜Äş‚bg8101NK\reçI’TÃˆq×’=6š ú…´¥ j§€¦ö½—Ğ¾fœt¥^§33ñ\"äãÌTÂÄYU¥\"KèQq—a[ê\\è´(±I\Zõ¿šôqi›*å³ì7Ûù“¹o6çùXjŒÖ&3<Û­”ŸRQL©Jí-¡´›v4¬ı¦¡!•:ó°Ûh±#¥d‚–fËª›5?\Z˜*%Èp<½¤](ëQÖ†»¯íù,‹›ü*\Z‚T²¤ûÕí>[Ü,~Ql¡¢§tGè	·•$‚à\nÌªÕ¹#¡‹\",å|Ş›àl29Dã¼ûŠ}Pòğ>d½-ğÖ´ìz_Hí‰Ì¹n	”£É\'Ã\0(e.•5cÒÈ^à).“¸Éòşñ{“2íÈKÎ¨Ù½ÑØ*R­¦»*«\r_‚¶»E2çÙî[Î3ù7ynrff&Ô´ÌGÜ!”º´ï!\r\'jGQ¨®†:V•\\Vç\'3¶K9z!7K,EZÛ°p]j¢gÀU-vEq!ãÇø®6{‹Šş$Jÿ\0õ-¸ZZOwEøUXÜºÃ,”ûZÖ-˜Î/§?©:Ç´HSÏ¹Ô¡¶´.*ÚØvjmY^y{š_à\"å½œäh\\‡çpœÄfHa1¢)im¯ãqÄnMÏµZÊì™L+nĞÁsÚ|Û\n\\¸Ø™,ÃH*/aÓ²ÛI±ëZ—iyfWÔ~„c‹:.æØA”\0ó+¦¦´ÒÉìdÈšĞ;@s ùd,³¸´€çP‡Ì£nÑbjnÊÒ[,œÂÒÜz\0h†”Ü6À\ZÇQ~»ÛYjn±Òï±ÎdŞw‹ÌÚ…ÇyÈÌ‚O™¤IB»¢ôÌMãÔÏÙ\\©>‡H}2¤–İ’¯Ìğ÷\ZÜs‚b·é!Ö/¸G^ÄünOìÒ„I°SA\0\n|(\0=ô\0Ÿ\0m\0\0¦€)üh\0^€#¾€\0E¨\0w\n\0,Š\0 È½\0\0ú\0,‹u·ÄĞ:”g<”§şCgÉş%v¯ıUÂïvşãã]ßK¬±×“İøQ½6‡”\nÇTj»YPEh§ÓA65rö¶@=•kXµ*E9É@î*ì¬ÌÛDR¯{Q˜ä‘ò8&°™)!ÉÜn2ƒoµ`¦d7$¬nnÍ˜êJ5º®\"Õ˜ÛâKq‘9³˜—1Ø¼õyÁ¸rRß†Ú]Ä˜‰Š‡î]%	NÄ)\"Û<tÙö_\'>„S$Ä-grç8læ\rŒ Íâ<¡Ùß×ù,$^\ZãFy”%‡µÇJ\n“µ¾‹+¦Õ,vú´:8m¾«eı¾bÎ3ß^\'?·“ˆõÜÇÌ®wH(~½éDykRv¾‡­@=4Ğé[8ª©õ\Zº¹9oòø¿ ù¯8â|ùYØĞ¸óÅñüc8¬ºÚ’ÓñªÜˆ¯4Ó-„¥[Ú^·?”\\nÉE	Uèãä?¯‹&6›{·¦šÆÏÖ}G®SŒğù¯KâxG”eômñ¨[kQ–ÚmAU¬âq³¹bé-Ø“ùH¤ß¼SŸ%+Ø¼+Ú®«Yşÿ\0Êôòßà/eøÒ_+ÌÅšó,²	ş[î$]G©VÕ,¥ëkÖ[DèujşåUˆÿ\0.[Ÿ”–¶\ròLZúzz‰¶›¯øÖ|…Öˆ{ñ¬ªãÆu–Û’PKÏ„ù½0aQ:ËkAõ–k+Õúó.bÑ!¹Éİ¸!GÈoÜ:÷Ö,ø•ÈÕ’Uõ‡Ö’öÇ´õARt.•‹*‚“$‹mø±bË’±Ô}?ªı7ì¿q¬×«J|å.	_\ZRYBFÒ.\rî;ê)fjå²Åan:èm¤¥KY²w-A)=äÑÊ\nÉP¹zœ™Ê3ªSßQéÌq”8ä”´­ƒišiYîâÍ|FUÊCh´¡d›¤}şU)ŒV:ö¥“o“p,‡”}WğÄduQ8ï¢Vw½¹,´áçûœîÓxòrø\"Ğ{‹<q<D¼z$©ÄÄ•7!Ãt†Û\0j¶…tıÁ,5âŸÌ¯FŸzÊÍyÎq8ÜC;œg¡ı?+åqR§ËÖSñéó·*¶…ÅQÏøSújzT®|¬µˆşäwò[>NJÄ@Éµ˜÷97–æ\'ˆb‘É3êÚ¦4{éê­7$Ÿ1×hª\'nÕ½*·4UW¥Ef¦ïeıXîÍNâ¼Æã¸(Lãñ8ö‹q ´z~u©GÌ¥¬ê¥(ÜšÛ|´Ç^52cÇ“5İìå²¯JÊâr¹	OK’Âr€ÛÇn‡¹J°5ŸÖçRØì«	^5ÍgñgÃPäĞJ±jsÔi·@%·P¾Óºİ¢õÒëö]\\nwc¨®§fY¦%DœÛsc+ÓfsmÉn*ˆ\nl<²¤‘zíRÒ¤óY*êáø=‡Â…°áøT”adáR‘F‰Ô$Vƒ\0`\00›öP4@m\0Âj@H4\00šá@ÛßR\0€©64A/™sL7\r‚Ó³¥Æ^[\"â#àp‹u!Ù/¹{—Ş\Z@K]¬\0ë{T¥åìZµvpŠ-Î2œßÊçÑ§ÎÈ^Liy¥e˜Kğà·”µpÛgrÊ¬S{\\ªë¬×ì-”O„mÇ‰:ês‹Üì”nGî—%å)SÈÆc0Ğ\"Giç·uÛîº­ÅV[ºU¶æİI5Ö¦7\\j¾XškfÄG#>ş9•H°ó0Q7&¢­(«ÓHèRÒ6$ß¶‘’‰=\rXìÚ;yößÅ%ñÿ\0mx¨É¶¤f³1ÓšÎî¹WÔÍJV«ÿ\0ğÚE»-\\Lïëp9lYÄ$!ïÓ¥.·&«ë)@Yê³¥I)Hœ±±ÔnTt¨%!=Ğ©iò·ú”(ã;–‘\'5.&;)çB\ZKD¼µ›Zİúü*­$‹Ò[9GîÓÑrù<¦ÀUKçÓS–*6ıZtªÑ4u–È‚¤ÇK-%”Éi!(øU¸É#B[	qç ò7q¥­æşê8‹±óY…É‹ÿ\0ûÚe´:©m~Uº\ZÓ‹m|sWY^G>/\ZÌØˆh£b’,¿PôùR.‹Ö;{mÃ$ä¦0ˆ‘¥-@6îÕ8Múzl¢ÊY=— W?±e±«<öŸØŒ^\' [È\"‰¼…Æı(nÉÚïÑ²z¡»yµGA~§Ôm²FÄíÉ°ğş„± „”Ù@wZßéj‹Ô¥,ä£œÃÚ\\qÉJ§\"”KŸN¢Ø$IJt×áQLºtV şSì–:…³$!™k¶fY$]°\Zúº¦¶aì´ÌÙºéø*&_ä=´äyH2…-µ4U©K¨Ü6ß´¬©*k£\\êê<œ×ÑÏƒm™NIÊ¼UÉôï J•kê:‚‘MTg,¶¿jxßrP|æ`±(_Ë¹Ö–›â•L˜²b¯­lÙÊ©Rgh·œ°¶RŸpè°ï	H 6‘Ö¤Êj\0Ú\n)µ\0§J€Rh\0?…\0S@‘Ùûh\0Z€\0E\0Gm\0Gm\0\0Š\0,Š\0EÊH &*gpÒŸûJÁî·^+voè`ç~Odoc#[eÓò®\rQÚc­%(Mû´ô%êc×!=~ui\"ÖZiHPİĞU[‘´D[™’HY\'KĞ4\ZŞæÔ«3Uï…eÚ÷Û·ÑÄ³Y˜Æs’ÙÌgœl¡™ÚïFÇz»\\e˜¡m¥K°²Á=µµÑÛUtş¦K5LÍÙxüI\rºîS“óm†À£!eqYâ¹¹Ğ¼[°ËpËÑßR’¹2^Py+.„¤¦ÿ\0ªsNJı?™·\n®4¼ş³¿ä†ïÜ´oû§1Áx¬tÌUbøôÜZm‡BÙË¤™Ï1&bJ[Ô´ÚJ#óÛ´ÔäúRªÖ\r>ßn*×ã»_¦Ú!¯ìKMş\'Rñøy.åòiƒ(Xœ¶y†Hy@¨ë%m¶©?\Z³«ÛÁ¯°î­»Ñ~†yoCù¶d?—+!£7Ó”Œv>éj1i•í±Ñ7:êšFX¬FŞ\r.Õ_ÿ\0Ÿ–0¹¯!Îğ.lÏ?1£3Î9*œÉ3Ö¬ÄFÙW ëkÔ.­+;lOi\'D-ü8«—Ûÿ\0ŠÓæCØì^~Nw!ÊÌ9~A˜}n)ÀBÔ§]>u‹ÜöiIºƒkI%T´CŒJ±	Hœñ}ìÜ°N£´\nÉ[r)G”†ÑpJıbãˆªt¸\Z€`¬–q4¼æ¨¹J.}4ßò÷V+¢–cåŞTƒt)6¹Mº¦Õ“ §¡$ÃÉ¢N!¸šºêRèµ¿ézË’ÏŒkY|a~¶\Z<ëèŞÛŒ¦Êksj)&Ç¥í})uzIFõ\Z\\ÖJ2-GÇ±-1]/%hmä¯c‹F£Ì€®Æ—m\\HLL¸S19	Jq,¸ìwOªÒ”57óŞÚÒÚue–¢±ÅÃÏ7ˆN.ÈÌdKÍÍÄ$]M¾•6\Z]+GMzéZkUxã«~\nóu™Øš~Ø9K|{ÈÃ¿!P—ÉbˆñaDØ‹.´ú7¤xÖş†GKi£Í	íÖTú#¡Kâr¹ÊJ¤™rå¼RâFÔ¬æHp“¯¦‹íì½ÍwiÕ¶{o«ü7ù—mcP”%ø+Üìè‰Šc\rtH®Ì–Ş.FRı×Rƒa×U©Cbà¨ö\næê‰ù‰Ñ¦®í8‰!ÎJâ¾Ñpôb¢e¦ãoDÌ£ê®O î®ºÚ#i:&×ĞÙZol]||jÿ\0?VUW\'k\';(—¢)/3ås¹¥I\\—‰¹Va\n±Iı*=ÿ\0\nå»rÕšQSD$`çÏvsqäEû7ê\"$:ñiZø\nv=KÛbSs*WÓÆaòàêm¢ÉiI*:yVÒ¶áO’G;;J²[Èñ“$X‰\0&+HlÓÊ\r«ÓÒ©$xÛÛ“lò“MEB\rX«\0EIFOA5 ç†Ğ\0Âh\0a4\0`Ov”\00Ÿ\n\0Únú¶¤„üè MH\Z¹NjÇ1qÈdÑåã`<ái·ä%\n-´·\0%!J°$\rJøÅ?p~éò/ûˆœ›xÆ9!d·‡NfÈeˆr¾´6óM´€¢¶ÛBB\nˆ&êÜnMm§·¼•›8^ƒŞEE+‡¾éóŞSÊæñÙyÜ![øÌ<sôˆ)–Tòƒjyä8V’·À­½n¦*×’Zúˆy,Ü\Zœ¥–ñ¹À(AvvDúˆQÔSHDhìé¦Ô¥!Åÿ\0\n_Fš$ª,pónyÇøœ×)3Ç-¡©SÔ©â{†Ä©JğŸ±_·FÍ¬ìÏ¡lDTEO¦Ûa\r+Iè \Z|+ËÄ³KT½ÛRƒSñî«â&Èt-ĞTl„hE¡=éª¼¤„XPª4ü£QQ*Û`~u1¤Usùêä—qì®í¶79æò$¥ÿ\0¶ªÔ›°ã‚ˆg²£!’”¦”ÃkRR¤êGU_Æ˜±šy!™+öŞ§ˆ;É`¥’{¯¸½MC¨–È¿)ê§¡JµÂT{/Ú)©B÷&lxcåãâqÈR™E¾ªF»[OMMaì]Q\r¢Ÿ‘ÖkıŸÂp¼lvbEK’ö\0üÅ¤¬‘®½ß\nåÙ;9ké[Ç–[²FĞ,u;\r\\ÛjóßQİK²eêÈ¶~5‡Ö¤¬\'Í­ª‘#¹\rŸ·ˆË°â#€…¬;¯L®ö*òÆå3ûãS#á¢JÊÂSœ“ŠºœFV.Ë™¸ÉZ Ëoø–Ë‰-’;½oÂåCÜÇ›y[=¼Ô6ÖólÊJ[h\nŠÆÓ~ıƒ¶¶U82¶“,Û[ç)Ï¸TpçÓ+5ÊñÎÈrûBXa.•¨›ù¾¿Ú”¦é¶”lïTßY\nmÄ¸áQeJAH*\\·Qnµ¾¶”rÚi¶½4%	ü©\0õï«ÁPDZ† \0m½\0Jt©@SPe?…@‘j\0…\0SøP\0 Èÿ\0e\0E¨\0vĞj\0Z‡m\0k>ëqÚ[Î«km‹¨ŸØÇ²«{ª©e©WwÅn6a…Ë|Éy6qóù?„‰ùW™ìfynìzL¾ÕGŒDì·šÚÕjK6Öî‚Õy(hI{ÓBh¢K$2²’²@$“U‘ÕHoÀ€Œ–c	öKìI˜Ò$5¦­…nX=– oF=o_™{ÛøÏšAÎó/x½Ë;Xùø¾FÏÁeğo>È‘$(==—ñk}¢˜î¶¶÷hç¦6îãUÕ••Sz½C\ZcMúN¿ÃRWÉğ^=ízÀàlÌw)Á»Š•†ú×SW®KŒM˜p””Úö)6 <Ö«W*£iz\"Ôå™\'m›™şˆ‚!LäøŒ<HüqŒ·!æPä<ÜL\"\\jc¹Ö¦-.Ì<rmhi½ÉK­ØªÉQÙæªÑ×%Ú~wøJ·õB¯¯ş1·şDUí:ãÀæ•øÆÈcâGD¶eLIƒé*JÛ\nQn\Z]cÓŒ—@\nIó¡	$tÛ’² ßØ5ÿ\0_ç®¤Õ•ÉñÈ9Şu>fE~¾>ÔbW±}yF¥En;‘c›¨!ÂÚ	İ±jêzä¦_È§×jUFï_”=ÈŸİ#É}ÄåOó÷poª4ö›ŠTÙ.²£‡m\'T%\"Ö½ûiYum¥¡«©Z`ÇöçUıFóZ6>®*Æ>X}’’ƒÓM½5¬—¬¡ï#˜ó *\"¯“˜äñ·ùf*\n›%$_ÄVK¨!Ú@E‘”¡¤2ãaÂ¥µ•¯æ-Xò\"ƒ™JRv#ê)nCI¸ìµíĞø\ZÉt)±é€ãíµ?\'\'èÛu’4Ó]ÊnzXV<•Q\"[\0ÌwcYïP%#VûÏëÚuõ)R`e¦ğø˜Øæ–\\-·ê>ñê¥/ÌOÌ)vQ§ ½ÜŒü#(Ís¾;Ï3.NcÖIèBœH£­^yj¾%3Û6Æ¿»8fYåü¢TÇ¤äÅ!èÉÕI(°*JGé$u«öé,×©{ıŸB-ÆÍ™‹—%–¸Y.¡ør¢´¥Bı Òñ7V¬´huâÊ\ZĞÖFZ{9vòâSˆÉµ0MúËùËáÏWÔvîÖK>Sä!Dx;í¸	æ\\É±«d»“Š¶%İ&ÌÈl–Ş\0pJµ·wZõ}lÎØù/\'ôU¿àıÃÂÊÌF@”¯]1Û-¥5$©DªYëXûµµg_¯™-Sóy±çB[®¡‰úfÖµ/fÓ{$@ĞvR*µ7«¦…¼[!”zÛq®šÚÔú¦ÈyQb¸_·éÂÄ¾‹¬‹…õµ‡tpââ¤Á›±ÉÂqì.o5ÂÆ++j4YMŞàUíò­=JóÊŒ]ÛñÂÉáB½\n<ĞJ…]¤…YGX†OÀ|«IÍ	ùP€wP\0Âh\0À>t\0-¾4\0 Ÿ\ncR\0€ €A?*·Æ¤sî›öçÙ/s¹z$ª¼~L|L”h±>j~– OˆuĞ~ş®/¹’µø•³„|ÔàÏOÅ0ëªB™—™:¨•”¼Ä57½Ï}z{UAT™#e±iä.Kiò÷Ëä!N*wş\\HuØ‹Ø®¢ám‘~¤VWÿ\0^«Ê4c\\ÚL?Üêç^‘-ÄúÙĞå²éH\rLŒÛÄ!!JİD:ëRñQq—‡ÿ\0şÕ?›äÙ?w²Ôpüj:°üaÅ‹².£l—SŞYlmİüKÿ\0\rq½ã2Ic[ù5uëäëºSéí	±t®\n¨æaÂRóßS\0!ºµ\'Rzš ™çNDD,n@ƒV‚?šrt²Ó©\0HëĞÕø\r¢Ôç÷¸\\±Ìô©01Ï«úkk?Pâ	÷šÔÎú}1Fæ´ô\"ŸUlyuìµYÒAX!×wØ^ç®´·BÒ52jK‰¿[‘ğ4*liâñ²s9xğ!7êÈ}vGrS}T¿\0557\\T•İÁÖ·Ÿoâq~7äµyY+¸ãªbßa?ïjk…Ü¬hÙAs1QP€:ÙJ­dMíÛÍ¡´Û´~jc¬å$wÚ ³¦„Ö{£V2&É,!D“k+CYÍ)H^4!(Ü,N ÿ\0ehÃrÓI\Z?sÜ rÏkÓË°Œ¹pH~:\n‡ÕÂ\n}•m±ì²ÕÑi/©xÜÃG««ó±ó¯7&´gr€&SÈKnh ²‘¼€,võ°­ğ·[lÚpÉ’!—Çñ˜„ãæ;(KìHaEH\rZé#Q®ëR8Í¤Ğ¬¸¤t3í·î»âçã1üµÔæàdÛKqÀ’Bt%§P}5+QùÓ¯KŠµ2:=EdÀ¯]7;‹ÉCÌcâd >$ÅœØu‡Ò,¸\\\\Aï·ÕœÖ£st¤T°Gûj@ºĞ\0îª°\"ô\0QN´0\0G]5¨\0¢;¨\0²š\0,¦€\n#º€\"Ô\0Z…\0¯(%FÉ$÷ÛCõa°ÎÈ¾g¼Ú:GA%\rv?R¼Oeyşïmİñ[şŸWí©{ŠPÚÚm6zÄ–[{nšwn«¢€”²®¶Ó¶¥2 N”²R«Ÿ‡Æ‚Éù–*$\\×ıUVÆ¤ÆôşuàJw#?™Ê=\'”ã…ŒÛîE[1Vó’S®6†ÒÓIRÒT0	êkWU}Mú!y©k%TÖ­nsêI—ÉıÁöç9Ágæyo!æ.ä<ºDEù8Æ›sëîY¶K_^ƒ½	[m”µt§zoZqâ·)»ù«ÇehIFŸ\Zz2mã~êqwµpÈ9¹è0°_LÆvtÈÌçr%µÄ‡=9\r-á\0¸¯3n.ö SÜîSìİä„£_É§“KÙÎŸ€VW—çœËàc+•ó7’f¦\\õ\Zemã–ÜÚRêÖµÍÀ( ‹(Ùã­uHwc4¦•T=Súÿ\0/s_kä{[Íc¿Ã2Y	j‚ê3øÌL}Ê’û>PXD]>«L6J\n\\P+)±½K¼ît°ö?ÈÇõ¥èßúüI¿/Á*çéÏ1<@Î4‰ØéÔ‡\\´<˜Ò.‚nEÃkÖı-Ùªcêfjçá…V<ïòİ~i‹ÙOoùcÛ_Ë¥İ+	Ù–%ÖãFÊäµ©“5K~ºv­J	VĞ¥•érj·R¥n*™éLĞ´ÆßŸáèBşëñÉC1,ıì–‰Š„éRÒ™$:Ú«*Ú”ßÀ\Zçö+:=,“Fß‡üM¼^dÅ3\"²d¶’PòÛ¹Ùn Ú°Ù7©²ÖKF7_ÇÈú¨²YHim^Òãàt×¾²\\«kaÑ§b;ëãõmÍ.0n´%C±HïÅY2¨ÕyÔî?Ñtx»ÙÅ?“Ê‘¹¶Ô#³q`Pó«Äô¬—Zi«ÿ\0€•rI™¶ÄhÍ¬)Ee!`+¨JMî47éX¯Wä«kÀğÈJ%¥«@¥İÓä)rBP†÷”ÜNcı]ğ=<j½T“üM ”î\"™Ó|rrôÙSHõ>âæW38ü˜Ï­2BÖµ¼ƒb}RT¡à›“jœîm>HÃXDT©A	Z\\Ô•6¡¨7ê\r.¨tÉ®¹J²¢à¹J.Ağ·[Óª¤´Áo~×y\\î3##Ä³S\Zf\' êğĞJœiô úŠrÚ :”ùAÕJ×èduú[ßck¾I…ä	m9¸Xlm=IYĞğí®£\\Œõ|HÑşÔìË†¿ÉÀJÔ…ŸÖéĞ‘à.u¬ËØÛ\\ñ_˜÷ÀpFc8§ÖÖËØG…kÃ‰ÉÙ‘s‘K‰€¦ƒ‰M“ğëZ2YU@¼uvr2½·‰õÙ\\¾uBèØGø7U¾B¶{v=]Œ^é—EB^PîéÙ]„q‚T*È€•\n²\0…\'¸iVÀ„Ö£˜;h\0Àš\0M\0ê\0\Zõ©\0`|ª@M\0iî© Ú·KÚ¦\0æŸşJ9W$Åğßl8Œ\ZC˜å\'Iä“‡¬©x´¶a°SØĞ-dÛUm¿JëûF:»ZÏu·æRÛ£ĞğRİÉ2Ö5»Ëgk¯ìCm¶«‡X:~ßv-t–£+ø%ÅˆÊÍe~fAÌJyüÂ×µOÖQn tİtöŞÚÆå©ocUk\Z!§Ê0™	S°PY|OÍfQÇšnîÔ^TfÂË¹)7ü¦­F’oÂÕ•i7Ğw´¾Şã=¨öóˆpPÇ·Ké\07Ë}Vå×”£~êñ9ò¼Ùß“¢«ÅA&­É½µÖÔ¤Š°¨R5¾¦¥\"ÖJ[QZQR‚m.jÊ ˆ•s6âzÈ,Ü“p,\0½É=\0¦V¾ƒdæÏ¼~ş¹È/Âå‰İ’†s|‰»ìZ7YlE#¨Uˆ[ƒKhúêõú0¹_ô#îCŠ„Gˆ‚R‹!HGv”‹#jØleR^)†Ô%¡qK¨ŒÒ–¢7Ëz¯	#‘e²®>úaÃBäK­°Û÷÷\njÄ–¬[´²Ğû?íº±pÑ6zC¹lºĞÚ×kì6ÚëW+·š\\-8é\nNœñ(ŒÄVP6·´¡\"İ€\\{)&Ì™ )-¡ MZš²jt’¤›iØ-Eœ•­Hï6èÔîµæš\"ä2ÂîÓb/jËfj©ãrŠLÃ¹WP:N+j„ë…È¢v9È6»J=7™:…,A ÚºØÜ¨9™9>>êı¶>ÛûÅšÇÄ`JÈIqØj\0Øâš_jÓó´õ¯5u~İšıJŞ¤]&b™ÍEo&Âš(v©jSBäèRI¸§qĞR¶¤æ÷ä˜5Šæ±GÖ`TøR\'3äu—Sau¤iÔqğ4‰Ílu«ì‹ŞµrÎ(çÍäôük Â.(©·‰H6;B“k~;ë_^ÚC0öh¦QĞQ}·?…jF@;\n\0)ÿ\0eH‘@\0) Ôš«\0µ\'ñ¢\0(¦ Èüh\0¢(\0²(\0²:š\0%I ‘*ùœ6ï½ß;öìlt3û+?\nñ[³wC;r~¥2AMÇú«Ï³»ToµÓmìMïßğ©!‡t·Ml/ÛRˆ<V@=@©\"÷İÒÖ\'Z‚énÙÅ¯Æ„5\"ä|\rîŸ-kÈœÅå0kô¶øú’ÆI3&­ØIuø®´£E§\Zqƒmıo]­>‰õ›+Ç¶ÿ\0âD|Ÿ\rÆşØñ™”¿î‡)‡Ü(İ‹ÄxÜfÚš28¯LÊ—Õzˆ…äID\rÈn(­iŒÅË²ÔU}>^Ğı}Y+Ú>$¾]îZ6gŒæ2°Î##Ny‡2mF•7e>œœ3¶BS!Õ+k‚÷_¥·Ìv–-\r‹³n5PÒ×m<ø{iıÉ_•eù7Á‡s«Àpÿ\0öúòÖn/ô9or5În+seöÒøHm{Ô•$•¥&şCRµOò)†•µ´«³˜Råq‰A/7Åó­óé‘¼DyüyÌÌ7¸ï+jAZæbdâP†dÇ[Šp–\ZqJO =0¡³¶ë¹§j¼j³¬9^vùü|i3\'Çòœ¶;)¬Æ:F.[3V¹\".éŒ³\ZËEŸ_œ!D);¬Ö’÷#\n®J´ÓÑÎŸ¦¿‹ìLps|”û….Ks^ËàÕŠ9ÇBÛÆämM®$¥°‡JÙm­	BS¸n7ªCßñóßxëO¶´‡1åz¯ÌE÷|ª\'ãèæ¸†±œÑ>L‰L¹½3\\ snç= ,Üv‹wÖÒi©4ô¸Z–àåiùiøÔ\\ÆJÁçß\\	ª‡+¾Lxä]¿Ìn‚u\ZX|Á¦í:ê¶9‡c®c¬LBCª]Â‘ $ö§¸ßû«&U+¶€±²}¦Aõ”¤ª3â×;4Ú@øu¬7!¢lÀò“ÏÊlmy“å¹²ºÒ,äE”\n‚ƒ\0’¥•ë®‚õ“\"*3å¡jJ»¿ÕYmP, Åg2è6QRP’;úš¶*èØœšÁ>ËæL|ƒ¶â%<çòºÙMéµwÓQ­_ƒÑ”Ÿ%>²çæŞAZm·­U!Óäi-@’ÃŠe/2õ@$v”¨t5¥VÌ’†)éÉŸ‘‰`câÄyš’İŠŞq?‘W:yuÔÓ©)¢ú5©Ó!¬ö“`„¢lpéeû\\¶×¸ë`­ÕÜÄ§_S—“épÇ¤\\]ä6â›Km·k\'³ËĞİZéIsà]²@½-öa°§O[\\Zİiî*¤Š¦Ê±Ï3ÏŸômQ!GwãjÃË••+Æ¤ÏÁ1ìã¸¶1\r™i2^_ñ-fß€Â½R±o»~YXêU«a Š\n\"¬@Yd²µœĞÀ(\0`wP\0‚h\0Í¦€aR\0öÔ€0;…I\0‚{è\0@êº\0[tî©’ÿ\0ù\ZÈ»’÷Ú)îV?(úo \\ùIm$ÿ\0Á¶»~Ô¸â½Ÿ¬~…U]¯>åÊg\ZÒ A;•\"É‘$\\zŠíZ¿Â:zÖ¾.îY½}*“.SRƒ>–\Zl\"J\\CjØtòt\0÷Õ’‰jK[ösÂÚå~ôa¦šo	Àâ=T[BÛ‰W§\'hşbÂ¼JErıÛ3¦ëm?¸Ì8Ô¨$\'`Ú4äÍ3\'½r¥é¡P©H«	Ÿ)¸Q]âì:Ó+ÊÇÎ¹òÜyÄE;\ZH)İÒçÃıtÅCMqFç\Zşå¾äò<Ã!/…ğœ‹‘øÔWÖw.ÂŠW’q\'ÌÃj!„	ÎÃ×Ö{g´ªWî]kãáş§3¹Ú—Â»\rn¹1â=¸8²„)\nèùmğ\"Õ•Å³G^³À! î>’JtğÁ¶çQ-&YZÀ¾ÓzejCD_™¦¬ÇŒ:è§eéÕªZŠjISÚÏl[D†òRÚ/H^¡å‹ÛáİX;YüÇH.wÃ…fqñÒ€\Z€‚ù¥Ï•#ã©®.F>t-¾	I¤’{ë+Ç’\\! _@*‚š4ßrÉÔÔ6JDu’W­Í´Ô‹¢ >Q<à(Û­d¶¦ª\"-g\'éMkß¶¦šºĞ˜¸ÎfË®ÖµÈ­øîÑƒ-$ªu×Ë÷[’cq8°Ï\'Ì%…ñ¥È)m·g°N¨€ß®•l\nV[o¦£_^ßö|Ì¹kÿ\0WÈå/(Æd°™´á3¬K…šã²•+cM\":Ú!~’Ú7üD^úõ\ZW@ç2W‹înYŞœŒ¯ûr;ÊÈg±ács—ƒ‰-nµ•©¾ºi¥%ÔĞ¬‹öJŒç&÷wŒcq×mØÒ.zÂˆˆ……¼U°j[Jn	6ìíÌu†/-¾™>¡»ê²u\'·¾¶¦sÍ’*@,Æ€\0Sáó Ê{è\0µ& ”;*‘şÚ€\n#ñ©€PğÖ†DT\0Z…\0áKh[‹PKm‚¥+¸\rOì¡¸%)p4#)ÉO=5ÄÛÖW‘=È\Z%?…yŞÆO¹y=KR6İnÊöè-Yô\nµ‡yòš	6ÛoK”ß´U‘\0VŸ–Öë@\r‰ÓJ&öğı•VàjBÓ[AÒ]‘-ÖãÆduRİVĞ?“Ü*Ù¤¼IWV.ñ>;†d?\n³iŒ!å30™ôÕ%¶Şqä…®Ák–U¯ê$ö×k8¤^\\œÛb¹Ü?’òG¸üM8è³q<¯+‘de4Ñxac½!¦ÜZJ¶©ÀÈIóß]/M[ëä­U•§TãæUÎsîvQÜŒ/p2”ªìiÌ\\¯Ñ‡’~)õ½ô$7¹¥„¡JÚ6\Z”´:8[ÿ\0(u3»~Tü·ºÜ1îÓâ,yˆ˜”ÅÁæ\\ô%Ä“’iâ$Á˜ámkBçPSo2MÍ¶\n.-“ÔìW\\Ó‰ÕlãÕ~pI9>;Å°˜,n=œlV#ÄÇ°¥-¦Ú@-¡J$”¥D„ÜôªÜV,×m¹ldrl¸Ç¸Pã/9DœÆ\r…?1Å9é´ã…·\n]i*	qµ)	I:R®¤Ó‡·|/éz=È_‰¼todù&5ÄeLT¹c1ƒp!·ìˆ@B@C7ô• JÏæM)ıZL3fHÇÿ\0}R²ÒSı%~{ß¸|d<F7ÚØğ·¥œ[c™qÕ©×T„4›¸²T¢J.I7½dî­Š{E­’|êEnÁ˜Æ²—[y‹*;‰±($XŸŸh®m™Òz÷•Ä‘{¬ÊO–à‡’,GğÃÙÖ³]ò.–‚D‰FDˆKfíÏuhlM‚İ\n\08‘Ş±©ñ¬™\nÁ+c)ŒüFĞ€_’Ë<‘`•¥¨÷+%–¢¬´%…!·IU×ê\0¡~â.\r&èPÙÉ©˜¬<ëš%´•¤µ\01ÜB¿¡!å*c®<¯ĞTÒŸH‹½H?4]$”-A—”}Fïdî\ZiÜHÒ¢Õ&°jÃŠÃŠó •‘¢­£ämW¥A±ZV-!im«$y™*Öİà›^ŸÄ„HÜ&d/LàiL¸ÚÔüGË€”‚?˜ª±=ú|@­ë:´Ôè¯±—ÿ\0i\"+ËK«‰’Û.\'T©¥%$¤÷×®ÇVŸJüÎ_jß\\¯BxLBJSµ	67![•t2r\Zœ’+ßNáÜ \rì?ÙIÌX/©WóÔç^Pò‹ØöŞ³Q97Şò‹ÆZ,ñÜdX¦dÿ\0Ä7~úô½uG˜ì9Éf,šĞ„¨T€A EXÊ¶Ği\0`Ou\0&€¶¥\005µHÔ\00š±\0‚GÆ¤¥?*”µ°Ü:TÄï¾±È}Árâ¬.LL>\'ÃC-5È|ŞVøMwº+ş”¼Kcp×wçúk’æãàJ±±[ú¼£`Û$$vnQï\'ZéaÂòjôC2dTÓÈÀÍHÍÁ˜¨y™‹a·ØmHT[ìh¾ão&ÄÛ~ ÖÌX¨Ô¤fÉ’òu«ÿ\0\ZÜ9ügçœârıy\\—0Ö\'0¨¯Ô‹oÔqH\'ªTëöÿ\0†¼‡ÿ\0K•<Õ¢ğ§õ:}$şÜ³¦JVÔ;}y´,×õ6\\“¯a5%`‹ùï!RÛşŸôy_·]i´¬¥`çgİ.‘Æ}ºÎ¸ŞC(–ñPÖ…mZW(íqI#PCaDW_Û0,¹’{-C;uÄÙÇ¹PTÃiµziÓUÀàe{Š´ÎÆÑ`=˜Ÿõ+j\nÕ¤QI$õJícã\\oqÇ\Zn›’î=-)‰d,nZH,A^s§Zœ˜ÛØ%Fåfæ®Š4iaği•1#Ó¸*?:¦KB\"µ-OÄ·\"v¤¡5ÇÍic&>H–±w$¸:%=?¾±]“mc±¬ÙO€–!ŠšëØª²Ù á{Õ\Z%G%’@p€iYòÆŠíÉ¤’µ“cÔ^²·©ª¤Fì…™[»ÕÙı•tK$Lå\0IékvÚŸFgº^ğä¤Gcˆ«ÌÁÊflCÛ¾:ÒâuÖÚ§º´c´Y3=«5håW»Ü“şø÷ƒÜşLY\\4ç¹Dì„x®/zšeÒˆ+U‰Ú‘`kµ3Y8‰C«\n4¬„¥µ)%¨8„!7QØ.«”¤\\ŸÄÔY¤†$ÙÓdx¯4ûQå|[ÜÉËÇrojy#1>äfq.%ÔÃk6”»Ä<A+m£´¬¤HI\"¢©Õ¦Vÿ\0ZuGl¢·é0È&á ZÂÉ ô\"¶-Œ&È¹µªÀÊ\0,ú\0\0Y¶€\n#²¢\0)Bˆ\0²(òD~5È¨\0’?\n\0lçäùZÆ¶näŸ<Ÿğ´“ ÿ\0ˆÙX;ù¸×Šİ†kr{#[\r ;4®1Øf³ë\ZÛ^ËRÙzƒŒ‚³o˜¨ª’l-!­Ø‹›ScAS¨ßÉ?é¡Fö°ª1•D;ÈóÈafËéHÉcf*\Z2÷%æ	ÄD*yÌTÈSm›ªIô’âÕÑ)J7êOm…ièW•çĞWè¢ø–EÆˆÛl2â_Rg]Gå*íµvF¬fûŸÊağnù—)™«‹Æ¸6c’•LS’m¯Cv~£¢Äş^ºÚ¥ëãy2V«ËòU®ß\Zö{{mÁó¼“½Íçãeb¢{¶\n¥ãåœ«‚c©uĞŸQÒ’„¶Túw4ü\ZÕşG\'<øíueÆg4üFå…GÀÂÈEÉÄ„¸nCW«w\\f]	q¿XDl¡’áCªIYMíğ¢L«-š‡ş¿®æÆm äg­Š\rÁëK±|Nßˆß¤íÁÕIJ¶üEPk#ŒGÏa}Ãç\\Ş7#C­r7a»ˆÁ¾Ù\\p†Y\rº—Éº»¨SzÖà‘Ki©f»ç¥±S®Ó,`}Çfd¿à¿Ô0ò±G™ :·À\\u‚fJ–à ô6PíH¬=ÆÜ\Zı§\ZNğçñèCPóÑ#2ÙvkM4\0!JX{»ë›ftİ3Îcsq“ôÍúëd”¦@îQè\0¹#NÚÍ}	­Z\\êW>bÇD¹,¾¡\r§d€JJ‰şµ›\'À«Eã|z\\RîC!(ÍÉÊl6·,Û\r\rBzh{«7ˆ›±ØêÃh	OD$áHh\\¯.šµ°˜mêä·ÊR:Ä^—u:”jng#&3 §_¥d ÷]\"êıµ¥Ò41­u!<î%sb?´íSkŞÚ¼GAóª<rY8cf§âKÍ#…i¾ÛvŸ…Z´„\rzü7$ Jh$„¸@°ó\\Òã§}3‰d96£Íšôv”¸¸Å—²­ªÚ’ÓÖÄ’mqM¥@êŸÚü§åq	ˆqß¨r$õ¹qù]ÊÒqÚ¡]®§íù3İıËäZ”¢Í¤Û[uøë[R0ÈÕä‡lÉê¯(Ğ_^Ú^E(~-ÊÇÌwóØVVµ7ÓTX(-†`AfÖô£2’<B^“\ZŠ£Îdsfş!ôÂ€\rJ\0¥• j@°àVãšm@µ\0Ê\00\nH	î©‚€;jÀ\'¸T€0(@ ÚÃ´ôí>:83÷;9§¾à½Õ˜µÜ<“4è7·¢–Ú°ù§Jô=J¿³TkÆÒ¯äsÌT¬Ì÷P‚§Ì¥¤9}T	µ•ß§}zl4ãEé;-¦ÍüGÙ¦~3©H+Êà­?­ÆĞJÚI=¤h.”ágé¸Ë¹Hú%ûhàgÛe}¸âo4Ô¼Âÿ\0çO&\\’|Bİ)ùWÌıÏ±şGf÷ñ?Áhw±Ó†5Ruq}Gua€\'Éô™QIómòÕ’%y¤3\nCËœp•)]ºöVŠŒZœ˜û¼äM;–ã]L ÈÈ¼”‘¡e¢A#°«¶½7²áÒ×ü…vì”\"–ÌvÒP¶®Ñ%\ZÀÚ»ª¶[œ=Í¾‘oÈ}—ÏÓº}†„¦çKƒ¨Ö©Ù¯Ü¤A|)RÛ—‡“LÆ\ZR–¹#P|+ÍeÅëVÒ…GÖ\nv¤ƒsşÚL\\;½Ô/nšV<ö.‹#‹Æ‘	M/\\œŒ”µ%.+\"Dv@H$şÊÈÃ&Äá¶ì—c1°¢@&ÿ\0\Z¨\rÜ£¶Iëj¥‹Õç$zèpŞç¥¾5–æš\"½òWA+®ºšÎÇ©\"Å^ë}t5t}á¼ˆ—Oôñ§TM†§¸*Dæ˜€«æîÛvkL¨¤SòÎ6¸<÷‘AxÚéÊ„å¬D¤İ­·ÓR›]¼wúÇË22ğı„ŒG÷Ó==>FF?ŠJ‹\ni/zó¤8Êv—@*kr~Â«éSF¦X¼Éñ…àœ3|c\'çøµ¯orâ\\ã5’û‡Æ\ZIv?LY&Sñ™xzn2Ú’uI\Zmİa+÷q^CD¹¿`Úi¦ÛBn;QÜn…m9áöQğ†¤ß­\0\0\n\0,Š\0,Û@ÿ\0¶€\nP4\0Yç@‘U`Gm@:¤4‡uA-6’·{Éü(m%,”¥Â0Ü\\ù/ä*­ÈIÔ¡ |‡_×Ï—î]³ÑáÅö¨ª,º¤†“¦§³¶’Æ#AV]ÍíÒÉµ.Ã**AkR¥~oßVª)vlI”†¢M®:ÕÙTˆ¯“æÚe—<àëI½¡\ZqÒJŸÎyƒ™•1ù)a†[’R¼¨Jz“Yœ·¡ÓÇX%¶=É2œï3Ì9%¬_,[JÃcĞà-*+BÍ­[ª>=.k±ÖÄñÖG¸fV²KÁmš`·µ;JEºÊÚt›k\0£Ím§ P¸ğ7í©\"kQ	UıMMúÔŒ¨‚ú|ªèN¶¿~•#ª%ÏH[kHM÷ „›~Ú«MÆéFÕ¥Cô%\"ÃÀZ¨ÇHp)$ è‚	FI[şé˜ÇiKÇç?–uW™Øê	Ó¡\"İµ‡¹ûWÌê{<}Û|Wõ)cm/0\'ç2Juõ¿2JÇ ƒ}PÚlJˆéå¹W;íøBÉÇãŒ¸ø§\\’æĞ–½BÂ5>:ø\nE›7äwûqÅ¾c™ÇÛM\ng¼_zÕå[¢ıƒ[V[\nÈô‚aZïbzô†!¡ZÈ\n½ûmJ²\"X§/Ìñ,*åˆ;æI\' KbúüM…©Êè®Wb¶d—ŞyÕkåQ¿Æç÷V2Ì‹DF³Ú	Ç<¯ãZí&:dw)‡~™ozKy‘u¼„õØF¤|(àÉDpøİ\'c[Ô‡H	*v•j×RZ¹¯¼Ş\nA{1¹`&å{\\ İ–æªAØ_µ¬TxkŒ€†ŸøA«Ò\r·¼ÒJ+©Ò¬SæÙÇïÛëü‹:¤y@·Æ·A1“Êİ:’M‚osJÈ?ÔªÙ…œ—\"ƒ­)¦Áø¨^²Ñ;]#¡gÃÏå ¿pÒ½*GšnBÕáS\0©\0\n± $\n’o9ÀÀ½@øT\00*P\0T€0›Ñ	«\0 š”€~ \n\0HU¯·_ñz\0ùèû¤ŒŒo¼~í³AK8îS:<†\n‹Šõ&R\\$ëb§<4êúJqÕú¤;ô‚‘ÈÅH‘=Ùq£¶÷Ô/pp)!!J;î|ºwŠîS\"ãË|nt\'_`½¼àû±À¸[‰úØfrr|…äÍ¦$>à*\Zdlù×?İ;?c¯|›iæÍ]l\\®«ãsè®0ÚĞU¶nóm\Z[ÀxZ¾dÕ·\nyĞwviÖ¬D\rùD¸àùE^¤½£ÜŠcÁu\0„¤$€kF4[ç>åù2²şíåC”ŒxĞZ*?ÊZ’ŸYÄ“ØB—^óÙğğë&ÿ\0å©ÍïZrÇ¡\n:ápzn‚´İ7és®¿ê­ñ–ÂS‹-)\n\n³ˆ!A}ö=©á¡µ-o¶Ü­s¢2ÒÜÆ’²5ù×¹ƒ‹:˜2I>cÊ¥>Úo¸\\lŠ\rˆ²Ü\r»ÒW§q¥qûÔb,| ÊAO`®uÙ+qÙÅ\nœ³Ô6ñ4†W&Ä°…€-ãKb íN¿:«dÀÔÊ¼v(î:Ú•f^¨‡9U’«vÖ\\ŒÓB\0äkK\'^µœrZÀ¤XëqzuHcë\Z –J•åJPw(÷\'ZmDX†¹&tÍ™)lëQ-±·ScåÄ ª /¹>æíVu§„—ò¸`Éy)Ó/Ôi\ZŸ,Úèá¿Òs³~ğ¯`xfSŸdò°azÎÏËiDqüã›]Üÿ\0ôÔ]Û;G™Ù*\r¤vƒ­^µVp.ïŠ“²À{G‹à.ÈJq§e£\"B#q¯ê§%/$äò3Ô”‰òJŸQ¯ä²‹¡*RüXàçfÈïò-kL¡—@?\"N¤İM>áöì\"Õ \0z\0\0Y:\0(Š\0-B€#öPD^€	Píª°#»·² —+–\Z†Ô+Ï‘rÊ¯¢‹~&Â±w²ğÇY»¡‡åì„ø)\r2Mík~İOá\\:¶e×I¸)ò*% ºˆèzÊ„¤³ĞSC¾šC×^•t-ê4óY`Òum\0\Z­œ¥d­|ã“ºÒnGåuí¬¶rt1T¬XH9v¹¼<r4ìnJerOj™M €â<B/­¿Umë`©¢;ÕTIÕ>;ƒÄà1‘qø(iÄ@e#ÓÇ±£m›juøWI(ØáZîÏQÆ•8E•eöñW©CVL”‹ uÛsV,šçšÿ\0âè*Qt&H	¶½Ÿ›Â¤eDGÁ>_á\Z|\rPuDG@Û \"ªÇ#QÅm)QÓo])VˆŸŞìıÅíæI¦Éõ±/7’d\rI\rİ·ÉW¬µ4ù½ºü3/…wJS¦,\\lÜ›úlu^šH	Z‰$\\‹3Òòø’7á4{9$-¤ÙIÃÆ6gw{®\0’¯€¬ïâg½ı#‡\0B\0J”‹%!#@‘Ø+=˜†ƒÉn{iM*r€B¯Ôè/ãUâ$q‡ÿ\0úLÙ.8ŒtE–M–á2?\nv\nnÌ½—ªF¦LNJ­å ì\0ü)¼EÎp)¼s-ö¸÷O÷Rj]K-ÆNíqÙ(i[_’ÃDv¨û*Í}$W[ôÉ¸©jF9i}¶Úsa}¤Rí¾€\\u4R²1î.Ì–NZ2ŞSl6¦’«X”\0ë¡$üjÖĞ+S±>Äc¦{qÄÚ(\\¸bc£¥Œ•±UÚëWÈóİËNFMN_³¶´3-H“šÌ\rÆxß¢N¦³eÑ0WR¿ğ–†SEZ…Ó.I7×T\r?it©Ë\"cûÖã‰üKOi5ŞƒÏ\'CD\0Y\'J@4bÀü+yÎ Ğ\0À·Æ€}H\0{jQ\0Àî©\0`Z¤z\0&âß\Z\0ù½ûšæx×¾ã}æËàò0³XL—\"“ô;c	i¤9±æÉJ†ô(nB\r{~–úôVPãôLœ_æW¬#Ï•A=	R HZY•©J•fŞOq\nÕÆõÜ*Ûcª`¾Õ7Ÿ÷BcJSÜg€qá´ıw¤­6*[À&ã±¯ÿ\0Òw]ï\\+Æ¯çãø^¦åêt¥Â¢æâ×ïø×™HĞ#>»]$ØÊ²,%Ip%²²zwŠbE,Ê¹îÆ}¨±e¸ë›\Za\n[šôBA*? \rmÃIi!Ø—“„œr¹W Ÿ‘””­Ì¼·æ;0h¦‚–T÷Ú,Â¾‡†¿k\ZKÂ8¹;ÈŸlyCE¦\ZNÈí¨Ü„óßÚh£Ôµ« Óx–îAHß\ns½GÏÌ¯›ŠäG’°…§³_õëX{xùPÓ×¾§C}½€©ªadn¸í¯#Û´œjQw¸^-4Ñ(×NÊàe´²ÖdŸ!€ˆû@±JnkËSq_‡Æ!¼¡·ÕY)6ÖÉÒ–W+Ôµ:uª1FŒ§@])M–Hfe_Ü…kmOÂ•f2¨‡9÷[u±ëY®ÍDÈJ×SÔşúHä1\ZVçôì¦Ô£696q\\û³òSè²º«¶Õ¦¨ÏmÈÃÄœIX»‹\"÷:ÔÈ\Zßp|aŒ_\0ây‰7SÙ·Y\rimT}Áh‚		)\"öèzŠÙ×S¡‹³}$¯ükšä½½ç³²X©+Ää0¯¦^>[7AÙbT6¦ŞQb7¸¿iUQ–ÖÙ¿`>è¸w½¬c¸§![Ÿ´”*BêZDÇP,Æ<l£µ¢oÜš×‹:³‡¹‡7]ÓU±r`Huá!‡Àà9èL\0XX)	ìAÇ¡¸­I™Mò;ê@,Ê\0M\0Gàh\0¢;è\0²;\r\0¡ÔP*´\0Rª\0’*>@FYgş¿?%`ÿ\0#şY«jİT~j&¸=ü¼òG„wúøcŸ,ŞB¬İ¯ùFµÁ²=K›wu5j5ï‚ŒÑ—5M¡[…€QR1Ì¹b±\"ÎXØ›^“{x¥÷;šËrRp‚§òÙ+.@EÉf1VÒE÷/¢{ºÓ:øy9{\Z2åà¡ÿ\0Ø?d`{|ÜRÌ…/#i][u7-©?°ß¶ºi:œ¬¹¹h[Ä8,@².´vëİM2O€Âù\Z2c¯Î¤”h¸@ĞŞÊıTFºÎ–ú}J,„é©\ZßB*djß7°öU[QÓrOMuVhF“ä{Û©…)îYò[jlgá>”–¥6¶]Mô(q%&ÿ\0éW‹(WÅÊğSwb½‡™#);$AuL¾-ÚƒküÁ¸WPÚ==mÎªËÉ¾‰cm‰õšÌ‡PB@\'®¢’õ!£e.‡y¡TSF†M~›»{¤ßğ¢\n¡ÄÖ5XŒ\Z´í’¦Õ.z;JÈ> >U¶¸øÕ#{r»cO*ÏòÊEµê*8’ˆÃ˜§é¿¦± +\nX@MíE«©©	fytgˆ,%j1İŞàIÔ©$‹\r<*7«\Z‰ØlV_•ÈRqğ—0Wù™o¤Û]H\ní5+B]}IÛÅf˜ÅÇ@R¤<†›Hì[Š¸ñ;ª¬³úTú”ã˜öñX¬v9°6@ŠËÿ\0ôĞû«¿E\n\'‘ò´‹ÜÚ•\\éb-REQ^}ÃÉzL>7u¯}dÌÎ‡^£ÙÖ}l®{ £rÓ!´«¸¸½ü5¯Ûë»î¶Š¤OÛÖõÖ8§¯S\0`(€h€A%­Ç4¶ \0µ\0\n\0:Õ‘€wP\0€üh\0À*@¼*@&V.n$Ì&V:fbsŒ9ÉÄY ;ZK. AJÎ¢¥YÕÊİjC>Rù\"’ò,&4ú0ÙYĞ`¹au3SŒµÓ´¡\0ükè¸líTŞí#)«Ã8Tßpyoá8t²|’j!°Gåe*ó:ò…6\nÏÂÏb½|VÉmª†áÆò]UG^ßqLO	âœŠá#ˆø=>?Ø\0Y¦P\0\']T³u«ÄšùFlÖÍ’×¶í¶z*‰UÉè‚¨Š¡Ó¼n{êÉœì”µcuˆI7ùvS¨ŠnÎtıÌr“â\\„‡\n˜ßÑF	êW$úvO‰®×µaçš¿\rFä²¦&ÎWA‚§ŞKQßHTÅzk}Z%¶‡æ\'Àm{L¶ÈããA¼ÊlÊg 4ÀqÂnV\0ê{‰½Î½µN½]¾¦[=ÒP†6÷ıL¥\r6¶Ÿ˜­6™¸Ú¶8…§E6 ¤|A¥]J‚Õ¼9:¹öğì\\÷ÅOiAÕ)´¥Ò;4 üëÁ{¢t»G{ùRN€qèA¨í½Æ¸WeÛf¥;§ ?\ZÉbôp;°°şšH]ƒuQ”³–(>²:[¦”–ÈB4—ºêu-±2rÏ‚—¿ãI³TD9××/ÙÔÖk±È‚yîµòmãK[ÙöÕu«hëÒÕ¢¢ìÆ3”¹Y8·ˆMT›tZú_şí­^áø\rÃy¢²4$ŸÆ„C º_rÈ—Åxf2EÚÅºäçö›´ ¥$÷xWG©G_ré5_%„öª±r>ßñŞ!›Í3íÇ½F`AÊÌ\"7¬¦uh:âÀiö\\Q %d-/Z’LÉfÖ±#Úÿ\0ceáıäGµşí*w‰É_×å˜×J$:Ô\\=cÊ¶ãh\n°:_iÖ«ÁZÉ=}×Z¶­ûiÏùŸ·üİÿ\0i}úšÜş@ûq pŸt¢¶¤bóé•-¶$-CùÒÚÁ[K%VƒzÑKÚµ^¦\\”­ëÊš?BÜ(¡=×éZŒ¡vºu…¨\04\0Y\0Yô\0Y\0R…\0¡Û@(~\0›’–œ|	“T/ô¬©ÄõtHù’)yoÂ­úÇNvUõ\"ŒkgÓºÕ¹K;Ö®õI¯-fífÙê)^)!^êìíµ\0Ø7Xu5Iğk>ñ@$(’ cò¿Ó²²§<IéPíªµ‚û›Î£ã¡äò2ÜÛ\nÕ®«: õ(€)u¯;A©5JË#_·%7™sÁÉ3zË}L¢¡t‚¡d4/Ø`+³Lj°‘ÌÍ•´ÙÕl{-²×ÑÛkmÿ\0ÈßáÒš Å>MøªSnI±UËfİwÎ„KØÚVƒuˆ7ó£³åA)„-I)·Dƒ»Æõ˜ò¶ƒcá4Z‰®»p|è–óƒ[:ŠÕB‡‚MÉø\n‰4Q	ò_IAÖÚ¦´›ª$$Ø6¦Æñ’÷s²\\NM#Ñ—¶&LöÇòÖ{· [â+™Ü¦¼‘ØöÜº<oæ¾D7ıH$[}û«œÑÒu Ë/¬mÔtªñeÚ,e- í¸=oBB,/áxÑÌåcFq»À‡şk&³ùCM›€ŞU‡ãOÁ‹•¾FNÆ^~¬;.÷×d%IòœQ\rº‡çZš–bª„5%Gõ\\Ó®µU]Kx Ïsà¡®]È‘%ÄãpÎ\n:7ú÷^åz`’´!7·R>.²ÆcOæ0qØ¼_0äh^?Óâ¢Â`)Âß¦µ½ zƒ¨RE’AñªdZé°Ú¶–»–j6Ø–ÛE’€\0şÊKE“‘õí~Oç¼z!kÔCr¾©ğ®›cVÿ\0ú’)İZÍ×ÀOrÜq6t¢.ˆÕDjMv’<Ã2ïúlªÆÚãC-TTßr²\'ù©Ü	±dÕ^½a\nÊ£ÿ\0Ús®Im7ğ	\'÷×S ´g7İÔ‰¬wWDå T\0té@ ’È§­n9¡‚ z\04\n”ˆR€5# ©\0`P€wĞ\0Àí©\0u \"òlû<OŒr~U#o£ÅğóòîÜ€?ÉÇ[ \\ôº’\0«c§;*ú´ˆ{3å!1ÙO¿1åo‘1ÅÈ¿ñº¢µŸ™Q5ôZ¨ĞÈtgìÚ‚§³îeã¨©Àîˆ…§D¤gI@·i³@ÿ\0¿^Kÿ\0¨îÌuêöÖßÑÏkÁ	ä~v:¼İ™hY \\t¯“z‰ï®åDXÕĞ\Z*ï\'Z²)b8æCL:oĞëO¢\"º³‘v¼S-Å¸Î1A2r3^–ûƒó!¶€i$x•8¯Â½o±cUWÉm’îqZ-Êw•e¬L™±±òîãİ»É\ZÜØ^ãıî¢»‰ó†ö1§Ái¸ÄwyqJKË7 êõ75­(FkZu6€Ü4\0G™a ø$z…-êÁm ÛûE.Ì™‚Êı¿{Ì¿jóÉk&Ë³x¾EÀr·ær:´³IıZ~döõÄ÷^‡ù5šédkëv~Û‡±Û	Ìøï.ÀÆÍq¼´|¾1ô¦Le…§åP•@èAÔvŠğ½ŒVÅg[(gR·VÕX–ÈKj:Spõà?ÛXî‡\'ŠÛ%–‚m¢E¿e\"ÅD×’mİzCeê\"JJ»mĞÒ™q–6Şo¥‡¾•v6¨ˆ9·;5Ö²ÙDœ#z¬t?ºŠŒc{IRê‚–êÏ@„\rË7ğ\0ÖŠ¡9\"Ìg¡	yÎBc0’òIq-„¶\r.¢:$\nÔ¨í²“;½k»‚ç>ùcaGrxe2]Ô\nôÌ›Pg¸[zı=m±Ïì÷ë]+«+¬W¦e¹Wä¾ä‰³–¥œşb”å‰·Êİ;.+¦ê«XG)YÚòÎÙ@ûoö›—{EÂ}ÍäY!í¦n…Êó–•xË‡´„}|URBJÑ\nÔ¸Ú“|\nÕÔv>Å«m5)RyìÉü‡òD‰™yØÕúx…:ÿ\0©µÂ¢[Bn¤o\"ä‰ÎÕfø£GX}£÷oÚÏ¹oó>İrÆ•zdy.Z‰’äöG«ı^éJ—št¤\0•7`\n­ø²¬•â÷9ÙpÛä¶-§w,¾Å×ÈNuX¸£2¥\r…rRĞJÜ)ìRÈÜ¡ŞMi®ÆG¸áJNÛŞ•`<Ge\0Ge\0Ge\0Gã@‘@‘Ù@‘@^o+lH8Ô.s¾«Ãÿ\0”ÏAóQ…s½Ë\'\Z*únÇ7vô\ZÑ“µ°5Ó@+ƒäîî¢H §Nÿ\0…\r€C¤%Cæ›T6JCs#‘Ci!JÛ`oQ$Á_y÷\'-´ê»ß@/Ö©g%ñÔ¢>àM—Ê³mqø…O7u§f6.w¾åËiÓ®Ásñ\"·ôñÂä÷ÛÉ¯¥~Èû|×â°\\S!&6—^WB[[Ò9w´²Âşt%Ï×ú¾=õah\Z¼é\nÑ/7ª{mC,ƒş :„«¡6ëØ{A)\Z®«Cn£² ²_X ¥È¨cPêÈ7ìVºÔHêˆïºlu¹×KiQ#j Êy\"ş=m¥Ccª7$ÌÙo0µSI³5QH¹L¨‚§TznÒÿ\0\"ÎG*šSãAÊÂ™‹Ÿ^ö‹R’Ùó¤^éq»ôZ\n•d®¡—£tjËtR®g‹Ìp¬Òq93ê·&îârMäËbö öúÓÕ\'CÙ\\¬˜İ3Òuò×=y/Íz¾~±ÆR5S–ªª	Í¡cp|uù‹;\n~Kçùm$wvà;IÒ™\\NÎÍË™UKY”ÅÀãU€Æ)¹%¨+9’HÜ¡ÿ\0I¶¹QQq_™ÎäòÛ¿$FòÚ¡cn€tª´2DX(şH¨Hû¯’•diŒ¥1aÆIzg\"qô´ˆ;nR‹)n8»íBBlMŞGR³Xş·³jJ°\re\'©rgfT¹Ş\08áYÑJ\0r›IÈ^ú8ô\'w±‰m X¤XiÖ³Ø*É3ØŞ>…ò<Æh£ÿ\0¢a›QìSÊŞ¿ı¨·£M[1{•âª¥¼l„5{öWTá±›Èæã¸zÙ&©qØ«,¦àN.ÊXMÇJÄÔ³­B%Ÿf‘·‹ÈwOæL6#´ï®ÏE}Üßı‰|	|u­Ç8\0=M™ì¨\0Y![Np`é@¥HOí© 4Ú\04jHüM\0\r#ğ P\0À©ıøó4ğÿ\0¶ng·ı	üâT3e)]õ¥[¶Şƒ*İá]?hÅÏ°Ÿ¤±y‡¸oË{…Ì0?\nÚ•?=)Ò¤è–ZüÏ>³Ø–›GájõÍzø­’Û%úü\nàÂó]QB^ŞğüO\nãX-ƒ`FÅ`!5v±(lj¥tó,İjñ&¾_Ÿ=³äw¶í«Š¥UWşâö4¨¶)äKZ÷+M|jÈ\rwÜ)iK&àU‘F@~áäı«Ü+JÕÅYgıúç	kİ™Š­Ó11ÇÇuJÑ+X.«Oğ—5ùW·ö®³}u;7\'7½,¿-\n<™Ërfòã«%EGõîüÀüMux¦ ÀîæB2¬¡m¦DvÃ[•uµÚ•w\n+hÑƒ×cZÿ\0ËeHIH¾¤ëUn[ˆµ´¥Ù‘\"»\0©ßq¯`Ò³İ‘#ÓˆskÁç++Ã³óøü¢wÈ[Ó»u³ÈÕ\n\ZvŠÃØÃ2‹¤ËÓ-¨ôgzşÖİç9ÿ\0k8ß0÷M+’òvU=-²ÈgÓ„âÒ i½hj¶a^Ü+™­\\µì7³¢vÜ²ï$Zßš¹¶„y=Ú¢‘bééI#uÈÓöÒØÉC2´ÙÂuúRn6„9_•dŞıÕ–Ã‘çV7,õëV®å™{ËÍ—À½«äÙ8˜¹œÈoƒ}Î%Ùgù\'Å\r%fõÑèâû™§“ßËÃõ{½“>fQã\"t™×ù²\\S‡å¼+ÑV©l7{7»\nŞ•í\Z«©$öZİµr‚şDÆrxæ£(µ6cÀz@Zgõ¦úØ‘ùˆ¨¶¨µ&KçÎıóå¾äñ;ÀsYF¡ûÂbÇ‡e,ŠˆÒYÑ>t¡üÇDõüÄVä³pt±aKRtûqûyÉdóĞùök¼—!”†öà:#Çf6å2«&<&‰şZ7nyCjo¸Ó1Òubóds>àøwà¼7…óî\ZC^îb¦â`á3¨JPşU/Ma—\Z–Å†ÿ\0YÇv j¤¬‘r”¨S2Rª\ZÜÍ#rÅ÷r1ßu;RE”¢«ÔÊÒ”ÂÔ*@,Ú\0	\0Qé@‘@(k@‘@ë¦´f¦\'#È&º•1ˆ‘ˆÔßç#â«×Ÿïåç‘Çƒ¿ÑÅÃ\Zø‚@Ø\0êoû+Ÿ&äyÅêIè‘…ˆ$lÜB´ëTeÒ’+åÒÚ²4éz‚É/òdÇfl÷—fa6·;öƒ`<IÒ­Jòp^UT±/í‡‡+“ç2y¬“Çu2RõÕ(•– Wn´I%èq²İêıN ÇCL„°f›Hl[¥Çn”Ã0¢…”§ş!Öâ İ.:ÔöwPL„-{	¸±¾¾>5Ñ¤ë§Ì	ù\n‚é\Z½ckêMC—!Ğo¨ë ïÕQµB—t=š²ªØêŒ´ ~½UlÑHÑ“<€?3m{*ÆºÖ\r4ÈSˆ ÙĞ0Q¤¶= o iMÓb­K‚æ_\r‰äXÕâ3°‘—Æ­~ eÃ±Æ\\µƒ¬:ÚÇx6=5KUYC&™-Üªá‰<wÛ%€–™(Èf]Eü±L];‡¬5?”µ‚‹Ë—»’ê!]^I–!®!Mã#<²b·¡o^öÓò‹\nv‰BØçº¶æÚŒ™‘¸ãnhn[·oÇ[ÕxŒä\"Èl;mD\0Ó™ü²£ÓCcU‚ËR÷	¸ÿ\0èéB—É%ÆÆDBÒR]]Ö´‚\rŠ•öUQ§\ZÖ}mÄ8Š1˜ˆqÛh2ÒP›w$XUmY2[$³o-\r´³´ƒnêEê;¤š½£Ãÿ\0Oã¡õ\'k™\'—%fİA²ûtº”ãC•Ş¿+ü‰…ß#7*ğµl0y\"Ne,!—Fâ47¥]šğ­JeËæ%­Wè¢+*ÜêÕhYh‘³…Å6·©!â~D\'÷Wo¦¾ƒÎ{şÒQ¬çƒ uêj	1P»t ’ÉÖ³š\Z-@\n²\0Ğ/B 5=j@0Ô€`\00;(\0ËZ€=@zÿ\0Éÿ\0:3şØ{iû£•ÉrÌ¤ÿ\0×È,EŠˆe—ÿ\0~½±â…kúéú	É«ì{Ùÿ\0éx‰~êfc[)Ébñ––5c…]oã%iĞÿ\0Ga®_ÿ\0Eîì°Wjïóÿ\0C¹í½~æ÷{)-{vi^eØİ#õ~n—íğ«¢‚©såÓÂ®ˆf†MğÛ\nóhGš¬ŠÁTıÑÉ¡Äï°µ¿mlÅ«4âPó‰Ö9\'Í:¥8¹¹)„/bmŞ,}§ÅZú#Ìv¥İØB5-)!Æƒ&Û±ğÖ¯zNÂ«š4hqÇwËJ›É¿\"\Z,$6€°ƒâ{ü«5ÖZşİGVøí£ĞEŸ\Zk8fá©qÔlmÓrNÕ\'æ*ÔÉ;¨e/XÙÊ4ÚZÔ­£QÛ¥E™GaY.¶Ê7,„„ö\ZÏfVI{í÷ÛÌ¯½şìñ~ÃNFã†@ŸË¦$èÆD!o€{š4ŸW\'Ü{+¯†Öó²ùšº¸¾íÑô§ˆÄLGÊ#0Ãhj,vÅÛm¤%O‚R\0\nùıœê÷;ŞMÕ~[_S­%—Bt„Xñ¥XºÊBTOf¶øÒ¬‹¢3Í:›,§mf»Rä€Û¤›“ÙÙó¤±¨9¡¿h$}MZˆ»9á÷UÍ“;“ax{.^\'ŒeNH>_®š_Ú	ñW¢öÜ\\iËË<÷ºe›ª¯Vj[¯],°´Øÿ\0Ì\"É3]MI´È(%Å=¹A@©_¡ Áıõ\0;xÃD+!™p”8ÛKL_ğ}VÛ¦è³ŞÕğ¬§6bR±P¥½:/¨ÅÆDg\\iHm@-O¼Æ,|ê?š×\ZšæÙ9Ğé«$‹Çí§¸~ä{7úWºĞòÜs\r)ÔÍ}§6¥™hnûCé\nnfTä‚ÖÛM®_·ºlK.Ìº~Øñ¬ÇºüËïg=ÇgÅJú¯k8S€îTå$¶Ö\"‚U±E\n)ŒÍü…^ª¼ê­8×7ÉíàË’(¸­Ë¦GhêzÖ“0QZ\0,‹P\0 ˆµ\0E\0¡ã@*€ó™‰ÅNÈuu–ÈŒŸâu~TÄŞ•Ÿ/Û£· Ì4çu_R€Ú›m°n¥›—Ş£©?:òÖräõªZiÒÄ‹UK	²°V¶°Ò¡’†&k\"YBÀ_g@ilj+·3Ïê$+¼\n”‹$Sßq²Ò&ÈÇ`a!R˜è•9¤? Ú¼ †ë=<+wS¼Ÿƒ/o$.+ÉÑ?·N,Œ\'‰-Øf©!.<“ù‰#¶úöWI›¹,hGBuñ©*l%`èA?˜÷TUacĞjš#UçNÛ~º º_v÷×ğª—BK¯\rEì<?m@Ô„‰\rÈ¿hüETmPß1)ßKcû/ãUcê†VæŞÿ\0©V#÷R­c^:ŒõÎRÜ6q7°½Àıô¶Íjº¶êÎ›R¾Û…ıµV‹£a.,~•~–¸ı•H.m!û—ïµ«BƒR‚@§öTh5KŒèè7t²TRuğ¨„Êê\':ÊAQJÔÜMÿ\0m\n ØúĞÉV›€›«K[[ÜõTÁŒ©2™˜Ê$FÔ¨ï‹°û+JĞ´Ô©$ƒT²U©\nqŒŒ~sï^s±8 ’ûêR‚d¬“µ@h‹+j††õZÓÉ£/Ñ‰¿S¥0ña¨­ &À$_Æ®éã«ê7rxÅJu1Ğ,§–N\n´½!Ò\\\Z+“Š’uÁÃDHqã¶[e´¶„ä‹\néQBƒ“’ÒÛ7²4GCÖıš\n»T@œŞm™{ÍkƒøÖ|Œß‚¥Bä‡UúîÖİzÒQÒ©m=©FŞ\r‡_ÿ\0O9ÿ\0©ÃıÕÜê(Æ1îşæI)í­FT›\n	G­P»GÆ ’Éµ¬æ†­H\'¶­§¥\0…\0\Ze\04©\0`£ğ Zô\0sm—†Ó¡qA#â­(çËİøs>ä~òù®.ªVYõâ^–›ÙŒ>	ŒòÒEú†Õ·üJ¯MşBèô•éJøÚÄu°ıì‘ãwùdã8˜xœt(#&8L¶Ä8¨)i¦’„\'À$^\nÖw´½Ùê^š!ÚµÜ;(äLyË}H/•]Ñ¬Uu\r@<*È†6¹ Û+¨ÕtÂ«R‹ûáÈ7Ÿ£¤2_ĞëämJù×K¥Ny*¾#¯nÛøwK‰‘©)t<—>¢´RT­v¨ö“^ñ¾:jU”‰2\Z²”â.…§U²­\r»ÁèE2·z…¥h·B:Ô¶(òT¶î©\0õøŠMÙj¸6™\"à\rO`¦ÂEv\"}JÒÓèŞk=ìN‡l¾Á}¥o‰û{\'ŸÎŠ–³á,*äÙmb#)I:\\zÎnpøm¯ï¯¹—‚Ú¿Ìîôqp¤½ÙĞÔµ>\Z\nà3i‡j£,%KvÉWì4¶^¨de$)7°WSYíaµ#ÃÄ%ÂI#¶³İDÊrRííµ*F\"½ç2‘â\"nJj¶ÄÇ²ä™k¿FÚIZµùVŒTäÒõ+’üjß¡ÈÌşRG\'ä®K9!s3“˜êœó‡Ut¤€%6½^*qªHò9r;ÙØĞôÑD¸|OîéNHP$¥%a*¶ÛX wxÔ¢ wñä¹%Ó	$¡‡¬)ìOi*†‰ZçÛ¾h2X¾3Å°YiÍ=uÜ^JQ÷…Hyãè.:›ó¹ê_j“Öı+™“ÓĞêcËKWSª^Ìû@©’\"J÷3ÊùV+k6v\"#c1¾­‚•§*C„6oÓ²‹şRÌÙsã¹ømq<UkmÓcIAñqÇb(o\"nj_(±­•§Œ–»¶ä’”„¥j+R@gB£a­\\©‚(\0²<(\0¢;è\0³@Û@Ê\0(õı´û7{ø¼B¢o6JGxº\Zÿ\0r¿\nå{XJˆê{n9nïÀÚeT¤ÃJâ³°ƒœp¡\rKÔC[%\'ÓJµüº›UTC\\£2–PòŠ­~—5Dä±W¹fi*Sî-À–šJ–µ“ [“M¢ÔˆwÛ<cß³6{Gõ_ÿ\0,¢\n’c\'D\'OËp.~5ÖÅN9y¯É¶u÷ã›ÆbbÇ~ÔïI½ÂGRh0½Åô¨”«q¶‚÷Ö€2—¾¤Sıõ ¿YM«jú+D9Ùğ5‘®û€mOút ºd¾\0\'q5QµB4‰	7¹ëßUcUDrÂIQü\Z«cëQ““ÉÛpİc{èiVf¬t#¬”Ğ²MîopO}%³n:‰-¼½5\n¢ı§ãTä?‰ºÓÎhŸIj¶\"Ú|è™&\r\'¹–a	yhğ3N6ÓÌcå<†TënÜ ´Wµ+$‹XĞ_íY×’ZA(ÿ\0ÕiI¶–XîëU(srZì%—IòÔi€S‹R†ÇZqFöNíŠ°ÔÚızÔª²­¤k­÷…÷!ÖÇéYiáBàÕ¸´WA,ìñŒÉ9u)Ê5Ç`)M—Áu±¹)-‚’ «ZÀƒB@’v+7µir^ä‘â±>©S§5¹Ó--CÖa,Jó²”(©¡7ES&ŠM™)\ro?ĞŸ=ƒãˆÌû«Î9*›ßı6<,qvß­(.\0¡z0-İûq¢^¥ùúR–R@–¦YtÄˆp=|³EIÑ¿1¾©JÍ†d´T”#¶ß@-ÒÕ­İÍ>PÒÇ¡Œ¢Ô®âh)t®£Â²ågK\r`«Y‡Âå9n·ëK©·Áv½ºcéø7oõ*\\WüjR¿}wúê(\'İsšÃà\nyÍ\0f‚OkÔ2Lµ\0Y4õ­g45=µ(GJ±©\ZPÂÔ\01Ö€ô\0:\ZQ !r¾DÇâœ«–ÊXn7ÃOË:µ\0‡oüÒ*Ô§;*¯.³…\'%>Í=º“d½ÍÏGQäá<·ã¸à²Ñ\0º§\n­×ùï8{ÀM[ß{Ÿs\"ÅW¥ŸúŸnÂ±ãä÷·ò/üT„¶M½õÁLÜÃ^xÛ¨7«ÉX]t•ÚöEªÉƒKw\'SØjd©rÉ¥-;æı\'Jº/Dsgî‹0c{{ÌV—,§âˆÍü_q\rX|w}¼³Ñ|J÷Ÿ9wRš!HU‚¿:zƒñ½µ¡M86$H*oËØ›lêÂ¨”w“Q…(ş6T>Àé}iva”Tj\nzÒ/bIsÛ/Ÿón\'Â¡nr\\›Üu ’Ûî}Ïø[JëŸÛì}œv¿¢ƒ;ªŸIÜg‰‹ÇGL\\~:;1aFN‰m–m\0x%\"¾w’ÎÎ^ïù–é¹úiÙIl ÓqÀ¿áUe’“ß!&Ç^´›±µC#\'qs¼t\nÏf5\")äY„¨%]û©6\Z‘]ùVLà\n¹Öæ«T1\"šıÄòè¼Ø\r9i¼¾J`°›Øı2,ä•|²?â®¿¶âåy~g¹eãŠİœüİÜwÔ§¥wÒ<á›(èÁá×ñ«2$v¢Ö wƒÔÔBÇ)ı\Z<¹‰HSŞššÙíu_’ß=jR$‘=°“+\r~Sn˜Ó!Énc@²ód-*Cp°ñ¨Ø>±8(‰î\'áí–Ğ´rì$²ÜòºûC×MÓmC¡@øÕåƒÀŸ Ò‚BÈ½\0«P@Z†”¡×Ã­\0GZ\0(ú\0.×!#­è!¸+ö[ rœ‡-5S~¹”å‹x\\^o¹“WèIÔÇÃõ#\'ÊRF£ª»mY Ó&´ÅlJõÖ—bÈŒ¹@²ÓŠ$\'¸R¬9sšò\"TãeË„Ş­E%Š£î}rŞ+ŸÏÊI è†?UíügË]¶.N_ƒ/g$(^KöËÄ‰¿ÕVÁ@‹dØ.:{+w“Ÿw\ZŸ—rè\\2+#9Ÿqìpo‰FyzàÌÌg!“u)¶ğ*°ğ«î\'Œ·‚¶H*iÅ6T’º\r­qq§wgnµ%&“©X\n)%\rAŸßA(Ö3¶NZ\0¡ı*¾Ÿ*‚É¾ñ	şZıFÀ¸MõP]!½*UQ·´\Z†>µ’åõó|ª;\Z*†”ùöİsÓ°R­aô¨ÁÉO\08â’ T­ •©N¶ÕG íì¥7,Ù£E×ê®4MÍü)/S]½¢ê\0$~cÜ;ÍTbFŠù\">Oú3³\ZFSé~­–½«S ¸€lÓ{^İj`¿Ûq>·™ó<^J>I‰c6N-*™€s6‘‰’ˆÒ€tÄ\\kºÚÒ¢›¤‹ƒÔ[¥¢|\Z1b²j,õŞ4œ†pïugNì68ënFÄî‘›Ê¿”K±‘_uJi•—Ñë¬6ÚHÕ {êfC/Y\'.Ûí¦ïù¬gÇ[Ìâxó’æ_:ÛãØeIÜYm²ï¨²›¥@yIëQ\n`Ê±[‹·„CüÆVK1É21qü¡Öâñ©¥Bn#Cú†/$û~›-ZÁ2#Lß±w7B˜ÕÒ­e×yù5ı\Z=¿‘Ëqœ§’#’aù’3¥½—ãâc–7±ÒqE(ºÈIÔĞ\rZ4QÕqkO×ó%¹™6c2^uM¥(ÕÕ¸¤¥ ‰D€ÄÒ¥±\n¥RÆg$à96^|şZß+Ã%ï¨‡é¯jˆ­‰%³eÉbw6\Z‡^Fş)¥\nãøïíC´{xß$”ÙDÎg‘•–rı}(cCşŠn:ÂHã{–IÉÆ…²y°†È\"ÖêáE´9µÕšøxûqõî6GÀt«cDä·Îè(n×¶áÖœ y‚†œ¯aĞøRìÍ«,«|ÚiÜú‚º•ŠîN¦*•æj‹¯,^êY°·MMègŠ!`ppÀ·Ócã¶Gˆlß^‹\ZŠ¤xÌÎogñ‡ÂÔÁ@­kPª	3Øh`xTY$õ­G05=µdÀ8tbSû¨\0ÔĞ£¥\0¾t\0 /@ \në÷Rã“=œÉp¨Î–fû£•ÆñœI±LiO}NEbÚùaÇvÿ\0\Zn‹yüSŸâ3?¹zÓÕ7‹Œƒ\Z&0\r´ÊBHø$^~×v|ïSÒ5	!İ¼%)¾‚ı•(©¥!àR@5d@…oZ{A:ÔÈ–øCjş!VL¡\ns9ÛZxÜ\nbc¨µ9÷RôÇø&DGëñÑ‘‡ıFCi%4§BPÑ!N¤Ô+ÑûşéôF?v´bùœí-§Mu¯Zìy¨BRF¤Uy*m\Z\n¥¬’´•cãKv%1b\"P·áH»%):Aÿ\0î\Zœ§¸<‹™Èe+oŠâÄ8JPĞKÈ¨‚GŠYm_y~ÏÇiêÎ·¶ã–ìvn!´‹h4¿gï¯&ÙÖƒmNÙ&ö¿…Q²`GøMõ×¶©f]!¥‘–\0\"æÕìjDw•Ÿ°(“k^ÂØäˆK’äÏó\n•nËŠ[‘^óÓL‰´’JÔ@¯©´E¬s‡î”Gî¬kz¸ŞÏô˜à*¤$î–±Ø|çmÿ\0Ã^“¥‹†=wg—ïæç‘ÆÈƒAèøô­Èç™WM(‚\0\":}E„ÿ\0\Zµ\'á@eÇ%HIJTï¦.ÚŠlÚ-àu&¦I$Œ4òÃBæ-/Èÿ\0Çä@ïÖ¡°GĞ?ş7½Û_5ö—=í†JßÖ}—šÄhntSØ|º\"2Ïyiô¼Ù=£m^e\"jt@Š€:ij	AdPh	=h$(M\0®Ú\0%]”\0‰ÈŒF)’:˜‘Ö¶‡{‡ÊØø•KË~vŠœî‘]ñiÚŞíÅ¤‹Ò®¤üÍyG¹êbş`HëÛßV(%åŠ›iJ$’5WRËQ•en÷: A{jìµè…*T¤|£”¼û¨¹7îÿ\0]kÇYºªm•ß#‘È>ó¹F¢®rİ”†Š¡C\nPFıÚí\rîÜOuë©JB„rowfÙÑ¿³Y<™ü\'\"ÊãNLü\\¦nKğ\\éßa;Z†ò€ú”Ù²îäÀÖôËUó%¯åèá8ş;Ü<¤Ìv9Î)y%îéZÚÅ®@@Cî-­}¬#ÕJ…¬	;H¸ª,½?jr\\gãÛàbÍÃ|Q<©<…çD†vt÷Q)µº\n¿š©*ZÀ½¶è:^¦ ›(Õ’´–Ühn¶ôA\Z›wZ«$Bb;«eĞ¤­@\\~S×ãcA)Ne’Éq7šä8L{Ü‚V9–œgRÛÒl¥OÔ¿.äµ¹`¤Z¨ô,Òcs×¹“\'å1¸9Qš™„ä²Ê2;ÑIa)æ”:ÙÄ‹GQTÛSG>u7&L\'ÍÓõ_M?¾¨ØêTùiœl	S_[A)•sÒŒƒÿ\0ÍP ¤mF´«3^:KĞ¦¹.k•Íd]Ér;Œã6³|w†\\|ƒd©Jl¨ÌeÆG¤ÁMÓê4VFñÒªu)•”Ú‡:ëÈyöG’ãü–,Öóœ+;L/B†§æ&jP¥JJ”•X)$é×mµªºÃ‚Øñ+&¶²ó:~ƒñ\\»Œ¦eÆ°ï7¹,S$ÅRÒ’Zq”]ECpTuhŠÑ·R$åü›—§˜Ë{x‡ÚÊâsAß’‚§›y­ŠqöÎƒK*ÅU)Æ†¬xß	JgHõşÃ\'%Çc3”ËHÄòxÍef4ök\r…Ê4ó¨nMĞè‘\rkh—\ZIôÂ®¢›‹\\Q¤é¸êäm)N6mQÁÁ¸Ô.cåhÎãÆB.Qä<2››©¼[’¾‚\nl£vÃ£AÙE’‚™r<n°â?‡Ãı‰Kñöx³kvINk0–ƒ8˜‰×”ùqAJİµ $mº¨í\Z1W·?‚ô/!IÇdİÏ@™‰/7%©Ñ²sá™’eÊy€Ë,›sOM7X\'Q¸öŠ²·‚õM¨ÕÇ§)¨™œ\\†}ÃÌC—}ç‘Gz[ğV”1µH‰´$è£è¹pni©mWB[é_—Ÿ×û›ãİFsÒ§ÁÈñÉnñÙï-¼\\án%È	Œ§\\vTu\rÛRP¤’R~F¢Õ’«S×ú‰\\ÛGîR7„á‰N*T¼{‹”Ka_P^q…\0µ8µ!,´J@QQWe;/¹h~÷ÛíW¯^~eBnuz©×/k°ÌáxWÅ°€Ò1ØˆŒ„ÍŒ¦ãñ½Xóİ†İÛ~£îk‡Ò)\0…(„ÛÄÒì*ª|tt²Ú-Ô\0\r:«AVr{ ğJOweK!\" åÊZq]÷µ&ìÛ…_™ÉQõnt&ÀV7«:xÑã£.vg#q~Km¤õ(\nv5-•Å[øJvlZÍ€„àŸ/î¯Bõ\r¤ƒÇû(\n×\0x\rj\0²	ëZÎ`j{h\0ñ­ªà›|êH\rì GA@(\0ië@ÿ\0A@ãßnFŞCß_køJ\nOây®]=»ßkóßg;CizŞ©ÚúzíúÙ/ÓS¶Ör·è‡>Á#ô‘Ø+ˆ™Û²ƒ}åØ+²İZJ‰/>lEï~Ê±\r nuÔD•2²–sæ#J²dA_y¼ë2õÕ¨ÓSDìO³˜O{øÏÜ?äŠô±|£Âã¬OµÌY¼ä¸òâÃÌ¶ïÊºİLÖÃÆõğäåû»5ùœæ¼/‘ûwÌ9\'åĞ‹äÜK\"ş37@Ù/°«oAíC‚ËAıI ŠöTÊ¯Ue³807n5Ö­È€ë_°\n«`y\0_»^´»0á5ëHµ‹#µß`ü}ßgİÎz{^å9ÉrK–ÕLÅÛ¡â¦¢>5â}ó/.Äz$zo¤aŸY:Û¥ v¶ÄlØçÎ¦úwÕ,*PNíGO•&ÖÇÉÍV¿…\"ÌuQfçùV7[CzU™tˆ”ä‚Rç˜X_J•¨Ïrç\\Á¾!Åóü­Â=h\r°è:ú“¤]¸éù(î>·upıË¤cíæX±¶röCîI}é2.Hâ}ÒuRÖw)GâMëÒ¤‘å[oVê¤µdTä6‚uÜ¯ÒÚu$ü¨d#Y\r¥n¥ÉŸÌ~ÿ\0Ê„ƒpíÖéBaNºÒ=GV–P£C°ğõ©kBGt2àÊÌ>”F	út/Mê·]{ºÜô£ÁYñOÊq-û³î®;!Tl§:ã‘QÅ\"(™¿Ñ_õ¥„“úÒÛ›’?Rw‘Ò¥lgsNºĞT	é@ª€P RºĞX-T\0Y¡A$Iî¶Amcñ8¤_nBBŸ’GğF\0¤|Ö ~UÎ÷,œq¥êt}³äoĞqi²wv[¾×®\nÔîÙÈ„¥+\0]G¡«¡LKÍzN\0$ÛPËT¥>ô:ó0^¸°Nï2zŞ–’lÑRr,€”]ik.nH¦ƒEÜ:×S¯XÔÅØ¼è2øTòÖNl¹r âpğ[›‹%im²ÓJ.ıJÔrØP´‘¢UnÚÙaòuóÛd/ƒq‰åóY|ºùœiS[É-ß,\r”YB‹-%*%°£pT±Tµ“ªØ”xö4Dş˜f;.2ãQœq¦&H}€ÔÖÄHkb[³hUÊ”âãaæ\'7W\Zã$MÊ3^àñ?‘Îbø;Ú<ËÙ‡r\\ŠkîZÁHÃà\";!âÒa¥+aÉ(êØho{…¥9Ô¥RoÔyòŒÿ\0\'Êq~î——Ç7ˆyœ¾¨e13n¿Ø©!ô¢å\"äkÔ£’õKTÆoVNo³œ¯)ÿ\0Üuá¹Ü®g+å\\‰LàË’ıXñg2öÓè¥!bÀlsùzZ¢!j.”h$pŞmŸçæãæQ‚_~<l>!œ•ÿ\0SË˜^®eˆÃrÔó\r…6´ šj-ªëÆ=A¿ıÔæŞŞ±Éx_*È»æn\Zöù—â%èÍ†–šÀm/³²ÊRHK¨Ú­ÉH\"©É5&ªáVi¥§‘Û„äœ‰Ş-˜æ™%9š—%¶„,\"%GL1ô›÷Ò9¢ê¸T\0q%z\0£ÛJ³Lr¢åÇa©†÷*&s:—ØË}GÌEK*Ã¹\ZëÃÎd«Ö\\‰HAeL9·h*_•^Jñôf¯¶Ò†µ_Äneeá³e3x×¸ìJÌ—ÜG„Ä¶ØŠÜ«P–b%•¬’T¢lMêšhšŞºy!\\DöK\"şN|· I~JS•ä¿N	ZË‘Ûh¶^-”¥i	;”TBí{UÙšIGôÖ	;3‰OÍÃbtXòB	âdÇr8/CÔ­oÇNô„›yTH@uµg¶MIÇÉWI‰ÔÑÈ`“9Ìkóò¯ı¤¤È€“é¾™Ò]u¦sÒ/¡Dè‡?)é¥E²µãA•Q)BŸ?‡k0¥ıL&ããòy	\"¶ìô©öÑèˆêŒ©R	Úµ!jØ{ŠµV–Ÿ™KB^?À\\W\nTü.9ˆ…ıI§QË%cáºßÔ»¼ú	L¤Y”ÿ\04Ü­iÖı€Ó•“Ü¥“L½6—ı7\nÆ·È¢B‰#?š˜¼–!÷VëÒ#\0ÚÜ•¹â!¶”¥IÅÿ\0ÃC’Ï‹z%ñ&¾^‡˜~,V\"Çqä½Ò¨Jšq{V·Õë“ş\\8umğ\"â–¾’jççøÔ×ãL¸‡‘c“dáÉ\\wŸ>…†¬Ù@Pô\Zl2ÕA=¤Ş¦×oR·¢OOÇúãŞØ=ÌòÑ\"ñ³’¾D’òñz$ÿ\0OtÛÔ‘=×V[dì@\n	ÛkY[#I-YLİšá«wkOçğGI=µö·\ríwßê™©‘ÔAÈÜº”¡½Il ÛeghéÛmk³ÇVÚî[³•Yè¼/BAã€1Š‹~F<-\\Çh6]KOù™¤\0Êw,x« ù\n+«)mãI\r¤ÚÖÔä odŞH=jz¢åÒ‰\nH6I|ë.KğT¬¾@S„\\•$ŸÙY›:xª\'{id9×`‹¶™‰uÏƒwYşÊ×Õ\\²$gï[2û\']{õ®ñãÃGJ0Gm\0€P­ÛPÀ“SËò]¸ÈéîşbÏíµ/üÇèCè/P‡ùdäÆ†Î—$¥nÿ\0©ÿ\0-½W£_,65ËªÆDhü)RìQ«W¶ı·F«f,jàÿ\0mDu³Ä~êjí/AO¦ıC™çQÂ­/ëH¾®0â\\·Å$$ş¬»5e-Ô²Z,~JQ¿R¶äØyĞ›ïOA±…=]=Œö«®â—‡ì«´\0sH.¸Ûi¶ç’zO_•\0p÷‚ûÖçºŸ{êò9o[“‘âü*5ôF3ÈBY_ÌîÇ]Qï>ïvÃÃ«Uèåşfÿ\0k·ıâ‰A_‘Ú¤k^a3·`é.õøwÕÑD#)[Ô\0ùŠ´’m\'È’B´(’°53’¬Ù§i«&JEkæó¸¹¸«Õšq¢ßı˜aL/lùqhÚç\'ä–ÕŞÌ[ÿ\0ÔRë«ö¯ÆçŸ÷KNhôDÿ\0o³>÷â»¾Øã„Ÿvx¼0Æs²WÈñ‘ÁØ–ûÈÉËWü¿Ì]^‡sí>ı¯ø?ìs,¤ùÙyFqÆ\\BÙy‡ÓÌ¸’‡´•¡hUŠT’,AJï¦.·m§mCd@¥èOg]iV±d(2élùA#^ÑÙH³&£/·4¾ìß¶xS¶L<g¦këËK€üÜ¯÷òıÌ÷·Äõ˜1ğÇZü‡|·\'²±6Z Ñ“ €@±:ÒìËÕ\rYó,\'­&ÌmPÂÊLÚ•è?/ï¤¶1 —5Õ º+ß)É—V¤\"÷$ûÓ±ÖA½}Æódå3p¸d÷AãWw$Q¨^Aáb“m¤ß–ßÄMzoÂ©^OÉç}Ë?+ğ[\"³¨€u°¹×y·ÆÃ­t\\„)ö÷losîkü¶…‡ÍG¥\0†ŞrûİÒtSqüË#¹NŸ*6›iĞCPšK\0şgO™^&æ€C1b(¯¯$‡Nä§Á#¡>©b$UäT%äôñˆLtèVé7CÜ(@Yï·Ït±¾×ûåì÷<Ìºî?p¼êrØˆ.-Œ[‘Ü‰ „nJRøÜ;u·uJÜ‹l}P!æ$2Ì˜¯7*$–ĞôI-Èq§RÛˆWjT•uWJ\0,Ğ\0´\0Q ˜\nPı”…+²‚BÕÖ€!ïv™‡•küˆÊ>6ŸÚšæ{¢úø?k·ı|F9!!\0ÒÏ…qÚ³‘S´ëñ¬…±+:\ZV¾b;û*—C)©OıÚ†&D’×êq$^×\Zïµ*¶úU®‡)yn^:r2ñì´ü_AÃLº¢ãˆ°!n)D&Àê¢maĞi]úl-ç“%?`¸Æ3b+p¥dPö\nTwñŞGªaä]f;©\"ZÀrÖ+Úä¾€ØÔäzKSª2SÅ¡á1¼>^I-±ˆû±rïÆLÇ1Ñ¢F?ÎqRàHò·vÈsf Ø*²S:s¨Ï¶Ö¨IæÒ#Ä™Ãåò~cc…g¢c¡ç²*T·˜“Š†qî¶Mõ¸öy•É º¯GnZøĞ˜IiäJæQòÄ@ÃpŞaî˜5ÖšÏæór¿íÕ.ËéeÔÿ\0>d­[*C½AhÛqM­“Z´[ù$ş7îCYì¶\'/>;2á2$òpL¼<kzñ©y!·a6J\r…NéV•;²!ó1îËÏòÖQÇ1¬ñ¼Špşòq™L£(–±Í¥l¦k-ÅqrB÷…¶¤.Ïh›Tiê›/Ğgğ69Üôf¬,$g8c+Šp¨ĞÙãb*f¶™ä‹‰ş¼UoIWD¯^–ªZj¥oHüïşÄœÛ±2ŒärÙŒ|/SZ•ÁeB¤LhÆW¦·lÛ^¢ö¤\r•r|ª¬	ÖwƒMjÒ…©sˆG‹¼•ÏÅ\"SPDc’yÇ”Ú5İˆnwÑÛeµ!*Úÿ\0¤vöïÜ£E³rö5ãi­<ş4şÂO>öÿ\0•ä²Ñ\\<67hRñğšYüB›Ç[FS¢;‹PVÕyÃmMKÌ«n-Âêë?î!q>%Ça˜X¼‡æp6\"drĞf5=BêuL¶[‡ì‘Ø›éV»å°îvZÎŸ(6yG›–^mÙ)œÄWÚÉE[í–Z¨ÄË‘›7xÊ²­}@İYm&œYJ>_ŸÌ×˜¸pAÉf¢ÆIÊ)1°M-~š$\r¦Ì(İI$Aî½-?«AÕM¨_˜™!é°Ü“v$¹¾»7rå‡ã«rŞZºíRR®—ı)ì©Ó.ª´`Õ–TdÇbCÉœç$ã ‡”¶J¾ÏHÚÈxtü \\u5J­ZEøù—øşƒ¹veç“ÉË“)|EnAgÖ/¼ €†€³°pwqz¾°!×_ã_ÍS/?3#ëÅŒÙ™éir\Z\0—hİ”!aZíRˆ#Ë¨«rkFU¯H\rÆ«c±<nNS*É…6?¦ô‚Ên¿§ô^[­_!**›´WR^3f>ı­ût÷ Ö99È-ğî=×òo¹#\"÷ª6-i…~«@Ÿ®« hPªß‹§’úÛEüNwsİ°ÒU>§ü?_ì^Ş\'Ãxÿ\0Ä·‰ãÑTË@‘1â“ ŠuËnä¤Á]\\x«EO1Ÿ±|öåwùxC‘cùn§•_ÙV¶Ïä*¿¹\ZxÒŠÑ&À$Wçkqg€éSêĞºJˆ·gAû)˜Ö‚r½`UyĞ”([¡ê)¢’™y[â‰ì¥İ¥H•Ìj-ÔÚÇvt°Ğ­œ‰ğã«×áI“¡Uzû×æÉ”Sq+ëIø§hı¦º9$æ{µ£z²ç¤iøWpòá– ƒÖ \0ÛZ€3AOAPI_cûı”ÈäF/ŒñL¿&”¿3mÃŒ³pNĞ W´m\'¶õÄ®K[DzõiU6pKœS’rDÙVW„d¸â›RÑ%SËMÙM¤%;Ô¥kĞjbµ¦\Z2Ş”JS‘øŸ*oÙÚ2¶3Yµ!D\r£¯yÖÕur¼M¢«‹)²®²tbê&í¸Ê´’•\'à¤ØÕ«–<”¶)ßQË’eã§j2ºùCéK£àwÓ—jÈKêQ‹1ùáchÊcË­tú˜]GÅ•şå…h§m=Ì÷é5ûXûÁg°Ùw˜{‘fV×ê³}® c¹¥YB×ëjÒ¬­±’Ôµ?r>]Õ>±_r_‚ÃœœdbeÚÔoõ¯1#âË„Æ»š.Æ_TOZÿ\0nêÇwqò[ÓoGu/0êã$‚ÚÒ…‹v(kÃ=7=+s¨\'œ;lm éLLˆ4ÑpwŞú^İÕ2.D¤%=,H×Â‰%Ç\"‡HV¤(V.‘Yù|â}uVSr„\rJˆèyÒ›Wšı*Nµ{OÄ•Á=´á<QÔËÅâÚVM [üä›É’Oÿ\0ªê‡Ê»UÙ;±~y-oVH€ÚÄ\\AhAï¬(ççİØû…‘ç:Don½Ü};ååĞ×ÿ\0´æœOêL7æC§§Ô7u\ZW¥¶u»¶Å£Ö¿ËäCR|í{™íÇ8ö˜f8¸Xøç*Á;²n9ÿ\02V…¶û#Ì¸<Èq‚<A³LµºšêŠA.IICPì[‰ ûY€wû‰ÂxsMÜY¨‘#¢X.¾¯“IQ¬}¬ÿ\0o­è˜î¾.w­O¦,0BBPÓHJRÂ@°	Éğó»3Õ±Çê”#¯gmRJÄˆ³eZşpOoáKlej3çIHÜ/ÙÓÆ’ØÔFÙÉÉHPÜö¥½Ydˆ+“æ=T¥}ÿ\0#R‘tTÿ\0t=Ácˆar9•­*–„úxÆUúä®şü|ÇÀVş¶vHÇÛì}ºÏ“šÓgH›&L—]vT©N-éO“·s¥)J=ä×¢I#ÊÙ¶åî$©Æ«-~«‡£M\\šî«IA^\" O£dv‹mGÌš°ÆCIòÜº¡§¤ßAñQıÔ\0RCÄ¡ißËGïQÔÔ \rÚw¼´—-©W@:ÿ\0 ¨{€¯/ºâJ\\Tt£x=º;J¿æèŒîC8RÔÙCq÷nX¿p{ÏÂ¢|}ã“î;{ÕÀù‡å,¡éşÎ9Ç3­¤!Rğo6¶b5 \r±ı\r›ú©oæI&||J´tf‚ÕÔøĞdvPF‚ÀÛ@@Q”\0Qèh8÷N\"¤pù2.æ.Tii=Éßé.ß\'+~œ°¿³¡n9—Ä‰ñnîJ?2zƒ­yÉ=P:ÙĞ¤øy0 • ²¢5$[Z]Æc*¯¸È6ğ7[äk7“mV‡\'}ĞÂ8×¸ÒqÑÒ¦Qœ‘åº2ÿ\0•Šèõ¸k]î½¹Q®Í8ÛO$ëìw\0JfÙM‘9lcù#73q´.òA+\r­IÛ`neE²ıPôÅA{xT?“åjeÜ ÃÇcÜÇÊ|?‘PmÖywmaç¯±iVå,í°µk:¦ÓQ>…Òlqòçø:#‚.³&XAÆe\'\ZæL6Ö:bTß®¦Âœ‡şg˜(o*\Znª+]ZÑ´–ªMK¤æ¹Y‘ƒÊE–2àJÃÀˆÈeP#}a=N®Î”…!½–Zõ)O”ÜÅ“v¶’4R0³-=ÈåûI/ÆW‘Àò¹Ìcù%ã—bçzÇ\"ä¶[uM)Äúhléx%{¢·RÊÑñ(«\r¯ldÿ\0JDÿ\0l¤ÀöÚ~*kéƒÊr‘ØÌÌË¯ºÖB4§ÜJ$1¼£q(sõh«tª¼¿~I~í\0ñşsÃñ¹NAì~3™.3ˆ!=|›Ã-CŠ	ÆvP}Â¦H¥Ü6›¥ë–í)Óäi®6âû?àO.à e_q8øÅñ9°‘9Hó®K{+QeYü¹EBTnƒku¬l­²×øÏö‰ºîÜÿ\0§ÅÆÎµ“äø¶k›cåšÉ5cĞÛ(}‰/°•zO\'wıÒ«xh(V­(õùÿ\0sJåÊGËñú÷\'ÿ\0¼K¹&ÄÜŞ}ü´èÓãæ†B·úHyiCÕ†Á(7h£_*W«ú¡´i¬(z/‡ãıÅÆ8â\"È9I\\|à2\\µ=œÈ&:!ÇÆ4€a˜î#z7¶²òl²¢AÂ¯’Ët^í2—êşè4Z\\ÜvviR°ã ;—á²\\CRæJ>›ªv²ËŠHdë~]¢–Õ¦Z4ÍZ•®°ÿ\0/ëñ5²3ùQÉÍz$w£ã1³Ğä¼\Z…É”ã¨ZB’FÖì]îKj¿DÃD¡O”WÃOÆ»$C¤z2òÏLíy·nã.”$%![\nSaz?(+–ÊÑı ıJ¥IÂä£I\ZR!6Œpm\nV¶·º©Gó §^oIR	éæ2G3äóY¬|H2òc*+8ÜkŠº[A	\\‡’èÊOˆ*;Ò®©5–ü“Áo õöª6ç’¦d£ÈŠŒ$9\r—²³™yxÜIº–ãÌÄŒw©iJÒ\\*:~e\r3…²õÜËÚìcÄ¶×ÓËüÙÖ¾Ãñ\\/\Z&:_õy’›CÙL´%/MRÒ\nV¾Ôm¶ÔƒnŞÚïàÃ\\U„x~ßfùîİ´^„<ˆ7\'¿R{éÆ`4\0[º4éÿ\0¿²¢û2iû‘ ,Ì4(èB,]m\\½NİEÈFP..\0­ØÏ}ÏJhP ëÒÔ2#Üì°Á6ì\"“{hiÅR¼rùşG@6ı+™ÔÃB¾åõXÔÜ÷Ô#jE‹û{ÆÙY¬’“ùZC)_ûË\'Oı5ÕöêîÏ?ïWÒµ,èOí®±çÏXĞ¬h ÁŠ€Ù@	˜®-Åxs—ÂDÆ%	JCÉN÷ĞAqÂ¥[ÂõÇáZke½÷bŠòbÆë²m¥Î§ºÔ\',™¯ıA Ù+$[ò•<‘N&ÛSÚëp¥€©VCiyf†¥}:\Z™×c6Fç\0¸Ô\rJ syèkIîÛ\rjU‰âı²1ß\nON„öÔò*é´˜ñ^>©_BImô(¥i6ìRlGãR¬ÖÌ«Sº“€_vØ×±¿pëÆ”êßVC/ıE/:¢µ¸™ÑÙ¥*åWŞGÊ½wG/,5lávh©‘¤t·ì×İ${ƒí/:@s‘p%\'	—AUÖ¦PĞŸ#­”ØÛñAç=ËÛÌÚÙêvºy>åª-Sê\n$\r-XS4šªy- Üê(l”†şFrRÚµ¶„ÑÈ´ç%Ë\r®yûí­ª9¥F‡¶£„å=Ñãjçü³\rÅ8¾ÿ\0êóÍMbs5¥LÅh¾¤oRİ)*] Öş–7’ß!å™âÃvtñ>õ{7#sÉ÷{…¹¸İJNrÔÿ\0úµÙ‡èyNôO»ŞÒ›{§ÄU~9ˆgû¨‚x[Ñ›­{íœ‹†}Åã/i.R*´éØåCĞŸ·F@ÿ\0pÒ}·}Íñ†øÿ\0¸›ÖcÛ‡ŠslfJ\"2¸·.}\'\nˆq¥ÎË—Bºè¯0f,öÄæ¿¡nÏÃ8ïÇÙOº~Ëä\\#îÇ~@kËø“íËY+\'ÓDÌ{k[ñÜPî\nlŸÊ³]:w±]jáüHX¯²Oô,_ÙÛg!Àr7ıÔç¸‡°²á0ä>!”’Bä$%éo6u@Øv MÊ…p}ãÜ+zı¬nSİü¼nê:>vßÁÕè©\r$\\m Z¼Ëg^Ş’,OÃÆ¨Ø$62€*;´µ­ıÔ¦1(9L€i%@›t¿ZC.ˆo’fÒ”¸­× ëP‘dWUŸ?Íó\05\Zt½«N*É[Zk{¿Î%rîHä,}İÄá¦£¸uCs^¶:\nôL\n•“Íw»rĞ¼@„ë©Cê#µ¶Í…lHÁãL!¡f›CFÚ¬&êıµ0ÇÓ‡?æ-O(téó\Z\n±ËqĞVBoİ —$–ÓxéBú¥<v£âÕ|…\0&¶èİvæAâú‡FÖÓâ”u?:ÀY…6|¤}36+¿óT“fÂ{Ö:©éR¤˜Ø(/¥—~³’æ[úvtó ,[Aú@ONê ¡ÿ\0ã_Ü8¾Õsõp¯¢Ö/İ¦#Â\"¡µLåØ+\\¯øÜ¦Hş%$÷Ğˆhï±Ê¨4­I  ÂÎ¦‚BÏZ\0)ZŞ€\nWJ\0FÏcÿ\0«`³8Î¦|\'™@ÿ\0\ZvîµS%yU¯RøíÆÊŞ…aãÒJĞÀQ!a\0®ıommyO0z¿HqR@Ûà*è[s‰•’:\n^M†c+>ARö ’?ÛY[ÔİDs7ßìd¦3|k30”…¢Kh«mËjKìê7¾à5®ÇFòš0÷©Ç×ÛöG\r‰y¬QåRøûò^MÉ“ÈŒÌ1ë&T-Wi\0Võ„•]#mi¿/©¢ÉèË£Åy63ÅYâÎgøÃ9	±pûŒ†â­–å\"t¹^ré%l’“w\nU¯š³é[DIe13—\ng•ñxy73¾é£1˜upŞÏreOfD|jXá,ÅeÖÛK_ZÊv¹e’›~ZŒ“W5_2Õ|´fŞ;+™02Îçó˜ŞGÉ¦·)jF))v\\–¤1$)·Zé”Nïå¨èVSU¦füÆÄñ‘äù#±³ø<–1è2·‘Â²¼š<o¢uøNèĞÚeQÜ««xAS„•X”Ô^.Ó[ªH}JÆ\"dGÆñ–œÈcYc\ZBÃaÖæÊ}†b9å-úß‘kl ¨m¨uuz[z‘º~áay|¶1y,Cä8ûÒ„Ïëxø²#Iº”Ä+!ô­© )¤;ïQ‡v• ¤é¡Eü—ÇÓã#³„Îà¦¹Çø÷.Ãá_N&lÜW	Å²Ğš¸è…Ã})@uiRVÂÔ¤[ÓUìvŞ’õP—û\rQ»Oxø(ùïæe)2Q!K„!ç\"ÏšÂÛ’jÎ¶ÛQJv/rTJmd,Ø¤u¶|¯©1ôV‰ğøl›Os¸’sØ˜qædö3DÕ;%è‰ªKÎohƒ«iò›X‹U~ôâ†”\Z¼§\rµëz	™XãÒÖüÌÀ{È\ZYå-2ü™TæÄ·Øh$ìid¨(ƒktª:ª´›4Ó#ºÑj†V$ô}@É7ÅLUDFlrvº\ZCË[‰ôÊ“\'M¤“‘ÛõŠµoÇ/Q›a3Àã²¦\'‘6ç£ Ğ:·\n\n*pªçsI;ŠĞ)v›x5Vœe§ ›\'‘ãİÊÂ„8¼çc$ccšÇÍ*Œä—€PqK+lº´•³`IíªÖ®t\Zjüz\rläkÇk(…cñ¸™’›…‰ÀÆu©ˆ5>¡l¤¬’¢+\n%77WuÕU—©eÅ¸ş?+šËà9&C’ÁÎw7-„Ç“8¸±nàÛŸJ”©D×°§¾­£IiYCÑ~7:{ì§³¸œßs–eráäû‚ÇùÈ8¨ŠÇã¶áJšõw’·±×\n|×U†·®§[¬­Ufô~%îûS+¥Wíõ×ñò-ÒR„%\r¶„´ÓiJiÉJRR”À\0°®‰Ã<zP@@;«Nğ+ö¤Ô_ö²iû—ÌL7v;Bı©½plµ;up/´BP‘§}:¢,%Ïh?°^‹2ôD]È$›:O[h+-Ù·\n×Ì&ú‰*¹UïY™ÔÅRt—$Úß¥	eíö›ı‡A+FÇò_æTğtGâ.~uè:xøÑ?Üó}ÌÎ6Dœl9¦\r\0z€0Eè\0&ÔáİAo/“§\"÷¤Ä¯ä¥D‘×º¸v´å%&L ÕÜ*_æš‰â@œ™Oæt*Ç¨ìğ¨„îq¦ÒIpŞæÆ§š\'ˆ“3“4„\\8Ií±¡äDª\r§yòTB^Pİ¯^Ê9ãc#-J³o¨(·­õ¨v- å‰ÈæÄ2&ß¯²ß\nŠº¦9aó˜ö!Nƒ}5=õuU± ûğÆ{©åñ“º+ÀÇaçGA/âÙRIñih¯IíYÓÄëèÎ\'¸bãyõ!/`½æÈ{!îNPËNOãÙÄY‡AÖD%.û£Jó#¼éÛZû˜c^VÆ^®gŠß¹8c€æ8Lo%ã9F²Ø,£IzæN‹I6)Pê•¤Ü)\'Pt¯+–¶¥¸½ÏC‰«)A³2HèÑz_!ª£9˜K@€æ£EQÈº¡]ùç9ÄñüfC/—œ˜XøHRß¯Ø”§ª”®‰HÔš¾<vËdª5Ş¸ªím9¡Ëy|ÿ\0r9™¹Œ)ˆ-ÿ\0\'Œ]•è1»MİëWUı;+ÓàÆºôâ·òp³f·bÓúçáŸ[ém„ÙŞ|Ê-ƒkü«>nÌy4bÁ>…Ã=¡Š¤!×àµk·ÒO÷W//q½™²¸U|í¶-–Ò”ãÙ-ü´‚?ee¶[1‰$>bğlrJ ²4µƒi±ı•Nl™8¦::Ò¦â2ÒÒ-ê6ØB¾“cQÈ«¿@Ìd+b@\nHòñUµ¼Z‚R¶¤ƒ JS.$Ë—´u¹#¥P”2ò.V¢t·J]™x\"G“KisÍb!êË¤WQÈ/½)V‚÷ÖJ…™K½ê÷x¬s˜è²6ä²¡M4R|Í·ÑÇ4ğĞW_§†\\œÿ\0canSD«¸ùF‚ÿ\0v–Ç°äŞßÎÏÆ­0ÆÜA6\nÜGP²‚KÛµ·Sù”~COÛD€\rÏ<Ii!\'Gó[Å)è(Ü”Ãa[ßqR\\\Zú‹7·Ãº¤”ëeÙ/}Ü,§E¯ü(ï¿…BÜ“i§%>Úbc!ª,DÛjH»Š¿êX[âH¢§Æ:L=>Q•1ñe¬ ØMİ4ÔwT­\0°øŒGÑË€úâËŠê‹-³µhu-·GM¤^‰mÔHŞÂû«Ş_jøÇ8@ËºÏĞr¸èÿ\0£–ˆ™ ÀåÒêÂ±RĞ²]&æ ˆ \n ™\0®¦€ATzPÛe	¿ï ’¦L1³9ŒÛé¢.AàØìØáõ·…—^cµ^Z=7Züñ&?`¸ ‚äšR/djf“vTA¹N„šÔ]h^…jæÌ-EÒ5µúÖ+=N†\"‰{å‹L52W¤…¯\nóY&Ò ,=w“×@…t­LœlS·•[økNÊk5É2;‹Ã4ÃËÆäv&CÁæØa{U´¨¥Hñ½u/Uû^ç&³«/7²¾ëLåR^Àfş®À¶ÔLW.#8V´‰8íªG¤„á;‚Ò:¨Z—jÖHC²Ğ˜s¨â¹NÍ#9—r(‘\"DXpÑ6örúÍÎšÉJˆZdÆJÒo¾å!Ié×ºmHä”NÄ)—äa¿Ëòys<ó)ñ™á&ZÎ=÷!]9FVâã-v„ìJÒt7¹«î–Æ¬½Ze„Å{‘äbq?o^“”Ë7\\‚>mS\ZôQ÷Ò‹,­¢ãJv€ÙRJÁGšœ²YÖ*£úü„[9³¦fdâ\'Jş1™˜GñÌc%gZZ]Ÿ06â™R&:·Ô†ÁRTMìw[Rm÷µZ×QÕJÈoãò‘Ñ+ÛÌQ|S [‰“zCñ™lÈŒ¦[	\'ÚÒ»lS›T®¶7\"¦™ª›m=œú¶6Óôü1½Ây¹ò&G)‹Ì&b\"¹õ±ì;\nK{‡ôÉf Rš\0Yu»^ú„Ÿ(VKªÚ+)Fƒ~Ûò·zïú¡«Ë9„GÄ+(©œÇ™ó2Î?ã‰bkXüŠŒ¢¶ÜK	YJHJŠvõó\Z·YÕÊQ·‘ÿ\0nöø%üQ¹Šãøş+•åÊòy<ùüÄu·éHa¯¯a—î\nŠ\Z(+íq(H şZµ]Té£-Éİ(Qü†²óXlCãÊÈã“3şª†!$G¾à}µ)\'hWeì@¬¼¹Z`ßZ7V@<ƒ‘ñ¼ÒsÊÇ™)<Š[•LÜ¶Ú”ÊBR¸­”•íI\"å=/qÛPù4¤Ùq‡ãR5‡‘ÉÏÄãĞqƒK9I(›Œ€Â_–×Ñªî¾ÛÃÌİ®,@öÓ\\¸Øt%¬Á¤¸ÊÇrh“„é_äTœ–?\Z¦PŸJB”.•°VT	@üÄnÜ;ê+}­S@³<£›‰”ãš‚ÃRDßòˆ)–ô™bO«åi1\nïê(¥\Zp[Œ-v\'ÿ\0j0˜yŞàñN=;äK€‡æeÕ…†ìÍÏzim´“uYUÔV¡b«\\ƒWÇ_¹)#›ÜÉlTvM$ı_ãs­«ˆğü?Zœßê[n¸[?Rû†7‚BƒAaÚX\nïa£¥~ÙË÷rZş£¸ÓD\0©\0u4ô ô=j1\Z(?Ìlê¦œRHîÛÓöW%bíªÚj˜¶•=ºZ„PHÉh\n»¼*Ú÷+eÒTAµû¬—fü–TşS?Ö}`+v¤g“¯J@Çßå|³‡lnm×}I\r62ß™dŸ…hêãû—HÏİÌ°âvgD›e¶†™NÆZHm¤Ä¤\0‘ò½*<3m¹a•%L(P\0( õ\0\0‹|èŒ7…S” ‡UùGšúWÕ#®­g Î–ŠË,”€¥\\ŸõRÛE–\'äAÈrM©RPÂ·b¦ÒuîùU[&µ†5ær|ldzÈ[‡µ´5nTE. ºM‘æWÜøÉqMÄÅ-Ô ]%O\0©C\Zİ‚â¹¾aÍ²	oñ“\"#J‘J•ôÍ‘Öï*È¿€¿Â™\\\"Õñ¿m³h9”È3Õ\'Ìˆˆ*#¿Î½?e\n¢m•xäûE‰qµ2™G­Iõì/Ş_Š)÷XÁÊ{RäMßK’—mHŞR¿ê#+™•î?ÛÆ„J†ğVMü[ŸYƒ’¤ÙLÈHÚPmú]OøÛºµô³}œ“áˆíÓïR#S•.qØÒ[[O°²‡™pYhZMˆP=\"½-r&´<İêÑ3{9ïÇ2ög*¥âş¥Ç&º™ãDwû7¶Mı\'- Pëú‡JGk­Lë]ÍnÕ°¿Ñ8_vÓò\\ks›äiÀËR@‘ˆÉ‚ËÍ(‹‘{,w›\Zàåèe£ˆ“¹‹½ŠËWÏşí8^9§ÚÀªO\'š ÚY¨û¿ÆêÅÀÿ\0u4ì>Ù’ÿ\0»DFOtÅOÛ«)/)çü«Üü›S9´¢u•cp¬]1˜?Ç´›­vıJ×á]|X©}\'3&{öÛoBCà<Læ\'Gm)»iPÜ£İÖ³çÏÙƒ³¤Ù{s+ÖãBÅ ¦ıº\\W.gftÕUQkpø6i´†À	½¿e)Øô\r„&ÁÄÔ‹lŞ\r¶Ï˜Ò¤$-J@N€‚{*¬55]6ê¡§îª¶Y!D¤\rÄ(ØtQ=õFË¡¥>zS}vu¥ÚÅ’ÙLŠB\\ó‚@°¤Y—H‚¹n\\¥.nsóuüh¥KÌk›rf1ñeÊ}ğÔxÉS:£m©H¹¿Ä\r+vM³.|‰&ÙÎ.QÉfòŒäì»Í/ùêÛ¥LƒäM»È75èqcXë–Ï™ä³b\ZD…\\©Ôµà}>&ƒa6>÷`Q¸ü*`ƒy\r¨©HBGgAøT´ÜfÓçXŞ¡ø~\0İXÌàm#[“aû*X4–•e²ƒ ¤ßêş\\tŸ÷ªùPµ\"MÖ!¸êÒúVB@Ë’÷òØ@îm¾¶ ‘Db\'¾‘ëÍ\r ÿ\0Ñh\0ŸÀ[öÑ¨3r.˜êK¦J–ò\rÒÑã@vzJôÕ¹•}¶PÒôŸãçİeqrf{i”œ¤`ıÅŒSmgùIÍÄIq…&ıó[Ûñòê’,Î„üeATÂè\'pª	\0®¦€	\'º€4\0ÛA%n÷6Ñsf§ Yhl<£ş6îÒ­ÿ\0 ~5Á÷:FDÎ÷¶^qµèÍÜb÷£Sù‡^ÑXQºÈÛÉ¶µşôXªz0‹êİ½MbÉ]Mø­¡U9Ö!bÊâ7µ%µ´ê-Õ*>8­MR ¦œ&œ<I˜i2šM™+\Z[nÏe„tŒù\\;´±½»k´õSêq=\09íß\'‰&B|ŸƒšË[qäz“Ğ¥¥Öd,²´¢:šNòT7ZÃ¶ÍqT“ÖWè\"uĞtñ9ÒùC/Ä9o2}¼ÑÇ‰Â=){£:·İŞ;á ¬%{wU¶“j¤•’•är´î<ŸƒÇxÇ&™ˆæ±2NıN#7%6LÅ¸¦rqzlI¤Y)q	qO•jÎ•[dy+ô Ur\\hü&H¸GxÇ#Çq¯r2¥¹ìæb1x<‚69EáBÓ»E2´©e¥o &éÒ²cPÿ\0]?ªøÿ\01³ù¢´d=æÎÆä|¥®AarmòY‰ƒ;’iÆ±iZ’Ãñ^”0V‡J…Å¨rBSrkR­mDÓúšßà\rxğGyŒN#dó¼N3\'k-ä>æ ÇÈcVJ]qÙl9v‚wßjĞ)\'­VŠf“¸úÙü„¥¼Äªä{y-qæg›Ire<óÎ½è8—Øh4•m>¢û¾½°êŸÓ}RK´½\0å I‚Ê´^•w8Û¸©‹–•dád¦(+bßXH-/GŠm`võ5Z¦Ò^? ú^^¯Çê;¹½5£•Fjo+ÄIDLï!‡8ó˜ä8…ÌôWez‰s¢¼ÖA±½/ƒ¶û\Z1Ò‹}†¶ï+TÎIôòWÊ—¤)y–óêÜ\Z[jyÆĞÒ\0	=–Ö—uÂ5&üèÆ)K)ÈÆÇDçq;¥´È\rlÔ*J”­Òu®”;\'ˆhq\\î‚ÁF‹ÊSŒ\\\'Şo&Ó¥£>JÈua+°+²Ğ¥ŸQ’ÏøÂ[ÓıF#/‹[“³&1R¦:óyÜ«n¶”Â†ÛÎ\0²¾—¿ìÖ”’2ÆY5§…·ÄŠ²¨Ry§bdC!‘õ0Š”†áµ°\'`Ûe)R›lî(YÓÆôÅ¤—JT?ÏñêuOìï‹9‡á9lÜÈš’Th2ñ’¤¢F>*Uk]Fî…-Dè¢A\ZXWc¡*íêxÿ\0}ÏÏ*¢z)ıYn‰¦µ¸á=*@.€1q­\0\0ô WİDIä“a))XîÜ<§û/\\ŞİbÓêtú•#ĞUmô8ÕŸHÄOœ›£S¯]<*¶Øe\nËî^TFK©õ,|Çázçåzèvz˜ä©Ù‡ªòõºŠáãJ:p[Ÿ·.XÂd¹„¦ìö]Ã¥uÙ7ucıåéò®ß¶áãNOÉå}÷±Ë\"Ä¶Z²Ëşêê|õ\0b¤€º\0© Áüh$\rûè ¯™QÜZšÆr[iÁ`‡T./Ù¨şêáŞ‡ch\'3Šãpƒòæ}VAâBBO¨¢l-Ó¥)µT7êÈÈssâÂVÔ;4nw(şcñªrlrÂ–ä9—äÏËQr\\Õ)\'ój\0\0©H²PNŞÅ{.Ÿp½>WÊ¿ûcyN	O×©&ËuÅ\r}@ó›ë·¬Àœ¹v:‹â˜œ4HĞáÄf<h©Û3(Km¶)J@\0|5TÂò¶/ú(B”¢Ã¥íSä)qÉP:’{¨%XÓ‘K‰P;IUô#Z˜,¬1³<F4öÖÛ¬¡Û…¥Bé õ½Q¢êĞQŸx~Éøo8zN[ëÜs<à%3cX¥J¶¢²‡ÊµaîdÅ¤Êô—¯.êÏ~uö‹ï_\nuÓÿ\0yãRl‰x£w‚ÄÂÍïşé5ÒÇî4¶úÜ­k©\r+ÚOvt2ß¶<™n5ánÏÌFÚÒ»¸×ü„ÿ\0‰“ÿ\0ßŠûU÷Ó<’ëœAüCwıb’Ú€ñM&Şãy“E=¾şGb>Ï½íƒµm3\rjô–µ$ş\"ãöU?ş–6h]­d–x/÷Ûå¡ÎCÃ\'>Û\'s’qá2‘dõºP}Aÿ\0¦±çÍLŸµµqp¸g»||zq¤º¸/\"ÁLÉBšR~!@ó®eéj³wö,f+—Á–ÚRZT.’UY\n<Lv³œeIM–{EûjüĞ·@ÏëMÛG/b;}‰T4œÍ\rlz^Ê¨v\'€œöe +Íò:\n«±?lD•–üşo‡Â—kU\Z“²Û‚ˆV€j/ÛJv‘grûµX\0MïıÕMËA[9Ÿ\"Oèı/ZqPN[Â9ÿ\0ï<99Jã^»-+~QÄŸÌ¯ĞÕû‡Uxé]Ş\\çïv[|VÄê¦Ş¥tP4¸/ò (²4¾&¥lıdf€ıUQÆÕ:À*–ÿ\0R˜¬ŸÔuQğ·å­\Z°ˆ²n[@R¿şêjµø¥¡søÚ†€Va1·¬;9ÑùV¤Ù)ÿ\0q6°*”¸uñ´ú%# ¹¶•&}uhI>:Ğ_Xâ?(@×E)_ê \røY‰¨Õp%L\0=WFĞeïB	%1Î28\\+3‡˜¸¹Œ,¦gb&6l[z2Ã­,Û) Ÿ\n	Üú€öÜœW¼Ùğïrq\n@c”@K³ã ßégµü©±w¦òUkş’\r6$*PX,ô4\0Qé@Ê	Ag­A$ï;Ğ#«Š•ÍŒŞQåKD|bBd¿!µºãm¤4»(\rÃPMs=Ê“TÎ§¶^,Ğ‡t9wtIk»f(”[ó&×Ô°DAÉ£—­4=+&E©¯^y|ä>Hş-i;3]uG;9º[Âû€˜ìãÑ7\'•’Ä¬[NùêƒO8|¨Z\n7î=¢»]k;Sär;”U¿Ì˜ù[<Ã3ÆùwkŠÇ“/.Ü9Ù¾K[ÉOÓ1\'ÒKèŒâRµ­\r ¨€«Ún+_*U©òdUl’r¾ÃÌlqé¼G=2l`Ó‘\Zuöâ2Êâ©)—øa¤]Ëooæ&ëİ})]‡Z-\'PÅ6z‘/à\\»Ü®aÈq0yt—G‰Åg³*T…‰hmIZ^ĞÑvéZ±A:“©\\Ò©Z7«z1ï$ö7#+ÚNaƒ‡=ìEÙ˜IItGe¥Ìd——Şãi^ò6İ-k\n‹Sî×’zyDÌ1î;7x›ñ²Ù4ªtñJ‰-N¾…‹ñŠÀJÚX+RŠIµµ&«l|u u7ÔØå°ùè|=\"\'ô|$¨ù<h«/ı{‰ŒÚ¤Âv[k6mÀâ[P)6Ú-È¸½5lJºú(œ?ŞNE…w“Dåhãó\'æÜÒç95ÖcÉeIz«ˆ—R×¦@¢å&à»í¤ÓekzO1ˆËerùÉ‘ñ9?ûX˜ŞC\Zd´ËZg‚›ºã‹q[‚v‚6ƒ¢GJE­í&ìZÇ‘áÜÑ\0F‡+ÿ\0s—¼[Î7\0bI(ojÊV¢•© ‚€,m}+7ör™®©~f´iÜ¼â›9ìj¦ÅldñÈiKúh©	+h%Wozµ¿J[¢\r*ÈHÈå³‰ã3Ÿ™‰Œü¾Bñq¬»KL‰2êÒ±éÅPHm\"Ş_ëWQR.–³?™ˆÑ3Ü33“òØèÊiÙtoqNºÙè6íÆÚ{éEñ;Jcku?˜„™ØøÒ1³ò†÷r†K“˜p+é\\iÓiM”†Â‚“·j¯k_¶‹UWhø\rSiÑ¢Í{1íV3ß]şO›”¥ÍöJN,)¤¾1Ùa…4ÕÄt>—”Vnu´uñs²O\'/Ü{Ï­GÁ|ÏúÁ×Øp`b¡DÆâ¡µÆc™D|v>:BZa–Ò„ \r,\0µv¡#Å;;9n[\r\'¶¤€²ª\0,«­\0w…\0`’u¶´\0Úäj†ì%…Ïb¸×r+«UÀP•@íWCøÖN×VÔÛÒç[¦“i‘Ö3Ü<ygc²š6­«Åßº¸o±\Z‰ô¬õB¹æ‘ç¶ã8öİœ±ú#$¸w|@·ãT}‰Øñuz—+öû—ó)ÛÔìn?\'Ì§Éyó~ĞÛzš©Ş§Cc*ÆìÑ…öıÆØ	ş©“Êå\Z­Hu{ì”6¢>dÕ¾e-İ³ÚcxäŒv‹ÀEˆ¸ĞqL&<1»yØ›ê¥7(I·ZêàïñJ­h?Ùè¼¶µçV>\"zsÒ7ò¿ø`Ù_®>Åo±ËË×¾=Ï8ÚÚYmÄÖŸÌ…ò§§\"Bè -]MIu b€\0zĞA4f0œo-äòF:dM§ÖzSM§hí>­’¤‘ØoMµj×Ô}/tş—©G=Íö7‘“ê{cÌdÇsüÎ;*ËÄeó% ¡Å[±*J¯üB¸}šàOèßÓÁèº}Â_ZÓ×ÏèE±şÔ”¼÷<Ÿ!Kÿ\0£ŒŒÔfîÄéygçY“6[<~öóÁ8nI¼¬ŒHærZ)úVy5æÅiw¾ôÆAeµ*ÖüáB­‹-ªöBs>j%¯‘jpÚŒÛHa†£´Ø³m4€Ûh¢P„€`\Z\n‰—\"^Ãé¦Ê€Rû…9!-›!«Ø¤:^§‰NL¦­nój Ù’Îà{ÿ\0†§ˆ+­”X…xŠ‡Ry‰’q¬¸? ¿[øÕ«ˆoñøË7(JŠ{mÚ*®¥•ÍpM\\‹kÙj¤‘=Î<Ò®6„ƒù‰Aef„¹<q›[bMº[­	®7äñÁ¸Ù°/Ş¨ŠãK7ÀğÙ†TÖc ‚,í%J[p£U°Êä\"ÉŞÈcãÿ\03‹çr¼aä›¥–2bßÅ—÷?İP¨ßth®a	Ş=îßM=–4B™pÃR:MâPOÁu*ö\Z²Q‰î{Ÿ/àÉq9>>ò”•Md¥¢o¨È?ú¨ûoÆ¡£°¹Ì	­…31 ±HP#^íim5¹?lS°òNÇB’NŠ\'ûª‘Ä%ÉÊÕKrÃ¯[UYUQ£’Í·r€âR-æ7îñª4]T„9—.\r¥iC©°\Zëk|é´Ç%ohE&÷gÜÁ‰Œ¶bº“›tÄO]ƒµÃà;<k¯ÔëËÔâw{Jˆ¦ŠyÇ–·]ZœqÅ­Å*êQ&ä“ã]„ óîÍ¹f±{‹‘İW‚¦ÛNMÀ\Zè5\'ğI&òp¤…®Ã¯âE¾dTm²âVvGiR–4ØÈ‚–FÑò½KMä¾lä@lù1µYÅfäü…DºÄfĞÈbÔò¦\\³±?NãøPúbÎtRfÁØÜtí@ğ¹ SHêêÕo¿@q¤¢şkãz\0vc­wuBÀ/r@Ğ\n\0Rr`ş‰\Z©-ÆŞM$>è*B™KjHm;A#iWNßˆ 6#FK¬Äy­ªwĞiåùqÕ$-pùe@ùV;tV”DÕoüdûÖpÜ¯’û\rœ’ã09zÌğ˜ò”Æb+v›¸§zmÕMéùªJÛFv‘_ßQP‹”\0Rˆ\'J\0-T\0PI†Ğ\\Z¸ -a%G ©5œæŸsj÷+ï?Í’L.\r‡}Î	Æã©W#\ZêÜ¹[KÈ’¯X÷\r£[VNİ9ãkó:}OúÚøIãJá6•/rÑt_ÄW–Ç›¤­´ü5©+T0sñƒW#[Ò2#F6@ü¶ô_ò„Ş²µ©·9½ï·™\'\'Èããe°Ì¨êRU±iB€q%&ã[…WS¥’;‹f4qœ¿†WÈä°¹ìÆÈYæØK²z8mIyn6÷ª€  öÏi×Jédª²õ9tzë±1qßûoÄxúı¼÷7 ï?Z”Ãøgg0Œ{1PTd\ZaK-%\r¥J’²T£·oh¥âÔú–„K­œ.{‹û‡ö™>åp?tOp !eò˜9\'“\'\'7#!¤IŠæ8­õ$¾X>›fÁ$(şJc¥xê´+KÙÚ=J›Ègdf/Üyw“È%Ksê+ÏF`I·¢<ûl½¾T¥SúSå#:ªúx¸ø+“‚‹#€#µ”à1sÆ•2caùi(DˆÊHõb‚´úˆB\0\"èè¯[,VŠc×Tˆr¸\nä÷94ùNcÎËãŒ¸¥6Tën%”)„–ıT0uôÔà*ÑfçJ]Ujæ?ßÔÒùä[ìM<;Şü÷c=Úì>9ÿ\0o±ì 7Å³.-—âËm•	Nãâ–¶˜[Êõ‹N¥l \r5æU)ş7?İ£¼mì¸<Ãœ{€ÿ\0 ÇcXÈË‡ş6ˆïÌmÔ¸ÕšlU¦Û½É=	‰¼”®JËĞ×ÏUg9ÍGo“r¡Š•&äwU\nÛUÙLXÂÛË€¥IP½Âó\r-HXU\\ñæpkr$“‹8 y‚Ìhò!Bi—,ØR½%“ùvªıt¹¥®3&Šè7õpóíOÈJaUã¨D[‹©*y\'m÷\0m¡&úvÔÙ=üVÑµÇÌâNE1’Z	nÙ‘‚ZbşT5è­HIQ%\"ë>^µMKÙÁ7pk²\\—”`¸ŸÆf1¼“19‡šÅLa_B¨‹xªLùO\"è\r´ÚTIAÓD€J©ôëój¬ÉŸ¾±ãwÓŠıgÑ±âœ7‹plS8)ƒ†ŠÓhnCñ\"´ÃÒ”Øÿ\0›!hH+Y:ù¯©Òºô¢¢„x¼ÙïšÜ®ÛcFßê«	R¼zu¨\0‡\\KH.º´4Òzºµ£ÿ\0Q T½7%&ôCbO1Á°KmLúçGTF`xo°MeÉÛÇO2k§G-¼GÌA“Íä,\n\ZZ‹tï#ä‡\'¹ÿ\0â´öµÿ\0&7¥eó3®—æ8® í|í¬9;¹-»7céâ¦È-œzŸ6X*ó_´ÖyvÜĞš©½Ûş5.BfNÁB•!&áÇYI7/ßó©®$÷vòUBd\Z1ÙC,2†ZhY¶šJP€;€N”èƒò;9f£ìXj\0éãUhµX˜ã	 ¥Væ©7a¤ƒbH¶•<Q~c}ì”ÜCÈ‘â—V‰‹ãSL”Â²(dÉÆy.i0äŒ“(ÿ\0,éÑiX×mú©$é­wzı¸‘Àíõ^OƒII)QJ´RtP=A\ZkZrc\nUH\Z’Š:“R@¤¼ŒşNâ¦d\0LD®ğq©\'Ñi=…Bşuˆü«‰Ÿ³|¯W¡»Z¸V‹SanHJ\0î\0iIƒD›hqs×» ©nÃ_8`²bµ8°/Øâj\Z‚ôÔua’U³·^§º­U%o¢(Jv¡=t×º´Õ[ZĞ„Ø{uï«AX‹÷Q7I6ÒªX÷©© ”I0·’/cnÊA~ $ê:UyIh0R›^× ô¡²} ¥tÕV‰å\0~˜+[Xô4*‡ …ãÂ…†—=EIä&HÆ¦ÆÈ>ßPê]XD’	RwxöÚ¢+ïbÓr’/kiUœ„—±éH±©ĞöÑÈI™ˆ)µ4ôt8…‹)HR5\r®FˆŸ7íêäÆÆ\'%W*“QŒIñJ<§âSUm¦fFó½¸ä¸÷æ‘&S)$¦4æö«ào÷¦©h~×*YéŞàb[r¸œ‰Í¤² -/¤ı¢Îÿ\0\rS…_’ü‘]¹¹’ ­mdbMÅ¸€w\"LgY#ÿ\0REéõëÎĞ.ÙÒ+ß3÷V*\"Hy+H)KiVªQ\Z\'çZğõ\\ìs;=ÅU¹N³i™™ïäg¬¹!õ\\ß¢SØ„Àv±ÕUhy¼·w´±(“p*ğ,^¾6è*YƒW=,Úoe)Jæü(‚¨ÒúAô—)¾£òX¿j¾u!#•†Ú¾ÂÖô™Puè$UbË©Kj¾ªH¹·ŠÎ´¼”6“e«ÔPÓ¾€\'hÜ ;\0IxY%T\0œî6yW‘)!Gó¨è(Na–Â?çM‘¦şáá@\ZĞqò¥«×UöõS‹Ñİ×ëò cØc6	U¾­ÆÖóÇE«Ê•ømUˆ ®ÌóÜkà¹NYƒÍ8TøÓñ²obêá8jç®äí±ïMÅOÄ§Õ‡¶ãà½Şö÷ˆû•ÆÜB±œ¿ÜÅ°‚ÒËDÈ‹ş0ğR:ô=\rA{“z	\n \0vš\0,š	 ¹ïv1~Ì{!ÎyléŸK•Ÿ‘‚áì\"Ş¬Œ¾E‡`!$ƒf.­Cò¥5VÆR²àùˆm•GI‡&ëP¦İOPãvRÙ®à\r-£}\\êöOœ7Ì¸oäˆP\'3bD„÷?·kÉğÚêT+Îå§º|o•d±M9½#Qb:ÕKFwz€õ\"Ö¥İh2Œ‡y<\rÌ¼whl<;ë%Ñ¯Šïw9,d¦“\"D2ón‰ŠCÉ	V»wi¨\'S¥mèßÑ^İycenöËåfóƒ,ò¦äDáQPˆ­¡nÈeô’»¥aA\0n7 ş`@ñï*Vº&VáK8¬mÿ\0tpø_şâqü¬Ö$LÆLaÄ*#ñß!É>¸d´Ês¨p$”’EVôû‰x€¥İtdu3šÄÆÏÏÍÅûx8¾>i\\<ô¶RùLÄ‰	vAV€îÜ„‚\0¿—JËö]’NÓê>¹¡ÍPNÜéùIîòY’Ø~t „ÃmÖÑ(zÀËy©ht:Ú…’«©% ^ö«[\nÆãÏ¨ËYåSéà=ëæ9nS\rÉä8H¸Ì+Jú¹¸¯¨z\\¹RÒ•<Ò–ò‹mF¤‹7¹[7\nmÜÆ‚pı:o¹ì5_\Z{†ágãs3\Z–şP»ˆ-EIm5êìúâJ²wíëÙK¿ñ5âw¦¬rc£{s‚À}qÏ°× —ŠiŒãjZ_•-v[¦ñQtuJ€))òíóuQğ.¬ıH›æ™ÈÁo!?”È\'ÑÁ5ÆÚ´mÊaÄ¡Ä\r÷*ÀÓ­RÛz\Zí©äà9¢dpoqXÿ\0]ó‘Lé{w-·Tl —q¨&äí=UIuæå97S\"ª†e·²OÍÂr<æ6VB5%åDm„·ôğ÷Ö´„)*^Õ”+À|j•§Ëò”ndÄhpùÄòoã‹%ü<Å%([7©/IºVÁ{ÚÀŞ«Ã••¤Ñ[¸$2Öö\".32ãäœŒ©ò¥Jl¶Èu²æA\'rBA;}Æã°Uå&-¶Ö¯ñğ:göç„àø|¼gøj2ÙÅ»ƒs÷\"p¸ôF™Ü‰am•¨¥†\\Ü©pznÂ—-=;ßË{V-]¿‡æ[Â~6=?»]kQËÜÏŸqnËkäy Ä·Á0ñZkÖş¸êU’;M+.jã_S5uúÙ3¸¢üü„¯y¹W!sÓãXVøü5\"l»I”R{m£h?#\\Ü¾äöª;X}•ÿ\0Øçå±ˆğ²ÙgS\'5‘““wø¤,¨_®ˆü£ä+Ÿ|×É»7W<J(’ññ¨jÉ	µ»*å\"’ §P,OeUÔBƒôîZÛ­YP«¸¿\ZS´Ó÷Ó`]®8£Gè:ô«¤\"Ö›X\Z˜ìiÉ@±6Óº¡¢õ°İq*ÜE´ı5H™¥!Ô¶’/ªFµºÔce¤Áp\r%³U+ ÏÈfqìƒs¡,¥M}=l«öSpæxÜ Í×Yk±s‘y$Vs1\nm1\0¾„ôK£Eş$^½œë\'”ìax­Å›\nıTáF¤ƒAVöš’œk!(E’‹¾çª­˜ëf	@{éÊ¢-sÏ´’l:X‘RÑTä‹²Î‰\\A?òâ¶†’	¿˜İKıª¬÷fºh‡¾%;R-`é˜Å]è;æÔõ¾î·ğ­	™à!×/©>QùI¡²RñÔ~Pt¿}-²ğ¹E$‚mqoª®Á?X€\n¨’x€Q×OÓş‚AÅ›­Iè¯ßz”ÊÁ¶•¤›ƒWmƒd‚|-BÁé`­F¤÷U ¬€(J´6*4LšÇ\nÓM?H5V‹+	Á=H°ìøTAnBDŒx7F j ½l&¹JB¬›èvŞ¡¢yr1Ã]ÀÔiKhml7¦ã’¯.Í·7½´¥¹\Z¬5æáÒT R\0¾‰ v~ÚU«#+a™’ãQ¤—ã¶âln…$(Æ”Ó[æB¼·ÙÈÛZrœS/yÕf*¿ˆRBTÀÕ©ØÉG¸¼˜±İjŠEï_ÚV#‚Ëò>ø’±Mª\\Œ`qN!Ö[ÕÍW ¤kk×c§î.×U¿“‘Üöêª»SÁÏ÷0r= ìsõ×-\0R«|\rw58pkÇÇIR€qµ°-İ¯ãÒ¤D,c-y‚7¯K¸¿1 ÂÓ¸S‡uÍ…ÿ\0°\n\0Ù‘>.<8¡ëŒ£ãn”ˆË—;ù§ŒÀ‘ÙnšĞóA\r£ù\rìîîÖõ;¡.DfGù¹ñâ“Ô-~kxPHÉbn’‰ï=mSè²µÆÔ(ßo=	Ø>­zu[kû($Në2&54X´4¯)\nú\0pÇ.H	SÛ\Zi\"á»(‚Õ0´©ÌK.Åhí%!{¥ÊMíû*\0N}KKìMl–ŸYDhRêt#ñÓ?üqıÈØ^åöw’Ï\rğwd\'ú¬¯åcyRSµ·Ñ(È6=%[OP7AïJ…¯~£C~ºP	…(Ú‚BÉêh4¹Ï3ãşİpŞQÏyd¥Ãã\\;şW2óiŞç£7ØÚ?RÖ¢‘Şj%.™ï¹¹i÷=Ìcfò±#ŒàPë\'…Åw{pX}@­Ù%Éí£–ìØ*VlÇURD`«?²E®BIShî\Zõ5V‡£¥Ÿc|éna3Ü&t„™X	Ô \'Qº$ãg-~Ä¼’â®W¸ã‹+µ¥4tÿ\0$8ÊFíH\Zç£I»)½è¶Šï>4³pƒˆp„‹øÖ{£M,S¯upIpJŒëalÌml¸., F½–ìªa·É¢Ë•lğ\\Ú#r¹x^7Å¹V[â>;%1Ö\"eÒ‹iˆ·€.Ü•7¸mñïôøÓpü3Íç…£ğYnN¿q%{e7<¸\"=‰nvwŒ}0°CsòXu\r¹¾û¶8ÚÆ€ƒÖ›Æ­C3\'¨DèÜ\\`¸%Áò‰ó1ü“pùG .Ái‰QR‰jqµ!¶a¥§JH@)RnªiU*¸¥ª†öDVÏ¶2¢rLŞƒdqó38ôœ„¹ĞÔÔ¶Ç¸HõPÓeÍ…$­»¤õ²©?rTÙh2¿ºS\n—†áîñ/2¸Iœˆe¹0R^›Êúßõ}@•”¥ålšë§å±­\\ei±E’¤u”•ÍF>ÎI‚Èf8æ ?!æ‹q­}¨AR\0XZßJEp§ªòkÿ\0!5‹ÍÇnV\'?Æ±ñ™Ÿ)\nKXXÏúËFä’CM‘vÃd\\ö[ATû\r¨lÑLÊ¬rğ¼Ö6¼¬œÌ¨é‘29F5õãÜYÇÉ	¹.z›\\o¯åM÷^úTU*®%İ›i†óìÓsO½†|r(cÖŞZJŞ2n¯rØŒæä¼j¡u[ 5KVµZniÅf÷Üçóec”‚…F’Ë‘%ÏˆÀL¥ÇbÅ´nİµ	ì¸éß­UÖQ¢®áN{”—ôÍúlËur1ò]p¸ê`M’|·\ZƒÖıjŸnÖòÉ[Û)Ù¨Œ~|C‘‚ò`Ü,ÓÑÒY…•%+/\0„¥…«¸Øõ£ƒKB™²NšJ,<|=µöã\'™ÍÄË=˜ã/8Ê¸ïÃd]J˜[n¦Jè)JR„¼€¢}EvîIÛWÇ^.LVëß2Uˆ~[Cç÷sîÿ\0¾321¸V*/¶-§=)¨ÅRóOn×ÑfS 6É·æSmÜÊ¡Ö­Ÿ·d´Ğ¾gÅß\'éãôüs„+Õú¹EÉR È”û‹yçŞ·*Q¿Æ¸÷³³Ôér­-	Ó\r€j;mFÃNË|(U|£Ù˜M \0,*Ğgv7S şP\r¬UßAm!”\' \ZmJA&ÒGN¤ëSE6BmckhOˆ¢\nµ&Ğ”\0²M]jHâ\Z%Ø(zÿ\0uW wÔ¸\0—¨nK%<› jmÖ¨ÆTjË.]DØŠ[4Tfå)7$ô ÒÚ4QŒ<ËeM+ø¬l|EVGĞ}É-mæ0o+s&:I×SeWgÛ²iŞpídNdÜeuÑçBX†`ĞU€\'­IQõ”Ğuğ®%Ğ½…Õ¨¡6İ„ÌœŒ½I¸Q\0éãJµ†Ö„PÄ°rs$,èãê\"ıÀÚ²İêk­t$llÔ“q·¹)×CL¥…Z£©•—u°µÁ§¦! .ô±ó ©d!Rì/ptÖ–ØÚ¡¹*ym$…\\¤u¿â)V°ÅY¿ª@\n¸¶¢«È¿iŒ€ºS¸oz•b®‚ÌyiYó£²®˜·Q]™¡îµ]1m\nM¾,,@ÖÆ®U£a‹şaa×¾¬™^ ’­×Q;Š{;êS!˜)J¾ºu2‰I…•¦Š¶ˆ\"Mw[IÂúm¤Ò\\d…¶ÿ\0mU–Z	OÄE¿& öŞ–Ñua½&7¶†şkô5F†r$ÀºE´øöÒ]F+ÙXôJëhmz[CU„\'ñ{Á»bàuî¥ñ,¬7gq¸ò’ãO²Ã¨So¥CE!bÊ7\ZTDj‰m=\nsÎ&¾î1ân¤ `òÒ£5»K´*h‹ö(Z½†¼ñÖŞ¨òYéÃ#CQ–…İeZm= n§!\0½\r©%:›^Ô\0\"Ó!Ö™{èå8\nPÿ\0æı×éz²`\'ã0Í\"K÷KÒÑæx~{ş¤÷ĞØ@®©/2°Ùl-ñrß¨¢ˆí—$)GÀ\n€5ß‰‘Èòù+Çí*@±ìŞGî«@…€Â‡ÓÆ‡)WÛë2±%ÂGzV «üA†çÊ¶²c¬ [ĞZKO…J‚`\nÜ@°v2{FâÀ«CøĞ««ˆŸÎìˆ;­µJº‘§Mu2»ÍÍ[eQ–ÎI›hv?ŞAıÕ\07ı\\bWé¼äœT”›†º›R¼?} ¾¹HaÀÛ¡E\nKŠÓz­b¡ñ½&¼]i(úi+…„ò_†úgy•´óDj\nb(>«şÙ=åG¿~ÆğOrZ?î	qU‹æñÒGò³xÒ›p:z¤%áà±RA;Ê‚BÉëA(§_r\\gíİÖšQB²-â $ÚÉ‘•ˆ•|¬\rÅVÃ1~ãæÉ(lé›dY¶Ç[Š×¶©&ºŠ	\\–í¸ß´üzÔl5Ï±üüûîÏHXÅÈ{úntŸK,„Ÿ×µ*ÏÙÇ÷(Ñ£\røÚNññéáÖR7…”æàÂh=A®Ìé½´‰mÚÇP.Z±Q!	+A¶€¤ŞõK)&¶+/¹øBì7W·ò\\›vÚ²ÙqfÜVÒ(ûÿ\0Ç¿¡û‹”p0PÎy´d#­#OPÙ·­â‹üëĞôoË\Z^‡½çÔeq¯s=ÀâX™Ç9†[c(#êäUùvíq‡JâJt!BÖ­°s¥kıÖâQ†kÎı¤ÆòxÏ-Ñ–ş“-X!!.„ï+e„8ÂŠõÜ\n[^«lI¹+ÊËDÂàû‹ì^S’IÈğè½¦˜Ì+‹™>V’^Ö“Dú)AßçMŠ…ÏZ‹Uµ\rJ/[C$˜şÙágšä¹X^âóIO?–Ã¹“16Ëˆ%q•\0SéZv›z‰,Ü…\r+3æ­®Œrt‡iØÓV?Ÿ5šÂ}ÌDÂr‘É ÉÇ*6AÈå3yZ½Ì¢ÉFëæ\0\Z~vª†õ+l•™Loğ_jù<¼£Ñg˜üK%ÇpßTÛ9HªiÉÌ<} ËÌ8€}µa\nÜn6´ºU&ÿ\0ûöIÍqr±™Ù¸¼	ÀKecËÃ4XmqYG¤\nR”à±U¿©M…î._¶¾ãÌ«äŠ²|\'+\"cØ¸ö}é	TŒDÖˆâÔúÕ±%.m;R\nT®ƒ¯QTxë0lÇ•şBæ/ÙîBœæ7ÉãøQ™éçICßFÃ	Ş·ŞBH\rÜmº¼ÄéPñ|Kÿ\0’¢R‘-˜şÜb\ZÉ§/\'É^€Kxü¼¶[ƒ\rõ(İO´p!$¡@i{\nŸ¶5d´ë ÕäÚ<©.­2i¸’ƒ/ºu–@-%ÖÁQJUíÔš«„iÅV7q0ò\\—\'2Ö§Ÿ’âZe¤şPTGDêM¬n¢TGe½›öæâ˜<lxãsM<«~wª”GÇJçärf¶irYLf)¦’‹jmT¸æi”¤‹ûjJI¶-qkX´•/³K\n\0È|[K(Ğ\0ËJ@Ğ^úkD–HÏõ\'MÀoj‰\'ˆ4ÏI6I\nî×¥D‘ÄÜDÛBOuïRŠ´,°•¿*‘m€ĞP²zô¡ «S¢u\Zëbi6Céa¡6.Š½ÉÛJ±¢¶Y8éóĞÜ\n£5Uˆ|?.xï/ÇËİfp1#²èpÚµu2p¸¾æ/»‰¢ß¼”%jØnÙó6®ô•é¨å2Õ†k‘W(À\Z\n°·áRU’“(HÓ °®MQ­°¹mA¨½E™q–‘´-DÚÄ)5ÔŠ#<K _Uù”¯IÒ²ßsJZv\'Ê„¤\\‚©şÊm\\zCrÈHüÖëÛ¥=˜{Š Aı·«0Cj{âÊ±²G_Â’Ç\"7ÌLØ•‘}Öı\rg»4Ñ³œ±¦ß,¸±pl\réğ9cĞqBÏ!À’ÙØ{é•¹GQÛ*•uíJml&Õ‘æ¡Í¥\'¿¥51-\níÉ±Ğ1ó_ ¦&)£i2M•snûTÈD›	“c¢´©’\ZL”‹Üu*S\"CÃi¹¹µÁ£@R\\İ} t7=Õ)‘d¥_[£J$“QÍT”ëz†Hë\0ŞÚi×Æ–ÙtàG~:IQ)ÔÍÙ¯…VU‰ï@ßuXm×hª:—å[˜àt=4íÖ«À·3MìPH*Z.vØÛ÷Ôqrq‹ïˆ;ïTlâ\Z\rÄæ¸xòÒ¡ /Å&#£æƒó®÷¶ÚqñôgÜ+ŸTSÿ\0L\"KJş4íZOÃOÚ\rtNq±éé³õ(…uÔT¬¶É_¨knÚfÒ½6Ô ‰\r(*3½?ÂM\0’u•¼‚Z›J):›ió½„¬/éÌ”zFBwµ9‘cq¢’´ô$ê$\0MÇÅS?Z¨ñÜ	WCiïıZj\r\0†Ï–<‡R±şRUî¤+°õ#^”šßY:*–Ì\r›,‘t‘ßqÒ€C‘_ò¶~•kèİÁBşGJ\0F•‰q³õPœ\\7ÇU°lÚø“ÙDÊ+és±’ğı2ÛM»Ô„|(*Ñ³ôMÇJ]Œç«~d(É·urMØ%ƒ%¥‚ |º‹:ëİ@pÿ\0Å/¹Ê…Ë=Ëöjd‚\"òH)å|q‚t±›cÎJAêÅZüºŸ²&Õ…“ÙÖÿ\0é×²€9+ÿ\0“ÿ\0}°p8¶Ø<.z3¹ìÆEœÇ¸Øöê9\nD‡ F|§D-÷Uê”“p”&ãQU°ìKÉÅä˜êRjó!Ëêwwš£5TÙõ,‘æ¦ÿ\0ÙP5½u¤‚›p~uRèíÚ¯¹_÷×¶8å¿êæxú¢çMÉz8HiÓàãE*øŞ¸¼_nÿ\0t°_•`ºp^ŞØí)½gEÙºêÒ	š\n˜*ˆ¯›a~®+éJ2	åHËI4a¾§¾í¸“‹ÅEÍ¡%/qùÅ——m}	GmÏÁiOã[ı·$>>¢½Æ“Y(–àUÊ÷÷k¸‘çìàñ}ÑÚmÒ¤ª°6Ş@7UüE[©Ì=‰‰¸©²qS7f\\GÃ©WO+ˆ ;¨Ø²d½Ã¾á}Çáü®Fsòyd¶Bqù$™9!@:îš{viĞš¤U[s_wÜÛ=7\r3ÜxĞy4¾6ì©|{‘ÀˆÆ;-SÈ(IeöSzêÚÛ Ù\'E$\ZÕìÆıàˆ2ÎÚyIÌÎ1x©YA–~TeFôŠRÚ FÚKó,ªäøª¢t‚ÿ\0k—òvşäçÿ\0íÙ187Á?Æ–·±¹Ì†<ä$°áHBVÒ¤¸¤¤7úSao\n«L}1%åêWCîS*ü·óœ—%Í2rä9&\\¼ƒî-¢ó†êP\n$Zı\0Óº¨àÙFÚ™Yl†IDHxúc£(ò¤|E*ÌÙ|6\n”“k’l)\r›i¡n~Û¸pËò¨óŞktx$zBİUßH½´-{hv;ÁDx±ÂĞ4@\0vŠÈcµ‡›H	½“å£°ÑfMÖüÇáPÉ5ÔğÓ@uµT²AK	ö·wÆ ²¬šNO\0(vîÊP]PL ?‹²«Èeh\'¢Ç§mC°ŞŞ‰‘$Øu\'­G\"– î‚ñ^Ûpjé™î xÅUÆë\\wšb3ØÛp–øiWeb4ÄhnOM\r.ÈmXÎœÍ÷Ìu¤Y\ZhÈï0ÙBİ—–kÆÈ£1½{vJ·$ñ¨şÊ½\\95V…¹áY¯ë¼g,›¸†RÛ½û’,mzN¶NHòü<2?˜é5°ç0¤£\0h*ÉI*C\\´lø‰“•¦ÑĞöü)v-]FqÂ–ÖA¾„\ZMDi\0z’ÿ\0Ò@ïì¬¶ıÆ„ô%|_äMÀø[Æ›T\"ÌwG¹\0`öV„g`ä©V²tU´½ª,†EwJµÕ\'ÎiLj#õı\',w*ŞöVkšhSŸs29$“’‚´4I} N©í?*Un\r3Ná~ëÆÈ)¶~¨oĞm$_¯uZømR«rÆa¹*dYÛÊ­lRÕ‚OÆf<©¬;Mh­Œö¤æ2IZ§¥’E9XS¨¤ÔÍÂÄöŞ÷½IHƒq:‚nUÑ_\n™)ÄÚLŸ(\0Øµb™b’o§Cz@š|¨‹«@4¢K@py$Üi¡² s]zu\'NÚ€¥Øl=OS¥H\Zn6\nºÜtüj Ÿˆ0	H°°éj†‰™5]h\0­- ÚDã	)ó½@ë­CDÉÎü‹päHà¼š0ÈßÇs/c¥8¡œƒ[Ósşû5ÑöëÅšõG?¿Yª~‡%ä\"èC–ó$…_ı>5Ø[¨6pıŸØjH\0P5\ZxkÔvĞ¡NÇP´¥µ…óí \r–œõ_È\'@µ;¹¿F¢‰c!°¸ä\0¯Z9î\'óÆ q¤‡\\ˆáşDÄ)*IÔ¢¾5 	aèÿ\0Nò@v2‹.¤öíèG‰\0Û}¥%ĞåÊFÔ>u\nÀ¿Üh\0€Ôi7@H‹#©k¢IÔnù\\³—RU¢»n;è3;\"ÏªÀÚ n€:¥^²€ ™0_SV%+½¢V;V‹èŞ(D\n&H”Üè©*RÆÄ$è^š…DÛö×îƒÌ{ûíÿ\0¸S7·ãùÖNl\rñS’bM±í	mÅ(\n”C>®ÖZ½Ùt<Âì¦$ İ+m@)IŠI‚HîwŞ5{	ìW>÷>*9ŠŒÔ%ĞÚòùx…ÄŸÌ–‰.(víµC&ªYò¥-Ü·*Ëd9&ÈÈÌæ3Rİ”ÈÊp¸ô™¨­ÇZµ*ZÍÿ\0³J¬\ZjnŒ;{Â¢ŞĞFÀ»\n«CPhˆûgùO©$tNàª«Cå+*Ö»ğîÜj`´–ïìÇÜgxçº\'ˆä·DÆóÆ>£ü´äb…9‹h\nÑ½1İX»˜ùVVèÓƒ\'vËúÖĞ¨\0	ùÆ¹İ#$öİ)M®×RD‰ù¿TÃ…cM¤Uê‰NÏ¸î\0ŒœÔ0D\\ìg#8«j—JnÚ¯à»\Z^¼w“MÒËF¾\'Gz,™d¶Z‘jeöím«A)PùkÔQÊŸ˜º†\'¨	4Áf5$$y”z©ı”Š,b2RV„3en–’t*\'@:›šˆ,™ ÉöÎt<rg/\"Ô§c„œÔ&­ñÍ’wHU’²ŸÊzé­K+ ¨Ün\0neo(<×::xÕb§$Ï†ö7Ş´fã¾Öå¤´úAa÷ÛnE=A&B›U¾Ušİ¬uİ›)‚ïÀ¡#í/îO(GÔpÖÚE®ˆêÉÁBEÿ\0Ãëÿ\0m&İÌ^¦šá²ğ¿³¸2W‚Ù½ŠU•…qnİ:Rßs¨úâ°ª×Ù¿ˆ\0«ãH\"æÙh‡ÿ\0ç¥¾Ş?ü¿¦•Ü?³ß}ÚR7qˆ:êm”ˆtÿ\0×I}œoÈúØºşÇ{9ÊxVQÅ¢#ÃWKo6ö¾Ö{æVz2Öi—:¦YmiX)Âu/šèØ¦2Œ\'õ(Ë¡Uq±°µec(©`ƒp6¨Ts©uFi¯\"Öãªìz\r§öU]ÑuFi.z,tWxºMUİTfŠä•ÛÜ\0áøÕ9\rU=Å,•Ø‰ª¶2©n2ÕdJUĞŠ‚]µAÄ‚Ft(]¬< \0’	½2¦kjºŸğÓêf°¤  «¡F›ìÜ*à5½CE•†´æü¤ø\ZM‘¢¬Œ³h\0¬\0\rÀ¤3n&EYFˆZ‚ºÒ ÙVI~ÍgCRfàŞ]áß*7±ì®·C/ƒîØf¼‹©øö×ma€5%RQ’rmkÙÖ¹&Á*i;W`\r.Ã+oSÁ.YºÒli ÀÄz¦B®,7§Çq½f¶ãœA+â÷/¢_\ZuLö,ôé}4·Âœ„‘ºÇ¾Ú_öÕYd6&X¥ÛØÛõ¿Ê¨Æ¢:Ì†¶ªê±±½ÿ\0v”‹š)%\\÷¼yiïYôuXoÓáYTòĞ×O‰Ïœ‚eEæm½ÂÖ¬’\\|§%\r\0¶_ñ¡NmI×¨ºØáÓë0^Uş‚éğI±ÊÇ¸•Ønm÷kÑV®nD§CwK†s\'dï±İuŸMdU  9?işA#·Ì?y§VDÚ+\n‘»şQ°İr:^š¤U XeOÜ]Ÿˆ«ĞİIväY:XŞ¥puØé¥…¸p+Û¢E÷ØøP\\5%VÕ?Ùû*ÈX Un†¡’Œİ]€öéãU«îí&Ú\Z³ Ê·\\Û­µÿ\0UT²<¢JFámªBÁ*è7w®ÔŠ½÷Æÿ\0·Op›ÎLD¥0ÃHZV°¬“r¨Ì€„¨‚å”›ÚÂ÷QZÑÔŸ¸„v£ƒ“ƒ–…o6N¿Ùû+Ğ#Ša»z	ÜI,¿‡}@’v¤X\\)=Jh]ËÜ_åo\0j&ş­Û^ï2Gwe\0Ú¦’Wd<Khër˜\\wĞN‚|}¦Db4p+Ê;è Ë›FNw¥æm@z¶ı+·út “y•<CÍİ¿™DZŞ4\'I…\0…n\n ´uÜ“Ü{ü\r\0áJ£Í·G:“ò4£/¡ãè…:Á6\'¥‡x½¨\09\0ÁŸ0\'ËŞPÈ6c)WJÔ×ó\0PŒÒHÕÍ¦æı:wÔ’&8©!´—»wW®…m…>k’{\0}Uı®Ëæ³~Ş= _¸˜§°ü¶?‹[2i×dDa8ùj--{Kğı%)*²Òo½):PÈE[ÿ\0ÊWÔŸ¶|&ÂDûûrVèSôòı mÙêZ¡Ì—¡ÀX\Z‚l;T¯Ù@ôm¬1ú”>{¿ºª÷\ZŒ F±±IñóuQŒGô6*ÄoÓÜ(eÁ`¬\'‘qõñ!ÎDœœEqö›$)SCÉ,$Xj»sÓ­.Ñ\Z“Y¤N\')/\rŒ“—Ç+•‘—2XÕ¸Û¥‡Ô€]o{JZ±wJˆ=†¸6IYE²’E7!»*¨€µÛj»Giñ¨%•ÇŞfp‹ÃÉúÙIev>™)Yóÿ\0Â\r&ûèiÅ\'}åoÇ¸<‡ú,„NŒûûçziR2õKÍá7Ônºn5¯GÓvx×#ßUû¯‹\"–“R÷HZ›Hÿ\0¥©$|@­f!ËÃRSô‰a	ı!üúš’‹ñCeÔ\0¢—B“´€}B«ùv[[ƒkU‘$³‰vQqµˆ­¦[jqœR=7»®*ÇhIEÒà\'®£[Ô(Isà¹ÿ\0mq¾Ü`; ‡}Ä|)Æ£ç’­Ì¢},y[id‘ ºItöÚ¸á÷ü~ÏÚèı¨ÿ\0ô^ŸNWıI!vı¢¸‡YM5ˆ\'I(MBM¼;*tÍĞÖ+_ó(¾—ºOÏ²­%ú\n(F+ÿ\0Ÿ·öQ™±´Ûxßş:\0ì?İB‚e›‰F7[>‚{öŸî©„U¶†à\\ÿ\0<\\ô	\nĞşEK¦Ìñ×?æN·ò«û¨PL° Ş:úHGÃişê¤™`Ş:ÃüÀ½ô;UıÕ‹\'cT·‹×üÂIíò«ûªaNÀ=<pO–@V½6«ûª\"¥¾£VB!lx+¿CoÚ*R%(ö£êvß§öRXÏ˜£Ùéò9z{B’Ìı•dÙK$9£­ók³n—Ô}1	p;á)İ¢è;{EÅ6¦kÜÛp°ì§)`nßn–é¥IT5\'†ŠT7[¼Òni¤‘–p7µ`+NÓmk;7b\"|½÷*Õ×Q3‡¯\"ß*ŠqÌ©÷®7%$İ?1µõ›å ®ç¶ù]Â\\NÅ\nÓ¦‡´i^’»&ñ:5ql	©(ÏÿÙ');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `id_order` varchar(20) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `item_price` float NOT NULL,
  `country` varchar(45) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zip_code` smallint(6) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `purchase_ibfk_1` (`user`),
  KEY `purchase_ibfk_2` (`item`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`item`) REFERENCES `items` (`id_item`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id_service` smallint(6) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'navigate'),(2,'create_post'),(3,'edit_post'),(4,'delete_post'),(5,'create_comment'),(6,'edit_comment'),(7,'delete_comment'),(8,'control_panel_access');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_groups`
--

DROP TABLE IF EXISTS `services_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_groups` (
  `group` smallint(6) NOT NULL,
  `service` smallint(6) NOT NULL,
  PRIMARY KEY (`group`,`service`),
  KEY `services_groups_ibfk_2` (`service`),
  CONSTRAINT `services_groups_ibfk_2` FOREIGN KEY (`service`) REFERENCES `services` (`id_service`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `services_groups_ibfk_1` FOREIGN KEY (`group`) REFERENCES `groups` (`id_group`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_groups`
--

LOCK TABLES `services_groups` WRITE;
/*!40000 ALTER TABLE `services_groups` DISABLE KEYS */;
INSERT INTO `services_groups` VALUES (3,1),(2,2),(2,3),(2,4),(3,5),(2,6),(2,7),(1,8);
/*!40000 ALTER TABLE `services_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_images`
--

DROP TABLE IF EXISTS `site_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_images` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `site_info` int(11) NOT NULL,
  PRIMARY KEY (`id_image`),
  KEY `site_images_ibfk_1` (`site_info`),
  CONSTRAINT `site_images_ibfk_1` FOREIGN KEY (`site_info`) REFERENCES `site_infos` (`id_info`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_images`
--

LOCK TABLES `site_images` WRITE;
/*!40000 ALTER TABLE `site_images` DISABLE KEYS */;
INSERT INTO `site_images` VALUES (2,'images/photos/photo-20.jpg',3),(3,'images/photos/photo-19.jpg',3),(4,'images/photos/photo-18.jpg',3),(5,'images/photos/photo-1.jpg',3);
/*!40000 ALTER TABLE `site_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_infos`
--

DROP TABLE IF EXISTS `site_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_infos` (
  `id_info` int(11) NOT NULL AUTO_INCREMENT,
  `info_type` varchar(10) NOT NULL,
  `info_text` varchar(30) NOT NULL,
  PRIMARY KEY (`id_info`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_infos`
--

LOCK TABLES `site_infos` WRITE;
/*!40000 ALTER TABLE `site_infos` DISABLE KEYS */;
INSERT INTO `site_infos` VALUES (1,'phone','0862-123456'),(2,'email','info@email.net'),(3,'slideshow','');
/*!40000 ALTER TABLE `site_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size_chart`
--

DROP TABLE IF EXISTS `size_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size_chart` (
  `size` varchar(10) NOT NULL,
  PRIMARY KEY (`size`),
  UNIQUE KEY `sizecol_UNIQUE` (`size`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size_chart`
--

LOCK TABLES `size_chart` WRITE;
/*!40000 ALTER TABLE `size_chart` DISABLE KEYS */;
INSERT INTO `size_chart` VALUES ('36'),('38'),('40'),('42'),('44'),('46'),('48'),('50'),('52'),('54'),('56'),('L'),('M'),('one size'),('S'),('XL'),('XS');
/*!40000 ALTER TABLE `size_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submenu`
--

DROP TABLE IF EXISTS `submenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submenu` (
  `id_submenu` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `menu` int(11) NOT NULL,
  PRIMARY KEY (`id_submenu`),
  KEY `submenu_ibfk_1` (`menu`),
  CONSTRAINT `submenu_ibfk_1` FOREIGN KEY (`menu`) REFERENCES `menu` (`id_field`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submenu`
--

LOCK TABLES `submenu` WRITE;
/*!40000 ALTER TABLE `submenu` DISABLE KEYS */;
INSERT INTO `submenu` VALUES (1,'Blouses & shirts','catalog.php',2),(2,'Blouses & shirts','catalog.php',2),(3,'Trousers & shorts','catalog.php',2),(4,'Dresses','catalog.php',2),(5,'Blazers & jackets','catalog.php',2),(6,'Shirts & sweaters','catalog.php',3),(7,'Trousers & shorts','catalog.php',3),(8,'Suits & tuxedos','catalog.php',3),(9,'Blazers & jackets','catalog.php',3);
/*!40000 ALTER TABLE `submenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `birth_date` date NOT NULL,
  `sex` enum('M','F') NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Giovanna','Verdi','1975-12-30','F','giovi.verdi@yahoo.com','1365ffade9f5af7deaa2856389c966f4','italy','marche','ancona',' 60019','via garibaldi 6','3392010200','giovannatuttapanna'),(2,'superuser','superuser','1970-05-31','M','superuser@beTrendy.com','0baea2f0ae20150db78f58cddac442a9',NULL,NULL,NULL,NULL,NULL,NULL,'superuser'),(3,'Giuseppe','Bianchi','1990-10-10','M','giuseppe.bianchi@gmail.com','cf381f197970349753c90c14dec386bd','italy','avezzano','abruzzo','32767','via delle mimose 8','3287373722','giusB'),(4,'giulia','rossi','1990-08-08','F','giulia.rossi@libero.com','36adb5dfb6f8bf6fcaa5cd87a04a581f','italy','teramo','alba adriatica','64020','via mazzini 18','08617544632',NULL),(5,'admin','admin','1991-08-12','M','admin@beTrendy.com','21232f297a57a5a743894a0e4a801fc3',NULL,NULL,NULL,NULL,NULL,NULL,'admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `user` int(11) NOT NULL,
  `group` smallint(6) NOT NULL,
  PRIMARY KEY (`user`,`group`),
  KEY `_groups_ibfk_1` (`group`),
  CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`group`) REFERENCES `groups` (`id_group`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_groups_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (5,1),(2,2),(5,2),(1,3),(2,3),(3,3),(5,3),(3,4);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `user` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  PRIMARY KEY (`user`,`item`),
  KEY `wishlist_ibfk_2` (`item`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`item`) REFERENCES `items` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (2,1),(1,2),(5,2),(2,4);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-13  0:15:54
