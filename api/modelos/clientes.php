<?php
//Hay que cambiar esto para que funcione con SLIM
require_once("connection.php");




if(isset($_GET["action"])){
    $action = $_GET["action"];
    switch ($action) {
        /*case "list":
            listTiposDoc();
            break;*/
        case "create":
            createCliente();
            break;
        /*
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


function createCliente(){
    
    /*--------------------------------------------------------------------------*/
    $c= Connection::getInstance();
    
    $usuario =  $c->real_escape_string(request('usuario'));
    $contrasenia= $c->real_escape_string(request('contrasenia'));
    $nombre = $c->real_escape_string(request('nombre'));
    $apellido = $c->real_escape_string(request('apellido'));
    $tipoDoc = $c->real_escape_string(request('tipoDoc'));
    $nroDoc = $c->real_escape_string(request('nroDoc'));
    $eMail = $c->real_escape_string(request('eMail'));
    $valor='';
    
    // bind the first parameter to the session variable @uid
    $stmt = $c->prepare('SET @usuario := ?');
    $stmt->bind_param('s', $usuario);
    $stmt->execute();
    
    $stmt = $c->prepare('SET @contrasenia := ?');
    $stmt->bind_param('s', $contrasenia);
    $stmt->execute();
    
    $stmt = $c->prepare('SET @nombre := ?');
    $stmt->bind_param('s', $nombre);
    $stmt->execute();
    
    $stmt = $c->prepare('SET @apellido := ?');
    $stmt->bind_param('s', $apellido);
    $stmt->execute();
    
    $stmt = $c->prepare('SET @tipoDoc := ?');
    $stmt->bind_param('i', $tipoDoc);
    $stmt->execute();
    
    $stmt = $c->prepare('SET @nroDoc := ?');
    $stmt->bind_param('i', $nroDoc);
    $stmt->execute();
    
    $stmt = $c->prepare('SET @eMail := ?');
    $stmt->bind_param('s', $eMail);
    $stmt->execute();
    
    // bind the second parameter to the session variable @userCount
    $stmt = $c->prepare('SET @valor := ?');
    $stmt->bind_param('i', $valor);
    $stmt->execute();
    
    // execute the stored Procedure
    $result = $c->query('CALL SP_insertClientes( @usuario, @contrasenia, @nombre, @apellido, @tipoDoc, @nroDoc,@eMail, @valor)');
    
    // getting the value of the OUT parameter
    $r = $c->query('SELECT @valor as cliente');
    $row = $r->fetch_assoc();               
    
    $res = $row['cliente'] ;

    if($res > -1){
        $dat= array( cliente  => $res);
        sendResult($dat, 'OK' );
    }else{
       sendError("Error, no se pudo registrar el cliente."); //por algun motivo pincha aca
    }
   
}


/*
function listTiposDoc(){
    $c = getConnection();
    $query = "CALL SP_getTiposDoc()";
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
*/
