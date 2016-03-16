var resergolApp = angular.module("resergolApp", 
[
"resergolApp.Duenios",
"resergolApp.Clientes",
"resergolApp.Common",
"ui.router"
]);

/*
resergolApp.config(function($stateProvider, $urlRouterProvider){

	$stateProvider
		.state("Duenios", {
			url : "/duenios",
			templateUrl : "app/Duenios/Templates/DuenioPrincipal.html",
			controller : "DueniosController",
			controllerAs : "due"
		})
		.state("Clientes", { //Esta parte de cliente solo la pongo. ni me fije los ht
			url : "/clientes",
			templateUrl : "app/Clientes/BuscarCanchas.html",
			controller : "ClientesController",
			controllerAs : "CLI"
		});
	
	$urlRouterProvider.otherwise("/duenios");
    $urlRouterProvider.otherwise("/clientes");
	
});*/