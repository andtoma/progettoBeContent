<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";
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