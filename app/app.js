var resergolApp = angular.module("resergolApp", 
[
"resergolApp.Clientes",
"resergolApp.Duenios",
"resergolApp.Admin",
"resergolApp.Common",
"ui.router",
"ngResource",
"ngGrid",
"angular-jwt", 
//  "jwtInterceptorProvider",
"angular-storage",
"ngTable",
"ngAnimate",
"ui.bootstrap",
"ngFileUpload",
"uiGmapgoogle-maps"
]);


resergolApp.config(function( $stateProvider, $urlRouterProvider,  $httpProvider, jwtInterceptorProvider, uiGmapGoogleMapApiProvider ){
    
    uiGmapGoogleMapApiProvider.configure({
            china: true
        });
    
    $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
    
    //en cada petición enviamos el token a través de los headers con el nombre Authorization jwtInterceptorProvider
    jwtInterceptorProvider.tokenGetter = function() {
        return localStorage.getItem('token');
    };
    $httpProvider.interceptors.push('jwtInterceptor');
 
 
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
resergolApp.run(function($rootScope) {
    $rootScope.$on('unauthenticated', function(response){
        $('#loginModal').modal('show');
    });
});


