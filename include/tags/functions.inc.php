<?php

session_start();

Class functions extends TagLibrary {

    function IoDevoEssereLaPrimaFunzione() {
        return;
    }

    function HeaderMenu($name, $data, $pars) {
        ### QUERY PER PRENDERE LE ID DEI MENU CON SOTTOMENU
        $query_1 = "SELECT DISTINCT submenu.menu FROM menu INNER JOIN submenu ON menu.id_field=submenu.menu";
        $res_1 = getResult($query_1);
        $content = '<div class="navi"><div id="ddtopmenubar" class="mattblackmenu"><ul>';
        foreach ($data as $key => $value) {
            $hassub = 0;
            foreach ($res_1 as $k1 => $v1) {
                if ($value['id_field'] == $v1['menu']) {
                    $hassub = 1;
                    break;
                }
            }
            if ($hassub == 1) {
                /*
                 * CASO IN CUI IL MENU HA DEI SOTTOMENU
                 */
                $content.= '<li>
                                <a href="' . $value['link'] . '" rel="ddsubmenu1">' . $value['field_name'] . '</a>
                            <ul id="ddsubmenu1" class="ddsubmenustyle">';
                ### QUERY PER PRENDERE I CAMPI DEL SOTTOMENU ASSOCIATO AL MENU CORRENTE
                $query_2 = "SELECT * FROM submenu WHERE menu=" . $value['id_field'];
                $res_2 = getResult($query_2);
                foreach ($res_2 as $k2 => $v2) {
                    $content .= '<li>
                                    <a href="' . $v2['link'] . '?cat=' . $v2['id_submenu'] . '">' . $v2['field_name'] . '</a>
                                 </li>';
                }
                $content .= '</ul></li>';
            } else {
                /*
                 * CASO IN CUI IL MENU NON HA SOTTOMENU
                 */
                $content .= '<li><a href="' . $value['link'] . '">' . $value['field_name'] . '</a></li>';
            }
        }
        $content .= '</ul></div></div>';
        return $content;
    }

    function FooterMenu($name, $data, $pars) {
        $content = '<ul>';
        foreach ($data as $key => $value) {
            $content.='<li>
                       <a href="' . $value['link'] . '">' . $value['field_name'] . '</a>
                       </li>';
        }
        $content .= '</ul>';
        return $content;
    }

    function Slideshow($name, $data, $pars) {
        $content = '';
        $active = 1;
        foreach ($data as $key => $value) {
            $content .= '<div class="item ';

            if ($active == 1) {
                $content .= 'active ';
                $active = 0;
            }
            $content .= 'animated fadeInRight">
                        <img src="' . $value['path'] . '" alt="" class="img-responsive" />
                        <div class="carousel-caption">
                        <h2 class="animated fadeInLeftBig">' . $value['title'] . '</h2>
                        <p class="animated fadeInRightBig">
                        ' . $value['description'] . '
                        </p>
                        </div>
                        </div>';
        }
        return $content;
    }

    function ItemsMP($name, $data, $pars) {
        $content = '';
        foreach ($data as $key => $value) {

            $link = 'single-item.php?id=' . $value['item'];
            $short_desc = substr($value['description'], 0, 60) . '...';

            $content .= '<li>
                             <a href="' . $link . '"><img src="' . $value['path'] . '" alt="" class="img-responsive"/></a>
                             <div class="carousel_caption">
                                 <h5><a href="' . $link . '">' . $value['name'] . '</a></h5>
                                 <p>' . $short_desc . '</p>
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i class="icon-search"></i>View Details</a>
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i class="icon-shopping-cart"></i> Buy for &#36;' . $value['price'] . '</a>
                             </div>
                         </li>';
        }

        return $content;
    }

    function ItemsNA($name, $data, $pars) {

        $content = '';
        foreach ($data as $key => $value) {

            $link = 'single-item.php?id=' . $value['item'];
            $short_desc = substr($value['description'], 0, 60) . '...';

            $content .= '<li>
                             <a href="' . $link . '"><img src="' . $value['path'] . '" alt="" class="img-responsive"/></a>
                             <div class="carousel_caption">
                                 <h5><a href="' . $link . '">' . $value['name'] . '</a></h5>
                                 <p>' . $short_desc . '</p>
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i class="icon-search"></i>View Details</a>
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i class="icon-shopping-cart"></i> Buy for &#36;' . $value['price'] . '</a>
                             </div>
                         </li>';
        }
        return $content;
    }

    function SiteInfo($name, $data, $pars) {
        $content = "";
        foreach ($data as $key => $value) {
            $content .= $value['info_text'];
        }
        return $content;
    }

    function LoginBox($name, $data, $pars) {

        $content = '';
        # SE L'UTENTE NON è IN SESSIONE CARICA L'HTML DEL LOGIN/REGISTER
        if (!isset($_SESSION['user'])) {
            $content .= '<a href="login.php">Login</a>
                         <a href="register.php">Signup</a>';
        } else {
            # SE L'UTENTE è IN SESSIONE CARICA IL CARRELLO E IL LOGOUT
            $num_items = 0;
            $tot_price = 0;

            
            # QUERY: SHOPPINGCART
            $query_shoppingcart = "SELECT name, quantity, price 
                                   FROM items INNER JOIN cart ON items.id_item=cart.item 
                                   WHERE cart.user=" . $_SESSION['user']['id_user'];
            $res_shoppingcart = getResult($query_shoppingcart);
            foreach ($res_shoppingcart as $key => $value) {
                $num_items += $value['quantity'];
                $tot_price += ($value['price']*$value['quantity']);
            }
            $content .= '<a data-toggle="modal" href="#shoppingcart"><i class="icon-shopping-cart"></i> ' . $num_items . ' Items - &#36;' . $tot_price . '</a>
                         <a href="logout.php">Logout</a>';
        }
        return $content;
    }

    function ShoppingCart($name, $data, $pars) {
        $content = '';
        $tot_price = 0;
        if (!isset($_SESSION['user'])) {
            $content .= '<tr></tr>';
        } else {
            # QUERY: SHOPPINGCART
            $query_shoppingcart = "SELECT name, quantity, price 
                                   FROM items INNER JOIN cart ON items.id_item=cart.item 
                                   WHERE cart.user=" . $_SESSION['user']['id_user'];
            $res_shoppingcart = getResult($query_shoppingcart);
            foreach ($res_shoppingcart as $key => $value) {
                $content.= '<tr>
                                <td><a href="single-item.php?id=' . $value['id_item'] . '">' . $value['name'] . '</a></td>
                                <td>'.$value['quantity'].'</td>
                                <td>&#36;' . ($value['price']*$value['quantity']) . '</td>
                            </tr>';
                $tot_price += ($value['price']*$value['quantity']);
            }
            $content .= '<tr>
                            <th></th>
                            <th>Total</th>
                            <th>&#36;'.$tot_price.'</th>
                         </tr>';
        }
        return $content;
    }
    
    /*
    function TotalPrice($name, $data, $pars) {
        $tot_price = 0;
        if (isset($_SESSION['user'])) {
            # QUERY: TOTAL PRICE
            $query_totalprice = 'SELECT SUM(price) AS tot_price 
                                 FROM cart INNER JOIN items ON cart.item=items.id_item 
                                 WHERE cart.user=' . $_SESSION['user']['id_user'];
            $res_totalprice = getResult($query_totalprice);

            foreach ($res_totalprice as $key => $value) {
                $tot_price += $value['tot_price'];
            }
        }
        return $tot_price;
    }
     */

    function UserInfo($name, $data, $pars) {
        $id = $data[0]['id_user'];
        $name1 = $data[0]['name'];
        $surname = $data[0]['surname'];
        $birth_date = $data[0]['birth_date'];
        $sex = $data[0]['sex'];
        $email = $data[0]['email'];
        $country = $data[0]['country'];
        $state = $data[0]['state'];
        $city = $data[0]['city'];
        $zip_code = $data[0]['zip_code'];
        $address = $data[0]['address'];
        $phone = $data[0]['phone'];
        $username = $data[0]['username'];
        switch ($name) {
            case 'ID':
                return $id;
                break;
            case 'Name':
                return $name1;
                break;
            case 'Surname':
                return $surname;
                break;
            case 'Birth_Date':
                return $birth_date;
                break;
            case 'Sex':
                return $sex;
                break;
            case 'Email':
                return $email;
                break;
            case 'Country':
                return $country;
                break;
            case 'State':
                return $state;
                break;
            case 'City':
                return $city;
                break;
            case 'Zip_Code':
                return $zip_code;
                break;
            case 'Address':
                return $address;
                break;
            case 'Phone':
                return $phone;
                break;
            case 'Username':
                return $username;
                break;
            default:
                return;
                break;
        }
    }

    function RecentPurchase($name, $data, $pars) {
        $content = '';
        $max = 3;
        foreach ($data as $key => $value) {
            $content .= '<tr>
                            <td>' . $value['datetime'] . '</td>
                            <td>' . $value['id_item'] . '</td>
                            <td>' . $value['name'] . '</td>
                            <td>' . $value['quantity'] . '</td>
                            <td>&#36;' . $value['price'] . '</td>
                            <td>' . $value['status'] . '</td>
                        </tr>';
            if (!( --$max))
                break;
        }
        return $content;
    }

    function WishList($name, $data, $pars) {
        $content = '';
        $index = 1;
        foreach ($data as $key => $value) {
            $content .= '<tr>
                            <td>' . ($index++) . '</td>
                            <td><a href="single-item.php?id=' . $value['id_item'] . '">' . $value['name'] . '</a></td>
                            <td>&#36;' . $value['price'] . '</td>
                        </tr>';
        }
        return $content;
    }

    function PurchaseHistory($name, $data, $pars) {
        $content = '';
        foreach ($data as $key => $value) {
            $content .= '<tr>
                            <td>' . $value['datetime'] . '</td>
                            <td>' . $value['id_item'] . '</td>
                            <td>' . $value['name'] . '</td>
                            <td>' . $value['quantity'] . '</td>
                            <td>&#36;' . $value['price'] . '</td>
                            <td>' . $value['status'] . '</td>
                        </tr>';
        }
        return $content;
    }

}

?>
