<?php

ini_set('display_errors', 'On');
error_reporting(E_ALL | E_STRICT);
require_once("php-jwt-master/src/JWT.php");
//require_once("util/JWT.php");
require_once("modelos/common.php");
require_once("modelos/duenios.php");
require_once("modelos/clientes.php");
require_once("util/jsonResponse.php");
require 'Slim/Slim/Slim.php';
//require 'JWT.php';

Slim\Slim::registerAutoloader();
 


$app = new Slim\Slim();


//Documentos
$app->get('/tiposDocs', function(){
    $tiposDocs = new Common();
    $data = $tiposDocs->getAllDocumentos();
	sendResult($data);
});

//Provincias
$app->get('/provincias', function(){
    $provincias = new Common();
    $data = $provincias->getAllProvincias();
	sendResult($data);
});

//Localidades
$app->get('/localidades/:id', function($id){
    $localidades = new Common();
    $data = $localidades->getAllLocalidadesByProvincia($id);
	sendResult($data);
});



//Duenios
$app->post('/duenios', function(){
    $request = Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
	
	$duenio = new Duenio();
    $result = $duenio->create($data);
	
	if($result){
		sendResult($result);
	}else{
		sendError("Error al crear el producto");
	}
});


//existe usuario
$app->get('/usuario/:user', function($user){
    $usuario = new Common();
    $data = $usuario->existeUsuario($user);
	sendResult($data);
});

//existe documento
$app->get('/clientes/:tipoDoc&:nroDoc&:tipoUsu', function($tipoDocumento,$nroDocumento,$tipoUsuario){
    $usuario = new Common();
    $result = $usuario->existeDocumento($tipoDocumento,$nroDocumento,$tipoUsuario);
    
    sendResult($result);
});


//Clientes
$app->get('/clientes/:user&:pass', function($usuario,$contrasenia){
    //asi funciona
    //http://localhost:8080/resergol1.1/api/clientes/HOMERO&1111
    $cliente = new Cliente();
    $result = $cliente->getCliente($usuario,$contrasenia);
    
    if(count($result)>0){
        //Creo el token
        $key = 'mi-secret-key';
        $token = array(
                "id" => "1",
                "name" => "unodepiera",
                "iat" => 1356999524,
                "nbf" => 1357000000
                );
    
        $jwt = \Firebase\JWT\JWT::encode($token, $key);
        
        array_push($result, "token:" . $jwt);
        //$result[] = $jwt;    
        sendResult($result);
        
        
    }else{
        $result[] = "-1";
        sendResult($result);
    }
});


$app->run();