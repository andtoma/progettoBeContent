<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";

/* Cut Text for Preview */
function softTrim($text, $count, $wrapaText){

    if(strlen($text)>$count){
        preg_match('/^.{0,' . $count . '}(?:.*?)\b/siu', $text, $matches);
        $text = $matches[0];
    }else{
        $wrapText = '';
    }
    return $text . $wrapText;
}

$main = load_main_html("Blog");

$container = new Skinlet("blog");
/* Blog Page Placeholders */
$container -> setContent("Post_List", $_GET['page']);
$container -> setContent("Recent_Post", 0);	
$main -> setContent("container", $container->get());
$main->close();
?>
