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
  
    
}