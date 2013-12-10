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


Class aqua extends taglibrary {

	/* function injectJS() {

	}

	function includeJS() {
		
	} */

	function injectStyle() {
			
	}
	
	function tabs($name, $data, $pars) {
		/* $data is 'parent' */	
	
		global $newsEntity, $newsCatEntity;
	
		$content = new Template("skins/aqua/dtml/tabs.html");

		
		if (isset($data)) {
			if ($data == 0) {
				return "";
			} else {
				$parent = $data;
			}
		} else {
			if (isset($pars['parent'])) {
				$parent = $pars['parent'];
			} else {
				return "";
			}
		}
		
		if (isset($pars['title'])) {
			$content->setContent("name", $pars['title']);
		} else {
			$content->setContent("name", "Tidbits");
		}
		
		
		$oid = mysql_query("
				SELECT id, name
				FROM newscat 
				WHERE parent = {$parent}
				ORDER BY position 
				LIMIT {$pars['count']}
			");
		
		$index = 0;
		do {
			$cat = mysql_fetch_assoc($oid);
			
			if ($cat) {
				$index++;
				$content->setContent("category", $cat['name']);
				$content->setContent("index", $index);
				$content->setContent("catindex", $index);
				$content->setContent("newscat_id", $cat['id']);
				
				$oid2 = mysql_query("
						SELECT news.id, 
						       news.title, 
						       news.body, 
							   news.date,
						       news.category 
						FROM news 
						LEFT JOIN newscat 
						ON newscat.id = news.category 
						WHERE newscat.id = {$cat['id']}
						ORDER BY news.date DESC
						LIMIT 4
					");
				
				
				do {
					$data = mysql_fetch_assoc($oid2);
					if ($data) {
						$content->setContent("title", $data['title']);
						$content->setContent("id", $data['id']);
						
					}
				} while ($data);
				
			} 
			
		} while ($cat);
		
		
				
		return $content->get();	
			
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
	
				 
				aqua::FindChildren($menu_data[$i]['id'],$level+1);
	
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
	
	
	function news($name,$data,$pars) {
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
				//$pars['parent'] = $GLOBALS['store']['page_menu'];
				$pars['parent'] = $data;
			}
	
	
		}
	
	
	
		$oid = mysql_query("
				SELECT DISTINCT newscat.id,
				       newscat.name AS entry,
				       newscat.parent AS parent_id
                       
				  FROM newscat
             LEFT JOIN news
                    ON news.category = newscat.id
                 WHERE news.title is not null or newscat.parent = 0
			  ORDER BY newscat.position
			");
				
	
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
	
		aqua::FindChildren($pars['parent'],0);
	
		/* main menu (at depth 1) */
				
		if (!isset($pars['ulclass'])) {
			$content .= "<ul>\n";
		} else {
			$content .= "<ul class=\"{$pars['ulclass']}\">\n";
		}
		
		$id = uniqid(time());
	
		$level = 0;
		for($i=0; $i<count($menu_tree_value); $i++) {
				
			if (($menu_tree_level[$i] > $level) and ($menu_tree_level[$i] < $pars['depth'])) {
				$content .= "<div>\n<ul>\n";
				$level = $menu_tree_level[$i];
			}
				
				
			if ($menu_tree_level[$i] < $level) {
				for($j=$menu_tree_level[$i];$j<$level; $j++) {
					$content .= "</ul>\n";
				}
				$level = $menu_tree_level[$i];
			}
			
			if ($menu_tree_level[$i] < $pars['depth']) {
		
				$link = $this->link("news.php?news_category={$menu_tree_value[$i]}");
						
				if ($menu_tree_level[$i] == 0) {
					
					if ($menu_tree_depth[$i] > 0) {
						$content .= "<li><span class=\"hover_span\"></span><span class=\"link_span\">".ucfirst(strtolower($menu_tree_text[$i]))."</span>";
					} else {
						$content .= "<li><span class=\"hover_span\"></span><span class=\"link_span\">".ucfirst(strtolower($menu_tree_text[$i]))."</span>";						
					}
				
				} else { 
					$content .= "<li><a href=\"{$link}\"><span class=\"hover_span\"></span><span class=\"link_span\">{$menu_tree_text[$i]}</span></a>";
				}
					
				
	
				if (!(($menu_tree_level[$i+1] > $level) and ($menu_tree_level[$i+1] < $pars['depth']))) {
					$content .= "</li>\n";			
				}
			}
		}
	
		for($j=0; $j<$level; $j++) {
			$content .= "</ul></div></li>\n";	
		}
		$content .= "</ul>\n";
	
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
	
	
	
	function breadcrumb($name, $data, $pars) {
		
		/*	$result = "<div class=\"breadcrumb\">\n";
		$result .= "<a href=\"index.php\" class=\"first_bc\"><span>Home</span></a>\n";
		
		$rows = aux::getResult("SELECT * FROM MENU");
		
		$page_id = $_REQUEST['page_id'];
		$done = false;
		
		do {
			$found = false;
			
			foreach ($rows as $index => $item) {
				
				echo "** {$page_id} - {$item['page_id']}<br>";
				if (($page_id == $item['page_id']) and (!$found)) {
					$path[] = $index;
					$found = true;
				}
			}
			$rows[$path[count($path)-1]]
			
		} while ($done);
		
		//$result .= "<a href=\"page.php?page_id={$rows[$menu_index][page_id]}\" class=\"last_bc\"><span>{$rows[$menu_index]['entry']}></span></a>";
			
		
		$result .= "</div>\n";
		
		return $result;*/
	}

	function welcome($name, $data, $pars) {
		
		if ($data-date('YmdHm') > 7) {
			return ", already here - well done, you logged just few days ago!";
		} else {
			return ", where have you been? you logged so long ago! Keep you profile updated!";
		}
	}
	
	
}

?>
