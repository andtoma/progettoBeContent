<?php

session_start();

require_once "include/template2.inc.php";
require_once "include/dbms.inc.php";
require_once "include/query_collection.php";
require_once "include/mainhtml.php";
require_once "include/auth.inc.php";


updateSessionCookie();

$main = load_main_html("Items");

$container = new Skinlet("items");

$x_pag = 12;
#numero di elementi da mostrare per pagina
$pag = $_GET['pag'];
if (!$pag)
	$pag = 1;
$first = ($pag - 1) * $x_pag;

switch ($_GET['sex']) {
	case 'M' :
	case 'm' :
		$sex = "('M')";
		break;
	case 'F' :
	case 'f' :
		$sex = "('F')";
		break;
	default :
		$sex = "('M','F')";
		break;
}

/*2 parametri possibili, uno è il sesso, l'altro è uno tra cateogoria, brand e special*/
if (isset($_GET['cat'])) {
	$query_items .= " select * from items where category='{$_GET['cat']}' and sex in {$sex} LIMIT {$first}, {$x_pag}";
} else if (isset($_GET['brand'])) {
	$query_items .= " select * from items where brand=(select id from brands where brand_name='{$_GET['brand']}') and sex in {$sex} LIMIT {$first}, {$x_pag}";
} else if (isset($_GET['tag'])) {

	switch($_GET['tag']) {
		case "new" :
			$query_items .= "select * from items where sex in {$sex} order by id desc LIMIT {$first}, {$x_pag}  ";
			break;

		case "onsale" :
			$query_items .= "select * from items where discount>0 and  sex in {$sex} order by discount desc LIMIT {$first}, {$x_pag}  ";

			break;
		case "best_sellers" :
			$query_items .= "select distinct I.*, count(item) as sell from items I join purchase P where I.id=P.item and sex in {$sex} group by P.item order by sell desc LIMIT {$first}, {$x_pag} ";
			break;
	}
}
else{
	$query_items="select * from items where sex in {$sex} LIMIT {$first}, {$x_pag}";
}
$res_items = getResult($query_items);
$container -> setContent("ItemsList", $res_items);
$container -> setContent("searchTagsContainer", $_GET);
$main -> setContent("container", $container -> get());
$main -> close();
?>