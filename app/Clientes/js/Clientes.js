var resergolApp = angular.module("resergolApp.Clientes", ["ui.router"]);

resergolApp.config(function($stateProvider, $urlRouterProvider){
//resergolApp.config(function($stateProvider){

	$stateProvider
	
		.state("Clientes.buscarComplejos",{
			url : "/Complejo",
			templateUrl : "app/Clientes/Templates/BuscarComplejos.html",
			controllerAs : "cli"
		})
		.state("Clientes.buscarTorneos",{
			url : "/Torneos",
			templateUrl : "app/Clientes/Templates/BuscarTorneos.html",
			controllerAs : "cli"
		})
        .state("Clientes.verTorneoLiga",{
			url : "/Torneo/Liga/:idTorneo",
			templateUrl : "app/Common/Templates/VerTorneoLiga.html",
            params: {idTorneo:{value:'defaultValue'}},
            controller : "",	
            controllerAs : "due"
		})
        .state("Clientes.verTorneoCopa",{
			url : "/Torneo/Copa",
			templateUrl : "app/Common/Templates/VerTorneoCopa.html",
            params: {idTorneo:{value:'defaultValue'}},
            controller : "",	
            controllerAs : "due"
		}) 
        .state("Clientes.verTorneoLiga.inscripcionTorneoLiga",{
			url : "/Inscripcion",
			templateUrl : "app/Common/Templates/InscripcionTorneo.html",
            controller : "ClientesController",	
            controllerAs : "cli"
		})
        .state("Clientes.verTorneoCopa.inscripcionTorneoCopa",{
			url : "/Inscripcion",
			templateUrl : "app/Common/Templates/InscripcionTorneo.html",
            controller : "ClientesController",	
            controllerAs : "cli"
		}) 
        .state("Clientes.verComplejo",{
                url : "/VerComplejo/:idComp",
                params: {
                    idComp:{value:'defaultValue'}
                },
                templateUrl : "app/Clientes/Templates/VerComplejo.html",
                controllerAs : "cli"
            })
        .state("Clientes.verCancha",{
                url : "/VerCancha/:idCan/:idComp",
                params: {
                    idCan:{value:'defaultValue'},
                    idComp:{value:'defaultValue'}
                },
                templateUrl : "app/Clientes/Templates/VerCancha.html",
                controllerAs : "cli"
            })
    
        
        .state("Clientes.verCancha.Reservar",{
                            url : "/Reservar",
                            templateUrl : "app/Clientes/Templates/ReservarCancha.html",
                            controllerAs : "cli"
                        })
    
        .state("Clientes.verCancha.Reservar.ok",{
                            url : "/OK",
                            templateUrl : "app/Clientes/Templates/ReservarCancha.html",
                            controllerAs : "cli"
                        })
    
        .state("Clientes.misReservas",{
                url : "/misReservas/:idCli",
                params: {
                    idCli:{value:'defaultValue'}
                },
                templateUrl : "app/Clientes/Templates/MisReservas.html",
                controllerAs : "cli"
            })
        .state("Clientes.buscarCanchas",{
			url : "/Canchas",
			//templateUrl : "app/Clientes/Templates/BuscarCanchas.html",
            templateUrl : "app/Clientes/Templates/BuscarCanchas.html",
            controller : "",	
            controllerAs : ""
		})
        .state("Clientes.misTorneos",{
			url : "/MisTorneos/:idCli",
            params: {
                    idCli:{value:'defaultValue'}
                },
			templateUrl : "app/Clientes/Templates/MisTorneos.html",
            controller : "ClientesController",	
            controllerAs : "cli"
		})
        .state("Clientes.miCuenta",{
			url : "/MiCuenta",
			templateUrl : "app/Clientes/Templates/MiCuenta.html",
            controller : "ClientesController",	
            controllerAs : "cli"
		});
    
    
		$urlRouterProvider.otherwise("/clientes/misCanchas");
    
    
});


