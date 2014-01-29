<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";

$date = date('d F Y, g:i a');

$text = mysql_escape_string($_POST['text']);

$title = mysql_escape_string($_POST['title']);

$oid = mysql_query("insert into posts(username, title, text, datetime) values('{$_SESSION['user']['username']}','{$title}','{$text}','{$date}') ") or die(mysql_error());

header('Location:blog.php');
?>