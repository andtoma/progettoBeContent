<?
session_start();

require_once "include/dbms.inc.php";
require_once "include/template2.inc.php";
require_once "include/mainhtml.php";

if (isset($_POST['update'])) {

	switch($_POST['quantity']) {
		case 0 :
			$oid = mysql_query("delete from cart where user='{$_SESSION['user']['id']}'and item='{$_POST['id']}'and colour='{$_POST['colour']}' and size='{$_POST['size']}'") or die(mysql_error());
			header('Location:account.php?id=2');
			break;
		default :
			$oid = mysql_query("update  cart set quantity='{$_POST['quantity']}' where user='{$_SESSION['user']['id']}'and item='{$_POST['id']}'and colour='{$_POST['colour']}' and size='{$_POST['size']}'") or die(mysql_error());
			header('Location:account.php?id=2');

			break;
	}

} else if (isset($_POST['delete'])) {
	$oid = mysql_query("delete from cart where user='{$_SESSION['user']['id']}'and item='{$_POST['id']}'and colour='{$_POST['colour']}' and size='{$_POST['size']}'") or die(mysql_error());
	header('Location:account.php?id=2');

} else {

	$main = load_main_html("Homepage");
	$error = new Skinlet("404");
	$main -> setContent("container", $error -> get());
	$main -> close();

}
?>

