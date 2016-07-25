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
			controllerAs : "due",
            //data: "D"
		})
		.state("Clientes", {
			url : "/clientes",
			templateUrl : "app/Clientes/Templates/ClientePrincipal.html",
			controller : "ClientesController",
			controllerAs : "CLI",
            //data: "Todos"
		})
        .state("Admin", {
			url : "/admin",
			templateUrl : "app/Admin/Templates/AdminPrincipal.html",
			controller : "AdminController",
			controllerAs : "admin",
            //data: 'A'
		});
	  

    $urlRouterProvider.otherwise("/admin");
	$urlRouterProvider.otherwise("/duenios");
    $urlRouterProvider.otherwise("/clientes/Canchas");
    //$urlRouterProvider.otherwise("/duenios/Reservas");
    
});

resergolApp.run(function($rootScope, $uibModal, $q, $http, $state) {
    
    /*
    $rootScope.$on('unauthenticated', function(response){
        $('#loginModal').modal('show');
    });*/   
    
    // cuando empieza a cambiar de estado guardo a donde va
    $rootScope.$on('$stateChangeStart', function (e, to, params, options) { 
        $rootScope.goingTo = {
            state: to,
            params: params,
            options: options
        };
        
       /*
        console.log($rootScope.goingTo.state.data);
        
        if($rootScope.goingTo.state.data != 'Todos'){
           
            //console.log($rootScope.goingTo.state);
            console.log(sessionStorage.tipo);
            
            if($rootScope.goingTo.state.data  == sessionStorage.tipo ){
                console.log('ok');
            }else{
                console.log('mandar al index'); 
                //$state.go('Clientes.buscarCanchas');
                location.href = "http://localhost:8080/resergol1.1/index.html#/clientes/Canchas"; 
            }
        }else{
             console.log("Estado valido para todos");
        }
        */
    });
    
    // si se pudo cambiar de estado entonces borro el estado que estaba guardando
    $rootScope.$on('$stateChangeSuccess', function () {  
        
        
        if($rootScope.goingTo.state.data != 'Todos'){
           
            //console.log($rootScope.goingTo.state);   
        
            if(($rootScope.goingTo.state.rol == sessionStorage.tipo) || $rootScope.goingTo.state.rol == 'Todos'){
                //console.log('ok');
            }else{
                //console.log('mandar al index');
                location.hrbuibuibuief = "http://localhost:8080/resergol1.1/index.html#/clientes/Canchas"; 
            }
        }else{
             //console.log("Estado valido para todos");
        }
        
        $rootScope.flash = null;
        $rootScope.error = null;
        $rootScope.goingTo = null;
    });
    
    /*
     $rootScope.$on('unauthenticated', function (e, rejection) {
        
         console.log('pepe');
        var modalInstance = $uibModal.open({
            animation: true,
            templateUrl: '/Livestock/views/login.html',
            controller: 'LoginController'
        });
         
        var deferred = $q.defer();

        // a esta funcion le entra el resultado del login despues de que en el servicio se guarda el token en el localstorage
        modalInstance.result.then(function (user) {
            if (user != null) {
                // si habia un estado guardado voy a el
                if ($rootScope.goingTo != null) {
                    $state.go($rootScope.goingTo.state, $rootScope.goingTo.params, $rootScope.goingTo.options);
                }
                else {
                    // si no busco el request que tiro el 401 y lo hago de nuevo
                    var deferred = $q.defer();
                    deferred.resolve($http(rejection.config));
                }
            }
        }).catch(function () {
    
        
        });
    })
*/
});


