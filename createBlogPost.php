<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/mainhtml.php";

$date = date('d F Y, g:i a');
$oid = mysql_query("insert into posts(username, title, text, datetime) values('{$_SESSION['user']['username']}','{$_POST['title']}','{$_POST['text']}','{$date}') ") or die(mysql_error()); 
header('Location:blog.php');
?>