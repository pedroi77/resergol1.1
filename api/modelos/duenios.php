<?php
require_once("connection.php");

class Duenio
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    
    public function getDuenio($usuario,$contrasenia ){
        $stmt = $this->connection->prepare('SET @usuario := ?');
        $stmt->bind_param('s', $usuario);
        $stmt->execute(); 
    
        $stmt = $this->connection->prepare('SET @contrasenia := ?');
        $stmt->bind_param('s', $contrasenia);
        $stmt->execute(); 
        
        $query = "CALL SP_getDuenio(@usuario, @contrasenia );";
        
        $duenio= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $duenio[] = $fila;
            }
              
            $result->free();
        }
        return $duenio;
    }

 
    public function create($duenio){
        $usuario = $this->connection->real_escape_string($duenio['usuario']);
        $contrasenia = $this->connection->real_escape_string($duenio['contrasenia']);
        $nombre = $this->connection->real_escape_string($duenio['nombre']);
        $apellido = $this->connection->real_escape_string($duenio['apellido']);
        $idTipoDoc = $this->connection->real_escape_string($duenio['idTipoDoc']);
        $nroDoc = $this->connection->real_escape_string($duenio['nroDoc']);
        $email = $this->connection->real_escape_string($duenio['email']);
        
        $nombreComplejo = $this->connection->real_escape_string($duenio['nombreComplejo']);
        $nroTelef  = $this->connection->real_escape_string($duenio['NroTelef']);
        $idProv = $this->connection->real_escape_string($duenio['idProv']);
        $idLoc = $this->connection->real_escape_string($duenio['idLoc']);
        $direccion = $this->connection->real_escape_string($duenio['direccion']);
        $nroCalle = $this->connection->real_escape_string($duenio['nroCalle']);
                                
        
        $valor='';
      
       
        // Parametros
        $stmt = $this->connection->prepare('SET @usuario := ?');
        $stmt->bind_param('s', $usuario);
        $stmt->execute();

        $stmt = $this->connection->prepare('SET @contrasenia := ?');
        $stmt->bind_param('s', $contrasenia);
        $stmt->execute();

        $stmt = $this->connection->prepare('SET @nombre := ?');
        $stmt->bind_param('s', $nombre);
        $stmt->execute();

        $stmt = $this->connection->prepare('SET @apellido := ?');
        $stmt->bind_param('s', $apellido);
        $stmt->execute();

        $stmt = $this->connection->prepare('SET @tipoDoc := ?');
        $stmt->bind_param('i', $idTipoDoc);
        $stmt->execute();

        $stmt = $this->connection->prepare('SET @nroDoc := ?');
        $stmt->bind_param('i', $nroDoc);
        $stmt->execute();

        $stmt = $this->connection->prepare('SET @eMail := ?');
        $stmt->bind_param('s', $email);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @nomComplejo := ?');
        $stmt->bind_param('s', $nombreComplejo);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @nroTelef := ?');
        $stmt->bind_param('s', $nroTelef);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @idProv := ?');
        $stmt->bind_param('i',  $idProv);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @idLoc := ?');
        $stmt->bind_param('i',  $idLoc);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @direccion := ?');
        $stmt->bind_param('s', $direccion);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @nroCalle := ?');
        $stmt->bind_param('i', $nroCalle);
        $stmt->execute();
        
        
        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        //$stmt->bind_param('i', $valor);
        $stmt->bind_param('s', $valor);
        $stmt->execute();
        
       
        
         // execute the stored Procedure         SP_insertDuenios
        $result = $this->connection->query('CALL SP_insertDuenios( @usuario, @contrasenia, @nombre, @apellido, @tipoDoc, @nroDoc,                                                                    @eMail, @nomComplejo, @nroTelef,  @idProv, 
                                                                   @idLoc, @direccion, @nroCalle,  @valor)');

        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as duenio');
        $row = $r->fetch_assoc();               

        $res = $row['duenio'] ;

        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo registrar al dueño." . $res ); //por algun motivo pincha aca
        }
        
    }
}