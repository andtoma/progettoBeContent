<?php

require "include/template2.inc.php";
require "include/dbms.inc.php";


$header = new Template("skins/BeClothing/dtml/header.html");
$index = new Template("skins/BeClothing/dtml/index.html");
$footer = new Template("skins/BeClothing/dtml/footer.html");

$main = new Template("skins/BeClothing/dtml/blank_page.html");
$main -> setContent("header", $header->get());
$main -> setContent("index", $index->get());
$main -> setContent("footer", $footer->get());


// settare i menu e i sottomenu nell'header

// settare lo slideshow

// settare i prodotti "most popular"

// settare i prodotti "new arrivals"

// settare i menu nel footer

// settare gli ultimi 5 post del blog nel footer


$main->close();


?>