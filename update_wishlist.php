<?
session_start();

require_once "include/dbms.inc.php";
require_once "include/template2.inc.php";
require_once "include/mainhtml.php";

 if (isset($_POST['delete'])) {
	$oid = mysql_query("delete from wishlist where user='{$_SESSION['user']['id']}'and item='{$_POST['id']}'") or die(mysql_error());
	header('Location:account.php?id=3');

} else {

	$main = load_main_html("Homepage");
	$error = new Skinlet("404");
	$main -> setContent("container", $error -> get());
	$main -> close();

}
?>

