<?php

require "include/template2.inc.php";
require "include/dbms.inc.php";


//data from step1
$email = $_POST['email'];
$password = $_POST['password'];
$password2 = $_POST['password2'];
$newsletter = $_POST['newsletter'];

//data from step2
$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$birthdate = $_POST['boirthdate'];
$sex = $_POST['sex'];

//data from step3
$address = $_POST['address'];
$city = $_POST['city'];
$state = $_POST['state'];
$zip_code = $_POST['zip_code'];
$country = $_POST['country'];
$phone = $_POST['phone'];
$later = $_POST['later'];


//funzione di validazione email
function validate_email ($email) {
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "email address is valid.";
        return true;
    } else {
        echo "email address is not valid";
        return false;
    }
}

if(!isset($email)) {    echo 'email not inserted';}
if(!isset($password)) {   echo 'password not inserted';}
if(!isset($password2)) {  echo 'password2 non inserita';}

if(!isset($first_name)) { echo 'first name not inserted';}
if(!isset($last_name)) {  echo 'last name not inserted';}
if(!isset($birthdate)) {  echo 'birthdate not inserted';}
if(!isset($sex)) {    echo 'sex not inserted';}

if(!isset($later)) {
    if(!isset($address)) {    echo 'address not inserted';}
    if(!isset($city)) {   echo 'city not inserted';}
    if(!isset($state)) {  echo 'state not inserted';}
    if(!isset($zip_code)) {   echo 'zip_code not inserted';}
    if(!isset($country)) {    echo 'ecountrymail not inserted';}
    if(!isset($phone)) {  echo 'phone not inserted';}
}



if(!validate_email($email)) {echo 'il formato dell\'email non è corretto';}


//fa una query sul db per verificare che l'email esista già
$check_email_query = "SELECT * FROM user WHERE email='$email'";
$oid = mysql_query($check_email_query);
if(!oid) {}
else {echo 'email gia presente nel database';}


//inserisce i dati del db
$insert_query = "INSERT INTO user VALUES(
                '$email',
                '$password',
                '$password2',
                '$newsletter',
                '$first_name',
                '$last_name',
                '$birthdate',
                '$address',
                '$city',
                '$state',
                '$zip_code',
                '$country',
                '$phone',
                )";
$oid = mysql_query($insert_query);
if(!oid) {
        echo 'KO';
        
} else {
        echo 'OK';
}



?>