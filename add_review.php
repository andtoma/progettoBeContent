<?
session_start();
require_once "include/dbms.inc.php";
require_once "include/template2.inc.php";
require_once "include/mainhtml.php";
/*if user comes here pressing submit button*/
if (isset($_POST['review_button'])) {
	$date = date('Y-m-d');
	$oid = mysql_query("insert into reviews(rating,text,username,item,date) values('{$_POST['review_stars']}','{$_POST['review_text']}','{$_SESSION['user']['username']}','{$_POST['itemid']}','{$date}')") or die(mysql_error());
	header("Location:single-item.php?id=" . $_POST['itemid'] . "#addrev");
} else {
	header('Location:index.php');
}
?>