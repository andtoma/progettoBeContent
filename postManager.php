<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/mainhtml.php";
$main = load_main_html("Blog Manager");

$container = new Skinlet("postManager");
switch($_REQUEST['action']) {
	case "new" :
		$container -> setContent("maintitle", "Create New Blog Post");
		$container -> setContent("script", "createBlogPost.php");
		$container -> setContent("blogtitle", "");
		$container -> setContent("textarea", "");
		$container -> setContent("post_id", "");
		break;
	case 'edit':
		$container -> setContent("maintitle", "Edit Blog Post");
		$container -> setContent("script", "updateBlogPost.php");
		$container -> setContent("blogtitle", 'value="'.$_REQUEST['title'].'"');
		$container -> setContent("textarea", $_REQUEST['text']);
		$container -> setContent("post_id","".$_REQUEST['id']."");
}
$main -> setContent("container", $container -> get());
$main -> close();
?>