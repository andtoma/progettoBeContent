<?php


require "include/template2.inc.php";
require "include/dbms.inc.php";


$header = new Template("skins/sb-admin/html/header.html");
$index = new Template("skins/sb-admin/html/customer-login.html");
$footer = new Template("skins/sb-admin/html/footer.html");

$main = new Template("skins/sb-admin/html/blank_page.html");
$main -> setContent("header", $header->get());
$main -> setContent("index", $index->get());
$main -> setContent("footer", $footer->get());

$main->close();


?>