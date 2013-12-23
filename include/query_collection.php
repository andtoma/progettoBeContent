<?php
/*
 * QUERY HEADER-FOOTER
 */
$query_menu = "SELECT * FROM menu";
$query_siteaddress = "SELECT info_text FROM site_infos WHERE info_type='address'";
$query_sitephone = "SELECT info_text FROM site_infos WHERE info_type='phone'";
$query_siteemail = "SELECT info_text FROM site_infos WHERE info_type='email'";
$query_slideshow = "SELECT * FROM site_images INNER JOIN site_infos ON site_images.site_info=site_infos.id_info";
/*
 * QUERY HOMEPAGE
 */
$query_itemsmp = "SELECT purchase.item, path, name,description, price, COUNT(*) 
FROM purchase 
INNER JOIN items ON purchase.item=items.id_item 
INNER JOIN items_images ON items.id_item=items_images.item 
GROUP BY purchase.item 
ORDER BY COUNT(*) DESC";
$query_itemsna = "SELECT id_item AS item , path, name, description, price 
FROM items 
INNER JOIN items_images ON items.id_item=items_images.item 
ORDER BY id_item DESC";
/*
 * QUERY CARRELLO
 */
$query_up_info = "SELECT users.name, users.surname, users.country, users.state, users.city, users.zip_code, users.address, users.phone, purchase.id_order, items.name, items.price
FROM users 
INNER JOIN purchase ON users.id_user=purchase.user 
INNER JOIN items ON items.id_item=purchase.item
WHERE users.id_user=" . $_SESSION['user']['id_user'];
/*
 * QUERY LOGIN
 */
$query_login = "SELECT * 
FROM users 
WHERE email = '{$_POST['email']}'AND password = MD5('{$_POST['password']}')";
$query_login_data = "SELECT id_user, name, username 
FROM users 
WHERE email = '{$_POST['email']}' AND password = MD5('{$_POST['password']}')";
/*
 * QUERY CONTACT US
 */
$query_siteaddress = "SELECT info_text FROM site_infos WHERE info_type='address'";
$query_sitephone = "SELECT info_text FROM site_infos WHERE info_type='phone'";
$query_siteemail = "SELECT info_text FROM site_infos WHERE info_type='email'";

?>