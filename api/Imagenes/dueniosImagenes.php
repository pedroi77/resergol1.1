<?php
$file = $_FILES["file"]["name"];

$hoy = getdate();
$aux = $hoy["year"].$hoy["mon"].$hoy["mday"]."_".$hoy["hours"].$hoy["minutes"].$hoy["seconds"];
$pos = strrpos($file, ".");
$nombre = substr($file, 0, $pos); 
$extension = substr($file, $pos, 5);

$file=$nombre."_".$aux.$extension;
    
if(!is_dir("complejos/"))
	mkdir("complejos/", 0777);

if($file && move_uploaded_file($_FILES["file"]["tmp_name"], "complejos/".$file))
{
	echo $file;
}