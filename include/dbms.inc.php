<?php

define("CONN_DBMS", 1001);
define("CONN_DB_NAME", 1101);
define("CONN_OK", 0);

Class Connection {

	var $host, $user, $pass, $db, $active = false, $errno = 0;

	function Connection($host, $user, $pass, $db) {

		$this -> host = $host;
		$this -> user = $user;
		$this -> pass = $pass;
		$this -> db = $db;
	}

	function connect() {

		if (!$this -> active) {

			$conn = mysql_pconnect($this -> host, $this -> user, $this -> pass);

			if ($conn) {
				$sel = mysql_select_db($this -> db);

				if ($sel) {

					return true;

				} else {

					$this -> errno = CONN_DB_NAME;
					return false;
				}
			} else {

				$this -> errno = CONN_DBMS;
				return false;

			}
		}
	}

	function error() {
		switch ($this->errno) {
			case CONN_DB_NAME :
				echo "wrong DB name!";
				break;
			case CONN_DBMS :
				echo "wrong connection!";
				break;
			case CONN_OK :
				echo "ok!";
				break;

			default :
				echo "unknown error!";
				break;
		}
	}

}

$mydb = new Connection("localhost", "root", "root", "progettotdw");
$mydb -> connect();

function getResult($query) {
	$oid = mysql_query($query) or die(mysql_error());

	do {
		$data = mysql_fetch_assoc($oid);
		if ($data) {
			$content[] = $data;
		}
	} while ($data);

	return $content;
}

/*this function must be called only if the query contains a "where id=something", it is designed where we want a column of single row*/
function getSingleResult($query, $column) {
	$oid = mysql_query($query) or die(mysql_error());
	if (mysql_num_rows($oid) <> 1) {
		return "error";
	} else {
		$data = mysql_fetch_assoc($oid);
		return $data[$column];
	}
}

/*this function returns true if exist at least a row in the query result*/
function hasResult($query) {

	$oid = mysql_query($query) or die(mysql_error());
	return (mysql_num_rows($oid) != 0);

}
?>
