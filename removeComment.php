<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/mainhtml.php";

 
$oid = mysql_query('delete from comments where id='.$_POST['id']);
if(!$oid){
	echo "ko";
} else {
	echo 'delete from comments where id='.$_POST['id'];
}


?>