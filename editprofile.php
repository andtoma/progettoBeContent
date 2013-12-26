<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";
$main = load_main_html("Edit Profile");

if (!isset($_SESSION['user'])) {
    header("Location: login.php");
} else {
    $container = new Skinlet("editprofile");
    
    # USER INFO
    $res_userinfo = getResult($query_userinfo);
    $container->setContent("Username", $res_userinfo);
    $container->setContent("Name", $res_userinfo);
    $container->setContent("Surname", $res_userinfo);
    $container->setContent("Email", $res_userinfo);
    $container->setContent("Birth_Date", $res_userinfo);
    if($res_userinfo[0]['sex'] == 'M') $container->setContent ("Male", "checked");
    else $container->setContent ("Female", "checked");
    $container->setContent("Country", $res_userinfo);
    $container->setContent("State", $res_userinfo);
    $container->setContent("City", $res_userinfo);
    $container->setContent("Zip_Code", $res_userinfo);
    $container->setContent("Address", $res_userinfo);
    $container->setContent("Phone", $res_userinfo);
}

$main -> setContent("container", $container->get());
$main->close();
?>