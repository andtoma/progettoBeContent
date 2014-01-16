<?php

session_start();

require_once "include/dbms.inc.php";
require_once "include/template2.inc.php";
require_once "include/mainhtml.php";

/*I send via ajax act(in post way) to decide the edit case*/

switch($_POST['act']) {
	case "1" :
		/* user info edit case*/
		$oid = mysql_query("update users set 
		name=	'{$_POST['name']}',
		surname= '{$_POST['surname']}'	,
		email='{$_POST['email']}',
		birth_date='{$_POST['birth_date']}',
		sex='{$_POST['sex']}',
		phone='{$_POST['phone']}'
		where id='{$_SESSION['user']['id']}'") or die(mysql_error);

		break;

	case "2" :
		/* password edit case*/
		$oid = mysql_query("update users set password=MD5('{$_POST['psw']}') where id='{$_SESSION['user']['id']}'") or die(mysql_error());
		break;

	case "3":		
		/* address edit case*/
		$oid = mysql_query("update users set 
		country='{$_POST['inputCountry']}',
		state='{$_POST['state']}',
		city='{$_POST['city']}',
		zip_code='{$_POST['zip_code']}',
		address='{$_POST['address']}'
		where id='{$_SESSION['user']['id']}'") or die(mysql_error);
		break;

	default :
		$main = load_main_html("Homepage");
		$error = new Skinlet("404");
		$main -> setContent("container", $error -> get());
		$main -> close();
		break;
}
?>

