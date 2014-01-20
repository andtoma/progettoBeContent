<?
session_start();
require_once "include/dbms.inc.php";


if (!isset($_SESSION['user'])) {
	header("Location: index.php");
}

/*
 * foreach item in the user cart I take the quantity and see if the quantity available is less.
 * If this happens I update the quantity with the max available.
 * 
 * */


$item_cart = getResult("select * from cart where user='{$_SESSION['user']['id']}'");

foreach ($item_cart as $key => $value) {
	if (!hasResult("select * from availability where item='{$value['item']}' and colour='{$value['colour']}' and size='{$value['size']}'")) {
		$delete_item = mysql_query("delete from cart where item='{$value['item']}' and colour='{$value['colour']}' and size='{$value['size']}' and user='{$_SESSION['user']['id']}'") or die(mysql_error());
	} else {
		$quantity_av = getSingleResult("select * from availability where item='{$value['item']}' and colour='{$value['colour']}' and size='{$value['size']}'", "quantity");
		if ($quantity_av < $value['quantity']) {
			$update_item = mysql_query("update cart set quantity={$quantity_av} where  item='{$value['item']}' and colour='{$value['colour']}' and size='{$value['size']}'") or die(mysql_error());
		}
	}
}
header('Location:account.php?id=2');

?>