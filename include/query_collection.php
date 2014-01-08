<?php

/*
 * QUERY HEADER-FOOTER
 */
$query_menu = "SELECT * FROM menu WHERE parent_id=0 ORDER BY position";
$query_siteaddress = "SELECT info_text FROM site_infos WHERE info_type='address'";
$query_sitephone = "SELECT info_text FROM site_infos WHERE info_type='phone'";
$query_siteemail = "SELECT info_text FROM site_infos WHERE info_type='email'";
/*
 * QUERY HOMEPAGE
 */
$query_slideshow = "SELECT * FROM slideshow";
$query_itemsmp = "SELECT purchase.item, path, name, description, price, quantity, COUNT(*) 
FROM purchase 
INNER JOIN items ON purchase.item=items.id 
INNER JOIN items_images ON items.id=items_images.item 
GROUP BY purchase.item 
ORDER BY COUNT(*) DESC";
$query_itemsna = "SELECT DISTINCT items.id AS item , path, name, description, price 
FROM items 
INNER JOIN items_images ON items.id=items_images.item 
ORDER BY items.id DESC";
/*
 * QUERY CARRELLO
 */
$query_up_info = "SELECT U.name, U.surname, U.country, U.state, U.city, U.zip_code, U.address, U.phone, P.id, I.name, I.price 
FROM users U
INNER JOIN purchase P ON users.id_user=purchase.user 
INNER JOIN items I ON items.id=purchase.item
WHERE users.id_user={$_SESSION['user']['id_user']}";
/*
 * QUERY LOGIN
 */
$query_login = "SELECT * 
FROM users 
WHERE email = '{$_POST['email']}'AND password = MD5('{$_POST['password']}')";
$query_login_data = "SELECT id, name, username 
FROM users 
WHERE email = '{$_POST['email']}' AND password = MD5('{$_POST['password']}')";
/*
 * QUERY CONTACT US
 */
$query_siteaddress = "SELECT info_text FROM site_infos WHERE info_type='address'";
$query_sitephone = "SELECT info_text FROM site_infos WHERE info_type='phone'";
$query_siteemail = "SELECT info_text FROM site_infos WHERE info_type='email'";
/*
 * QUERY ACCOUNT
 */
$query_userinfo = "SELECT * FROM users WHERE users.id={$_SESSION['user']['id_user']}";
$query_purchase = "SELECT datetime, items.id, name, quantity, price, status 
FROM purchase 
INNER JOIN items ON purchase.item=items.id 
WHERE purchase.user={$_SESSION['user']['id_user']}";
$query_wishlist = "SELECT id, name, price 
FROM wishlist 
INNER JOIN items ON wishlist.item=items.id 
WHERE wishlist.user={$_SESSION['user']['id_user']}";
/*
 * QUERY ITEMS
 */
$query_category = "SELECT cat_name FROM categories WHERE id={$_GET['cat']}";
$query_item = "SELECT * 
FROM items I 
INNER JOIN items_images G ON I.id=G.item 
INNER JOIN availability A ON I.id=A.item 
WHERE I.id={$_GET['id']}";

?>