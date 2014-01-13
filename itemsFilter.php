<?php

session_start();

require "include/dbms.inc.php";

if(!isset($_POST['priceMin'])){
	$_POST['priceMin'] = "0";
}

if(!isset($_POST['priceMax'])){
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

$switch = $men_tag . $women_tag . $accessories_tag . $sale_tag . $arrivals_tag . $best_tag;


switch($switch) {
	case '111111' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != "") {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(*) desc, items.id desc, items.discount desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.category=6 and items.discount >= 0 group by items.id and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by count(items.*) desc, items.id desc, items.discount desc limit 9");
			}

		} else {
			if ($_POST['color'] != "") {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc, items.discount desc limit 9");
			} else {
				//echo "select items.* from items, purchase where items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc, items.discount desc limit 9";
				$query = getResult("select items.* from items, purchase where items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc, items.discount desc limit 9");
			}

		}

		break;
	case '111110' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != "") {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc, items.discount desc limit 9");
			} else {
				$query = getResult('select items.* from items, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by items.id desc, items.discount desc limit 9');
			}

		} else {
			if ($_POST['color'] != "") {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and " . $_POST['priceMax'] . " order by items.id desc, items.discount desc limit 9");
			} else {

				$query = getResult('select * from items where category=6 and discount >= 0 and price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by id desc, discount desc limit 9');
			}
		}
		break;
	case '111101' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != "") {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc");
			} else {
				$query = getResult('select items.* from items, purchase, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc, items.discount desc');
			}

		} else {
			if ($_POST['color'] != "") {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc");
			} else {
				$query = getResult('select items.* from items, purchase where items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc, items.discount desc');
			}

		}
		break;
	case '111100' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult('select items.* from items, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by items.discount desc');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult('select * from items where category=6 and discount >= 0 and price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by discount desc');
			}

		}
		break;
	case '111011' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult('select items.* from items, purchase, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc, items.id desc limit 9');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult('select items.* from items, purchase where items.id = purchase.item and items.category=6 and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc, items.id desc limit 9');
			}

		}
		break;
	case '111010' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult('select items.* from items, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by items.id desc limit 9');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult('select * from items where category=6 and discount >= 0 and price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by id desc limit 9');
			}

		}
		break;
	case '111001' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult('select items.* from items, purchase, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult('select items.* from items, purchase where items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc');
			}

		}
		break;
	case '111000' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select *.items from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				$query = getResult('select *.items from items, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . '');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				$query = getResult('select * from items where category=6 and discount >= 0 and price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . '');
			}

		}
		break;
	case '110111' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brand.id and items.discount >= 0 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			} else {
				$query = getResult('select items.* from items, purchase, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brand.id and items.discount >= 0 and items.id = purchase.item and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			} else {
				$query = getResult('select items.* from items, purchase where items.discount >= 0 and items.id = purchase.item and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9');
			}

		}
		break;
	case '110110' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc, items.discount desc limit 9");
			} else {
				$query = getResult('select items.* from items, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by items.id desc, items.discount desc limit 9');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc, items.discount desc limit 9");
			} else {
				$query = getResult('select * from items where discount >= 0 and price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by id desc, discount desc limit 9');
			}

		}
		break;
	case '110101' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc");
			} else {
				$query = getResult('select items.* from items, purchase, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.discount >= 0 and items.id = purchase.item and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc, items.discount desc');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc");
			} else {
				$query = getResult('select items.* from items, purchase where items.discount >= 0 and items.id = purchase.item and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc, items.discount desc');
			}

		}
		break;
	case '110100' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult('select items.* from items, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by items.discount desc');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult('select * from items where discount >= 0 and price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by discount desc');
			}

		}
		break;
	case '110011' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc");
			} else {
				$query = getResult('select items.* from items, purchase, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.id = purchase.item and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc, items.discount desc');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc");
			} else {
				$query = getResult('select items.* from items, purchase where items.id = purchase.item and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc, items.discount desc');
			}

		}
		break;

	case '110010' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult('select items.* from items, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by items.discount desc');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult('select * from items where items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by items.discount desc');
			}

		}
		break;
	case '110001' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult('select items.* from items, purchase, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc, items.id desc limit 9');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult('select items.* from items, purchase where items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc, items.id desc limit 9');
			}

		}
		break;
	case '110000' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult('select items.* from items, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by items.id desc limit 9');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where  items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult('select * from items where discount >= 0 and price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' order by id desc limit 9');
			}

		}
		break;
	case '101111' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult('select items.* from items, purchase where items.id = purchase.item and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . ' group by items.id order by count(items.*) desc');
			}

		}
		break;
	case '101110' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				$query = getResult('select items.* from items, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ') and items.brand = brands.id and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . '');
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				$query = getResult('select * from items where discount >= 0 and price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . '');
			}

		}
		break;
	case '101101' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			}

		} else {
			if ($_POST['color'] != "") {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='M' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			}

		}
		break;
	case '101100' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc, items.discount desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc, items.discount desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc, items.discount desc limit 9");
			} else {
				$query = getResult("select * from items where items.sex='M' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc, items.discount desc limit 9");
			}

		}
		break;
	case '101011' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='M' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			}

		}
		break;
	case '101010' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult("select * from items where sex='M' and category=6 and discount >= 0 and price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by discount desc");
			}

		}
		break;
	case '101001' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='M' and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			}

		}
		break;
	case '101000' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select * from items where sex='M' and category=6 and discount >= 0 and price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by id desc limit 9");
			}

		}
		break;
	case '100111' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.id = purchase.id and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.id = purchase.id and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.discount >= 0 and items.id = purchase.id and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.discount >= 0 and items.id = purchase.id and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			}

		}
		break;
	case '100110' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc, items.discount desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc, items.discount desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc, items.discount desc limit 9");
			} else {
				$query = getResult("select * from items where discount >= 0 and price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by id desc, discount desc limit 9");
			}

		}
		break;
	case '100101' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.discount >= 0 and items.id = purchase.order and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.discount >= 0 and items.id = purchase.order and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.discount >= 0 and items.id = purchase.order and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='M' and items.discount >= 0 and items.id = purchase.order and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			}

		}
		break;
	case '100100' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult("select * from items where sex='M' and discount >= 0 and price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by discount desc");
			}

		}

		break;
	case '100011' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='M' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			}

		}
		break;
	case '100010' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select * from items where sex='M' and discount >= 0 and price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			}

		}
		break;
	case '100001' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='M' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			}

		}
		break;
	case '100000' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='M' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='M' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				//echo "select * from items where sex='M' and discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "";
				$query = getResult("select * from items where sex='M' and discount >= 0 and price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			}

		}
		break;
	case '011111' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='F' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			}

		}

		break;
	case '011110' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id, items.discount desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id, items.discount desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id, items.discount desc limit 9");
			} else {
				$query = getResult("select * from items where sex='F' and category=6 and discount >= 0 and price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by id, discount desc limit 9");
			}

		}
		break;
	case '011101' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brand.id and items.sex='F' and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and and items.sex='F' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='F' and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			}

		}
		break;
	case '011100' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brand.id and sex='F' and category=6 and discount >= 0 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by discount desc");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brand.id and sex='F' and category=6 and discount >= 0 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by discount desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult("select * from items where sex='F' and category=6 and discount >= 0 and price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by discount desc");
			}

		}
		break;
	case '011011' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='F' and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='F' and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			}

		}
		break;
	case '011010' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select * from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select * from items where sex='F' and category=6 and discount >= 0 and price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by id desc limit 9");
			}

		}
		break;
	case '011001' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and  items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and  items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='F' and  items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='F' and  items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			}

		}
		break;
	case '011000' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and  items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and  items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='F' and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				$query = getResult("select * from items where sex='F' and category=6 and discount >= 0 and price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			}

		}

		break;
	case '010111' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='F' and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='F' and items.discount >= 0 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, items.discount desc, count(items.*) desc limit 9");
			}

		}
		break;
	case '010110' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and  items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id, items.discount desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and  items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id, items.discount desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id, items.discount desc limit 9");
			} else {
				$query = getResult("select * from items where items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id, items.discount desc limit 9");
			}

		}

		break;
	case '010101' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*)");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*)");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ")  and items_images.item = items.id and items.sex='F' and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*)");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='F' and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*)");
			}

		}
		break;

	case '010100' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brand.id and items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brand.id and items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult("select * from items where sex='F' and discount >= 0 and price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			}

		}
		break;
	case '010011' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.sex='F' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='F' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			}

		}
		break;
	case '010010' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.brand_name and items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.brand_name and items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select * from items where items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			}

		}
		break;
	case '010001' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.brand_name and items.sex='F' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.brand_name and items.sex='F' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.sex='F' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase where items.sex='F' and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			}

		}
		break;
	case '010000' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select distinct items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				$query = getResult("select distinct items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				$query = getResult("select * from items where items.sex='F' and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			}

		}
		break;
	case '001111' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc, items.id desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.category=6 and items.discount >= 0 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc, items.id desc limit 9");
			}

		}
		break;
	case '001110' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount, items.id desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount, items.id desc limit 9");
			} else {
				$query = getResult("select * from items where items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount, items.id desc limit 9");
			}

		}
		break;
	case '001101' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase where items.category=6 and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc");
			}

		}
		break;
	case '001100' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult("select * from items where items.category=6 and discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			}

		}
		break;
	case '001011' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.id desc, count(items.*) desc limit 9");
			}

		}
		break;
	case '001010' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			}

		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select * from items where items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			}

		}
		break;
	case '001001' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			}
		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase where items.category=6 and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			}
		}
		break;
	case '001000' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			}
		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_colours where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			} else {
				$query = getResult("select * from items where items.category=6 and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			}
		}
		break;
	case '000111' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc, items.id desc limit 9");
			}
		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by items.discount desc, count(items.*) desc, items.id desc limit 9");
			}
		}
		break;
	case '000110' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc, items.id desc limit 9");
			}
		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc, items.id desc limit 9");
			} else {
				$query = getResult("select * from items where items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc, id desc limit 9");
			}
		}
		break;
	case '000101' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc");
			}
		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.discount >= 0 and items.id = purchase.item and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc");
			} else {
				$query = getResult("select items.* from items, purchase where items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.discount desc");
			}

		}
		break;

	case '000100' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			}
		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_colour where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			} else {
				$query = getResult("select * from items where items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.discount desc");
			}
		}
		break;
	case '000011' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.date desc limit 9");
			}
		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.id = purchase.item group by items.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by count(items.*) desc, items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, purchase where items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc, items.id desc limit 9");
			}
		}
		break;
	case '000010' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select items.* from items, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			}
		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			} else {
				$query = getResult("select * from items and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " order by items.id desc limit 9");
			}
		}
		break;
	case '000001' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, brands, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase, brands where brands.brand_name in (" . str_replace("\'", "'", $_POST['brand']) . ") and items.brand = brands.id and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(*) desc");
			}
		} else {
			if ($_POST['color'] != '') {
				$query = getResult("select items.* from items, purchase, items_images where items_images.colour in (" . str_replace("\'", "'", $_POST['color']) . ") and items_images.item = items.id and items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			} else {
				$query = getResult("select items.* from items, purchase where items.id = purchase.item and items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . " group by items.id order by count(items.*) desc");
			}
		}
		break;
	case '000000' :
		if ($_POST['brand'] != "") {
			if ($_POST['color'] != "") {
				$query = getResult('select items.* from items, brands, items_images where items_images.colour in (' . str_replace("\'", "'", $_POST['color']) . ') and items_images.item = items.id and brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ' ) and items.brand = brands.id and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax']);
			} else {
				
				$query = getResult('select items.* from items, brands where brands.brand_name in (' . str_replace("\'", "'", $_POST['brand']) . ' ) and items.brand = brands.id and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . '');
			}
		} else {
			if ($_POST['color'] != "") {
				
				$query = getResult('select items.* from items, items_images where items_images.colour in ( ' . str_replace("\'", "'", $_POST['color']) . ' ) and items_images.item = items.id and items.discount >= 0 and items.price between ' . $_POST['priceMin'] . ' and  ' . $_POST['priceMax'] . '');
			} else {
				
				$query = getResult("select * from items where items.discount >= 0 and items.price between " . $_POST['priceMin'] . " and  " . $_POST['priceMax'] . "");
			}
		}
		break;
}

foreach ($query as $key => $value) {
	#check disponibilità
	$query_availability = "SELECT DISTINCT item FROM availability WHERE item=" . $value['id'];
	$res_availability = getResult($query_availability);
	#check prodotto hot
	$query_discount = "SELECT discount FROM items WHERE id=" . $value['id'];
	$res_discount = getResult($query_discount);

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
                         	<a href = "' . $link . '" class = "btn btn-danger btn-sm"><i class = "icon-shopping-cart"></i> Buy for &#36;' . $value['price'] . '</a>
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