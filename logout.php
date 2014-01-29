<?php
session_start();
unset($_SESSION['user']);
unset($_SESSION['remember_me']);
session_destroy();
header("Location: index.php");
?>