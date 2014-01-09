<?php

session_start();

require_once "include/permissions.inc.php";

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
				$content .= '<li>
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
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i class="icon-search"></i>View Details</a>
                                 <a data-toggle="modal" data-id=' . $value['item'] . ' href="#quickshop" class="btn btn-danger btn-sm open-AddBookDialog modal-title">Buy for &#36;' . $value['price'] .
                              '</a>
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
			$query_shoppingcart = "SELECT name, quantity, price 
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
			$query_shoppingcart = "SELECT name, quantity,colour,size, price 
                                   FROM items INNER JOIN cart ON items.id=cart.item 
                                   WHERE cart.user=" . $_SESSION['user']['id'];
			$res_shoppingcart = getResult($query_shoppingcart);
			foreach ($res_shoppingcart as $key => $value) {
				$content .= '<tr>
                                <td><a href="single-item.php?id=' . $value['id'] . '">' . $value['name'] . '</a></td>
                                <td>' . $value['colour'] . '</td>
                      	        <td>' . $value['size'] . '</td>
                                <td>' . $value['quantity'] . '</td>
                                <td>&#36;' . ($value['price'] * $value['quantity']) . '</td>
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

	/*
	 function TotalPrice($name, $data, $pars) {
	 $tot_price = 0;
	 if (isset($_SESSION['user'])) {
	 # QUERY: TOTAL PRICE
	 $query_totalprice = 'SELECT SUM(price) AS tot_price
	 FROM cart INNER JOIN items ON cart.item=items.id_item
	 WHERE cart.user=' . $_SESSION['user']['id'];
	 $res_totalprice = getResult($query_totalprice);

	 foreach ($res_totalprice as $key => $value) {
	 $tot_price += $value['tot_price'];
	 }
	 }
	 return $tot_price;
	 }
	 */
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
		$max = 3;
		foreach ($data as $key => $value) {
			$content .= '<tr>
                            <td>' . $value['datetime'] . '</td>
                            <td>' . $value['name'] . '</td>
                            <td>' . $value['colour'] . '</td>
                            <td>' . $value['size'] . '</td>
                            <td>' . $value['quantity'] . '</td>
                            <td>&#36;' . $value['price'] . '</td>
                           <td><form action="delete_order.php"  method="post">
                           <button name="delete" value=' . $value["id"] . ' class="btn btn-danger" type="submit">
							<i class="icon-remove" ></i>
							</button></div></form>  
							</form></td>
                        </tr>';
			if (!(--$max))
				break;
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
								<input type="text" pattern="[0-9]" name="quantity" title="Only positive integers allowed, from 0 to 9" value=' . $value['quantity'] . ' class="form-control quantity">
								<span class="input-group-btn">
									<button name="update"  class="btn btn-info validate_quantity" type="submit"">
										<i class="icon-refresh"></i>
									</button>
									<button name="delete" class="btn btn-danger" type="submit">
										<i class="icon-remove"></i>
									</button>
							 </span></div>    </form>   </td>
                            <td class="partial">&#36;' . $value['partial'] . '</td>
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
			case 'image' :
				$res_images = getResult("SELECT * FROM items_images WHERE items_images.item={$data[0]['id']}");
				$content .= $res_images[0]['path'];
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
				$res_sizes = getResult("SELECT * FROM availability WHERE item={$data[0]['id']}");
				foreach ($res_sizes as $key => $value) {
					$content .= "<option>{$value['size']}</option>";
				}
				break;
			case 'thumbs' :
				$res_images = getResult("SELECT * FROM items_images WHERE items_images.item={$data[0]['id']}");
				if ($res_images > 0)
					for ($i = 1; $i < min(4, count($res_images)); $i++) {
						$content .= '<div class="left-side-item col-lg-9 col-md-9 col-sm-9 col-xs-9">
                                    <div class="left-side-thumb item-thumb" style="padding:10px ">
                                    <a href=""><img src="' . $res_images[$i]['path'] . '" alt="" class="img-responsive"/></a>
                                    <div style="height:5px;background-color:' . $res_images[$i]['colour'] . '"></div>
                                    </div>
                                    </div>';
					}
				break;
			case 'price' :
				$content .= $data[0]['price'];
				break;
			case 'brand' :
				$res_brand = getResult("SELECT brand_name FROM brands WHERE id={$data[0]['brand']}");
				$content .= $res_brand[0]['brand_name'];
				break;
			case 'availability' :
				$res_quantity = getResult("SELECT * FROM availability WHERE item={$data[0]['id']}");
				if (!$res_quantity) {
					$content .= "Out of Stok";
				} else {
					$content .= "In Stock";
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
			default :
				break;
		}
		return $content;
	}

}
?>
