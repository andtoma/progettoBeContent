<?php

require "include/template2.inc.php";
require "include/dbms.inc.php";


$header = new Template("skins/progettotdw/dtml/header.html");
$index = new Template("skins/progettotdw/dtml/404.html");
$footer = new Template("skins/progettotdw/dtml/footer.html");

$main = new Template("skins/progettotdw/dtml/blank_page.html");
$main -> setContent("header", $header->get());
$main -> setContent("index", $index->get());
$main -> setContent("footer", $footer->get());

$main->close();


?>