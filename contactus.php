<?php

session_start();

require_once "include/template2.inc.php";
require_once "include/dbms.inc.php";
require_once "include/query_collection.php";
require_once "include/mainhtml.php";
require_once "include/auth.inc.php";

updateSessionCookie();

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