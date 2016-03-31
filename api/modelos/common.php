<?php
require_once("connection.php");

class Common
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
 
    //Documentos
    public function getAllDocumentos(){
        $query = "CALL SP_getTiposDoc();";
        $tiposDocs= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $tiposDocs[] = $fila;
            }
            $result->free();
        }
        return $tiposDocs;
    }
   
    //Provincias
    public function getAllProvincias(){
        $query = "CALL SP_getProvincias();";
        $provincias= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $provincias[] = $fila;
            }
            $result->free();
        }
        return $provincias;
    }
}