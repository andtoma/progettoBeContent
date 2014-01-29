<?php

session_start();

require_once "include/template2.inc.php";
require_once "include/dbms.inc.php";
require_once "include/query_collection.php";
require_once "include/mainhtml.php";
require_once "include/auth.inc.php";

updateSessionCookie();


$main = load_main_html("Blog Post");
if(!isset($_REQUEST['id'])){
	$_REQUEST['id'] = 1;
}

$container = new Skinlet("blogsingle");
/* Single Blog Post Content */
$container -> setContent("Post_Content", $_REQUEST);
/* Comment List */
$container -> setContent("Post_Comments", $_REQUEST);
/* Single Blog Post Navigation */
$container -> setContent("Post_Navigation", $_REQUEST);

$main -> setContent("container", $container->get());

$main->close();

?>