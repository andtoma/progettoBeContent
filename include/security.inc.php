<?php


function clean_input($input){
    $new_input=strip_tags(addslashes(trim($input)));
    $new_input=str_replace("'","\'",$new_input);
    $new_input=str_replace('"','\"',$new_input);
    $new_input=str_replace(';','\;',$new_input);
    $new_input=str_replace('--','\--',$new_input);
    $new_input=str_replace('+','\+',$new_input);
    $new_input=str_replace('(','\(',$new_input);
    $new_input=str_replace(')','\)',$new_input);
    $new_input=str_replace('=','\=',$new_input);
    $new_input=str_replace('>','\>',$new_input);
    $new_input=str_replace('<','\<',$new_input);
    
    return $new_input;
}

?>