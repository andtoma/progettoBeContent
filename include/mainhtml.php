<?php
session_start();

function load_main_html($section) {

    require "include/query_collection.php";
    
    $main = new Skin("BeClothing");
    
    /*
     * PLACEHOLDER -> HEADER
     */

    $main->setContent("section", $section);
	
	$modal=new Skinlet("modal");
	$main->setContent("modal",$modal->get());
	
	$quickshop = new Skinlet("quickshop");
	$main -> setContent("quickshop", $quickshop -> get());
	
	
	$modal_cart = new Skinlet("modal_cart");
	$main -> setContent("modal_cart", $modal_cart -> get());
	
	$login = new Skinlet("login_modal");
	$main -> setContent("login_modal", $login -> get());
	
    $main->setContent("ShoppingCart");
    # MENU
    $res_menu = getResult($query_menu);
	
    $main->setContent("HeaderMenu", 0);
	

    /*
     * PLACEHOLDER -> FOOTER
     */

    # MENU
    $main->setContent("FooterMenu", $res_menu);
    # SITE ADDRESS
    $res_siteaddress = getResult($query_siteaddress);
    $main->setContent("SiteAddress", $res_siteaddress);
    # SITE PHONE
    $res_sitephone = getResult($query_sitephone);
    $main->setContent("SitePhone", $res_sitephone);
    # SITE EMAIL
    $res_siteemail = getResult($query_siteemail);
    $main->setContent("SiteEmail", $res_siteemail);

    return $main;
}

?>