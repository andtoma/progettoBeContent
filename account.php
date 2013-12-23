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

    # USER-PURCHASE INFO
    $res_up_info = getResult($query_up_info);

    $container->setContent("UserIdentity");
    $container->setContent("UserAddress");
    $container->setContent("UserPhone");
    $container->setContent("UserEmail");
}


$main->setContent("container", $container->get());
$main->close();
?>