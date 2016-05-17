<?php
require_once("connection.php");

class Torneo
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    
 
    public function create($torneo){
        $idDuenio = $this->connection->real_escape_string($torneo['idDuenio']);
        $idTipoTorneo = $this->connection->real_escape_string($torneo['idTipoTorneo']);
        $nombre = $this->connection->real_escape_string($torneo['nombre']);
        $cantEquipos = $this->connection->real_escape_string($torneo['cantEquipos']);
        $cantJugadores = $this->connection->real_escape_string($torneo['cantJugadores']);
        $idSuperficie = $this->connection->real_escape_string($torneo['idSuperficie']);
        $idaYvuelta = $this->connection->real_escape_string($torneo['idaYvuelta']);
        $precioInscripcion = $this->connection->real_escape_string($torneo['precioInscripcion']);
        $fecIniInscripcion = $this->connection->real_escape_string($torneo['fecIniInscripcion']);
        $fecFinInscripcion  = $this->connection->real_escape_string($torneo['fecFinInscripcion']);
        $horasCancelacion = $this->connection->real_escape_string($torneo['horasCancelacion']);
        $fechaInicio = $this->connection->real_escape_string($torneo['fechaInicio']);
        $fechaFin = $this->connection->real_escape_string($torneo['fechaFin']);
        $descripcion = $this->connection->real_escape_string($torneo['descripcion']);
        $reglas = $this->connection->real_escape_string($torneo['reglas']);
        $idEstado = $this->connection->real_escape_string($torneo['idEstado']);
        $canchas = $this->connection->real_escape_string($torneo['canchas']);
        $dias = $this->connection->real_escape_string($torneo['dias']);
        

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
        $result = $this->connection->query('CALL SP_insertTorneos( @idDuenio, @idTipoTorneo, @nombre, @cantEquipos, @cantJugadores,@idSuperficie, @idaYvuelta,                                                                                          @precioInscripcion, @fecIniInscripcion, @fecFinInscripcion,  @horasCancelacion, 
                                                                   @fechaInicio, @fechaFin, @descripcion,  @reglas, @idEstado, @salida);');
        
        //$result = $this->connection->query('select @idDuenio as duenio');
        //$row = $result->fetch_assoc();               
        
        // getting the value of the OUT parameter
        $r = $this->connection->query('SELECT @salida as idTorneo');
        $row = $r->fetch_assoc();               

        $res = $row['idTorneo'] ;
        
        /*
        if(2 > -1){
            $dat= array($row);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo registrar el torneo." . $res ); //por algun motivo pincha aca
        }
        */
        
        if($res > -1){
            
            /*Alta de canchas*/
            
            /*Alta de Dias*/
            
            $dat= array($res);
            sendResult($dat, 'OK' );
        }else{
           sendError("Error, no se pudo registrar el torneo." . $res ); //por algun motivo pincha aca
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
	"idDuenio": 1,
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
	"idEstado": 2,
	"canchas": [{
		"idTorneo": 0,
		"idComplejo": 1,
		"idCancha": 2
	}, {
		"idTorneo": 0,
		"idComplejo": 1,
		"idCancha": 2
	}],
	"dias": [{
			"idTorneo": 0,
			"idDia": 1,
			"horaDesde": 10,
			"horaHasta": 21
		}, {
			"idTorneo": 0,
			"idDia": 1,
			"horaDesde": 10,
			"horaHasta": 21
		}

	]
}

*/
