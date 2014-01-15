<?php

session_start();

require "include/template2.inc.php";
require "include/dbms.inc.php";
require "include/query_collection.php";
require "include/mainhtml.php";
$main = load_main_html("Items");

$container = new Skinlet("items");
$quickshop = new Skinlet("quickshop");

$x_pag = 9; #numero di elementi da mostrare per pagina
$pag = $_GET['pag'];
if (!$pag)
    $pag = 1;
$first = ($pag - 1) * $x_pag;

switch ($_GET['sex']) {
    case 'M':
    case 'm':
        if (!isset($_GET['cat'])) {
            $query_items = "SELECT * FROM items WHERE sex='M' LIMIT {$first}, {$x_pag}";
        } else {
            $query_items = "SELECT * FROM items WHERE sex='M' AND category={$_GET['cat']} LIMIT {$first}, {$x_pag}";
        }
        break;
    case 'F':
    case 'f':
        if (!isset($_GET['cat'])) {
            $query_items = "SELECT * FROM items WHERE sex='F' LIMIT {$first}, {$x_pag}";
        } else {
            $query_items = "SELECT * FROM items WHERE sex='F' AND category={$_GET['cat']} LIMIT {$first}, {$x_pag}";
        }
        break;
    default:
        if (!isset($_GET['cat'])) {
            $query_items = "SELECT * FROM items LIMIT {$first}, {$x_pag}";
        } else {
            $query_items = "SELECT * FROM items WHERE category={$_GET['cat']} LIMIT {$first}, {$x_pag}";
        }
        break;
}

$res_items = getResult($query_items);
$container->setContent("ItemsList", $res_items);
$container->setContent("searchTagsContainer", $_GET);
$main->setContent("quickshop", $quickshop->get());
$main->setContent("container", $container->get());
$main->close();
?>