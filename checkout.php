<?php

require "include/template2.inc.php";
require "include/dbms.inc.php";


$header = new Template("skins/BeClothing/dtml/header.html");
$index = new Template("skins/BeClothing/dtml/checkout.html");
$footer = new Template("skins/BeClothing/dtml/footer.html");

$main = new Template("skins/BeClothing/dtml/blank_page.html");
$main -> setContent("header", $header->get());
$main -> setContent("index", $index->get());
$main -> setContent("footer", $footer->get());

$main->close();


?>