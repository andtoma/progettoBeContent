<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";

$main = load_main_html("Wishlist");

if (!isset($_SESSION['user'])) {
    header("Location: login.php");
} else {
    $container = new Skinlet("wishlist");
    
    # WISHLIST
    $res_wishlist = getResult($query_wishlist);
    $container->setContent("WishList", $res_wishlist);
}

$main -> setContent("container", $container->get());
$main->close();
?>