<?php
require_once("connection.php");

class TorneoCopa
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
       
    
    public function updateFixture($data){  
        $IdTorneo = $this->connection->real_escape_string($data['IdTorneo']);
        $IdFecha = $this->connection->real_escape_string($data['IdFecha']);
        $IdReserva = $this->connection->real_escape_string($data['Idreserva']);
        $gol1 = $this->connection->real_escape_string($data['gol1']);
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
        
        $stmt = $this->connection->prepare('SET @gol1 := ?');
        $stmt->bind_param('i', $gol1);
        $stmt->execute(); 

        $stmt = $this->connection->prepare('SET @gol2 := ?');
        $stmt->bind_param('i', $gol2);
        $stmt->execute(); 
   
        
        //salida
        $stmt = $this->connection->prepare('SET @resultado := ?');
        $stmt->bind_param('i', $resultado);
        $stmt->execute(); 
        
        $query = "CALL SP_updateFixtureCopaIda(@IdTorneo, @IdFecha, @IdReserva,  @gol1,  @gol2, @resultado);";
    
        
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
    
    public function getFixtureByFecha($IdTorneo, $IdFecha){  
        $stmt = $this->connection->prepare('SET @IdTorneo := ?');
        $stmt->bind_param('i', $IdTorneo);
        $stmt->execute(); 
         
        $stmt = $this->connection->prepare('SET @IdFecha := ?');
        $stmt->bind_param('i', $IdFecha);
        $stmt->execute(); 
        
        $query = "CALL SP_getFixtureByFechaIdayVuelta(@IdTorneo, @IdFecha);";
        $fixture= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $fixture[] = $fila;
            }
            $result->free();
        }
        return $fixture;
    }
    
    public function updateFixtureIdayVuelta($data){  
        $IdTorneo = $this->connection->real_escape_string($data['IdTorneo']);
        $IdFecha = $this->connection->real_escape_string($data['IdFecha']);
        $IdReserva = $this->connection->real_escape_string($data['Idreserva']);
        $gol1 = $this->connection->real_escape_string($data['gol1']);
        $gol2 = $this->connection->real_escape_string($data['gol2']);
        $vIdReserva = $this->connection->real_escape_string($data['vIdreserva']);
        $vgol1 = $this->connection->real_escape_string($data['vGol1']);
        $vgol2 = $this->connection->real_escape_string($data['vGol2']);  
        
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
        
        
        $stmt = $this->connection->prepare('SET @gol1 := ?');
        $stmt->bind_param('i', $gol1);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @gol2 := ?');
        $stmt->bind_param('i', $gol2);
        $stmt->execute(); 
        
        
        $stmt = $this->connection->prepare('SET @vIdReserva := ?');
        $stmt->bind_param('i', $vIdReserva);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @vgol1 := ?');
        $stmt->bind_param('i', $vgol1);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @vgol2 := ?');
        $stmt->bind_param('i', $vgol2);
        $stmt->execute(); 
   
        
        //salida
        $stmt = $this->connection->prepare('SET @resultado := ?');
        $stmt->bind_param('i', $resultado);
        $stmt->execute(); 
        
        $query = "CALL SP_updateFixtureCopaIdayVuelta(@IdTorneo, @IdFecha, @IdReserva, @gol1, @gol2, @vIdReserva, @vgol1, @vgol2, @resultado);";
    
        
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

