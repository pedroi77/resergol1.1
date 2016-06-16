
var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoLigaController", function($scope, $stateParams, $state, TorneoService){

    var self = this;
    this.torneo;
  
    this.idTorneo = $stateParams.idTorneo;
        
  
    
    this.init = function(){
        TorneoService.query({idTorneo:self.idTorneo }).$promise.then(function(data) {
            self.torneo = data[0];
        }); 
    }
    
    self.init();
});