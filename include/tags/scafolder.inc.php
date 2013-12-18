<?php


Class scafolder extends tagLibrary {
	
         function injectStyle() {
	
		/* $css = new Template("include/tags/hiermenu.css");
		return $css->get(); */
		
		return "";
	
                
            }
    
    
	function redirecttourl($name, $data, $pars)
        {
           $seconds=$data[0];
           $url=$data[1];
           header("Refresh:$seconds; url=$url");
           //header('Refresh: 5; url=index.php');
        }
        
        function recuperapass($name, $data, $pars) {
    
    $result = "";
    $bad = "ERRORE: Non sei registrato nel sistema!!!";
    $result.="La tua password &egrave;: ";
    if(empty($data)){
        return $bad;
    }
    foreach($data as $k => $v) {
            $pass=$v[$pars['password']];
    }
    $result.=$pass;
    $result.="<br> Si prega di annotarla e conservarla in luogo sicuro lontano da renzi!!!<br><br>";
    $result.="Clicca <a href=\"index.php\">qui</a> per tornare alla home.";
        return $result;
}
        
        
        
        
       
        
}

?>





