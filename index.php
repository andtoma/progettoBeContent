<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";





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

$main->setContent("container", $container->get());
$main->close();
?>