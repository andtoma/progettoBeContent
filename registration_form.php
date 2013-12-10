<?php


require "include/template2.inc.php";
require "include/becontent.inc.php";

$header = new Template("skins/html/header.html");
$index = new Template("skins/html/registration_form.html");
$footer = new Template("skins/html/footer.html");

$main = new Template("skins/html/blank_page.html");
$main -> setContent("header", $header->get());
$main -> setContent("index", $index->get());
$main -> setContent("footer", $footer->get());

$main->close();


?>