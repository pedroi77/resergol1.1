<?php
require_once("connection.php");

class Torneo
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    
 

    public function create($torneo){
        $this->connection->autocommit(false);
        
        try {
        $idDuenio = $this->connection->real_escape_string($torneo['idDuenio']);
        $idTipoTorneo = $this->connection->real_escape_string($torneo['idTipoTorneo']);
        $nombre = $this->connection->real_escape_string($torneo['nombre']);
        $cantEquipos = $this->connection->real_escape_string($torneo['cantEquipos']);
        $cantJugadores = $this->connection->real_escape_string($torneo['cantJugadores']);
        $idSuperficie = $this->connection->real_escape_string($torneo['idSuperficie']);
        $idaYvuelta = $this->connection->real_escape_string($torneo['idaYvuelta']);
        $tiempoPartido = $this->connection->real_escape_string($torneo['tiempoPartido']);
        $precioInscripcion = $this->connection->real_escape_string($torneo['precioInscripcion']);
        $fecIniInscripcion = $this->connection->real_escape_string($torneo['fecIniInscripcion']);
        $fecFinInscripcion  = $this->connection->real_escape_string($torneo['fecFinInscripcion']);
        $horasCancelacion = $this->connection->real_escape_string($torneo['horasCancelacion']);
        $fechaInicio = $this->connection->real_escape_string($torneo['fechaInicio']);
        $fechaFin = $this->connection->real_escape_string($torneo['fechaFin']);
        $descripcion = $this->connection->real_escape_string($torneo['descripcion']);
        $reglas = $this->connection->real_escape_string($torneo['reglas']);
        $idEstado = $this->connection->real_escape_string($torneo['idEstado']);
        $canchas= array();
        $dias= array();
        $canchas=$torneo['canchas'];
        $dias =$torneo['dias'];
        
        $salida='';
      
       
        // Parametros
        $stmt = $this->connection->prepare('SET @idDuenio := ?');
        $stmt->bind_param('i', $idDuenio);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @idTipoTorneo := ?');
        $stmt->bind_param('i', $idTipoTorneo);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @nombre := ?');
        $stmt->bind_param('s', $nombre);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @cantEquipos := ?');
        $stmt->bind_param('i', $cantEquipos);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @cantJugadores := ?');
        $stmt->bind_param('i', $cantJugadores);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @idSuperficie := ?');
        $stmt->bind_param('i', $idSuperficie);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @idaYvuelta := ?');
        $stmt->bind_param('i', $idaYvuelta);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @tiempoPartido := ?');
        $stmt->bind_param('i', $tiempoPartido);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @precioInscripcion := ?');
        $stmt->bind_param('d', $precioInscripcion);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @fecIniInscripcion := ?');
        $stmt->bind_param('s', $fecIniInscripcion);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @fecFinInscripcion := ?');
        $stmt->bind_param('s', $fecFinInscripcion);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @horasCancelacion := ?');
        $stmt->bind_param('i',  $horasCancelacion);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @fechaInicio := ?');
        $stmt->bind_param('s',  $fechaInicio);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @fechaFin := ?');
        $stmt->bind_param('s', $fechaFin);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @descripcion := ?');
        $stmt->bind_param('s', $descripcion);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @reglas := ?');
        $stmt->bind_param('s', $reglas);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @idEstado := ?');
        $stmt->bind_param('i', $idEstado);
        $stmt->execute();
        
        //Salida
        $stmt = $this->connection->prepare('SET @salida := ?');
        $stmt->bind_param('s', $salida);
        $stmt->execute();
        
        
         // execute the stored Procedure         SP_insertDuenios
        
        $result = $this->connection->query('CALL SP_insertTorneos( @idDuenio, @idTipoTorneo, @nombre, @cantEquipos, @cantJugadores,@idSuperficie, @idaYvuelta,                                                                             @tiempoPartido, @precioInscripcion, @fecIniInscripcion, @fecFinInscripcion,  @horasCancelacion, 
                                                                   @fechaInicio, @fechaFin, @descripcion,  @reglas, @idEstado, @salida);');
        
        //$result = $this->connection->query('select @idDuenio as duenio');
        //$row = $result->fetch_assoc();               
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @salida as idTorneo');
        $row = $r->fetch_assoc();               
        $res = $row['idTorneo'] ;
        
        
  
        if($res > -1){
            
            /*Alta de canchas*/
            foreach ($canchas as $can) {
                $idComplejo = $this->connection->real_escape_string($can['idComplejo']);
                $idCancha = $this->connection->real_escape_string($can['idCancha']);
                
                $stmt = $this->connection->prepare('SET @idTorneo := ?');
                $stmt->bind_param('i', $res);
                $stmt->execute();
                $stmt = $this->connection->prepare('SET @idComplejo := ?');
                $stmt->bind_param('i', $idComplejo);
                $stmt->execute();
                
                $stmt = $this->connection->prepare('SET @idCancha := ?');
                $stmt->bind_param('i', $idCancha);
                $stmt->execute();
                
                //Salida
                $stmt = $this->connection->prepare('SET @outCancha := ?');
                $stmt->bind_param('s', $salida);
                $stmt->execute();
                
                $resultCan = $this->connection->query('CALL SP_insertTorneosCanchas( @idTorneo, @idComplejo, @idCancha, @outCancha);');
        
                       
        
                // getting the value of the OUT parameter
                $rcan = $this->connection->query('SELECT @outCancha as res');
                $row = $rcan->fetch_assoc();               
                $resCan = $row['res'] ;
            }
                
            /*Alta de Dias*/
            foreach ($dias as $dia) {
                $idDia = $this->connection->real_escape_string($dia['idDia']);
                $HoraDesde = $this->connection->real_escape_string($dia['horaDesde']);
                $HoraHasta = $this->connection->real_escape_string($dia['horaHasta']);
                
                $stmt = $this->connection->prepare('SET @idTorneo := ?');
                $stmt->bind_param('i', $res);
                $stmt->execute();
                $stmt = $this->connection->prepare('SET @idDia := ?');
                $stmt->bind_param('i', $idDia);
                $stmt->execute();
                
                $stmt = $this->connection->prepare('SET @horaDesde := ?');
                $stmt->bind_param('s', $HoraDesde);
                $stmt->execute();
                
                
                $stmt = $this->connection->prepare('SET @horaHasta := ?');
                $stmt->bind_param('s', $HoraHasta);
                $stmt->execute();
                
                 //Salida
                $stmt = $this->connection->prepare('SET @outDia := ?');
                $stmt->bind_param('s', $salida);
                $stmt->execute();
                
                $resultDia = $this->connection->query('CALL SP_insertTorneosDias( @idTorneo, @idDia, @horaDesde, @horaHasta, @outDia);');
        
                       
        
                //getting the value of the OUT parameter
                $rcan = $this->connection->query('SELECT @outDia as res');
                $row = $rcan->fetch_assoc();               
                $resCan = $row['res'] ;
            }    
    
                
            $this->connection->commit();
            //$this->connection->rollback();
            
            $dat= array($res);
            sendResult($dat, 'OK' );
            
        }else{
           sendError("Error, no se pudo registrar el torneo." . $res ); //por algun motivo pincha aca
        }
        
    } catch (Exception $e) {
            $this->connection->rollback();
            echo 'Something fails: ',  $e->getMessage(), "\n";
        }
    }
    
    
    public function agregarTorneoImagen($torneoimg){
        $this->connection->autocommit(false);
        
        try {
        $idTorneo = $this->connection->real_escape_string($torneoimg['idTorneo']);
        $url = $this->connection->real_escape_string($torneoimg['url']);
        $salida='';
      
       
        // Parametros
        $stmt = $this->connection->prepare('SET @idTorneo := ?');
        $stmt->bind_param('i', $idTorneo);
        $stmt->execute();
        $stmt = $this->connection->prepare('SET @url := ?');
        $stmt->bind_param('s', $url);
        $stmt->execute();
        
        //Salida
        $stmt = $this->connection->prepare('SET @salida := ?');
        $stmt->bind_param('s', $salida);
        $stmt->execute();
        
        
         // execute the stored Procedure         SP_insertDuenios
        
        $result = $this->connection->query('CALL SP_insertTorneosImagenes( @idTorneo, @url , @salida);');
        
            
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @salida as res');
        $row = $r->fetch_assoc();               
        $res = $row['res'] ;
        
        
  
        if($res > -1){
            $this->connection->commit();
            $dat= array($res);
            sendResult($dat, 'OK' );
            
        }else{
           sendError("Error, no se pudo registrar el torneo." . $res ); //por algun motivo pincha aca
        }
        
    } catch (Exception $e) {
            $this->connection->rollback();
            echo 'Something fails: ',  $e->getMessage(), "\n";
        }
    }
    
    public function getTipoTorneo($IdTipoTorneo){  
        if($IdTipoTorneo == -1){
            $IdTipoTorneo = null;
        };
            
        $stmt = $this->connection->prepare('SET @IdTipoTorneo := ?');
        $stmt->bind_param('i', $IdTipoTorneo);
        $stmt->execute(); 
        
        
              
        $query = "CALL SP_getTipoTorneos(@IdTipoTorneo);";
        $tipoTorneos= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $tipoTorneos[] = $fila;
            }
            $result->free();
        }
        return $tipoTorneos;
    }
    
    public function getSuperficiesByDuenio($IdDuenio){  

        $stmt = $this->connection->prepare('SET @IdDuenio := ?');
        $stmt->bind_param('i', $IdDuenio);
        $stmt->execute(); 
        
        
              
        $query = "CALL SP_getSuperficiesByIdDuenio(@IdDuenio);";
        $superficies= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $superficies[] = $fila;
            }
            $result->free();
        }
        return $superficies;
    }
    
    public function getCantJugByDuenio($IdDuenio){  

        $stmt = $this->connection->prepare('SET @IdDuenio := ?');
        $stmt->bind_param('i', $IdDuenio);
        $stmt->execute(); 
        
        
              
        $query = "CALL SP_getCantJugByDuenio(@IdDuenio);";
        $jugadores= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $jugadores[] = $fila;
            }
            $result->free();
        }
        return $jugadores;
    }
    
    public function getCantJugByTipoTorneo($TipoTorneo){  

        $stmt = $this->connection->prepare('SET @Idtipo := ?');
        $stmt->bind_param('i', $TipoTorneo);
        $stmt->execute(); 
        
        
              
        $query = "CALL SP_getCantEquiposByTipoTorneo(@Idtipo);";
        $cant= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $cant[] = $fila;
            }
            $result->free();
        }
        return $cant;
    }
    
    public function getDiasByDuenio($IdDuenio){  

        $stmt = $this->connection->prepare('SET @IdDuenio := ?');
        $stmt->bind_param('i', $IdDuenio);
        $stmt->execute(); 
        
        
              
        $query = "CALL SP_getDiasByDuenio(@IdDuenio);";
        $dias= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $dias[] = $fila;
            }
            $result->free();
        }
        return $dias;
    }
    
    public function getTorneosByDuenio($IdDuenio,$Todos,$Activos,$Incriptos,$Finalizados){  

        $stmt = $this->connection->prepare('SET @IdDuenio := ?');
        $stmt->bind_param('i', $IdDuenio);
        $stmt->execute();
        
        $stmt = $this->connection->prepare('SET @Todos := ?');
        $stmt->bind_param('i', $Todos);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @Activos := ?');
        $stmt->bind_param('i', $Activos);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @Inscriptos := ?');
        $stmt->bind_param('i', $Incriptos);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @Finalizados := ?');
        $stmt->bind_param('i', $Finalizados);
        $stmt->execute(); 
        
        
              
        $query = "CALL SP_getTorneosByDuenio(@IdDuenio,@Todos, @Activos, @Inscriptos, @Finalizados);";
        $torneos= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $torneos[] = $fila;
            }
            $result->free();
        }
        return $torneos;
    }
    
    public function getImagenesByTorneo($IdTorneo){  

        $stmt = $this->connection->prepare('SET @IdTorneo := ?');
        $stmt->bind_param('i', $IdTorneo);
        $stmt->execute(); 
        
        $query = "CALL SP_getTorneosImagenes(@IdTorneo);";
        $imagenes= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $imagenes[] = $fila;
            }
            $result->free();
        }
        return $imagenes;
    }
    
    public function deleteImagen($idTorneo, $url){  
        $this->connection->autocommit(false);

        try {
            
        
        $salida='';
        $archivo ="C:\\xampp\\htdocs\\resergol1.1\\api\\Imagenes\\torneos\\".$url;    

        // Parametros
        $stmt = $this->connection->prepare('SET @idTorneo := ?');
        $stmt->bind_param('i', $idTorneo);
        $stmt->execute();
            
        $stmt = $this->connection->prepare('SET @url := ?');
        $stmt->bind_param('s', $url);
        $stmt->execute();

        //Salida
        $stmt = $this->connection->prepare('SET @salida := ?');
        $stmt->bind_param('s', $salida);
        $stmt->execute();


         

        $result = $this->connection->query('CALL SP_deleteTorneosImagenes( @idTorneo, @url , @salida);');



        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @salida as res');
        $row = $r->fetch_assoc();               
        $res = $row['res'] ;


        
        if($res > -1){
            unlink($archivo);
            $this->connection->commit(); 
            $dat= array($res);
            sendResult($dat, 'OK' );

        }else{
           sendError("Error, no se pudo registrar el torneo." . $res ); //por algun motivo pincha aca
        }

        } catch (Exception $e) {
            $this->connection->rollback();
            sendError("Error de transaccion"); //por algun motivo pincha aca
        }

    }
    
     public function getEquiposByTorneo($IdTorneo){  

        $stmt = $this->connection->prepare('SET @IdTorneo := ?');
        $stmt->bind_param('i', $IdTorneo);
        $stmt->execute(); 
        
        $query = "CALL SP_getEquiposByIdTorneo(@IdTorneo);";
        $equipos= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $equipos[] = $fila;
            }
            $result->free();
        }
        return $equipos;
    }
    
}



/*Ejemplo para el POST
{
                        "idDuenio":1,
                        "idTipoTorneo": 1,
                        "nombre": "Sudamericana",
                        "cantEquipos": 8,
                        "cantJugadores": 11,
                        "idSuperficie": 1,
                        "idaYvuelta": 0,
                        "precioInscripcion": 500.00,
                        "fecIniInscripcion": "06/05/2016",
                        "fecFinInscripcion": "10/05/2016",
                        "horasCancelacion": 16,
                        "fechaInicio": "15/05/2016",
                        "fechaFin": "18/06/2016",
                        "descripcion": "el segundo torneo",
                        "reglas": "reglas Vale todo!",
                        "idEstado": 2
  	       }


//aca le agrego torneos y dias 
{
                        "idDuenio":1,
                        "idTipoTorneo": 1,
                        "nombre": "Sudamericana",
                        "cantEquipos": 8,
                        "cantJugadores": 11,
                        "idSuperficie": 1,
                        "idaYvuelta": 0,
                        "precioInscripcion": 500.00,
                        "fecIniInscripcion": "06/05/2016",
                        "fecFinInscripcion": "10/05/2016",
                        "horasCancelacion": 16,
                        "fechaInicio": "15/05/2016",
                        "fechaFin": "18/06/2016",
                        "descripcion": "el segundo torneo",
                        "reglas": "reglas Vale todo!",
                        "idEstado": 2,"canchas": [{
                                                "idComplejo": 1,
                                                "idCancha": 2
                                            }, {
                                                "idComplejo": 1,
                                                "idCancha": 4
                                            }],
                                            "dias": [{
                                                    "idDia": 1,
                                                    "horaDesde": "10:00:00",
                                                    "horaHasta": "21:00:00"
                                                }, {
                                                    "idDia": 2,
                                                    "horaDesde": "10:00:00",
                                                    "horaHasta": "22:00:00"
                                                }

                                            ]
  	       }


*/
