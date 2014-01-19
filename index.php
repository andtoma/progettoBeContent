<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/mainhtml.php";


/*
 * QUERY HOMEPAGE
 */
$query_slideshow = "SELECT * FROM slideshow";
$query_itemsmp = "SELECT purchase.item, path, name, description, FLOOR( price - price * discount/100) as price, quantity, COUNT(*) 
FROM purchase 
INNER JOIN items ON purchase.item=items.id 
INNER JOIN items_images ON items.id=items_images.item 
GROUP BY purchase.item 
ORDER BY COUNT(*) DESC";
$query_itemsna = "SELECT DISTINCT items.id AS item , path, name, description, FLOOR( price - price * discount/100) as price 
FROM items 
INNER JOIN items_images ON items.id=items_images.item 
ORDER BY items.id DESC";
$query_brands = "SELECT * FROM brands";



$main = load_main_html("Homepage");

$container = new Skinlet("homepage");



/*
 * PLACEHOLDER -> CONTAINER
 */
# SLIDESHOW
$res_slideshow = getResult($query_slideshow);
$container->setContent("Slideshow", $res_slideshow);
# ITEMS MOST POPULAR
$res_itemsmp = getResult($query_itemsmp);
$container->setContent("ItemsMP", $res_itemsmp);
# ITEMS NEW ARRIVALS
$res_itemsna = getResult($query_itemsna);
$container->setContent("ItemsNA", $res_itemsna);
# BRANDS
$res_brands = getResult($query_brands);
$container->setContent("Brands", $res_brands);

$main->setContent("container", $container->get());
$main->close();
?>