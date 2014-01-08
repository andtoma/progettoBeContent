<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";
$main = load_main_html("Blog Post");

$container = new Skinlet("blogsingle");

$main -> setContent("container", $container->get());
$main->close();
?>