<?php

session_start();

require "include/dbms.inc.php";

if (!isset($_POST['priceMin'])) {
	$_POST['priceMin'] = "0";
}

if (!isset($_POST['priceMax'])) {
	$_POST['priceMax'] = "99";
}

/* expand tags in array */
$tags = explode(" ", $_POST['tag']);

$switch = '';
$men_tag = '0';
$women_tag = '0';
$accessories_tag = '0';
$sale_tag = '0';
$best_tag = '0';
$arrivals_tag = '0';

foreach ($tags as $value) {
	switch($value) {
		case 'Men' :
			$men_tag = '1';
			break;
		case 'Women' :
			$women_tag = '1';
			break;
		case 'Accessories' :
			$accessories_tag = '1';
			break;
		case 'On' :
		case 'Sale' :
			$sale_tag = '1';
			break;
		case 'New' :
		case 'Arrivals' :
			$arrivals_tag = '1';
			break;
		case 'Best' :
		case 'Sellers' :
			$best_tag = '1';
			break;
	}
}

$query = "select * from items where FLOOR(price-(price*discount/100)) >= " . $_POST['priceMin'] . " and price <= " . $_POST['priceMax'] . " ";

if ($men_tag == 1)
	$query .= "and sex='M'";

if ($women_tag == 1 && $men_tag == 0) {

	$query .= " and sex='F'";
} else if ($women_tag == 1) {
	$query .= " or sex='F'";
}

if ($accessories_tag == 1)
	$query .= " and category = (select id from categories where cat_name='accessories')";

if ($sale_tag == 1)
	$query .= " and discount > 0";

if ($best_tag == 1)
	$query .= " and items.id in (select item  from purchase group by item order by count(item) desc)";

if ($arrivals_tag == 1)
	$query .= " and id in (select id from items where id > 0 order by id desc)";

if ($_POST['color'] != "") {
	$query .= " and id in (select item from items_images where colour in (" . str_replace("\'", "'", $_POST['color']) . " ) )";
}

if ($_POST['brand']) {
	$query .= " and brand in (select id from brands where brand_name in ( " . str_replace("\'", "'", $_POST['brand']) . " ) )";
}

if($_POST['subcategories'] != ""){
	$query .= " and category in ( select id from categories where cat_name in ( " . str_replace("\'", "'", $_POST['subcategories'])." ) )";
}

$query .= " order by id ";


echo $query; exit;
$result = getResult($query);
$first = 1;

foreach ($result as $key => $value) {
	
	if ($first == 1) {
		$content = '<script src="skins/BeClothing/js/modal_quickshop.js"></script>';
		$first = 0;
	}
	#check disponibilità
	$query_availability = "SELECT DISTINCT item FROM availability WHERE item=" . $value['id'];
	$res_availability = getResult($query_availability);
	#check prodotto hot
	$query_discount = "SELECT discount FROM items WHERE id=" . $value['id'];
	$res_discount = getResult($query_discount);
	$abc = '<a data-toggle="modal" data-id=' . $value['id'] . ' href="#quickshop" class="btn btn-danger btn-sm open-AddBookDialog modal-title">Buy for &#36;' . floor($value['price'] - $value['price'] * $value['discount'] / 100) . '</a>"M';

	$link = "single-item.php?id=" . $value['id'];
	$short_desc = substr($value['description'], 0, 60) . '...';

	$content .= '<div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="item">';

	# HOT or OUT OF STOCK icon
	if (!$res_availability) {
		$content .= '<div class="item-icon">
                             <span class="out-of-stock">OUT OF STOCK</span>
                             </div>';
	} else {
		if ($res_discount[0]['discount']) {
			$content .= '<div class="item-icon">
                                 <span class="hot">HOT</span>
                                 </div>';
		}
	}
	# Item image
	$query_image = "SELECT path FROM items_images WHERE item=" . $value['id'];
	$res_image = getResult($query_image);

	//echo $value['id'];

	$content .= '<div class = "item-image">
                         <a href = "' . $link . '"><img src = "' . $res_image[0]['path'] . '" alt = "" class = "img-responsive"/></a>
                         </div>
                         <div class = "item-details">
                         <h5><a href = "' . $link . '">' . $value['name'] . '</a></h5>
                         <div class = "clearfix"></div>
                         <p>' . $short_desc . '</p>
                         <hr />
                         <div class="pagination-centered">
                         	<a href = "' . $link . '" class = "btn btn-info btn-sm"><i class = "icon-search"></i>View Details</a>
                       	    <a data-toggle="modal" data-id=' . $value['id'] . ' href="#quickshop" class="abc btn btn-danger btn-sm open-AddBookDialog modal-title">Buy for &#36;' . floor($value['price'] - $value['price'] * $value['discount'] / 100) . '</a>
                         </div>
                         <div class = "clearfix"> </div>
                         
                         </div>
                         </div>
                         </div>';
}

if (!$content) {
	echo '';
} else {
	echo $content;
}
?>