<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/auth.inc.php";
require "include/mainhtml.php";

$main = load_main_html("Login");

$container = new Skinlet("login");

if (!isset($_SESSION['user'])) {
    login($main);
} else {
    header("Location: index.php");
}


$main->close();
?>