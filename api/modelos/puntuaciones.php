<?php
require_once("connection.php");
class Puntuacion
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }

     public function getPuntuacionCanchaCliente($pIdCancha, $pIdComplejo, $pIdCliente){
        
        $stmt = $this->connection->prepare('SET @pIdCancha := ?');
        $stmt->bind_param('i', $pIdCancha);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $pIdComplejo);
        $stmt->execute(); 

        $stmt = $this->connection->prepare('SET @pIdCliente := ?');
        $stmt->bind_param('i', $pIdCliente);
        $stmt->execute(); 
      
        $query = "CALL SP_getPuntuacionCanchaCliente(@pIdCancha, @pIdComplejo, @pIdCliente);";
        
        $PuntuacionCliente = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $PuntuacionCliente[] = $fila;
            }
              
            $result->free();
        }
        return $PuntuacionCliente;
    }
    
     public function getPuntuacionCancha($pIdCancha, $pIdComplejo){
        
        $stmt = $this->connection->prepare('SET @pIdCancha := ?');
        $stmt->bind_param('i', $pIdCancha);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $pIdComplejo);
        $stmt->execute(); 
      
        $query = "CALL SP_getPuntuacionCancha(@pIdCancha, @pIdComplejo);";
        
        $PuntuacionCancha = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $PuntuacionCancha[] = $fila;
            }
              
            $result->free();
        }
        return $PuntuacionCancha;
    }
    
    //CREATE -- Metodo para puntuar una cancha
    public function puntuarCancha($puntuacion){
        
        $idCancha = $this->connection->real_escape_string($puntuacion['idCancha']);
        $idComplejo = $this->connection->real_escape_string($puntuacion['idComplejo']);
        $idCliente = $this->connection->real_escape_string($puntuacion['idCliente']);
        $puntaje = $this->connection->real_escape_string($puntuacion['puntaje']);
        
        $salida='';
      
        // Parametros
        $stmt = $this->connection->prepare('SET @idCancha := ?');
        $stmt->bind_param('i', $idCancha);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @idComplejo := ?');
        $stmt->bind_param('i', $idComplejo);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @idCliente := ?');
        $stmt->bind_param('i', $idCliente);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @puntaje := ?');
        $stmt->bind_param('i', $puntaje);
        $stmt->execute();

        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('s', $valor);
        $stmt->execute();

        $result = $this->connection->query('CALL SP_insertPuntuacionCancha(@idCancha, @idComplejo, @idCliente, @puntaje, @valor);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as valor');
        $row = $r->fetch_assoc();               
        $res = $row['valor'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo registrar la puntuacion de la cancha." . $res );
        }
        
    }
    
}