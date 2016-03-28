<?php
require_once("connection.php");

class Duenio
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
 
    public function create($duenio){
        $usuario = $this->connection->real_escape_string($duenio['usuario']);
        $contrasenia = $this->connection->real_escape_string($duenio['contrasenia']);
        $nombre = $this->connection->real_escape_string($duenio['nombre']);
        $apellido = $this->connection->real_escape_string($duenio['apellido']);
        $idTipoDoc = $this->connection->real_escape_string($duenio['idTipoDoc']);
        $nroDoc = $this->connection->real_escape_string($duenio['nroDoc']);
        $email = $this->connection->real_escape_string($duenio['email']);
        
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

        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        //$stmt->bind_param('i', $valor);
        $stmt->bind_param('s', $valor);
        $stmt->execute();
        
       
        
         // execute the stored Procedure         SP_insertDuenios
        $result = $this->connection->query('CALL SP_insertDuenios( @usuario, @contrasenia, @nombre, @apellido, @tipoDoc, @nroDoc,@eMail, @valor)');

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