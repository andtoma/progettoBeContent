<?php

session_start();

Class functions extends TagLibrary {

    function IoDevoEssereLaPrimaFunzione() {
        return;
    }

    function HeaderMenu($name, $data, $pars) {
        ### QUERY PER PRENDERE LE ID DEI MENU CON SOTTOMENU
        $query_1 = "SELECT DISTINCT parent_id FROM menu WHERE parent_id!=0";
        $res_1 = getResult($query_1);
        $content = '<div class="navi"><div id="ddtopmenubar" class="mattblackmenu"><ul>';
        foreach ($data as $key => $value) {
            $hassub = 0;
            foreach ($res_1 as $k1 => $v1) {
                if ($value['id'] == $v1['parent_id']) {
                    $hassub = 1;
                    break;
                }
            }
            if ($hassub == 1) {
                /*
                 * CASO IN CUI IL MENU HA DEI SOTTOMENU
                 */
                $content.= '<li>
                                <a href="' . $value['link'] . '" rel="ddsubmenu1">' . $value['name'] . '</a>
                            <ul id="ddsubmenu1" class="ddsubmenustyle">';
                ### QUERY PER PRENDERE I CAMPI DEL SOTTOMENU ASSOCIATO AL MENU CORRENTE
                $query_2 = "SELECT * FROM menu WHERE parent_id=" . $value['id'];
                $res_2 = getResult($query_2);
                foreach ($res_2 as $k2 => $v2) {
                    $content .= '<li>
                                    <a href="' . $v2['link'] . '">' . $v2['name'] . '</a>
                                 </li>';
                }
                $content .= '</ul></li>';
            } else {
                /*
                 * CASO IN CUI IL MENU NON HA SOTTOMENU
                 */
                $content .= '<li><a href="' . $value['link'] . '">' . $value['name'] . '</a></li>';
            }
        }
        $content .= '</ul></div></div>';
        return $content;
    }

    function FooterMenu($name, $data, $pars) {
        $content = '<ul>';
        foreach ($data as $key => $value) {
            $content.='<li>
                       <a href="' . $value['link'] . '">' . $value['name'] . '</a>
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
            if ($active) {
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

    function Carousel($name, $data, $pars) {
        $content = '';
        $active = 1;
        for ($i = 0; $i < count($data); $i++) {
            if ($active) {
                $content .= '<li data-target="#carousel-example-generic" data-slide-to="' . $i . '" class="active"></li>';
                $active = 0;
            } else {
                $content .= '<li data-target="#carousel-example-generic" data-slide-to="' . $i . '"></li>';
            }
        }
        return $content;
    }

    function ItemsMP($name, $data, $pars) {
        $content = '';
        $max = 6;
        foreach ($data as $key => $value) {

            $link = 'single-item.php?id=' . $value['item'];
            $short_desc = substr($value['description'], 0, 60) . '...';

            $content .= '<li>
                             <a href="' . $link . '"><img src="' . $value['path'] . '" alt="" class="img-responsive"/></a>
                             <div class="carousel_caption">
                                 <h5><a href="' . $link . '">' . $value['name'] . '</a></h5>
                                 <p>' . $short_desc . '</p>
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i class="icon-search"></i>View Details</a>
                                 <a data-toggle="modal" data-id=' . $value['item'] . ' href="#quickshop" class="btn btn-danger btn-sm open-AddBookDialog modal-title">Buy for &#36;' . $value['price'] . '</a>
                             </div>
                         </li>';

            if (!( --$max))
                break;
        }
        return $content;
    }

    function ItemsNA($name, $data, $pars) {
        $content = '';
        $max = 6;
        foreach ($data as $key => $value) {

            $link = 'single-item.php?id=' . $value['item'];
            $short_desc = substr($value['description'], 0, 60) . '...';

            $content .= '<li>
                             <a href="' . $link . '"><img src="' . $value['path'] . '" alt="" class="img-responsive"/></a>
                             <div class="carousel_caption">
                                 <h5><a href="' . $link . '">' . $value['name'] . '</a></h5>
                                 <p>' . $short_desc . '</p>
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i class="icon-search"></i>View Details</a>
                                 <a data-toggle="modal" data-id=' . $value['item'] . ' href="#quickshop" class="btn btn-danger btn-sm open-AddBookDialog modal-title">Buy for &#36;' . $value['price'] . '</a>
                             </div>
                         </li>';

            if (!( --$max))
                break;
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
                                   FROM items INNER JOIN cart ON items.id=cart.item 
                                   WHERE cart.user=" . $_SESSION['user']['id_user'];
            $res_shoppingcart = getResult($query_shoppingcart);
            foreach ($res_shoppingcart as $key => $value) {
                $num_items += $value['quantity'];
                $tot_price += ($value['price'] * $value['quantity']);
            }
            $content .= '<a href="account.php">Account</a>
                         <a data-toggle="modal" href="#shoppingcart"><i class="icon-shopping-cart"></i> ' . $num_items . ' Items - &#36;' . $tot_price . '</a>
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
                                   FROM items INNER JOIN cart ON items.id=cart.item 
                                   WHERE cart.user=" . $_SESSION['user']['id_user'];
            $res_shoppingcart = getResult($query_shoppingcart);
            foreach ($res_shoppingcart as $key => $value) {
                $content.= '<tr>
                                <td><a href="single-item.php?id=' . $value['id'] . '">' . $value['name'] . '</a></td>
                                <td>' . $value['quantity'] . '</td>
                                <td>&#36;' . ($value['price'] * $value['quantity']) . '</td>
                            </tr>';
                $tot_price += ($value['price'] * $value['quantity']);
            }
            $content .= '<tr>
                            <th></th>
                            <th>Total</th>
                            <th>&#36;' . $tot_price . '</th>
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
        $id = $data[0]['id'];
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
                            <td>' . $value['id'] . '</td>
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
                            <td><a href="single-item.php?id=' . $value['id'] . '">' . $value['name'] . '</a></td>
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
                            <td>' . $value['id'] . '</td>
                            <td>' . $value['name'] . '</td>
                            <td>' . $value['quantity'] . '</td>
                            <td>&#36;' . $value['price'] . '</td>
                            <td>' . $value['status'] . '</td>
                        </tr>';
        }
        return $content;
    }

    function ItemsList($name, $data, $pars) {

        $content = '';

        foreach ($data as $key => $value) {
            #check disponibilità
            $query_availability = "SELECT DISTINCT item FROM availability WHERE item=" . $value['id'];
            $res_availability = getResult($query_availability);
            #check prodotto hot
            $query_discount = "SELECT discount FROM items WHERE id=" . $value['id'];
            $res_discount = getResult($query_discount);

            $link = "single-item.php?id=" . $value['id'];
            $short_desc = substr($value['description'], 0, 60) . '...';

            $content .= '<div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="item">';

            # HOT or OUT OF STOCK icon
            if (!$res_availability) {
                $content .= '<div class="item-icon">
                             <span class="out-of-stock">OUT OF STOCK</span>
                             </div>';
            } elseif ($res_discount[0]['discount']) {
                $content .= '<div class="item-icon">
                                 <span class="hot">HOT</span>
                                 </div>';
            }
            # Item image
            $query_image = "SELECT path FROM items_images WHERE item={$value['id']}";
            $res_image = getResult($query_image);
            $content .= '<div class = "item-image">
                         <a href = "' . $link . '"><img src = "' . $res_image[0]['path'] . '" alt = "" class = "img-responsive"/></a>
                         </div>
                         <div class = "item-details">
                         <h5><a href = "' . $link . '">' . $value['name'] . '</a></h5>
                         <div class = "clearfix"></div>
                         <p>' . $short_desc . '</p>
                         <hr />
                         <div class = "pull-left">
                         <a href = "' . $link . '" class = "btn btn-info btn-sm"><i class = "icon-search"></i>View Details</a>
                         </div>
                         <div class = "pull-right">
                         <a data-toggle="modal" data-id=' . $value['id'] . ' href="#quickshop" class="btn btn-danger btn-sm open-AddBookDialog modal-title">Buy for &#36;' . $value['price'] . '</a>
                         </div>
                         <div class = "clearfix"></div>
                         </div>
                         </div>
                         </div>';
        }
        return $content;
    }

    function ItemDetails($name, $data, $pars) {
        $content = "";
        switch ($pars['value']) {
            case 'sex':
                if ($data[0]['sex'] == 'M') {
                    $content .= "icon-male";
                } else {
                    $content .="icon-female";
                }
                break;
            case 'name':
                $content .= $data[0]['name'];
                break;
            case 'image':
                $res_images = getResult("SELECT * FROM items_images WHERE items_images.item={$data[0]['id']}");
                $content .= $res_images[0]['path'];
                break;
            case 'color':
                $first = 1;
                $res_images = getResult("SELECT * FROM items_images WHERE items_images.item={$data[0]['id']}");
                foreach ($res_images as $key => $value) {
                    if ($first) {
                        $content .= "<option selected>{$value['colour']}</option>";
                        $first = 0;
                    } else {
                        $content .= "<option>{$value['colour']}</option>";
                    }
                }
                break;
            case 'size':
                $res_sizes = getResult("SELECT * FROM availability WHERE item={$data[0]['id']}");
                foreach ($res_sizes as $key => $value) {
                    $content .= "<option>{$value['size']}</option>";
                }
                break;
            case 'thumbs':
                $res_images = getResult("SELECT * FROM items_images WHERE items_images.item={$data[0]['id']}");
                if ($res_images > 0)
                    for ($i = 1; $i < min(4, count($res_images)); $i++) {
                        $content.= '<div class="left-side-item col-lg-9 col-md-9 col-sm-9 col-xs-9">
                                    <div class="left-side-thumb item-thumb" style="padding:10px ">
                                    <a href=""><img src="' . $res_images[$i]['path'] . '" alt="" class="img-responsive"/></a>
                                    <div style="height:5px;background-color:' . $res_images[$i]['colour'] . '"></div>
                                    </div>
                                    </div>';
                    }
                break;
            case 'price':
                $content .= $data[0]['price'];
                break;
            case 'brand':
                $res_brand = getResult("SELECT brand_name FROM brands WHERE id={$data[0]['brand']}");
                $content .= $res_brand[0]['brand_name'];
                break;
            case 'availability':
                $res_quantity = getResult("SELECT * FROM availability WHERE item={$data[0]['id']}");
                if (!$res_quantity) {
                    $content .= "Out of Stok";
                } else {
                    $content .= "In Stock";
                }
                break;
            case 'description';
                $content .= $data[0]['description'];
                break;
            case 'crumb';
                $content .= '<li><a href="index.php">Home</a><span class="divider"></span></li>';
                if ($data[0]['sex'] == 'M') {
                    $content .= '<li><a href="items.php?sex=M">Man</a><span class="divider"></span></li>';
                } else {
                    $content .= '<li><a href="items.php?sex=F">Woman</a><span class="divider"></span></li>';
                }
                $res_category = getResult("SELECT cat_name FROM categories WHERE id={$data[0][category]}");
                $content .= '<li><a href="items.php?sex=' . $data[0]['sex'] . '&cat=' . $data[0][category] . '">' . $res_category[0]['cat_name'] . '</a><span class="divider"></span></li>';
                $content .= '<li><a href="single-item.php?id=' . $data[0]['id'] . '">' . $data[0]['name'] . '</a><span class="divider"></span></li>';
                break;
            default:
                break;
        }
        return $content;
    }

}

?>
