<?php

	/*
	
	This file is part of beContent.

    Foobar is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Foobar is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with beContent.  If not, see <http://www.gnu.org/licenses/>.
    
    http://www.becontent.org
    
    */


Class hiermenu extends taglibrary {

	/* function injectJS() {

	}

	function includeJS() {
		
	} */

	function injectStyle() {
		
		$css = new Template("include/tags/hiermenu.css");		
		return $css->get();
		
	}

	function mkIndent($level) {
		global $globalLevel;
			
		$globalLevel = 0;
		$result = "";
		
		if ($globalLevel < $level) {
			$result .= "<ul>\n";	
		}
		
		if ($globalLevel > $level) {
			$result .= "</ul>\n";	
		}
		
		$result .= "<li>";
		
		
		return $result;
	}
	
	function FindChildren ($parent, $level) {
  		global 
    		$menu_flag, 
    		$menu_data,
    		$menu_tree,
    		$menu_tree_text,
    		$menu_tree_value,
    		$menu_tree_link,
    		$menu_tree_level,
    		$menu_tree_page,
    		$menu_tree_depth,
    		
    		$menu_undef_flag;
  
    	
  
  		for ($i=0;$i<count($menu_data);$i++) {
    
    		if (($menu_data[$i]['parent_id'] == $parent) and (!isset($menu_flag[$i]))) {
      
    			$menu_tree[] = $menu_data[$i];
      			
    			$menu_tree_value[] = $menu_data[$i]['id'];
      			$menu_tree_text[] = $menu_data[$i]['entry'];
      			$menu_tree_link[] = $menu_data[$i]['link'];
      			$menu_tree_page[] = $menu_data[$i]['page_id'];
      			
      			$menu_tree_level[] = $level;
      			$menu_tree_depth[$parent]++;
      			
      			$menu_flag[$i]=true;
      		
      			
      			hiermenu::FindChildren($menu_data[$i]['id'],$level+1);
      
    		}
  		}
	} 
	
	
	function link($link) {
		
		if (ereg("^\{([[:alnum:]]*)\}\?([[:alnum:]]*)$", $link, $token)) {
			
			switch ($token[1]) {
				case "urlappend":
					
					$query_string = $_SERVER['QUERY_STRING'];
		
					if ($query_string == "") {
						$result = basename($_SERVER['SCRIPT_NAME'])."?{$token[2]}";
					} else {
						
			
						$query_string = ereg_replace("&{$token[2]}$", "", $query_string);
						$query_string = ereg_replace("\?{$token[2]}$", "", $query_string);	
						$result = basename($_SERVER['SCRIPT_NAME'])."?{$query_string}&{$token[2]}";
					}
					
					break;
				default:
						$result = $link;
					break;
			}
				
		} else {
			
			$result = $link;
		}
		
		return $result;
	}
	
	
	function menu($name,$data,$pars) {
		global 
    		$menu_flag, 
    		$menu_data,
    		$menu_tree,
    		$menu_tree_text,
    		$menu_tree_value,
    		$menu_tree_link,
    		$menu_tree_level,
    		$menu_tree_page,
    		$menu_tree_depth,
    		
    		$menu_undef_flag;
    		
    	if (!isset($pars['depth'])) {
    		$pars['depth'] = 100;
    	}
    	
    	if (!isset($pars['parent'])) {
    		
    		if (!isset($data)) {
    			$pars['parent'] = 0;
    		} else {
    			$pars['parent'] = $data;
    		}
    		
    	}
		
		
		
		$oid = mysql_query("SELECT menu.id,
		                           menu.entry AS entry,
		                           menu.link, 
		                           menu.page_id,
		                           menu.parent_id
							  FROM menu
		                  ORDER BY position");
		
		if (!$oid) {
			echo "Error";
			exit;
		}
		
		do {
			$data = mysql_fetch_assoc($oid);
			if ($data) {
				$menu_data[] = $data;
		
			}
			
		} while ($data);
		
		hiermenu::FindChildren($pars['parent'],0);
		
		if ($pars['mode'] == "inline") {
			
			if ($pars['prefix'] == true) {
				$content = " | ";
			} else {
				$content = "";
			}
		} else {

			/* main menu (at depth 1) */
			
			if (!isset($pars['ulclass'])) {
				$content .= "<ul>\n";
			} else {
				$content .= "<ul class=\"{$pars['ulclass']}\">\n";
			}
		}	
		
		$id = uniqid(time());
		
		$level = 0;
		for($i=0; $i<count($menu_tree_value); $i++) {
			
			if (($menu_tree_level[$i] > $level) and ($menu_tree_level[$i] < $pars['depth'])) {
				
				if ($pars['mode'] == "inline") {
					$content .= "";	
				} else {
					
					/* Submenu at depth > 1 */
					
					$content .= "<div>\n<ul>\n";
				}	
				
				$level = $menu_tree_level[$i];
			} 
			
			
			if ($menu_tree_level[$i] < $level) {
				for($j=$menu_tree_level[$i];$j<$level; $j++) {
					
					if ($pars['mode'] == "inline") {
						$content .= "";	
					} else {
						$content .= "</ul>\n";
					}
				}
				$level = $menu_tree_level[$i];
			}
			
			$preamble = "";
			if ($menu_tree_level[$i] > 0) {
				$preamble = "";
			} 
			
			if ($menu_tree_level[$i] < $pars['depth']) {
				
				if ($menu_tree_link[$i] != "") {
					
					$link = $this->link($menu_tree_link[$i]);
					
					if ($pars['mode'] == "inline") {
						$content .= aux::first_comma($id," | ")."{$preamble} {$preamble} <a href=\"{$link}\">{$menu_tree_text[$i]}</a>";
					} else {
						
						if ($menu_tree_level[$i] == 0) {
							
							if ($menu_tree_depth[$i] > 0) {
								if ($pars['mode'] == "leftmenu") {
									#<li><a href="aa"><span class="hover_span"></span><span class="link_span">Graphic Design</span></a></li>
														
									$content .= "<li><a href=\"{$link}\"><span class=\"hover_span\"></span><span class=\"link_span\">{$menu_tree_text[$i]}</span></a>";
								} else {
									$content .= "<li>{$preamble} <a href=\"{$link}\">{$menu_tree_text[$i]}<span></span></a>";
								}
							} else {
								if ($pars['mode'] == "leftmenu") {
									#$content .= "<li>{$preamble} <a href=\"{$link}\">{$menu_tree_text[$i]}</a>";
									$content .= "<li><a href=\"{$link}\"><span class=\"hover_span\"></span><span class=\"link_span\">{$menu_tree_text[$i]}</span></a>";
									
								} else {
									$content .= "<li>{$preamble} <a href=\"{$link}\">{$menu_tree_text[$i]}</a>";
								}
							}
						} else {
							if ($pars['mode'] == "leftmenu") {
								#$content .= "<li>{$preamble} <a href=\"{$link}\"><span>{$menu_tree_text[$i]}</span></a>";
								$content .= "<li><a href=\"{$link}\"><span class=\"hover_span\"></span><span class=\"link_span\">{$menu_tree_text[$i]}</span></a>";
								
							} else {
								$content .= "<li>{$preamble} <a href=\"{$link}\"><span>{$menu_tree_text[$i]}</span></a>";
							}
						}
					}
				
				
				} else {
					
					if ($menu_tree_page[$i] == 0) {
						
						if ($pars['mode'] == "inline") {
							$content .= aux::first_comma($id," | ")."{$preamble} {$menu_tree_text[$i]}";
						} else {
							if ($pars['mode'] == "leftmenu") {
								$content .= "<li><span class=\"hover_span\"></span><span class=\"link_span\">{$menu_tree_text[$i]}</span>";
							} else {
								$content .= "<li>{$preamble} <span>{$menu_tree_text[$i]}</span>";
							}
						}
						
						
					} else {
						
						
						if ($pars['mode'] == "inline") {
							$content .= aux::first_comma($id," | ")."{$preamble} {$preamble} <a href=\"page.php?page_id={$menu_tree_page[$i]}\">{$menu_tree_text[$i]}</a>";
						} else {
							if ($menu_tree_level[$i] == 0) {
							
								if ($pars['mode'] == "leftmenu") {
									#<li><a href="aa"><span class="hover_span"></span><span class="link_span">Graphic Design</span></a></li>
									$content .= "<li><a href=\"page.php?page_id={$menu_tree_page[$i]}\"><span class=\"hover_span\"></span><span class=\"link_span\">{$menu_tree_text[$i]}</span></a>";
								} else {
									$content .= "<li>{$preamble} <a href=\"page.php?page_id={$menu_tree_page[$i]}\">{$menu_tree_text[$i]}<span></span></a>";
								}
							} else {
								if ($pars['mode'] == "leftmenu") {
									$content .= "<li><a href=\"page.php?page_id={$menu_tree_page[$i]}\"><span class=\"hover_span\"></span><span class=\"link_span\">{$menu_tree_text[$i]}</span></a>";
								} else {
									$content .= "<li>{$preamble} <a href=\"page.php?page_id={$menu_tree_page[$i]}\"><span>{$menu_tree_text[$i]}</span></a>";
								}
							}
						} 
					}
				}
				
				if (!(($menu_tree_level[$i+1] > $level) and ($menu_tree_level[$i+1] < $pars['depth']))) {
					
					if ($pars['mode'] == "inline") {
						$content .= "";
					} else {
						$content .= "</li>\n"; 
					}
					
					
				}
			}
		}
		
		for($j=0; $j<$level; $j++) {
			
			if ($pars['mode'] == "inline") {
				$content .= "";
			} else {
				$content .= "</ul></div></li>\n";
			}
			
			
		}
		
		if ($pars['mode'] == "inline") {
			$content .= "";
		} else {
			$content .= "</ul>\n";
		}
			
		
		
		unset($GLOBALS['menu_flag']); 
    	unset($GLOBALS['menu_data']);
    	unset($GLOBALS['menu_tree']);
    	unset($GLOBALS['menu_tree_text']);
    	unset($GLOBALS['menu_tree_value']);
    	unset($GLOBALS['menu_tree_link']);
    	unset($GLOBALS['menu_tree_page']);
    	unset($GLOBALS['menu_tree_level']);	
    	unset($GLOBALS['menu_undef_flag']);
    	
		return $content;
	}


	function path($name,$data,$pars) {
		
	
		if ($data != "") {
		
			$content = "";
			$id_menu = $data;
			do {
		
				$item = aux::getResult("SELECT menu.*,
					        				   pages.title,
								         	   pages.id AS pages_id 
				                          FROM menu
		            		         LEFT JOIN pages
		                        			ON pages.id = menu.page_id
					                     WHERE menu.id = {$id_menu}
		            			      ORDER BY position");
			
			
				$id_menu = $item[0]['parent_id'];
				
				if ($item[0]['link'] != "") {
					$content = "<a href=\"{$item[0]['link']}\">{$item[0]['entry']}</a>".aux::first_comma("path", " &raquo; ").$content;
				} else {
					$content = "<a href=\"page/".aux::seo_url($item[0]['title'])."/{$item[0]['pages_id']}-{$item[0]['id']}.htm\">{$item[0]['entry']}</a>".aux::first_comma("path", " > ").$content;
				}
					
			
			} while ($item[0]['parent_id'] != 0);
		
			return $content;
		}
	}
	
	function administrationMenu2($name, $data, $pars) {
	    
	    $content = "<div id=\"administrationMenu\">\n";
	    $content .= "<ul>\n";
	    $category = "";
	    
	    if (is_array($_SESSION['user']['services'])) {
	    
	 		foreach($_SESSION['user']['services'] as $service) {
	 			if ($category != $service['category']) {
	 			
	            	$content .= aux::first_comma("hiermenu", "</ul>\n");
	            	$content .= "<li><strong>{$service['category']}</strong></li>\n";
	            	$content .= "<ul>\n";
	            	$category = $service['category'];
	        	}
	        
	        	if (ereg("manager", $service['script'])) {
	        
		           $content .= "<li><a href=\"{$service['script']}?action=edit\">{$service['serviceName']}</a> |<a href=\"{$service['script']}?action=add\" title=\"Add\"><img src=\"img/add.png\"></a></li>\n";
	    	    } else {
	        	   $content .= "<li><a href=\"{$service['script']}\">{$service['serviceName']}</a></li>\n";
	        	}
	    	}
	    }
	    $content .= "</ul>\n";
	    $content .= "</div>\n";
	    $content .= "<div id=\"administrationMenuBottom\"></div>\n";
	    
	    
	    return $content;
	    
	}
	
	function administrationmenu($name, $data, $pars) {
	    
		$content = "";
		
	    #$content .= "<div id=\"administrationMenu\">\n";
	    $content .= "<ul class=\"adminmenu\">\n";
	    
	    
	    if (is_array($_SESSION['user']['services'])) {
	    
	 		foreach($_SESSION['user']['services'] as $service) {
	 			if ($service['visible'] == "*") {
	 			
	 			
		 			$items[$service['script']] = $service;
	 			}
	    	}
	    	
	    	$category = "";
	    	
	    	foreach($items as $v) {
	    	
	    		if ($category != $v['category']) {
	 			
	            	$content .= aux::first_comma("hiermenu", "</ul>\n");
	            	$content .= "<li><strong>{$v['category']}</strong></li>\n";
	            	$content .= "<ul>\n";
	            	$category = $v['category'];
	        	}
	        
	        
	        	
	        	
	        	if ($v['iconFilename'] == "") {
	        		if (ereg("manager", $v['script'])) {
		           		$content .= "<li><a href=\"{$v['script']}?action=edit\">{$v['serviceName']}</a> <a href=\"{$v['script']}?action=add\" title=\"Add\"><img class=\"add\"src=\"img/add.png\"></a></li>\n";
	    	   		 } else {
	        	   		$content .= "<li><a href=\"{$v['script']}\">{$v['serviceName']}</a></li>\n";
	    	   		 }
	        	} else {
	        		if (ereg("manager", $v['script'])) {
		        		$content .= "<li><a href=\"{$v['script']}?action=edit\">{$v['serviceName']}</a> <a href=\"{$v['script']}?action=add\" title=\"Add\"><div class=\"menuitem\"><img src=\"show.php?token=dd69ac8349deeaba8dabd8e1970ee215&id={$v['serviceId']}\"><img class=\"add-overlay\" src=\"img/add-overlay.png\"></div></a></li>\n";
	        	
	        		} else {
	        			$content .= "<li><a href=\"{$v['script']}?action=edit\">{$v['serviceName']}</a> <a href=\"{$v['script']}?action=add\" title=\"Add\"><div class=\"menuitem\"><img src=\"show.php?token=dd69ac8349deeaba8dabd8e1970ee215&id={$v['serviceId']}\"></div></a></li>\n";
	        		}
	        	}
	        	
	    	}
	    }
	    $content .= "</ul>\n";
	    #$content .= "</div>\n";
	    #$content .= "<div id=\"administrationMenuBottom\"></div>\n";
	    
	    
	    return $content;
	    
	}
	
	
}

?>
