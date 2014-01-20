<?

Class user_error extends taglibrary {

	function firstfunction() {
		return;
	}

	function print_error($name, $data, $pars) {
		switch($data) {
			case 0 :
				return;
				break;
			case 1 :
				return '<div class="alert alert-danger alert-dismissable">
                        <button type="button" class="close">&times;</button>
                        <strong>Warning!</strong> Invalid Email or Password.
                      </div>';
				break;
			case 2 :
				return '<div class="alert alert-danger alert-dismissable">
                        <button type="button" class="close">&times;</button>
                        <strong>Warning!</strong><br/> You are banned, please send an email to <a href="mailto:info@beClothing.com">info@beClothing.com</a> and ask for explanations.
                      </div>';
				break;		
			case 3 :
				return '<div class="alert alert-success alert-dismissable">
                        <button type="button" class="close">&times;</button>
                        <strong>Success!</strong><br/> Congratulations Your registration has been successful!!!<br/>You can now take advantage of member privileges to enhance your online shopping experience with us.
                      </div>';
				break;			
				
		}
	}

}
?>