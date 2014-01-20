<?php
session_start();
unset($_SESSION['user']);
unset($_SESSION['remember_me']);
header("Location: index.php");

?>