<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";

$header = new Template("skins/BeClothing/dtml/header.html");
$container = new Template("skins/BeClothing/dtml/homepage.html");
$footer = new Template("skins/BeClothing/dtml/footer.html");

/*
 * PLACEHOLDER -> HEADER
 */

$header->setContent("section", Homepage);

# QUERY: MENU
$query_menu = "SELECT * FROM menu";
$res_menu = getResult($query_menu);
$header->setContent("HeaderMenu", $res_menu);

/*
 * PLACEHOLDER -> CONTAINER
 */

# QUERY: SLIDESHOW
$query_slideshow = "SELECT * FROM site_images INNER JOIN site_infos ON site_images.site_info=site_infos.id_info";
$res_slideshow = getResult($query_slideshow);
$container->setContent("Slideshow", $res_slideshow);

# QUERY: ITEMS MOST POPULAR
$query_itemsmp = "SELECT purchase.item, path, name,description, price, COUNT(*) 
FROM purchase 
INNER JOIN items ON purchase.item=items.id_item 
INNER JOIN items_images ON items.id_item=items_images.item 
GROUP BY purchase.item 
ORDER BY COUNT(*) DESC";
$res_itemsmp = getResult($query_itemsmp);
$container->setContent("ItemsMP", $res_itemsmp);

# QUERY: ITEMS NEW ARRIVALS
$query_itemsna = "SELECT id_item AS item , path, name, description, price 
FROM items 
INNER JOIN items_images ON items.id_item=items_images.item 
ORDER BY id_item DESC";
$res_itemsna = getResult($query_itemsna);
$container->setContent("ItemsNA", $res_itemsna);

/*
 * PLACEHOLDER -> FOOTER
 */

$footer->setContent("FooterMenu", $res_menu);

# QUERY: SITE ADDRESS
$query_siteaddress = "SELECT info_text FROM site_infos WHERE info_type='address'";
$res_siteaddress = getResult($query_siteaddress);
$footer->setContent("SiteAddress", $res_siteaddress);

# QUERY: SITE PHONE
$query_sitephone = "SELECT info_text FROM site_infos WHERE info_type='phone'";
$res_sitephone = getResult($query_sitephone);
$footer->setContent("SitePhone", $res_sitephone);

# QUERY: SITE EMAIL
$query_siteemail = "SELECT info_text FROM site_infos WHERE info_type='email'";
$res_siteemail = getResult($query_siteemail);
$footer->setContent("SiteEmail", $res_siteemail);

$main = new Template("skins/BeClothing/dtml/blank_page.html");
$main->setContent("header", $header->get());
$main->setContent("container", $container->get());
$main->setContent("footer", $footer->get());

$main->close();
?>