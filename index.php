<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
# DA METTERE IN OGNI FILE PHP CHE CONTIENE HEADER E FOOTER
require "include/mainhtml.php";
$main = new Template("skins/BeClothing/dtml/blank_page.html");
$container = new Template("skins/BeClothing/dtml/homepage.html");

# DA METTERE IN OGNI FILE PHP CHE CONTIENE HEADER E FOOTER
load_main_html($main, "Homepage");
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

$main->setContent("container", $container->get());

$main->close();
?>