<?php


Class htmlelements extends tagLibrary {
	
    function injectStyle() {
	
		/* $css = new Template("include/tags/hiermenu.css");
		return $css->get(); */
		
		return "";
	
                
    }
    
    function elementgruppi($name, $data, $pars)
    {
        //print_r($data);
        //data[1]= array quantità
        //$j=0;
        $m=count($data);
        foreach ($data as $k=>$v){
          $result.="<tr><td>";          
            $result.=$v['nomegruppo']."</td>";
            $result.="<td>";
            $result.=$v['idgruppi']."</td>";
            $result.="<td>";
            $result.="<a href=gestione_gruppi.php?remove=1&idgrup=".$v['idgruppi'].">Rimuovi</a></td>";
            $result.="</tr>";  
    }
        //echo $m."\n";
        
        
        return $result;
    }
    
    function selecttipocat($name, $data, $pars)
    {
    $result="";
    foreach($data as $k => $v){           
    $result.="<option value=".$v['idcategorie'].">".$v['nomecategorie']."</option>\n";
    }
    return $result;
    }
    
    function selectautori($name, $data, $pars)
    {
    $result="";
    foreach($data as $k => $v){           
    $result.="<option value=".$v['idautori'].">".$v['nomeautore']."</option>\n";
    }
    return $result;
    }
    
    function selecttipoautore($name, $data, $pars)
    {
    $result="";
    foreach($data as $k => $v){           
    $result.="<option value=".$v['idtipo_autori'].">".$v['tipologieautori']."</option>\n";
    }
    return $result;
    }
    
    function selectproduttori($name, $data, $pars)
    {
    $result="";
    foreach($data as $k => $v){           
    $result.="<option value=".$v['idproduttori'].">".$v['nomeproduttori']."</option>\n";
    }
    return $result;
    }
        
     function selectcategorieall($name, $data, $pars)
    {
    $result="";
    foreach($data as $k => $v){           
    $result.="<option value=".$v['idgenerimusicali'].">".$v['nomegeneri']."</option>\n";
    }
    return $result;
    }
    
    function selectprovincia($name, $data, $pars)
    {
    $result="";
    foreach($data as $k => $v){           
    $result.="<option value=".$v['idprovincie'].">".$v['nomeprovincia']."</option>\n";
    }
    return $result;
    }
    
    
    function selectwithdefault($name, $data, $pars)
    {   
    $result="";
    $result.="<option value=".$data[1][0].">".$data[1][1]."</option>\n";
    foreach($data[0] as $k => $v){  
    if($v['idprovincie']!=$data[1][0]){    
    $result.="<option value=".$v['idprovincie'].">".$v['nomeprovincia']."</option>\n";
    }}
    return $result;
    }
    
    
        
    function selecttipostrada($name, $data, $pars)
    {
    $result="";
    foreach($data as $k => $v){           
    $result.="<option value=".$v['idtipostrada'].">".$v['nometipostrada']."</option>\n";
    }
    return $result;
    }
    
   
            
    function elementcarrello($name, $data, $pars)
    {
        //print_r($data[0]);
        //data[1]= array quantità
        $j=0;
        $m=count($data[0]);
        //echo $m."\n";
        for($i=0;$i<$m;$i++)
        {
            if(!empty($data[0][$i])){
            if($j%2==0){$result.="<tr class='odd'>";}
            else{$result.="<tr>";}           
            $result.="<td><img src='".$data[0][$i][0]['urlthumbprodotti']."' alt='".$data[0][$i][0]['urlimgprodotti']."'></td>";
            $result.="<td><b>Titolo:</b> ";
            $result.=$data[0][$i][0]['nomeprodotto']."";
            $result.="</br><b>Genere:</b> ".$data[0][$i][0]['nomegeneri']."";
            $result.="</br><b>Categoria:</b> ".$data[0][$i][0]['nomecategorie']."</td>";
            $result.="<td>";
            $result.=$data[0][$i][0]['nomeautore']."</td>";
            $result.="<td>";
            $result.=$data[1][$i]."</td>";
            $result.="<td>";
            $result.=$data[0][$i][0]['prezzo']."</td>";
            $result.="<td>";
            $result.="<a href=rimuovielemcarrello.php?idprod=".$data[0][$i][0]['idprodotti'].">Rimuovi</a></td>";
            $result.="</tr>";
            $j++;
            }
            
        }
        
        return $result;
        
    }
    
    function elementutenti($name, $data, $pars)
    {
        //data[0]= array elementi
        //data[1]= array quantità
        //print_r($data);
        $m=count($data);
        //echo $m."\n";
        for($i=0;$i<$m;$i++)
        {
            if($i%2==0){$result.="<tr class='odd'>";}
            else{$result.="<tr>";}            
            $result.="<td>";
            $result.=$data[$i]['username']."</td>";
            $result.="<td>";
            $result.=$data[$i]['email']."</td>";
            $result.="<td>";
            if($data[$i]['isactive']==1){$aux="Attivo";$aux2=1;}else{$aux="Non Attivo";$aux2=0;}
            $result.="<a href='gestioneutenti.php?activechange=$aux2&idutenti=".$data[$i]['idutenti']."''>$aux</a>";
            $result.="</td>";
            $result.="<td>";
            if($data[$i]['idgruppi']==1){$aux="Administrator";$aux2=1;}else{$aux="Cliente";$aux2=2;}
            $result.="<a href='gestioneutenti.php?groupchange=$aux2&idutenti=".$data[$i]['idutenti']."'>$aux</a>";
            $result.="</td>";
            $result.="<td>";
            $result.="<a href='gestioneutenti.php?remove=1&idutenti=".$data[$i]['idutenti']."'><span>></span>Rimuovi</a>";
            $result.="</td>";
            $result.="</tr>";
            
        }
        
        return $result;
        
    }
    
    function getordini($name, $data, $pars)
    {
        $j=1;
        //print_r($data);
        //data[0]= array elementi
        //data[1]= array quantità
        $m=count($data);
        $dataordine=$data[0]['dataordine'];
        $result.="<tr class='oddfinale'><td>ORDINE DEL:  $dataordine</td></tr>";
        //echo $m."\n";
        for($i=0;$i<$m;$i++)
        {
           if($j<9){ 
           if($dataordine==$data[$i]['dataordine']){
           $result.="<tr class='odd'>";
                     
            $result.="<td>";
            $result.=$data[$i]['nomeprodotto']."</td>";
            $result.="<td>";
            $result.=$data[$i]['nomeautore']."</td>";
            $result.="<td>";
            $result.=$data[$i]['quantitaordine']."</td>";
            $result.="<td>";
            $result.=$data[$i]['prezzo']."</td>";
            $result.="<td>";
            $result.="</td>";
            $result.="<td>";
            $result.=$data[$i]['prezzo']*$data[$i]['quantitaordine']."</td>";
            
            
            //$result.="<td>";
            //$result.=$data[$i]['dataordine']."</td>";
            //$result.="<td>";
            //$result.=$data[$i]['idprodotti']."pulsante</td>";
            $result.="</tr>";
            if($m==1)
            {
                $result.="<tr style='background:lightgrey; text-align:right; color:black;'>";
                $result.="<td >TOTALE:</td><td></td><td></td><td></td>";     
                $result.="<td>";
            if($data[$i]['evaso']==0){$result.="No</td>";}
            else{$result.="Si</td>";}
            $result.="<td></td></tr>";
            }
            }
            else{
                $dataordine=$data[$i]['dataordine'];
                $result.="<tr style='background:lightgrey; text-align:right; color:black;'>";
                $result.="<td >TOTALE:</td><td></td><td></td><td></td>";     
                $result.="<td>";
            if($data[$i-1]['evaso']==0){$result.="No</td>";}
            else{$result.="Si</td>";}
                $result.="<td>".$data[$i]['totale']."</td>";
                $i--;
                
                $result.="<tr class='oddfinale'><td>ORDINE DEL: $dataordine</td></tr>";
                $j++;
            }
        }}
        if($i==$m){
            $result.="<tr style='background:lightgrey; text-align:right; color:black;'>";
                $result.="<td >TOTALE:</td><td></td><td></td><td></td>";     
                $result.="<td>";
                $i--;
                $aux2=$data[$i]['idordini'];
            if($data[$i]['evaso']==0){$result.="No</td>";}
             else{$result.="Si</td>";}
                $result.="<td>";    
                
                $result.=$data[$i]['totale']."</td>";
                
        }    
        
        
        return $result;
        
    }
                
       
    function getordiniall($name, $data, $pars)
    {
        
        //data[0]= array elementi
        //data[1]= array quantità
        $m=count($data);
        $dataordine=$data[0]['dataordine'];
        $datautente=$data[0]['username'];
        $result.="<tr class='oddfinale'><td>ORDINE DEL:  $dataordine  ORDINE EFFETTUTATO DA: $datautente</td></tr>";
        
        for($i=0;$i<$m;$i++)
        {
           
           if($dataordine==$data[$i]['dataordine']){
           $result.="<tr class='odd'>";
                     
            $result.="<td>";
            $result.=$data[$i]['nomeprodotto']."</td>";
            $result.="<td>";
            $result.=$data[$i]['nomeautore']."</td>";
            $result.="<td>";
            $result.=$data[$i]['quantitaordine']."</td>";
            $result.="<td>";
            $result.=$data[$i]['prezzo']."</td>";
            $result.="<td>";
            $result.="</td>";
            $result.="<td>";
            $result.=$data[$i]['prezzo']*$data[$i]['quantitaordine']."</td>";
            
            
            //$result.="<td>";
            //$result.=$data[$i]['dataordine']."</td>";
            //$result.="<td>";
            //$result.=$data[$i]['idprodotti']."pulsante</td>";
            $result.="</tr>";
            
            if($m==1){ $result.="<tr><td >TOTALE:</td><td></td><td></td><td></td>";     
                $result.="<td>";
                $aux2=$data[$i]['idordini'];
            if($data[$i]['evaso']==0){$result.="<a href='gestione_ordini.php?idordine=$aux2&changestatus=1''>Spedisci</a></td>";}
            else{$result.="<a href='gestione_ordini.php?idordine=$aux2&changestatus=1''>Poni in attesa</a></td>";}
                $result.="<td>";}
           
                
                $result.="</td></tr>";
            }
            else{
                $dataordine=$data[$i]['dataordine'];
                $datautente=$data[$i]['username'];
                $result.="<tr style='background:lightgrey; text-align:right; color:black;'>";
                $result.="<td >TOTALE:</td><td></td><td></td><td></td>";     
                $result.="<td>";
                $i--;
                $aux2=$data[$i]['idordini'];
            if($data[$i]['evaso']==0){$result.="<a href='gestione_ordini.php?idordine=$aux2&changestatus=1''>Spedisci</a></td>";}
            else{$result.="<a href='gestione_ordini.php?idordine=$aux2&changestatus=1''>Poni in attesa</a></td>";}
                $result.="<td>";    
                
                $result.=$data[$i]['totale']."</td>";
                $result.="<tr class='oddfinale'><td>ORDINE DEL:  $dataordine  ORDINE EFFETTUTATO DA: $datautente</td></tr>";
                
            }
        
        
        } if($i==$m){
            $result.="<tr style='background:lightgrey; text-align:right; color:black;'>";
                $result.="<td >TOTALE:</td><td></td><td></td><td></td>";     
                $result.="<td>";
                $i--;
                $aux2=$data[$i]['idordini'];
            if($data[$i]['evaso']==0){$result.="<a href='gestione_ordini.php?idordine=$aux2&changestatus=1''>Spedisci</a></td>";}
            else{$result.="<a href='gestione_ordini.php?idordine=$aux2&changestatus=1''>Poni in attesa</a></td>";}
                $result.="<td>";    
                
                $result.=$data[$i]['totale']."</td>";
                
        }    
        
        
        
        return $result;
        
    }
    
	
}

?>





