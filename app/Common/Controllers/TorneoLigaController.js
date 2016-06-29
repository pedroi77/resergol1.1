
var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoLigaController", function($scope, $stateParams, $state, TorneoService, TorneoImgDBService,TorneoLigaTablaService, TorneoLigaFechasService,TorneoLigaFixtureService ){

    var self = this;
    this.torneo;
    this.tabla = [];
    this.fechas = [];
    this.fixture = [];
    this.imagenes;
    this.myInterval =5000;
    this.noWrapSlides = false;
    this.active = 0;
    this.idTorneo = $stateParams.idTorneo;
    this.editando = false;
        
  
    this.cargarFixture = function(idFecha){
        TorneoLigaFixtureService.query({idTorneo:self.idTorneo, idFecha:idFecha }).$promise.then(function(data) {
            self.fixture = data;
            var contador = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixture[contador]["gol1"]=parseInt(self.fixture[contador]["gol1"]) ;
                self.fixture[contador]["gol2"]=parseInt(self.fixture[contador]["gol2"]) ;
                contador++;
            });
        }); 
    }
    
    this.validaGol = function(indice){
           
        if( self.fixture[indice]['gol1']  == undefined){
            self.fixture[indice]['gol1'] = 0;
        }
        if(  self.fixture[indice]['gol2']  == undefined){
             self.fixture[indice]['gol2'] = 0;
        }
    }
    
    
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
        }); 
        
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
        
        TorneoLigaFechasService.query({idTorneo:self.idTorneo }).$promise.then(function(data) {
            self.fechas = data;
        }); 
        
       self.cargarFixture(1);
        
        
    }
    
    self.init();
});