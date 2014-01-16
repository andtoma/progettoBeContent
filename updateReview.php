<?php
session_start();
require_once "include/dbms.inc.php";
require_once "include/template2.inc.php";
require_once "include/mainhtml.php";

if (isset($_POST['remove'])) {
	$item = getSingleResult("select * from reviews where id=" . $_POST['remove'], "item");

	$oid = mysql_query("delete from reviews where id='{$_POST['remove']}'") or die(mysql_error());

	header("Location:single-item.php?id=" . $item . "#delrev");

} else if (isset($_POST['edit'])) {
	
	$item = getSingleResult("select * from reviews where id=" . $_POST['edit'], "item");

	$oid = mysql_query("update reviews set text='{$_POST['text']}'  where id='{$_POST['edit']}'") or die(mysql_error());

	header("Location:single-item.php?id=" . $item . "#editrev");
} else {
	header('Location:index.php');
}
?>