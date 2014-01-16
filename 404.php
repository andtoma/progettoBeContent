<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/mainhtml.php";
$main = load_main_html("Page Not Found");

$container = new Skinlet("404");

$main -> setContent("container", $container->get());
$main->close();
?>