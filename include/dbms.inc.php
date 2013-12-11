<?php

<<<<<<< HEAD

define("CONN_DBMS", 1001);
define("CONN_DB_NAME", 1101);
define("CONN_OK", 0);


Class Connection {

	var $host,
	$user,
	$pass,
	$db,
	$active = false,
	$errno = 0;

	function Connection($host, $user, $pass, $db) {
			
		$this->host = $host;
		$this->user = $user;
		$this->pass = $pass;
		$this->db = $db;
	}

	function connect() {
			
		if (!$this->active) {
				
			$conn = mysql_pconnect($this->host, $this->user, $this->pass);

			if ($conn) {
				$sel = mysql_select_db($this->db);
				
				if ($sel) {

					return true;

				} else {

					$this->errno = CONN_DB_NAME;
					return false;
				}
			} else {
					
				$this->errno = CONN_DBMS;
				return false;
					
			}
		}
	}

	function error() {
		switch ($this->errno) {
			case CONN_DB_NAME:
				echo "name errato!";
				break;
			case CONN_DBMS:
				echo "connessione errata!";
				break;
			case CONN_OK:
				echo "alive and kicking!";
				break;
					
			default:
				echo "unknown error!";
				break;
		}
	}
}

$mydb = new Connection("localhost", "root", "root", "progettotdw");
$mydb->connect();

function getResult($query) {
	
	$oid = mysql_query($query);
	
	do {
		$data = mysql_fetch_assoc($oid);
		if ($data) {
			$content[] = $data;
		}
	} while ($data);
	
	return $content;
}


function upData($query) {
        
        mysql_query($query) or die("ERRORE NELLA QUERY!!!");
        
        return;
}


function insData($query) {
        
        mysql_query($query) or die("ERRORE NELLA QUERY!!!");
        
        return;
}

?>
=======
Class DB {

    var
        $errorno = 0,
        $oid,
        $buffer;

    function DB($host, $user, $pass, $name) {
        $connection = mysql_pconnect($host, $user, $pass);
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
                return $message . ": " . mysql_error();
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
>>>>>>> d3ac521653c460c6bcf9ba01eb879f2544a0b9a5
