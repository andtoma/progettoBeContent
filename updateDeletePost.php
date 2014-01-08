<?

require "include/dbms.inc.php";

if (isset($_POST['remove'])) {
	/* Remove Operation */

	$oid = mysql_query("delete from posts where id=" . $_POST['remove'] . "") or die(mysql_error());
	header('Location:blog.php');

} else {

	if (isset($_POST['edit'])) {
		/* Edit Operation */

		/* Blog Post Title */
		$title = getSingleResult("select * from posts where id=" . $_POST['edit'] . "", "title");
		/* Blog Post Text */
		$text = getSingleResult("select * from posts where id=" . $_POST['edit'] . "", "text");
		/* Blog Post ID */
		$id = $_POST['edit'];
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, "http://localhost/progettoBeContent/postManager.php");
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, "action=edit&title=".$title."&text=".$text."&id=".$id."");
		curl_exec($ch);
		curl_close($ch);
		
	}

}
?>