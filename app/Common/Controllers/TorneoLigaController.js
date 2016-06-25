
var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoLigaController", function($scope, $stateParams, $state, TorneoService, TorneoImgDBService,TorneoLigaTablaService){

    var self = this;
    this.torneo;
    this.tabla = [];
    this.imagenes;
    this.myInterval =5000;
    this.noWrapSlides = false;
    this.active = 0;
    this.idTorneo = $stateParams.idTorneo;
        
  
    
    this.init = function(){
        TorneoService.query({idTorneo:self.idTorneo }).$promise.then(function(data) {
            self.torneo = data[0];
        }); 
        
        TorneoImgDBService.query({idTorneo:self.idTorneo }).$promise.then(function(data) {
            self.imagenes = data;
            
            if (self.imagenes.length > 0){
                var contador = 0;
                //Esto lo hago para agregar un id a cada imagen
                angular.forEach(data, function(aux) {
                    self.imagenes[contador]["id"]=contador;
                    aux.contador = contador;
                    contador++;
                });	
            }else{
                self.imagenes = [];
                self.imagenes.push({ "imagen": "http://localhost:8080/resergol1.1/api/Imagenes/torneos/default.jpg", "id":0});
            };
            
        TorneoLigaTablaService.query({idTorneo:self.idTorneo }).$promise.then(function(data) {
            self.tabla = data;
            
            if (self.tabla.length > 0){
                var contador = 0;
                //Esto lo hago para agregar las posiciones
                angular.forEach(data, function(aux) {
                    self.tabla[contador]["pos"]=contador+1;
                    aux.contador = contador;
                    contador++;
                });
            }
            
        }); 
            
        }); 
    }
    
    self.init();
});