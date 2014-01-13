<?
require_once "include/dbms.inc.php";
/*if someone type this script url will be redirected*/
if (!isset($_POST['flag'])) {
	header('Location:blog.php');

}

else{
	$colour=getSingleResult("select colour from items_images where id='{$_POST['id']}'","colour");
	echo $colour;
}
?>