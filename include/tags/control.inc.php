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


	
Class control extends taglibrary {
	
	
	
	function injectStyle() {
		
		
	}
	
	function store($name, $data, $pars) {
		$GLOBALS['store'][$name] = $data;
	}
	
	function ifempty($name,$data,$pars) {
		
		if ($data == "") {
			return $pars['then'];
		} else {
			if (isset($pars['else'])) {
				return $pars['else'];
			} else {
				return "";
			}
		}
	}
	
	function test($name, $data, $pars) {
		return $data;
	}
	
}

?>
