<?php

session_start();

require_once "include/template2.inc.php";
require_once "include/dbms.inc.php";
require_once "include/query_collection.php";
require_once "include/mainhtml.php";
require_once "include/auth.inc.php";

$main = load_main_html("Account");

if (!isset($_SESSION['user'])) {
	header("Location: login.php");
} else {
	updateSessionCookie();
	
	$container = new Skinlet("account");
	
	switch($_GET['id']) {
		case 2 :
			# CART
			$cart = new Skinlet("cart");
			$res_cart = getResult($query_cart);
			$cart -> setContent("Cart", $res_cart);
			$container -> setContent("content", $cart -> get());
			break;
		case 3 :
			$wishlist = new Skinlet("wishlist");
			# WISHLIST		
			$res_wishlist = getResult($query_wishlist);
			$wishlist -> setContent("WishList", $res_wishlist);
			$container -> setContent("content", $wishlist -> get());
			break;
		case 4 :
			# PURCHASE HISTORY
			$history = new Skinlet("orderhistory");
			$res_purchase = getResult($query_purchase);
			$history -> setContent("PurchaseHistory", $res_purchase);
			$container -> setContent("content", $history -> get());
			break;
		case 5 :
			# USER INFO
			$profile = new Skinlet("editprofile");
			$res_userinfo = getResult($query_userinfo);
			$profile -> setContent("val", $res_userinfo);
			$container -> setContent("content", $profile -> get());
			break;
		
		case 6 :
			# EDIT PASSWORD
			$password = new Skinlet("password_form");
			$container -> setContent("content", $password -> get());
			break;
		case 7 :
			# USER INFO
			$profile = new Skinlet("editaddress");
			$res_userinfo = getResult($query_userinfo);
			$profile -> setContent("val", $res_userinfo);
			$container -> setContent("content", $profile -> get());
			break;
		case 1 :
		default :
			$account_resume = new Skinlet("account_resume");
			# USER INFO
			$res_userinfo = getResult($query_userinfo);
			$account_resume -> setContent("val", $res_userinfo);
			# PROCESSING PURCHASES	
			$res_processing = getResult($query_processing);
			$account_resume -> setContent("ProcessingPurchase", $res_processing);
			$container -> setContent("content", $account_resume -> get());
			break;
	}

}
$main -> setContent("container", $container -> get());
$main -> close();
?>