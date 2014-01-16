<?php
require_once "include/dbms.inc.php";

$oid = mysql_query("insert into contact_requests(name,email,message) values('{$_POST['name']}','{$_POST['email']}','{$_POST['message']}')") or die(mysql_error());
?>