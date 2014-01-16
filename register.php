<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/mainhtml.php";
$main = load_main_html("Register");

$container = new Skinlet("register");

$main -> setContent("container", $container->get());
$main->close();
?>