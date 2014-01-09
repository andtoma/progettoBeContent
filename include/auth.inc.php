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

/* * ***********************************************************************************************
  this function is used to check if the users groups is one of the group that has
  the control panel access, if so it returns true
 * ********************************************************************************************** */

function match_verifier($data1, $data2) {
    foreach ($data1 as $key => $value) {
        if (in_array($value, $data2)) {
            return true;
        }
    }
    return false;
}

/* * ***********************************************************************************************
  this procedure checks if the user has the permissions to login into the admin
 * panel, if so it returns to admin.php, else the procedure loads the login
 * form with an error message
 * ********************************************************************************************** */

function check_permission($id) {

    /* groups that can access into the admin panel */
    $q1 = ("select grp from services_groups where service=(select id_service from services where
service_name='control_panel_access')");

    $data1 = getResult($q1);

    /* user group */
    $q2 = ("select grp from users_groups where user =" . $_SESSION['user']['id_user'] . " ");

    $data2 = getResult($q2);

    /* looking for common elements in the 2 arrays */

    if (!match_verifier($data1, $data2)) {
        /* it means that user group hasn't the permission to access */
        $login = new Template("skins/admin/dtml/admin_login.html");
        $login->setContent("message", "you are not allowed to enter");
        /* without the unset user form will always come here ignoring the login fields, this because he's in session */
        unset($_SESSION['user']);
        $login->close();
        exit;
    } else {

        return;
    }
}

?>