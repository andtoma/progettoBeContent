<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";
$main = load_main_html("Items");

$container = new Skinlet("items");
$quickshop = new Skinlet("quickshop");

$crumb = '<li><a href="index.php">Home</a> <span class="divider"></span></li>';

$link = "items.php";

$x_pag = 9; #numero di elementi da mostrare per pagina
$pag = $_GET['pag'];
if (!$pag)
    $pag = 1;
$first = ($pag - 1) * $x_pag;

switch ($_GET['sex']) {
    case 'M':
    case 'm':
        $link .= "?sex=M";
        #titolo e sottotitolo
        $container->setContent("Titolo", "Man");
        $container->setContent("Sottotitolo", "Sottotitolo da uomo...");
        #Breadcrumb
        $crumb.= "<li><a href=\"{$link}\">Man</a> <span class=\"divider\"></span></li>";
        if (!isset($_GET['cat'])) {
            $all_rows = count(getResult("SELECT id FROM items WHERE sex='M'"));
            $query_items = "SELECT * FROM items WHERE sex='M' LIMIT {$first}, {$x_pag}";
        } else {
            $link .= "&cat={$_GET['cat']}";
            $all_rows = count(getResult("SELECT id FROM items WHERE sex='M' AND category={$_GET['cat']}"));
            $query_items = "SELECT * FROM items WHERE sex='M' AND category={$_GET['cat']} LIMIT {$first}, {$x_pag}";
            $res_category = getResult($query_category);
            $crumb .= "<li><a href=\"{$link}\">{$res_category[0]['cat_name']}</a><span class=\"divider\"></span></li>";
        }
        $container->setContent("Icon", "icon-male");
        break;
        
    case 'F':
    case 'f':
        $link .= "?sex=F";
        #titolo e sottotitolo
        $container->setContent("Titolo", "Woman");
        $container->setContent("Sottotitolo", "Sottotitolo da donna...");
        #Breadcrumb
        $crumb.= "<li><a href=\"{$link}\">Woman</a> <span class=\"divider\"></span></li>";
        if (!isset($_GET['cat'])) {
            $all_rows = count(getResult("SELECT id FROM items WHERE sex='F'"));
            $query_items = "SELECT * FROM items WHERE sex='F' LIMIT {$first}, {$x_pag}";
        } else {
            $link .= "&cat={$_GET['cat']}";
            $all_rows = count(getResult("SELECT id FROM items WHERE sex='F' AND category={$_GET['cat']}"));
            $query_items = "SELECT * FROM items WHERE sex='F' AND category={$_GET['cat']} LIMIT {$first}, {$x_pag}";
            $res_category = getResult($query_category);
            $crumb .= "<li><a href=\"{$link}\">{$res_category[0]['cat_name']}</a><span class=\"divider\"></span></li>";
        }
        $container->setContent("Icon", "icon-female");
        break;
        
    default:
        #titolo e sottotitolo
        $container->setContent("Titolo", "Our products");
        $container->setContent("Sottotitolo", "Sottotitolo di default...");
        #Breadcrumb
        $crumb.= "<li><a href=\"{$link}\">Products</a> <span class=\"divider\"></span></li>";
        if (!isset($_GET['cat'])) {
            $link .= "?";
            $all_rows = count(getResult("SELECT id FROM items"));
            $query_items = "SELECT * FROM items LIMIT {$first}, {$x_pag}";
        } else {
            $link .= "?cat={$_GET['cat']}&";
            $all_rows = count(getResult("SELECT id FROM items WHERE category={$_GET['cat']}"));
            $query_items = "SELECT * FROM items WHERE category={$_GET['cat']} LIMIT {$first}, {$x_pag}";
            $res_category = getResult($query_category);
            $crumb .= "<li><a href=\"{$link}\">{$res_category[0]['cat_name']}</a><span class=\"divider\"></span></li>";
        }
        $container->setContent("Icon", "icon-group");
        break;
}

$res_items = getResult($query_items);
$container->setContent("ItemsList", $res_items);

# Pagination
$all_pages = ceil($all_rows / $x_pag);
if ($all_pages > 1) {
    if ($pag > 1) {
        $container->setContent("PaginationPrev", "<li><a href=\"{$link}&pag=" . ($pag - 1) . "\">&laquo; Previous Page</a></li>");
    }
    if ($all_pages > $pag) {
        $container->setContent("PaginationNext", "<li><a href=\"{$link}&pag=" . ($pag + 1) . "\">Next Page &raquo;</a></li>");
    }
}

$container->setContent("Breadcrumb", $crumb);

$main->setContent("quickshop", $quickshop->get());
$main->setContent("container", $container->get());
$main->close();
?>