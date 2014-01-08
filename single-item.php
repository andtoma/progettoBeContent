<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";
$main = load_main_html("Item");

$container = new Skinlet("single-item");


$item = $_GET['id'];
if (!$item)
    header("Location: items.php");

$query_item1 = "SELECT * FROM items WHERE id={$item}";

$res_item = getResult($query_item1);
if(!$res_item)
    header("Location: 404.php");

$container->setContent("Item", $res_item);

$main->setContent("container", $container->get());
$main->close();
?>