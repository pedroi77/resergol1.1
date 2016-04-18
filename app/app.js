var resergolApp = angular.module("resergolApp", 
[
"resergolApp.Clientes",
"resergolApp.Duenios",
"resergolApp.Admin",
"resergolApp.Common",
"ui.router",
"ngResource",
"angular-jwt",
"angular-storage"    
]);


resergolApp.config(function($stateProvider,$httpProvider, $urlRouterProvider){
    
   $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
    
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
	  

    $urlRouterProvider.otherwise("/admin");
	$urlRouterProvider.otherwise("/duenios");
    $urlRouterProvider.otherwise("/clientes/Canchas");
    //$urlRouterProvider.otherwise("/duenios/Reservas");
    
});


