<?php
require_once("connection.php");

class Complejo
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    //Trae todos los datos del complejo del dueño que se logueo
    public function getComplejo($idDuenio){  
        
        $stmt = $this->connection->prepare('SET @pIdDuenio := ?');
        $stmt->bind_param('i', $idDuenio);
        $stmt->execute();  

        $query = "CALL SP_getComplejoByIdDuenio(@pIdDuenio);";

        $complejo = array();

        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $complejo[] = $fila;
            }
              
            $result->free();              
        }
        return $complejo;
    }
    
    //guarda todo lo relacionado con el torneo(Actualiza el objeto persona, el objeto dueño)
    public function createComplejo($complejo){
        
        $idPersona;
        $resultado;
        $this->connection->autocommit(false);
        //echo 'entro al create complejo', 'otro mensaje', '\n';
        try{
            
            //datos del dueño(update)  SP_updateDuenio
            $idDuenio = $this->connection->real_escape_string($complejo['idDuenio']);
            $usuario = $this->connection->real_escape_string($complejo['usuario']);
            $contrasenia = $this->connection->real_escape_string($complejo['contrasenia']);
            
            $diasComplejo= array();
            $diasComplejo =$complejo['diasComplejo'];

            //echo 'entro al create complejo', 'otro mensaje', '\n';
            // Parametros
            $stmt = $this->connection->prepare('SET @pIdDuenio := ?');
            $stmt->bind_param('i', $idDuenio);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pUsuario := ?');
            $stmt->bind_param('s', $usuario);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pContrasenia := ?');
            $stmt->bind_param('s', $contrasenia);
            $stmt->execute();
            
            //salida
            $stmt = $this->connection->prepare('SET @pIdPersona := ?');
            $stmt->bind_param('i', $idPersona);
            $stmt->execute();
            
            $resultCan = $this->connection->query('CALL SP_updateDuenio( @pIdDuenio, @pUsuario, @pContrasenia, @pIdPersona);');
            
            $person = $this->connection->query('SELECT @pIdPersona as persona');
            $row = $person->fetch_assoc();        
            $persona = $row['persona'] ;
            
            //datos de la persona(update), modifica las datos base de una persona(dni, nombre, apellido, etc) SP_updatePersona
            $emailDuenio = $this->connection->real_escape_string($complejo['emailDuenio']);
            $nombreDuenio = $this->connection->real_escape_string($complejo['nombreDuenio']);
            $apellidoDuenio = $this->connection->real_escape_string($complejo['apellidoDuenio']);
            $idTipoDoc = $this->connection->real_escape_string($complejo['idTipoDoc']);
            $nroDoc = $this->connection->real_escape_string($complejo['nroDoc']);
            
            // Parametros
            $stmt = $this->connection->prepare('SET @pIdPersona := ?');
            $stmt->bind_param('i', $persona);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pNombre := ?');
            $stmt->bind_param('s', $nombreDuenio);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pApellido := ?');
            $stmt->bind_param('s', $apellidoDuenio);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pIdTipoDoc := ?');
            $stmt->bind_param('i', $idTipoDoc);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pNroDoc := ?');
            $stmt->bind_param('s', $nroDoc);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pEmail := ?');
            $stmt->bind_param('s', $emailDuenio);
            $stmt->execute();
            
            //salida
            $stmt = $this->connection->prepare('SET @vResultado := ?');
            $stmt->bind_param('i', $resultado);
            $stmt->execute();
            
            $resultCan = $this->connection->query('CALL SP_updatePersona( @pIdPersona, @pNombre, @pIdTipoDoc, @pApellido, @pNroDoc, @pEmail, @vResultado);');
            
            //datos del Complejo(SP_insertComplejos)
            $idComplejo = $this->connection->real_escape_string($complejo['idComplejo']);
            $nombreComplejo = $this->connection->real_escape_string($complejo['nombreComplejo']);
            $descripcionComplejo = $this->connection->real_escape_string($complejo['descripcionComplejo']);
            $estacionamiento = $this->connection->real_escape_string($complejo['estacionamiento']);
            $buffet = $this->connection->real_escape_string($complejo['buffet']);
            $duchas = $this->connection->real_escape_string($complejo['duchas']);
            $parrilla = $this->connection->real_escape_string($complejo['parrilla']);
            $wifi = $this->connection->real_escape_string($complejo['wifi']);
            $horaCobroLuz = $this->connection->real_escape_string($complejo['horaCobroLuz']);
            $porcentajeSenia = $this->connection->real_escape_string($complejo['porcentajeSenia']);
            $horasCancelacion = $this->connection->real_escape_string($complejo['horasCancelacion']);
            $tiempoReserva = $this->connection->real_escape_string($complejo['tiempoReserva']);
            $emailComplejo = $this->connection->real_escape_string($complejo['emailComplejo']);
            $idEstadoComplejo = $this->connection->real_escape_string($complejo['idEstadoComplejo']);
            //$idDuenio = $this->connection->real_escape_string($complejo['idDuenio']);
            $porcentajeLuz = $this->connection->real_escape_string($complejo['porcentajeLuz']);
            $nroCelular = $this->connection->real_escape_string($complejo['nroCelular']);
            $nroTelefono = $this->connection->real_escape_string($complejo['nroTelefono']);
            
            $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
            $stmt->bind_param('i', $idComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pNombre := ?');
            $stmt->bind_param('i', $nombreComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pDescripcion := ?');
            $stmt->bind_param('i', $descripcionComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pEstacionamiento := ?');
            $stmt->bind_param('i', $estacionamiento);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pBuffet := ?');
            $stmt->bind_param('i', $buffet);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pDuchas := ?');
            $stmt->bind_param('i', $duchas);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pParrillas := ?');
            $stmt->bind_param('i', $parrilla);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pWiFi := ?');
            $stmt->bind_param('i', $wifi);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pHoraCobroLuz := ?');
            $stmt->bind_param('i', $horaCobroLuz);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pPorcentajeSeña := ?');
            $stmt->bind_param('i', $porcentajeSenia);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pHorasCancelacion := ?');
            $stmt->bind_param('i', $horasCancelacion);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pTiempoReserva := ?');
            $stmt->bind_param('i', $tiempoReserva);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pEmail := ?');
            $stmt->bind_param('i', $emailComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pIdEstado := ?');
            $stmt->bind_param('i', $idEstadoComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pIdDuenio := ?');
            $stmt->bind_param('i', $idDuenio);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pPorcentajeLuz := ?');
            $stmt->bind_param('i', $porcentajeLuz);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pNroCelular := ?');
            $stmt->bind_param('i', $nroCelular);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pNroTelefono := ?');
            $stmt->bind_param('i', $nroTelefono);
            $stmt->execute();
            
            
            echo 'Something fails: ', $idComplejo . ' error loco', "\n";
            if($idComplejo == null){
                
                $resultCan = $this->connection->query('CALL SP_insertComplejo( @pIdComplejo, @pNombre, @pDescripcion, @pEstacionamiento, @pBuffet, @pDuchas, @pParrillas, @pWiFi, @pHoraCobroLuz, @pPorcentajeSeña, @pHorasCancelacion, @pTiempoReserva, @pEmail, @pIdEstado, @pIdDuenio, @pPorcentajeLuz, @pNroCelular, @pNroTelefono);');
                
                $com = $this->connection->query('SELECT @pIdComplejo as complejo');
                $row = $person->fetch_assoc();        
                $complejo = $row['complejo'];
                
                echo 'Something fails: ', 'despues del SP_insertComplejo' . 'error loco', "\n";
            }
            else
            {
                $resultCan = $this->connection->query('CALL SP_updateComplejo( @pIdComplejo, @pNombre, @pDescripcion, @pEstacionamiento, @pBuffet, @pDuchas, @pParrillas, @pWiFi, @pHoraCobroLuz, @pPorcentajeSeña, @pHorasCancelacion, @pTiempoReserva, @pEmail, @pIdEstado, @pIdDuenio, @pPorcentajeLuz, @pNroCelular, @pNroTelefono);');
                
                echo 'Something fails: ', 'despues del SP_updateComplejo' . 'error loco', "\n";
            }
            
            //datos de la direccion del complejo(SP_insertComplejosDireccion)
            $idComplejo = $this->connection->real_escape_string($complejo['idComplejo']);
            $calle = $this->connection->real_escape_string($complejo['calle']);
            $altura = $this->connection->real_escape_string($complejo['altura']);
            $idProv = $this->connection->real_escape_string($complejo['idProv']);
            $idLoc = $this->connection->real_escape_string($complejo['idLoc']);
            $X = $this->connection->real_escape_string($complejo['X']);
            $Y = $this->connection->real_escape_string($complejo['Y']);

            $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
            $stmt->bind_param('i', $IdComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pCalle := ?');
            $stmt->bind_param('s', $calle);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pAltura := ?');
            $stmt->bind_param('s', $altura);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pIdLocalidad := ?');
            $stmt->bind_param('i', $idLoc);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pIdProvincia := ?');
            $stmt->bind_param('i', $idProv);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pX := ?');
            $stmt->bind_param('s', $X);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pY := ?');
            $stmt->bind_param('s', $Y);
            $stmt->execute();
            
            //salida
            $stmt = $this->connection->prepare('SET @vResultado := ?');
            $stmt->bind_param('s', $resultado);
            $stmt->execute();
            
            if($idComplejo == null){
                $resultCan = $this->connection->query('CALL SP_insertComplejosDireccion(@pIdComplejo, @pCalle, @pAltura, @pIdLocalidad, @pIdProvincia, @pX, @pY, @vResultado);');
                
                echo 'Something fails: ', 'despues del SP_insertComplejosDireccion' . 'error loco', "\n";
            }
            else{
                $resultCan = $this->connection->query('CALL SP_updateComplejoDireccion(@pIdComplejo, @pCalle, @pAltura, @pIdLocalidad, @pIdProvincia, @pX, @pY, @vResultado);');
                
                echo 'Something fails: ', 'despues del SP_updateComplejoDireccion' . 'error loco', "\n";
            }
            
            //
            
            //PARTE DE COMPLEJOS PAGOS
            $CBU = $this->connection->real_escape_string($complejo['CBU']);
            $NroCuenta = $this->connection->real_escape_string($complejo['nroCuenta']);
            
            $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
            $stmt->bind_param('i', $IdComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pCBU := ?');
            $stmt->bind_param('s', $CBU);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pNroCuenta := ?');
            $stmt->bind_param('s', $NroCuenta);
            $stmt->execute();
            
            if($idComplejo == null){
                $resultCan = $this->connection->query('CALL SP_insertComplejosPagos( @pIdComplejo, @pCBU, @pNroCuenta);');
            }
            else
            {
                $resultCan = $this->connection->query('CALL SP_updateComplejosPagos( @pIdComplejo, @pCBU, @pNroCuenta);');
            }
            
            /*Alta de Dias*/
            /*foreach ($diasComplejo as $dia) {
                
                $HoraDesde = $this->connection->real_escape_string($dia['horaDesde']);
                $HoraHasta = $this->connection->real_escape_string($dia['horaHasta']);
                $DiaDesde = $this->connection->real_escape_string($dia['diaDesde']);
                $DiaHasta = $this->connection->real_escape_string($dia['diaHasta']);
                
                $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
                $stmt->bind_param('i', $idDuenio);
                $stmt->execute();
                
                $stmt = $this->connection->prepare('SET @pIdDiaDesde := ?');
                $stmt->bind_param('i', $HoraDesde);
                $stmt->execute();
                
                $stmt = $this->connection->prepare('SET @pIdDiaHasta := ?');
                $stmt->bind_param('s', $HoraHasta);
                $stmt->execute();
                
                
                $stmt = $this->connection->prepare('SET @pHoraDesde := ?');
                $stmt->bind_param('s', $DiaDesde);
                $stmt->execute();
                
                $stmt = $this->connection->prepare('SET @pHoraHasta := ?');
                $stmt->bind_param('s', $DiaHasta);
                $stmt->execute();
                
                $resultDia = $this->connection->query('CALL SP_insertDiasComplejos( @pIdComplejo, @pIdDiaDesde, @pIdDiaHasta, @pHoraDesde, @pHoraHasta);');      
        
                //getting the value of the OUT parameter
                $rcan = $this->connection->query('SELECT @outDia as res');
                $row = $rcan->fetch_assoc();               
                $resCan = $row['res'] ;
            }*/
            
            $this->connection->commit();
            //$this->connection->rollback();
            
            //$dat= array($res);
            //sendResult($dat, 'OK' );
        }
        catch (Exception $e){
            
            $this->connection->rollback();
            echo 'Something fails: ',  $e->getMessage() . '  entro excepcion    error loco', "\n";
        }
    }
    
}

