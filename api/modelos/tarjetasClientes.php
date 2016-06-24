<?php
require_once("connection.php");

class TarjetaCliente
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    //Inserta la tarjeta.
    public function create($tarjeta){
        
        $idCliente = $this->connection->real_escape_string($tarjeta['idCliente']);
        $nroTarjeta = $this->connection->real_escape_string($tarjeta['nroTarjeta']);
        $mes = $this->connection->real_escape_string($tarjeta['mes']);
        $anio = $this->connection->real_escape_string($tarjeta['anio']);
        $codigo = $this->connection->real_escape_string($tarjeta['codigo']);
        
        $valor='';
        
        //echo 'sadasdsadsa', 'aaaaaa', '\n';
       
        // Parametros
        $stmt = $this->connection->prepare('SET @idCliente := ?');
        $stmt->bind_param('i', $idCliente);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @nroTarjeta := ?');
        $stmt->bind_param('s', $nroTarjeta);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @mes := ?');
        $stmt->bind_param('i', $mes);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @anio := ?');
        $stmt->bind_param('i', $anio);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @codigo := ?');
        $stmt->bind_param('s', $codigo);
        $stmt->execute();
        
        
        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('i', $valor);
        $stmt->execute();
        
       
         // execute the stored Procedure         SP_InsertTarjeta
        
        $result = $this->connection->query('CALL SP_insertTarjeta(@idCliente, @nroTarjeta, @mes, @anio, @codigo, @valor);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as valorRetorno');
        $row = $r->fetch_assoc();               

        $res = $row['valorRetorno'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo registrar la tarjeta." . $res );
        }
   
            
    }
    
    
    /*public function getTarjetaCliente($pIdCliente){  
        /*$stmt = $this->connection->prepare('SET @pIdCliente := ?');
        $stmt->bind_param('i', $idCliente);
        $stmt->execute(); */
        
        //echo $idCliente, '\n';
        
        //$query = "CALL SP_getTarjetaCliente(@pIdCliente);";
     /*   $query = "CALL SP_getTarjetaCliente(2);";
        $tarjetas = array();
        
        if($result = $this->connection->query($query)){
            while($fila = $result->fetch_assoc()){
                $tarjetas[] = $fila;
            }
            $result->free();
        }
        return $tarjetas;
    }*/
    
    
    public function getTarjetaCliente($idCliente){
        
        $stmt = $this->connection->prepare('SET @idCliente := ?');
        $stmt->bind_param('i', $idCliente);
        $stmt->execute();
        
        $query = "CALL SP_getTarjetaCliente(@idCliente);";
        
        $reservas = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $reservas[] = $fila;
            }
              
            $result->free();
        }
        return $reservas;
    }

    
}


