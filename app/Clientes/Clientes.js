var resergolApp = angular.module("resergolApp.Clientes", ["ui.router"]);

resergolApp.config(function($stateProvider, $urlRouterProvider){
//resergolApp.config(function($stateProvider){

	$stateProvider
		.state("Clientes.buscarCanchas",{
			url : "/Canchas",
			templateUrl : "app/Clientes/Templates/BuscarCanchas.html",
			controllerAs : "cli"
		})
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
		
		$urlRouterProvider.otherwise("/clientes");
    
});


