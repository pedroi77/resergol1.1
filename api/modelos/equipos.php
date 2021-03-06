<?php
require_once("connection.php");
class Equipo
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }

    
    //Inserta el equipo en la tabla equipos.
    public function create($equipo){
        
        $idCliente = $this->connection->real_escape_string($equipo['idCliente']);
        $nombre = $this->connection->real_escape_string($equipo['nombre']);
        $url = $this->connection->real_escape_string($equipo['url']);

        $salida='';
      
        // Parametros
        $stmt = $this->connection->prepare('SET @idCliente := ?');
        $stmt->bind_param('i', $idCliente);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @nombre := ?');
        $stmt->bind_param('s', $nombre);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @url := ?');
        $stmt->bind_param('s', $url);
        $stmt->execute();

        //Salida
        $stmt = $this->connection->prepare('SET @pResultado := ?');
        $stmt->bind_param('s', $pResultado);
        $stmt->execute();

        $result = $this->connection->query('CALL SP_insertEquipo(@idCliente, @nombre, @url, @pResultado);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @pResultado as pResultado');
        $row = $r->fetch_assoc();               
        $res = $row['pResultado'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudooooooooooooooooooo registrar el equipo." . $res );
        }
        
    }
    
    //Inserta el equipo en el torneo (torneoequipos)
    public function inscribirEquipoATorneo($inscripcion){
        
        $idTorneo = $this->connection->real_escape_string($inscripcion['idTorneo']);
        $idEquipo = $this->connection->real_escape_string($inscripcion['idEquipo']);
        
        $salida='';
      
        // Parametros
        $stmt = $this->connection->prepare('SET @idTorneo := ?');
        $stmt->bind_param('i', $idTorneo);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @idEquipo := ?');
        $stmt->bind_param('i', $idEquipo);
        $stmt->execute();

        //Salida
        $stmt = $this->connection->prepare('SET @pResultado := ?');
        $stmt->bind_param('s', $pResultado);
        $stmt->execute();

        $result = $this->connection->query('CALL SP_insertEquipoEnTorneo(@idTorneo, @idEquipo, @pResultado);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @pResultado as pResultado');
        $row = $r->fetch_assoc();               
        $res = $row['pResultado'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo registrar el equipo en el torneo." . $res );
        }
        
    }
    
    
    //Borra el equipo del torneo.
    public function deleteEquipoTorneo($idEquipo, $idTorneo){
        
        $valor='';
       
        // Parametros
        $stmt = $this->connection->prepare('SET @idEquipo := ?');
        $stmt->bind_param('i', $idEquipo);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @idTorneo := ?');
        $stmt->bind_param('i', $idTorneo);
        $stmt->execute();
 
        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('i', $valor);
        $stmt->execute();
        
        $result = $this->connection->query('CALL SP_deleteEquipoTorneo(@idTorneo, @idEquipo, @valor);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as valor');
        $row = $r->fetch_assoc();               
        $res = $row['valor'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo borrar el equipo del torneo." . $res );
        }
   
            
    }
    
    public function getEquiposTorneo($pIdTorneo){
        
        $stmt = $this->connection->prepare('SET @pIdTorneo := ?');
        $stmt->bind_param('i', $pIdTorneo);
        $stmt->execute(); 
        
        $query = "CALL SP_getEquiposTorneo(@pIdTorneo);";
        
        $eqs = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $eqs[] = $fila;
            }
              
            $result->free();
        }
        return $eqs;
    }
    

 
}