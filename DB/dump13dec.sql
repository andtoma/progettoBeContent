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
INSERT INTO `posts` VALUES (1,'superuser','Praesent feugiat felis congue nulla dapibus','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet eleifend felis. Aenean varius nibh viverra sit amet mollis dui laoreet. Praesent a magna sed ante vehicula egestas. Phasellus id consequat enim. Sed ornare, augue at aliquet pharetra, lectus augue pellentesque elit, et congue nulla sapien a nunc.\r\n\r\nVestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien.','2013-12-09','01:02:03','����\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0\0\0��\0Ducky\0\0\0\0\0P\0\0��)http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.0-c060 61.134777, 2010/02/12-17:32:00        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmp:CreatorTool=\"Adobe Photoshop CS5 Windows\" xmpMM:InstanceID=\"xmp.iid:2B582A62202311E294DFB793D40A3153\" xmpMM:DocumentID=\"xmp.did:2B582A63202311E294DFB793D40A3153\"> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:2B582A60202311E294DFB793D40A3153\" stRef:documentID=\"xmp.did:2B582A61202311E294DFB793D40A3153\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end=\"r\"?>��\0Adobe\0d�\0\0\0��\0�\0		\n\n				\r	\r��\0^�\0��\0�\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0	\0!1AQa\"q��2B��R#��b$���r�3C	��Sc4�s�%5DTE&\0\0\0\0!1AQaq\"���2������B#R3b��\0\0\0?\0�@�*�@0���ͦ�@	���\0��\0�h\0A\0-��=�ƀ@�h;h;o@R|���1��y����p��B}C��W��\0t�n�������NK\ZpS�Y}��}���\0��Ŕ�\0/��H\ZR�h��_�}YI)��A�;c�?Rԣd�f�/a�z��lYW�T��A��dNsM�ƴ\\*WBK�$�h�ƔՙyB�.L��Јx�v��w:�{l�\'N�)6���я�,���HS������Hֲ�:5,#�\'�S�\"���*sK�ؐ*fC�_#k������E�[�B���d���®�L��[hS>�.K)�[q1��������k~.±�/Y�g�o\n���7��,�(�c�Ŵ���I�Y+!�P|����+��	jrZ�h�K�����ȹ�[Uiv�e�Q[U���7q�҇�J�*�䣢e5r�p^��?\Z��*ER�΂{=�5cJj1D��B䴡�>�?�X��l�juW�GTq2۟,�Q��K��*��\0��Z��Ҏ5�8,RI�0\r���\0z�\0��1���0R:�\0l(M\0�j\0ō\0�\n\0	�\0�z\0	N��\0\n\0	M\0�-@���@��@\0\"���\0P\0lh���\0Gm\0��1a@\0�Z��<h\0��:��A03��U8^7�ɸ�\0��b���\'U�A~��8R3f��.��.>wn{$���\r�ϝv>%F�r:�	�N�=4Y�%h_]�=����\Z�.������nt��H)H�\0�P�Z�$v�������D�T�D�]p�<���*��;?$&B���ɒR�2fjR���ڕ�j�_�u.G�>����^&�\Z����I��um����>�v�F�aM���)�c#��.\ZHI]�TH�+�Y(��yc�;�x�\Zm�峱!�غ���Ǿ>�.�ޖ�-��Y�\"����̉\r�s�	}jDuOeȾ�O]����j�#~͐�<�66��Y}��ZXX7תI��+��)��t��c�\Z�س�NB��Ҋ:��U�ER�\r���XU���zG;��\\�^:8���(��61��uEkZU�t��c�T+L��R����U�qY�<��ɡh-^�w�>6�C�IˣLe4v8�pP����z\\��x��)�-��\0Gh���	���\0�h\0a4\0;t�m���\0�h\0A7����v�v�P\0��v\Z\0F��k��1�-Ca��yZ�$��;�P��̎y�_��w5�T��ɓu�i ��B�#\"���z�[9gG\Z���7t��J�imF#v��i u*ڨ��A��I����ry��:e2��N�\0.;	�!\0%	6���QRZ<#�3��2�%���e6�7����?\ZVk@�U:�짷8<l6D���S�N��y��Ұ=Y�٤Z�8�!-\0�\r)G_QHZ��4ļ�7S���Q�H�Zb�Ey�6�8x�4���m����^�*��ܱ,<�q��\0�ޔӫ4Ѧ����ۨ�XT@��������)��/&$�bdgq*SO���\n\'Kr	��=����A��ucK9�����ȓ~ܫ}��%�ۻ�x�����A�z��{�^U\"�D%�^j�\0I\r��JT�KK7%B����]�zZ ��\0�<�d�ۘg��fďF�ۢ�&�@�W�=[Mc��۬Y?R{E��X��W�kFC;|*@\r���=�\0�@�@��m\0\Z\0�\0P�\0�ڀ��c�@��\0;E\0b�\0.(\0ij\0	\ZP\0h\0Z�0E�\0CZ\0\r��\0Z�1j\0\r��\0~�\0\r�\0z���S��;o>��㇠ځ��\0eR��K+��mp��nAm3XS�OD$��?B@�dz��\\�]rG��AeJ)T�$���y��\"�S��������\0�r���\07jo�C�����R�l\\˒�l��JnO�D�gR�\Z���\\h-bc8��F[\\壣-hH�]��I�>���-��	ܿ�����\'�CI	ꐣ�qj�6�¦��e1K>������8�/�����&C��-`j�|Ms\'�����@��X�FS�\0P�J����Һ�u�U}�G��LV���(R��ǎ�m		/It%R�r�zV���[�U��g%g�^�q,�5���&KV\\��a�)YM����\ZU�3^+�ѳi���xo ��y�}� ���}�\"��V��T���\'r҂�}��d��m/n��y�)�\Z�ŋ���jX�z�b���J���?n+���3H��E^����{�\'	!���7-�n�������#-S#&\\ޖ������6���&Q����S��*�q�&�v�yn���Z�}t�NK3�&�W�c-�\r��ړ�S�[�G�X�N�iҵ�5%Y�T��O�h*����P\0�h\0{:P\0�E\0&�\0m�(\0A\"���\0-�i@�(! �Bh%#�`�\n��[�����g\"/fG�-h\'�?Tv)_$�~�^Gf%69 ��\0C$H�R�����P���o�\0�fΊC��N+�JeYN[�\ny�+f�:<���vi����z!͆��!X\\�zJ~�`Z	�XĢ:ޥ�UעnMK�H�V��ݑ���ҽAd������4���Y���3��#�tq��\"�;|Mg��%�\"N(؀�oZS33���S�/LEL<�e�nIꚘ\"H��b���`�wR�Q��)G��](m��\0)*N���l�kS�>�6�Eᴦ����FL����a������X��V�(&�Y�R��\n\"���1r��*�\'��)-��!�&Tgw�mZV.IiVJ��7v�)h���߷NT\Z�0#�%.Il�����̺O�!K6��U��o�{�>(�iORt$�܎p2��@��@)�P\0H��@�@�n�:\0�\0;\r\0bSҀS@\0#��Gu\0�A�\0�j\0�\0	�\04��\0	�\0�@��\0�h�\0(\0$^�E�\0��\0b��Jt��:���\'eR�Jm��E8�Ѷ���[|*�h�E;��ɵ��}����1�溑�	�ݪW��=��-�>�>V���|!^oO�W~␐���zMY���q��gJ,��\rm,�}wmVKV�1ޙ��[FJ�Qn޿�AQ�o�\Z���4�8��N�æ�V.��\0\n5���	_��̯uE�.5��r��v���-I�_H\\L��ǯ�\r��@��=Y��sؘ�FĤ��I)hEƤ�bb҂�{��\n��3�a09{2�ʋ�����K2�SJr*��q���)�^�b�&��o���\n����:-��_p�LyN����*����J��l��)@\0��2Ǒ�V��b�kO�I^�F���\n�`��DF�\n��r�PB�Wj���k}�����6�\nIԮ?��`�L�ny�m.o���m�#��N���̿����h�l����@��E)��tpkNG;���	���#Ip,����]�k�l�-�]H�+��ˉ-�0�BK�l4��)��1-&4�3�e!7��X���:L�����S�Ȳ�w����	��J6#^�T�#��r}���\0\\���I7>�O�IQ��6�F�N�ڛ׶��H�.�{kf�=��\Z�V��AV?@�jE�Z\0��\0M\0�j\0M\0@��j\0�(\0A&��\0��B|(\0[h!?:\0ͭ�ײ�V�%[GD���\0�o�g|on��U��%dljU�!�q��ď�\'+4u��\rI����Z`T��E�$��6��,��Kj?h�e:���1xٍc�\0�徛\rvץOu$��o�Xi^s�\n��\nLƈb^Y���L�aʠ�\r�1�L̸J�x�ʹ�v��J�w²�`_r���\'�~�����:�W=�yZ��ƹ*l�+�-?�3��Ĭ���	�m6����Jl)J?Z���y��o�����g38�(D~l���!�5�i��m��E��\"����^rKxBҥ�[Le����U.^6$��em�oͭ�\0�Z�hF�VKe�ky��]�U�]9�F%D}E �K�.h��3��ą=#�n�\0�n����v��0�M�����ڕ��7)��_������c;�12�(�B��,�H@(i�od�f��䊤CвzC%_j���͸��!��?&Ը͔��e^GX:��>��ߢO�Z���\nq�z��E�@J��,��6���k[����m=,*H���z\0	Oʀ��\0v��\0ō\0\0���1���E\0i�\0�@�å\0\0�(\0$^�c@#Q�@#��E\0\0�P-z\0�@\0#��A��\0*�\0Z�E�\0\'Q@����t�,��������H֘�l�뎃� �[[[x��2�S���g&r\\�U���rL�INOt�\0=G�(E���k��͞���U|Y\nf\"%���6�ly�oҢlN�t�V��\Z\n��Hm$�ü�$%\0������\Z�8����j�y,�M�̲>B�T���Շq����It�w��D��*$u(N�h��|�B�-�26������t������A�>4������ �u��t�F������UVJ�r^\r��.�f㙒�k�H*=��\n�kaԳC�۟j0���䙊�.��\0+h��_?g3�,�D(�7\r����2�U�H���gk%1��\rI\0)\n)��6=�^�Rg�C��nԃ�8|.?�d�37\r���u��loy@�t�`��?\n�L� vlV��rT��|�S��	�2��a�Q�d��wڧ��oA��*�\r$h��̶�Rlh�&&�%�1�H�4��_���ܛ�����=���ߴ�ͯ�O�)^lEM�koM�2I�m)�g2r}ΐ�,�?��	�v��sV(��֥d�R(M\0\r(\0a>\0`O�\0&�@	�m��P\0��\0�m�@�h$�T������06��ce��;���\0y<�R=˅	���=���%M���p�\0l�Z��scn+��H[��9o�X4�\Z:���6؍�����՛%�C]+:���5;&�u�V��s�e6��7�����΂��]�C�W�DH�\'�Ά\\_�e=��D���ۿ;�^\r�)��ϖu\nQc�ha�)(+<������d�Bے	Dd4Ҝ}�bv�(GN�ц��^1�*�0�ڏ�dSQ�]���3��:v�����JY!+XU����{nd�\0#J��[����	���r��^���8Zi�oPmT��bv�t$Rm\\���\Z�y-/�y?y�{�c���\0�\'}J@uۉ���7�~��{���1�Z7�t%&Z���:�4қ\n^��ÂS.�G޾/�Ĩ�)u�(��m���{*q�G��XԲ���v2\\���J\r����@�YSvc�a�d���O�q�\r�)���\nQ\n�>�(�e|��g\r�5!9c�[�	}�B�)��%m�#_Q\"�6�ζM����9DlnHKw��\"w�Id�Ė�ҋ����m��ɺ�����ؿm�-��~\njTV�q�QV��cݕ_��7��3����S����ٯ}\0&�<S�@\0�@�\0`��\0��\0��v��\0��\0l{�\0P,{�\0\n\0	\0;�\06�\0@\"�\0Y�\0�j\0�\0\0�E\0�j\0�H�\Z��� �v��Q�	m�=�J�M\0R��M�y�Y�����_))�]��I(u�2��u(�Eo~`/k\r��+�kI�qc�5��#�CU�c��~�7[_���j�\rH�}V��\'b7.���U�ڑ�*��T�6c��֟��d�w����Z�1�\Z9W�:t������[cw�J���z� ��iؗ�r�2,c��JWb����5�-�B�ڭ��qv6���h��Dr]��ZT���d�i����^E�n�II���#ӉH\nVΤ���V�\'b���S�! ��$��̘��E`���������.�GsC���.{�\'*i���\\�[}G�8�K쨡d�|��߾����t+��x�\Z��R��g\ZR\0�\\,�O��_\Z�o��!��O���d(F��L�)���9bG�+a�bi$��A�K��%��I|�\\���P�\Z<���\0�����Z����r�ֿJ����-\0j�XY&��$p���!�4\00�\0\ZS@P\0�u��\0�h\0A4\0 �\0�\0�\n\0��@J4���\0�u(BR�ChjQ�\0���`p��\"r��s9.�7�a�w\0�X)�\r����7z����T5�g�����a^�H>y����V��\0�4��ɦaA\rJ���]�o_ ��J�m\nW��J��\Z�Qr�^�~~���x�\0�x�JDxm���*�\r덅����^�cb�7��9��4 �J��G.�uev�g�ӆ����&21�v�( �R�����oDZ�����,Q�[��.-�O� �&2aaj+b3n-�%�]AJ�JYP!Z�ש�\0*ߙj����Tg�I�S�a��>;��)�*\\�P�)�\n�uu���eS`,j��;�����Wwv��������|6/k_��\ZA�md�����ۥ���E\n7)\\��;�r��ĥy\\(��z��*S�>w}���yY���f\"iD�*K96[��ZP��JR-�Z�֥x����ܴD=�h�����-�A���u$������2��\nEͭc[i>{�H�di��{6Jޱyl�q���\r�v�}*-N;�ݷvτ f�nC�����ޛ��U����8z�b�{��������Ej��2Qh��dA��\'ʔ��WM$RgU>�� �aǭĩ)e2�hoR�ǉ*66;I�}/���)2���B�wV�)��:\0���G�h\0|(w�\0H�\0@�j\0.�4\0;(\064\0Y�\0\Z\0\r�\0$vP\0H�\0�z\0,���@#��\0G�@\0�\0��P�Δ\0\n\0	\Z�I���2���5*����O�\\Yr_)�\n;Cr��B?���\ZU�\Zp�Y�^}�s�U��i���pK�<��;���;�#�\\��pz��[\Zh*T5��S�I�`?�R��qP���t���81dh�ϒT���;���H�j�Ɗ�Q��_�!N������~��!K\'�&��Kv\Z��1������r_�ո�6BpQ$�\r)w��K_�{��q�H��yh��J�\0�����[;֊�D�Q��ns����C�-�\r�I��V��46���9p�G[xU�W�\"f+y��Y��/�鮄�V��\nڵɣ�o��YR����=Űh�K����R�,�(JG��wS����Dӫ֫��o�@^��Ǆ܎<����)�N��_��&�RB����\"ת�;�n��T�C�2B�}�uqjY$��=����P��Ť�\r+�!�Y�m��f�#cE�\\ ���p�ZЙ��Qc5%m����~�5?����)�C��e��\'�2�\\4�\"�da�q�?\0\rhꯩ�Owp�/\'�\Z�T�0�U�\"��$��\n��a4\0`E\0\r)�-�J\0O�(\0a4\0 �\0E\0\'3��@��@�@	��K^�ℋ����@\r�F�\0���M�T�%����V���U�-U��opr�Խ��T�7�������k�Y5�ڝ*x\"�S�q��\n)K �������a�Խ���.g��Xd�[o�$v\\O��(���_�����b����;@i\0��:���qv�\0S,�$��\0�Cm+��!�ϊc�5)��߲�4�0�ʛ�`�R�̡d��/o�g�1����g�c�5��O�	֨��ء,��)	�mn��l�&����\"_����j5l�T:�����%�R����O��M\"�pm�!�^Y�\"dg��	�?經��z^�L�=����S.g��2T�8�\Z�Jz����V�ev0d����5��\'��\nZ�t�X=�l��M�6�Y�\"��TP�T]�)(\nB�mS�POR�۵5hL���[�Ϲ�^�e�+o��V���(��&�iM�u����P�Ӓmej�ֿd��o�2�L�x��#��KJRWe6�RAJ��\0\\uִ��c�8�>�^�P͉�-@�@)��\06��\n~t\0��\0\0��\0�\0��\n\0\0;�\0�\0��\0@#��\0Gu\0�;�\0P\0�\0��\0\r�\0\0�P\0M�\0�(\064�^���1#ֶ���jG�R���R.�xU[�d�d܎~Z�����U���KEԎ������M�����ro������J��M�J}q&��T�Zt���:] �6�\\��h�Ӣ���B\n�&i;\\��]�:��*�٢�6�-h�=X�������k!)�\0�Z\0M.���2.�yW����l ���N�_�_���Hv����Sm-�8��\0�@����Z�vлh��+��g ���徔R��5(_�X&�5\nަ�>�\\n��B([Ci\n��ML�[s{�J�Kެ���۽ȵ�\rU�����=\n-����*�B�=�KY#E%�9L���K��CN��qcy�P	�������3�\0����3�+�dp���l����=8�[��C滃����_�P��[�s�ܬ��J�Տ�f��㹨yII��e\"�I[/\'E���zvQIO�n�<�O���L�衲��*@o�ML�H�܊KSs���p9��ʷƯ)\'��^��Df˨��>�h�HJ.S��\0��)�b�\r@��6�I!���K&�|��z�u/��	��A*JR��X��w��-��E�WU��9��T[�.�k�S��o\Z�FԔd�V3��\"�	��@�\0�h\0��\0M�\0[h\0a4���\0d\"�0Pz�PNWe��¡���R��}��2_$��%�o�\0�]j�صO�]1�����mZ����M�I�i��ˡ�lj����,J7!M2]�+	I �:�V��l#{~����w��;(�wO���(̹bh0�9j}`����%#̖�4�y��+e$�ǧ-�!*��5���Tք��a	dX��t�C�|Z�9�@(�M��&Y�R�6T�o5=��v��Q$:^Z\"8��7�8>}��e1�Ȥ�Zvy>:y��m� �+P��h�t�n�&�P��uS�M�d�@\"�J�M�\"7�j.�4!�	G�I:w�RZ�Nx���1\'%��v�s_�[z�ZڢUl�Xi�N2:��X -�=�x���g\n��n.a^��mSt�o���j�x�����Sm�w\n\0��[R�&���5�g`��9�\0N7\'\'L���,\'���uPJ@U�}�n�3���N�4��N���]A4�0n�i�@#��\0v��\0,(h\04\0�\0?\Z\0�\0;;�\0;h\0�@\0#�\0�z\0O}\0�P\0�\0\0�@\0#��\0E\0\0h\0$@\0\"�j	Fvڠ�Fm�J��)֪1!8�wmN�oPH ~�]�QjC|���g�l1�L�l8vAow�[T�A}gȴgO��5�9k�a��ܖ�á������\r��y&���b�H��`}b���\\j:��uu�~�7JiW���`dd�>,>�����}:{��\'iX�	�Yma�$Z!���,�n��\0�]&�R]��n�k -��;��-�i.� ��n=���c�oC�C.e%H�j:.*�r}(E���u��or����=������9$ب�Xx����/w����,_��X�ѩ5�-\'�Z����w��y#�w����2��)K�2R��AM�\'N˛R~�nY�n��a�=���Odd���˥�\"K�}@�M��=�Ƭ�O2w�����X����U��Ǥ���8�rW�В,ۅV��\0�j׆z:ߝgG�+Ĩ��^H�m���JS(��d�iѴ��RTQ}��t�$Җd͑kVo���o���(#)�+���T:ຜ��\0-7?U񳐾�G�T|:6�R�+N�%k��TT{|MjL��c�*<{-{�p�\']U�?!�Lɚ�2���@mN����Ԓ��i�#�n�ہ���d\0�61�\\)U�\0��T>Ev�-y3�{��K E�o�]D�<z���FA�(�\\\'�V3���4\00�P\0�|-@�\0�h\0A?��m�m����P��\0��u��t\Z{�\r��\Z�| M�d��VA�e�T���������A؊\nS)u����^ݛ+ptґ��R2��n��~��C_Ҁ��\0wj>U\n��5(�����C�eb�PQ0�P��<��|ظ�\ZcZ?����?F}3c�mج<�m+�P��?��z�)�V��{vԧ����z\\y��I@�\'M</Zk}�j5�+��[����\\��m�k��˳.⻒�,KQ1�*���!��;�pA��*�n��3��\\ˣ�g\'d^�@c��|����BJ�n�O�iY[P���_�I��n=�^��Qq����b��V	I��K�[NƊ%T���0���}Jq\rw�����f�ɳ�r�Lu����J�a��sc�O:�<�!A.��\"+���_��o�tzJl`�;�z���v4����ۉ+S]��P�ڏ�t��ԻZ�Xqg���BR�w5)����:��F��5�d�z�JR������\0�Q2\rAd=���w	��%`!�ajJ��Jm�\\�����^�*��oWc�o�\0pR��@VW$��J�Ă�`%6��)d�u�V�^L�q�.S+m�ԡ{�\"����A-@\0�h\0�\0������\0G�@\"�E\0F��\0�\0�\0z\0�\0-�\0�\0�\0@��\0��@�\0Ga�\0E\0cm�2TjFmj����>�\0Uc\ZپA��%P���ʝd�Ĳ��HxuK-�hu6H�Z�ɧ6�E�ޖxZ��Vsꇒn;�5�������>��V�P�(\\=,:��\"Q�z=�[z����O0/K���6�*c�Z�n�*�\Z��Sj�g�|~��+(�]�\r��bB`	n�����|M�f����̻�2����,�S9�\0���� +=�K����2\n�qv��E�:�{_R�z#N���\r=^�Ku��{i�<;��D��J�l�Hm*����\nVK�X�\"ꚼ��s�o�H�Sb�`�K���2��u� xKǛ����,��tË��o �\\Gд8��:��k��2�8Yp�=G�\n\0�r{)�ɝ�TE8�kxU�XV�Gy�s�i�G��4�U�1�IW��8�u/FD�9}�y ��k6��`�hѐZ�q~Z`�Df�$��,��	�+\0��i����FL��;2�{Ϝo���xK�s\rÙ0�t!��-�G]@@�bk]|k�m��\0`Ǆ�f�#��p��A��\0��9]�4�uR�E[���>��amMh��U�\'�n>��/�*G�\0��dH��?#M��H��Ca�:���C���R��9��zkwcw�\0�5��XG��W�ǡ>���[�;#���`��\"�-��U���|(\0�<(\0a>\00�\n\0M\0�@��@	���m\0-���\0M��{F����.�ܬv#ġ��\'#l\Z���-*\0Z��__�R�2�z���\0������a�FVn�eLW��;K�:�A\\缽��ZB�`eD\\|6a�O򡶝��l)D��*:���N\\�z(DWq`��r?A�me�U4�\0��#_����~��5�ߴ�[C>�=��79���Q-��/�ځO�0�Ӗ�K����5x٣���S\'��ia=/�K[����й��+)R�ӷ�k�W�^�}�����p�8nT��;�r>�W�Ju?M!�St���UZ:�6hǏ[���~Fb��=�K���=�����5���t%�o;��r6�����7GS\'�up�nvK~-?��<׽ܽ�1���D�|�}\\R1�->��.Z����-:\n����k��������~H�|���;�s���4�jx<�Ԁ.W`�^�l)O�֨/����^���3�e��4�IC@�eaIQ���>u�%Z{]tb�.͒�N��v����̐Ţ9a�\r��[�7�i��`���Ǭ�\nQ�&»�|i/����7<�W��̩��U�ʗ	u]�ZJ�7���s��3-ت���ŧ|ȹ����*�R���g��6�[��R�E��P��*I�]����;�������e�g)\"k���]I*m%�6RH\'i%:j+�Սj�՝���p�94�2���m��7Z�R\n\r��K~T��R�48�,�ԖPצ��K\nb��\0��\0,h\0$@\"�S@\0��@\0\"�S@\0#��\"�c@#�@\0#��\0\0�\0,�}\0��dP\0��\0$v�\0M\0נ�f֨��TH�N�V1Y�^)�\rKW����-*�JR��@R��������T�9�\"���>A!(�k-*;�bL�)�Re-��N�TT��p��[�RrYU�����IG�/8�q��X�/!5՗&R��VVu%c�Q?��r��3�����l��N.&�y��\r�p��%�)L�*~S3Zi%�y7צ�*;B�BG^��K�g��&b�[/�v3�Rۈ(�Ω;���+=��Wd����a��,-a�)�b�`�w$�iK���@�Njk�b�����#��~�iGe�A��{�D�yhb2Y��Â(����[�����<)6��S>۶�-�$5�$ �w~��9\"�<k!�㏦N.J�A���$�c�?��L��P���֥��^��Z[k(��|)Wܛ��]]���e����%�*bSn\\\\��m��7ײs��ˊ򐴩;@mʚ�����)ݻ�nU��#��Ġ�>����0�/���4ʃa\Z��բ�+��p��\0e7�����/dRL.\'�_�J�R��J���oԛ\Zum���ԓS��KDe���*v���&ֽ�)�l_1��`>Q)�z`�r��@����jN\r�#�Sĸ\\8���܍�Ӝ�mR#��o�����t��{�����l1h�p�:ߤ��m(G�)Һ�j�Q�;�畏_�o�w�i[�x$��\'�A���`��0�[&\0���0\'�@	���\0����ڀ	�\0\'�@�j\0�\Z\0�F� $�\0gmB(�	W��<�&��}�sI\'��Ĩ�U~|��. ɺBS�M�N����Lv*�pq�S,B����y��FB�V���Tz����μ�>L��B�/�G.;gl���!M���Cv��f�_\0;MZ������o�W���㓟��c\r#�Cy|���\nAP��:�몬쨷c��Ij�d����1����<o\'�R���nG�b���}]���i��t�]����P��lƵz����P2؉�N�=��S+BЮ�\n�T፵Gc�1h+����1!s�v��J@���\r*ՔQ��)���IVc���D�&E��7�M��j�� ��U�[�wt��u�]�G��_Ծ��H�r�����RS��F9����. -e ��n=�;���d���S%W�m\r�\0\"��	��Y�S�Ո��+��}E�C�Qܤ�nU����ݚUi���ק���!��x�3�\'ф�i�$�ԕ��Mssew���j%���ca�es^\r�ư�{(�#ĝW�\"��*VY�i����G1(�{%%o�U�}C���6���<�G����TD��<�Z��	��������)@6儶z�ఱ��:�ʱZ��\n���d�IK�۾��J������A������� �qB�A��m��2�Y���}�{��2�Q\"�R\\��c-����Q�a{�L��ts�x��V̲����\"����4\0^�\Z\0	�\0\Z\0	\04��\0H�\0�\0\0���\0S�P\0�\0z\04\0u���\0Gu\0\0�\0,��\0�\0*!)Tt\rƤ�.��먦;�:�Gb����J�]Y�����A���n&DNFa���aŇ�+R�-A}��o�}k*���(6?m��.�O��\0q��n&��d��}&�a��fs���\0L�)o2�%�[4�� ���]���̥���z��u�ų�*���k����^��!6��+^��rqe���G�$$�(hj���n\'���˯{��D�W����<�(��`es:]�p�C�o�h��Y�RZk��P���Bt\n5{W}G��x��=H[%��?���g:�&���\")x���)~%�ai�Ҥ����V���;zu�Uh�?��\0b�{������E\"#[MKIQl��;˪Q�Vn,�iJw�;�,x����gb6��e�T�ޱ�l������\'F�6�73���d���vB�����\'���5[��Y�j��↤2<S.Ķ�@~6��W�\nJ��G^���-d���g����gs@%\Z�%�t�p\nI�ֳf�#=1*l�2\r㲭�B�F�����Q6\n�iY9�\\����s2yw�&�H���1�6���xh�\"�e��d�	��P��B���YH2��aܑ�;\0��=HV�#�\r�:�,���c���V�I��P�.|���)&��)l])M����9HdI���<s�ŗ�O���Zz5����� ��m������k;˽���\Z���f�Ẅ�F��T��z[�L�k��i�[�$\"���:y�Gz*����6�I�J�ۧ��߹i�^�� �p��]n�����_��q�V�RtV�t\0�u:��c_O�\ZO�Uq���#:�(�\"#�HIj�r�YV�O@F�kֵVޅ��B�̑�!CoьȲ5� \rT�{Oek��$���2��$Еu�lu���@J�y֢p&�S]����\0�~d����G�x�2	��ɾ�����G�O`;\0��ճ�Ԫ�?s����*d<65�:�0�m��\0�c�h\0w��\'��]������97/�S\n�b\n֡`�n�)M��\0�B|��[���f�v)�\ZOvJ��R-�0M\\�@	���4\00�\00\n\0\ZS�@	��\0�o�|�@G��@	�\0[<(��ƈ;{��\0�}\'hU9S��Φe93��|/��2/�4V��O��>����	m�+�Eƪޮ�Vlڨ7uj��%6�9g��M�j\"`Hf9�T�ح}J�o�sY-X�����w�ow}�<�;�8	)������A_�2\\�!*��?�n�L�4�J���͡$6���l��`:\0:�@�oR\r�>�c��\\�L��Fk\"��e�@��JH\nM�$x��w��q�8�9�/۟w�ʥH�������\\�?��!�!d�J�I��)Ɖ\0�Ғ��I֙e\\�V�[�f;Yˮ���/W��p�u0lf��a��bBd#�<˖�4�j�!C������ȖՔ԰q��RE�qzmj��Y���v<�Ӌ!.$��N�g�L���_�W�Q侵7�-%�HmH���H�\'Sn>�e@�<M8yQ�+RTF������rD��N9�����R���D�#�(��\n���e��{���ܵs9��`�R��G�ɖ�ǐl�\0��_�:�k���{��\0o�+b��q�����J��|+t��C����)^��QIOiZ�`~V�{�\r�DfHu�hR�6U�2���B*J��@��$Y->�-��У�Tz�1\r�F��W�,Y/H$m�v�@Q~���-\'SF+�Y�&.�R�n-)#*�\n)�a����u�ڵ7�&��1[���zs�Xc\"�Y�3T��u;��H�2��)\Z�TA��1�uy�\"��5�C��eX���@ |(\0�\0�@\0\"�n�\0\0��@\"�#��#��\0JtҀ\0E\0E\0\0�\0�\"�\0(\07�A!.)\r�N8l��R{�y�dȨ���� ��vu��v�?+=�>�\\.�n�\\-��_�\\J^��q{R|�#��*F�B&M��I�$u�T��z��ߞB�M�}��Y�F�#\Z�\0&��jS\r�:̶�CD)���K����mVU�)�b�g�cD&��2+y7�w,�^fc\"� �ɏ�����/C��w\r:��)|oRnH\nЍ�Bx�ң-|�բ7��Q>���<�\"�H��\0۲1�V�$/&�_���MJv�]a;I$U�g�����U�u�\'U��$Y�\r�X��{��༟7�ۨ��в���K[��;L������~`S�+g\Z�co���f>I�\0b�{���|����%ɞ����}��5-J��$���\r�i{�u7��cW��i����)������\"&#��?�J�JBbqi��q��e��~[��j*K���:�*_j�˒^g��3\Z�Y@ >���ӯ��,���\r�%�6�`B���y)y�\n�it� 	�ȫf�>���]` ��+��{�Y�B���1R\\j�Q.-hw�ob���5�\"�-���,��cJY�rS�Em=�*Z�{k=����)a 񾫋���[���s����)3�Q�Y-qȁ-4�%=|M��+f>�`��@��P	��ܐ�K�% ��tH䟀��\"�d���,���Ⓒ3��\0G_�O��Kj�D\\�R�\0T�ӋL��c-��x�r����c����ia:��_���|��2����	=�K�y����\'�^d���o����6.t�J�����F�ی��=����󍴙�@vs�M���I�vWG.*Y�����[��!ʱ���!�%�2�9�\0zL�tn�\0�v;�R.��Mٻ%�5aj�+=^�c�N��_V�6\0Bɰ&����ZU�YjX�ͱ8�C�nC�ԙ)Xm.2����}d\0�*����t�x���9��9���./�������I����vR��\r������Z�f\\���յ��ho�=��>���𨋎�O䌻���y�Rz<��oc涕���G��/[V�o�.���x��FRY*u�Iq�W���Tk�J�G�ϕ�&9�\0XSL�,ԋd�M1��\0&�\0���\0P\0�h\0A50\0��\0��\0������\0 ��L\0-�@�`hB[Ͱ�>��e,��.��@?��{�\0�g��&��<�62a`x�D�Q2��V�m�~�_Cd��g[���2=t������c�\\.u������E�D���a1�R����R�6�M�����/8����\']N�{�>+�n\Z��\\�/*n[\"[K^�� !	�(m\0%#�{k:���^[��b{6$�$��Fv���a@��u>2�ܪ~��o��&\\�Zp\"�8�vW�jZŉUb�V�\'OUE�r^�{���˛��p`Hm�@[�Ɠ��D��\r�T��V��e��J}�U��鏲?w<O�|8�����b��8�k�.��	�����Վ��6;�����1����RA\0�`�Gx=�,�SĈ���8�C��U���U/q���Q�O)���_+5�f\"-�+#%a��S��6葩��n�)5�ƥ���_�9��T�_S��&������7�ږ�B?�wW_�Ԯ5/Vp�}�e|k��S�$�͉\"����-4�7B��e�qa�JRd �\\mZ���������k�e��9�iH$kԪ�\0�S\Zbӏm����h���u*I^�a�5R�aO����˖X�@�,l/}\r��2)E��o����B$�N�Hz4��@)I��V�E��*�#^��z�ܿfy<u��12�sLv[l�y�e@�I\0�B�b�������~U��9ݪq���)HƄ�K����ܵ��g�.�֑����ִL�0��F���$)4\0-�@\0\"��e?*\0	O΀���\0E\0S@\0 |h\0$v�dP\0�\0P\0���\0n�(\0��Чv�#So��Qk*�~V������V��h�����ݞ��h�w��e���=�@	I�m.�-k�b��j;A hi�\"���8��+���!�^4Txsp��g����s�?9�e�]*g�x��qr\"�	t�Դ\n�RAБw`��GX�\0}�_���Y�hG��t���9�r����qH����d�\0M�q���Jl,��R�qC[Z�߳�}OR��h���ck�(�������V��w����c��G�j�7R���j�O��%C����ք���3JYJ������ec���Ƴ�-�-!���f*�\rGg���O<��^�����],�./����D�}M̡��a�\'�~��NS�zw9Ⱥ��3�=�zjqQ�NԱ�)Hsw�y\0�$�����Zn�~T��k_�K��v���|Y?����7b��I�\\i���Krْ�\\*������,X�T~��A�x����|�xgv�Q�ܶ\\�����rARN��u�Y,�\rY2$ș�(jt���Ke7��qH��K�(E�ʕ27��S��	ɹ���\0��e��AV�-G�S�1g~���W_A[�ll/٭d̄��&���{�6�a%$�ڠ,/�94Ь�V-��7�\r�t����d��F�%;l��U�ؿ%���4ӭD��^}��K�,U�VE?�:����d[�z]�/R\0�Ɛ�-�K�vɊ���8�Ҵ��kQ[j]�:_�$+�{���[�|�=�mo��H*N���y~�J�WS\"���){�>��e!�y&BV_sR�$�\0�B�)c̣נ�}<?j����	�v~��k��`y�\"�˳��	�^W.򘎄tm	��w6�n���kd�|���|F��\\yo��cq��<-�?����i�Ζ�\n\\�����\02�\'Pt�d��t�,p����_���9~����e�����\\j�6c�W�0Tw�:�B��V.�m8��9�ґ������򈙟�yhq]ۺY���WB���q~�V�Z�\"�*�JK�>�q��c�\\�2�%�5�?�Z�Е���M�u���ۑ��������#�q�?���aq���#\Z������muiUU��r�#�9v��?.��3�>^�L(����\'�q�0&�	���\0��P\0�h\0a>\0;��m�P\0�|*@MH	�eH�](��y/�FL����|v/���m*)H\0�\n�B�7 P�D���?r9G(�����bg8101NK\re�I�TÈqג=6� ���� j������оf�t�^�33�\"���T��YU�\"K�Qq�a[�\\�(��I\Z����qi�*���7����o6��Xj��&3<ۭ��RQL�J�-���v4����!�:���h�#�d��f˪���5?\Z�*%�p<��](�Qֆ����,���*\Z�T�����>[�,~Ql���tG�	��$���\n̪չ#��\"�,�|���l29D���}P��>d�-�ִ�z_H�̹n	���\'Î\0(e.�5c��^�).������{�2��KΨٽ��*R���*�\r_���E2���[�3�7ynrff&Դ�G�!����!\r\'jGQ���:V�\\V�\'3�K9z!7K,EZ۰p]j��g�U-vEq!����6{���$J�\0�-�ZZOwE�UXܺ�,��Z�-��/�?�:ǴHSϹԡ��.*��vjmY^y{�_�\"彜�h\\��p��fHa1�)im��q�nMρ�Z���L�+n��s�|�\n\\�ؙ,�H*/aӲ�I��Z�iyfW�~�c��:.��A�\0�+������dȚ�;�@s �d,�����P�̣n�bjn��[,����z\0h���6�\Z��Q~��Yjn����d�w��څ�y�̂O��IB����M����\\�>�H}2��������\Z�s�b��!�/�G^��nO�҄I�SA\0\n|(\0=�\0��\0m\0\0��)�h\0^�#��\0E�\0w\n\0,�\0�Ƚ\0\0��\0,�u���:�g<���Cg��%v��U��v���]��K��דݎ�Q�6��\n�Tj�YPE�h��A65r��@=�kX�*E9�@�*���DR�{Q���8&��)�!��n2�o�`�d7$�nn͘�J5��\"����Kq�9���1ؼ��y��rR���]�Ę�����]%	N�)\"�<t��_\'>�S$�-gr�8l�\r� ��<�����,$^\Z�Fy�%���J\n����+�Տ,v��:8m��e��b�3�^\'?������̐�w�H(~��DykRv���@=4��[8���\Z��9o��� ��8�|�Y�и����c8��ڒ����܈�4�-��[�^�?�\\n�E	U���?��&6�{������}G�S����K�xG�e�m��[kQ��mAU��q��b�-ؓ�H���S�%+ؼ+ڮ�Y��\0������/e��_+�Ś�,�	�[�$]G�V�,��k�[D�uj��U��\0.[����\r�L�Z��zz������|�ֈ{���u�ےPKτ��0aQ:�kA���k+���.b�!��ݸ!G�o�:��,����ՒU��������ARt.��*��$��m��b˒���}?��7�q�׫J|�.	_\ZRYB�F�.\r�;�)fj��an:�m��KY�w-A)=���\n�P�z���3�S�Q��q�8䔴��i�iY���|FU�Ch��d����}�U)�V:���o�p,��}W��duQ�8�Vw��,�������x�r�\"�{�<q<D�z$��Ď�7!�t��\0j���t��,5�̯F�z��y�q8�C;�g��?+�qR���S����*���Q��S�jzT�|�����w�[>NJ�@ɵ��97���\'�b��3�ڦ4{��7$��1�h�\'nս*�4UW�Ef��e�X��N����(L��8��q �z~u�G̥��(ܚ�|��^52cǓ5��岯J��r�	OK��r���n��J�5���R��	^5�g�g�P���J�js�i�@%�P�Ӻ������]\\n�wc���fY�%D��sc+�fsm�n*�\nl<�����z�RҤ�Y*���=�����T�ad�R�F��$V�\0`\00��P�4@m\0�j@H4\00���@��R\0��64A/�sL7\r�ӳ��^[\"�#�p�u!�/�{��\Z@K]�\0�{T���Z�vp�-�2����ѧ��^Liy�e�K����p��gr��S{\\����-�O�mǉ:�s���nG�%�)S��c0�\"Gi��u���V[��U���I5֦7\\j�X�kf�G#>�9�H���0Q7&���(��H�R�6$߶���=\rX��;y���%��\0mx�ɶ�f�1Ӛ��W��JV��\0��E�-\\L��p9lY�$!�ӥ.�&��)@Y곥I)H����nTt�%!=Щi���(�;��\'5.&;)�B\ZKD���Z���*�$��[9G���r�<��UK��S�*6�Zt��4u�Ȃ��K-%���i!(�U��#B[	q���7q�����8���Y�ɋ�\0��e�:�m~U��\ZӋm|sWY^G>/\Z�؈h�b�,�P��R.��;{m�$�0���-@6��8M�zl��Y=� W?�e��<���،^\' �[�\"�����(n���Ѳz��y��GA~��m�F��ɰ��������@wZ��j�ԥ,䣜��\\q�J��\"�K�N��$�IJt��QL��tV �S�:��$!�k�fY$�]�\Z����a��ٺ��*&_��=��yH2�-�4U�K��6ߴ��*k�\\��<�ׁ�σm�NIʼ�U���J�k�:���MTg,��j�x�rP|��`�(_˹֖��L��b��l�ُ��Rgh����R�p���	H 6�֤�j\0ڐ\n)�\0�J�Rh\0?�\0S@���h\0Z�\0E\0Gm\0Gm\0\0�\0,�\0E�H &*gp�Ҏ���J����^+vo�`�~Odoc#[e��\rQ�c�%(M���%�c�!=~ui\"�ZiHP��U[��D[��HY\'K�4\Z��ԫ3U�e��۷�ĳY��s���g�l�����F�z�\\e��m�K���=����Ut��K5L��x�I\r��S��m���!�eqY⹹м[��p���R��2^Py+.����\0�sNJ�?��\n�4�������ܴo��1�x�t�Ub���Zm�B�ˤ��1&bJ[Դ�J#�۴���R��\r>�n*��_��!��KM�\'�R��y.��i���(X��y�Hy@���%m��?�\Z�������~�yoC��d?�+!�7Ӕ�v>�j1i���7:�FX�F�\r.�_�\0���0��!��.l�?1�3�9*��3֬�F�W��k�.�+;lOi\'D-��8����\0���C��^~Nw!��9~A�}n)�Bԧ]>u���iI��kI%T�C��J��	�H���}�ܰN��\nɐ[r)G���pJ�b��t�\Z�`��q4�樹J.}4���V+��c��T�t)6�M��Փ ��$�ɢN!����R�����z˒όkY|a~�\Z<����ی��ksj)&ǥ�})uzIF�\Z\\�J2-GǱ-1]/%hm�c�F�̀��Ɨm\\HLL�S19	Jq,��wO�Ҕ57�����ue������7�N.��dK���$]M��6\Z]+GMz�ZkUx�~\n�u�ؚ~�9K|{��ÿ!P��b��aD؋.��7�x���GKi��	��T�#�K�r��J��r�R�FԬ��Hp�������wiն{o��7��mcP�%��+��艊c\rtH�̖�.FR��R�a�U�Cb��\n�����Ѧ��8��!�J��p�b�e��oḌ��O �#i:&���Zol]||j�\0?VUW\'k\';(���)/3�s��I\\���Va\n�I�*=�\0\n�r՝�QSD$`��vsq�E��7�\"$:�iZ��\nv=K�bSs*W��a����m��iI*:yVҶ�O�G;;J�[��$X�\0&+Hl�ʐ\r��ҩ$x�ۓl�MEB\rX�\0EIFOA5���\0�h\0a4\0`Ov�\00�\n\0ڐn������� MH\Z�Nj�1q�d���`<�i��%\n-��\0%!J�$\rJ���?p~��/����x�9!d��Nf�e�r��6�M�����BB\n�&��nMm�����8^��EE+������S����y��![��<s�)�T�jy�8V�����n�*גZ��y,�\Z�����(AvvD��Q�SHDh��ԥ!Ş�\0\n_F�$�,p�ny����)�3��-��Sԩ�{�ĩJ���_�F���ϡlDTEO��a\r�+I��\Z|+�ĳKT��R�S���&�t-�Tl�hE�=�����XP�4��QQ*�`~u1�U�s���q��79��$��\0��ԛ�よg��!�����kRR��GU_Ƙ��y!�+�ާ�;�`��{����MC��ȿ)ꧡJ��T{/�)�B�&�lxc����q�R�E��F�[OMMa�]Q\r����k���p�lvbEK��\0�Ť�����\n��;9k��[ǖ[�FН,u;\r\\�j��Q�K�e�ȶ~5�֤�\'ͭ��#�\r���˰�#���;�L��*���3���S#�J��S�����FV.˙��Z��o��ˉ-�;�o��C�Ǜy[=��6��l�J�[h�\n���~����U82��,�[�)ϸTp��+5����r�BXa.�������ڔ����l�T�Y\nmĸ�QeJA�H*\\�Qn����rځi��4%	��\0���PDZ��\0m�\0Jt�@SPe?�@�j\0�\0S�P\0���\0e\0E�\0v�j\0Z�m\0k>�q�[Ϋkm����ǲ�{��e�Ww�n6a��|�y6q��?���W��fyn�zL��G�D�����jK6���y(hI{�B�h�K$2���@$�U��Ho����c	�K�I��$5���nX=� oF=o_�{ۍ�ϚA��/x�ˏ;X���F��e�o>ȑ$(==��k}���h�6��UՕ�Sz�C\ZcM�N��RW��^=�z��l�w)��������SW�K�M�p����)6 <֫W*�iz\"��\'m�����!L���<H�q��!�P�<�L\"\\jc�֦-.�<�r�mhi��K�ت�Q����%�~w��J��B���1��DU�:�������c�GD�eLI��*J�\nQn\Z]cӌ�@\nI�	$tے���؞5��\0_箤Օ���9�u>fE~�>�bW�}yF�En;�c��!��	ݱj�z�_ȧ�jUF�_�=ȟ�#�}��O��po�4���T�.����m\'T%\"ֽ�iYum����Z`���U�F�Z6>�*�>X}����M�5�����#�� *\"������f*\n�%$_�VK�!�@E����2�a¥����-X�\"���JRv#�)nCI�����\Z�t)�����?\'\'��u��4�]�nzXV<�Q\"[\0�wcY�P%#V����u��)R`e������\\-��>��/�O̝)vQ���܌�#(�s�;�3.Nc�I�B�H��^yj�%3ێ6ƿ�8fY���TǤ��!���I(�*JG�$u���,ש{��B-�͙��%���Y.��r����B����7V��hu��\Z��FZ{9v��S�ɵ0M������W�v�֝K>S�!Dx;폸	�\\ɱ�d����%�&��l��\0pJ��wZ�}l���/\'�U��������F@��]1�-�5$�D��Y�X���g_��-S�y��B[����fֵ/f�{$@�vR*�7����[!�z�q�������yQb�_�������������tp�������q�.o5��++j4�YM���U��=J�ʌ]�����B�\n<�J�]���YG�X�O�|�I�	�P�wP\0�h\0�>t\0-�4\0 �\n�cR\0���A?*��Ƥs�����/s�z$��~L|L�h�>j~� O�u�~��/�������|���O�0�B���:������57��}z{UAT�#e�i�.Ki����!N*w�\\Hu؋خ��m�~�VW�\0^��4c\\�L?���^�-������H\rL���!!J�D:��R�Qq�����\0��?���?w��p�j:��aŋ�.�l�S�Ylm��K�\0\rq��2Ic[�5u���S��	�t�\n��a�R���S\0!��\'Rz� ��NDD,n@�V�?�rt�ө\0H����\r�����\\����01ϫ�kk?P�	���Ԏ��}1F��\"�Ulyu�Y�AX!�w�^箴�B�52jK��[��4*li��s9x�!7��}vGrS}T�\0557\\T������o�q~7�yY+��b�a?�jk��ܬh�As1QP�:�J�dM��͡�۴~jc��$w�ڠ����{�V2&�,!D�k+CY�)H^4!(�,N��\0eh�r�I\Z?s� r�k�˰��pH~:\n���\n}�m�����i/�x��G����7&�gr�&S�Knh�����,v����[l�pɒ!�����;(K�HaEH\rZ�#Q��R8ͤЬ��t3����1�����d�Kq��Bt%�P}5+Q�ӯK��2:=Ed��]7;��C�c�d�>$Ŝ�u��,�\\\\A��՜֣st�T�G�j@��\0\"�\0QN�0\0G]5�\0�;�\0��\0,��\n#��\"�\0Z�\0�(%F�$��C�a��Ⱦg��:GA%\rv?R�Oey��m��[��W�{�P��m6�zč�[{n�wn�������Ӷ�2 N��R���Ƃ���*$\\��UVƤ���u��Jw#?��=\'�ㅌ��E[1V�S�6���IR�T0	�kWU}M�!y�k%T֭ns�I������9�g�yo!�.�<�DE�8ƛs��Y�K_^��	[m��t�zoZq�)����ehIF�\Zz2m�~�qw�p�9��0�_L�vt���r%�Đ�=9\r-�\0��3n.� S��S��䄣_���K����VW����c+��7�f�\\�\Zem�����R�ց���(��(��uHwc4��T=S��\0/�s_k�{[�c��2Y	j��3��L}ʒ�>PXD]>�L6J\n\\P+)��K��t��?��������I�/�*���1<@��4���ԇ\\�<��.�nE��k��-٪c�fj��V<���~i��Oo�c�_˥�ݎ+	ٞ�%��F�����5K~�v�J	VХ��rj�R�n*��Lд�ߟ��B����C1,������Rҙ$:��*ڔ��\Z��+:=,�F߇�M�^d�3\"�d��P�۹�n�ڰ�7���KF7_�����YHim^����t׾�\\�ka��b;���m�.0n�%C�H��Y2��y��?�tx���?�ʑ����#�q`P�����Zi��\0���rI����hͬ)Ee!`+�JM�47�X�W�k���J%��@����)rBP����Nc�]�=<j�T��M���\"��|rr��SH�>��W38��ϭ2Bֵ��b}RT����j��m>H�XDT�A	Z\\ԕ6��7�\r.�tɮ��J���J.A�[Ӫ���o~�y\\�3##ĳS\Zf\' ���J�i����r� :��A�J��du�[�ck�I��	m9�Xlm=IY���\\��|H���������Jԅ���Б�.u����\\�_���pFc8����ؐG�kÁ��ّs�K������M���Z2YU@�uvr2�����\\�uB�؍G��7U�B�{v=]�^�EB^P���]�q�T*Ȁ�\n�\0�\'�iV��֣�;h\0��\0M\0�\0\Z��\0`|�@M\0i� ڐ�Kڦ\0��J9W$���l8�\ZC��\'I����x��a�S��-d�Um�J��F:�Z�u��Rۣ���R��2�5��gk��Cm���X:~ߝv-t��+��%ň��e~�fA�Jy��׵O�Qn t�t�����ocUk\Z!��0�	S�PY|O�fQǚn��^Tf�˹)7���F�o�Օi7�w����=���pP�ǷK�\07�}V�ה�~��9��ߓ���A&�ɽ��Ԥ���R5���\"�J[QZQR�m.jʠ��s6�z�,ܓp,\0��=\0�V��d�ϼ~���Ȏ/��ݒ�s|���Z7YlE#�U�[�Kh�����0�_�#�C��G��R�!HGv��#j�leR^)��%�qK��Җ�7�z�	#�e��>�a�B�K��������\njĖ�[����?�p�6zC�l����k�6ڞ�W+��\\-�8�\nN��(��VP6���\"݀\\{)&̙ )-� �MZ��jt���i�-E���H�6���\"�2���b/j�fj��r�LùWP:�N+j��Ȣv9�6�J=7�:�,A ں�ܨ9�9>>���>��Ś��`J�Iq�j\0����_j�����5u~ݚ�Jޤ]&b��Eo&(v�j�SB��RI��q�R�����5��G�`T�R\'3�u�Sau�iԁq�4���lu��޵r�(�����k��.(���H6;B�k~�;�_^�C0�h�Q�Q}�?�jF@;\n\0)�\0eH�@\0)�Ԛ�\0�\'�\0(����h\0�(\0�(\0�:�\0%I��*��6��;��lt3�+?\n�[�wC;r~�2AMǏ��ϳ�To��m�M���!�t�Ml/�R�<V@=@�\"����\'Z��n���Ƅ5\"�|\r�-kȜ��0k������I3&�؍Iu����E�\Zq�m�o]�>���+Ƕ�\0��D|�\r���񙔿�)��(݋�x�fښ28�Lʗ�z���ID\r�n(�i��˲�U}>^��}Y+�>$�]�Z6g��2��##Ny�2mF�7e>��3�BS!�+k��_���v�-\r��n5P��m<�{i��_�e�7��s��p�\0����n/�9or5�n+se���Hm{ԕ$��&�CR�O�)�������R�q��A/7������Dy�y��7��+jAZ�bd�P�d�[�p�\ZqJO�=0���빧j�j��9^�v��|�i3\'����;)��:F.[3V�\".錳\Z�E�_�!D);�֒�#\n�J���Ο����Lps|���.Ks^��Պ9�B���mM�$����J�m�	BS�n7�C����x�O���1�z��E�|�\'��渆����>L�L��3\\�sn�= ,�v�w��i�4��Z���i�i�ԍ\\�J���\\	��+�Lx�]��n�u\ZX|���:�9�c�c�LBC�]�$������&U+����}�A����3��;4�@�u�7!�l�������lmy�����,�E�\n��\0���뮂��\"*3�jJ���YmP, �g2�6QRP�;���*�؜��>��L|����%<���M�w�Q�_�є�%>�����AZm��U!��i-@�Êe/2�@$v��t5�V̒�)�ɟ���`c��y��݊�q?�W:yu�ө)��5��!���`��lp�e�\\����`���ħ_S���pǤ\\]�6�Km�k\'����Z�Is�]�@�-�a��O[\\Z�i�*���ʱ�3�ϟ�mQ!Gw�j�˕��+Ƥ��1�㸶1\r�i2^_�-f߀½R��o�~YX�U�a� ��\n\"�@Yd������(\0`wP\0�h\0ͦ�aR\0�Ԁ0;�I\0�{�\0@�\0[t���\0�\ZȻ���)�V?(�o�\\�Im$�\0���~Ը⽟�~�U]�>��g\ZҠA;�\"ɑ$\\z��Z��:�z־.�Y�}*�.SR�>�\Zl\"J\\Cj�t�t\0�Ւ��jK[�s���~�a��o	��=�T[BۉW�\'h�b¼JEr��3��m?��8ԝ�$\'`ڐ4��3\'�r��P�H�	�)�Q]���:�+��ι��y�E;\ZH)�����t�CMqF�\Z����<�!/�𜋑��W�w.W�q\'��j!��	����{g��W�]k����3�ڗ»\rn�1�=�8��)\n��m�\"��ųG^���!��>�Jt����Q-&Y�Z���zejCD_���ǌ:�e�ժZ�jIS��l[D��R�/H^�����X;Y��H.wÅfq�Ҁ\Z����ϕ#㩮.F>t-�	�I���{�+ǒ\\! _@*��4�r���6JDu��W�ʹԋ�� >Q<��(ۭd���\"-g\'�Mk߶���И��fˮֵȭ��у-$�u���[�cq8��\'�%���)m�g�N��߮�l\nV�[o��_^��|̹k�\0W��/(�d����3�K��㲕+cM\":�!~��7��D^��\ZW@�2W��nY������r;��g��cs����-n�����i�%�Ь��J��&�w�cq�m��.z����U�j[Jn	6���u�/-��>����u\'����s͒*@,�ƀ\0S���{�\0�&��;*��ڀ\n#�P�ֆDT\0Z�\0�Kh[�PKm��+�\rO졸%)p4#)�O=5���W�=�\Z%?�y��O�y=KR6�n���-Y�\n��y�	6�oK�ߴU�\0V����@\r��J&����V�jB�[A�]�-���duR�V�?��*٤��IWV.�>;�d?\n�i�!�30���%��q䅮�k�U��$��k8��^\\��b��?��G��M8�q<�+�de4�xac�!��ZJ�����I��]/M[���U��T��U�s�vQ܌/p2����i�\\�ч�~)���$7����J�6\Z��:8[�\0(u�3�~T����1���,y������\\�%ē�i�$���mkB�PSo2MͶ�\n.-���W\\Ӊ�l��~pI9>;Ű�,n=�lV#�ǰ�-��@-�J$��D�����V,��m�ldr�l�ǸP�/9�D��\r��?1�9�ㅷ\n]i*	q�)	I:R��Ӈ�|/�z=�_���tod�&5�eLT�c1�p!�����@B@C7�� J��M)�ZL3fH��\0}R��S�%~{�߸|d<F7��𷥜[c�qթ�T�4���T�J.I7�d{E���|�En���Ʋ�[y�*;��($X��h�m��z��đ{��O����,G���ֳ]�.��D�FD�Kf��uhlM��\n\08�ޱ��\n�+c)��FЀ_�ˎ<�`����+%����%�!�IU��\0�~�.\r&�P�ɩ��<�%�����\01�B��!�*c�<��TҟH��H?4]�$�-A��}F�d�\Zi�HҢ�&�jÊÊ� ������mW�A�ZV-!im�$y�*����^�ĄH�&d/L��iL����Gˀ��?����=�|@��:��诱��\0i\"+�K�����.\'T��%$��׮�V�J��_j�\\�BxLBJS�	67![�t2r\Z��+�N�ܠ\r�?�I̍X/�W���^P���޳Q97���Z,��dX�d�\0�7~���uG��9�f,�Є�T�A EXʶ�i\0`Ou\0&���\005�H�\00��\0�GƤ�?*����:T�����}�r�.LL>\'ÝC-5�|��V�Mw�+���Kcp�w��k����J��[���`�$$vnQ�\'Z�a��j�C2dT����H����y��a��mHT[�h���o&���~���X�Ԥfɒ�u��\0\Z�9�g��r�y\\�0�\'0��ԋ�o�qH\'�T���\0����\0K�<բ��:}$�ܳ�JVԐ;}y��,��6\\��a5%`���!R����y_�]i����`�g�.��}����C(��PօmZW(�qI#PCaDW_�0,��{-C;u��ǹPT�i�zi�U��e{�����`=���+j\n��QI$�J��c�\\oq�\Z�n���=-)�d,nZH,A^s��Z����%F�f殊4ia�i�1#Ӹ*?:�KB\"�-Oķ\"v��5��ic&>H��w$��:%=?��]�mc���O��!������َ���{�\Z%G%�@p�iY�Ɗ�ɤ���c�^�����F셙[�����tK$L�\0�I�kvڟFg�^��Gc������flC۾:��u�ڧ��c�Y3=�5h�W�ܓ������LY\\4�D�x�/z�eҍ�+U�ڑ`k�3Y8�C��\n4����)�%�8�!7Q؝.���\\���Y��$�ӏdx�4�Q�|[����rojy#1>�fq.%��k6���<A+m�����HI\"��զV�\0ZuGl���0�&� Z�� �\"�-�&�������\0,��\0\0Y��\n#��\0)B�\0�(�D~5Ȩ\0�?\n\0l���Zƶn�<�𴓠�\0���X;��׊ݝ�kr{#[\r�;4�1�f��\Z�^�R�z����o����l-!��؋�ScAS���?�F���1�D;���af��H�cf*\Z2�%�	�D*y�T�Sm��I�����)J7�Om�i�W���W���Eƈ�l2�_Rg]G�*�vF�f���a�n��)�����Ƹ6c��LS�m�Cv�~����^�ڥ���y2V���U��\Z�{�{m�������eb�{�\n��圫�c�uПQҒ��T�w4�\Z��G\'<��ue�g��4�F�G���E�Ą�nCW�w\\f]	q�XDl���C�IYM��L�-�������m��g��\r��K�|N߈ߤ���IJ��EPk#�G�a}��\\�7#C�r7a�����\\p�Y\r��ɺ����Sz����Ki�f�祱S��,`}�fd����0�G� :��\\u�fJ�� �6P�H�=��\Z��\ZN����CP��#2�vkM4\0!JX{��ft�3�csq�����d��@�Q�\0�#N��}	�Z\\�W>b�D�,��\r�d�JJ����\'��E��|z\\R�C!(���l6�,�\r\rBzh{�7������h	OD$�Hh\\�.����m���R:��^�u:�jng#&3��_�d �]\"�����41�u!<�%sb?��Sk�ڼGA�<rY8cf��K��#�i��v��Z��\rz�7$ Jh$��@��\\��}3�d96�͚�v���ŗ���ڒ��ĒmqM�@�����q	�qߨr$��q�]���qڡ]����3�����Z��ͤ�[u��[R0���l��(�_^�^E(~-���w��VV�7�TX(-�`Af���2�<B^�\Z���dsf�!�\rJ\0�� j@��V�m@�\0�\00\n�H	�;j�\'�T�0(@ �ô��>:�83�;9���՘��<��4�7���ڰ��J�=J��Tk�ү�s���T���P��̥�9}T	��ߧ}zl4�E�;-���G٦~3�H+��?���J�I=�h.��g�˹H�%�h�g�e}��o4�Լ��\0�O&\\�|B�)�W��ϱ�Gf��?�hw�ӆ5Ruq}Gua�\'���QI�m�Ւ%y�3\nC��p�)]��V��Z�����M;��]L��ȼ���e�A#����7������v�\"��v�P���%\Z�ڻ��[�=;�o�}��Ӻ}����K��֩ٯܤA|)Rۗ��L�\ZR��#P|+�e��V҅G�\nv��s��L\\;��/n�V<�.�#�Ƒ	M/\\����%.+\"Dv@H$����&�����c1��@&�\0\Z�\rܣ�I�j����$z�p�祾5��\"��WA+����ǩ\"�^�}t5t}Ἀ�O��TM���*D昀����vkL���S��6�<��Axڝ�ʄ�D�ݭ��R�]�w��ˎ22����G��==>FF?�J�\ni/z�8�v�@*kr~«�SF�X�����3|c\'�����or�\\�5����\ZIv?LY&S�xzn2��uI\Zm�a+�q^CD��`�i��Bn;Q�n�m9��Q���߭\0\0�\n\0,�\0,��@�\0��\nP4\0Y�@�U`Gm@:�4�uA-6��{��(m%,���0�\\�/�*���Iԡ�|�_םϗ�]�������,����������#AV]���ɵ.�**AkR�~�o�V�)vlI����M�:��T�����e�<��I��\Zq�J��y���1�)a�[�R��Jz�Y�����X%�=�2��3�9%�_,[J�c��-*+Bͭ[�>=.k�����G�fV�K�m�`��;JE��ڎt�k\0��m��P��7�\"k�Q	U�MM��Ԍ���|��N��~�#�%�H[kHM� ��~ګM��FեC�%\"��Z��Hp)$��	FI[����ǝiK��?�uW���	ӡ\"ݵ���W��{<}�|W�)cm/0\'�2Ju��2JǠ�}P�lJ����W;��B�������\\�����B�5>:�\nE��7�w�qž�c���M\ng�_z��[���[V[\n��aZ�bz��!�Z�\n��mJ�\"X�/��,*�;�I\'�Kb��M����Wb�d��y�k�Q����V�2̋DF��	�<��Z�&�:dw)�~�ozKy�u����F�|(��Dp��\'c[ԇH	*v�j�RZ����\nA{�1�`&�{\\ �ݖ枪A�_��Txk������A��\r����J+�ҬS��������:�y@�ƷA�1���:�M�osJ�?Ԫم��\"��)����^��;]#�g�����pҽ*G�nB��S\0�\0\n���$\n�o9���@�T\00*P\0T�0��	�\0 ���~ \n\0HU��_�z\0������o�~�AK8�S:<�\n���&R\\$�b�<4��Jq���;���H�=�q����/pp)!!J;�|�w��S\"��|nt\'_`�������[���frr|��ͦ$>�*\Zdl��?�;?c�|�i��]l\\���s�0��U�n�m\Z[�xZ�d�շ\ny�wvi֬D\r�D���E^�����c�u\0��$�kF4[�>��2����C��x�Z*?�Z��Yē�B�^�����&�\0���Zrǡ\n:�pzn���7�s������S�-)\n\n��!A}�=���-o�ܭs�2��ƒ�5�����:�2I>cʥ>�o�\\l�\r���\r��W�q�q��b,|��AO`�u�+q��\n���6��4�W&İ��-�Kb ��N�:�d��ʼv(�:ڕf^��9�U��v�\\��B\0�kK\'^��rZ��X�qzuHc�\Z��J��JPw(�\'ZmDX��&t͙)l�Q-��Sc�Ġ� /�>��Vu����`�y)�/�i\Z�,�����s�~�`xfS�d�az���iDq��]��\0��]�;G��*\r�v��^�Vp.���{G��.�Jq��e�\"B#q��%/�$��3Ԕ��J�Q�䲋�*R��X��f���-kL��@?\"N���M>���\"� \0�z\0\0Y:\0(�\0-B�#�PD^�	P�#�����+�\Z��+ϑr����~&±w���Y�������)\r2M�k~�O�\\:��e�I�)�*% ���zʄ���SC��C�^�t-�4�Y`�um\0\Z���d�|���nG�u�rt1T�XH9v��<r4�nJerOj�M���<B/��Um�`���;�TI�>;���1�q�(i�@e#�Ǳ�m�ju�WI(��Z��Qƕ8E�e��W�CVL���u�sV,����\0��*Qt&H	����¤eDG�>_�\Z|\rPuDG@۠\"��#Q�m)Q�o])V��������I����/7�d\rI\r���W���4����3/��w�JS�,\\lܛ�lu^�H	Z�$\\�3����7�4{9$-��I��6gw{�\0������g��#�\0B\0J��%!#@��+=����n{iM�*r�B���/�U�$q��\0�L�.8�tE��M��2?\nv\nn̽��F�LNJ�� �\0�)�E�p)�s-���O�Rj]K-ƞN�q�(i[_��Dv��*�}$W[�ɸ�jF9i}��sa}��R���\\u4R�1��.��NZ2�Sl6���X�\0�$�j��+S�>�c�{q��(\\�bc�����U��W�����NFMN_���3-H���\r�xߢN��e�0WR��S�EZ��.I7�T\r?it��\"c����KOi5ރ�\'CD\0Y\'J�@4b��+y���\0��ƀ}H\0{jQ\0��\0`Z��z�\0&��\Z\0�����x׾�}����0�XL�\"���;c	i�9���J��(nB\r{~���VP��L�_�W�#ϕA�=	R HZY���J�f�Oq\n����*�c�`��7��BcJS܁g�q��w��6*[�&���\0�w]�\\+Ư���^���t���������יH�#>�]$؎ʲ,%Ip%��zw�bE,ʹ��}��e��\Za\n[��BA*? \rm�Ii!ؗ����r�W �����̼��;0h���T��,¾���k\ZK�8�;ȟ�ly�CE�\ZN��܄����h�Ե���x��AH�\ns�G�̯����G�����_��X{x�P�׾�C}����adn��#۴�jQw�^-4�(�N��e���d�!���@�Jnk�Sq_��!����Y)6��ҖW+Ԑ��:u�1F��@])M�Hfe_܅kmOf2��9�[u��Y��DȝJ�S���H�1\ZV���ԣ696q\\���S����զ��m�Î��IX��\"�:��\Z�p|a�_\0�y�7SٷY�\rimT}�h�		)\"��z���S���}$��k�佽糲X�+��0��^>[7A�bT6��Qb7���iU�Q�֝ٿ`>�w��c��![���*B�ZD�P,�<l���o��׋:����7]�U�r`Hu�!���9�L\0XX)	�Aǡ��I�M�;�@,��\0M\0G�h\0�;�\0�;\r\0��P*�\0R�\0�*>@FYg��?%`�\0#�Y�j�T~j&�=���G�w��c�,�B�ݯ�F����=K�wu5�j�5���ї5M�[��QR1̹b�\"�X؛^�{x���;��rRp����+.@E�f1V�E��/�{��:�y9{\Z2���\0�?d`{|�R̅/#��i][u7-�?�߶�i:����h[�8,@�.�v��M2O���\Z2�c�Τ�h�@����TF�Ζ�}J,���\Z�B*dj�7��U[Q�rOMuVhF��{۩�)�Y�[jlg�>���6�]M�(q%&�\0��W�(W���Swb���#);$AuL�-ڃk���WP�==mΪ�ɾ�cm���̇PB@\'����!�e.�y�TSF�M~��{���\n���5X�\Z�풦�.z;��J�> >U����#�{r�cO*���E��*8��Ø�鿦��+\nX@M�E���	fytg�,%j1���Iԩ$�\r<*7�\Z��lV_��Rq�0W��o��]H\n�5+B]}I��f���@R�<��H�[���;����T�����X�v9�6@���\0�����E\n\'���ڕ\\�b-REQ^}��zL>7u�}d�·^���}l�{ �r�!������5����Oہ���8��S\0`�(�h�A%���4��\0�\0\n�\0:Ց�wP\0��h\0�*@�*@&V.n$�&V:fbs�9���Y ;ZK.��AJ΢�Y���jC>R��\"��,&4��0�Y�`�au3S��Ӵ�\0�k�l�T��#)��8T�pyo�8t�|�j!�G�e*�:򅎍6\n��b�|V�m�����]UG^�qLO	���#���=>?�\0Y�P\0\']T�u�Ě�Fl�͒׶�z�*�U������Ӽ�n{����씵cu�I7�vS��n�t��r���\\��\n���F	�W$�vO��׵a皿\rF䲦&�WA���KQ�HT�zk}Z%���\'�m{L�����A��l�g 4�q�nV\0�{��ν�N�]��[=�P�6��L�\r6����6��ڶ8��E6��|A�]J�ռ9:����\\��OiA�)���;4 ���{�t�G{�RN�q�A�퍽ƸWe�f�;���?\Z�b�p;����H]�uQ���(>�:[����B4���u-��2r�����I�TD9��/���k�Ȃy��m�K[����u�h��բ���3��Y8���MT�tZ�_��^��\r�y��4$�ƄC �_rȗ�xf2E�ź�������$�xWG�G�_r�5_%����r>���!��3�ǽF`A��\"7��uh:��i�\\Q %d-/Z�L�fֱ#��\0ce���G���*w��_����J$:�\\�=cʶ��h\n�:_i֫�Z�=}�Z����i�������\0i}����@�q�p�t���b�鎕-�$-C����[K%V�z�Kڏ��^�\\���ʚ?B�(�=��Z��v��u��\04\0Y\0Y�\0Y\0R�\0��@(~\0����|	�T/���Ď�tH��)yo­��NvU�\"�kgӺչK;֮�I�-f�f��)^)!^����\0�7Xu5I�k>�@$��(� c��Ӳ��<I�P�������Σ���2��\nծ�:��(�)u�;A�5J�#_�%7�s��3z�}L��t��d4/؁`+�Lj���͕���l{-����km�\0���Қ��>M��SnI�U�f�w΄K��V�u�7��A)�-I)�D��������c�4Z���p|����[�:���B��M��\n�4Q	�_IA������$$ؐ6����s�\\NM#ї�&L������{��[�+�ܦ����ܺ<o�D7�H$[}�����u �/�m�t��e�,e- �=oBB,/�x���cFq����k&��CM���U��O����FN�^~�;.��d%I�Q\r���Z��b��5%G�\\Ӯ�U]Kx �s࡮]�ȑ%��p�\n:7��^�z`���!7�R>.��cO�0qؼ_0�h^?���`)�ߦ�� z���RE�A�dZ�ڶ���j6؎���E��\0��KE����~O�z!k�Cr���cV�\0��)�Z���Or�q6t�.��DjMv�<�2��l����C-TT�r�\'���	�d՝^�a\n�ʣ�\0�s�Im7�	\'��S��g7�ԉ�wWD��T\0t�@��ȧ�n9����z\04\n��R�5#��\0`P�w�\0��\0u \"�l�<O�r~U#o������܀?��[�\\���\0�c�;*���{3�!1�O�1�o�1�Ȑ�񺢵��Q5�Z���tg�ڂ���e㨩�����D�gI@�i�@�\0�^K�\0���u������k�	�~v:�ݙhY \\t���z���DX��\Z*�\'Z�)b8�CL:o��O�\"���v��S-Ÿ�1A2r3^����!��i$x�8�½o�cUW�m��qZ-�w�e�L������ݻ�\Z��^�����1��i�ĞwyqJK�7 ��75�(FkZu6���4\0G�a �$z�-��m ��E.̙����{̿j��k&˳x�E�r��r:��I�Z~d����^��5��dk�v~ۇ��	���.���q��|�1��Le���P�@�A�v��V�g[(gR�V�X��Kj:Sp��?�X�\'��%��m�E�e\"�Dגm�zCe�\"JJ�m�ҙq��6�o�����v6��9�;5ֲٍD�#z�t?���c{I�R����@�\r�7�\0֊�9\"�g�	y�Bc0��Iq-��\r�.�:$\nԨ�;�k���>�caGrxe2]�\n�̎��Pg�[z�=m�����]+�+�W�e�W�䉳����b�剷��;.+��XG)Y����@�o���{E�}��Y!�n����xˇ��}|URBJ�\n��ړ|\n��v>ūm5)Ry������D��y���x�:�\0��¢[Bn�o\"�����f��GX}��o�Ϲo�>�r��zdy.Z����G��^�J��t�\0�7`�\n�������9�p��-�w,����NuX��2�\r�rR�J�)�R�ܡ�Mi��G��JN۞ޕ`<Ge\0Ge\0Ge\0G�@�@��@�@^o+lH8�.s����\0��A�Q�s��\'\Z*��n�7v�\Zѓ��5�@+���H �N�\0�\r�C��%C�T6JCs#�Ci!J�`oQ$�_y�\'-����@/֩g%�Ԣ>�M�ʳmq��O7�u�f6.w���iӮ�s�\"�������ɯ�~��|��\\S!&6�^WB[[�9w����t%����=�ah\Z��\n�/7�{mC,���:���6��{�A)\Z��Cn����_X ��ȨcP���7�V��H��lu��KiQ#j �y\"�=m�Cc�7$��o0��SI�5QH��L���Tzn��\0�\"�G*�S�A����^��R���^�q��Z\n�d����tj�tR�g��p��q93�&��rM���b� ����\'C�\\���3�u��=y/�z�~��R5S���	͡cp|u���;\n~K��m$wv��;Iҙ\\N��˙UKY����U��)�%�+9�Hܡ�\0I��QQq_����۝�$F���cn�t��2DX(��H�H����di��1a�Izg\"q���;n�R�)n8��BBlM�GR�X���jJ�\re\'�rgfT��\08�Y�J\0r�I�^�8�\'w��m X�Xiֳ�*�3��>��<�h��\0�a�Q�S�޿����M[1{�⪥�l�5{�WTᱛ���z�&�qث,���N.�XM�J�Գ��B%�f����wO�L6#���E}����|	|u��8\0=M��\0Y![Np`�@��HO� 4�\04j�H�M\0\r#�P\0������4��\0�ng��	��T3e)]��[�ރ*��]?h�ϰ���y��o�{��0?\nڕ?=)Ҥ�Z��>�ؖ�G�j����z����%��\n���]QB^���O\n�X-�`F�`!5v�(lj�t�,�j�&�_�=��w�힫��UW�����4��)�KZ�+M|j�\rw�)iK&�U�F@~�������+JՍ�Yg���	k�����11��uJ�+X.�O�5�W����}u;7\'7��,�-\n<��rf��%EG�����Mux�����B2��m�Dv�[�u�ڕw\n+hу�cZ�\0�eHIH����U�n[����ّ\"�\0���q�`ҳݑ#ӈs�k��++ó����w�[ӻu���\n\Zv���Ï2����-��gz����9�\0k8�0�M+��vU=-��gӄ���i�hj��a^�+���\\��7��vܲ�$Zߚ���y=���b��I#u������C2���u�Rn6�9�_�d��ՖÑ�V7,��V��{�͗�����8�����o�}�%�g��\'�\r%f�������������{��>fQ�\"t�����\\S�弐+�V�l�7{7�\n���\Z��$�Zݵr��D�rx�(�6c�z@Zg���ؑ������&K�������;�sYF���bǇ�e,���Y��>t���D���V�pt�aKRt�q�y�d����k��!�����:#�f6�2�&<&��Z7nyCjo��1�ub�d�s>��w�7���\ZC^�b��`�3�JP�U/Ma�\Z�ņ�\0Y�v�j���r��S2R�\Z�͏#r���r1�u;RE������Ҕ��*@,��\0	\0Q�@�@(k@�@릴f�\'#�&��1������#�ן���ǃ����\Z��@�\0�o�+�&�y��I����$l�B��TeҒ+���ڲ4�z��/��d�fl��fa6�;��`<IҭJ�p^UT�/퇇+��2y���u2R��(���Wn�I%�q����N��CL���f�Hl[��n��0�����!�⠐�.:��wPL�-{	����>5Ѥ��	�\n��\Z�ck�MC��!�o����Q�B�t=��������~�UlэHѓ<�?3m{�*ƺ�\r4�S� ��0Q��= o�iM�b�K��_\r��X��3���ƭ~�eñ�\\���:���x6=5KUYC&�-�ܪ�<w۞%���(�f]E��L];��5?���������!]^I�!�!M�#<��b���o^���\nv�B�纶�ڌ�����nhn[�o�[�x��\"�l�;mD\0ә����CcU��R�	��\0��B��%��DB�R]]ִ�\r���UQ�\Z�}m�8�1��q�h2�P�w$XUmY2[$�o-�\r����n�E�;������\0O��\'k�\'�%f�A��t���C�޿+����#7*�l0y\"Ne,!�F�47�]��Je��%�W�+*���hYh����6��!�~D\'�Wo����{���Q�烠u�j	1P�t���ֳ�\Z�-@\n�\0�/B 5=j@0Ԁ`\00;(\0�Z�=@z�\0��\0:3��{i�����r̤�\0��,E��e��\0~���k���	ɫ��{��\0�x�~�fc[)ɐb�5c�]o�%i��\0Ga�_�\0E��Wj���\0C��~��{)�-{vi^e��#�~n��𫢂�s��®�f�M��\n�hG����T�����ﰵ�mlū4�P���9�\'�:�8��)�/bm�,}��Z�#�v���B�5-)!ƃ�&ہ��֯zN«�4hq�w��J�ɿ\"\Z,$6����{��5�Z��GV���E��\Zk8f�q�lm�rN�\'�*��;�e/X��4�Zԭ�QۥE�GaY.��7,���\Z�fVI{���̯����~�NF�@�˦$��D!o�{�4�W\'�{+����������������LG��#0�hj,vŐ�m�%O�R\0\n�����;�M�~[_S�%�Bt�X�X��BTOf��Ҭ��3�:�,�mf�R��ۤ����󤱨�9��h$}MZ��9��U͓;�ax{.^\'�eNH>_��_�	�W���\\i��<��e���Vj[�],����\0�\"�3]MI��(%�=�A@�_� ���\0;x�D+!�p�8�KL_�}V������6bR�P��:/���Dg\\iHm@-O�Ɛ,|�?��\Z���9��$���~�{7�W����s\r)��}�6��hn�C�\nnf�T�䎂��M�_��lK.̺~��Ǻ���g=�g�J��k8S��T�$��\"�U�E\n)����^���8�7���˒(��˦Gh�z֓0QZ\0,�P\0���\0E\0��@*����N�uu�Ȍ��u~T�ޕ�/ۣ���4�u_R�ڛm�n���ޣ�?:��r���Zi�ċUK	���V��ҡ��&k\"YB�_g@ilj+�3��$+�\n��$S�q��&��`a!R��9�?�ڼ���=<+wS���/o$.+��?�N,�\'�-�f�!.<���#���WI��,hGBu�*l%`�A?��TUac�j�#U�N�~���_v���BK�\rE�<?m@Ԅ�\rȿh�ETmPߝ1)�Kc�/�Uc�V���\0�V#�R�c^:���R�6q7�������j���ΛR�ۅ��V��a.,~��~����H.m!������B�R�@��Th5K���7t�TRu���\':�AQJ��M�\0m\n�ؐ���V����K[[܏�T���2���$F�Ԩ�+Jд�ԩ$�T�U�\nq��~s�^s�8����R�d���@h�+j���Z�ɣ/щ�S�0�a���&�$_Ʈ���7rx�Ju1�,��N�\n��!�\\\Z+���u��DHq�[e�����\n�QB�����7�4GC���\n�T@��m�{�k���|�߂�B䎇U����z�Qҩm=�F�\r�_�\0O9�\0������(Ə1���I)�FT�\n	G�P�GƠ�Ɏ����H\'����\0�\0\Ze\04�\0`��Z�\0sm��ӡqA#�(����s>�~���.�VY��^��ٌ>	���E��շ�J�M�B�����J���u����w�d�8�x�t(#&8L��8�)i���\'�$^\n�w����^�!ڵ��;(�Ly�}H/�]ѬUu\r@<*Ȇ6���+��t«R����7����2_���mJ��K�Ny*�#�n��wK���)t<�>��RT�v���^�:jU��2\Z���.��U��\r���E2�z��h�B:Զ(�T���\0���M�j�6�\"�\rO`��Ev\"}J����k=�N�l��}�o��{\'�Ί���,*��mb#)I�:\\z�np�m����ڿ���qp������>\Z\n�3i�j�,%Kv�W�4�^�de$)7�WSY�a�#��%�I#��ݏD�rR��*F\"��2��\"nJj��ǲ�k�F�IZ��V�T���+��jߡ���RG\'��K9!s3�����Ut��%6�^*q�H�9r;�����D�|O��NHP$�%a*��X�wxԢ w��%�	$���)�Oi*��Z�۾h2X�3ŰYi�=�u�^JQ��Hy��.:���_j���+�����c�KWS�^��@��\"J�3���V+k�6v\"#c1�����*C�6oӲ���R��s���mq<Ukm�cIA�q�b(o\"nj_(��������䒔���j+R@gB�a�\\��(\0�<(\0�;�\0�@�@�\0(�����7{��B�o6JGx�\Z�\0r�\n�{�XJ��{n9n���eT��J⳰��p�\rK�C[%\'�J����UTC\\�2�P�~�5D�W�fi*S�-���J����[�M�ԝ�w�<cߞ�6{�G�_�\0,�\n�c\'D\'O�p.~5��N9y�ɶu����bb�~��I��GRh0������q���ր2����S����YM�j�+D9��5����mO�t��d�\0\'q5Q�B4�	7���UcUDr�IQ�\Z�c�Q����p�c{�iVf�t#��вM�opO}%�n:�-��5\n����T�?����h�Ij�\"�|�&\r\'��a	yh�3N6��c�<�T�n� �W�+$�X�_�YגZA(�\0�iI��X��U(�srZ�%�I��i�S�R��ZqF�N튰���zԪ���k����!���Yi�B�ո�WA,���9�u)�5�`)M��u��)-����Z��B@��v+7�ir^��>�S�5��--C�a,J��(��7ES&�M�)\ro?П=������9*���6<,qv߭(.\0�z0-��q�^���R�R@���YtĈp=|�EIѿ1��J͆d�T�#��@-�խ��>P�ǁ���Ԯ�h)t��²�gK\r`�Y���9n��K���v��c��7o�*\\W�jR�}w��(�\'�s���\ny��\0f�Ok�2L��\0Y4��g45=�(GJ��\ZP��\01ր�\0:�\ZQ !r�D�✫��Xn7�O�:�\0�o��*ԧ;*�.��\'%>�=���d���GQ��<����\0��\n����8{�M[�{�s\"�W����n±�����/�T��M���L��^xۨ7��X]t���E�ɃKw\'S�jd�rɥ-;��\'J�/Dsg�0c{{�V�,����_q\rX|�w}����|J��9wR�!HU��:z������M86$H*o�؛l�¨�w�Q�(�6T>��}iva�Tj\nz�/bIs�/��n\'¡nr\\��u ���}��[J����}�v���;��I�g����GL\\~:;1aFN�m�m\0x%\"�w���^������i�Il �q���Ue���!&�^����C#\'qs�t\n�f5\")�Y��%]��6\Z�]�VL�\n���T1\"������\r9i��J`����2,�|�?⮿���y~g�e㏊ݜ���wԧ�w�<�(�����2$v�� w���B�)�\Z<��HSޚ����u_��=jR$�=��+\r�~Sn��!�nc@���d-*Cp���>�8(��\'��дr�$����C�M�mC�@�՞������ ҂BȽ\0�P@Z����í\0GZ\0(��\0.�!#��!�+�[ r��-5S~������x\\^o���W�I����#\'�RF���mY��&��lJ�֗bȌ�@�ӊ$\'�R�9s��\"T�e˞�ޭE%���}r�+���I �?U��g�]�.N_�/g$(^K������V�@�d��.:{+w��w\Z��r�\\2+#9�q�po�Fyz�̞�g!�u)��*���\'������H*i�6T��\r�qq�wgn�%&��X\n)%\rA��A(�3�NZ\0��*��*����	�Z�F��M�P]!�*U�Q��\Z�>�����|��;\Z*�����sӰR�a����O\08����T����N��G���7,َ�E��4M��)/S]���\0$~c�;�TbF��\">O�3�\ZFS�~����S ��l�{^�j`��q>���<^J>I�c6N-*��s6�����Ҁt�\\k��Ң�����[��|\Z1b�j,��4���p�ugN��68�nF�ʿ�K��_uJi����6�H� �{�fC/Y\'.������g�[��x��_:ۏ��eI�Ym�免��@yI�Q\n`ʱ[���C��VK1�21q������Bn#C��/$�~�-Z�2#L߱w7B��Սҭe�y�5�\Z=���q���#�a��3������c�7��qE(��IԞ�\rZ4�Q�qkO��%��6c2^uM�(�ո�� �D��ҥ�\n�R�g$�96^|�Z�+�%輻�j�����%�e�bw6\Z�^F�)�\n����C�{x�$��D�g���r�}(cC��n:�H�{�I�ƅ�y���\"���E�9�՚�x��q��6G�t�cD䷁��(n׶�֜ �y����a��R���,�|�i�������N�*��j��,^�Y���MM�g�!`pp���c�G�l�^�\Z��x��og�����@�kP�	3�h`xTY$��G05=�d�8tbS��\0����\0�t\0 /@�\n��R�=��p�Ζf������I�LiO}NEb��a�v�\0\Zn�y�S���3?�z�Ս7����\Z&�0\r��BH�$^~�v|��S�5	!ݼ%)����(��!�R@5d@��oZ{A:����Cj�!VL�\ns9�Zx܏\nbc��9��R���&DG���ё��FCi%4�B�P�!N�Ԑ+�����F?v�b���-�Mu�Z�y�BRF�Uy*m\Z\n�����c�Kv%1b\"�P��H�%):A�\0��\Z���<���e+o���8JP�KȨ�G�Ym_�y�~��i�η���vn!��h4�g�&�փmN�&���Q�`G��M�׶�f]!���\0\"�՞�jDw���(�k^��K����\n�nˊ[�^��L���J�@����E�s���G��kz������*�$�|�m�\0�^����=wg�����ȃA������WM(�\0\":}E���\0\Z�\'�@e�%HIJT�.ڊl�-�u&�I$�4��B��-/��\0��@�֡�G�?�7��_5��=�J��}���hntS�|�\"2�yi���=�m^e\"�jt@��:ij	AdPh	=h$(�M\0��\0%]�\0��ȌF)�:��ֶ�{�����K�~v���]�i���Ť��Ү���yG��b�`H���V(%力iJ$�5W�R�Q�en�: A{j���*T�|��������7��\0]kǎY��m��#��>�F��rݔ���C\nPF���\r��Ou�JB�rowf�ѿ�Y<��\'\"���NL�\\��nK�\\���a;Z����ٲ������U�%����8�;�<��v9�)y%��Z�Ů@@C�-�}�#�J��	;H��,�?jr\\g����b͐�|Q<�<��D�vt�Q)��\n���*Z����:^� �(Ւ���hn��A\Z�wZ�$Bb;�eФ�@\\~S��cA)Ne��q�7��8L{܂V9��gR��l�OԿ.䵹`�Z���,�c�s׹�\'��1�9Q������2;�Ia)�:�ċ�GQT�SG>u7&L\'���_M?����T��i�l	S_�[A)��sҌ��\0�P �mF��3^:KЦ�.k��d]�r�;��6�|w�\\|�d�Jl��e�G��M��4VF�Ҫu)����ڇ:��y�G����,��+;L/�B���&jP��JJ��X)$��m���Â��+&���:~��\\���eư�7�,S�$�RҒZq�]ECpTuh�ѷR$�������{x����sA�����y��q�΃K*�U)Ɔ�x�	JgH���\'%�c3��H��x�ef4�k\r��4�nM��\rkh�\ZI�®���\\Q����m)N6mQ����.c��h���B.Q�<2������[����\nl�vãA�E���r<n��?����K���x�kvINk0��8�����qAJݵ $m���\Z1W�?���/!I�d��@��/7%�Ѳsᙒe�y��,�sOM7X\'Q�������M��ǧ�)���\\�}��C��}��Gz[�V�1�H��$��pni�mWB[�_�������Fsҧ����n���-�\\�n%�	��\\vTu\r�RP���R~F�Ւ�S���\\ێG�R7�ቁN*T��{��Ka_P^q�\0�8�!,�J@QQWe;/�h~���W�^~eBnuz��/k���xWŰ��1؈���͌���X�݆��~��k��)\0�(�����*�|tt��-�\0\r:�AVr{ �JOweK!\" ��Zq]��&�ۅ_��Q�nt&�V7�:x��.vg#q~Km��(\nv5-��[�JvlZ̀����/�B��\r����(\n�\0x\rj\0�	�Z�`j{h\0���|�H\r�GA@(\0i�@�\0A@��nF�C�_k�J\nO�y�]=��k��g�;Ciz����z���/�S��r��>�#���+��۲�}��+��ZJ�/>lE�~ʱ\r��nuԁD�2��s�#J�dA_y��2�ը�SD�O��O{���?���|����O��Y������̶�ʺ�L����������5���/��w�9\'�����K\"�37@�/��oA�C��A�I ��TʯUe�807�n5֭Ȁ�_�\n�`y\0_�^��0�5�H��#��`�}�g��z{^�9�rK��L������>5�}�/.�z$zo�a�Y:ۥ v���l��Φ�w�,��*PN�GO�&�����V��\"�uQf��V7[CzU�t���R�X_J���r�\\��!�����=h\r��:���]���(�>�up�ˤc��X��r�C�I}�2.H��}�uR�w)G�M�Ҥ��[oV��dT�6�uܯ��u$��d#Y\r�n�ɟ�~�\0ʄ�p����BaN��=GV�P��C����kBGt2���>�F	�t/M�]{�����Y�O�q-���;!�Tl�:�Q�\"(���_������ۛ�?Rw�ҥlgs�N��T	�@��P�R��X-T\0Y�A$I�Amc�8�_nBB��G�F\0�|֠~U��,�q��t}��oЎqi�wv[�׮\n��َȄ�+\0]G���LK�zN\0$�P�T�>�:�0^��N�2zޖ�l�R�r,��]ik.nH��E�:�S�X��ؼ�2�T��Nl�r �p�[��%im��J.�J�r�P���Un��a�u��d/�q���Y|���iS[�-�,\r�YB�-%*%��pT�T����ؔx�4D��f;.2�Q�q�&H}����Hkb[�hUʔ��a�\'7W\Z��$M�3^��?��b��;�<�هr\\�k�Z�H��\";!��a�+a�(��ho{��9ԥRo�y��\0\'�q~����7�y����e13n�ة!���\"�k����KT�oVNo���)�\0�u�ܮg+��\\��L�˒�X�g2���!b�ls�zZ�!j.�h$p�m�����Q�_~<l>!����\0S˘^�e��r��\r�6����j-���=A�����ޱ�x_*Ȼ��n\Z����%�͆����m/���RHK�ڭ�H\"��5&��Vi���ۄ䜉�-��%9��%��,\"%GL1�����9��T\0q%z\0��J�Lr���a���*&s:���}G�EK*ù\Z���d��\\�HAeL9�h*_�^J��f��҆�_�nee�e3x׸�J̗�G�Ķ؊ܫ�P�b%����T�lMꍚh�޺y!\\D�K\"�N|� I~JS���N	Zˑ�h�^-��i	;�TB�{U��IG��	;3�O��btX��B	�d�r8/Cԭo�N�yTH@u�g�MI��WI����`�9�k������ȏ��龙�]u��s�/�D�?)�E���A�Q)B�?��k0��L&���y	\"����������R	ڵ!j�{��V���KB^?�\\W\nT�.9���I�Q�%c��Ի��	L�Y��\04ܭi���ӕ�ܥ�L�6��7\nƷȢB�#?����!�V��#\0�ܕ��!���I��\0�C�ϋz%�&�^��~,V\"�q�ҨJ�q{V����\\8um�\"▾�j������L���c�d��\\w�>����@P�\Zl2�A=�ަ�oR��OO������=���\"񳐒�D���z$�\0Ot�ԑ=�V[d�@\n	�k�Y�[#I-YLݚ�wkO��GI=���\r�w�ꙩ�ԞA�ܺ����Il��egh��mk���V���[��Y�/BA�1���~F��<-\\�h6]KO����\0�w,x���\n+�)m�I\r����� od�H=jz��҉\nH6I|�.K�T��@S�\\�$��Y�:x�\'{id9�`����uσwY����\\�$g�[�2�\']{�����GJ�0Gm\0�P��P��S��]�����b��/���C�/P���d�ƆΗ$�n�\0��\0-��W�_,65˪�Dh���)R�Q�W���F�f,�j��\0mDu��~�j�/AO��C��Q­/�H��0�\\��$$���5e-ԲZ,~JQ�R���yЛ�O�A��=]=����◇���\0sH.��i���zO_�\0p����纟{���9o[�����*5�F3��BY_���]Q�>�v�ëU���f�\0k���⎉A_�ڤk^a3�`�.��w��D#)[�\0����m\'ȒB�(��53����i�&JEk������՚q����aL/l�qh��\'䏖���[��\0�R뫏�����KNh�D�\0�o�>�����ㄟvx�0�s��W���ؖ����W���]^�s�>���?�s,���yFq�\\B�y��̸�����hU�T�,AJ�.�m�mCd@��Og]iV�d(2�l�A#^��H�&�/�4��߶xS�L<g�k��K��ܯ����������1��Z��|�\'��6Z ѓ �@�:����\rY�,\'�&�mP��Lڕ�?/虜1 ��5� �+�)ɗV�\"�$��ӱ�A�}��d�3p�d�A�Ww$Q�^A�b�m�ߖ��Mzo©^O��}�?+�[\"���u���y��ít\\�)��los�k�����G�\0��r���tSq��#�N�*�6�i�CP�K\0�gO�^&�C1b(��$�N��#�>�b$U�T%���Lt�V�7C�(@Y��t�������<̺�?�p��r�؈.-�[�܉ �nJR��;u�uJ܋l}P!�$2̘�7*$���I-�q�RۈWjT�uWJ\0,�\0��\0Q��\nP���+��B�ր!�v���k���>6�ښ�{����?k���|F9!!\0�υqڳ�S������+:\ZV�b;�*�C)�O�چ&D���q$^�\Z��*���U��)yn^:r2���_A�L��㈰!n)D&��ma�i]�l�-�%?`��3�b+p�dP�\nTw��G�a�]f;�\"Z�r�+�侀���zKS�2Sš�1�>^I-�����r��L�1ѢF?�qR�H�v�sf��*�S:s�϶֨I��#ę���~cc�g�c��*T�������qM���y��� ��GnZ�ИIi�J�Q��@�p�a��5֚���r���.��e��\0>d�[*C�Ah�qM��Z�[�$�7�CY�\'�/>;2�2$�pL�<�kz�y!�a6J�\r�N�V�;�!�1�����Q�1��p��q�L�(��ͥl�k-�qrB����.�h�Ti�/�g�69��f�,$g8c+�p����b*f�������UoIWD�^��Zj�oH����Ĝ۱2��rٌ|/SZ���eB��Lh�W��l�^���\r�r|��	�w�Mj҅�s�G�����\"SPDc�y���5݈nw��e�!*��\0��v��ܣE�r�5�i�<�4��O>��\0���\\<67hR��Y��B��[FS�;�PV�y�mMK̫n-���?��!q>%�a�X����p6\"dr�f5=B�uL�[���؛�V���vZΟ(6yG��^m�)��W��E[�Z�Đˑ�7x�ʲ�}@�Ym&�YJ>_��ט�pA�f��I�)1�M-~�$\r��(�I$�A�-?�A�M�_��!�ܓ�v$����7r��r�Z��RR���)쩝�.��`ՖTd�bC���$㠇��J��H��xt��\\u5J�ZE��������ve瓐�˓)|EnAg�/����������pw�qz��!�_�_�S/?3#�Ōِ��ir\Z\0�hݔ!aZ�R�#˨�rkFU�H\r���c�<nNS*��6?���n���^[��_!�**��WR^3f>���t� �99�-��=��o�#\"��6-i�~�@��� hP�ߋ����E�Nwsݰ�U>��?_�^�\'�x�\0ķ���T�@�1�� ��u�n���]\\x��EO1��|��w�xC�c�n��_�V���*��\Zx���&�$W�kqg��S�кJ��gA�)�ւr�`UyД([��)���y[��ݎ�H��j-Ԟ��vt�Э������I��Uz���ɔSq+�I��h���9$�{��z��i�Wp�ᖠ�֠\0�Z�3AOAPI_c�����F/��L�&��3mÌ�pNРW�m\'��ĮK[Dz�iU6pK�S�r�D�VW�d��R�%S�M�M��%;ԥkЁjb��\Z2ޔJS���*o��2�3Y�!D\r��y��ur�M���)���tb�&�ʴ��\'��ի�<��)�Q��e�j2���C�K��wӗj�K�Q�1��ch�c˭t��]Gŕ���h�m=���5�X��g��w�{�fV��}��c��YB��jҬ���Ե?r>]�>�_r_��Ü�dbe��o���1#�˄�ƻ�.�_TOZ�\0n��wq�[��oGu/0��$�����v(k�=7=+s�\'�;lm��LL�4�pw��^��2.D�%=,H�%�\"��HV�(V.�Y�|�}u�VSr�\rJ��yқ�W��*N�{Oĕ�=��<Q�����VM [��ɒO�\0��ʻU�;�~y-oVH���\\AhA��(��ݏ������:Don��};�����\0��O�L7�C���7u\ZW��u��ţֿ��CR|�{���8���f8�X��*�;�n9�\02V����#̸<�q�<A�L����A.IICP�[� �Y�w����xsM�Y��#�X.���IQ�}��\0o���.w�O�,0BBP��HJR�@�	���3ձ��#�gmRJĈ�eZ�pOo�Klej3�IH�/��ƒ��F���HP����Yd�+��=T�}�\0#R�tT�\0t=�c�ar9��*���x�U�����|��V��vH���}�ϓ��gH�&L�]vT�N-�O��s��)J=�עI#�ٶ��$�Ɛ�-~���M\\���IA^\"�O�dv�mG̚��CI�ܺ����A�Q��\0RCġi��G�Q�Ԡ\rڎw���-�W@:�\0��{���/��J\\Tt�x=��;J����C8R��Cq�nX�p{�¢|}��;�{�����,����9���3��!R�o6�b5 \r��\r���o�I&||J�tf�����dvPF���@@Q�\0Q�h8�N\"�p�2.�.Tii=���.�\'+~������n9�ĉ�n�J?2z��y�=P:�Ф�y�0��� ��5$[Z]�c*���6�7[�k7�mV�\'}��8׸�q�ҦQ��序2�\0�������k]Q��8�O$��w\0Jf�M�9lc�#73�q�.�A+\r�I�`neE��P��A{xT�?����jeܠ��c���|?�Pm��ywma篱iV�,��k:��Q>��lq����:#�.�&X�A�e\'\Z�L6�:bT߮���g�(o*\Zn�+]ZѴ��MK��Y����E�2�J����eP#}a=N����!��Z�)O��œv��4R0�-=���I/�W����c�%�b�z�\"�[uM)��hl��x%{��R���(�\r�ld�\0JD�\0l����~*k��r���̐˯��B4��J$1��q(s�h�t����~I~��\0��s��NA�~3�.3�!=|��Ý-C�	�vP}¦H��6����)��i�6��?�O.� e_q8���9��9H��K{+QeY��E�BTn�ku�l�����������\0����ε����k�c��5c��(}�/��zO\'w�ҫxh(V�(���\0sJ��G�����\'�\0�K�&���}�������B��HyiCՆ�(7h�_*�W����i�(z/�����8�\"�9I\\|�2\\��=��&:!��4�a��#z7���l��A¯��t^��2����4Z\\�vviR���;��\\CR�J>���v�ˊHd�~�]��զZ4�Z����\0/��5�3�Q��z$w��1���\Z�ɔ�ZB�F��]�Kj�D�D�O�W�Oƻ$C��z2��L�y�n�.�$%![\nSaz?(+������J�I��I�\ZR!6�pm\n�V������G� �^�oIR�	��2G3��Y�|H2�c*+8�k��[A	\\����O�*;�Ү�5����o����6璦d�Ȋ�$9\r����yx�I����Čw�iJ�\\*:~e\r3�������cĶ�����־��\\/\Z&:_�y��C�L�%/MR�\nV��m�ԃn�����\\U�x~�f��ݴ^�<�7\'�R{��`4\0[�4��\0����2i���,�4(�B,]m\\�N�E�FP..\0���}�JhP ���2#���6�\"�{hi�R�r��G@6�+���B���X����#jE��{��Y����ZC)_��\'O�5�����?�Wҵ,�O���X��h ����@	��-�xs��D�%	JC�N��Aq¥[����Z�ke��b��b��m�Χ��\',���A �+$[�<�N&�S��p���VCiyf��}:\Z��c6F�\0�ԍ\rJ�sy�kI��\rjU����1�\nON����*����^>�_BIm�(�i6�RlG�R��̫S���_v�ױ�p��Ɣ��VC/�E/:�����ِ�*�W�GʽwG/,5l�vh���t����${��/:@s�p%\'	�AU֦P�П#�����A�=������v�y>��-S�\n$\r-XS4��y-���(l���FrRڵ���ȴ�%�\r�y��9�F�����=��j���\r�8��\0���Mbs5�L�h��oR�)*]����7��!���vt�>�{7#s��{����JNr��\0��ه�yN�O����{��U~�9�g���x[ћ�{�휋�}��/i.R*����CП�F@�\0p��}�}����\0���cۇ�slfJ\"2��.}\'\n�q��˗B��0f,��濡n��8���O�~��\\#��~@k�����Y+\'�D�{k[��P�\nl�ʳ]:w�]j��HX��O�,_��g!�r7��縇���0�>!����B�$%�o6u@�v Mʍ�p}��+z��nS����n�:>v����\r$\\m Z��g^ޒ,O�ƨ�$62�*;����Ԧ1(9L�i%@�t�ZC.�o�fҔ��� �P�dWU�?��\05\Zt��N*�[Zk{��%r�H�,}������uC�s^�:\n�L\n���w�rм@��C�#��ͅlH��L!�f�CFڬ&���0�Ӈ?�-O(t��\Z\n��qНVBoݠ�$��x�B��<v���|�\0&���v��A���F���u?:��Y�6|�}36+��T�f�{�:��R���(/��~���[�vt� ,[A�@ON� ��\0�_�8��s�p���/ݦ#�\"��L��+\\��ܦH�%$�Јh����4�I����Φ�B�Z\0)Zހ\nWJ\0F�c�\0�`�8Φ|\'�@�\0\Z�v�S%yU�R����ޅa��J��Q!a\0��ommyO0z�Hq�R@��*�[s���:\n^M�c+>AR� �?�Y[��Ds7��d�3|k30���Kh�m�jK��7��5��F�0������G\r�y�Q�R���^Mɞ�Ȍ�1�&T-Wi\0V���]#mi�/����ˣ�y63�Y��g��9	�p������\"t�^r�%l��w\nU����[DIe13�\ng��xy73��1�up��reOfD|jX��,�e��K_Z�v�e���~Z��W5_2�|�f�;+�02����Gɦ�)jF))v\\��1$)�Z��N���VSU�f�������#���<�1�2��²��<o�u�N����eQܞ��xAS��X��^.�[�H}J�\"d�G����cYc\ZB�a���}�b9�-�ߑkl��m�uuz[z��~�ay|�1y,C��8�҄��x��#I���+!��� )�;�Q�v� ��E��Ǎ��#���হ���.��_N&l�W	ŲК�萅�})@uiRV�Ԥ[�U�vޒ�P��\rQ�Ox�(���e)2Q!K�!�\"Ϛ�ہ�jζ�QJv/rTJ�md,ؤu�|��1�V����l�Os��sؘq�d��3�D�;%����K�oh��i��X�U~�↔\Z��\r��z	�X������{�\ZY�-2��T�ķ�h$�id�(�kt�:���4�#��j�V$��}@�7�LUDFlrv��\ZC�[����\'M��������o�/Q��a3���\'�6� �:�\n\n*p��sI;��А)v�x5V�e���\'����8��c$cc���*�䗀PqK+l����`I�֮t\Zj�z\rl�k�k(�c񸙒�����u���5>�l����+\n%77Wu�U��eŸ�?+���9&C����w7-�Ǔ8��n�۟J��D�װ����IiYC�~7:{짳���s�er�������8�����J��w����\n|�U����[��Uf�~%��S+�W�����-�R�%\r����iJi�JRR���\0����<zP@@;�N�+���_��i���L7v;B���pl�;up/�BP��}:�,%�h?�^�2�D]�$�:O[h+-ٷ\n��&��*�U�Y���Rt��$���	�e�����A+F��_�T�tG�.~u�:x��?��}��6D�l9�\r\0z�0E�\0&���Ao/��\"��į�D��׺�v���%&L����*_����@��O�t*Ǩ�𨐄�q��Ip��Ƨ�\'��3�4�\\8I��D�\r�y�TB^Pݯ^�9�c#-J�o�(����v-�����2�&߯��\n���9a��!N�}5=�u�U�����{����+��a�GA/��RI�ih�I�Y�����\'�b�y�!/`���{!�NP�NO���Y�A�D%.����J�#���Z��c^V�^�g���8c��8Lo%�9F��,�Iz�N�I6)Pꕤ�)\'Pt�+������C��)A�2H��z_!��9�K@��EQȺ�]��9���fC/���X�HRߐ�ؔ�����HԚ�<v�d�5޸��m9��y|�\0r9���)�-�\0\'�]��1�M��WU��;+��ƺ���p�f�b����[�m���|�-�k��>n�y4b�>��=���!��k��O�W//q����U|�-�Ҕ��-���?ee�[1�$>b�lrJ �4��i���Nl��8�::Ҧ�2��-�6�B��cQȫ�@�d+b@\nH��U��Z�R����JS.$˗�u�#�P�2�.V�t�J]�x\"�G�Kis�b!�ˤW�Q�/�)V��֝J��K���x�s��6䲡M4R|ͷ��4��W_��\\���\0c�anSD���F��\0�v��������ƭ0��A6\n�GP���K���S��~CO�D�\r�<Ii!\'G��[�)�(���a[�qR\\\Z��7�ú���e�/}�,�E��(ￅBܓi�%>�bc!�,D�jH����X[�H���:L=>Q�1�e����M��4�wT�\0����G�ˀ��ˊ��-��hu-�GM�^��m�H�����_j��8@˺��r���\0���� �����±Rв]&���\n��\0���ATzP�e	��L�1�9���.A���������^c�^Z=7Z��&?`� ���R/djf�vTA�N����]h^�j��-E�5���+=N�\"�{�L�52W���\n�Y&Ҡ,=w��@�t��L�lS���[�kN�k5�2;��4����v&C���a{U���H�u/U�^�&��/7���L�R^�f�����LW.#�8V���8�G����;�Ґ:�Z�j֍HC�Иs���N�#9�r(�\"DXp�6�r��Κ�J�Zd�J�o��!I�׺mH�N�)��a���ys<�)��&Z�=�!]9FV���-v��J�t7��Ƭ�Ze��{���bq?o^���7\\�>mS\Z�Q���,���Jv���RJ�G���Y�*����[9��fd�\'J��1��G��c%gZZ]�06�R&:��Ԇ�RTM�w[Rm���Z�Q�J�o���+��Q|S [��zC�lȌ�[	�\'�һlS�T���7\"����m=����6Ӎ��1��y���&G)��&b\"����;\nK{���f R�\0Yu�^���(VK��+)F�~��z�����9�G�+(��Ǚ�2�?�bkX��������K	YJHJ�v��\Z�Y��Q���\0n��%�Q�����+����y<���u��Ha��a��\n�\Z(+�q(H �Z�]T�-��(Q����XlC������3����!$G��}�)\'hWe�@���Z`�Z7V@<����s�Ǚ)<�[�Lܶڔ�BR�����I\"�=/q�P�4�ٍq���R5�������q��K9I(����_��Ѫ����ݮ,@��\\��t%������rh���_�T��?\Z�P�JB�.��VT	@��n�;�+}�S@�<����㚂�RD��)���b�O��i1\n��(�\Zp[�-v\'�\0j0�y���N=;��K���eՅ����zim��uYU�V�b�\\�W�_�)#���lTvM$�_�s������?Z���[n�[?R���7�B�Aa�X\n�a��~���rZ����D\0�\0u4� �=j1\Z(?�lꦜRH����W%b���j���=�Z�PH�h\n��*��+�e�T�A����f��T�S?�}`+v��g��J@���|��lnm�}I�\r62ߙd��h����H��̰�vgD�e����N�ZHm�Ĥ\0���*<3m�a�%L(P\0( �\0\0�|��7�S���U�G��W�#��g�Ν��ˁ,���\\��R�E�\'�A�rM�RP·�b��u��U[&��5�r|ldz��[���5nTE. �M��W���qM��-� ]%O\0�C\Z݂⹾aͲ	o��\"#J��J��͑��*ȿ��\\\"��m�h9��3�\'̈�*#�ν?e\n�m�x��E�q�2�G�I��/�_�)�X��{R�M�K��mH�R��#+���?���J��VM�[�Y����L�H�Pm�]O��ۺ���}������R#S�.q��[[O����pYhZM�P=\"�-r&�<���3{9��2�g*�����&���Dw�7�M�\'-�P���JGk�L�]�nհ���8_v��\\ks��i��R@��ɂ��(��{,w�\Z���e��������W���8^9����O\'���Y��������\0u4�>ْ�\0�DFOt�O۫)/)������S9��u�cp�]1�?Ǵ��v�J��]|X��}\'3&{��oBC�<L�\'Gm)�iPܣ�ֳ��ك����{s+��B� ���\\W.gft�UQkp�6i���	��e)��\r�&��ԋl�\r��ϘҤ$-J@N��{*�55]�6ꡧY!D�\r�(�tQ=�Fˡ�>zS}v�u��Œ�L�B\\�@��Y�H��n\\�.ns�u�h�K�k�rf1�e�}��x�S�:�m�H���\r+vM�.|�&��.Q�f����/����L��M��75�qcX��ϙ�b\ZD�\\�Ե��}>&���a6>��`Q��*`�y\r���HBGgA�T���f��Xޡ�~\0�X��m#[�a�*X4��e�� ����\\t�����P�\"M�!����VB@˒���@�m����Db\'����\r��\0�h\0��[�Ѩ3r.��K�J��\r���@vzJ�չ�}�P�������eqrf{i���`�ŌS�mg�I��Iq�&��[����,����eAT��\'p�	\0���	\'��4\0�A%n�6�sf� Yhl<��6�ҭ�\0�~5��:FD���^q����b��S��^�XQ���ɶ���X�z�0��ݽMb�]M���U9�!bʎ�7�%���-�*>8�MR���&�<I�i2���M�+\Z[n�e�t��\\;����k��S�q��=\09��\'�&B|�����[q�z�Х��d,���:��N�T7Zö�qT��W�\"u�t�9��C/�9o2}���ǉ�=){�:���;�� �%{wU��j�����r��<���x�&���2N�N#7%6LŸ�rqzlI�Y)q	qO�jΕ[dy+��Ur\\h�&H�Gx�#�q�r2����b1x<�69E�BӻE2��e�o &�ҲcP�\0]?���\01����d=����|��A�arm�Y��;�iƱiZ���^��0V�J�Ũ�rBSrkR�mD�����\rx�Gy�N#d�N3\'�k-�>����cVJ]q�l9v�w�j�)\'�V�f�����������{y-q�g��Ire<����8��h4�m>�������}RK��\0�I�ʴ^��w8۸����d�d�(+b�XH-/G�m`v�5Z��^?��^^���;��5��Fjo+�IDL�!�8��8���Wez�s���A��/���\Z1��}���+T�I��W�ʗ�)y�����\Z[jy���\0	=�֗u�5&���)�K)���D��q;���\rl�*J���u��;\'�hq\\���F��S�\\\'�o&Ӎ��>J�ua+�+��Х�Q����[��F#/�[��&1R�:�yܫn�����\0�����֔��2�Y5���Ċ��Ry�bdC!��0���ᵰ\'`��e)R�l�(Y���Ť�JT?���uO��9��9l�����Th2񒤢F>*Uk]F�-D�A\ZXWc��*��x�\0}��*�z)�Yn������=*@.�1q�\0\0��W�DI�a))X��<��/\\��b��t���#�Um�8�՟H�O���S�]<*��e\n��^TFK��,|��z��z�vz������������J:p[��.X�d�����]��u�7uc����߶��NO��}���\"ĶZ�����|�\0b���\0� ��h$\r�� ��Q�Z��r[i�`�T./٨���އch\'3��p���}VA�BBO��l-ӥ)�T7���s�s��V�;4nw(�c�rlr�9����Qr\\�)\'�j\0\0�H�PN��{.�p�>Wʐ��cyN	Oש&�u�\r}�@�뷬���v:�☜4H���f<h��3(Km���)J@\0|5T��/�(B��å�S�)q�P:�{�%Xӑ�K�P;IU�#Z�,�1�<F4��۬�ۅ�B� ��Q���Q�x~��o8zN[��s<�%3cX�J�����ʵa�dŤ�����.��~u���_\nu��\0y�Rl�x�w�������5���4��ܝ�k�\r+�Ovt2߶<�n�5�n��F�һ�����\0���\0ߊ�U��<��A�Cw�b�ڀ�M&��y�E=��Gb>Ͻ탵m3\rj���$�\"��U?��6h]�d�x/����C�\'>�\'s�q�2�d��P}A�\0����L����qp�g�||zq���/\"�L�B�R~!@�e�j�w�,f+����RZT.�UY\n<Lv��eIM�{E�j�з@��M�G/b;}�T4��\rlz^ʨv\'���e +��:\n��?lD����o�kU\Z��ۂ�V�j/�Jv�gr��X\0M���M�A[9�\"O��/ZqPN[�9�\0�<99J�^�-+~Qğ̯����Ux�]ޞ\\���v[|V����tP4�/� (�4��&��l�df��UQ��:�*��\0R����uQ���\Z�����n[@R���j����s�چ�Va1��;9��V��)�\0q6�*��u��%#����&}uhI>:�_X�?(@�E)_�\r�Y���p%L\0=WFА��e�B	%1�28\\�+3�����,�gb&6l[z2í,�) �\n	�����ܜW����rq\n@c�@K�� ��g�����w��Uk��\r6$*PX,�4\0Q�@��	Ag�A$�;�#���͌�Q�KD|b�Bd�!���m�4�(\r�PMs=ʓTΧ�^,Ё�t9wtIk���f(�[�&�԰DAɣ��4=+&E��^y|�>H�-i;3]uG;9�[�������7\'��Ĭ[N����O8�|�Z\n7�=���]k;S�r;�U�̘�[<�3��wk�Ǔ/.�9پK[�O�1\'�K��R��\r ����n+_*U��dUl�r���lq�G=2l`ӑ\Zu��2��)��a�]�oo�&��})]�Z-\'P�6z�/�\\�ܮa�q0yt�G��g�*T��hmIZ^А�v�Z�A:��\\ҩZ7�z�1�$�7#+�Na��=�E٘IItGe��d����i^�6�-k\n�S�גzyD�1��;7x���4�t�J�-N�����J�X+R�I��&�l|u� u7�����|=\"\'�|$��<h�/�{��ڤ�v[k6m���[P)6�-ȸ�5lJ���(�?�NE�w�D�h��\'����95�c�eIz���Rצ@��&���ekzO�1��er�ɑ�9?��X��C\Zd��Zg����q[��v�6��GJE��&�ZǑ���\0F�+�\0s��[�7\0bI(oj�V��� ��,m}+7�r���~f�iܼ��9�j��ld��iK�h�	+h%�Woz��J[��\r*�H�峉�3������B�q��KL��2�ұ��PHm\"�_�WQR.��?����3�33���聍�i�toqN���6��ځ{�E�;Jcku?������1����r�K��p+�\\i�iM����j�k_��UWh�\rSiѢ�{1�V3�]�O���͎�JN,)��1�a�4��t>��Vnu�u�s�O\'/�{ϭG�|�����p`b�D�⡵��c�D|v>:BZa��� \r,\0�v�#�;;9n[\r\'�����\0,��\0w�\0`�u���\0��j��%��b��r+�U�P�@�WC��N�V����[��i��3�<ygc��6��Łߺ�o�\Z����B����8�ݜ��#$�w|@��T}�؏�uz�+����)���n?�\'̧�y�~��z��ާCc*��х����	�����\Z�Hu�{�6�>dվe-ݳ�cx�v��E���qL&<1�y؛�7(�I�Z����J�h�?�輶��V>\"zs�7��`�_���>�o���׾=�8��Ym�֟̅�\"B� -]MIu b�\0z�A4f0�o-��F:dM��zSM�h�>�����oM�j�Ԏ}/t���G=��7���{c�d�s��;*ˏ�e�%���[�*J��B�}��O�����}��_Z����E������<�!K�\0����f���yg�Y��6[<�~���8nI���H�rZ)�Vy5��iw���Ae�*���B��-��Bs>j%��jpڌ�Ha���سm4��h�P��`\Z\n��\"^��ʀR���9!-�!�ؤ:^��NL��n�j� ْ��{�\0���+��X�x��Ry��q��? �[����o���7(J�{m�*����pM\\�k�j��=�<Ү6����Aef��<q�[bM�[�	�7����ٰ/�����K7��نT�c �,�%J[p�U���\"���c��\03��r�a䛥��2b�ŗ�?�P��th�a	�=��M=�4�B�pÐR:�M�PO�u*�\Z�Q��{�/���q9>>��Md��o���?���oơ����	��31���HP#^�im5�?lS��N�B�N�\'�����%���Krï[UYUQ��ͷr��R-�7��4]T�9�.\r�iC��\Z�k|��%ohE&�g�����b���t�O]����;<k������w{J���yǖ�]Z�q���*�Q&��]����͹f�{���W���N�M�\Z�5\'�I&�p���ï�E�dT�m��VvGiR�4����F��KM��l�@l��1�Y�f���D���f��b��\\��?N��P�b�tRf���t�@��SH���o�@q���k��z\0vc�wuB�/r@�\n\0Rr`��\Z�-Ɛ�M$>�*B�KjHm;A#iWN߈�6#FK��y��w�i��q�$-p�e@�V;tV�D��o�d��pܯ��\r���09z�����b+v���zm�M���J�Fv�_�QP���\0R�\'J\0-T\0PI��\\Z� -a%G��5��sj�+�?͒L.\r�}�	��W#\Z�܎�[KȒ�X�\r�[VN�9�k�:}O����I�J�6�/r�t_�W�Ǜ����5�+T0s�W#[�2#F6@���_�޲���9���\'\'����e�̨�RU�iB�q%&�[�WS��;�f4q���W�䰹���Y��K�z8mIyn6�������i�J�d���9tz�1q��o�x����7 �?Z���gg0�{1PTd\ZaK-%\r�J��T��oh������K��.{�����>�p?tOp !e�9\'�\'\'7#!�I��8��$�X>�f�$(�Jc�x�+K��=J��gdf/�yw��%Ks�+ϏF`I��<�l��T�S�S�#:��x��+���#�#����1s��2ca�i(D��H�b����B\0\"�词[,V�c�T�r�\n��94�Nc��㌸�6T�n%�)���T0u���*�f�J]Uj�?�����[�M<;���c=��>9�\0o��7ų.-���m�	N�����[���N�l�\r5�U)�7?ݣ�m쏸<Ü{��\0 �cX�ˇ�6���mԸ՚l�U�۽�=	����J��׎�Ug9�Go�r���&�wU\n�U�LX��ˀ�IP���\r-HXU\\��pkr�$��8�y��h�!Bi�,�R�%��v��t���3&���7�p��O�JaU�D[��*y\'m�\0m�&�v��=��V�ѵ���NE1�Z	nّ�Zb�T5�HIQ%\"�>^�M�K��7pk�\\��`���f1��19���La_B��x�L�O\"�\r��TIA�D�J����j�ɟ���wӊ�g���7�plS8�)�����hnC�\"��Ҕ��\0�!hH+Y:���Һ����x���ܮ�c�F��	R�zu�\0�\\KH.��4�z����\0Q T�7%&�CbO1��KmL��GTF`xo�Me���O2k�G-�G�A���,\n\ZZ�t�#��\'��\0⍴���\0&7�e�3���8����|�9;�-�7c���-�z�6X*�_��yv�К����5.BfN�B�!&��YI7/��$�v�UBd�\Z1�C,2�ZhY��JP�;�N���;9f��Xj\0��Uh�X��	 �V��7a��bH��<Q~c}��Cȑ�V����SL��²(d��y.i�0���(�\0,��iX�m��$�wz�������^O�II)QJ�RtP=A\ZkZrc\nUH\Z��:�R@����N�d\0LD��q�\'�i=�B�u������|�W��Z�V�SanHJ\0�\0iI�D�h�qs׻���n�_8`�b�8�/ؐ�j\Z���ua�U��^���U%o�(Jv�=t׺��[ZЄ؁{u�AX��Q7I6ҪX��� ��I0��/cnʎA~�$�:UyIh0R�^� ���} �t�V��\0~�+[X�4*� ����=EI�&HƦ��>�P�]XD�	Rwx�ڢ+�b�r�/kiU������H������I���)�4�t8��)HR5\r�F��7������\'%W*��Q�I�J<��SUm��fF�����&S)$�4����o���h~�*Y���b[r���ͤ� -/������\0\rS�_���]�����mdbMŸ�w\"LgY#�\0RE�����.��+�3�V*\"Hy+H)KiV�Q\Z\'�Z��\\�s;=�U�N�i����g��!�\\ߢS؄��v��Uhy��w��(�p*�,^�6�*Y�W=,�oe)J���(�����A��)���X��j�u!#��������Pu�$Ub˩Kj��H���δ��6�e��PӾ�\'hܠ;\0IxY%T\0��6yW�)!G��(Na��?�M�����@\Z�q��U��S������c�c6	U������E�ʕ�mU������k��NY��8T���ob��8j����M�O��Շ�����������B����Ű���Dȋ�0�R:�=\rA{�z	\n�\0v�\0,�	 ��v1~�{!�yl�K�������\"ެ��E�`!$�f�.�C�5V�R����m�GI�&�P��OP�vRٮ�\r-�}\\��O�7̸o�P\'3�bD��?�k����T+����|o�d�M9�#Qb:�KFwz��\"֥�h2��y<\r̼whl<;�%ѯ��w9,d��\"D2�n��C�	V�wi�\'S�m�ߍ�^�ycen�ˍ�f��,��D�QP���n�e����aA\0n7 �`@��*V��&V�K8�m�\0tp�_��q���$L�La�*#��!�>�d��s�p$��EV���x���tdu3��������x8�>i\\�<��R�L��	vAV��܄�\0��J��]�N��>���PN���I��Y��~t ��m��(z���y�ht:څ���% ^��[\n��Ϩ�Y�S���=��9nS\r��8H��+J�����z\\�Rҕ<Җ�mF���7�[7\nm�Ƃp�:o��5_\Z{��g�s3\Z��P��-EIm5����J��w���K��5�w��rc�{s��}qϰ� ��i��jZ_�-v[��QtuJ�))���uQ�.���H������o!?��\'��5���m�a��č\r�*�ӭR�z\Z����9�dpoqX�\0]�L�{w-�Tl��q�&��=UIu��97S\"��e��O��r<�6VB5%�Dm�����ִ�)*^��+�|j����nd�hp����o�%�<�%([7�/I�V�{��ޫÕ���[�$�2��\".32�䜌��Jl��u��A\'rBA;}��U�&-�֯��:g����|�g�j2�Ż�s�\"p��F�܉am����\\���pzn-=;��{V-]���[�~6=?�]kQ��ϟqn�k�y ķ�0�Zk����U�;M+.j�_S5u��3������y�W!s��XV��5\"l�I�R{m�h?#\\ܾ���;X}���\0��屈��gS\'5���w��,�_�����+�|�ɻ7W<J(���j�	��*�\"� �P,OeUԎB���ZۭYP���\ZS����`]�8�G�:���\"��X\Z��i�@�6Ӻ�����q*�E��5H��!Զ�/�F���ce��p\r%�U+�ύ�fq�s�,�M}=l��Sp�xܠ��Yk��s�y$Vs1\nm1\0���K�E�$^���\'��ax�ś\n�T�F��AV����k!(E���窎���f	@{�ʢ-s���l:X�R�T䋲Ή\\�A?�ⶆ�	���K����f�h��%;R�-`��]�;������	��!�/�>Q�I��R��~Pt�}-���E$�mqo����?X�\n��x�Q�O����Aś�I���z��������Wm�d�|-B��`�F��U���(J�6*4L���\n�M?H5V�+	��=H���TAnBD�x7F��j �l&��JB���vޡ�yr1�]��iKhml7�㒯.ͷ7����\Z�5���T�R\0�� v~�U�#+a���Q����ln�$(Ɣ�[�B�����Zr�S/y�f*��RBT�թ��G�����j�E�_�V#���>���M�\\�`qN!�[�́W �kk�c��.�U�����ꪻS���0r= �s��-\0R�|\rw58pk��IR�q��-ݯ�ҤD,c-y�7�K��1�����S�uͅ�\0�\n\0ّ>.<8�����n��˗;�������n���A\r��\r������;��.DfG�����-~kxPH�bn���=mS貵��(�o=	�>�zu[k�($N��2&54X�4�)\n�\0p�.H	S�\Zi\"ỏ(��0���K.�h�%!{��M��*\0N}KK�Ml��YDhR�t#��?�q���^��w��\r�wd\'����cyRS����(�6=%[OP7A�J��~�C~�P	�(ڂB��h4��3���p�Q�yd���\\;�W2�i��7��?R֢��j%.�﹏��i�=�cf�#��P�\'��w{pX}@��%�����ؐ*�Vl�UR�D`�?�E�BISh�\Z�5V����c|�na3�&t��X	� \'Q�$�g-~ļ��W��+��4t�\0$8�F�H\Z�I�)�越�>4��p��p����{�M,S�upIpJ��al�ml�.,�F���a�ɢ˕l�\\�#r�x^7ŹV[�>;%1�\"eҋi���.ܕ7�m�����p�3�煣�YnN�q%{e7<�\"�=�nvw��}0�Cs�Xu\r����8�ƀ�֛ƭC3\'�D��\\`��%���1��p�G .�i�QR�jq�!�a��JH@)Rn�iU*�����DV϶2�rL��dq�38������ԶǸH�P�eͅ$�������?rT�h2��S\n�����/2�I��e�0R^�����}@����l��屭\\ei�E��u���F>�I��f8��?!�q�}�AR\0XZ�JEp���k�\0!5����nV\'?Ʊ�)\nKXX���F�CM�v�d\\�[AT�\r�l�Lʬr��6���̨�29F5���Y��	�.z�\\o��M�^�TU*�%ݛi����sO��|r(c��ZJ�2n�r،���j�u[�5KV�Zni�f����ec����F�ˑ%ψ�L��bŴnݵ	��߭U�Q���N{������l�ur1�]p��`M�|�\Z���j�n���[�)٨�~|C���`�,���Y��%+/\0���������KB��N�J,<|=���\'����=��/8ʸ��d]J�[n�J��)JR����}Ev�I�W�^.LV��2U�~[C��s��\0�321�V*/�-�=)��R�On��fS�6ɷ�Sm�ʡ֭��d�оgŎ�\'����s�+���E�R Ȕ��y�޷*Q�Ƹ�����r�-	�\r�j;m�F�N�|(U|�٘M�\0,*�gv7S �P\r�U�Am!�\'�\ZmJA&�GN��SE6BmckhO��\n�&Д\0�M�]jH�\Z%�(z�\0uW��wԸ\0��nK%<��jm֨�Tj�.]D؊[4Tf�)7$� ��4Q�<�eM+��l|EVGА}��-m�0o+s�&:I�SeWg۲i�p�dNd�eu��B�X�`�U�\'�IQ������u�%н�ը�6݄̍����I�Q\0��J��քPİrs$,���\"��ڲ��k�t$ll��q��)�CL��Z����u�����!�.�����d!R�/pt֖�ڡ�*ym$�\\�u��)V��Y��@\n����ȿi���S�oz�b���yiY󞣲���Q]���]1m\nM�,,@�ƮU�a��aa׾��^ ���Q;�{;�S!�)J��u2�I������\"Mw[I��m��\\d����\0mU�Z	O�E�&��ޖ�ua�&7���k�5F�r$��E����]F+��X�J�hmz[CU�\'�{��b�u��,�7gq���O�èSo�CE!b�7\ZTDj�m=\ns�&��1�n��`�ң5�K�*h��(Z�����ި�Y��#CQ���eZm=�n�!\0�\r�%:�^�\0\"ӎ!֙{��8\nP�\0����z�`\'�0�\"K��K���x~{�����@��/2��l-�rߨ��펗$)G�\n�5߉�ȝ��+��*@���G�@����Ƈ)W��2�%�GzV���A��ʶ�c��[�ZKO��J�`\n�@�v2{F���C��������;��J���Mu2���[eQ��I�h�v?�A��\07�\\bW��T�����R�?}���Ha�ۡE\nK��z�b��&�]i(�i+����_��gy���Dj\nb(>���=�G�~��OrZ?�	qU����G�x��p:z�%��RA;ʂB��A(�_r\\g��֚QB�-� $�ɑ���|�\r�V�1~���(l��dY��[��׶�&��	\\��ߴ�z�l5ϱ�����H�X��{�nt�K,��׵*����(ѣ\r��N�����R7�������h=A��齴�m��P.Z�Q!	+A�����K)&�+/��B�7W��\\�vڲ�qf�V�(��\0ǿ����p0P�y�d#�#OPٷ�������o�\Z^������eq�s=��X��9�[c(#��U�v�q�J��Jt!B֭�s�k����Q�k�����x�-і��-X!!.��+e�8��\n[^�lI�+��D�����^S�I�������+��>V�^��D�)A��M���Z�U�\rJ/[C$����g��X^��IO?�ù��16ˈ%q�\0S�Zv�z�,܅\r+3���rt�i��V?�5��}��D�r��� ��*6A��3yZ�̢�F��\0\Z~v���+l��Lo�_j�<���g��K%�p�T�9H�i��<} ��8�}�a\n�n6���U&�\0���I�qr�����	�Kec��4XmqYG�\nR��U��M��._���̫䊲|\'�+\"c���}�	T�D�����ձ%.m;R\nT���QTx�0lǕ�B�/��B��7����Q���IC�F�	޷�BH\r�m����P�|K�\0��R�-���b\Zɧ/\'�^�Kx���[�\r�(�O�p!$��@i{\n��5d�����<�.�2�i���/�u�@-%��QJ�U�Ԛ��i�V7q0�\\�\'2֧���Ze��PTGD��M�n�TGe�����<lx�sM<�~w��G�J��rf�irYLf)���jmT���i����jJI�-qkX��/�K\n\0�|[K(�\0�J@�^�kD�H��\'M�oj�\'�4�I6I\n�ץD���D��BOu�R��,���*�m���P�z����S�u\Z�bi6C�a�6.����J���Y8����\n�5U�|?.x�/���fp1#��pڵu2p���/���߼�%j�n��6������2Նk�W(�\Z\n���RU��(HӠ��MQ���mA��E�q����-D��)5Ԋ#<K�_U���IҲ�sJZv\'ʄ�\\����m\\zCr�H���ۥ=�{� A���0Cj{�ʱ�G_��\"7�Lؕ�}��\rg�4������,��pl\r��9c�qB�!����{镹GQ�*�u�Jml&���ͥ\'��51-\n�ɱЏ1�_��&)�i2M�sn�T�D�	�c����\ZL���u*S\"C�i������@R\\�}�t7=�)�d�_[��J$�Q�T��z�H��\0��i�Ɩ�t�G~:IQ)��ٯ�VU��@�uXm�h�:��[��t=4�֫��3M�PH*Z.v����qrq�;�Tl�\Z\r��x�ҡ�/�&#�������q��g�+�TS�\0L\"KJ�4�ZO�O�\rtNq����(�u�T���_�knڐfҽ6Ԡ�\r(*3�?�M\0�u���Z�J):�i���/�̔zFBw�9�cq����$�$\0M��S?Z���	W�Ci��Zj\r\0�ϖ<�R��RU�+��#^���Y:*�̐\r�,�t��qҀC�_�~�k���B�GJ\0F��q��P�\\7�U�lڏ���D��+�s����2�M��Ԟ�|(*ѳ�M�J]��~d(ɷurM�%�%���|���:��@p�\0�/�ʅ�=��jd�\"�H)�|q�t��c�JA��Z����&������\0�ײ�9+�\0��\0}�p8��<.z3���E�Ǹ���9\nD� F|�D-�Uꔓp�&�QU��K����Rj�!��ww��5T��,����\0�P5�u���p~uR��گ�_�׶8���x���M�z8Hi���E*�޸��_n�\0t�_�`�p^���)�gEٺ��	��\n�*���a~�+�J2	�H�I4a������E͡%/q�ŗ�m}	Gm��iO�[��$>>��ƓY(��U���k������}��mҤ��6�@7U�E[����=������qS7f\\GéWO+� �;�زd�þ�}�����Fs�yd�Bq�$�9!@:{viК�U[s_w��=7\r3�x�y4�6�|{����;-S�(Ie�Sz��� �\'E$\Z�������2��yI��1x�Y�A�~TeF�R� F�K�,�����t��\0k���v����\0��187�?Ɩ���̆<�$��HBVҤ���7�Sao\n�L}1%��WC�S*���%�2r�9&\\���-���P\n$Z�\0Ӻ��ٍF��Yl�IDHx�c�(�|E*�َ|6\n��k�l)\r�i�n~۸p����ktx$zB�U�H��-{hv;��Dx���4@\0v��c���H	������fM�����P�5���@u�T�AK	��wƠ���NO\0(v�ʎP]PL ?����eh\'��ǧmC��މ�$�u\'�G\"����^�pj��x�U��\\w�b3��p���iWeb4�hnOM\r.�mXΜ���u�Y\Zh��0�Bݗ�k�ȣ1�{vJ�$���ʽ\\95V���Y��g,���R۽��,mzN�NH��<2?��5��0��\0h*�I*C\\�l���������)v-]Fq�A��\ZM�Di\0z��\0�@�쬶�Ƅ�%|_�M���[ƛT\"�wG�\0�`�V�g`�V�tU���,��EwJ��\'�iLj#��\',w*��Vk�hS�s29$����4I}�N��?*Un\r3N�~���)�~�o�m$_�uZ�mR�r�a�*dYێʭlRՂO�f<��;Mh������2IZ���E9XS����������IH�q:�nU�_\n�)��L�(\0؞�b��b�o�Cz@�|���@4�K@py$�i�� s]zu\'Nڀ��l=OS�H\Zn6\n��t�j ��0	H���j���5]h\0�-��D�	)��@�CD����p�H��0���s/c�8���[�s��5���Ś�G?�Y�~�%�\"�C��$�_�>5�[�6p����jH\0P5\Zxk�v��N�P�������\r���_�\'@�;��F��c!���\0��Z9�\'�Ơq��\\���D�)*I���5 	a��\0N�@v2�.����G�\0�}�%���F�>u\n���h\0��i7@H�#�k�I�n�\\��RU��n;�3;\"Ϫ�ڠn�:�^�� �0_SV%+��V;V���(D\n&H���*R��$�^���D����{���\0�S7�����Nl\r�S�bM��	m�(�\n�C>��Z��t<��$ �+m@)I�I�H�w�5{	�W>�>*9���%����x�ğ̖�.(v�C&�Y�-ܷ*�d9&����3Rݝ���p�����ǞZ�*Z���\0�J�\Zjn�;{���F��\n�CPh��g�O�$tNફC�+*ֻ���j`������gx�\'��D���>������b�9�h\nѽ1�X���VV�Ӄ\'v�����\0	�ƹ�#�$��)M��RD���TÅcM��U�N���\0���0D\\�g#8�j�Jnگ�\Z^�w�M��F�\'Gz,�d�Z�je��m�A)P�k�Qʟ���\'�	4�f5$$y�z����,b2RV�3en���t*\'@:���,� ���t<rg/\"ԧc���&��͒wHU����z�K+ ��n\0neo(�<�:�:x�b�$φ�7��f���头�Aa��nE=A&B�U�U�ݬuݛ)����#�/�O(G�p��E�����BE�\0���\0m&��^�������2W�ٽ�U��qn�:R�s��Ⱚ����\0���H\"��h��\0祾�?�������?��}�R7q�:�m��t�\0�I}�o��غ��{9�xVQ�Ţ#�WKo6���{�Vz2�i�:�YmiX)�u/��ئ2�\'�(ˡUq���ec(�`�p6�Ts�uFi�\"���z\r��U]�uFi.z,tWx�M�U�Tf�����\0���9\rU�=�,�����2�n2�d�JUЊ�]��AĂF�t(]�<�\0�	�2�k�j�����f�� ���F���*��5�CE�������\ZM�����h\0�\0\r��3n&EYF�Z��Ҡ�VI~�gCRf��]���*7�쮷C/����f������ma�5%RQ�rmk�ֹ&�*i;W`\r.�+o�S�.Y��li���z�B�,7���q�f��A+���/�_\ZuL�,��}4����Ǿ�_��Yd6&X������ʨƢ:̆��걱��\0v���)%\\��yi�Y�uX�o��YT���O�Ϝ�eE�m��֬�\\|�%\r\0�_�NmIר�����0^U����I���Ǹ��nm�k�V�nD�Cw�K�s\'d�u��MdU�� 9?i�A#��?y�VD�+\n���Q��r:^��U�XeO�]�����Iv�Y:Xޥpu����p+ۢE���P\\5%V�?��*�X Un�����]����U���&�\Z� ʷ\\ۭ��\0UT�<�JF�m�B�*�7w��������\0�Op��LD�0��HZV���r�̀���唛���QZ�ԟ��v������o6N���+�#�a�z	�I,��}@�v�X\\)=Jh]��_�o�\0j&���^�2Gwe\0�ڦ�Wd<Kh�r�\\w�N�|}�Db4p+�;� ˛FNw��m@z��+��t��y�<C�ݍ��DZ�4\'I�\0�n\n �uܓ�{�\r\0�J���G:��4��/���:�6\'��x��\09\0���0\'��P�6c)WJ���\0P��H�ͦ��:wԒ&8�!���wW��m�>k�{\0}U����~�=�_������?�[2i�dDa8�j--{K��%)*��o�):P�E[�\0�Wԟ�|&�D��rV�S��� m��Z�̗��X�\Z�l;T��@�m�1��>{����\Z��F��I��uQ�G��6*āo��(e�`�\'�q��!�D��Eq��$)SC�,$Xj�sӭ.�\Z�Y��N\')/\r����+���2Xոۥ�Ԁ]o{JZ�wJ�=��6IY�E��E7!�*����j�Gi�%���fp�����Iev>�)Y��\0�\r&��i�\'}�oǸ<��,�N����ziR2�K͍�7�n�n5�G�vx�#��U���\"���R�HZ�H�\0��$|@�f!��RS�a	�!������Ce�\0��B���}B��v[[�kU�$��vQq����[jq�R=7��*�hIE��\'��[�(�Is��\0mq�ܐ`; �}�|)ƣ璭��},y[id���It�ڸ����~ρ�����\0�^�NW�I!v����YM5�\'I(MBM�;*t���+_�(���Oϲ�%�\n(F+�\0����Q����x��:\0�?�B�e��F7[>�{��U���\\�\0<\\�	\n��EK����?�N����PL���:�HG�i�ꏤ�`�:�����;U���\'cT�����I����aN�=<pO�@V�6���\"���VB!lx+�Co�*R%(����vߧ�RXϘ����9z{B����d�K$9���k�n��}1	p;�)ݢ�;{E�6�k���p��)`n�n��IT5\'��T7[��ni���p7�`+N�mk;7b\"|��*��Q3��\"�*�q̩��7%$�?1���堮���]\\NŐ\nӦ��i^��&�:5ql	�(���');
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
