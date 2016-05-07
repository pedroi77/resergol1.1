<?php
require_once("connection.php");

class Common
{
    private $connection;
    
    public function __construct(){
        $this->connection = Connection::getInstance();
    }
 
    //Documentos
    public function getAllDocumentos(){
        $query = "CALL SP_getTiposDoc();";
        $tiposDocs= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $tiposDocs[] = $fila;
            }
            $result->free();
        }
        return $tiposDocs;
    }
   
    //Provincias
    public function getAllProvincias(){
        $query = "CALL SP_getProvincias();";
        $provincias= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $provincias[] = $fila;
            }
            $result->free();
        }
        return $provincias;
    }
    
    //Localidades
     public function getAllLocalidadesByProvincia($IdProv){  
        $stmt = $this->connection->prepare('SET @idProv := ?');
        $stmt->bind_param('i', $IdProv);
        $stmt->execute(); 
         
              
        $query = "CALL SP_getLocalidadesByProvincia(@idProv);";
        $localidades= array();
        
        if( $result = $this->connection->query($query) ){
            while($fila = $result->fetch_assoc()){
                $localidades[] = $fila;
            }
            $result->free();
        }
        return $localidades;
    }
    
    //Existe Usuario
    public function existeUsuario($user){  
        //http://localhost:8080/resergol1.1/api/usuario/HOMERO
        $id='';
        $tipo='';
        
    
        $stmt = $this->connection->prepare('SET @usuario := ?');
        $stmt->bind_param('s', $user);
        $stmt->execute(); 
        
        
        $stmt = $this->connection->prepare('SET @id := ?');
        $stmt->bind_param('i', $id);
        $stmt->execute(); 
        
        
        $stmt = $this->connection->prepare('SET @tipo := ?');
        $stmt->bind_param('s', $tipo);
        $stmt->execute(); 
         
              
        $query = "CALL SP_existeUsuario(@usuario, @id, @tipo);";
    
        $usuario= array();
        
        if( $result = $this->connection->query($query) ){
            $r = $this->connection->query('SELECT @id as id, @tipo as tipo');
            $usuario[] = $r->fetch_assoc();               
        }
        return $usuario;
    }
    
    //Existe Documento
    public function existeDocumento($tipoDocumento,$nroDocumento,$tipoUsuario){
        $stmt = $this->connection->prepare('SET @pIdTipoDoc := ?');
        $stmt->bind_param('i', $tipoDocumento);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @pNroDoc := ?');
        $stmt->bind_param('i', $nroDocumento);
        $stmt->execute(); 
    
        $stmt = $this->connection->prepare('SET @pTipo := ?');
        $stmt->bind_param('s', $tipoUsuario);
        $stmt->execute(); 
        
         //Salida
        $stmt = $this->connection->prepare('SET @valor := ?');
        $stmt->bind_param('i', $valor);
        $stmt->execute();
        
        $query = "CALL SP_existeDocumento(@pIdTipoDoc, @pNroDoc, @pTipo, @valor);";
        
        //esto es para saber si las variables llegan con los datos correctos
        //$query = "select @pIdTipoDoc, @pNroDoc, @pTipo;";
        
        $cliente= array();
        
        if( $result = $this->connection->query($query) ){
            $r = $this->connection->query('SELECT @valor as duenio');
            //$r = $this->connection->query('SELECT @id as id, @tipo as tipo');
            $cliente[] = $r->fetch_assoc();               
        }
        
        return $cliente;
    }
    
    
    //Existe Email
    public function existeMail($email){  
        $resultado='';
        
        $stmt = $this->connection->prepare('SET @pEmail := ?');
        $stmt->bind_param('s', $email);
        $stmt->execute(); 
        
        $stmt = $this->connection->prepare('SET @resultado := ?');
        $stmt->bind_param('i', $resultado);
        $stmt->execute(); 
        
         
        $query = "CALL SP_existeEmail(@pEmail, @resultado);";
    
        $res = array();
        
        if( $result = $this->connection->query($query) ){
            $r = $this->connection->query('SELECT @resultado as resultado');
            $res[] = $r->fetch_assoc();               
        }
        
        return $res;
    }
    
    
}