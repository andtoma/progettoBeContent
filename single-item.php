<?php

session_start();

require_once "include/auth.inc.php";
require_once "include/template2.inc.php";
require_once "include/dbms.inc.php";
require_once "include/query_collection.php";
require_once "include/mainhtml.php";

updateSessionCookie();

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