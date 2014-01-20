<?php

require_once "include/dbms.inc.php";

session_start();

function login($main) {
	/* use is in login.php, I load the login page*/
	if (!isset($_POST["email"]) && !isset($_POST["password"])) {
		$container = new Skinlet("login");
		$container -> setContent("alert", 0);
		$main -> setContent("container", $container -> get());
		return;
	} else {
		/* user has filled login form pressing sign in*/
		$email = mysql_escape_string($_POST['email']);	//anti injection

		$password = MD5($_POST['password']);

		/*check if data are correct*/
		$login_result = mysql_query("SELECT id, name,username  FROM users  where email = '{$email}' AND password = '{$password}'");

		if (mysql_num_rows($login_result) == 0) {
			/* data are wrong */
			$container = new Skinlet("login");
			$container -> setContent("alert", 1);
			$main -> setContent("container", $container -> get());
			return;
		} else {
			/*data are rigth, check if he's been banned*/
			$data = mysql_fetch_assoc($login_result);

			if (!hasResult("select * from ban where user='{$data['id']}'")) {
				/* user is not in the ban list, he can access, I put him in session */
				$_SESSION['user'] = $data;

				/*if user has clicked remember me*/
				if ($_POST['remember_me'] == "on") {
					$_SESSION['remember_me'] = true;
					setcookie(session_name(), session_id(), mktime(0, 0, 0, 12, 31, 2099));
				} else {
					/*default session will expiry after 1 day(24h) of inactivity*/
					$lifetime = 86400;
					setcookie(session_name(), session_id(), time() + $lifetime);
				}

				$container = new Skinlet("login");
				$main -> setContent("container", $container -> get());
				header("Location: index.php");
				return;

			} else {
				/*user is banned, reload the login form with the ban message*/
				$container = new Skinlet("login");
				$container -> setContent("alert", 2);
				$main -> setContent("container", $container -> get());
				return;

			}

		}
	}
}

/* *
 * when called if user is in session update the session expiration to 24h of inactivity(if he didn't check "remember me")
 * */
function updateSessionCookie() {
	if (isset($_SESSION['user']) && !isset($_SESSION['remember_me'])) {
		$lifetime = 86400;
		setcookie(session_name(), session_id(), time() + $lifetime);
	}

}
?>