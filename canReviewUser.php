<?php
session_start();
require_once "include/dbms.inc.php";
require_once "include/permissions.inc.php";

if(check_permission("product_review")){
	echo 1;
} else {
	echo 0;
}

?>