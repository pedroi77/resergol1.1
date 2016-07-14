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
require_once("modelos/complejos.php");
require_once("modelos/reservas.php");
require_once("modelos/tarjetasClientes.php");
require_once("modelos/listasNegras.php");
require_once("modelos/torneosLiga.php");
require_once("modelos/torneosCopas.php");
require_once("modelos/reservasFijas.php");
require_once("modelos/reservasTemp.php");
require_once("modelos/puntuaciones.php");
require_once("modelos/comentarios.php");
require_once("modelos/reservasCancelacion.php");
require_once("modelos/devoluciones.php");
require_once("modelos/equipos.php");
require_once("modelos/mails.php");
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

//update
$app->put('/duenios/torneos', function(){
    
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $torneo = new Torneo();
        $result = $torneo->update($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError("Error al actualizar el torneo");
        };
        
    }
	else{
        sendError("token invalido");
    }
    
});

//delete del torneo
$app->delete('/duenios/torneos/:idTorneo', function($idTorneo){
    
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $torneo = new Torneo();
        $result = $torneo->delete($idTorneo);
	
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

//arma fixture
$app->post('/duenios/torneos/fixture', function(){
    
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        
        $torneo = new Torneo();
        $result = $torneo->armarFixture($data);
	
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

//get torneos por dueño y estados
$app->get('/duenios/torneos/:idDuenio/:todos/:activos/:inscriptos/:finalizados', function($idDuenio, $Todos, $Activos, $Inscriptos, $Finalizados){
    
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $torneos = new Torneo();
        $data = $torneos->getTorneosByDuenio($idDuenio, $Todos, $Activos, $Inscriptos, $Finalizados);
        sendResult($data);
    }
	else{
        sendError("token invalido");
    }
});


//get torneos por idTorneo
$app->get('/common/torneo/:idTorneo', function($idTorneo){
    $torneo = new Torneo();
    $data = $torneo->getTorneosByIdTorneo($idTorneo);
    sendResult($data);
});

//get mails aviso cancelacion por idTorneo
$app->get('/duenios/torneos/mails/:idTorneo', function($idTorneo){
    
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $torneo = new Torneo();
        $data = $torneo->getMailsTorneo($idTorneo);
        sendResult($data);
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

//get tipos de torneo para 
$app->get('/tiposTorneos/', function($idTorneo){
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

//get dias y horarios por duenio para modificar
$app->get('/dias/:idDuenio/:idTorneo', function($idDuenio, $idTorneo){
    $dias = new Torneo();
    $data = $dias->getDiasByTorneo($idDuenio,$idTorneo);
	sendResult($data);
});

//get de imagenes por torneo
$app->get('/duenios/torneos/imagen/:idTorneo', function($idTorneo){
    $imagenes = new Torneo();
    $data = $imagenes->getImagenesByTorneo($idTorneo);
    sendResult($data);
});

//get de canchas del torneo
$app->get('/common/torneo/canchas/:idTorneo', function($idTorneo){
    $canchas = new Torneo();
    $data = $canchas->getCanchasByTorneo($idTorneo);
    sendResult($data);
});

//get de equipos por torneo
$app->get('/duenios/torneos/equipos/:idTorneo', function($idTorneo){
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $equipos = new Torneo();
        $data = $equipos->getEquiposByTorneo($idTorneo);
        sendResult($data);
    }
	else{
        sendError("token invalido");
    }
});

//get de posiciones de liga por torneo
$app->get('/common/torneo/liga/tabla/:idTorneo', function($idTorneo){
        $tabla = new TorneoLiga();
        $data = $tabla->getTablaDePosiciones($idTorneo);
        sendResult($data);
});


//get de posiciones de liga por torneo
$app->get('/common/torneo/liga/fechas/:idTorneo', function($idTorneo){
        $fechas = new TorneoLiga();
        $data = $fechas->getFechasBytorneo($idTorneo);
        sendResult($data);
});

//get de fixture por fechas
$app->get('/common/torneo/liga/fixture/:idTorneo/:idFecha', function($idTorneo, $idfecha){
    $fixture = new TorneoLiga();
    $data = $fixture->getFixtureByFecha($idTorneo, $idfecha);
	sendResult($data);
});

//get de fixture por fechas ida y vuelta
$app->get('/common/torneo/copa/fixture/idaVuelta/:idTorneo/:idFecha', function($idTorneo, $idfecha){
    $fixture = new TorneoCopa();
    $data = $fixture->getFixtureByFecha($idTorneo, $idfecha);
	sendResult($data);
});

$app->put('/common/torneo/liga/fixture', function(){
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $request = Slim\Slim::getInstance()->request();   
        $data = json_decode($request->getBody(), true);
        $fixture = new TorneoLiga();

        $result = $fixture->updateFixture($data);
        //el metodo envia el resultado
    }
	else{
        sendError("token invalido");
    }
});


$app->put('/common/torneo/copa/fixture', function(){
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $request = Slim\Slim::getInstance()->request();   
        $data = json_decode($request->getBody(), true);
        $fixture = new TorneoCopa();

        $result = $fixture->updateFixture($data);
        //el metodo envia el resultado
    }
	else{
        sendError("token invalido");
    }
});

//Ida y vuelta
$app->put('/common/torneo/copa/fixture/idaVuelta', function(){
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $request = Slim\Slim::getInstance()->request();   
        $data = json_decode($request->getBody(), true);
        $fixture = new TorneoCopa();

        $result = $fixture->updateFixtureIdayVuelta($data);
        //el metodo envia el resultado
    }
	else{
        sendError("token invalido");
    }
});


//alta imagenes
$app->post('/duenios/torneos/imagen', function(){
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $torneo = new Torneo();
        $result = $torneo->agregarTorneoImagen($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError("Error al guardar la imagen");
        };
    }
	else{
        sendError("token invalido");
    }
    
});

//delete de imagens
$app->delete('/duenios/torneos/imagen/:idTorneo/:url', function($idTorneo, $url){
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $torneo = new Torneo();
        $result = $torneo->deleteImagen($idTorneo, $url);
    }
	else{
        sendError("token invalido");
    }
});


//Get torneos con filtros.
$app->get('/torneosCli/:pNombre/:pTipo/:pCantEquipos/:pIdProv/:pIdLoc/:pCantJug/:pIdSuperficie/:pInscripcion/:pActivos/:pFinalizados/:pIdaYVuelta', function($pNombre, $pTipo, $pCantEquipos, $pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pInscripcion, $pActivos, $pFinalizados, $pIdaYVuelta){
    $torneos = new Torneo();
    $data = $torneos->getTorneos($pNombre, $pTipo, $pCantEquipos, $pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pInscripcion, $pActivos, $pFinalizados, $pIdaYVuelta);
	sendResult($data);

});

//Get torneos para pantalla MisTorneos del cliente.
$app->get('/torneosCli/:idCliente/:todos/:inscripcion/:activos/:finalizados', function($idCliente, $todos, $inscripcion, $activos, $finalizados){
    $torneos = new Torneo();
    $data = $torneos->getTorneosByCliente($idCliente, $todos, $inscripcion, $activos, $finalizados);
	sendResult($data);
});

/*****************************************CANCHAS****************************************************************************/

//Get canchas con filtros.
$app->get('/canchas/:pIdProv/:pIdLoc/:pCantJug/:pIdSuperficie/:pPrecioMax/:pTechada/:pConLuz/:pConEstac/:pConDuchas/:pConBuffet/:pConParrilla/:pConWifi/:pFecha/:pHora/:pDiaSemana', function($pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pPrecioMax, $pTechada, $pConLuz, $pConEstac, $pConDuchas, $pConBuffet, $pConParrilla, $pConWifi, $pFecha, $pHora, $pDiaSemana){
    $canchas = new Cancha();
    $data = $canchas->getCanchas($pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pPrecioMax, $pTechada, $pConLuz, $pConEstac, $pConDuchas, $pConBuffet, $pConParrilla, $pConWifi, $pFecha, $pHora, $pDiaSemana);
	sendResult($data);
});

//get ccanchas por duenio
$app->get('/duenio/canchas/:idDuenio', function($idDuenio){
    $canchas = new Cancha();
    $data = $canchas->getCanchasByDuenio($idDuenio);
	sendResult($data);
});

//get ccanchas por duenio y torneo
$app->get('/duenio/canchas/:idDuenio/:idTorneo', function($idDuenio, $idTorneo){
    $canchas = new Cancha();
    $data = $canchas->getCanchasByDuenioTorneo($idDuenio, $idTorneo);
	sendResult($data);
});

//Get cancha especifica por idComplejo.
$app->get('/canchas/:idCancha/:idComplejo', function($idCancha, $idComplejo){
    
    $canchas = new Cancha();
    $data = $canchas->getCancha($idCancha, $idComplejo);
	sendResult($data);
});

//Get TOP 3 canchas mejores votadas.
$app->get('/canchas', function(){
    $canchas = new Cancha();
    $data = $canchas->getCanchasTOP();
	sendResult($data);
});

/********ADMINISTRACION DE LAS CANCHAS(ALTA, BAJA MODIFICACION)************/

//alta
$app->post('/duenios/administrarCanchas', function(){
    
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);*/

    //poner todo lo comentado --> descomentado
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $cancha = new Cancha();
        $result = $cancha->setCancha($data);
	
        
        sendResult($result);
    /*if($result){
        }else{
            sendError($cancha);
        };
    /*if($tokenOK){
    }
	else{
        sendError("token invalido");
    }*/
    
});

//Trae todas las canchas del complejo seleccionado
$app->get('/duenios/administrarCanchas/:idComplejo/:aux', function($idComplejo, $aux){
    $canchas = new Cancha(); //  
    $data = $canchas->getCanchasByComplejo($idComplejo, $aux); //
	sendResult($data);
});

/********ADMINISTRACION IMAGENES DE LAS CANCHAS************/

//get de imagenes por cancha
$app->get('/duenios/canchas/imagen/:idComplejo/:idCancha', function($idComplejo, $idCancha){
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    echo '', '' , '\n';
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){*/
        $imagenes = new Cancha();
        $data = $imagenes->getImagenesCancha($idComplejo, $idCancha);
        sendResult($data);
    /*}
	else{
        sendError("token invalido");
    }*/
});

//alta imagenes
$app->post('/duenios/canchas/imagen', function(){
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){*/
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $cancha = new Cancha();
        $result = $cancha->agregarCanchaImagen($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError("Error al guardar la imagen");
        };
    /*}
	else{
        sendError("token invalido");
    }*/
});

//delete de imagens
$app->delete('/duenios/canchas/imagen/:idComplejo/:idCancha/:url', function($idComplejo, $idCancha, $url){
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){*/
        $cancha = new Cancha();
        $result = $cancha->deleteImagen($idComplejo, $idCancha, $url);
    /*}
	else{
        sendError("token invalido");
    }*/
});

/******************************COMPLEJOS****************************************************************/
//Get de dueños pendientes.
$app->get('/complejos/:idDuenio', function($idDuenio){
    $complejo = new Complejo();
    $data = $complejo->getComplejo($idDuenio);
	sendResult($data);
});

//alta
$app->post('/duenios/administrarComplejo', function(){
    
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $complejo = new Complejo();
        //$result = $complejo->createComplejo($data);
        $result = $complejo->createComplejo($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError($complejo); // + $data
        };
        
    }
	else{
        sendError("token invalido");
    }
    
});

//Get dias del complejo.
$app->get('/duenios/complejosDias/:idComplejo/:aux', function($idComplejo, $aux){
    $diasComplejo = new Complejo();
    $data = $diasComplejo->getDiasComplejo($idComplejo, $aux);
	sendResult($data);
});

//Verifica si el mail del dueño ya existe
$app->get('/duenios/emailDuenio/:email/:idDuenio', function($email, $idDuenio){
    $emailDuenio = new Common();
    $data = $emailDuenio->existeEmailPersona($email, $idDuenio);
	sendResult($data);
});

//Verifica si el mail del complejo ya existe
$app->get('/duenios/emailComplejo/:email/:idComplejo', function($email, $idComplejo){
    $emailComplejo = new Common();
    $data = $emailComplejo->existeEmailComplejo($email, $idComplejo);
	sendResult($data);
});

//get de imagenes por complejo
$app->get('/duenios/complejos/imagen/:idComplejo', function($idComplejo){
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);

    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){*/
        $imagenes = new Complejo();
        $data = $imagenes->getImagenesByComplejo($idComplejo);
        sendResult($data);
    /*}
	else{
        sendError("token invalido");
    }*/
});

//alta imagenes
$app->post('/duenios/complejos/imagen', function(){
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $complejo = new Complejo();
        $result = $complejo->agregarComplejoImagen($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError("Error al guardar la imagen");
        };
    }
	else{
        sendError("token invalido");
    } 
});

//delete de imagens
$app->delete('/duenios/complejo/imagen/:idComplejo/:url', function($idComplejo, $url){
    $headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){
        $complejo = new Complejo();
        $result = $complejo->deleteImagen($idComplejo, $url);
    }
	else{
        sendError("token invalido");
    }
});


//Get complejos con filtros.
$app->get('/complejos/:pNombreComplejo/:pIdProv/:pIdLoc/:pCantJug/:pIdSuperficie/:pPrecioMax/:pTechada/:pConLuz/:pConEstac/:pConDuchas/:pConBuffet/:pConParrilla/:pConWifi/:pFecha/:pHora/:pDiaSemana', function($pNombreComplejo, $pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pPrecioMax, $pTechada, $pConLuz, $pConEstac, $pConDuchas, $pConBuffet, $pConParrilla, $pConWifi, $pFecha, $pHora, $pDiaSemana){
    $complejos = new Complejo();
    $data = $complejos->getComplejos($pNombreComplejo, $pIdProv, $pIdLoc, $pCantJug, $pIdSuperficie, $pPrecioMax, $pTechada, $pConLuz, $pConEstac, $pConDuchas, $pConBuffet, $pConParrilla, $pConWifi, $pFecha, $pHora, $pDiaSemana);
	sendResult($data);
});


//Get TOP 3 complejos mejores votados.
$app->get('/complejos', function(){
    $complejos = new Complejo();
    $data = $complejos->getComplejosTOP();
	sendResult($data);
});


/******************************RESERVAS****************************************************************/

//Get horarios no disponibles para reservar por dia para una cancha.
$app->get('/clientes/reservas/:idCancha/:idComplejo/:fecha', function($idCancha, $idComplejo, $fecha){
    
    $reservas = new Reserva();
    $data = $reservas->getHorasDisponiblesByFecha($idCancha, $idComplejo, $fecha);
	sendResult($data);
});


//Get horarios de las reservas para una fecha especifica de una cancha.
$app->get('/clientes/reservas/:idComplejoo/:idCanchaa/:fechaHorarios/:bReservas', function($idCancha, $idComplejo, $fechaHorarios){
    
    $reservas = new Reserva();
    $data = $reservas->getHorariosReservasByDia($idCancha, $idComplejo, $fechaHorarios);
	sendResult($data);
});


//alta
$app->post('/clientes/reservas', function(){
    
    //$headers = apache_request_headers();
    //$token = explode(" ", $headers["Authorization"]);
    //$tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    //$reserva = new Reserva();
    //$tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    //if($tokenOK){
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $reserva = new Reserva();
        $result = $reserva->create($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError("Error al crear la reserva");
        };
        
    //}
	//else{
    //    sendError("token invalido");
    //}
    
});


//Get reservas para el cliente (Mis Reservas)
$app->get('/clientes/reservas/:idCliente/:todos/:pagosCompletos/:seniadas/:fijas', function($idCliente, $todos, $pagosCompletos, $seniadas, $fijas){
    $reservas = new Reserva();
    $data = $reservas->getReservasByCliente($idCliente, $todos, $pagosCompletos, $seniadas, $fijas);
	sendResult($data);
});

//alta
$app->post('/duenios/canchas/reservas', function(){ ///:idComplejo/:idCancha/:porcentajeAumento   $idComplejo, $idCancha, $porcentajeAumento
    
    //antes habia una validacion del token
    $request = Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php

    $reserva = new Reserva();
    $result = $reserva->updateReservasAumento($data);

    sendResult($result);
    
});

//Get reservas del dueño por dia (Mis Reservas)
/*$app->get('/duenios/reservas/:idComplejo/:fecha', function($idComplejo, $fecha){
    $reservas = new Reserva();
    $data = $reservas->getReservasByDuenioFecha($idComplejo, $fecha);
	sendResult($data);
});*/

//Get reservas del dueño por dia (Mis Reservas)
$app->get('/duenios/reservas/:idComplejo/:fecha/:idCancha', function($idComplejo, $fecha, $idCancha){
    $reservas = new Reserva();
    $data = $reservas->getReservasByDuenioFechaCancha($idComplejo, $fecha, $idCancha);
	sendResult($data);
});

/*******************************TARJETAS CLIENTES*****************************************************/

//alta
$app->post('/clientes/tarjetas', function(){
    
    //$headers = apache_request_headers();
    //$token = explode(" ", $headers["Authorization"]);
    //$tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    //$reserva = new Reserva();
    //$tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    //if($tokenOK){
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $tarjeta = new TarjetaCliente();
        $result = $tarjeta->create($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError("Error al insertar la tarjeta...");
        };
        
    //}
	//else{
    //    sendError("token invalido");
    //}
    
});


//Get tarjeta del cliente
$app->get('/clientes/tarjetas/:idCliente', function($idCliente){
    
    $tarjeta = new TarjetaCliente();
    $data = $tarjeta->getTarjetaCliente($idCliente);
	sendResult($data);
    
});

//Get tarjeta del cliente
$app->get('/clientes/tarjetas/:idCliente/:idAux', function($idCliente){
    
    $tarjeta = new TarjetaCliente();
    $data = $tarjeta->getTarjetaCliente($idCliente);
	sendResult($data);
    
});

//Get tarjeta del cliente
$app->get('/clientes/tarjetas/', function(){
    
    $tarjeta = new TarjetaCliente();
    $data = $tarjeta->getTarjetaCliente();
	sendResult($data);
    
});


//-**********************************LISTA NEGRA*************************************************************--//
//Get fecha de ingreso a la lista negra si es que el cliente está en la lista negra.
$app->get('/listaNegra/:idCliente/:idComplejo', function($idCliente, $idComplejo){
    
    $listaNegra = new ListaNegra();
    $data = $listaNegra->verificarClienteListaNegra($idCliente, $idComplejo);
	sendResult($data);
    
});


//-***********************************RESERVA FIJA**************************************************************--//
//Trae las fechas de las reservas fijas que quiere hacer un cliente de la fecha seleccionada hasta que termine el año.
//Tanto las disponibles como las que no, y estás las indica a traves del campo noDisponible.
$app->get('/clientes/reservasFijas/:pidCancha/:pIdComplejo/:pHoraDesde/:pIdDia/:pAnio/:pFechaPrimerReserva', function($pIdCancha, $pIdComplejo, $pHoraDesde, $pIdDia, $pAnio, $pFechaPrimerReserva){
    
    $fechasResFijas = new ReservaFija();
    $data = $fechasResFijas->getFechasReservaFija($pIdCancha, $pIdComplejo, $pHoraDesde, $pIdDia, $pAnio, $pFechaPrimerReserva);
	sendResult($data);
    
});


//alta
$app->post('/clientes/reservasFijas/', function(){
    
    //$headers = apache_request_headers();
    //$token = explode(" ", $headers["Authorization"]);
    //$tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    //$reserva = new Reserva();
    //$tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    //if($tokenOK){
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $reservaF = new ReservaFija();
        $result = $reservaF->create($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError("Error al crear la reserva fija");
        };
        
    //}
	//else{
    //    sendError("token invalido");
    //}
    
});

//-***********************************RESERVAS TEMPORALES**************************************************************--//
$app->get('/clientes/reservasTemp/:idCancha/:idComplejo', function($pIdCancha, $pIdComplejo){
    
    $resTemp = new ReservaTemp();
    $data = $resTemp->getReservaTemp($pIdCancha, $pIdComplejo);
	sendResult($data);
    
});


//alta
 $app->post('/clientes/reservasTemp', function(){
     
     //$headers = apache_request_headers();
     //$token = explode(" ", $headers["Authorization"]);
     //$tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
     
     //$reserva = new Reserva();
     //$tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);
 
     //if($tokenOK){
         $request = Slim\Slim::getInstance()->request();
         $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
         
         $resTemp = new ReservaTemp();
         $result = $resTemp->create($data);
  
         if($result){
            sendResult($result);
         }else{
             sendError("Error al insertar res Temp...");
         };
         
     //}
  //else{
     //    sendError("token invalido");
     //}
     
 });

//delete de reservasTemp
$app->delete('/clientes/reservasTemp/:idCancha/:idComplejo', function($idCancha, $idComplejo){
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);*/

    //if($tokenOK){
        $resTemp = new ReservaTemp();
        $result = $resTemp->delete($idCancha, $idComplejo);
    /*}
	else{
        sendError("token invalido");
    }*/
});


//-***********************************PUNTUACIONES CANCHA**************************************************************--//


//Get puntuacion de un cliente a una cancha
$app->get('/puntuacionesCancha/:idCancha/:idComplejo/:idCliente', function($pIdCancha, $pIdComplejo, $pIdCliente){
    
    $punt = new Puntuacion();
    $data = $punt->getPuntuacionCanchaCliente($pIdCancha, $pIdComplejo, $pIdCliente);
	sendResult($data);
    
});

//Get puntuacion de una cancha
$app->get('/puntuacionesCancha/:idCancha/:idComplejo', function($pIdCancha, $pIdComplejo){
    
    $punt = new Puntuacion();
    $data = $punt->getPuntuacionCancha($pIdCancha, $pIdComplejo);
	sendResult($data);
    
});

//Puntuar cancha
$app->post('/puntuacionesCancha', function(){
    
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $cliente = new Cliente();
    $tokenOK = $cliente->validarCliente($tokenDec->user, $tokenDec->pass);
    if($tokenOK){*/
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $punt = new Puntuacion();
        $result = $punt->puntuarCancha($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError("Error al insertar puntuacion cancha...");
        };
        
    /*}
	else{
        sendError("token invalido");
    }*/
    
});


//-***********************************COMENTARIOS CANCHA**************************************************************--//

//Get comentarios de una cancha
$app->get('/comentariosCancha/:idCancha/:idComplejo', function($pIdCancha, $pIdComplejo){
    
    $comment = new Comentario();
    $data = $comment->getComentariosCancha($pIdCancha, $pIdComplejo);
    sendResult($data);
    
});


//Comentar cancha
$app->post('/comentariosCancha', function(){
    
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $cliente = new Cliente();
    $tokenOK = $cliente->validarCliente($tokenDec->user, $tokenDec->pass);
    if($tokenOK){*/
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $comment = new Comentario();
        $result = $comment->comentarCancha($data);
    
        if($result){
           sendResult($result);
        }else{
            sendError("Error al insertar comentario cancha...");
        };
        
    /*}
    else{
        sendError("token invalido");
    }*/
    
});

/**************************RESERVAS CANCELACION**************************************************************/

$app->delete('/cancelacion/:idReserva', function($idReserva){
        $resCan = new ReservaCancelacion();
        $result = $resCan->deleteReserva($idReserva);
});

/**************************DEVOLUCIONES*********************************************************************/

$app->post('/devoluciones', function(){
    $request = Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php

    $dev = new Devolucion();
    $result = $dev->insertDevolucion($data);

    if($result){
       sendResult($result);
    }else{
        sendError("Error al insertar devolucion...");
    };
});


//-***********************************PUNTUACIONES COMPLEJO***********************************************************--//
//Get puntuacion de un cliente a un complejo
$app->get('/puntuacionesComplejo/:idComplejo/:idCliente', function($pIdComplejo, $pIdCliente){
    
    $punt = new Puntuacion();
    $data = $punt->getPuntuacionComplejoCliente($pIdComplejo, $pIdCliente);
	sendResult($data);
    
});
//Get puntuacion de un complejo
$app->get('/puntuacionesComplejo/:idComplejo', function($pIdComplejo){
    
    $punt = new Puntuacion();
    $data = $punt->getPuntuacionComplejo($pIdComplejo);
	sendResult($data);
    
});
//Puntuar complejo
$app->post('/puntuacionesComplejo', function(){
    
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $cliente = new Cliente();
    $tokenOK = $cliente->validarCliente($tokenDec->user, $tokenDec->pass);
    if($tokenOK){*/
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $punt = new Puntuacion();
        $result = $punt->puntuarComplejo($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError("Error al insertar puntuacion complejo...");
        };
        
    /*}
	else{
        sendError("token invalido");
    }*/
    
});


//-***********************************COMENTARIOS COMPLEJO***********************************************************--//
//Get comentarios de un complejo
$app->get('/comentariosComplejo/:idComplejo', function($pIdComplejo){
    
    $comment = new Comentario();
    $data = $comment->getComentariosComplejo($pIdComplejo);
    sendResult($data);
    
});
//Comentar complejo
$app->post('/comentariosComplejo', function(){
    
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $cliente = new Cliente();
    $tokenOK = $cliente->validarCliente($tokenDec->user, $tokenDec->pass);
    if($tokenOK){*/
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $comment = new Comentario();
        $result = $comment->comentarComplejo($data);
    
        if($result){
           sendResult($result);
        }else{
            sendError("Error al insertar comentario complejo...");
        };
        
    /*}
    else{
        sendError("token invalido");
    }*/
    
});


//Get de complejo.
$app->get('/complejo/:idComplejo', function($idComplejo){
    $complejo = new Complejo();
    $data = $complejo->getDatosComplejo($idComplejo);
    sendResult($data);
});

/**********************************EQUIPOS*************************************************************/
$app->post('/equiposCliente', function(){
    
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $cliente = new Cliente();
    $tokenOK = $cliente->validarCliente($tokenDec->user, $tokenDec->pass);
    if($tokenOK){*/
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $eq = new Equipo();
        $result = $eq->create($data);
    
        if($result){
           sendResult($result);
        }else{
            sendError("Error al insertar equipo...");
        };
        
    /*}
    else{
        sendError("token invalido");
    }*/
    
});


//alta imagenes equipos
$app->post('/clientes/equipos/imagen', function(){
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $duenio = new Duenio();
    $tokenOK = $duenio->validarDuenio($tokenDec->user, $tokenDec->pass);

    if($tokenOK){*/
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $eq = new Equipo();
        $result = $eq->agregarEquipoImagen($data);
	
        if($result){
           sendResult($result);
        }else{
            sendError("Error al guardar la imagen del equipo");
        };
    /*}
	else{
        sendError("token invalido");
    }*/
});

/**********************************INSCRIPCION EQUIPOS ATORNEOS*************************************************************/
$app->post('/equipoTorneo', function(){
    
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $cliente = new Cliente();
    $tokenOK = $cliente->validarCliente($tokenDec->user, $tokenDec->pass);
    if($tokenOK){*/
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $eq = new Equipo();
        $result = $eq->inscribirEquipoATorneo($data);
    
        if($result){
           sendResult($result);
        }else{
            sendError("Error al insertar equipo en torneo...");
        };
        
    /*}
    else{
        sendError("token invalido");
    }*/
    
});


$app->delete('/equipoTorneo/:idEquipo/:idTorneo', function($idEquipo, $idTorneo){
    
    /*$headers = apache_request_headers();
    $token = explode(" ", $headers["Authorization"]);
    $tokenDec = \Firebase\JWT\JWT::decode(trim($token[1],'"'), 'resergol77');
    
    $cliente = new Cliente();
    $tokenOK = $cliente->validarCliente($tokenDec->user, $tokenDec->pass);
    if($tokenOK){*/
        $request = Slim\Slim::getInstance()->request();
        $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
        
        $eq = new Equipo();
        $result = $eq->deleteEquipoTorneo($idEquipo, $idTorneo);
    
        if($result){
           sendResult($result);
        }else{
            sendError("Error al insertar equipo en torneo...");
        };
        
    /*}
    else{
        sendError("token invalido");
    }*/
    
});

///*********************MANDAR MAILS*******************************************************************************************/

//mandarMails
$app->post('/mandarMails', function(){
    $request = Slim\Slim::getInstance()->request();
    $data = json_decode($request->getBody(), true); //true convierte en array asoc, false en objeto php
	
	$mails = new Mails();
    /*$result = */$mails->mandarMail($data);
	
	/*if($result){
		sendResult($result);
	}else{
		sendError("Error al mandar mail");
	}*/
});

$app->run();
