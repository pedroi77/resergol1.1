<?php

ini_set('display_errors', 'On');
error_reporting(E_ALL | E_STRICT);
require_once("modelos/tiposDocs.php");
require_once("modelos/duenios.php");
require_once("util/jsonResponse.php");
require 'Slim/Slim/Slim.php';

Slim\Slim::registerAutoloader();

$app = new Slim\Slim();


//Documentos
$app->get('/tiposDocs', function(){
	$tiposDocs = new tiposDocs();
	$data = $tiposDocs->getAll();
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



$app->run();