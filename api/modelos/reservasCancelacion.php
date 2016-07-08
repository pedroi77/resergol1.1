<?php
require_once("connection.php");

class ReservaCancelacion
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    
    //Borra la reserva.
    public function deleteReserva($idReserva){
        
        $valor='';
       
        // Parametros
        $stmt = $this->connection->prepare('SET @idReserva := ?');
        $stmt->bind_param('i', $idReserva);
        $stmt->execute();
 
        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('i', $valor);
        $stmt->execute();
        
        $result = $this->connection->query('CALL SP_deleteReserva(@idReserva, @valor);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as valor');
        $row = $r->fetch_assoc();               
        $res = $row['valor'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo borrar la reserva." . $res );
        }
   
            
    }
   
}


