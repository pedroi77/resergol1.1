<?php

ini_set('display_errors', 'On');
error_reporting(E_ALL | E_STRICT);
require_once("modelos/tiposDocs.php");
require_once("util/jsonResponse.php");
require 'Slim/Slim/Slim.php';

Slim\Slim::registerAutoloader();

$app = new Slim\Slim();

$app->get('/tiposDocs', function(){
	$tiposDocs = new tiposDocs();
	$data = $tiposDocs->getAll();
	sendResult($data);
});


$app->run();