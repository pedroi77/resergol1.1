<?php

ini_set('display_errors', 'On');
error_reporting(E_ALL | E_STRICT);
require_once("modelos/common.php");
require_once("modelos/duenios.php");
require_once("util/jsonResponse.php");
require 'Slim/Slim/Slim.php';

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



$app->run();