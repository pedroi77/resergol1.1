<?php
require_once("connection.php");

class ListaNegra
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    
     public function verificarClienteListaNegra($pIdCliente, $pIdComplejo){
        
        $stmt = $this->connection->prepare('SET @pIdCliente := ?');
        $stmt->bind_param('i', $pIdCliente);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $pIdComplejo);
        $stmt->execute(); 
         
        $query = "CALL SP_verificarClienteListaNegra(@pIdCliente, @pIdComplejo);";
        
        $listaNegra = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $listaNegra[] = $fila;
            }
              
            $result->free();
        }
        return $listaNegra;
    }
    
   
    
}
