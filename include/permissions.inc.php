<?php

session_start();

require_once "include/auth.inc.php";

/*************************************************************************************************
 this function is used to check if the users groups is one of the group that has
 the control panel access, if so it returns true
 *********************************************************************************************** */

function match_verifier($data1, $data2) {
	foreach ($data1 as $key => $value) {
		if (in_array($value, $data2)) {
			return true;
		}
	}
	return false;
}

/*******************************************************************************************************
 this procedure checks if the user has the permissions passed as argument, returns true if this happens
*********************************************************************************************************/
function check_permission($service) {

	/* groups with the service */
	$q1 = ("select grp from services_groups where service=(select id from services where
name='{$service}')");

	$data1 = getResult($q1);

	/*user group*/
	$q2 = ("select grp from users_groups where user ='{$_SESSION['user']['id']}'");

	$data2 = getResult($q2);

	/*looking for common elements in the 2 arrays */

	return match_verifier($data1, $data2);

}

?>