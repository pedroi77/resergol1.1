<?php
require_once("connection.php");

class tiposDocs
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
 
    public function getAll(){
        $query = "CALL SP_getTiposDoc();";
        //$query = "select * from TiposDoc;";
        $tiposDocs= array();
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $tiposDocs[] = $fila;
            }
            $result->free();
        }
        //sendResult(array("TiposDoc" => $TiposDocs), "Ok");
        return $tiposDocs;
    }
   
}