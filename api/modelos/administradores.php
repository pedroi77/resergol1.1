<?php
require_once("connection.php");

class Administrador
{
   
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    public function getAdministrador($usuario,$contrasenia ){
        $stmt = $this->connection->prepare('SET @usuario := ?');
        $stmt->bind_param('s', $usuario);
        $stmt->execute(); 
    
        $stmt = $this->connection->prepare('SET @contrasenia := ?');
        $stmt->bind_param('s', $contrasenia);
        $stmt->execute(); 
        
        $query = "CALL SP_getAdministrador(@usuario, @contrasenia );";
        
        $administrador= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $administrador[] = $fila;
            }
              
            $result->free();
        }
        return $administrador;
    }
}