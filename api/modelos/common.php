<?php

require_once("init.php");

if(isset($_GET["action"])){
    $action = $_GET["action"];
    switch ($action) {
        case "listTiposDoc":
            listTiposDoc();
            break;
        /*case "create":
            createCategoria();
            break;
        case "update":
            updateCategoria();
            break;
        case "delete":
            deleteCategoria();
            break;            */
        default:
            sendError("La accion especificada es invalida");
            break;            
    }
}else{
    sendError("No se especifico ninguna acción");
}



function listTiposDoc(){
    $c = getConnection();
    $query = "CALL SP_getTiposDoc();";
    $TiposDocs = array();
    if ($resultado = $c->query($query)) {
        while ($fila = $resultado->fetch_assoc()) {
            $TiposDocs[] = $fila;
        }
        $resultado->free();
        sendResult(array("TiposDoc" => $TiposDocs), "Ok");
    }else{
        sendError("No se encontraron resultados");
    }
}
