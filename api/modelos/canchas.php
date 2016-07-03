<?php
require_once("connection.php");

class Cancha
{
   
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
    
    //Se usa en el buscador de canchas del cliente.
    public function getCanchas($pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pPrecioMax, $pTechada, $pConLuz, $pConEstac, $pConDuchas, $pConBuffet, $pConParrilla, $pConWifi, $pFecha, $pHora, $pDiaSemana){
        
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
        
        
        $query = "CALL SP_getCanchas(@pIdProv, @pIdLoc, @pCantJug, @pIdSuperficie, @pPrecioMax, @pTechada, @pConLuz, @pConEstac, @pConDuchas, @pConBuffet, @pConParrilla, @pConWifi, @pFecha, @pHora, @pDiaSemana);";
        
        
        $canchas = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $canchas[] = $fila;
            }
              
            $result->free();
        }
        return $canchas;
    }
    
    

     //canchas de un duenio
    public function getCanchasByDuenio($IdDuenio){  

        $stmt = $this->connection->prepare('SET @IdDuenio := ?');
        $stmt->bind_param('i', $IdDuenio);
        $stmt->execute(); 
        
        
              
        $query = "CALL SP_getCanchasByDuenio(@IdDuenio);";
        $canchas= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $canchas[] = $fila;
            }
            $result->free();
        }
        return $canchas;
    }
    
     //Get de cancha específica.
    public function getCancha($IdCancha, $IdComplejo){  

        $stmt = $this->connection->prepare('SET @IdCancha := ?');
        $stmt->bind_param('i', $IdCancha);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @IdComplejo := ?');
        $stmt->bind_param('i', $IdComplejo);
        $stmt->execute(); 
               
        $query = "CALL SP_getCancha(@IdCancha, @IdComplejo);";
        $canchas = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $canchas[] = $fila;
            }
            $result->free();
        }
        return $canchas;
    }
   
    public function getCanchasTOP(){
        
        $query = "CALL SP_getCanchasTOP();";
        $canchas = array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $canchas[] = $fila;
            }
            $result->free();
        }
        return $canchas;
        
    }
    
    public function setCancha($cancha)
    {
        
        $this->connection->autocommit(false);
        
        try{
            //Parametros de Entrada
            $idComplejo = $this->connection->real_escape_string($cancha['IdComplejo']);
            $nombreCancha = $this->connection->real_escape_string($cancha['nombre']);
            $cantJugadores = $this->connection->real_escape_string($cancha['CantJugadores']);
            $idSuperficie = $this->connection->real_escape_string($cancha['IdSuperficie']);
            $techada = $this->connection->real_escape_string($cancha['Techada']);
            $luz = $this->connection->real_escape_string($cancha['Luz']);
            $precio = $this->connection->real_escape_string($cancha['Precio']);
            $idEstado = $this->connection->real_escape_string($cancha['IdEstado']);
            //Parametro de Salida
            $idCancha = $this->connection->real_escape_string($cancha['IdCancha']);
            
            // Parametros
            $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
            $stmt->bind_param('i', $idComplejo);
            $stmt->execute();
            $stmt = $this->connection->prepare('SET @pNombre := ?');
            $stmt->bind_param('s', $nombreCancha);
            $stmt->execute();
            $stmt = $this->connection->prepare('SET @pCantJugadores := ?');
            $stmt->bind_param('i', $cantJugadores);
            $stmt->execute();
            $stmt = $this->connection->prepare('SET @pIdSuperficie := ?');
            $stmt->bind_param('i', $idSuperficie);
            $stmt->execute();
            $stmt = $this->connection->prepare('SET @pTechada := ?');
            $stmt->bind_param('i', $techada);
            $stmt->execute();
            $stmt = $this->connection->prepare('SET @pLuz := ?');
            $stmt->bind_param('i', $luz);
            $stmt->execute();
            $stmt = $this->connection->prepare('SET @pPrecio := ?');
            $stmt->bind_param('d', $precio);
            $stmt->execute();
            $stmt = $this->connection->prepare('SET @pIdEstado := ?');
            $stmt->bind_param('i', $idEstado);
            $stmt->execute();
            $stmt = $this->connection->prepare('SET @pIdCancha := ?');
            $stmt->bind_param('i', $idCancha);
            $stmt->execute();
            
            //echo 'entro al create cancha', 'pIdComplejo ' . $idComplejo . ' pNombre ' . $nombreCancha . ' pCantJugadores ' . $cantJugadores . ' pIdSuperficie ' . $idSuperficie . ' $techada ' . $techada . ' $luz ' . $luz . ' $precio ' . $precio . ' $idEstado ' . $idEstado . ' $idCancha ' . $idCancha, '\n';
            
            $resultCan = $this->connection->query('CALL SP_insertCanchas( @pIdComplejo, @pNombre, @pCantJugadores, @pIdSuperficie, @pTechada, @pLuz, @pPrecio, @pIdEstado, @pIdCancha);');
            
            $can = $this->connection->query('SELECT @pIdCancha as cancha');
            $row = $can->fetch_assoc();        
            $cancha = $row['cancha'];
            
            $this->connection->commit();
            $dat= array($cancha);
            //sendResult($dat, 'OK' );
            return $dat;
        }
        catch (Exception $e){
            $this->connection->rollback();
        }
    }
    
    public function getCanchasByComplejo($IdComplejo, $aux){  
        //
        $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
        $stmt->bind_param('i', $IdComplejo);
        $stmt->execute(); 

        $query = "CALL SP_getCanchasByComplejo(@pIdComplejo);";
        $canchas= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $canchas[] = $fila;
            }
            $result->free();
        }
        return $canchas;
    }
    
    //-.-.-.-.-.-.-.-.-.-.-.-.-.-PARTES DE IMAGENES-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//
    public function agregarCanchaImagen($canchaImg){
        
        $this->connection->autocommit(false);
        
        try {
            
            $idComplejo = $this->connection->real_escape_string($canchaImg['idComplejo']);
            $idCancha = $this->connection->real_escape_string($canchaImg['idCancha']);
            $url = $this->connection->real_escape_string($canchaImg['url']);
            $salida='';

            echo '','ID COmplejo: ' . $idComplejo . ' url: ' . $url . ' idCancha: ' . $idCancha, "\n";
            
            // Parametros
            $stmt = $this->connection->prepare('SET @pIdComplejo := ?');
            $stmt->bind_param('i', $idComplejo);
            $stmt->execute();
            
            $stmt = $this->connection->prepare('SET @pIdCancha := ?');
            $stmt->bind_param('i', $idCancha);
            $stmt->execute();

            $stmt = $this->connection->prepare('SET @pUrl := ?');
            $stmt->bind_param('s', $url);
            $stmt->execute();

            //Salida
            $stmt = $this->connection->prepare('SET @vResultado := ?');
            $stmt->bind_param('s', $salida);
            $stmt->execute();

            $result = $this->connection->query('CALL SP_insertCanchasImagenes(@pIdComplejo, @pIdCancha, @pUrl, @vResultado);');

            $r = $this->connection->query('SELECT @vResultado as res');
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
        
    
}