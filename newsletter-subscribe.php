<?php
require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/mainhtml.php";

if (!isset($_POST['ok'])) {
	/*user is coming from url*/
	$main = load_main_html("Homepage");
	$error = new Skinlet("404");
	$main -> setContent("container", $error -> get());
	$main -> close();
} else {
	/*ajax call*/
	$email = mysql_escape_string($_POST['email']);
	$check_email = mysql_query("select email from newsletter where email='{$email}'");
	if (mysql_num_rows($check_email) == 0) {
		$oid = mysql_query("insert into newsletter(email) values('{$email}')") or die(mysql_error());
		echo "OK";
	} else {
		echo "KO";
	}
}
?>