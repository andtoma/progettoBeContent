<?
session_start();
require "include/dbms.inc.php";

if(!isset($_POST['post'])){
	header('Location:index.php');
} else {
$date = date('d F Y, g:i a');
$text=mysql_escape_string($_POST['text']);
$oid = mysql_query("insert into comments(username, text, datetime, post) values('{$_SESSION['user']['username']}','{$text}','{$date}','{$_POST['post']}') ") or die(mysql_error()); 
}
?>