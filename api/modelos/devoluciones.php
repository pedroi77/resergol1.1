<?php
require_once("connection.php");
class Devolucion
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }

    public function insertDevolucion($devolucion){
        
        $idCliente = $this->connection->real_escape_string($devolucion['idCliente']);
        $idDuenio = $this->connection->real_escape_string($devolucion['idDuenio']);
        $monto = $this->connection->real_escape_string($devolucion['monto']);
        
        $salida='';
      
        // Parametros
        $stmt = $this->connection->prepare('SET @idCliente := ?');
        $stmt->bind_param('i', $idCliente);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @idDuenio := ?');
        $stmt->bind_param('i', $idDuenio);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @monto := ?');
        $stmt->bind_param('d', $monto);
        $stmt->execute();

        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('s', $valor);
        $stmt->execute();

        $result = $this->connection->query('CALL SP_insertDevolucion(@idCliente, @idDuenio, @monto, @valor);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as valor');
        $row = $r->fetch_assoc();               
        $res = $row['valor'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo registrar la devolucion." . $res );
        }
        
    }
    
}