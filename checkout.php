<?php

session_start();

require_once "include/template2.inc.php";
require_once "include/dbms.inc.php";
require_once "include/query_collection.php";
require_once "include/mainhtml.php";
require_once "include/auth.inc.php";

if (!isset($_SESSION['user'])) {
	header("Location: login.php");
} else {
	updateSessionCookie();

	$main = load_main_html("Checkout");

	$container = new Skinlet("checkout");

	$main -> setContent("container", $container -> get());
	$main -> close();
}
?>