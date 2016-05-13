<?php
require_once("connection.php");

class Cancha
{
   
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    //Se usa en el buscador de canchas del cliente.
    public function getCanchas(){
        /*$stmt = $this->connection->prepare('SET @usuario := ?');
        $stmt->bind_param('s', $usuario);
        $stmt->execute(); 
    
        $stmt = $this->connection->prepare('SET @contrasenia := ?');
        $stmt->bind_param('s', $contrasenia);
        $stmt->execute(); */
        
        $query = "CALL SP_getCanchas();";
        
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