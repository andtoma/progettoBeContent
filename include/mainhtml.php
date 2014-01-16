<?php

session_start();

function load_main_html($section) {


    /*
     * QUERY HEADER-FOOTER
     */
    $query_menu = "SELECT * FROM menu WHERE parent_id=0 ORDER BY position";
    $query_siteaddress = "SELECT info_text FROM site_infos WHERE info_type='address'";
    $query_sitephone = "SELECT info_text FROM site_infos WHERE info_type='phone'";
    $query_siteemail = "SELECT info_text FROM site_infos WHERE info_type='email'";



    $main = new Skin("BeClothing");

    /*
     * PLACEHOLDER -> HEADER
     */

    $main->setContent("section", $section);

    $modal = new Skinlet("modal");
    $main->setContent("modal", $modal->get());

    $quickshop = new Skinlet("quickshop");
    $main->setContent("quickshop", $quickshop->get());


    $modal_cart = new Skinlet("modal_cart");
    $main->setContent("modal_cart", $modal_cart->get());

    $login = new Skinlet("login_modal");
    $main->setContent("login_modal", $login->get());

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