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
    
    
    
}