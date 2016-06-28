<?php
require_once("connection.php");

class ReservaFija
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    
     public function getFechasReservaFija($pIdCancha, $pIdComplejo, $pHoraDesde, $pIdDia, $pAnio, $pFechaPrimerReserva){
        
        $stmt = $this->connection->prepare('SET @pIdCancha := ?');
        $stmt->bind_param('i', $pIdCancha);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $pIdComplejo);
        $stmt->execute(); 
         
        $stmt = $this->connection->prepare('SET @pHoraDesde := ?');
        $stmt->bind_param('s', $pHoraDesde);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @pIdDia := ?');
        $stmt->bind_param('i', $pIdDia);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pAnio := ?');
        $stmt->bind_param('i', $pAnio);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @pFechaPrimerReserva := ?');
        $stmt->bind_param('s', $pFechaPrimerReserva);
        $stmt->execute();  
         
        $query = "CALL SP_getFechasReservaFija(@pIdCancha, @pIdComplejo, @pHoraDesde, @pIdDia, @pAnio, @pFechaPrimerReserva);";
        
        $FechasReservasFijas = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $FechasReservasFijas[] = $fila;
            }
              
            $result->free();
        }
        return $FechasReservasFijas;
    }
    
    
    public function create($ResFija){
        
        $this->connection->autocommit(false);
        try
        {
            $ReservasFijas = array();
            $ReservasFijas = $ResFija;
            
                foreach ($ReservasFijas as $resFija) {
                    
                    $idCliente = $this->connection->real_escape_string($resFija['idCliente']);
                    $idComplejo = $this->connection->real_escape_string($resFija['idComplejo']);
                    $idCancha = $this->connection->real_escape_string($resFija['idCancha']);
                    $fechaPartido = $this->connection->real_escape_string($resFija['fechaPartido']);
                    $horaD = $this->connection->real_escape_string($resFija['horaD']);
                    $horaH = $this->connection->real_escape_string($resFija['horaH']);
                    $importeAPagar = $this->connection->real_escape_string($resFija['importeAPagar']);
                    $pagado = $this->connection->real_escape_string($resFija['pagado']);
                    $porcentajePago = $this->connection->real_escape_string($resFija['porcentajePago']);
                    $estadoReserva = $this->connection->real_escape_string($resFija['estadoReserva']);

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
                    $stmt->bind_param('s', $idReserva);
                    $stmt->execute();

                    $result = $this->connection->query('CALL SP_reservar( @idCliente, @idComplejo, @idCancha, @fechaPartido, @horaD, @horaH, @importeAPagar, @pagado, @porcentajePago, @estadoReserva, @idReserva);');

                }
            
                // getting the value of the OUT parameter
                    $r = $this->connection->query('SELECT @idReserva as idReserva');
                    $row = $r->fetch_assoc();               

                    $res = $row['idReserva'] ;
                        
                    if($res > -1){
                        $this->connection->commit();
                        $dat= array($res);
                        sendResult($dat, 'OK' );
                        
                    }else{
                       sendError("Error, no se pudo registrar la reserva." . $res );
                    }
            }
            catch (Exception $e){

                $this->connection->rollback();
            }
        
        }
    
}