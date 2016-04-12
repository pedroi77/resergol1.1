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
        .state("Clientes.verComplejo",{
                url : "/VerComplejo",
                templateUrl : "app/Clientes/Templates/VerComplejo.html",
                controllerAs : "cli"
            })
        .state("Clientes.verCancha",{
                url : "/VerCancha",
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
            controller : "ClientesController",	
            controllerAs : "cli"
		});
    
    
		$urlRouterProvider.otherwise("/clientes/Canchas");
    
    
});


