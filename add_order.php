<?php

session_start();

require_once "include/dbms.inc.php";
require_once "include/template2.inc.php";
require_once "include/mainhtml.php";

if (isset($_POST['order-button'])) {

	$items_cart = getResult("select * from cart where user='{$_SESSION['user']['id']}'");

	/*I put every item in the cart  in into purchase*/
	foreach ($items_cart as $key => $value) {

		$item_price = getSingleResult("select  FLOOR( price - price * discount/100) as price
									 from items where id='{$value['item']}'", "price");
		$datetime = date('Y-m-d H:i:s');
		/*insert into purchase*/
		$new_purchase = mysql_query("insert into purchase (user,item,size,colour,quantity,item_price,country,state,city,zip_code,address,datetime)
			values('{$_SESSION['user']['id']}','{$value['item']}','{$value['size']}',
			'{$value['colour']}','{$value['quantity']}','{$item_price}','{$_POST['country']}',
			'{$_POST['state']}','{$_POST['city']}','{$_POST['zip_code']}','{$_POST['address']}',
			'{$datetime}')") or die(mysql_error());

		/*update availability*/
		/*I get the current item quantity*/
		$quantity = getSingleResult("select * from availability where item='{$value['item']}'and size='{$value['size']}' and colour='{$value['colour']}'", "quantity");
		$remaining_quantity = $quantity - $value['quantity'];
		/*if item remaining quantity with this purchase become 0 I delete the row*/
		if ($remaining_quantity == 0) {
			$query_delete = mysql_query("delete from availability where item='{$value['item']}'and size='{$value['size']}' and colour='{$value['colour']}'") or die(mysql_error());
		} else {
			//else I just update it
			$query_update = mysql_query("update availability 
				set quantity=quantity-{$value['quantity']} 
				where item='{$value['item']}'and size='{$value['size']}' 
				and colour='{$value['colour']}'") or die(mysql_error());
		}

	}
	/*now I empty the cart*/
	$empty_cart_query = mysql_query("delete from cart where user='{$_SESSION['user']['id']}'");

	/*redirect to confirmation.php setting a variable session to say that it's coming from here*/
	$_SESSION['from_order'] = "true";
	header('Location:confirmation.php');

} else {
	/*user just type add_cart.php?..something*/
	$main = load_main_html("Homepage");
	$error = new Skinlet("404");
	$main -> setContent("container", $error -> get());
	$main -> close();
	break;
}
?>