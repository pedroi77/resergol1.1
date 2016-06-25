<?php
require_once("connection.php");

class TorneoLiga
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
       
     public function getTablaDePosiciones($IdTorneo){  

        $stmt = $this->connection->prepare('SET @IdTorneo := ?');
        $stmt->bind_param('i', $IdTorneo);
        $stmt->execute(); 
        
        $query = "CALL SP_getTablaPosiciones(@IdTorneo);";
        $equipos= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $equipos[] = $fila;
            }
            $result->free();
        }
        return $equipos;
    }
    
}

