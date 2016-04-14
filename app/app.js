var resergolApp = angular.module("resergolApp", 
[
"resergolApp.Duenios",
"resergolApp.Clientes",
"resergolApp.Common",
"resergolApp.Admin",
"ui.router",
"ngResource"
]);


resergolApp.config(function($stateProvider, $urlRouterProvider){

	$stateProvider
        .state("Duenios", {
			url : "/duenios",
			templateUrl : "app/Duenios/Templates/DuenioPrincipal.html",
			controller : "DueniosController",
			controllerAs : "due"
		})
		.state("Clientes", {
			url : "/clientes",
			templateUrl : "app/Clientes/Templates/ClientePrincipal.html",
			controller : "ClientesController",
			controllerAs : "CLI"
		})
        .state("Admin", {
			url : "/admin",
			templateUrl : "app/Admin/Templates/AdminPrincipal.html",
			controller : "AdminController",
			controllerAs : "admin"
		});
	  
        //Aca falta la parte de administradores
	$urlRouterProvider.otherwise("/duenios");
    $urlRouterProvider.otherwise("/clientes/Canchas");
    
	
});


