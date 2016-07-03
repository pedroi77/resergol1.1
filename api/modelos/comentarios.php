<?php
require_once("connection.php");
class Comentario
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }

     public function getComentariosCancha($pIdCancha, $pIdComplejo){
        
        $stmt = $this->connection->prepare('SET @pIdCancha := ?');
        $stmt->bind_param('i', $pIdCancha);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $pIdComplejo);
        $stmt->execute(); 
      
        $query = "CALL SP_getComentariosCancha(@pIdCancha, @pIdComplejo);";
        
        $ComentariosCancha = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $ComentariosCancha[] = $fila;
            }
              
            $result->free();
        }
        return $ComentariosCancha;
    }
    
    //CREATE -- Metodo para comentar una cancha
    public function comentarCancha($comentario){
        
        $idCancha = $this->connection->real_escape_string($comentario['idCancha']);
        $idComplejo = $this->connection->real_escape_string($comentario['idComplejo']);
        $idCliente = $this->connection->real_escape_string($comentario['idCliente']);
        $comentario = $this->connection->real_escape_string($comentario['comentario']);
        
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
        $stmt = $this->connection->prepare('SET @comentario := ?');
        $stmt->bind_param('s', $comentario);
        $stmt->execute();

        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('s', $valor);
        $stmt->execute();

        $result = $this->connection->query('CALL SP_insertComentarioCancha(@idCancha, @idComplejo, @idCliente, @comentario, @valor);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as valor');
        $row = $r->fetch_assoc();               
        $res = $row['valor'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo registrar el comentario de la cancha." . $res );
        }
        
    }
    
}