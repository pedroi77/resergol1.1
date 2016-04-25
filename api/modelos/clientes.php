<?php
require_once("connection.php");

class Cliente
{
   
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    public function getCliente($usuario,$contrasenia ){
        $stmt = $this->connection->prepare('SET @usuario := ?');
        $stmt->bind_param('s', $usuario);
        $stmt->execute(); 
    
        $stmt = $this->connection->prepare('SET @contrasenia := ?');
        $stmt->bind_param('s', $contrasenia);
        $stmt->execute(); 
        
        $query = "CALL SP_getCliente(@usuario, @contrasenia );";
        
        $cliente= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $cliente[] = $fila;
            }
            $result->free();
        }
        return $cliente;
    }

    
/* <PI> IVAN TODO ESTO ANDABA ANTES DE SLIM. LO COMENTO PORQUE CAPAZ TE SIRVE.
if(isset($_GET["action"])){
    $action = $_GET["action"];
    switch ($action) {
        case "create":
            createCliente();
            break;
        default:
            sendError("La accion especificada es invalida");
            break;            
    }
}else{
    sendError("No se especifico ninguna acción");
}

function createCliente(){
    

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
*/

}