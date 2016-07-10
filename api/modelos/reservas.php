<?php
require_once("connection.php");

class Reserva
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    
     public function getHorariosReservasByDia($pIdComplejo, $pIdCancha, $pFechaHorarios){
        
        
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $pIdComplejo);
        $stmt->execute(); 
         
        $stmt = $this->connection->prepare('SET @pIdCancha := ?');
        $stmt->bind_param('i', $pIdCancha);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pFecha := ?');
        $stmt->bind_param('s', $pFechaHorarios);
        $stmt->execute();
        
        $query = "CALL SP_getHorariosReservasByDia(@pIdComplejo, @pIdCancha, @pFecha);";
        
        $reservas = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $reservas[] = $fila;
            }
              
            $result->free();
        }
        return $reservas;
    }
    
    public function getHorasDisponiblesByFecha($pIdCancha, $pIdComplejo, $pFecha){
        
        
        $stmt = $this->connection->prepare('SET @pIdCancha := ?');
        $stmt->bind_param('i', $pIdCancha);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $pIdComplejo);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @pFecha := ?');
        $stmt->bind_param('s', $pFecha);
        $stmt->execute();
        
        $query = "CALL SP_getHorasDisponiblesByFecha(@pIdCancha, @pIdComplejo, @pFecha);";
        
        $reservas = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $reservas[] = $fila;
            }
              
            $result->free();
        }
        return $reservas;
    }
    
    
 
    //Inserta la reserva.
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
    
    
    public function getReservasByCliente($pIdCliente, $todos, $pagosCompletos, $seniadas, $fijas){
        
        
        $stmt = $this->connection->prepare('SET @pIdCliente := ?');
        $stmt->bind_param('i', $pIdCliente);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @pTodos := ?');
        $stmt->bind_param('i', $todos);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pPagosCompletos := ?');
        $stmt->bind_param('i', $pagosCompletos);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pSeniadas := ?');
        $stmt->bind_param('i', $seniadas);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pFijas := ?');
        $stmt->bind_param('i', $fijas);
        $stmt->execute();
        
        $query = "CALL SP_getReservasByCliente(@pIdCliente, @pTodos, @pPagosCompletos, @pSeniadas, @pFijas);";
        
        $reservas = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $reservas[] = $fila;
            }
              
            $result->free();
        }
        return $reservas;
    }
    
    public function updateReservasAumento($aumentoReserva){
        
        $vResultado = 0;
        
        $idComplejo = $this->connection->real_escape_string($aumentoReserva['idComplejo']);
        $idCancha = $this->connection->real_escape_string($aumentoReserva['idCancha']);
        $porcentajeAumento = $this->connection->real_escape_string($aumentoReserva['porcentajeAumento']);
        
        // Parametros
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $idComplejo);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @pIdCancha := ?');
        $stmt->bind_param('i', $idCancha);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @pPorcenjateAumento := ?');
        $stmt->bind_param('d', $porcentajeAumento);
        $stmt->execute();
        
        //Salida
        $stmt = $this->connection->prepare('SET @vResultado := ?');
        $stmt->bind_param('i', $vResultado);
        $stmt->execute();
        
        $result = $this->connection->query('CALL SP_updateReservasAumento( @pIdComplejo, @pIdCancha, @pPorcenjateAumento, @vResultado);');
        
        //echo 'Cambios en la reserva: ', '  Complejo: ' . $idComplejo . '  Cancha: ' . $idCancha . '  aumento: ' . $porcentajeAumento, "\n";
        
        $r = $this->connection->query('SELECT @vResultado as resul');
        $row = $r->fetch_assoc();               

        $res = $row['resul'] ;
        
        //echo 'Cambios en la reserva: ', '  resultado: ' . $res, "\n";
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se actualizaron las reservas." . $res );
        }
        
    }
    
    //Al cancelar la reserva, luego de ingresar la devolucion, borro la reserva.
    /*public function delete($idReserva){
        
        $valor='';
       
        // Parametros
        $stmt = $this->connection->prepare('SET @idReserva := ?');
        $stmt->bind_param('i', $idReserva);
        $stmt->execute();
        
        
        //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('i', $valor);
        $stmt->execute();
        
    
        $result = $this->connection->query('CALL SP_DeleteReserva(@idReserva, @valor);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @valor as valor');
        $row = $r->fetch_assoc();               
        $res = $row['valor'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo borrar la reserva" . $res );
        }
   
            
    }*/
    
    

    
}


