<?php

function match_verifier($data1, $data2) {
	foreach ($data1 as $key => $value) {
		if (in_array($value, $data2)) {
			return true;
		}
	}
	return false;
}

function check_permission($service) {
	/* groups with the service */
	$q1 = ("select grp from services_groups where service=(select id from services where name='{$service}')");

	$data1 = getResult($q1);

	/*user group*/
	$q2 = ("select grp from users_groups where user ='{$_SESSION['user']['id_user']}'");

	$data2 = getResult($q2);

	/*looking for common elements in the 2 arrays */
	return match_verifier($data1, $data2);

}

session_start();

require "include/dbms.inc.php";


/* Query matching results */

$query = getResult("select * from posts where title like '%{$_REQUEST['what']}%'");

if (!$query) {
	echo "error";
} else {

	if (!isset($_REQUEST['page'])) {
		$_REQUEST['page'] = 1;
	}
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
		$post_list .= '</h2>
				   <div class="meta">
				   	<i class="icon-calendar"></i>' . $value['datetime'] . '
				   	<i class="icon-user"></i>' . $value['username'] . '				   	
				   	<i class="icon-comment"></i> <a href="blogsingle.php?id=' . $value['id'] . '&mode=1">'.$comments_number.' Comments </a></span>
                   </div>
				   <div class="bthumb">
						<a href="#"><img src="'.$value['picture'].'" alt="" class="img-responsive"/></a>
				   </div>
				   <p>' . substr($value['text'],0, 200) . '...' . '</p>
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
	echo htmlentities($post_list);
}
?>