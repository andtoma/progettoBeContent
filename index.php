<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";


$header = new Template("skins/BeClothing/dtml/header.html");
$container = new Template("skins/BeClothing/dtml/homepage.html");
$footer = new Template("skins/BeClothing/dtml/footer.html");




# QUERY: MENU
$query_menu = "SELECT * FROM menu";
$res_menu = getResult($query_menu);
# QUERY: SLIDESHOW
$query_slideshow = "SELECT * FROM site_images INNER JOIN site_infos ON site_images.site_info=site_infos.id_info";
$res_slideshow = getResult($query_slideshow);
# QUERY ITEMS MOST POPULAR
$query_itemsmp = "SELECT purchase.item, path, name,description, price, COUNT(*) 
FROM purchase 
INNER JOIN items ON purchase.item=items.id_item 
INNER JOIN items_images ON items.id_item=items_images.item 
GROUP BY purchase.item 
ORDER BY COUNT(*) DESC";
$res_itemsmp = getResult($query_itemsmp);
# QUERY ITEMS NEW ARRIVALS
$query_itemsna = "SELECT id_item AS item , path, name, description, price 
FROM items 
INNER JOIN items_images ON items.id_item=items_images.item 
ORDER BY id_item DESC";
$res_itemsna = getResult($query_itemsna);



$header->setContent("section", Homepage);
$header->setContent("HeaderMenu", $res_menu);

$footer->setContent("FooterMenu", $res_menu);

$container->setContent("Slideshow", $res_slideshow);
$container->setContent("ItemsMP", $res_itemsmp);
$container->setContent("ItemsNA", $res_itemsna);


$main = new Template("skins/BeClothing/dtml/blank_page.html");
$main->setContent("header", $header->get());
$main->setContent("container", $container->get());
$main->setContent("footer", $footer->get());



$main->close();
?>