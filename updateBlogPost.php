<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/mainhtml.php";


$date = date('d F Y, g:i a');
$oid = mysql_query("update posts set title='{$_POST['title']}',text='{$_POST['text']}' where id='{$_POST['id']}'") or die(mysql_error()); 
header('Location:blog.php');


?>