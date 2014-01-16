<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/mainhtml.php";

$query_siteaddress = "SELECT info_text FROM site_infos WHERE info_type='address'";
$query_sitephone = "SELECT info_text FROM site_infos WHERE info_type='phone'";
$query_siteemail = "SELECT info_text FROM site_infos WHERE info_type='email'";


$main = load_main_html("Contact Us");

$container = new Skinlet("contactus");

/*
 * PLACEHOLDER -> CONTAINER
 */

# SITE ADDRESS
$res_siteaddress = getResult($query_siteaddress);
$container->setContent("SiteAddress", $res_siteaddress);
# SITE PHONE
$res_sitephone = getResult($query_sitephone);
$container->setContent("SitePhone", $res_sitephone);
# SITE EMAIL
$res_siteemail = getResult($query_siteemail);
$container->setContent("SiteEmail", $res_siteemail);

$main->setContent("container", $container->get());
$main->close();
?>