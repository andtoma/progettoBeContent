<?php

session_start();

require_once "include/auth.inc.php";
require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";

$main = load_main_html("Confirmation");
if (!isset($_SESSION['from_order'])) {
	updateSessionCookie();

	/*in this way user is not allowed to refresh this page and type directly this page address*/
	unset($_SESSION['from_order']);

	/*generating a random number with 10 digits*/
	$random_string = substr(md5(microtime()), rand(0, 26), 15);

	$container = new Skinlet("confirmation");
	$container -> setContent("id", $random_string);
	$main -> setContent("container", $container -> get());

} else {

	header('Location:index.php');
}

$main -> close();
?>