var resergolApp = angular.module("resergolApp");

resergolApp.controller("BuscarCanchasController", function(ProvinciasService, LocalidadesService){

var self = this;
this.tiposDoc = [];
this.provincias = [];
this.localidades = [];
//$scope.formData = {};

    
self.provincias = {
        prov: [],
        selectedOption:{IdProvincia: '-1', Nombre: '-Provincia-'} 
    }; 
     
self.localidades = {
    loc: [],
    selectedOption:{IdLocalidad: '-1', Nombre: '-Localidad-'} 
};
    
self.localidades.loc.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Localidad-'});
    
ProvinciasService.query().$promise.then(function(data) {
        self.provincias.prov = data;
        //self.tiposDoc.tipos.push({IdTipoDoc: '-3', Descripcion: 'Tipo doc.'});
        self.provincias.prov.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Provincia-'});
    });      
    
    
this.getLocalidades = function(){
        var idProv = self.provincias.selectedProv.IdProvincia;
        
        if(idProv != -1 && idProv != undefined){
            LocalidadesService.query({id:idProv}).$promise.then(function(data) {
                self.localidades.loc = data;
                var idSel =  self.localidades.loc[0].IdLocalidad;
                var nomSel = self.localidades.loc[0].Nombre;
                self.localidades.selectedOption = {IdLocalidad: idSel, Nombre:nomSel}; 
            });
        }
        else{
            self.localidades.loc = [];
            //self.localidades.loc.push({IdLocalidad: '-1', Nombre: 'Localidad'});  
            //self.localidades.selectedOption = {IdLocalidad: '-1', Nombre: 'Localidad'}; 
            self.localidades.loc.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Localidad-'});
            self.localidades.selectedOption = {IdLocalidad: '-1', Nombre:'-Localidad-'}; 
        };
        
    };    
    
    
   /* this.init = function(){
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
    
    self.init();*/
});