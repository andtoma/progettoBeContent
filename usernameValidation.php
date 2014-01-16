<?php
require "include/dbms.inc.php";

$result = mysql_query("select * from users where username='{$_REQUEST['username']}'");
$num_rows = mysql_num_rows($result);
// Should show you an integer result.
echo $num_rows;
?>