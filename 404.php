<?php

session_start();

require_once "include/template2.inc.php";
require_once "include/dbms.inc.php";
require_once "include/query_collection.php";
require_once "include/mainhtml.php";
$main = load_main_html("Page Not Found");

$container = new Skinlet("404");

$main -> setContent("container", $container->get());
$main->close();
?>