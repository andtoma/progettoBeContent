<?php

session_start();

require_once "include/auth.inc.php";
require_once "include/template2.inc.php";
require_once "include/dbms.inc.php";
require_once "include/query_collection.php";
require_once "include/mainhtml.php";

updateSessionCookie();

$main = load_main_html("Blog");

$container = new Skinlet("blog");
/* Blog Page Placeholders */
$container -> setContent("Post_List", $_GET['page']);
$container -> setContent("Blog_Search",0);
$container -> setContent("Recent_Post", 0);	
$main -> setContent("container", $container->get());
$main->close();
?>
