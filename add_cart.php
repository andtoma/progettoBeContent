<?
session_start();

require_once "include/dbms.inc.php";
require_once "include/template2.inc.php";
require_once "include/mainhtml.php";

if (isset($_POST['add-cart'])) {

	switch (($_GET['id'])) {
		case 1 :
			/*item is not available, user request an email when the item will be available again*/

			$oid = mysql_query("insert into availability_requests(item,email) values('{$_POST['id']}','{$_POST['email']}')") or die(mysql_error());
			header('Location:account.php?id=3');
			break;
		case 2 :
			/*user would add the item into cart*/

			/*NOTE, user can already have the item in the cart and he can try to insert it again, to avoid this I check if already exists and:
			 * if no I make the insert
			 * if yes I update the quantity*/
			$data = getResult("select * from cart where user='{$_SESSION['user']['id']}' and item='{$_POST['id']}' and colour='{$_POST['colour']}'and size='{$_POST['size']}'");
			if (!$data) {
				$oid = mysql_query("insert into cart(user,item,colour,size,quantity) values('{$_SESSION['user']['id']}','{$_POST['id']}','{$_POST['colour']}','{$_POST['size']}','{$_POST['quantity']}')") or die(mysql_error());
			} else {
				$oid = mysql_query("update  cart set quantity=(quantity + {$_POST['quantity']}) where user='{$_SESSION['user']['id']}'and item='{$_POST['id']}'and colour='{$_POST['colour']}' and size='{$_POST['size']}'") or die(mysql_error());
			}

			header('Location:account.php?id=2');
			break;
	}
} else {
	/*user just type add_cart.php?..something*/
	$main = load_main_html("Homepage");
	$error = new Skinlet("404");
	$main -> setContent("container", $error -> get());
	$main -> close();
}
?>

