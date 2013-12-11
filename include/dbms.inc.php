<?php


Class DB {

	var

	$errorno = 0,

	$oid,

	$buffer;



	function DB($host, $user, $pass, $name) {



		$connection = mysql_pconnect($host,$user,$pass);



		if ($connection) {



			if (mysql_select_db($name)) {



				return true;

			} else {

				$this->errorno = 1; // DATABASE SELECT

				return false;

			}

		} else {

				

			$this->errorno = 2; // DATABASE CONNECTION

			return false;

		}

	}



	function getError() {



		return $this->errorno;

	}



	function getErrorMessage() {



		switch ($this->errorno) {

			case 1: return ERROR_1;

			break;

				

			case 2: return ERROR_2;

			break;

				

			case 3:



				$message = ERROR_3;



				return $message.": ".mysql_error();

				break;

					

			default: return GENERIC_ERROR;

			break;

		}



	}



	function error() {



		return $this->errorno != 0;

	}



	function query($query) {



		$this->oid = mysql_query($query);



		if ($this->oid) {

			return true;

		} else {

				
			if (mysql_errno() == 1062) {
				$this->errorno = 4;
			} else {

				$this->errorno = 3;

			}
			return false;

		}

	}



	function getResult() {



		do {

			$data = mysql_fetch_assoc($this->oid);

				

			if ($data) {

				$this->buffer[] = $data;

			}

		} while ($data);



		if (count($this->buffer) == 0) {

			return false;

		} else {

			return $this->buffer;

		}



	}



}





$database = new DB("localhost", "root", "root", "progettotdw");


?>