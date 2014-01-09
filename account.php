<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";
$main = load_main_html("Account");

if (!isset($_SESSION['user'])) {
	header("Location: login.php");
} else {

	$container = new Skinlet("account");

	switch($_GET['id']) {
		case 2 :
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
			$profile -> setContent("Username", $res_userinfo);
			$profile -> setContent("Name", $res_userinfo);
			$profile -> setContent("Surname", $res_userinfo);
			$profile -> setContent("Email", $res_userinfo);
			$profile -> setContent("Birth_Date", $res_userinfo);
			if ($res_userinfo[0]['sex'] == 'M')
				$profile -> setContent("Male", "checked");
			else
				$profile -> setContent("Female", "checked");
			$profile -> setContent("Country", $res_userinfo);
			$profile -> setContent("State", $res_userinfo);
			$profile -> setContent("City", $res_userinfo);
			$profile -> setContent("Zip_Code", $res_userinfo);
			$profile -> setContent("Address", $res_userinfo);
			$profile -> setContent("Phone", $res_userinfo);
			$container -> setContent("content", $profile -> get());

			break;
		case 1 :
		default :
			$account_resume = new Skinlet("account_resume");
			# USER INFO
			$res_userinfo = getResult($query_userinfo);
			$account_resume -> setContent("Name", $res_userinfo);
			$account_resume -> setContent("Surname", $res_userinfo);
			$account_resume -> setContent("Address", $res_userinfo);
			$account_resume -> setContent("Phone", $res_userinfo);
			$account_resume -> setContent("Email", $res_userinfo);

			# RECENT PURCHASE
			$res_purchase = getResult($query_purchase);
			$account_resume -> setContent("RecentPurchase", $res_purchase);

			$container -> setContent("content", $account_resume -> get());
			break;
	}

}
$main -> setContent("container", $container -> get());
$main -> close();
?>