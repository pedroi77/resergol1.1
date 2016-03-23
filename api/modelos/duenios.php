<?php
require_once("connection.php");

class duenios
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
 
   /* public function getAll(){
        $query = "CALL SP_getTiposDoc();";
        $tiposDocs= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $tiposDocs[] = $fila;
            }
            $result->free();
        }
        return $tiposDocs;
    }*/
   
}