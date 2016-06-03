<?php
require_once("connection.php");

class Reserva
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    
 

    public function create($reserva){
        
        $idCliente = $this->connection->real_escape_string($reserva['idCliente']);
        $idComplejo = $this->connection->real_escape_string($reserva['idComplejo']);
        $idCancha = $this->connection->real_escape_string($reserva['idCancha']);
        $fechaPartido = $this->connection->real_escape_string($reserva['fechaPartido']);
        $horaD = $this->connection->real_escape_string($reserva['horaD']);
        $horaH = $this->connection->real_escape_string($reserva['horaH']);
        $importeAPagar = $this->connection->real_escape_string($reserva['importeAPagar']);
        $pagado = $this->connection->real_escape_string($reserva['pagado']);
        $porcentajePago = $this->connection->real_escape_string($reserva['porcentajePago']);
        $estadoReserva = $this->connection->real_escape_string($reserva['estadoReserva']);
        
        $salida='';
      
       
        // Parametros
        $stmt = $this->connection->prepare('SET @idCliente := ?');
        $stmt->bind_param('i', $idCliente);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @idComplejo := ?');
        $stmt->bind_param('i', $idComplejo);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @idCancha := ?');
        $stmt->bind_param('i', $idCancha);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @fechaPartido := ?');
        $stmt->bind_param('s', $fechaPartido);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @horaD := ?');
        $stmt->bind_param('s', $horaD);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @horaH := ?');
        $stmt->bind_param('s', $horaH);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @importeAPagar := ?');
        $stmt->bind_param('d', $importeAPagar);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @pagado := ?');
        $stmt->bind_param('d', $pagado);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @porcentajePago := ?');
        $stmt->bind_param('i', $porcentajePago);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @estadoReserva := ?');
        $stmt->bind_param('i', $estadoReserva);
        $stmt->execute();
        
        //Salida
        $stmt = $this->connection->prepare('SET @idReserva := ?');
        //$stmt->bind_param('i', $valor);
        $stmt->bind_param('s', $idReserva); //PUEDE SER QUE VAYA "i"...
        $stmt->execute();
        
       
         // execute the stored Procedure         SP_reservar
        
        $result = $this->connection->query('CALL SP_reservar( @idCliente, @idComplejo, @idCancha, @fechaPartido, @horaD, @horaH, @importeAPagar, @pagado, @porcentajePago, @estadoReserva, @idReserva);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @idReserva as idReserva');
        $row = $r->fetch_assoc();               

        $res = $row['idReserva'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo registrar la reserva." . $res );
        }
   
            
    }
    

    
}


