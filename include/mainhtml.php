<?php

function load_main_html($main, $section) {

    $header = new Template("skins/BeClothing/dtml/header.html");
    $footer = new Template("skins/BeClothing/dtml/footer.html");

    /*
     * PLACEHOLDER -> HEADER
     */

    $header->setContent("section", $section);
    $header->setContent("ShoppingCart");
    $header->setContent("TotalPrice");
    
    # QUERY: MENU
    $query_menu = "SELECT * FROM menu";
    $res_menu = getResult($query_menu);
    $header->setContent("HeaderMenu", $res_menu);
    
    /*
     * PLACEHOLDER -> FOOTER
     */

    $footer->setContent("FooterMenu", $res_menu);

    # QUERY: SITE ADDRESS
    $query_siteaddress = "SELECT info_text FROM site_infos WHERE info_type='address'";
    $res_siteaddress = getResult($query_siteaddress);
    $footer->setContent("SiteAddress", $res_siteaddress);

    # QUERY: SITE PHONE
    $query_sitephone = "SELECT info_text FROM site_infos WHERE info_type='phone'";
    $res_sitephone = getResult($query_sitephone);
    $footer->setContent("SitePhone", $res_sitephone);

    # QUERY: SITE EMAIL
    $query_siteemail = "SELECT info_text FROM site_infos WHERE info_type='email'";
    $res_siteemail = getResult($query_siteemail);
    $footer->setContent("SiteEmail", $res_siteemail);



    $main->setContent("header", $header->get());
    $main->setContent("footer", $footer->get());

    return;
}
?>