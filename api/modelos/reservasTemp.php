<?php
require_once("connection.php");

class ReservaTemp
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    
     public function getReservaTemp($idCancha, $idComplejo){
        
        $stmt = $this->connection->prepare('SET @idCancha := ?');
        $stmt->bind_param('i', $idCancha);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @idComplejo := ?');
        $stmt->bind_param('i', $idComplejo);
        $stmt->execute(); 
         
        /*IVO CAMBIAR!!!!!!!!!!!!!!!!!*/
        $query = "CALL SP_getReservaTemp(@idCancha, @idComplejo);";
        
        $resTemp = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $resTemp[] = $fila;
            }
              
            $result->free();
        }
        return $resTemp;
    }
    
    
    //Inserta la reserva temp para el timer.
    public function create($reservaTemp){
        
        $idCancha = $this->connection->real_escape_string($reservaTemp['idCancha']);
        $idComplejo = $this->connection->real_escape_string($reservaTemp['idComplejo']);

        $valor='';
       
        // Parametros
        $stmt = $this->connection->prepare('SET @idCancha := ?');
        $stmt->bind_param('i', $idCancha);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @idComplejo := ?');
        $stmt->bind_param('i', $idComplejo);
        $stmt->execute();
        
        
        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('i', $valor);
        $stmt->execute();
        
       
         // execute the stored Procedure         SP_InsertReservaTemp
        
        $result = $this->connection->query('CALL SP_InsertReservaTemp(@idCancha, @idComplejo, @valor);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as valorRetorno');
        $row = $r->fetch_assoc();               
        $res = $row['valorRetorno'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo registrar la reserva temp." . $res );
        }
   
            
    }
    
    
    //Inserta la reserva temp para el timer.
    public function delete($idCancha, $idComplejo){
        
        $valor='';
       
        // Parametros
        $stmt = $this->connection->prepare('SET @idCancha := ?');
        $stmt->bind_param('i', $idCancha);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @idComplejo := ?');
        $stmt->bind_param('i', $idComplejo);
        $stmt->execute();
        
        
        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('i', $valor);
        $stmt->execute();
        
       
         // execute the stored Procedure         SP_InsertReservaTemp
        
        $result = $this->connection->query('CALL SP_DeleteReservaTemp(@idCancha, @idComplejo, @valor);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as valorRetorno');
        $row = $r->fetch_assoc();               
        $res = $row['valorRetorno'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo borrar la reserva temp." . $res );
        }
   
            
    }
  
    
}