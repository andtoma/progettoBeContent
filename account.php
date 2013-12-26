<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";
$main = load_main_html("Account");

if (!isset($_SESSION['user'])) {
    header("Location: login.php");
} else {
    $container = new Skinlet("account");

    # USER INFO
    $res_userinfo = getResult($query_userinfo);
    $container->setContent("Name", $res_userinfo);
    $container->setContent("Surname", $res_userinfo);
    $container->setContent("Address", $res_userinfo);
    $container->setContent("Phone", $res_userinfo);
    $container->setContent("Email", $res_userinfo);
    
    # RECENT PURCHASE
    $res_purchase = getResult($query_purchase);
    $container->setContent("RecentPurchase", $res_purchase);

}


$main->setContent("container", $container->get());
$main->close();
?>