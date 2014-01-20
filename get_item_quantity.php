<?
session_start();
require "include/dbms.inc.php";

if (!isset($_POST['id'])) {
	header('Location:index.php');
} else {
	if(!hasResult("select  * from availability where item='{$_POST['id']}' and colour='{$_POST['colour']}' and size='{$_POST['size']}'")){
		echo -1;
	}
	$quantityAV = getSingleResult("select  * from availability where item='{$_POST['id']}' and colour='{$_POST['colour']}' and size='{$_POST['size']}'", "quantity");
	if ($quantityAV >= $_POST['quantity']) {
		/*if there is availability I return -1*/
		echo -1;
	} else {
		/*else I return the product available*/
		echo $quantityAV;
	}
	break;
}
?>