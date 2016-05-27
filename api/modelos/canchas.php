<?php
require_once("connection.php");

class Cancha
{
   
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    //Se usa en el buscador de canchas del cliente.
    public function getCanchas($pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pPrecioMax, $pTechada, $pConLuz, $pConEstac, $pConDuchas, $pConBuffet, $pConParrilla, $pConWifi, $pFecha, $pHora, $pDiaSemana){
        
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
        $stmt->bind_param('i', $pTechada);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConLuz := ?');
        $stmt->bind_param('i', $pConLuz);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConEstac := ?');
        $stmt->bind_param('i', $pConEstac);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConDuchas := ?');
        $stmt->bind_param('i', $pConDuchas);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConBuffet := ?');
        $stmt->bind_param('i', $pConBuffet);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConParrilla := ?');
        $stmt->bind_param('i', $pConParrilla);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConWifi := ?');
        $stmt->bind_param('i', $pConWifi);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pFecha := ?');
        $stmt->bind_param('s', $pFecha);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pHora := ?');
        $stmt->bind_param('s', $pHora);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pDiaSemana := ?');
        $stmt->bind_param('i', $pDiaSemana);
        $stmt->execute();
        
        
        $query = "CALL SP_getCanchas(@pIdProv, @pIdLoc, @pCantJug, @pIdSuperficie, @pPrecioMax, @pTechada, @pConLuz, @pConEstac, @pConDuchas, @pConBuffet, @pConParrilla, @pConWifi, @pFecha, @pHora, @pDiaSemana);";
        
        
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
    
     //Get de cancha específica.
    public function getCancha($IdCancha, $IdComplejo){  

        $stmt = $this->connection->prepare('SET @IdCancha := ?');
        $stmt->bind_param('i', $IdCancha);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @IdComplejo := ?');
        $stmt->bind_param('i', $IdComplejo);
        $stmt->execute(); 
               
        $query = "CALL SP_getCancha(@IdCancha, @IdComplejo);";
        $canchas = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $canchas[] = $fila;
            }
            $result->free();
        }
        return $canchas;
    }
   
    
    
}