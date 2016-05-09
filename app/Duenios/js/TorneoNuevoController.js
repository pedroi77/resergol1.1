var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoNuevoController", function($state, TorneosService){

    var self = this;
    this.tiposTorneos =[];
    
     this.tiposTorneos = {
        tipos: [],
        selectedOption: {IdTipoTorneo: '1', Nombre: ''} 
    };    
    
    TorneosService.query({idTorneo:-1}).$promise.then(function(data) {
        self.tiposTorneos.tipos = data;
        self.tiposTorneos.selectedOption = self.tiposTorneos.tipos[0];
    });  
    
    
});