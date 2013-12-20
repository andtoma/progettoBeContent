<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
# DA METTERE IN OGNI FILE PHP CHE CONTIENE HEADER E FOOTER
require "include/mainhtml.php";

$main = new Template("skins/BeClothing/dtml/blank_page.html");
$container = new Template("skins/BeClothing/dtml/contactus.html");

# DA METTERE IN OGNI FILE PHP CHE CONTIENE HEADER E FOOTER
load_main_html($main, "Contact Us");

/*
 * PLACEHOLDER -> CONTAINER
 */

# QUERY: SITE ADDRESS
$query_siteaddress = "SELECT info_text FROM site_infos WHERE info_type='address'";
$res_siteaddress = getResult($query_siteaddress);
$container->setContent("SiteAddress", $res_siteaddress);

# QUERY: SITE PHONE
$query_sitephone = "SELECT info_text FROM site_infos WHERE info_type='phone'";
$res_sitephone = getResult($query_sitephone);
$container->setContent("SitePhone", $res_sitephone);

# QUERY: SITE EMAIL
$query_siteemail = "SELECT info_text FROM site_infos WHERE info_type='email'";
$res_siteemail = getResult($query_siteemail);
$container->setContent("SiteEmail", $res_siteemail);

$main->setContent("container", $container->get());

$main->close();
?>