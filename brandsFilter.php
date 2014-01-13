<?php

session_start();

require "include/dbms.inc.php";


/* Query matching results */

$query = getResult("select distinct brand_name from brands where brand_name like '%{$_POST['token']}%'");

if (!$query) {
	/* No results found */
	echo '<div class="cwell"><h3 style="text-align: center;">Ops, Sorry<span class="color">!!!</span><br> No Results Found<span class="color">!!!</span></h3><h4 class="error-para" style="text-align: center;">Change brands search criteria!</h4></div>';
} else {
	if($_POST['token'] == ''){
		$brandsList .= '<div class="cwell"><h3 style="text-align: center;">"Brands Search"<br> Type a brand name above<span class="color"> !!!</span></h3></div>';
	} else {
	/* Matches list */
	$brandsList = '';
	foreach($query as $key => $value){
		$brandsList .= '<li><a class="brand_list_item" href="">'.$value['brand_name'].'</a></li>';
	}
	}
	echo $brandsList;
}
?>