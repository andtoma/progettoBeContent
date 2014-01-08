<?php

session_start();

function login($main) {
    require "include/query_collection.php";

    if (!isset($_POST["email"]) && !isset($_POST["password"])) {
        $container = new Skinlet("login");
        $main->setContent("container", $container->get());
        return;
    } else {
        /* L'UTENTE HA INSERITO I DATI DI ACCESSO */
        $res_login = getResult($query_login);
        if (!$res_login) {
            /* ERRORE NELLA QUERY, USERNAME O PASSWORD ERRATI */
            $alert = '<div class="alert alert-danger alert-dismissable">
                        <button type="button" class="close">&times;</button>
                        <strong>Warning!</strong> Invalid Email or Password.
                      </div>';
            $container = new Skinlet("login");
            $container->setContent("alert", $alert);
            $main->setContent("container", $container->get());
            return;
        } else {
            /* LOGIN OK, INSERISCI L'UTENTE IN SESSIONE */
            $res_login_data = getResult($query_login_data);
            $_SESSION['user']['id_user'] = $res_login_data[0]['id'];
            $_SESSION['user']['name'] = $res_login_data[0]['name'];
            $_SESSION['user']['username'] = $res_login_data[0]['username'];
            $container = new Skinlet("login");
            $main->setContent("container", $container->get());
            header("Location: index.php");
            return;
        }
    }
}



?>