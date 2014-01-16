<?php
session_start();
require "include/dbms.inc.php";

if(isset($_SESSION['user'])){
	echo 1;
} else {
	echo 0;
}

?>