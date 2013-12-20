<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
# DA METTERE IN OGNI FILE PHP CHE CONTIENE HEADER E FOOTER
require "include/mainhtml.php";
$main = new Template("skins/BeClothing/dtml/blank_page.html");


# DA METTERE IN OGNI FILE PHP CHE CONTIENE HEADER E FOOTER
load_main_html($main, "Account");


if (!isset($_SESSION['user'])) {
    #header("Location: login.php");
    $container = new Template("skins/BeClothing/dtml/login.html");
} else {
    $container = new Template("skins/BeClothing/dtml/account.html");
}

#$container = new Template("skins/BeClothing/dtml/account.html"); //da levare

/*
 * PLACEHOLDER -> CONTAINER
 */





$main->setContent("container", $container->get());

$main->close();
?>