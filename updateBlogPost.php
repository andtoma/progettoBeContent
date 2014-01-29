<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";


$date = date('d F Y, g:i a');
$title=mysql_escape_string($_POST['title']);
$text=mysql_escape_string($_POST['text']);
$oid = mysql_query("update posts set title='{$title}',text='{$text}' where id='{$_POST['id']}'") or die(mysql_error()); 
header('Location:blog.php');


?>