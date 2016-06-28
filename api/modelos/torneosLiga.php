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
    
    public function getFechasBytorneo($IdTorneo){  
        $stmt = $this->connection->prepare('SET @IdTorneo := ?');
        $stmt->bind_param('i', $IdTorneo);
        $stmt->execute(); 
        
        $query = "CALL SP_getfechasLigaByIdTorneo(@IdTorneo);";
        $fechas= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $fechas[] = $fila;
            }
            $result->free();
        }
        return $fechas;
    }
    
     public function getFixtureByFecha($IdTorneo, $IdFecha){  
        $stmt = $this->connection->prepare('SET @IdTorneo := ?');
        $stmt->bind_param('i', $IdTorneo);
        $stmt->execute(); 
         
        $stmt = $this->connection->prepare('SET @IdFecha := ?');
        $stmt->bind_param('i', $IdFecha);
        $stmt->execute(); 
        
        $query = "CALL SP_getFixtureByFecha(@IdTorneo, @IdFecha);";
        $fixture= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $fixture[] = $fila;
            }
            $result->free();
        }
        return $fixture;
    }
}

