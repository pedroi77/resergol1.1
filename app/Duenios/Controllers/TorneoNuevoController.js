var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoNuevoController", function($state, TipoTorneosService, DueniosSuperficiesService, DueniosJugadoresService){

    var self = this;
    this.tiposTorneos =[];
    this.superficies =[];
    
    this.tiposTorneos = {
        tipos: [],
        selectedOption: {IdTipoTorneo: '1', Nombre: ''} 
    };    
    
    this.superficies = {
        tipos: [],
        selectedOption: {IdSuperficie: '1', Descripcion: ''} 
    };    
    
    this.cantJugadores = {
        tipos: [],
        selectedOption: {CantJugadores: '1'} 
    };   
    
    this.mostrarCalendario2 = function(control){
        $('#PEPE').datepicker("show");
        //control.datepicker("show");
        //control.datetimepicker();
    };   

    
    
    this.init = function(){
        //LEER sacar el 2 HARCODE
        TipoTorneosService.query({idTorneo:-1}).$promise.then(function(data) {
            self.tiposTorneos.tipos = data;
            self.tiposTorneos.selectedOption = self.tiposTorneos.tipos[0];
        }); 
    
        DueniosSuperficiesService.query({idDuenio:2}).$promise.then(function(data) {
            self.superficies.tipos = data;
            self.superficies.selectedOption = self.superficies.tipos[0];
        }); 
        
        DueniosJugadoresService.query({idDuenio:2}).$promise.then(function(data) {
            self.cantJugadores.tipos = data;
            self.cantJugadores.selectedOption = self.cantJugadores.tipos[0];
        }); 
        
    };
    
    self.init();
});