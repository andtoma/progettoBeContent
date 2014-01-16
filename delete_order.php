<?php
session_start();

require_once "include/dbms.inc.php";
require_once "include/template2.inc.php";
require_once "include/mainhtml.php";

if (isset($_POST['delete'])) {
	/*user would delete a processing order*/
	/*I take the  product infos*/
	$query_product = mysql_query("select item,colour,size,quantity from purchase where id='{$_POST['delete']}' ") or die(mysql_error());
	$data = mysql_fetch_assoc($query_product);
	
	
	/*I delete the purchased product*/
	$query_delete = mysql_query("delete from purchase where id='{$_POST['delete']}' ") or die(mysql_error());
	
	 
	 /*I update the product quantity*/
	


	if (!hasResult("select * from availability where item='{$data['item']}' and
				 colour = '{$data['colour']}'and
				 size = '{$data['size']}'")) {
				 	
		/*product is not available, I insert it*/
		$query_insert = mysql_query("insert into availability(item,size, quantity,colour)
						values({$data['item']},'{$data['size']}','{$data['quantity']}','{$data['colour']}')") or die(mysql_error());
	} else {
		/*product is available, I update quantity*/
		$query_update = mysql_query("update availability set quantity=quantity + {$data['quantity']}
						 where item='{$data['item']}' and
				 		colour = '{$data['colour']}'and
						 size = '{$data['size']}' ") or die(mysql_error());
	}
	header('Location:account.php?id=1');

} else {

	$main = load_main_html("Homepage");
	$error = new Skinlet("404");
	$main -> setContent("container", $error -> get());
	$main -> close();
}
?>

