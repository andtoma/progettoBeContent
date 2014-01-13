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
/*item details*/
$query_item1 = "SELECT * FROM items WHERE id={$item}";

$res_item = getResult($query_item1);
if(!$res_item){
	/*if item does not exist*/
    header("Location: 404.php");
}

/*item reviews*/
$query_itemRev = "SELECT * FROM reviews WHERE item={$item} order by id desc";
$res_review = getResult($query_itemRev);


//$container->setContent("Reviews", $res_review);

$container->setContent("Reviews",$res_review);
$container->setContent("Item", $res_item);


$main->setContent("container", $container->get());
$main->close();
?>