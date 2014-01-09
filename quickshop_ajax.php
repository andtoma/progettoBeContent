<?

require_once "include/dbms.inc.php";

switch($_POST['type']) {
	/*I get the name of the item*/
	case "name" :
		echo getSingleResult("select * from items where id='{$_POST['id']}' ", "name");
		break;

	case "colour" :
		/*I take the colour available for the selected item, if the product is out of stock I return NULL*/
		$data = getResult("select colour  from availability where item ='{$_POST['id']}'");
		if (!$data ) {
			//$colours = "<option value='' disabled selected>Sorry, this item is out of stock</option>";
			echo "NULL";
		} else {
			$colours = "<option value='' disabled selected>Select a colour</option>";
			foreach ($data as $key => $value) {
				$colours .= "<option>" . $value['colour'] . "</option>";
			}
					echo $colours;
			
		}
		break;

	case "size" :
		/*I take the size available for the selected colour of the item, there must be at least 1 available size*/
		$data = getResult("select size  from availability where item ='{$_POST['id']}' and colour= '{$_POST['colour']}'");
		$size = "<option value='' disabled selected>Select a size</option>";
		foreach ($data as $key => $value) {
			$size .= "<option>" . $value['size'] . "</option>";
		}
		echo $size;
		break;

	case "quantity" :
		/*I take the quantity N of the selected colour and size of the item, and with a cycle from 1 to N i return a select with those values*/
		$quantity = "<option value='' disabled selected>Select the quantity</option>";
		$max = getSingleResult("select quantity  from availability where item ='{$_POST['id']}' and colour= '{$_POST['colour']}' and size='{$_POST['size']}' ", 'quantity');
		for ($i = 1; $i <= $max; $i++) {
			$quantity .= "<option>" . $i . "</option>";
		}
		echo $quantity;
}
?>