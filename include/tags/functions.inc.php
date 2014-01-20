<?php

session_start();

require_once "include/permissions.inc.php";
require_once "include/dbms.inc.php";

Class functions extends TagLibrary {

	function IoDevoEssereLaPrimaFunzione() {
		return;
	}

	/*THIS is a 3 level menu:
	 -a father is a main menu item(home, men, contacts,...)
	 -a son is a category, for example accessories
	 -a grandson is a subcategory, for example jewels
	 *
	 in the function for every item menu I check if there is some son is the table(menu it's a hierarchical table), if it exist
	 * I make the same thing of the father.
	 * */
	function HeaderMenu($name, $data, $pars) {
		$main_menu = getResult("SELECT * FROM menu WHERE parent_id=0 ORDER BY position");

		foreach ($main_menu as $key => $value) {
			$has_sons = hasResult("SELECT * FROM menu WHERE parent_id='{$value['id']}'");
			$icon = getSingleResult("select I.ref as ref from icons I join menu M where  M.icon=I.id and M.id ='{$value['id']}'", "ref");

			if (!$has_sons) {
				/*********************************
				 * it is a single menu with href
				 * *******************************/
				$menu .= "<li class='menu-non-dropdown'><a  class='options_menu' href='" . $value['link'] . "'>";
				/**check for icons**/
				if ($icon != "NULL") {
					$menu .= $icon . ' ';
				}
				$menu .= $value['name'] . "</a></li>";

			} else {
				/*********************************
				 * it has sons
				 * *******************************/
				$menu .= '<li class="fly-out"><a class="options_menu" href=' . $value["link"] . '>';
				/**check for icon**/

				if ($icon != "NULL") {
					$menu .= $icon . " ";
				}
				$menu .= $value["name"] . '</a><div animate-in="slideDown" animate-out="bounceOut" class="dropdown-menu row col-lg-6" > <div class="content">';

				/*I get the sons of each menu item*/

				$sons = getResult("SELECT * FROM menu WHERE parent_id='{$value["id"]}' ORDER BY position");

				foreach ($sons as $key => $value) {

					$menu .= '  <div style="padding-right:10px;color:black;" class=" col-lg-4">';

					/*check if son has an icon*/
					$icon = getSingleResult("select I.ref as ref from icons I join menu M where  M.icon=I.id and M.id ='{$value['id']}'", "ref");
					if ($icon != "NULL") {
						$menu .= $icon . ' ';
					}
					$menu .= '<strong> ' . $value["name"] . ' </strong>';

					if (hasResult("SELECT * FROM menu WHERE parent_id='{$value['id']}'")) {

						/*if the son has sons (es Brands--->Nike)*/

						$grand_sons = getResult("SELECT * FROM menu WHERE parent_id='{$value["id"]}' ORDER BY position");
						$menu .= '<ul>';

						foreach ($grand_sons as $key => $value) {

							$menu .= '<li>';

							/*check if the grandson has an icon*/

							$icon = getSingleResult("select I.ref as ref from icons I join menu M where  M.icon=I.id and M.id ='{$value['id']}'", "ref");
							if ($icon != "NULL") {
								$menu .= $icon . ' ';
							}

							$menu .= '<a class="menu_list" href=' . $value["link"] . '>' . $value["name"] . '</a></li>';
						}
						$menu .= '</ul></div>';
					}
				}
				$menu .= " </div></div>";
			}
		}
		if (!isset($_SESSION['user'])) {
			$menu .= "<li id='menu_signin'><button onclick=location.href='register.php' class='btn btn-warning'><a href='register.php' id='menu_login_a'><i class='icon-check icon-large' style='margin-right: 3px;'></i> Sign In</a></button></li>
					<li id='menu_login'> <button class='btn btn-success'><a  id='menu_signin_a'><i class='icon-key icon-large' style='margin-right: 3px;'></i> Login</a></button></li>";

		} else {
			# SE L'UTENTE è IN SESSIONE CARICA IL CARRELLO E IL LOGOUT
			$num_items = 0;
			$tot_price = 0;

			# QUERY: SHOPPINGCART
			$query_shoppingcart = "SELECT name, quantity,FLOOR( price - price * discount/100) as price 
                                   FROM items INNER JOIN cart ON items.id=cart.item 
                                   WHERE cart.user=" . $_SESSION['user']['id'];
			$res_shoppingcart = getResult($query_shoppingcart);
			foreach ($res_shoppingcart as $key => $value) {
				$num_items += $value['quantity'];
				$tot_price += ($value['price'] * $value['quantity']);
			}
			$menu .= " <li  id='menu_logout'><button  onclick=location.href='logout.php' class='btn btn-danger'><a href='logout.php' id='menu_logout_a'><i class='icon-lock icon-large' style='margin-right: 3px;'></i> Logout</a></button></li>
			           <li  id='menu_account'><button onclick=location.href='account.php' class='btn btn-success'><a href='account.php' id='menu_account_a'><i class='icon-user icon-large' style='margin-right: 3px;'></i> Account</a></button></li>
			           <li  id='menu_cart'>
			              <button data-toggle='modal' href='#shoppingcart' class='btn btn-warning'> 
			              	<a data-toggle='modal' href='#shoppingcart' id='menu_cart_a'>
			              		<i class='icon-shopping-cart icon-large' style='margin-right: 3px;'></i> " . $num_items . " Items - &#36;" . $tot_price . "
			              	</a>
			              </button>
			           </li>";

		}
		/*logged: logout, cart & account
		 not logged: sign in & login
		 */
		return $menu;
	}

	function FooterMenu($name, $data, $pars) {
		$content = '<ul>';
		foreach ($data as $key => $value) {
			$content .= '<li>
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
                             <a href="' . $link . '"><img src="' . $value['path'] . '"  class="img-responsive"/></a>
                             <div class="carousel_caption">
                                 <h5><a href="' . $link . '">' . $value['name'] . '</a></h5>
                                 <p>' . $short_desc . '</p>
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i  class="icon-search"></i>View Details</a>
                                 <a data-toggle="modal" data-id=' . $value['item'] . ' href="#quickshop" class="btn btn-danger btn-sm open-AddBookDialog modal-title">Buy for &#36;' . $value['price'] . '</a>
                             </div>
                         </li>';

			if (!(--$max))
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

			if (!(--$max))
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
			$query_shoppingcart = "SELECT name, quantity,FLOOR( price - price * discount/100) as price 
                                   FROM items INNER JOIN cart ON items.id=cart.item 
                                   WHERE cart.user=" . $_SESSION['user']['id'];
			$res_shoppingcart = getResult($query_shoppingcart);
			foreach ($res_shoppingcart as $key => $value) {
				$num_items += $value['quantity'];
				$tot_price += ($value['price'] * $value['quantity']);
			}
			$content .= '<a data-toggle="modal" href="#shoppingcart"><i class="icon-shopping-cart"></i> ' . $num_items . ' Items - &#36;' . $tot_price . '</a>
                         <a href="account.php">Account</a>
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
			$query_shoppingcart = "SELECT id,name, quantity,colour,size, FLOOR( price - price * discount/100) as price
                                   FROM items  INNER JOIN cart ON items.id=cart.item 
                                   WHERE cart.user=" . $_SESSION['user']['id'];
			$res_shoppingcart = getResult($query_shoppingcart);
			foreach ($res_shoppingcart as $key => $value) {
				$content .= '<tr>
                         	   <td class="name" ><input type="hidden" class="id" value=' . $value['id'] . ' ><a href="single-item.php?id=' . $value['id'] . '">' . $value['name'] . '</a></td>
                                <td class="colour">' . $value['colour'] . '</td>
                      	        <td class="size">' . $value['size'] . '</td>
                                <td class="quantity">' . $value['quantity'] . '</td>
                                <td id="partial">&#36;' . ($value['price'] * $value['quantity']) . '</td>
                            </tr>';
				$tot_price += ($value['price'] * $value['quantity']);
			}
			$content .= '<tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>Total</th>
                            <th id="total">&#36;' . $tot_price . '</th>
                         </tr>';
		}
		return $content;
	}

	function UserInfo($name, $data, $pars) {
		if ($pars['field'] == 'sex') {
			if ($pars['value'] == $data[0]['sex'])
				return "checked";
		} else {
			return $data[0][$pars['field']];

		}

	}

	function ProcessingPurchase($name, $data, $pars) {
		$content = '';
		foreach ($data as $key => $value) {
			$content .= '<tr>
                            <td>' . $value['datetime'] . '</td>
                            <td>' . $value['name'] . '</td>
                            <td>' . $value['colour'] . '</td>
                            <td>' . $value['size'] . '</td>
                            <td>&#36;' . $value['price'] . '</td>
                            <td style="text-align: center;">' . $value['quantity'] . '</td>
                            <td>&#36;' . $value['price'] * $value['quantity'] . '</td>
                           <td><form action="delete_order.php"  method="post">
                           <button name="delete" value=' . $value["id"] . ' class="btn btn-danger" type="submit">
							<i class="icon-remove" ></i>
							</button></div></form>  
							</form></td>
                        </tr>';
		}
		return $content;
	}

	function WishList($name, $data, $pars) {
		$content = '';
		$index = 1;
		foreach ($data as $key => $value) {
			$content .= '<tr>
							<form action="update_wishlist.php" method="post">
                            <td>' . ($index++) . '</td>
                            <td><input name="id" value=' . $value['id'] . ' hidden><a href="single-item.php?id=' . $value['id'] . '">' . $value['name'] . '</a></td>
                            <td>&#36;' . $value['price'] . '</td>				
                            <td><button  data-toggle="modal" data-id=' . $value['id'] . ' href="#quickshop" class=" open-AddBookDialog modal-title wishlist-button"><img src="skins/BeClothing/img/add-to-cart-icon.png" width="50"></button></td>
							<td><button name="delete" class="btn btn-danger" type="submit">
							<i class="icon-remove"></i>
							</button></div></form>  
							</td>
                        </tr>';
		}
		return $content;
	}

	function Cart($name, $data, $pars) {
		$content = "";
		$total = 0;
		$index = 1;
		foreach ($data as $key => $value) {
			$total += $value['partial'];
			$content .= '<tr>
					<form id="cart_form" action="update_cart.php" method="post">
                            <td>' . ($index++) . '</td>
                            <td class="name" ><input class="id" name="id" value=' . $value['id'] . ' hidden><a href="single-item.php?id=' . $value['id'] . '">' . $value['name'] . '</a></td>
                             <td class="colour"><input name="colour" value=' . $value['colour'] . ' hidden>' . $value['colour'] . '</td>
                             <td class="size"><input name="size" value=' . $value['size'] . ' hidden>' . $value['size'] . '</td>
                            <td>&#36;' . $value['price'] . '</td>
                            <td>
							<div class="input-group">
								<input type="text" pattern="[0-9]{1,2}" name="quantity" title="Only positive integers allowed, from 0 to 99" value=' . $value['quantity'] . ' class="form-control quantity">
								<span class="input-group-btn">
									<button name="update"  class="btn btn-info validate_quantity" type="submit"">
										<i class="icon-refresh"></i>
									</button>
									<button name="delete" class="btn btn-danger" type="submit">
										<i class="icon-remove"></i>
									</button>
							 </span></div>    </form>   </td>
                            <td>&#36;' . $value['partial'] . '</td>
					    </tr>';
		}
		$content .= "<tr><th></th><th></th><th></th><th></th><th></th><th>Order Total</th><th id='total'>&#36;" . $total . "<th></th><th></th></th></tr>";

		return $content;
	}

	function PurchaseHistory($name, $data, $pars) {
		$content = '';
		foreach ($data as $key => $value) {
			$content .= '<tr>
                            <td class="ship_datetime">' . $value['datetime'] . '</td>
                            <td class="prod_name">' . $value['name'] . '</td>
                            <td>' . $value['colour'] . '</td>
                            <td>' . $value['size'] . '</td>
                            <td>' . $value['quantity'] . '</td>
                            <td>&#36;' . $value['price'] . '</td>
                            <td>' . $value['status'] . '</td>';
			if ($value['status'] == 'processing') {
				$content .= '<td><form action="delete_order.php"  method="post">
                           <button value=' . $value["id"] . ' name="delete" class="btn btn-danger" type="submit">
							<i class="icon-remove" ></i>
							</button></div>  
							</form></td>
							<td> Not available</td>';
			} else {
				$content .= '<td> <button disabled  class="btn btn-danger" type="submit">
							<i class="icon-remove" ></i>
							</button></td>
							<td> <a class="tracking" href="">tracking</a></td>';

			}

			$content . ' </tr>';
		}

		return $content;
	}

	function ItemsList($name, $data, $pars) {
		$content = '';
		switch ($pars['value']) {
			case 'list' :
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
                         <div class="pagination-centered">
                         	<a href = "' . $link . '" class = "btn btn-info btn-sm"><i class = "icon-search"></i>View Details</a>
                       	    <a data-toggle="modal" data-id=' . $value['id'] . ' href="#quickshop" class="btn btn-danger btn-sm open-AddBookDialog modal-title">Buy for &#36;' . floor($value['price'] - $value['price'] * $value['discount'] / 100) . '</a>

                         </div>
                         <div class = "clearfix"></div>
                         </div>
                         </div>
                         </div>';
				}
				break;

			case 'crumb' :
				$content .= '<li><a href="index.php">Home</a> <span class="divider"></span></li>';
				$link = "items.php";
				$query_category = "SELECT cat_name FROM categories WHERE id={$_GET['cat']}";
				switch ($_GET['sex']) {
					case 'M' :
					case 'm' :
						$link .= "?sex=M";
						$content .= "<li><a href=\"{$link}\">Man</a> <span class=\"divider\"></span></li>";
						if (isset($_GET['cat'])) {
							$link .= "&cat={$_GET['cat']}";
							$res_category = getResult($query_category);
							$content .= "<li><a href=\"{$link}\">{$res_category[0]['cat_name']}</a><span class=\"divider\"></span></li>";
						}
						break;
					case 'F' :
					case 'f' :
						$link .= "?sex=F";
						$content .= "<li><a href=\"{$link}\">Woman</a> <span class=\"divider\"></span></li>";
						if (isset($_GET['cat'])) {
							$link .= "&cat={$_GET['cat']}";
							$res_category = getResult($query_category);
							$content .= "<li><a href=\"{$link}\">{$res_category[0]['cat_name']}</a><span class=\"divider\"></span></li>";
						}
						break;
					default :
						$content .= "<li><a href=\"{$link}\">Products</a> <span class=\"divider\"></span></li>";
						if (isset($_GET['cat'])) {
							$link .= "?cat={$_GET['cat']}&";
							$res_category = getResult($query_category);
							$content .= "<li><a href=\"{$link}\">{$res_category[0]['cat_name']}</a><span class=\"divider\"></span></li>";
						}
						break;
				}
				break;

			case 'pag' :
				$link = "items.php";
				$x_pag = 12;
				#numero di elementi da mostrare per pagina
				$pag = $_GET['pag'];
				if (!$pag)
					$pag = 1;
				$first = ($pag - 1) * $x_pag;

				switch ($_GET['sex']) {
					case 'M' :
					case 'm' :
						$link .= "?sex=M&";
						if (!isset($_GET['cat'])) {
							$all_rows = count(getResult("SELECT id FROM items WHERE sex='M'"));
						} else {
							$link .= "cat={$_GET['cat']}&";
							$all_rows = count(getResult("SELECT id FROM items WHERE sex='M' AND category={$_GET['cat']}"));
						}
						break;
					case 'F' :
					case 'f' :
						$link .= "?sex=F&";
						if (!isset($_GET['cat'])) {
							$all_rows = count(getResult("SELECT id FROM items WHERE sex='F'"));
						} else {
							$link .= "cat={$_GET['cat']}&";
							$all_rows = count(getResult("SELECT id FROM items WHERE sex='F' AND category={$_GET['cat']}"));
						}
						break;

					default :
						$link .= "?";
						if (!isset($_GET['cat'])) {
							$all_rows = count(getResult("SELECT id FROM items"));
						} else {
							$link .= "?cat={$_GET['cat']}&";
							$all_rows = count(getResult("SELECT id FROM items WHERE category={$_GET['cat']}"));
						}
						break;
				}
				$all_pages = ceil($all_rows / $x_pag);
				if ($all_pages > 1) {
					if ($pag > 1) {
						$content .= "<li><a href=\"{$link}pag=" . ($pag - 1) . "\">&laquo; Previous Page</a></li>";
					}
					if ($all_pages > $pag) {
						$content .= "<li><a href=\"{$link}pag=" . ($pag + 1) . "\">Next Page &raquo;</a></li>";
					}
				}
				break;
			case 'title' :
				switch ($_GET['sex']) {
					case 'M' :
					case 'm' :
						$content .= 'Man';
						break;
					case 'F' :
					case 'f' :
						$content .= 'Woman';
						break;
					default :
						$content .= 'Our products';
						break;
				}
				break;
			case 'subtitle' :
				switch ($_GET['sex']) {
					case 'M' :
					case 'm' :
						$content .= 'Sottotitolo da uomo...';
						break;
					case 'F' :
					case 'f' :
						$content .= 'Sottotitolo da donna...';
						break;
					default :
						$content .= 'Sottotitolo di default...';
						break;
				}
				break;
			case 'icon' :
				switch ($_GET['sex']) {
					case 'M' :
					case 'm' :
						$content .= 'icon-male';
						break;
					case 'F' :
					case 'f' :
						$content .= 'icon-female';
						break;
					default :
						$content .= 'icon-group';
						break;
				}
				break;
			default :
				break;
		}
		return $content;
	}

	/* Blog Post List */
	function BlogPosts($name, $data, $pars) {
		switch($name) {
			case "Post_List" :
				if (!isset($data['page'])) {
					$data['page'] = 1;
				}
				$blog_page_start = (intval($data['page']) - 1) * 6;
				$blog_page_end = $blog_page_start + 5;
				$query = getResult("select id, username, title, text, datetime from posts order by id desc limit " . $blog_page_start . "," . $blog_page_end . "");
				$post_list = '<div class="posts">';
				foreach ($query as $key => $value) {
					$comments_number = getSingleResult('select count(*) from comments where post=' . $value['id'] . '', 'count(*)');
					$post_list .= '<div class="cwell entry">
				   <h2>
				   <a href="blogsingle.php?id=' . $value['id'] . '">' . $value['title'] . ' </a>';
					if (check_permission("edit_post") && check_permission("delete_post")) {
						$post_list .= '<div style="float:right;">
				   <form action="updateDeletePost.php" method="post">
				   		<button name="edit" value="' . $value['id'] . '" class="btn btn-xs btn-warning"><i class="icon-pencil" ></i></button>
				   		<button name="remove" value="' . $value['id'] . '" class="btn btn-xs btn-danger"><i class="icon-remove" ></i></button>
				   </form>
				   </div>';
					} else {

						if (check_permission("edit_post")) {
							$post_list .= '<div style="float:right;">
				   <form action="updateDeletePost.php" method="post">
				   		<button name="edit" value="' . $value['id'] . '" class="btn btn-xs btn-warning"><i class="icon-pencil" ></i></button>
				   </form>
				   </div>';

						} else {

							if (check_permission("delete_post")) {
								$post_list .= '<div style="float:right;">
				   <form action="updateDeletePost.php" method="post">
				   		<button name="remove" value="' . $value['id'] . '" class="btn btn-xs btn-danger"><i class="icon-remove" ></i></button>
				   </form>
				   </div>';
							}
						}
					}
					/*cutting the text after the word in 200th letters if the test is >200chars*/
					$text = $value["text"];

					$cut_post = "";
					if (strlen($text) <= 200) {
						$cut_post = $text;
					} else {
						// Find the last space (between words we're assuming) after the max length.
						$last_space = strrpos(substr($text, 0, 200), ' ');
						// Trim
						$trimmed_text = substr($text, 0, $last_space);
						// Add ellipsis.
						$trimmed_text .= '...';
						$cut_post = $trimmed_text;
					}

					$post_list .= '</h2>
				   <div class="meta">
				   	<i class="icon-calendar"></i>' . $value['datetime'] . '
				   	<i class="icon-user"></i>' . $value['username'] . '				   	
				   	<i class="icon-comment"></i> <a href="blogsingle.php?id=' . $value['id'] . '&mode=1">' . $comments_number . ' Comments </a></span>
                   </div>
				   <p>' . $cut_post . '</p>
				   <a href="blogsingle.php?id=' . $value['id'] . '" class="btn btn-info">Read More...</a>
				   </div>';
				}

				$post_list .= '</div>
					   <div class="pagination-centered">
							<ul class="pagination">
							';
				if (getSingleResult('select count(*) from posts', 'count(*)') % 5) {
					$pages_number = ceil(getSingleResult('select count(*) from posts', 'count(*)') / 5);
				} else {
					$pages_number = getSingleResult('select count(*) from posts', 'count(*)') / 5;
				}

				$pagination_index = 0;
				while ($pages_number) {
					$pagination_index += 1;
					if ($pagination_index == $data['page']) {
						$post_list .= '<li class="active_index">';
					} else {
						$post_list .= '<li>';
					}
					$post_list .= '<a href="blog.php?page=' . $pagination_index . '">' . $pagination_index . '</a>
						   </li>';
					$pages_number -= 1;
				}
				$post_list .= '
					 </ul>
					</div>
					<div class="clearfix"></div>';
				return $post_list;

			case "NewPostHeader" :
				if (check_permission('create_post')) {
					return '<div class="container">
				<form style="margin-top: -20px;" action="postManager.php" method="post">
					<button name="action" value="new" class="btn btn-sm btn-success">
						<i class="icon-plus" ></i> Create New Post
					</button>
				</form>
			</div>';
				} else {
					return "";
				}
		}

	}

	/* Recent Posts Lists */
	function RecentPostsList($name, $data, $pars) {
		$query = getResult("select * from posts order by datetime limit 0, 5");
		switch($name) {
			/* Recent Posts on Footer */
			case "Recent_Post_Footer" :
				$recent_post = '<ul>';
				foreach ($query as $key => $value) {
					$recent_post .= '<li><a href="blogsingle.php?id=' . $value['id'] . '">' . $value['title'] . '</a></li>';
				}
				$recent_post .= '</ul>';
				return $recent_post;
				break;
			default :
				$recent_post = '<div class="sidebar">
							<div class="widget">
								<h4>Recent Posts</h4>
								<ul>';
				foreach ($query as $key => $value) {
					$recent_post .= '<li><a href="blogsingle.php?id=' . $value['id'] . '">' . $value['title'] . '</a></li>';
				}
				$recent_post .= '</ul>
							</div>
				 		</div>';
				return $recent_post;
		}

	}

	/* Search Sidebar */
	function SearchSidebar($name, $data, $pars) {
		$search = '<div class="sidebar cwell">
					<div class="widget">
						<h4>Search</h4>
						<div class="row">
								<div class="col-sm-12">
									<input class="form-control searchText" placeholder="Search Blog Post..." type="text" >
									<button style="margin-top: 5px;float: right;" class="btn btn-md btn-info blog_search_button">Search <i class="icon-zoom-in"></i></button>
								</div>
							</div>
						</div>
					</div>';
		return $search;
	}

	/* Single Blog Post */
	function SingleBlogPost($name, $data, $pars) {
		switch($name) {
			case "Post_Content" :
				/* Post Information */
				$post_data = getResult('select * from posts where id=' . $data['id'] . '');
				$comments_number = getSingleResult('select count(*) from comments where post=' . $data['id'] . '', 'count(*)');
				foreach ($post_data as $key => $value) {
					$result .= '<div class="cwell entry">
								<h2>
								<a href="#">' . $value['title'] . '</a>';

					if (check_permission("edit_post") && check_permission("delete_post")) {
						$result .= '<div style="float:right;">
				  		 <form action="updateDeletePost.php" method="post">
				   			<button name="edit" value="' . $value['id'] . '" class="btn btn-xs btn-warning"><i class="icon-pencil" ></i></button>
				   			<button name="remove" value="' . $value['id'] . '" class="btn btn-xs btn-danger"><i class="icon-remove" ></i></button>
				   		 </form>
				   		</div>';
					} else {

						if (check_permission("edit_post")) {
							$result .= '<div style="float:right;">
				  		 <form action="updateDeletePost.php" method="post">
				   			<button name="edit" value="' . $value['id'] . '" class="btn btn-xs btn-warning"><i class="icon-pencil" ></i></button>
				   		 </form>
				   		</div>';
						} else {

							if (check_permission("delete_post")) {
								$result .= '<div style="float:right;">
				  		 <form action="updateDeletePost.php" method="post">
				   			<button name="remove" value="' . $value['id'] . '" class="btn btn-xs btn-danger"><i class="icon-remove" ></i></button>
				   		 </form>
				   		</div>';
							}
						}
					}

					$result .= '</h2>
						<div class="meta">
							<i class="icon-calendar"></i>' . $value['datetime'] . ' 
							<i class="icon-user"></i>' . $value['username'] . ' 
							<span class="pull-right"><i class="icon-comment"></i> <a href="#">' . $comments_number . ' Comments</a></span>
						</div>
						
						<p>' . $value['text'] . '</p>';
				}
				return $result;
				break;

			case "Post_Comments" :
				$post_comments = getResult('select * from comments where post=' . $data['id'] . '');
				$result = '
				<div class="comments">
						<div class="title">
							<h5>Comments</h5>
						</div>';
				if (isset($data['mode'])) {
					$result .= '<ul class="comment-list visible">';
				} else {
					$result .= '<ul class="comment-list">';
				}
				foreach ($post_comments as $key => $value) {
					$result .= '
							<li class="cwell comment">
								<div class="comment-author">
									<a href="#">' . $value['username'] . '</a>';

					/**/
					if (check_permission("edit_comment") && check_permission("delete_comment")) {
						$result .= '<div style="float:right;">
				   						<button value="' . $value['id'] . '" name="' . $value['id'] . '" class="update_comment btn btn-xs btn-warning"><i class="icon-pencil" ></i></button>
				   						<button value="' . $value['id'] . '" name="' . $value['id'] . '" class="remove_comment btn btn-xs btn-danger"><i class="icon-remove" ></i></button>
				   					</div>';
					} else {

						if (check_permission("edit_comment")) {
							$result .= '<div style="float:right;">
				   						<button value="' . $value['id'] . '" name="' . $value['id'] . '" class="update_comment btn btn-xs btn-warning"><i class="icon-pencil" ></i></button>
				   					</div>';
						} else {

							if (check_permission("delete_comment")) {
								$result .= '<div style="float:right;">
				   						<button value="' . $value['id'] . '" name="' . $value['id'] . '" class="remove_comment btn btn-xs btn-danger"><i class="icon-remove" ></i></button>
				   					</div>';
							}
						}
					}

					$result .= '</div>
								<div class="cmeta">
									Commented on ' . $value['datetime'] . '
								</div>
								<p>' . $value['text'] . '</p>
								<form action="#" role="form" method="get" class="editComment">
									<div class="form-group">
										<textarea name="text" class="form-control" rows="3" required>' . $value['text'] . '</textarea>
									</div>
									<button type="button" name="id" value="' . $value['id'] . '" style="float: right;" class="btn btn-success">Confirm</button>
									<div class="clearfix"></div>
								</form>
							</li>';
				}
				$result .= '
						</ul>
					</div>';

				if (check_permission("create_comment")) {
					$result .= '<div class="respond">
						<div class="title">
							<h5>Leave a Comment</h5>
						</div>
						<form action="addComment.php" role="form" method="post">
							<div class="form-group">
								<textarea name="text" class="form-control" rows="3" placeholder="Type here your comment...	" required></textarea>
							</div>
							<button name="post" value="' . $data['id'] . '" type="submit" class="btn btn-info">
								Submit
							</button>
							<button type="reset" class="btn btn-default">
								Reset
							</button>
						</form>						
					</div>';
				}
				return $result;
				break;

			case 'Post_Navigation' :
				/*select id from posts where id > $_POST['id'] order by id desc limit 1*/
				$previous_index = getSingleResult("select * from posts where id < " . $data['id'] . " order by id desc limit 1", "id");
				$next_index = getSingleResult("select * from posts where id > " . $data['id'] . " order by id asc limit 1", "id");
				$result .= '<div class="navigation button">';
				/* Left Arrow if not first */
				if ($previous_index != 'error') {
					$result .= '<div class="pull-left">
							 <a href="blogsingle.php?id=' . $previous_index . '" class="btn btn-info">&laquo; Previous Post</a>
						    </div>';
				}
				if ($next_index != 'error') {
					$result .= '<div class="pull-right">
							 <a href="blogsingle.php?id=' . $next_index . '" class="btn btn-info">Next Post &raquo;</a>
						    </div>';
				}
				$result .= '
							<div class="clearfix"></div>
							</div>
							<div class="clearfix"> </div>
							<br>';
				return $result;
		}

	}

	function ItemDetails($name, $data, $pars) {
		$content = "";
		switch ($pars['value']) {
			case 'sex' :
				if ($data[0]['sex'] == 'M') {
					$content .= "icon-male";
				} else {
					$content .= "icon-female";
				}
				break;
			case 'name' :
				$content .= $data[0]['name'];
				break;
			case 'itemid' :
				$content .= $data[0]['id'];
				break;
			case 'image' :
				$res_images = getResult("SELECT * FROM items_images WHERE items_images.item={$data[0]['id']}");
				$content .= $res_images[0]['path'];
				break;
			case 'imageid' :
				$image_id = getResult("SELECT * FROM items_images WHERE items_images.item={$data[0]['id']}");
				$content = $image_id[0]['id'];
				break;
			case 'color' :
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
			case 'size' :
				$first_colour = getSingleResult("SELECT * FROM items_images WHERE items_images.item={$data[0]['id']} limit 1", "colour");
				$item = $data[0]['id'];
				$size_of_first_item = getResult("select size from availability where item={$item} and colour='{$first_colour}'");
				/*take the size available of the first item*/
				foreach ($size_of_first_item as $key => $value) {
					$content .= "<option>{$value['size']}</option>";
				}
				break;
			case 'thumbs' :
				$res_images = getResult("SELECT * FROM items_images WHERE items_images.item={$data[0]['id']}");
				if ($res_images > 0)
					for ($i = 1; $i < min(4, count($res_images)); $i++) {
						$content .= '<div class="left-side-item col-lg-9 col-md-9 col-sm-9 col-xs-9">
                                    <div class="left-side-thumb item-thumb" style="padding:10px ">
                                    <button  value=' . $res_images[$i]['id'] . ' class="item_image_button"><img style="max-width:117px; max-heigth:148px;" src="' . $res_images[$i]['path'] . '" alt="" class="img-responsive item_page_image "/></button>
                                    <div class="selected_image_colour"  style="height:5px;background-color:' . $res_images[$i]['colour'] . '"></div>
                                    </div>
                                    </div>';
					}
				break;
			case 'discount' :
				if ($data[0]['discount'] > 0) {
					$content .= " (-" . $data[0]['discount'] . "%)";
				} else {
					$content .= "";
				}
				break;
			case 'price' :
				$content .= floor($data[0]['price'] - $data[0]['price'] * $data[0]['discount'] / 100) . ",00 $";
				break;
			case 'brand' :
				$res_brand = getResult("SELECT brand_name FROM brands WHERE id={$data[0]['brand']}");
				$content .= $res_brand[0]['brand_name'];
				break;
			case 'availability' :
				$first_colour = getSingleResult("SELECT * FROM items_images WHERE items_images.item={$data[0]['id']} limit 1", "colour");
				$res_quantity = getResult("SELECT * FROM availability WHERE item={$data[0]['id']} and colour='{$first_colour}'");
				if (!$res_quantity) {
					$content .= "<p style='color:red'>Out of Stock</p>";
				} else {
					$content .= "<p style='color:green'>In Stock</p>";
				}
				break;
			case 'description' :
				$content .= $data[0]['description'];
				break;
			case 'crumb' :
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
			case 'review_count' :
				$count = getSingleResult("SELECT COUNT(*) as count FROM reviews WHERE item={$data[0]['id']}", "count");
				return $count;
				break;
			default :
				break;
		}
		return $content;
	}

	function ItemReviews($name, $data, $pars) {

		foreach ($data as $key => $value) {
			$content .= '<div class="item-review cwell review_cwell">';
			if ((check_permission("edit_review") && check_permission("delete_review")) || $value['username'] == $_SESSION['user']['username']) {
				$content .= '	<div style="float:right;">
				  				 <form action="updateReview.php" method="post">
				   				<button name="edit" value="' . $value['id'] . '" class="btn btn-xs btn-warning edit_review_button"><i class="icon-pencil" ></i></button>
				   				<button name="remove" value="' . $value['id'] . '" class="btn btn-xs btn-danger"><i class="icon-remove" ></i></button>
				   				</form>
				  				 </div>';
			} else if (check_permission("edit_review")) {
				$content .= '	<div style="float:right;">
				  				 <form action="updateReview.php" method="post">
				   				<button name="edit" value="' . $value['id'] . '" class="btn btn-xs btn-warning edit_review_button"><i class="icon-pencil" ></i></button>
				   				</form>
				  				 </div>';

			} else if (check_permission("delete_review")) {
				$content .= '	<div style="float:right;">
				  				 <form action="updateReview.php" method="post">
				   				<button name="remove" value="' . $value['id'] . '" class="btn btn-xs btn-danger"><i class="icon-remove" ></i></button>
				   				</form>
				  				 </div>';

			}
			$content .= '<h5> ' . $value["username"] . ' - <span class="color">' . $value["rating"] . '/5</span></h5>
						<p class="rmeta">' . $value["date"] . '</p>
						<p class="text_review" >' . $value["text"] . '</p>
						<form action="updateReview.php"  method="post" class="editReview">
									<textarea maxlength="200" name="text" class="form-control text_review_edit" style="width:560px; resize: none;" rows="6"></textarea>
									<button  name="edit" value="' . $value['id'] . '" style="float: right;" class="btn btn-success">Confirm</button>
									<div class="clearfix"></div>
								</form>
						</div>';
		}
		return $content;
	}

	/* Left Sidebar Navigation */
	/* Left Sidebar Navigation */
	/* Left Sidebar Navigation */
	function LeftSideBar($name, $data, $pars) {

		/* Man, Women & Accessories Categories */
		$leftSideBar = '<div class="cwell sidebar">
							<div  class="widget">
							
							
								<h3 >Main Categories</h3>
								<ul style="list-style: none; padding-left: 5px;">
									<li><a id="leftSidebarMen" href="">Men</a></li>
									<li><a id="leftSidebarWomen">Women</a></li>									
								</ul>
								<div class="sep-bor"></div>
								<h3>Subcategories</h3>';
		$query = getResult("select * from categories");
		$firstTime = 1;
		foreach ($query as $key => $value) {
			if ($firstTime) {
				$leftSideBar .= '<ul style="list-style: none; padding-left: 5px;">';
				$firstTime = 0;
			}
			$leftSideBar .= '<li><a href="" class="leftSideBarSubcategories">' . $value["cat_name"] . '</a></li>';
		}
		if (!$firstTime) {
			$leftSideBar .= '</ul>';
		}
		$leftSideBar .= '<div class="sep-bor"></div>
							<h3>Our Suggestions</h3>
							<ul style="list-style: none; padding-left: 5px;">
								<li><a id="leftSidebarSale">On Sale</a></li>
								<li><a id="leftSidebarNewArrivals">New Arrivals</a></li>
								<li><a id="leftSidebarBestSeller">Best Sellers</a></li>
							</ul>
						<div class="sep-bor"></div>
							<h3>Brands</h3>
							<div class="row">
								<div class="col-sm-12">
									<input id="brandSearch" class="form-control searchText" placeholder="Search Brand" type="text">
								</div>
							</div>
							<div class="row">
								<div class="cwell col-sm-12">
									<ul id="brandList" style="list-style: none; padding-left: 5px;">
									<div class="cwell"><h3 style="text-align: center;">"Brands Search"<br> Type a brand name above<span class="color"> !!!</span></h3></div>
								</ul>
									
								</div>
							</div>
							<div class="sep-bor"></div>
							<h3>Colors</h3>
							<div class="row">
								
								<div class="color-container cwell col-sm-12">
									
																	
								</div>
								
							</div>
							<div class="sep-bor"></div>
							<h3 >Price Range</h3>
							<div style="text-align: center;"class="row">
								<div class="col-sm-12">
									<label>Min Price</label>
									<input style="border-radius: 5px;text-align: center;" id="showMin" value="0">
								</div>
								<div class="col-sm-12">
									<label>Max Price</label>
									<input style="border-radius: 5px;text-align: center;" id="showMax" value="99">
								</div>
							</div>
							<div class="row">
								<div class="cwell col-sm-12">
									<div class="noUiSlider"></div>
								</div>
							</div>
						</div>
						</div>';

		return $leftSideBar;

	}

	function TagsContainer($name, $data, $pars) {
		$tagsContainer = '<div class="cwell row" style="margin-bottom: 17px; margin-top: -15px;">
			<div id="searchTagsContainer" class="col-md-12 col-sm-12 col-lg-12">';
		if (isset($data['sex'])) {
			if ($data['sex'] == 'M' || $data['sex'] == 'm') {
				$tagsContainer .= ' <a id="MenTag" href="" class="main_Tag btn btn-primary btn-xs"><i class="icon-remove"></i> Men</a>';
			} elseif ($data['sex'] == 'F' || $data['sex'] == 'f') {
				$tagsContainer .= ' <a id="WomenTag" href="" class="main_Tag btn btn-women btn-xs"><i class="icon-remove"></i> Women</a>';
			}
		}
		if (isset($data['brand'])) {
			/* ho chiamato items.php?brand=brand_id */
			$tagsContainer .= ' <a href="" class="brand_Tag btn btn-brand btn-xs"><i class="icon-remove"></i>' . $data['brand'] . '</a>';
			/* inserisco un tag con il nome della marca */
		}
		if (isset($data['cat'])) {
			$cat_name = getSingleResult("select cat_name from categories where id=" . $data['cat'] . "", "cat_name");
			$tagsContainer .= ' <a href="" id="' . $data['cat'] . '"class="Subcategories_Tag btn btn-subcategories btn-xs"><i class="icon-remove"></i>' . $cat_name . '</a>';
		}

		if (isset($data['tag'])) {
			switch($data['tag']) {
				case 'onsale' :
					$tagsContainer .= ' <a id="SaleTag" href="" class="special_Tag btn btn-warning btn-xs"><i class="icon-remove"></i> On Sale</a>';
					break;
				case 'new' :
					$tagsContainer .= ' <a id="NewArrivalsTag" href="" class="special_Tag btn btn-success btn-xs"><i class="icon-remove"></i> New Arrivals</a>';
					break;
				case 'best_sellers' :
					$tagsContainer .= ' <a id="BestSellersTag" href="" class="special_Tag btn btn-danger btn-xs"><i class="icon-remove"></i> Best Sellers</a>';
					break;
			}
		}

		$tagsContainer .= '</div>
							<hr/>
							<div class="pull-right" >
								<a id="removeAllTags" href="" class="btn btn-inverse btn-sm"><i class="icon-remove"> </i> Remove All Filters</a>
							</div>
						</div>';
		return $tagsContainer;
	}

	function Brands($name, $data, $pars) {
		$content = '';
		foreach ($data as $key => $value) {

			$content .= '<li><a href="items.php?brand=' . $value['brand_name'] . '"><div class="carousel_caption">
                                          <img src="' . $value['brand_pic'] . '" alt="' . $value['brand_name'] . '" class="img-imgresponsive"/>
                                      </div></a></li>';
		}
		return $content;
	}

}
?>
