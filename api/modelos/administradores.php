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
    
    public function getDueniosPendientes(){
        
        $query = "CALL SP_getDueniosPendientes();";
        
        $dueniosPendientes= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $dueniosPendientes[] = $fila;
            }
              
            $result->free();
        }
        return $dueniosPendientes;
        
    }
    
    /*
    public function aceptarDuenio($IdDuenio, $acepta){
        
        $resultado = 0;
        
        $stmt = $this->connection->prepare('SET @IdDuenio := ?');
        $stmt->bind_param('i', $IdDuenio);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @acepta := ?');
        $stmt->bind_param('i', $acepta);
        $stmt->execute(); 
        
        //salida
        $stmt = $this->connection->prepare('SET @resultado := ?');
        $stmt->bind_param('i', $resultado);
        $stmt->execute(); 
        
        $query = "CALL SP_administrarDuePendiente(@IdDuenio, @acepta, @resultado);";
        
        $duenioAceptar= array();
        
        if( $result = $this->connection->query($query) ){
            $r = $this->connection->query('SELECT @resultado as result');
            //$r = $this->connection->query('SELECT @id as id, @tipo as tipo');
            $cliente[] = $r->fetch_assoc();               
        }
        
        return $duenioAceptar;
        
    }
    */
    
      public function aceptarDuenio($data){
        $IdDuenio = $this->connection->real_escape_string($data['IdDuenio']);
        $acepta = $this->connection->real_escape_string($data['acepta']);
          
        $resultado = 0;
        
        $stmt = $this->connection->prepare('SET @IdDuenio := ?');
        $stmt->bind_param('i', $IdDuenio);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @acepta := ?');
        $stmt->bind_param('i', $acepta);
        $stmt->execute(); 
        
        //salida
        $stmt = $this->connection->prepare('SET @resultado := ?');
        $stmt->bind_param('i', $resultado);
        $stmt->execute(); 
        
        $query = "CALL SP_administrarDuePendiente(@IdDuenio, @acepta, @resultado);";
        
        $duenioAceptar= array();
        
        if( $result = $this->connection->query($query) ){
            $r = $this->connection->query('SELECT @resultado as result');
            //$r = $this->connection->query('SELECT @id as id, @tipo as tipo');
            $cliente[] = $r->fetch_assoc();               
        }
        
        return $duenioAceptar;
        
    }
    
    
}