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
    //Probando token - Inicio
    /*$key = 'mi-secret-key';
    $token = array(
            "id" => "1",
        "name" => "unodepiera",
        "iat" => 1356999524,
        "nbf" => 1357000000
    );
    
    $jwt = \Firebase\JWT\JWT::encode($token, $key);
    
    $decoded = \Firebase\JWT\JWT::decode($jwt,  'mi-secret-key');
    print_r($decoded);*/
    //Probando token - Fin
    
    
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

//Clientes
$app->get('/clientes/:usuario/:contrasenia', function(){
    $request = Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
    
    $cliente = new Cliente();
    $result = $cliente->getCliente($data);
	sendResult($result);
});


$app->run();