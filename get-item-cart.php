<?php

require_once "include/dbms.inc.php";

session_start();

if (hasResult("select * from cart where user='{$_SESSION['user']['id']}'")) {
	echo "not empty";
} else {
	echo "empty";
}
?>