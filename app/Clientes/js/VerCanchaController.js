/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("VerCanchaController", function($scope, $state, $stateParams, ProvinciasService, LocalidadesService, CanchasService, TiposSuperficiesService){
	
    var self = this;
    $scope.cancha = [];
    $scope.idCancha = $stateParams.id;
    
    
    
    this.getCancha = function(){
        
			CanchasService.query({idCancha:$scope.idCancha}).$promise.then(function(data){
                    $scope.cancha = data;
                //TENGO QUE, VER SI PUEDE ANDAR LA URL CON UN SOLO PARAMETRO, PORQ PEDRO USA OTRO CON UN PARAMETRO TMB,
                //O SI NO CREAR SERVICE NUEVO.
                
                //TENGO QUE HACER QUE DATA NO DEVUEVA UN ARRAY!!!!!!.
            });	
	};
    
    
    self.getCancha();
    
    
    
    
    
    
    
    
    
    
    
    
    this.mostrarReservar = function(){
             $state.go('Clientes.verCancha.Reservar');  
    };

 
	
[]});
