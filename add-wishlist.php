<?
require_once "include/dbms.inc.php";
session_start();
/*if someone type this script url will be redirected*/

if (!isset($_POST['flag'])) {
	header('Location:index.php');

} else {
	$test=hasResult("select * from wishlist where user=	'{$_SESSION['user']['id']}' and item='{$_POST['item']}'");
	if($test){
		echo 0;
	}
	else{
		$oid=mysql_query("insert into wishlist(item,user) values('{$_POST['item']}','{$_SESSION['user']['id']}')") or die(mysql_error());
		echo 1;
	}
}
?>

