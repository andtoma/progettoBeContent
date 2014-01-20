<?php

session_start();

require_once "include/template2.inc.php";
require_once "include/dbms.inc.php";
require_once "include/query_collection.php";
require_once "include/mainhtml.php";
require_once "include/auth.inc.php";

updateSessionCookie();

$main = load_main_html("Homepage");

$container = new Skinlet("homepage");



/*
 * PLACEHOLDER -> CONTAINER
 */
# SLIDESHOW
$res_slideshow = getResult($query_slideshow);
$container->setContent("Slideshow", $res_slideshow);


# BRANDS
$res_brands = getResult("SELECT * FROM brands");
$container->setContent("Brands", $res_brands);

# ITEMS MOST POPULAR
$res_itemsmp = getResult($query_itemsmp);
$container->setContent("ItemsMP", $res_itemsmp);
# ITEMS NEW ARRIVALS
$res_itemsna = getResult($query_itemsna);
$container->setContent("ItemsNA", $res_itemsna);

$main->setContent("container", $container->get());
$main->close();
?>