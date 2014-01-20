<?php

session_start();

require_once "include/template2.inc.php";
require_once "include/dbms.inc.php";
require_once "include/auth.inc.php";
require_once "include/query_collection.php";
require_once "include/mainhtml.php";

$main = load_main_html("Login");

if (!isset($_SESSION['user'])) {
    login($main);
} else {
    header("Location: index.php");
}


$main->close();
?>