<?php
require_once("connection.php");
class miCuenta
{
   
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    
    public function getDatosCliente($idCliente){
        $stmt = $this->connection->prepare('SET @idCliente := ?');
        $stmt->bind_param('i', $idCliente);
        $stmt->execute(); 

        $query = "CALL SP_getDatosCliente(@idCliente);";
        
        $cliente= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $cliente[] = $fila;
            }
              
            $result->free();
        }
        return $cliente;
    }
    
    
    public function modificarUsuario($cliente){
        
        $idCliente = $this->connection->real_escape_string($cliente['idCliente']);
        $usuario = $this->connection->real_escape_string($cliente['usuario']);
        $contrasenia = $this->connection->real_escape_string($cliente['contrasenia']);
                    
        $valor='';
      
        // Parametros
        $stmt = $this->connection->prepare('SET @idCliente := ?');
        $stmt->bind_param('i', $idCliente);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @usuario := ?');
        $stmt->bind_param('s', $usuario);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @contrasenia := ?');
        $stmt->bind_param('s', $contrasenia);
        $stmt->execute();
        
        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('s', $valor);
        $stmt->execute();
        
         // execute the stored Procedure         
        $result = $this->connection->query('CALL SP_updateCliente(@idCliente, @usuario, @contrasenia, @valor)');
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as cliente');
        $row = $r->fetch_assoc();               
        $res = $row['cliente'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo modificar al cliente." . $res ); //por algun motivo pincha aca
        }
    }
    
    
     //"Borra" (le cambia el estado) al cliente.
    public function deleteCliente($idCliente){
        
        $valor='';
       
        // Parametros
        $stmt = $this->connection->prepare('SET @idCliente := ?');
        $stmt->bind_param('i', $idCliente);
        $stmt->execute();

        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('i', $valor);
        $stmt->execute();
        
        $result = $this->connection->query('CALL SP_deleteCliente(@idCliente, @valor);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as valor');
        $row = $r->fetch_assoc();               
        $res = $row['valor'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo borrar al cliente." . $res );
        }
   
            
    }

    
}
