<?php
require_once("connection.php");
class Persona
{
   
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }

    public function modificarPersona($persona){
        
        //datos de la persona(update), modifica las datos base de una persona(dni, nombre, apellido, etc) SP_updatePersona
            $idPersona = $this->connection->real_escape_string($persona['idPersona']);
            $email = $this->connection->real_escape_string($persona['email']);
            $nombre = $this->connection->real_escape_string($persona['nombre']);
            $apellido = $this->connection->real_escape_string($persona['apellido']);
            $idTipoDoc = $this->connection->real_escape_string($persona['idTipoDoc']);
            $nroDoc = $this->connection->real_escape_string($persona['nroDoc']);
            
            //PARTE UPDATE DE PERSONA
            // Parametros
            $stmt = $this->connection->prepare('SET @pIdPersona := ?');
            $stmt->bind_param('i', $idPersona);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pNombre := ?');
            $stmt->bind_param('s', $nombre);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pApellido := ?');
            $stmt->bind_param('s', $apellido);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pIdTipoDoc := ?');
            $stmt->bind_param('i', $idTipoDoc);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pNroDoc := ?');
            $stmt->bind_param('s', $nroDoc);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pEmail := ?');
            $stmt->bind_param('s', $email);
            $stmt->execute();
            
            //Salida
            $stmt = $this->connection->prepare('SET @valor := ?');
            $stmt->bind_param('s', $valor);
            $stmt->execute();
            
            $resultCan = $this->connection->query('CALL SP_updatePersona(@pIdPersona, @pNombre, @pIdTipoDoc, @pApellido, @pNroDoc, @pEmail, @valor);');
        
            $r = $this->connection->query('SELECT @valor as cliente');
            $row = $r->fetch_assoc();               
            $res = $row['cliente'] ;

            if($res > -1){
                $dat= array($res);
                sendResult($dat, 'OK' );
            }else{
               sendError("Error, no se pudo modificar a la persona." . $res ); //por algun motivo pincha aca
            }
    }
    
    
}
