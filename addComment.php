<?php
session_start();
require "include/dbms.inc.php";

if(!isset($_POST['post'])){
	header('Location:index.php');
} else {
$date = date('d F Y, g:i a');
$oid = mysql_query("insert into comments(username, text, datetime, post) values('{$_SESSION['user']['username']}','{$_POST['text']}','{$date}','{$_POST['post']}') ") or die(mysql_error()); 
header('Location:blogsingle.php?id='.$_POST['post'].'&mode=1');
}
?>