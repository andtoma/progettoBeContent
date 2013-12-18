<?php

require "include/template2.inc.php";
require "include/dbms.inc.php";


$header = new Template("skins/BeClothing/dtml/header.html");
$container = new Template("skins/BeClothing/dtml/orderhistory.html");
$footer = new Template("skins/BeClothing/dtml/footer.html");

$header->setContent("section", OrderHistory);

$main = new Template("skins/BeClothing/dtml/blank_page.html");
$main -> setContent("header", $header->get());
$main -> setContent("container", $container->get());
$main -> setContent("footer", $footer->get());

$main->close();


?>