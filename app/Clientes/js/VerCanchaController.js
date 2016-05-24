/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("VerCanchaController", function($scope, $state, $stateParams, ProvinciasService, LocalidadesService, CanchasService, TiposSuperficiesService){
	
    var self = this;
    $scope.cancha = [];
    $scope.idCancha = $stateParams.idCan;
    $scope.idComplejo = $stateParams.idComp;
    
    
    
    this.getCancha = function(){
        
			CanchasService.query({idCancha:$scope.idCancha, idComplejo:$scope.idComplejo}).$promise.then(function(data){
                    $scope.cancha = data;
                //TENGO QUE HACER QUE DATA NO DEVUEVA UN ARRAY!!!!!!.
            });	
	};
    
    
    self.getCancha();
    
    
    
    
    
    
    
    
    
    
    
    
    this.mostrarReservar = function(){
             $state.go('Clientes.verCancha.Reservar');  
    };

 
	
[]});
