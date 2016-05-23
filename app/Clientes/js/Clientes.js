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
			url : "/Torneo/Liga",
			templateUrl : "app/Clientes/Templates/VerTorneoLiga.html",
            controller : "ClientesController",	
            controllerAs : "cli"
		})
        .state("Clientes.verTorneoCopa",{
			url : "/Torneo/Copa",
			templateUrl : "app/Clientes/Templates/VerTorneoCopa.html",
            controller : "ClientesController",	
            controllerAs : "cli"
		}) 
        .state("Clientes.verTorneoLiga.inscripcionTorneoLiga",{
			url : "/Inscripcion",
			templateUrl : "app/Clientes/Templates/InscripcionTorneo.html",
            controller : "ClientesController",	
            controllerAs : "cli"
		})
        .state("Clientes.verTorneoCopa.inscripcionTorneoCopa",{
			url : "/Inscripcion",
			templateUrl : "app/Clientes/Templates/InscripcionTorneo.html",
            controller : "ClientesController",	
            controllerAs : "cli"
		}) 
        .state("Clientes.verComplejo",{
                url : "/VerComplejo",
                templateUrl : "app/Clientes/Templates/VerComplejo.html",
                controllerAs : "cli"
            })
        .state("Clientes.verCancha",{
                url : "/VerCancha/:id",
                params: {
                    id:{value:'defaultValue'}
                },
                templateUrl : "app/Clientes/Templates/VerCancha.html",
                controllerAs : "cli"
            })
    
        
        .state("Clientes.verCancha.Reservar",{
                            url : "/Reservar",
                            templateUrl : "app/Clientes/Templates/ReservarCancha.html",
                            controllerAs : "cli"
                        })
    
        .state("Clientes.misReservas",{
                url : "/misReservas",
                templateUrl : "app/Clientes/Templates/MisReservas.html",
                controllerAs : "cli"
            })
        .state("Clientes.buscarCanchas",{
			url : "/Canchas",
			templateUrl : "app/Clientes/Templates/BuscarCanchas.html",
            controller : "",	
            controllerAs : ""
		})
        .state("Clientes.misTorneos",{
			url : "/MisTorneos",
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
    
    
		$urlRouterProvider.otherwise("/clientes/Canchas");
    
    
});


