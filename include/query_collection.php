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
$query_itemsmp = "SELECT purchase.item, path, name, description, FLOOR( price - price * discount/100) as price, quantity, COUNT(*) 
FROM purchase 
INNER JOIN items ON purchase.item=items.id 
INNER JOIN items_images ON items.id=items_images.item 
GROUP BY purchase.item 
ORDER BY COUNT(*) DESC";
$query_itemsna = "SELECT DISTINCT items.id AS item , path, name, description, FLOOR( price - price * discount/100) as price 
FROM items 
INNER JOIN items_images ON items.id=items_images.item 
ORDER BY items.id DESC";
/*
 * QUERY CARRELLO
 */
 
$query_cart="select 
	I.id,
    I.name,
    C.colour,
    C.size,
   	FLOOR( I.price - I.price * I.discount/100) as price,
    C.quantity,
    (C.quantity * FLOOR( I.price - I.price * I.discount/100)) as partial
from
    cart C
        join
    items I on  C.item = I.id
where
   C.user={$_SESSION['user']['id']}"; 
     
$query_up_info = "SELECT U.name, U.surname, U.country, U.state, U.city, U.zip_code, U.address, U.phone, P.id, I.name, I.price 
FROM users U
INNER JOIN purchase P ON users.id=purchase.user 
INNER JOIN items I ON items.id=purchase.item
WHERE users.id=" . $_SESSION['user']['id'];
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
$query_userinfo = "SELECT * FROM users WHERE users.id=".$_SESSION['user']['id'];

$query_processing="SELECT DATE_FORMAT(datetime, ' %e %b %Y, %h:%i %p') as datetime, purchase.id as id, name,colour,size, quantity,purchase.item_price as price , status 
FROM purchase 
INNER JOIN items ON purchase.item=items.id 
WHERE purchase.user=".$_SESSION['user']['id']." and purchase.status='processing' order by purchase.id desc";

$query_purchase = "SELECT DATE_FORMAT(datetime, ' %e %b %Y, %h:%i %p') as datetime, purchase.id as id, name,colour,size, quantity, purchase.item_price as price, status 
FROM purchase 
INNER JOIN items ON purchase.item=items.id 
WHERE purchase.user=".$_SESSION['user']['id']."  order by purchase.id desc";
$query_wishlist = "SELECT id, name, FLOOR( price - price * discount/100) as price 
FROM wishlist 
INNER JOIN items ON wishlist.item=items.id 
WHERE wishlist.user=".$_SESSION['user']['id'];



$query_category = "SELECT cat_name FROM categories WHERE id={$_GET['cat']}";
$query_item = "SELECT * 
FROM items I 
INNER JOIN items_images G ON I.id=G.item 
INNER JOIN availability A ON I.id=A.item 
WHERE I.id={$_GET['id']}";

?>