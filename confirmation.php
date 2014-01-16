<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/mainhtml.php";

$main = load_main_html("Confirmation");
if (isset($_SESSION['from_order'])) {
	/*in this way user is not allowed to refresh this page*/
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