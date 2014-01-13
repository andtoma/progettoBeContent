<?
session_start();

require_once "include/dbms.inc.php";
require_once "include/mainhtml.php";

if (!isset($_POST['id'])) {
	header('Location:index.php');
} else {
	$data = getResult("select * from cart where user='{$_SESSION['user']['id']}' and item='{$_POST['id']}' and colour='{$_POST['colour']}'and size='{$_POST['size']}'");
	if (!$data) {
		$oid = mysql_query("insert into cart(user,item,colour,size,quantity) values('{$_SESSION['user']['id']}','{$_POST['id']}','{$_POST['colour']}','{$_POST['size']}','{$_POST['quantity']}')") or die(mysql_error());
	} else {
		$oid = mysql_query("update  cart set quantity=(quantity + {$_POST['quantity']}) where user='{$_SESSION['user']['id']}'and item='{$_POST['id']}'and colour='{$_POST['colour']}' and size='{$_POST['size']}'") or die(mysql_error());
	}
}
?>