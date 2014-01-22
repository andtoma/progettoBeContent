<?php

session_start();

require "include/dbms.inc.php";

if($_POST['picked'] == ''){
	$query = getResult("select name from colours");	
} else {
	$query = getResult("select name from colours where name not in (".str_replace("\'", "'", $_POST['picked']).")");
}
/* Query matching results */
if (!$query) {
	/* No results found */
	echo '<div class="cwell"><h3 style="text-align: center;">Ops, Sorry<span class="color">!!!</span><br> No Colours Available<span class="color">!!!</span></h3></div>';
} else {
	/* Matches list */
	$colorList = '';
	foreach($query as $key => $value){
		$colorList .= '<p id="' . $value['name'] . '"class="color_filter" style="border: 1px solid black; float: left;color: rgba(0,0,0,0); background-color: '.$value['name'].'; width: 17%; margin-right: 5px; margin-bottom: 5px;">.</p>';
	}
	$colorList .= '<div class="clearfix"></div>';
	}
	echo $colorList;

?>