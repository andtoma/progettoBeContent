<?php
require_once "include/dbms.inc.php";

switch($_POST['flag']) {
	case 1 :
		$sel_colour = getSingleResult("select colour from items_images where id='{$_POST['image_sel']}'", "colour");
		$data = getResult("select size  from availability where item ='{$_POST['item_id']}' and colour= '{$sel_colour}'");
		foreach ($data as $key => $value) {
			$size .= "<option>" . $value['size'] . "</option>";
		}
		echo $size;
		break;

	case 2 :
		$data = getResult("select size  from availability where item ='{$_POST['item_id']}' and colour= '{$_POST['col_sel']}'");
		foreach ($data as $key => $value) {
			$size .= "<option>" . $value['size'] . "</option>";
		}
		echo $size;
		break;
	default :
		/*if someone type this script url will be redirected*/
		header('Location:index.php');
		break;
}
?>