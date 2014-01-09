<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";

if (!isset($_SESSION['user'])) {
	header("Location: login.php");
} else {
	$main = load_main_html("Checkout");

	$container = new Skinlet("checkout");

	$main -> setContent("container", $container -> get());
	$main -> close();
}
?>