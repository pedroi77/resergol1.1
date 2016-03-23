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
        $stmt = $c->prepare('SET @usuario := ?');
        $stmt->bind_param('s', $usuario);
        $stmt->execute();

        $stmt = $c->prepare('SET @contrasenia := ?');
        $stmt->bind_param('s', $contrasenia);
        $stmt->execute();

        $stmt = $c->prepare('SET @nombre := ?');
        $stmt->bind_param('s', $nombre);
        $stmt->execute();

        $stmt = $c->prepare('SET @apellido := ?');
        $stmt->bind_param('s', $apellido);
        $stmt->execute();

        $stmt = $c->prepare('SET @tipoDoc := ?');
        $stmt->bind_param('i', $tipoDoc);
        $stmt->execute();

        $stmt = $c->prepare('SET @nroDoc := ?');
        $stmt->bind_param('i', $nroDoc);
        $stmt->execute();

        $stmt = $c->prepare('SET @eMail := ?');
        $stmt->bind_param('s', $eMail);
        $stmt->execute();

        //Salida
        $stmt = $c->prepare('SET @valor := ?');
        $stmt->bind_param('i', $valor);
        $stmt->execute();
        
        
        $query = "INSERT INTO productos VALUES (
                    DEFAULT,
                    '$idCategoria',
                    '$descripcion',
                    '$precio')";
        if($this->connection->query($query)){
            $producto['producto_id'] = $this->connection->insert_id;
            return $producto;
        }else{
            return false;
        }
        
        
         // execute the stored Procedure
        $result = $c->query('CALL SP_insertDuenios( @usuario, @contrasenia, @nombre, @apellido, @tipoDoc, @nroDoc,@eMail, @valor)');

        // getting the value of the OUT parameter
        $r = $c->query('SELECT @valor as duenio');
        $row = $r->fetch_assoc();               

        $res = $row['duenio'] ;

        if($res > -1){
            $dat= array( duenio  => $res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo registrar al dueño."); //por algun motivo pincha aca
        }
        
    }
}