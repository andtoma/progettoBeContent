<?

session_start();

require_once "include/dbms.inc.php";
require_once "include/template2.inc.php";
require_once "include/mainhtml.php";

/*I send via ajax act(in post way) to decide the edit case*/

switch($_POST['act']) {
	case "1" :
		$name=mysql_escape_string($_POST['name']);
		$surname=mysql_escape_string($_POST['surname']);
		$email=mysql_escape_string($_POST['email']);
		$phone=mysql_escape_string($_POST['phone']);
		
		/* user info edit case*/
		$oid = mysql_query("update users set 
		name=	'{$name}',
		surname= '{$surname}'	,
		email='{$email}',
		birth_date='{$_POST['birth_date']}',
		sex='{$_POST['sex']}',
		phone='{$phone}'
		where id='{$_SESSION['user']['id']}'") or die(mysql_error);

		break;

	case "2" :
		/* password edit case*/
		$oid = mysql_query("update users set password=MD5('{$_POST['psw']}') where id='{$_SESSION['user']['id']}'") or die(mysql_error());
		break;

	case "3":		
		$state=mysql_escape_string($_POST['state']);
		$city=mysql_escape_string($_POST['city']);
		$zip_code=mysql_escape_string($_POST['zip_code']);
		$address=mysql_escape_string($_POST['address']);
		/* address edit case*/
		$oid = mysql_query("update users set 
		country='{$_POST['inputCountry']}',
		state='{$state}',
		city='{$city}',
		zip_code='{$zip_code}',
		address='{$address}'
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

