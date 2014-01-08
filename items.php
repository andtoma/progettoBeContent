<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";
$main = load_main_html("Items");

$container = new Skinlet("items");

$crumb = '<li><a href="index.php">Home</a> <span class="divider"></span></li>';

switch ($_GET['sex']) {
    case 'M':
    case 'm':
        #titolo e sottotitolo
        $container->setContent("Titolo", "Man");
        $container->setContent("Sottotitolo", "Sottotitolo da uomo...");
        #Breadcrumb
        $crumb.= '<li><a href="items.php&sex=M">Man</a> <span class="divider"></span></li>';
        
        if (!isset($_GET['cat'])) {
            $query_items_m = "SELECT * FROM Items WHERE sex='M'";
        } else {
            $query_items_m = "SELECT * FROM Items WHERE sex='M' AND category=" . $_GET['cat'];
            $query_category = "SELECT cat_name FROM categories WHERE id=" . $_GET['cat'];
            $res_category = getResult($query_category);
            $crumb .= '<li><a href="items.php&sex=M&cat=' . $_GET['cat'] . '">' . $res_category[0]['cat_name'] . '</a> <span class="divider"></span></li>';
        }
        $container->setContent("Breadcrumb", $crumb);
        
        $res_items_m = getResult($query_items_m);
        $container->setContent("ItemsList", $res_items_m);
        break;
    case 'F':
    case 'f':
        #titolo e sottotitolo
        $container->setContent("Titolo", "Woman");
        $container->setContent("Sottotitolo", "Sottotitolo da uomo...");
        #Breadcrumb
        $crumb.= '<li><a href="items.php&sex=F">Woman</a> <span class="divider"></span></li>';
        
        if (!isset($_GET['cat'])) {
            $query_items_f = "SELECT * FROM Items WHERE sex='F'";
        } else {
            $query_items_f = "SELECT * FROM Items WHERE sex='F' AND category=" . $_GET['cat'];
            $query_category = "SELECT cat_name FROM categories WHERE id=" . $_GET['cat'];
            $res_category = getResult($query_category);
            $crumb .= '<li><a href="items.php&sex=F&cat=' . $_GET['cat'] . '">' . $res_category[0]['cat_name'] . '</a> <span class="divider"></span></li>';
        }
        $container->setContent("Breadcrumb", $crumb);
        
        $res_items_f = getResult($query_items_f);
        $container->setContent("ItemsList", $res_items_f);
        break;
    default:
        #titolo e sottotitolo
        $container->setContent("Titolo", "Our products");
        $container->setContent("Sottotitolo", "Sottotitolo di default...");
        #Breadcrumb
        $crumb.= '<li><a href="items.php">Products</a> <span class="divider"></span></li>';
        
        if (!isset($_GET['cat'])) {
            $query_items = "SELECT * FROM Items";
        } else {
            $query_items = "SELECT * FROM Items WHERE category=" . $_GET['cat'];
            $query_category = "SELECT cat_name FROM categories WHERE id=" . $_GET['cat'];
            $res_category = getResult($query_category);
            $crumb .= '<li><a href="items.php&cat=' . $_GET['cat'] . '">' . $res_category[0]['cat_name'] . '</a> <span class="divider"></span></li>';
        }
        $container->setContent("Breadcrumb", $crumb);
        
        $res_items = getResult($query_items);
        $container->setContent("ItemsList", $res_items);
        break;
}


$main->setContent("container", $container->get());
$main->close();
?>