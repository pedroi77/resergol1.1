<?php
require_once("connection.php");

class Complejo
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    //Trae todos los datos del complejo del dueño que se logueo
    public function getComplejo($idDuenio){  
        
        $stmt = $this->connection->prepare('SET @pIdDuenio := ?');
        $stmt->bind_param('i', $idDuenio);
        $stmt->execute();  

        $query = "CALL SP_getComplejoByIdDuenio(@pIdDuenio);";

        $complejo = array();

        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $complejo[] = $fila;
            }
              
            $result->free();              
        }
        return $complejo;
    }
    
}