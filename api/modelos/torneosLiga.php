<?php
require_once("connection.php");

class TorneoLiga
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
       
     public function getTablaDePosiciones($IdTorneo){  
        $stmt = $this->connection->prepare('SET @IdTorneo := ?');
        $stmt->bind_param('i', $IdTorneo);
        $stmt->execute(); 
        
        $query = "CALL SP_getTablaPosiciones(@IdTorneo);";
        $equipos= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $equipos[] = $fila;
            }
            $result->free();
        }
        return $equipos;
    }
    
    public function getFechasBytorneo($IdTorneo){  
        $stmt = $this->connection->prepare('SET @IdTorneo := ?');
        $stmt->bind_param('i', $IdTorneo);
        $stmt->execute(); 
        
        $query = "CALL SP_getfechasLigaByIdTorneo(@IdTorneo);";
        $fechas= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $fechas[] = $fila;
            }
            $result->free();
        }
        return $fechas;
    }
    
    public function getFixtureByFecha($IdTorneo, $IdFecha){  
        $stmt = $this->connection->prepare('SET @IdTorneo := ?');
        $stmt->bind_param('i', $IdTorneo);
        $stmt->execute(); 
         
        $stmt = $this->connection->prepare('SET @IdFecha := ?');
        $stmt->bind_param('i', $IdFecha);
        $stmt->execute(); 
        
        $query = "CALL SP_getFixtureByFecha(@IdTorneo, @IdFecha);";
        $fixture= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $fixture[] = $fila;
            }
            $result->free();
        }
        return $fixture;
    }
    
    public function updateFixture($data){  
        $IdTorneo = $this->connection->real_escape_string($data['IdTorneo']);
        $IdFecha = $this->connection->real_escape_string($data['IdFecha']);
        $IdReserva = $this->connection->real_escape_string($data['Idreserva']);
        $IdEquipo1 = $this->connection->real_escape_string($data['IdEquipo1']);
        $gol1 = $this->connection->real_escape_string($data['gol1']);
        $IdEquipo2 = $this->connection->real_escape_string($data['IdEquipo2']);
        $gol2 = $this->connection->real_escape_string($data['gol2']);
          
        $resultado = 0;
        
        $stmt = $this->connection->prepare('SET @IdTorneo := ?');
        $stmt->bind_param('i', $IdTorneo);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @IdFecha := ?');
        $stmt->bind_param('i', $IdFecha);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @IdReserva := ?');
        $stmt->bind_param('i', $IdReserva);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @IdEquipo1 := ?');
        $stmt->bind_param('i', $IdEquipo1);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @gol1 := ?');
        $stmt->bind_param('i', $gol1);
        $stmt->execute(); 
        
         $stmt = $this->connection->prepare('SET @IdEquipo2 := ?');
        $stmt->bind_param('i', $IdEquipo2);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @gol2 := ?');
        $stmt->bind_param('i', $gol2);
        $stmt->execute(); 
   
        
        //salida
        $stmt = $this->connection->prepare('SET @resultado := ?');
        $stmt->bind_param('i', $resultado);
        $stmt->execute(); 
        
        $query = "CALL sp_updateFixture(@IdTorneo, @IdFecha, @IdReserva,  @IdEquipo1, @gol1,  @IdEquipo2, @gol2, @resultado);";
    
        
        if( $result = $this->connection->query($query) ){
            $r = $this->connection->query('SELECT @resultado as res');
            $row = $r->fetch_assoc();               
            $res = $row['res'] ;            
        }
       
  
        if($res > 0){
            $this->connection->commit();
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo actualizar el fixture." . $res ); //por algun motivo pincha aca
        }
    }
    
    
}

