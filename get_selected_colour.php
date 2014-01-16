<?php
require_once "include/dbms.inc.php";
/*if someone type this script url will be redirected*/
if (!isset($_POST['flag'])) {
	header('Location:index.php');

} else {
	$colours = "";
	$sel_colour = getSingleResult("select colour from items_images where id='{$_POST['image_sel']}'", "colour");
	$items_colours = getResult("select distinct colour from items_images where item='{$_POST['item_id']}'");
	foreach ($items_colours as $key => $value) {
		if (!strcmp($sel_colour, $value['colour'])) {
			$colours .= "<option selected>" . $sel_colour . "</option>";

		} else {
			$colours .= "<option >" . $value['colour'] . "</option>";
		}
	}
	echo $colours;
}
?>

