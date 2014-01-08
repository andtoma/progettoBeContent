<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";
<<<<<<< HEAD

$main = load_main_html("Blog");

$container = new Skinlet("blog");
/* Blog Page Placeholders */
$container -> setContent("Post_List", $_GET['page']);
$container -> setContent("Blog_Search",0);
$container -> setContent("Recent_Post", 0);	
=======
$main = load_main_html("Blog");

$container = new Skinlet("blog");

>>>>>>> a21dc4008cd838ccb196ac49bbd5f9869c99852a
$main -> setContent("container", $container->get());
$main->close();
?>
