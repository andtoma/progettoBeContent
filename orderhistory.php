<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/mainhtml.php";

$query_purchase = "SELECT DATE_FORMAT(datetime, ' %e %b %Y, %h:%i %p') as datetime, purchase.id as id, name,colour,size, quantity, purchase.item_price as price, status 
FROM purchase 
INNER JOIN items ON purchase.item=items.id 
WHERE purchase.user=".$_SESSION['user']['id']."  order by purchase.id desc";

$main = load_main_html("Order History");

if (!isset($_SESSION['user'])) {
    header("Location: login.php");
} else {
    $container = new Skinlet("orderhistory");

    # PURCHASE HISTORY
    $res_purchase = getResult($query_purchase);
    $container->setContent("PurchaseHistory", $res_purchase);
}

$main->setContent("container", $container->get());
$main->close();
?>