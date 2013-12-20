<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/auth.inc.php";
# DA METTERE IN OGNI FILE PHP CHE CONTIENE HEADER E FOOTER
require "include/mainhtml.php";
$main = new Template("skins/BeClothing/dtml/blank_page.html");

# DA METTERE IN OGNI FILE PHP CHE CONTIENE HEADER E FOOTER
load_main_html($main, "Login");


/*
 * PLACEHOLDER -> CONTAINER
 */

if (!isset($_SESSION['user'])) {
    login($main);
}


$main->close();
?>