var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoBuscarControler", function($scope, $state, DuenioTorneoService){

    var self = this;
    this.Torneos =[];
        
    
    this.Torneos = {
        tipos: []
    };    
    
    this.init = function(){
       
      
        DuenioTorneoService.query({idDuenio:1, todos:1, activos:0, inscriptos:0, finalizados:0}).$promise.then(function(data) {
            self.Torneos.tipos = data;
            console.log(data);
        }); 
    }
    
    self.init();
});