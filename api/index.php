<?php

ini_set('display_errors', 'On');
error_reporting(E_ALL | E_STRICT);
require_once("php-jwt-master/src/JWT.php");
require_once("modelos/common.php");
require_once("modelos/duenios.php");
require_once("modelos/clientes.php");
require_once("modelos/administradores.php");
require_once("modelos/torneos.php");
require_once("modelos/canchas.php");
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
    //mail('matiasfumacoo@gmail.com', 'se mando el mail', 'cuerpo del mail', 'algo opcional');
    
    /*$headers = "MIME-Version: 1.0\r\n"; 
    $headers .= "Content-type: text/html; charset=iso-8859-1\r\n"; 
    //dirección del remitente 
    $headers .= "From: root@localhost \r\n";
    /*$bool = mail('ivanjfernandez@outlook.com', 'se mando el mail', 'cuerpo del mail',$headers);
    if($bool){
        echo "Mensaje enviado pepe";
    }else{
        echo "Mensaje no enviado";
    }*/
	sendResult($data);
});

//Localidades
$app->get('/localidades/:id', function($id){
    $localidades = new Common();
    $data = $localidades->getAllLocalidadesByProvincia($id);
	sendResult($data);
});

//Superficies
$app->get('/tiposSuperficies', function(){
    $superficies = new Common();
    $data = $superficies->getAllTiposSuperficies();
	sendResult($data);
});

//Dias
$app->get('/dias', function(){
    $dias = new Common();
    $data = $dias->getDias();
	sendResult($data);
});

/*************************************************DUENIOS*************************************************/
//Alta
$app->post('/duenios', function(){
    $request = Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
	
	$duenio = new Duenio();
    $result = $duenio->create($data);
	
	if($result){
		sendResult($result);
	}else{
		sendError("Error al dar de alta el dueño");
	}
});

//Get
$app->get('/duenios/:user/:pass', function($usuario,$contrasenia){
    //http://localhost:8080/resergol1.1/api/clientes/HOMERO&1111
    $duenio = new Duenio();
    $result = $duenio->getDuenio($usuario,$contrasenia);
    
    if(count($result)>0){
        //Creo el token
        $key = 'resergol77';
        $token = array(
                "user" => $result[0]['Usuario'],
                "pass" => $result[0]['Contrasenia'],
                "iat" => 1356999524,
                "nbf" => 1357000000
                );
    
        $jwt = \Firebase\JWT\JWT::encode($token, $key);
    
        $miToken['token'] = $jwt;
        
        //$aux =  \Firebase\JWT\JWT::decode($jwt, 'resergol77');  //borrar
        
        //array_push($result,$miToken);
        array_push($result,$jwt);

        sendResult($result);
        //sendResult($aux);//borrar
        
    }else{
        $result[] = "-1";
        sendResult($result);
    }
});


/*************************************************ADMINISTRADORES*************************************************/

//Get
$app->get('/admin/:user/:pass', function($usuario,$contrasenia){
    $admin = new Administrador();
    $result = $admin->getAdministrador($usuario,$contrasenia);
    
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
    
        $miToken['token'] = $jwt;
        array_push($result,$miToken);

        sendResult($result);
    }else{
        $result[] = "-1";
        sendResult($result);
    }
});


//Get de dueños pendientes.
$app->get('/dueniosPendientes', function(){
    $duePendientes = new Administrador();
    $data = $duePendientes->getDueniosPendientes();
	sendResult($data);
});

//Cambia de estado a los dueños pendientes.
/*
$app->put('/administrarDuenio/:IdDuenio/:acepta', function($IdDuenio, $acepta){
    $aceptarDuenio = new Administrador();
    $data = $aceptarDuenio->aceptarDuenio($IdDuenio, $acepta);
	sendResult($data);
});
*/
$app->put('/administrarDuenio', function(){
    $request = Slim\Slim::getInstance()->request();   
    $data = json_decode($request->getBody(), true);
    $aceptarDuenio = new Administrador();
    
    $result = $aceptarDuenio->aceptarDuenio($data);
        
	sendResult($result);
});

 

/*************************************************FIN ADMINISTRADORES*************************************************/

//existe usuario
$app->get('/usuario/:user', function($user){
    $usuario = new Common();
    $data = $usuario->existeUsuario($user);
	sendResult($data);
});

//Existe Email
$app->get('/email/:email', function($email){
    $usuario = new Common();
    $data = $usuario->existeEmail($email);
	sendResult($data);
});

//Existe Documento
$app->get('/tipoydoc/:tipoDoc/:nroDoc/:tipoUsu', function($tipoDocumento,$nroDocumento,$tipoUsuario){
    $usuario = new Common();
    $result = $usuario->existeDocumento($tipoDocumento,$nroDocumento,$tipoUsuario);
    
    sendResult($result);
});


//Clientes
$app->get('/clientes/:user/:pass', function($usuario,$contrasenia){
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
    
        $miToken['token'] = $jwt;
        array_push($result,$miToken);

        sendResult($result);
        
    }else{
        $result[] = "-1";
        sendResult($result);
    }
});


$app->post('/clientes', function(){
    $request = Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
	
	$cliente = new Cliente();
    $result = $cliente->create($data);
	
	if($result){
		sendResult($result);
	}else{
		sendError("Error al crear el cliente");
	}
});


/*****************************************TORNEOS****************************************************************************/
//alta
$app->post('/duenios/torneos', function(){
    
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $torneo = new Torneo();
        $result = $torneo->create($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError("Error al dar de alta el torneo");
        };
        
    }
	else{
        sendError("token invalido");
    }
    
});


//get tipo de torneo
//$app->get('/duenios/torneos/tipos/:idTorneo', function($idTorneo){
$app->get('/tiposTorneos/:idTorneo', function($idTorneo){
    //http://localhost:8080/resergol1.1/api/duenios/torneos/tipos/-1
    $tiposTorneos = new Torneo();
    $data = $tiposTorneos->getTipoTorneo($idTorneo);
	sendResult($data);
});


//get superficies del duenio
$app->get('/superficies/:idDuenio', function($idDuenio){
    $superficiesTorneos = new Torneo();
    $data = $superficiesTorneos->getSuperficiesByDuenio($idDuenio);
	sendResult($data);
});

//get cantidad de jugadores por duenio
$app->get('/jugadores/:idDuenio', function($idDuenio){
    $jugadores = new Torneo();
    $data = $jugadores->getCantJugByDuenio($idDuenio);
	sendResult($data);
});

//get cantidad de equipos por tipo

$app->get('/cantEquipos/:idTorneo', function($idtipo){
    $equipos = new Torneo();
    $data = $equipos->getCantJugByTipoTorneo($idtipo);
    sendResult($data);
});


//get dias y horarios por duenio
$app->get('/dias/:idDuenio', function($idDuenio){
    $dias = new Torneo();
    $data = $dias->getDiasByDuenio($idDuenio);
	sendResult($data);
});

/*****************************************CANCHAS****************************************************************************/

//Get canchas con filtros.
$app->get('/canchas/:pIdProv/:pIdLoc/:pCantJug/:pIdSuperficie/:pPrecioMax/:pTechada/:pConLuz/:pConEstac/:pConDuchas/:pConBuffet/:pConParrilla/:pConWifi/:pFecha/:pHora/:pDiaSemana', function($pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pPrecioMax, $pTechada, $pConLuz, $pConEstac, $pConDuchas, $pConBuffet, $pConParrilla, $pConWifi, $pFecha, $pHora, $pDiaSemana){
    $canchas = new Cancha();
    $data = $canchas->getCanchas($pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pPrecioMax, $pTechada, $pConLuz, $pConEstac, $pConDuchas, $pConBuffet, $pConParrilla, $pConWifi, $pFecha, $pHora, $pDiaSemana);
	sendResult($data);
});

//get cantidad de jugadores por duenio
$app->get('/duenio/canchas/:idDuenio', function($idDuenio){
    $canchas = new Cancha();
    $data = $canchas->getCanchasByDuenio($idDuenio);
	sendResult($data);
});

//Get cancha especifica por idComplejo.
$app->get('/canchas/:idCancha/:idComplejo', function($idCancha, $idComplejo){
    
    $canchas = new Cancha();
    $data = $canchas->getCancha($idCancha, $idComplejo);
	sendResult($data);
});


$app->run();