<?php
require_once("connection.php");

class Cancha
{
   
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    //Se usa en el buscador de canchas del cliente.
    public function getCanchas($pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pPrecioMax, $pTechada, $pConLuz, $pConEstac, $pConDuchas, $pConBuffet, $pConParrilla, $pConWifi){
        
        $stmt = $this->connection->prepare('SET @pIdProv := ?');
        $stmt->bind_param('i', $pIdProv);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @pIdLoc := ?');
        $stmt->bind_param('i', $pIdLoc);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pCantJug := ?');
        $stmt->bind_param('i', $pCantJug);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pIdSuperficie := ?');
        $stmt->bind_param('i', $pIdSuperficie);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pPrecioMax := ?');
        $stmt->bind_param('d', $pPrecioMax);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pTechada := ?');
        $stmt->bind_param('b', $pTechada);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConLuz := ?');
        $stmt->bind_param('b', $pConLuz);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConEstac := ?');
        $stmt->bind_param('b', $pConEstac);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConDuchas := ?');
        $stmt->bind_param('b', $pConDuchas);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConBuffet := ?');
        $stmt->bind_param('b', $pConBuffet);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConParrilla := ?');
        $stmt->bind_param('b', $pConParrilla);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConWifi := ?');
        $stmt->bind_param('b', $pConWifi);
        $stmt->execute();
        
        $query = "CALL SP_getCanchas(@pIdProv, @pIdLoc, @pCantJug, @pIdSuperficie, @pPrecioMax, @pTechada, @pConLuz, @pConEstac, @pConDuchas, @pConBuffet, @pConParrilla, @pConWifi);";
        
        $canchas = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $canchas[] = $fila;
            }
              
            $result->free();
        }
        return $canchas;
    }
    
    //canchas de un duenio
    public function getCanchasByDuenio($IdDuenio){  

        $stmt = $this->connection->prepare('SET @IdDuenio := ?');
        $stmt->bind_param('i', $IdDuenio);
        $stmt->execute(); 
        
        
              
        $query = "CALL SP_getCanchasByDuenio (@IdDuenio);";
        $canchas= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $canchas[] = $fila;
            }
            $result->free();
        }
        return $canchas;
    }
    
    
    
    
}