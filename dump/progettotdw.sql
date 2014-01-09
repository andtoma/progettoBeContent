-- phpMyAdmin SQL Dump
-- version 4.0.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: Gen 01, 2014 alle 18:19
-- Versione del server: 5.5.33
-- Versione PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `progettotdw`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `admin_actions`
--

CREATE TABLE `admin_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `action` enum('add','edit','delete') NOT NULL,
  `involved_table` varchar(45) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_idx` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=338 ;

--
-- Dump dei dati per la tabella `admin_actions`
--

INSERT INTO `admin_actions` (`id`, `username`, `action`, `involved_table`, `datetime`) VALUES
(303, 'admin', 'add', 'items', '2013-12-30 12:28:43'),
(304, 'admin', 'edit', 'items', '2013-12-30 12:28:48'),
(305, 'admin', 'delete', 'items', '2013-12-30 12:28:51'),
(306, 'admin', 'add', 'furnishers', '2013-12-30 12:29:00'),
(307, 'admin', 'edit', 'furnishers', '2013-12-30 12:29:04'),
(308, 'admin', 'delete', 'furnishers', '2013-12-30 12:29:07'),
(309, 'admin', 'add', 'availability', '2013-12-30 12:29:20'),
(310, 'admin', 'add', 'users', '2013-12-30 12:29:39'),
(311, 'admin', 'edit', 'users', '2013-12-30 12:29:43'),
(312, 'admin', 'delete', 'users', '2013-12-30 12:29:46'),
(313, 'admin', 'add', 'ban', '2013-12-30 12:29:54'),
(314, 'admin', 'delete', 'ban', '2013-12-30 12:29:56'),
(315, 'admin', 'add', 'slideshow', '2013-12-30 12:30:08'),
(316, 'admin', 'edit', 'slideshow', '2013-12-30 12:30:13'),
(317, 'admin', 'delete', 'slideshow', '2013-12-30 12:30:15'),
(318, 'admin', 'add', 'items_images', '2013-12-30 12:30:26'),
(319, 'admin', 'add', 'slideshow', '2013-12-30 12:41:59'),
(320, 'admin', 'add', 'slideshow', '2013-12-30 12:50:23'),
(321, 'admin', 'delete', 'slideshow', '2013-12-30 12:50:27'),
(322, 'admin', 'add', 'items_images', '2013-12-30 12:52:03'),
(323, 'admin', 'delete', 'items_images', '2013-12-30 12:52:19'),
(324, 'admin', 'add', 'items_images', '2013-12-30 12:53:10'),
(325, 'admin', 'delete', 'items_images', '2013-12-30 12:53:15'),
(326, 'admin', 'add', 'items_images', '2013-12-30 12:56:20'),
(327, 'admin', 'delete', 'items_images', '2013-12-30 12:56:26'),
(328, 'admin', 'add', 'items_images', '2013-12-30 12:56:43'),
(329, 'admin', 'add', 'items_images', '2013-12-30 13:02:59'),
(330, 'admin', 'add', 'menu', '2013-12-30 13:19:50'),
(331, 'admin', 'edit', 'menu', '2013-12-30 13:19:59'),
(332, 'admin', 'delete', 'menu', '2013-12-30 13:20:01'),
(333, 'admin', 'add', 'newsletter', '2013-12-30 16:18:57'),
(334, 'admin', 'edit', 'newsletter', '2013-12-30 16:19:01'),
(335, 'admin', 'delete', 'newsletter', '2013-12-30 16:19:50'),
(336, 'admin', 'edit', 'furnishers', '2013-12-30 17:36:14'),
(337, 'admin', 'add', 'availability', '2013-12-30 18:29:31');

-- --------------------------------------------------------

--
-- Struttura della tabella `admin_events`
--

CREATE TABLE `admin_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `allDay` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=53 ;

--
-- Dump dei dati per la tabella `admin_events`
--

INSERT INTO `admin_events` (`id`, `title`, `start`, `end`, `allDay`) VALUES
(48, 'new arrivals, update availability', '2013-12-31 00:00:00', '2013-12-31 00:00:00', 'false'),
(49, 'server maintenaince', '2013-12-27 00:00:00', '2013-12-28 00:00:00', 'false'),
(51, 'grattarsi le palle', '2013-12-17 00:00:00', '2013-12-17 00:00:00', 'false');

-- --------------------------------------------------------

--
-- Struttura della tabella `availability`
--

CREATE TABLE `availability` (
  `item` int(11) NOT NULL,
  `size` varchar(10) NOT NULL,
  `n_item` int(11) NOT NULL,
  `colour` varchar(15) NOT NULL,
  PRIMARY KEY (`item`,`size`,`colour`),
  KEY `availability_ibfk_2` (`size`),
  KEY `availability_ibfk_2_idx` (`colour`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `availability`
--

INSERT INTO `availability` (`item`, `size`, `n_item`, `colour`) VALUES
(2, '36', 11, 'Black'),
(3, '38', 99, 'Black'),
(3, '38', 3, 'Blue'),
(3, '40', 3, 'Blue');

-- --------------------------------------------------------

--
-- Struttura della tabella `ban`
--

CREATE TABLE `ban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(45) NOT NULL,
  `expiration` date NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `a_idx` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `ban`
--

INSERT INTO `ban` (`id`, `reason`, `expiration`, `user`) VALUES
(2, 'cagna', '2013-12-30', 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(45) NOT NULL,
  `brand_pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Dump dei dati per la tabella `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_pic`) VALUES
(1, 'Armani Exchange', NULL),
(2, 'Miu Miu', NULL),
(3, 'Gucci', NULL),
(4, 'Givenchy', NULL),
(5, 'Versace', NULL),
(6, 'Burberry', NULL),
(7, 'Dolce and Gabbana', NULL),
(8, 'Chanel', NULL),
(9, 'Armani Exchange', NULL),
(10, 'Miu Miu', NULL),
(11, 'Gucci', NULL),
(12, 'Givenchy', NULL),
(13, 'Versace', NULL),
(14, 'Burberry', NULL),
(15, 'Dolce and Gabbana', NULL),
(16, 'Chanel', NULL),
(17, 'Armani Exchange', NULL),
(18, 'Miu Miu', NULL),
(19, 'Gucci', NULL),
(20, 'Givenchy', NULL),
(21, 'Versace', NULL),
(22, 'Burberry', NULL),
(23, 'Dolce and Gabbana', NULL),
(24, 'Chanel', NULL),
(25, 'Calvin Klein', NULL),
(26, 'Hugo Boss', NULL),
(27, 'Max Mara', NULL),
(28, 'Bisou Bisou', NULL),
(29, 'Marc Jacobs', NULL),
(30, 'Moschino', NULL),
(31, 'Ralph Lauren', NULL),
(32, 'Roberto Cavalli', NULL),
(33, 'McQ by Alexander McQueen', NULL),
(34, 'Valentino', NULL),
(35, 'Vera Wang', NULL),
(36, 'Miss Sixty', NULL),
(37, 'Oscar de la Renta', NULL),
(38, 'Juicy Couture', NULL),
(39, 'Elie Saab', NULL),
(40, 'Yves St. Laurent', NULL),
(41, 'Tommy Hilfiger', NULL),
(42, 'Guess', NULL),
(43, 'Dior', NULL),
(44, 'Hermes', NULL),
(45, 'Anna Sui', NULL),
(46, 'Blumarine', NULL),
(47, 'Bottega Veneta', NULL),
(48, 'Chloe', NULL),
(49, 'Christian Lacroix', NULL),
(50, 'Lanvin Paris', NULL),
(51, 'Max Azria', NULL),
(52, 'Salvatore Feragamo', NULL),
(53, 'Stella McCartney', NULL),
(54, 'Emilio Pucci', NULL),
(55, 'Vivienne Westwood', NULL),
(56, 'Nina Ricci', NULL),
(57, 'Marios Schwab', NULL),
(58, 'Fendi', NULL),
(59, 'Carolina Herrera', NULL),
(60, 'Emanuel Ungaro', NULL),
(61, 'Prada', NULL),
(62, 'Chloe', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `cart`
--

CREATE TABLE `cart` (
  `user` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `quantity` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user`,`item`),
  KEY `cart_ibfk_2` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `cart`
--

INSERT INTO `cart` (`user`, `item`, `quantity`) VALUES
(5, 2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `categories`
--

INSERT INTO `categories` (`id`, `cat_name`) VALUES
(1, 'Shirts & sweaters'),
(2, 't-shirts'),
(3, 'Trousers & shorts'),
(4, 'jeans'),
(5, 'skirts'),
(6, 'accessories');

-- --------------------------------------------------------

--
-- Struttura della tabella `colours`
--

CREATE TABLE `colours` (
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `colours`
--

INSERT INTO `colours` (`name`) VALUES
('Black'),
('Blue'),
('Brown'),
('Green'),
('Grey '),
('Orange'),
('Pink'),
('Purple'),
('Red'),
('White'),
('Yellow');

-- --------------------------------------------------------

--
-- Struttura della tabella `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `text` varchar(200) NOT NULL,
  `datetime` varchar(30) NOT NULL,
  `post` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_ibfk_1` (`post`),
  KEY `comments_ibfk_2_idx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `furnishers`
--

CREATE TABLE `furnishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `vat_no` varchar(45) NOT NULL,
  `phone1` varchar(45) NOT NULL,
  `phone2` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vat_NO_UNIQUE` (`vat_no`),
  UNIQUE KEY `id_furnisher_UNIQUE` (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone1`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `furnishers`
--

INSERT INTO `furnishers` (`id`, `name`, `vat_no`, `phone1`, `phone2`, `email`) VALUES
(2, 'bestbrand srl', '07271836612', '08529291031111', '56363645456', 'bestbrand@email.it'),
(3, 'justshirt srl', '021818231237', '0862371972', '', 'justshirt@libero.it');

-- --------------------------------------------------------

--
-- Struttura della tabella `groups`
--

CREATE TABLE `groups` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'superuser'),
(3, 'user');

-- --------------------------------------------------------

--
-- Struttura della tabella `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) NOT NULL,
  `brand` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `discount` float DEFAULT '0',
  `furnisher` int(11) DEFAULT NULL,
  `sex` enum('M','F') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_ibfk_1` (`furnisher`),
  KEY `item_ibfk_1_idx` (`brand`),
  KEY `items_ibfk_3_idx` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dump dei dati per la tabella `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `brand`, `category`, `price`, `discount`, `furnisher`, `sex`) VALUES
(1, 'Prodotto 1', ' stocazzo', 1, 1, 32, 13, 2, 'F'),
(2, 'Prodotto 2', ' stocazzo', 3, 2, 67, 5, 3, 'F'),
(3, 'Prodotto 3', 'fa cagare', 3, 3, 12.89, 7, 3, 'M'),
(4, 'Prodotto 4', 'fa cagare', 9, 3, 76, NULL, 2, 'M'),
(5, 'Prodotto 5', 'fa cagare', 10, 4, 47, NULL, 3, 'F'),
(6, 'Prodotto 6', 'fa cagare', 13, 5, 80, NULL, 2, 'F'),
(7, 'Prodotto 7', 'fa cagare', 15, 6, 110, 15, 3, 'M'),
(8, 'Prodotto 8', 'fa cagare', 18, 6, 15, NULL, 2, 'M');

-- --------------------------------------------------------

--
-- Struttura della tabella `items_images`
--

CREATE TABLE `items_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `colour` varchar(15) NOT NULL,
  `item` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`item`),
  KEY `items_images_fk2_idx` (`colour`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dump dei dati per la tabella `items_images`
--

INSERT INTO `items_images` (`id`, `path`, `colour`, `item`) VALUES
(17, 'skins/BeClothing/img/photos/prova.jpg', 'Black', 3),
(19, 'skins/BeClothing/img/photos/prova.jpg', 'Brown', 2),
(23, 'skins/BeClothing/img/photos/prova.jpg', 'Black', 1),
(24, 'skins/BeClothing/img/photos/prova.jpg', 'Blue', 4),
(25, 'skins/BeClothing/img/photos/prova.jpg', 'Blue', 5),
(26, 'skins/BeClothing/img/photos/prova.jpg', 'Blue', 6),
(27, 'skins/BeClothing/img/photos/prova.jpg', 'Blue', 7),
(28, 'skins/BeClothing/img/photos/prova.jpg', 'Blue', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_idx` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dump dei dati per la tabella `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`, `parent_id`, `position`) VALUES
(0, 'ROOT', '', NULL, -1),
(1, 'Home', 'index.php', 0, 1),
(2, 'Women', 'items.php?sex=F', 0, 2),
(3, 'Men', 'items.php?sex=M', 0, 3),
(4, 'Blog', 'blog.php', 0, 4),
(5, 'Contact Us', 'contactus.php', 0, 5),
(6, 'My Account', 'account.php', 0, 6),
(7, 'Shirts & Sweaters', 'items.php?sex=M&cat=1', 3, 1),
(8, 'T-Shirts', 'items.php?sex=M&cat=2', 3, 2),
(9, 'Trousers & Shorts', 'items.php?sex=M&cat=3', 3, 3),
(10, 'jeans', 'items.php?sex=M&cat=4', 3, 4),
(11, 'accessories', 'items.php?sex=M&cat=5', 3, 5),
(12, 'Shirts & Sweaters', 'items.php?sex=F&cat=1', 2, 1),
(13, 'T-Shirts', 'items.php?sex=F&cat=2', 2, 2),
(14, 'Trousers & Shorts', 'items.php?sex=F&cat=3', 2, 3),
(15, 'jeans', 'items.php?sex=F&cat=4', 2, 4),
(16, 'skirts', 'items.php?sex=F&cat=5', 2, 5),
(17, 'accessories', 'items.php?sex=F&cat=6', 2, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `text` varchar(5000) NOT NULL,
  `datetime` varchar(30) NOT NULL,
  `picture` longblob,
  PRIMARY KEY (`id`),
  KEY `posts_ibfk_1_idx` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dump dei dati per la tabella `posts`
--

INSERT INTO `posts` (`id`, `username`, `title`, `text`, `datetime`, `picture`) VALUES
(7, 'admin', 'ciao', 'ma che bel castello marcondirondirondello	', 'December 29, 2013, 3:51 pm', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `purchase`
--

CREATE TABLE `purchase` (
  `id` varchar(20) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `item_price` float NOT NULL,
  `country` varchar(45) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zip_code` smallint(6) NOT NULL,
  `address` varchar(45) NOT NULL,
  `quantity` smallint(6) NOT NULL DEFAULT '1',
  `datetime` datetime NOT NULL,
  `status` enum('processing','shipped') NOT NULL DEFAULT 'processing',
  PRIMARY KEY (`id`),
  KEY `purchase_ibfk_1` (`user`),
  KEY `purchase_ibfk_2` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `purchase`
--

INSERT INTO `purchase` (`id`, `user`, `item`, `item_price`, `country`, `state`, `city`, `zip_code`, `address`, `quantity`, `datetime`, `status`) VALUES
('1', 5, 2, 12, 'italy', 'lazio', 'rome', 12345, 'via romi 28', 3, '2015-12-12 13:11:00', 'processing'),
('2', 5, 1, 12, 'usa', 'new york', 'new york', 12345, 'via dei tulipani 19', 1, '2015-12-12 13:11:00', 'shipped'),
('3', 5, 8, 11, 'italy', '', 'roma', 22001, 'via rossini 11', 2, '2014-11-11 11:12:12', 'shipped'),
('4', 5, 4, 11, 'italy', '', 'roma', 22001, 'via rossini 11', 4, '2014-11-11 11:12:12', 'shipped'),
('5', 5, 6, 11, 'italy', '', 'roma', 22001, 'via rossini 11', 2, '2014-11-11 11:12:12', 'shipped'),
('6', 4, 6, 11, 'italy', '', 'roma', 22001, 'via rossini 11', 1, '2014-11-11 11:12:12', 'shipped');

-- --------------------------------------------------------

--
-- Struttura della tabella `services`
--

CREATE TABLE `services` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dump dei dati per la tabella `services`
--

INSERT INTO `services` (`id`, `name`) VALUES
(1, 'product_review'),
(2, 'create_post'),
(3, 'edit_post'),
(4, 'delete_post'),
(5, 'create_comment'),
(6, 'edit_comment'),
(7, 'delete_comment'),
(8, 'control_panel_access');

-- --------------------------------------------------------

--
-- Struttura della tabella `services_groups`
--

CREATE TABLE `services_groups` (
  `grp` smallint(6) NOT NULL,
  `service` smallint(6) NOT NULL,
  PRIMARY KEY (`grp`,`service`),
  KEY `services_groups_ibfk_2` (`service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `services_groups`
--

INSERT INTO `services_groups` (`grp`, `service`) VALUES
(2, 1),
(3, 1),
(3, 2),
(3, 3),
(2, 4),
(3, 5),
(2, 6),
(1, 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `site_infos`
--

CREATE TABLE `site_infos` (
  `info_type` varchar(10) NOT NULL,
  `info_text` varchar(30) NOT NULL,
  PRIMARY KEY (`info_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `site_infos`
--

INSERT INTO `site_infos` (`info_type`, `info_text`) VALUES
('address', 'via vetoio 12 AQ'),
('email', 'info@beClothing.com'),
('phone', '08621234599');

-- --------------------------------------------------------

--
-- Struttura della tabella `size_chart`
--

CREATE TABLE `size_chart` (
  `size` varchar(10) NOT NULL,
  PRIMARY KEY (`size`),
  UNIQUE KEY `sizecol_UNIQUE` (`size`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `size_chart`
--

INSERT INTO `size_chart` (`size`) VALUES
('36'),
('38'),
('40'),
('42'),
('44'),
('46'),
('48'),
('50'),
('52'),
('54'),
('56'),
('L'),
('M'),
('one size'),
('S'),
('XL'),
('XS');

-- --------------------------------------------------------

--
-- Struttura della tabella `slideshow`
--

CREATE TABLE `slideshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dump dei dati per la tabella `slideshow`
--

INSERT INTO `slideshow` (`id`, `path`, `title`, `description`) VALUES
(1, 'skins/BeClothing/img/slideshow/1.jpg', 'TITOLO 1', 'DESCRIZIONE 1'),
(2, 'skins/BeClothing/img/slideshow/2.jpg', 'TITOLO 2', 'DESCRIZIONE 2'),
(3, 'skins/BeClothing/img/slideshow/3.jpg', 'TITOLO 3', 'DESCRIZIONE 3');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `birth_date`, `sex`, `email`, `password`, `country`, `state`, `city`, `zip_code`, `address`, `phone`, `username`) VALUES
(4, 'giulia', 'rossi', '1963-07-10', 'F', 'giulia.rossi@libero.com', '36adb5dfb6f8bf6fcaa5cd87a04a581f', 'IT', 'teramo', 'alba adriatica', '64020', 'via mazzini 18', '08617544632', 'giulia'),
(5, 'admin', 'admin', '1991-08-12', 'M', 'a@a.a', '21232f297a57a5a743894a0e4a801fc3', 'US', 'abruzzo', 'alba adriatica', '64020', 'via mazzini 18', '2314892173198', 'admin'),
(15, 'oronzo', 'lostronzo', '2013-12-06', 'M', 'sffs@it.it', '36eba1e1e343279857ea7f69a597324e', NULL, NULL, NULL, NULL, NULL, NULL, 'oronzo'),
(32, 'marcello', 'di franco', '2013-12-06', 'M', 'franco@ffff.it', '374fdbaf20024a41e42c2e7f79f3e38c', NULL, NULL, NULL, NULL, NULL, NULL, 'franchino'),
(34, 'giovanni', 'di battista', '0005-03-31', 'M', 'giovannibatt@gmail.com', '1365ffade9f5af7deaa2856389c966f4', NULL, NULL, NULL, NULL, NULL, NULL, 'giova');

-- --------------------------------------------------------

--
-- Struttura della tabella `users_groups`
--

CREATE TABLE `users_groups` (
  `user` int(11) NOT NULL,
  `grp` smallint(6) NOT NULL,
  PRIMARY KEY (`user`,`grp`),
  KEY `_groups_ibfk_1` (`grp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `users_groups`
--

INSERT INTO `users_groups` (`user`, `grp`) VALUES
(5, 1),
(15, 1),
(4, 2),
(5, 2),
(15, 2),
(4, 3),
(5, 3),
(15, 3),
(32, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `wishlist`
--

CREATE TABLE `wishlist` (
  `user` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  PRIMARY KEY (`user`,`item`),
  KEY `wishlist_ibfk_2` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `wishlist`
--

INSERT INTO `wishlist` (`user`, `item`) VALUES
(5, 2);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `admin_actions`
--
ALTER TABLE `admin_actions`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `availability`
--
ALTER TABLE `availability`
  ADD CONSTRAINT `availability_ibfk_3` FOREIGN KEY (`colour`) REFERENCES `colours` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `availability_ibfk_1` FOREIGN KEY (`item`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `availability_ibfk_2` FOREIGN KEY (`size`) REFERENCES `size_chart` (`size`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `ban`
--
ALTER TABLE `ban`
  ADD CONSTRAINT `ban_fk1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`item`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_fk1` FOREIGN KEY (`post`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_fk2` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_fk1` FOREIGN KEY (`brand`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `items_fk2` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `items_fk3` FOREIGN KEY (`furnisher`) REFERENCES `furnishers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `items_images`
--
ALTER TABLE `items_images`
  ADD CONSTRAINT `items_images_fk2` FOREIGN KEY (`colour`) REFERENCES `colours` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `items_images_fk1` FOREIGN KEY (`item`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `sadoaspdk` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_fk1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_fk1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_fk2` FOREIGN KEY (`item`) REFERENCES `items` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `services_groups`
--
ALTER TABLE `services_groups`
  ADD CONSTRAINT `services_groups_fk1` FOREIGN KEY (`grp`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_groups_fk2` FOREIGN KEY (`service`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `users_groups_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`grp`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_fk2` FOREIGN KEY (`item`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_fk1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
