<?

session_start();

require_once "include/dbms.inc.php";
require_once "include/template2.inc.php";
require_once "include/mainhtml.php";
$q = mysql_query("select country,state,city,address,zip_code from users where id='{$_SESSION['user']['id']}'") or die(mysql_error());
$data = mysql_fetch_assoc($q);

$address['country']=$data['country'];
$address['state']=$data['state'];
$address['city']=$data['city'];
$address['zip_code']=$data['zip_code'];
$address['address']=$data['address'];

if($address['country']=="" || $address['state']=="" || $address['city']=="" || $address['zip_code']=="" || $address['address']==""){
	echo "NULL";
}
else{
	echo json_encode($address);
}

?>

