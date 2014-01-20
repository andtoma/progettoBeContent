<?
require_once "include/template2.inc.php";
require_once "include/dbms.inc.php";
require_once "include/mainhtml.php";

/*if user comes here typing add_user he will be redirected*/
if(!isset($_POST['reg_button']) ){
	header("Location: index.php");
}
/*anti-injection*/
$username=mysql_escape_string($_POST['username']);
$name=mysql_escape_string($_POST['name']);
$surname=mysql_escape_string($_POST['surname']);
$email=mysql_escape_string($_POST['email']);
$password=MD5($_POST['password']);
$sex=mysql_escape_string($_POST['sex']);

/*insert*/
$insert_user=mysql_query("insert into users(username,name,surname,email,password,sex,birth_date) values(
'{$username}','{$name}','{$surname}','{$email}','{$password}','{$sex}','{$_POST['birth_date']}')") or die(mysql_error());


$main = load_main_html("Login");
$container = new Skinlet("login");
$container -> setContent("alert", 3);
$main -> setContent("container", $container -> get());
$main->close();


?>