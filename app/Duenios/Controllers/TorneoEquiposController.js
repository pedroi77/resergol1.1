var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoEquiposController", function($scope, $stateParams, $state, TorneoEquiposServices){

    var self = this;
    this.equipos =[];
    
    this.idTorneo = $stateParams.idTorneo;
    this.nombre = $stateParams.nombre;
    this.cantEquipos = $stateParams.cantEquipos;
    this.insc = $stateParams.inscriptos;
 
    this.init = function(){
        TorneoEquiposServices.query({idTorneo:self.idTorneo }).$promise.then(function(data) {
            self.equipos = data;
            console.log(self.equipos);
        }); 
    }
    
    self.init();
   
});