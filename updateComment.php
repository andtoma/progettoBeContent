<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";

$text=mysql_escape_string($_POST['text']);
$oid = mysql_query('update comments set text="'.$text.'" where id="'.$_POST['id'].'"');
if(!$oid){
	echo "ko";
} else {
	echo "ok";
}
/*$post_id = getSingleResult('select * from comments where id='.$_POST['id'].'', 'post');*/

?>