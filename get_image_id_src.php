<?php
require_once "include/dbms.inc.php";
session_start();
/*if someone type this script url will be redirected*/
if (!isset($_POST['flag'])) {
	header('Location:index.php');

} else {
	$data=getResult("select path,id from items_images where colour='{$_POST['colour']}' and item='{$_POST['id']}'");
	$result=array(
	id=>$data[0]['id'],
	path=>$data[0]['path']
	);
	echo json_encode($result);
}
?>

