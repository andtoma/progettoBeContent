<?php

Class functions extends TagLibrary {

    function IoDevoEssereLaPrimaFunzione() {
        return;
    }

    function HeaderMenu($name, $data, $pars) {
        ### QUERY PER PRENDERE LE ID DEI MENU CON SOTTOMENU
        $query_1 = "SELECT DISTINCT submenu.menu FROM menu INNER JOIN submenu ON menu.id_field=submenu.menu";
        $res_1 = getResult($query_1);
        $content = '<div class="navi"><div id="ddtopmenubar" class="mattblackmenu"><ul>';
        foreach ($data as $key => $value) {
            $hassub = 0;
            foreach ($res_1 as $k1 => $v1) {
                if ($value['id_field'] == $v1['menu']) {
                    $hassub = 1;
                    break;
                }
            }
            if ($hassub == 1) {
                /*
                 * CASO IN CUI IL MENU HA DEI SOTTOMENU
                 */
                $content.= '<li>
                                <a href="' . $value['link'] . '" rel="ddsubmenu1">' . $value['field_name'] . '</a>
                            <ul id="ddsubmenu1" class="ddsubmenustyle">';
                ### QUERY PER PRENDERE I CAMPI DEL SOTTOMENU ASSOCIATO AL MENU CORRENTE
                $query_2 = "SELECT * FROM submenu WHERE menu=" . $value['id_field'];
                $res_2 = getResult($query_2);
                foreach ($res_2 as $k2 => $v2) {
                    $content .= '<li>
                                    <a href="' . $v2['link'] . '?cat=' . $v2['id_submenu'] . '">' . $v2['field_name'] . '</a>
                                 </li>';
                }
                $content .= '</ul></li>';
            } else {
                /*
                 * CASO IN CUI IL MENU NON HA SOTTOMENU
                 */
                $content .= '<li><a href="' . $value['link'] . '">' . $value['field_name'] . '</a></li>';
            }
        }
        $content .= '</ul></div></div>';
        return $content;
    }

    function FooterMenu($name, $data, $pars) {
        $content = '<ul>';
        foreach ($data as $key => $value) {
            $content.='<li>
                       <a href="' . $value['link'] . '">' . $value['field_name'] . '</a>
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
                        ' . $value['desc'] . '
                        </p>
                        </div>
                        </div>';
        }

        return $content;
    }

    function ItemsMP($name, $data, $pars) {

        $content = '';
        foreach ($data as $key => $value) {

            $link = 'single-item.php?id=' . $value['item'];
            $short_desc = substr($value['description'], 0, 60) . '...';

            $content .= '<li>
                             <a href="' . $link . '"><img src="' . $value['path'] . '" alt="" class="img-responsive"/></a>
                             <div class="carousel_caption">
                                 <h5><a href="' . $link . '">' . $value['name'] . '</a></h5>
                                 <p>' . $short_desc . '</p>
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i class="icon-search"></i>View Details</a>
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i class="icon-shopping-cart"></i> Buy for $ ' . $value['price'] . '</a>
                             </div>
                         </li>';
        }

        return $content;
    }

    function ItemsNA($name, $data, $pars) {

        $content = '';
        foreach ($data as $key => $value) {

            $link = 'single-item.php?id=' . $value['item'];
            $short_desc = substr($value['description'], 0, 60) . '...';

            $content .= '<li>
                             <a href="' . $link . '"><img src="' . $value['path'] . '" alt="" class="img-responsive"/></a>
                             <div class="carousel_caption">
                                 <h5><a href="' . $link . '">' . $value['name'] . '</a></h5>
                                 <p>' . $short_desc . '</p>
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i class="icon-search"></i>View Details</a>
                                 <a href="' . $link . '" class="btn btn-info btn-sm"><i class="icon-shopping-cart"></i> Buy for $ ' . $value['price'] . '</a>
                             </div>
                         </li>';
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

}

?>
