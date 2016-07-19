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
    
    //Trae los dias que fueron agregados al complejo por el dueño del mismo
    public function getDiasComplejo($idComplejo, $aux){  
        
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $idComplejo);
        $stmt->execute();  

        $query = "CALL SP_getComplejosDias(@pIdComplejo);";

        //echo 'Something fails: ','ID COmplejo: ' . $idComplejo, "\n";
        
        $canchas = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $canchas[] = $fila;
            }
              
            $result->free();
        }
        return $canchas;
    }
    
    //guarda todo lo relacionado con el torneo(Actualiza el objeto persona, el objeto dueño)
    public function createComplejo($complejo){
        
        $idPersona = 0;
        $resultado = 0;
        $this->connection->autocommit(false);
        //echo 'entro al create complejo', 'otro mensaje', '\n';
        try{
            
            //datos del dueño(update)  SP_updateDuenio
            $idDuenio = $this->connection->real_escape_string($complejo['idDuenio']);
            $usuario = $this->connection->real_escape_string($complejo['usuario']);
            $contrasenia = $this->connection->real_escape_string($complejo['contrasenia']);

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
            
            //echo 'entro al create complejo', '$idDuenio ' . $idDuenio . ' $usuario ' . $usuario . ' $contrasenia ' . $contrasenia . ' $idPersona ' . $idPersona, '\n';
            $resultCan = $this->connection->query('CALL SP_updateDuenio(@pIdDuenio, @pUsuario, @pContrasenia, @pIdPersona);');
            //-.-.-.-.-.-.-.-.-.-.-.-.-.-.-FIN UPDATE DUEÑO-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//
            
            //datos de la persona(update), modifica las datos base de una persona(dni, nombre, apellido, etc) SP_updatePersona
            $emailDuenio = $this->connection->real_escape_string($complejo['emailDuenio']);
            $nombreDuenio = $this->connection->real_escape_string($complejo['nombreDuenio']);
            $apellidoDuenio = $this->connection->real_escape_string($complejo['apellidoDuenio']);
            $idTipoDoc = $this->connection->real_escape_string($complejo['idTipoDoc']);
            $nroDoc = $this->connection->real_escape_string($complejo['nroDoc']);
            
            //PARTE UPDATE DE PERSONA
            $person = $this->connection->query('SELECT @pIdPersona as persona');
            $row = $person->fetch_assoc();        
            $persona = $row['persona'] ;
            
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
            
            $resultCan = $this->connection->query('CALL SP_updatePersona(@pIdPersona, @pNombre, @pIdTipoDoc, @pApellido, @pNroDoc, @pEmail, @vResultado);');
            //-.-.-.-.-.-.-.-.-.-.-.-.-.-.-FIN UPDATE PERSONA-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//
            
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
            
            //parte complejos
            $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
            $stmt->bind_param('i', $idComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pNombre := ?');
            $stmt->bind_param('s', $nombreComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pDescripcion := ?');
            $stmt->bind_param('s', $descripcionComplejo);
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
            $stmt->bind_param('s', $horaCobroLuz);
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
            $stmt->bind_param('s', $emailComplejo);
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
              
            //echo 'Something fails: ','ID COmplejo: ' . $idComplejo, "\n";
            
            if($idComplejo === NULL or $idComplejo === 'NULL' or $idComplejo === null or $idComplejo === 'null'){
                
                $resultCan = $this->connection->query('CALL SP_insertComplejo( @pIdComplejo, @pNombre, @pDescripcion, @pEstacionamiento, @pBuffet, @pDuchas, @pParrillas, @pWiFi, @pHoraCobroLuz, @pPorcentajeSeña, @pHorasCancelacion, @pTiempoReserva, @pEmail, @pIdEstado, @pIdDuenio, @pPorcentajeLuz, @pNroCelular, @pNroTelefono);');
                
                $com = $this->connection->query('SELECT @pIdComplejo as complejo');
                $row = $com->fetch_assoc();        
                $idComplejo = $row['complejo'];
                
                //echo 'Something fails: ', 'Inserto complejo ' . 'idCOmplejo nuevo: ' . $idComplejo , "\n";
                
                //echo 'Complejo Insert: ', 'Complejo: ' . $idComplejo . ' Nombre Complejo: ' . $nombreComplejo . ' Descripcion: ' . $descripcionComplejo . ' Estacionamiento: ' . $estacionamiento . ' Buffet: ' . $buffet . ' Duchas: ' . $duchas . ' Parrilla: ' . $parrilla . ' WiFi: ' . $wifi . ' Hora Luz: ' . $horaCobroLuz . ' Porcentaje Seña: ' . $porcentajeSenia . ' Cancelacion: ' . $horasCancelacion . ' Tiempo Reserva: ' . $tiempoReserva . ' Email Complejo: ' . $emailComplejo . ' Estado Complejo: ' . $idEstadoComplejo . ' idDueño: ' . $idDuenio . ' Luz: ' . $porcentajeLuz . ' Celular: ' . $nroCelular . ' Telefono: ' . $nroTelefono, "\n";
            }
            else
            {
                $resultCan = $this->connection->query('CALL SP_updateComplejo( @pIdComplejo, @pNombre, @pDescripcion, @pEstacionamiento, @pBuffet, @pDuchas, @pParrillas, @pWiFi, @pHoraCobroLuz, @pPorcentajeSeña, @pHorasCancelacion, @pTiempoReserva, @pEmail, @pIdEstado, @pIdDuenio, @pPorcentajeLuz, @pNroCelular, @pNroTelefono);');
                
                //echo 'Something fails: ', 'hizo update al complejo', "\n";
                
                //echo 'Complejo Update: ', 'Complejo: ' . $idComplejo . ' Nombre Complejo: ' . $nombreComplejo . ' Descripcion: ' . $descripcionComplejo . ' Estacionamiento: ' . $estacionamiento . ' Buffet: ' . $buffet . ' Duchas: ' . $duchas . ' Parrilla: ' . $parrilla . ' WiFi: ' . $wifi . ' Hora Luz: ' . $horaCobroLuz . ' Porcentaje Seña: ' . $porcentajeSenia . ' Cancelacion: ' . $horasCancelacion . ' Tiempo Reserva: ' . $tiempoReserva . ' Email Complejo: ' . $emailComplejo . ' Estado Complejo: ' . $idEstadoComplejo . ' idDueño: ' . $idDuenio . ' Luz: ' . $porcentajeLuz . ' Celular: ' . $nroCelular . ' Telefono: ' . $nroTelefono, "\n";
            }
            
            //-.-.-.-.-.-.-.-.-.-.-.-.-.-.-FIN SET COMPLEJO-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//

            //Se guardara los demas datos del complejo(Tales como los pagos, direccion y dias que se abre el complejo)
            $this->insertarOtrosDatos($complejo, $idComplejo);

            //echo 'Hizo Commit ','ID COmplejo: ' . $idComplejo, "\n";
            //$this->connection->rollback();
            
            $this->connection->commit();
            $dat= array($idComplejo);
            sendResult($dat, 'OK' );
            
        }
        catch (Exception $e){
            
            $this->connection->rollback();
            //echo 'Something fails: ',  $e->getMessage() . '  hizo rollback ', "\n";
        }
    }
    
    public function insertarOtrosDatos($complejo, $idComplejo){
        
        $idPersona;
        $resultado;
        $this->connection->autocommit(false);
        
        try{
            
            //PARTE DE COMPLEJOS PAGOS
            $CBU = $this->connection->real_escape_string($complejo['CBU']);
            $NroCuenta = $this->connection->real_escape_string($complejo['nroCuenta']);
            
            //PARAMETROS DE COMPLEJOS PAGOS
            $stmt = $this->connection->prepare('SET @pIdComplejoPagos := ?');
            $stmt->bind_param('i', $idComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pCBU := ?');
            $stmt->bind_param('s', $CBU);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pNroCuenta := ?');
            $stmt->bind_param('s', $NroCuenta);
            $stmt->execute();
            
            //echo 'Something fails: ', 'seteo los parametros de pagos con ID ' . $idComplejo . ' CBU: ' . $CBU . ' NroCuenta: ' . $NroCuenta, "\n";

            /*$stmt = $this->connection->prepare('SET @pIdComplejoPagos := ?');
            $stmt->bind_param('i', $idComplejo);
            $stmt->execute();
            
            $complejoPagos = array();
            if($result = $this->connection->query('CALL SP_existeComplejoPagos(@pIdComplejoPagos);') ){
                while($fila = $result->fetch_assoc()){
                    $complejoPagos[] = $fila;
                }           
            }*/
            
            //$complejoPagos[0]['existe'] === '0'
            /*if(true){
                $resultCan = $this->connection->query('CALL SP_insertComplejosPagos(@pIdComplejoPagos, @pCBU, @pNroCuenta);');
                
                echo 'Something fails: ', 'Inserto los pagos con ID ' . $idComplejo, "\n";
            }
            else
            {
                $resultCan = $this->connection->query('CALL SP_updateComplejosPagos(@pIdComplejoPagos, @pCBU, @pNroCuenta);');
                
                echo 'Something fails: ', 'Updateo los pagos con ID ' . $idComplejo, "\n";
            }*/
            
            $resultCan = $this->connection->query('CALL SP_setComplejosPagos(@pIdComplejoPagos, @pCBU, @pNroCuenta);');
            //-.-.-.-.-.-.-.-.-.-.-.-.-.-.-FIN COMPLEJOS PAGOS-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//
            
            //DATOS DE LA DIRECCION DEL COMPLEJO(SP_insertComplejosDireccion)
            $calle = $this->connection->real_escape_string($complejo['calle']);
            $altura = $this->connection->real_escape_string($complejo['altura']);
            $idProv = $this->connection->real_escape_string($complejo['idProv']);
            $idLoc = $this->connection->real_escape_string($complejo['idLoc']);
            $X = $this->connection->real_escape_string($complejo['X']);
            $Y = $this->connection->real_escape_string($complejo['Y']);
            
            //PARAMETROS DE COMPLEJOS DIRECCION            
            $stmt = $this->connection->prepare('SET @pIdComplejoDireccion := ?');
            $stmt->bind_param('i', $idComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pCalle := ?');
            $stmt->bind_param('s', $calle);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pAltura := ?');
            $stmt->bind_param('i', $altura);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pIdLocalidad := ?');
            $stmt->bind_param('i', $idLoc);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pIdProvincia := ?');
            $stmt->bind_param('i', $idProv);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pX := ?');
            $stmt->bind_param('d', $X);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pY := ?');
            $stmt->bind_param('d', $Y);
            $stmt->execute();
            
            $resultCan = $this->connection->query('CALL SP_setComplejosDireccion(@pIdComplejoDireccion, @pCalle, @pAltura, @pIdLocalidad, @pIdProvincia, @pX, @pY);');
            
            //$complejoDireccion[0]['existe'] === '0'
            /*if(true){
                $resultCan = $this->connection->query('CALL SP_insertComplejosDireccion(@pIdComplejoDireccion, @pCalle, @pAltura, @pIdLocalidad, @pIdProvincia, @pX, @pY);');
                
                echo 'Something fails: ', 'despues del SP_insertComplejosDireccion', "\n";
                
                echo 'Complejo Direccion: ', 'Complejo: ' . $idComplejo . ' Calle: ' . $calle . ' Altura: ' . $altura . ' Localidad: ' . $idLoc . ' Provincia: ' . $idProv . ' X: ' . $X . ' Y: ' . $Y, "\n";
            }
            else{
                $resultCan = $this->connection->query('CALL SP_updateComplejoDireccion(@pIdComplejo, @pCalle, @pAltura, @pIdLocalidad, @pIdProvincia, @pX, @pY);');
                
                echo 'Something fails: ', 'despues del SP_updateComplejoDireccion', "\n";
                
                echo 'Complejo Direccion: ', 'Complejo: ' . $idComplejo . ' Calle: ' . $calle . ' Altura: ' . $altura . ' Localidad: ' . $idLoc . ' Provincia: ' . $idProv . ' X: ' . $X . ' Y: ' . $Y, "\n";
                
                $res = $this->connection->query('SELECT @vResultado as resul');
                $row = $res->fetch_assoc();        
                $resultado = $row['resul'];
            }*/
            //-.-.-.-.-.-.-.-.-.-.-.-.-.-.-FIN COMPLEJOS DIRECCION-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//
            
            //COMPLEJOS DIAS
            $diasComplejo = array();
            $diasComplejo = $complejo['diasComplejo'];
            
            $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
            $stmt->bind_param('i', $idComplejo);
            $stmt->execute();
            
            $resultCan = $this->connection->query('CALL SP_deleteComplejosDias(@pIdComplejo);');
            
            //HARA EL FOR EACH DE LOS DIAS CARGADOS POR EL DUEÑO DE CUANDO SE ABRIRA SU COMPLEJO
            foreach ($diasComplejo as $dia){
                
                $HoraDesde = $this->connection->real_escape_string($dia['horaDesde']);
                $HoraHasta = $this->connection->real_escape_string($dia['horaHasta']);
                $DiaDesde = $this->connection->real_escape_string($dia['idDiaDesde']);
                $DiaHasta = $this->connection->real_escape_string($dia['idDiaHasta']);
                
                $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
                $stmt->bind_param('i', $idComplejo);
                $stmt->execute();
                
                $stmt = $this->connection->prepare('SET @pIdDiaDesde := ?');
                $stmt->bind_param('i', $DiaDesde);
                $stmt->execute();
                
                $stmt = $this->connection->prepare('SET @pIdDiaHasta := ?');
                $stmt->bind_param('i', $DiaHasta);
                $stmt->execute();
                
                $stmt = $this->connection->prepare('SET @pHoraDesde := ?');
                $stmt->bind_param('s', $HoraDesde);
                $stmt->execute();
                
                $stmt = $this->connection->prepare('SET @pHoraHasta := ?');
                $stmt->bind_param('s', $HoraHasta);
                $stmt->execute();
                
                 //echo 'Something fails: ', "Hora desde " . $dia['horaDesde'] . " Hora hasta " . $dia['horaHasta'] . " id Dia Desde " . $dia['idDiaDesde'] . " id Dia Desde " . $dia['idDiaHasta'], "\n";
                
                $resultDia = $this->connection->query('CALL SP_setComplejosDias(@pIdComplejo, @pIdDiaDesde, @pIdDiaHasta, @pHoraDesde, @pHoraHasta);');
            }
            //-.-.-.-.-.-.-.-.-.-.-.-.-.-.-FIN COMPLEJOS DIAS-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//
            
        }catch(Exception $e){
            
            $this->connection->rollback();
        }

    }
    
/*****************RELACIONADO A LAS IMAGENES****************************/
    
    public function deleteImagen($idComplejo, $url){  
        
        $this->connection->autocommit(false);

        try {

            $salida='';
            $archivo = "C:\\xampp\\htdocs\\resergol1.1\\api\\Imagenes\\complejos\\" . $url;    

            // Parametros
            $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
            $stmt->bind_param('i', $idComplejo);
            $stmt->execute();

            $stmt = $this->connection->prepare('SET @pUrl := ?');
            $stmt->bind_param('s', $url);
            $stmt->execute();

            //Salida
            $stmt = $this->connection->prepare('SET @vResultado := ?');
            $stmt->bind_param('s', $salida);
            $stmt->execute();

            $result = $this->connection->query('CALL SP_deleteComplejosImagenes( @pIdComplejo, @pUrl , @vResultado);');

            // getting the value of the OUT parameter
            $r = $this->connection->query('SELECT @vResultado as res');
            $row = $r->fetch_assoc();               
            $res = $row['res'] ;

            if($res > -1){
                unlink($archivo);
                $this->connection->commit(); 
                $dat= array($res);
                sendResult($dat, 'OK' );

        }else{
           sendError("Error, no se pudo eliminar la imagen." . $res ); //por algun motivo pincha aca
        }

        } catch (Exception $e) {
            $this->connection->rollback();
            sendError("Error de transaccion");
        }
    }
    
    public function agregarComplejoImagen($complejoimg){
        
        $this->connection->autocommit(false);
        
        try {
            
            $idComplejo = $this->connection->real_escape_string($complejoimg['idComplejo']);
            $url = $this->connection->real_escape_string($complejoimg['url']);
            $salida='';

            //echo '','ID COmplejo: ' . $idComplejo . ' url: ' . $url, "\n";
            
            // Parametros
            $stmt = $this->connection->prepare('SET @idComplejo := ?');
            $stmt->bind_param('i', $idComplejo);
            $stmt->execute();

            $stmt = $this->connection->prepare('SET @url := ?');
            $stmt->bind_param('s', $url);
            $stmt->execute();

            //Salida
            $stmt = $this->connection->prepare('SET @salida := ?');
            $stmt->bind_param('s', $salida);
            $stmt->execute();

            $result = $this->connection->query('CALL SP_insertComplejosImagenes(@idComplejo, @url , @salida);');

            $r = $this->connection->query('SELECT @salida as res');
            $row = $r->fetch_assoc();               
            $res = $row['res'] ;

            if($res > -1){
                $this->connection->commit();
                $dat= array($res);
                sendResult($dat, 'OK' );

            }else{
               sendError("Error, no se pudo agregar la imagen." . $res );
            }
    
    } catch (Exception $e) {
            $this->connection->rollback();
            //echo 'Something fails: ',  $e->getMessage(), "\n";
        }
    }
    
    public function getImagenesByComplejo($IdComplejo){  

        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $IdComplejo);
        $stmt->execute(); 
        
        //echo '', 'Id Complejo: ' . $IdComplejo, "\n";

        $query = "CALL SP_getComplejosImagenes(@pIdComplejo);";
        $imagenes= array();

        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $imagenes[] = $fila;
                //echo '', 'Fila: ' . $fila, "\n";
            }
            $result->free();
        }
        return $imagenes; 
    }
    
    
/************************LISTA NEGRA************************************/
    
    public function getUsuariosListaNegra($idComplejo){
        
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $idComplejo);
        $stmt->execute(); 

        $query = "CALL SP_getListaNegraByComplejo(@pIdComplejo);";
        $usuarios = array();

        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $usuarios[] = $fila;
            }
            $result->free();
        }
        return $usuarios; 
    }
    
    public function deleteClienteListaNegra($idComplejo, $idCliente){
        
        $valor='';
       
        // Parametros
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $idComplejo);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pIdCliente := ?');
        $stmt->bind_param('i', $idCliente);
        $stmt->execute();
        
        //Salida
        $stmt = $this->connection->prepare('SET @pValor := ?');
        $stmt->bind_param('i', $valor);
        $stmt->execute();
        
        //echo 'Something fails: ', 'borro de lista complejo: ' . $idComplejo . ' Cancha: ' . $idCliente, "\n";
        
        $result = $this->connection->query('CALL SP_deleteClienteListaNegra(@pIdComplejo, @pIdCliente, @pValor);');
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @pValor as valorRetorno');
        $row = $r->fetch_assoc();               
        $res = $row['valorRetorno'] ;
        
        if($res > -1){
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo borrar la reserva temp." . $res );
        }
    }
    
//**********************************************************************************************************************************//
    
    public function getUsuarioDuenio($idPersona, $usuario){

        $existe = 0;

        $stmt = $this->connection->prepare('SET @pIdPersona := ?');
        $stmt->bind_param('i', $idPersona);
        $stmt->execute(); 

        $stmt = $this->connection->prepare('SET @pUsuario := ?');
        $stmt->bind_param('s', $usuario);
        $stmt->execute();

        //Salida
        $stmt = $this->connection->prepare('SET @existe := ?');
        $stmt->bind_param('i', $existe);
        $stmt->execute();

        $query = "CALL SP_existeUsuarioDuenio(@pIdPersona, @pUsuario, @existe);";
        
        $usuario= array();

        if( $result = $this->connection->query($query) ){
            $r = $this->connection->query('SELECT @existe as existe');
            $usuario[] = $r->fetch_assoc();               
        }
        
        return $usuario;
    }
    
    
    //Se usa en el buscador de complejos del cliente.
    public function getComplejos($pNombreComplejo, $pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pPrecioMax, $pTechada, $pConLuz, $pConEstac, $pConDuchas, $pConBuffet, $pConParrilla, $pConWifi, $pFecha, $pHora, $pDiaSemana){
        
        $stmt = $this->connection->prepare('SET @pNombreComplejo := ?');
        $stmt->bind_param('s', $pNombreComplejo);
        $stmt->execute(); 

        $stmt = $this->connection->prepare('SET @pIdProv := ?');
        $stmt->bind_param('i', $pIdProv);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @pIdLoc := ?');
        $stmt->bind_param('i', $pIdLoc);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pCantJug := ?');
        $stmt->bind_param('i', $pCantJug);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pIdSuperficie := ?');
        $stmt->bind_param('i', $pIdSuperficie);
        $stmt->execute();
    
        $stmt = $this->connection->prepare('SET @pPrecioMax := ?');
        $stmt->bind_param('d', $pPrecioMax);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pTechada := ?');
        $stmt->bind_param('i', $pTechada);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConLuz := ?');
        $stmt->bind_param('i', $pConLuz);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConEstac := ?');
        $stmt->bind_param('i', $pConEstac);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConDuchas := ?');
        $stmt->bind_param('i', $pConDuchas);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConBuffet := ?');
        $stmt->bind_param('i', $pConBuffet);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConParrilla := ?');
        $stmt->bind_param('i', $pConParrilla);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pConWifi := ?');
        $stmt->bind_param('i', $pConWifi);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pFecha := ?');
        $stmt->bind_param('s', $pFecha);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pHora := ?');
        $stmt->bind_param('s', $pHora);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @pDiaSemana := ?');
        $stmt->bind_param('i', $pDiaSemana);
        $stmt->execute();

        $query = "CALL SP_getComplejos(@pNombreComplejo, @pIdProv, @pIdLoc, @pCantJug, @pIdSuperficie, @pPrecioMax, @pTechada, @pConLuz, @pConEstac, @pConDuchas, @pConBuffet, @pConParrilla, @pConWifi, @pFecha, @pHora, @pDiaSemana);";
        
        $complejos = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $complejos[] = $fila;
            }
              
            $result->free();
        }
        return $complejos;
    }
    
    
     public function getComplejosTOP(){
        
        $query = "CALL SP_getComplejosTOP();";
        $complejos = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $complejos[] = $fila;
            }
            $result->free();
        }
        return $complejos;
        
    }
    
    
      //Get de complejo especifico, en verComplejo.
    public function getDatosComplejo($IdComplejo){  

        $stmt = $this->connection->prepare('SET @IdComplejo := ?');
        $stmt->bind_param('i', $IdComplejo);
        $stmt->execute(); 
               
        $query = "CALL SP_getComplejo(@IdComplejo);";
        $complejos = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $complejos[] = $fila;
            }
            $result->free();
        }
        return $complejos;
    }
    
}

