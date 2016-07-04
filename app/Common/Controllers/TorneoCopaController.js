
var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoCopaController", function($scope, $stateParams, $state, TorneoService, TorneoImgDBService, TorneoLigaFixtureService ){

    var self = this;
    this.torneo;
    this.tabla = [];
    this.fechas = [];
    this.fixtureFase1 = [];
    this.fixtureFase2 = [];
    this.fixtureFase3 = [];
    this.fixtureFase4 = [];
    this.fixtureFase5 = [];
    this.nombreFase1;
    this.nombreFase2;
    this.nombreFase3;
    this.nombreFase4;
    this.nombreFase5;
    this.imagenes;
    this.myInterval =5000;
    this.noWrapSlides = false;
    this.active = 0;
    this.idTorneo = $stateParams.idTorneo;
    this.editando = false;
    
    /*
     function saveFn(data, userData) {
                };

            $(function() {
              var container = $('div#save .demo')
              container.bracket({
                init: self.fixtureFase1,
                save: saveFn
                })
            })
    */
    
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
            self.cargarLlaves(parseInt(self.torneo["CantEquipos"]));
            
             
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

        
    }
    
    this.cargarLlaves= function(cantEquipos){
        
        var idFase1;
        var idFase2;
        var idFase3;
        var idFase4;
        var idFase5;
        
        switch (cantEquipos) {
            case 32:
                idFase1 = 1;
                idFase2 = 2;
                idFase3 = 3;
                idFase4 = 4;
                idFase5 = 5;
                self.nombreFase1 = '16avos';
                self.nombreFase2 = 'Octavos';
                self.nombreFase3 = 'Cuartos';
                self.nombreFase4 = 'Semis';
                self.nombreFase5 = 'Final';
                break;
            case 16:
                idFase1 = 2;
                idFase2 = 3;
                idFase3 = 4;
                idFase4 = 5;
                idFase5 = 0;
                self.nombreFase1 = 'Octavos';
                self.nombreFase2 = 'Cuartos';
                self.nombreFase3 = 'Semis';
                self.nombreFase4 = 'Final';
                self.nombreFase5 = '';
                break;
            case 8:
                idFase1 = 3;
                idFase2 = 4;
                idFase3 = 5;
                idFase4 = 0;
                idFase5 = 0;
                self.nombreFase1 = 'Cuartos';
                self.nombreFase2 = 'Semis';
                self.nombreFase3 = 'Final';
                self.nombreFase4 = '';
                self.nombreFase5 = '';
                break;
            case 4:
                idFase1 = 4;
                idFase2 = 5;
                idFase3 = 0;
                idFase4 = 0;
                idFase5 = 0;
                self.nombreFase1 = 'Semis';
                self.nombreFase2 = 'Final';
                self.nombreFase3 = '';
                self.nombreFase4 = '';
                self.nombreFase5 = '';
                break;
        };
        
       
        TorneoLigaFixtureService.query({idTorneo:self.idTorneo, idFecha:idFase1 }).$promise.then(function(data) {
            self.fixtureFase1 = data;
            
            var stilo1 = "";
            var contador1 = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixtureFase1[contador1]["gol1"]=parseInt(self.fixtureFase1[contador1]["gol1"]) ;
                self.fixtureFase1[contador1]["gol2"]=parseInt(self.fixtureFase1[contador1]["gol2"]) ;
                
                if((contador1 % 2 ) == 0){
                    stilo1="height: 65px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }else{
                    stilo1= "height: 0px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }
                self.fixtureFase1[contador1]["conectorStyle"]=stilo1;
                
                contador1++;
            });
        }); 

        TorneoLigaFixtureService.query({idTorneo:self.idTorneo, idFecha:idFase2 }).$promise.then(function(data) {
            self.fixtureFase2 = data;
            
            var stilo2 = "";
            var contador2 = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixtureFase2[contador2]["gol1"]=parseInt(self.fixtureFase2[contador2]["gol1"]) ;
                self.fixtureFase2[contador2]["gol2"]=parseInt(self.fixtureFase2[contador2]["gol2"]) ;
                
                 
                if(contador2 %2 == 0){
                    stilo2="height: 129px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }else{
                    stilo2= "height: 0px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }
                self.fixtureFase2[contador2]["conectorStyle"]=stilo2 ;
                
                
                contador2++;
            });
        }); 


        TorneoLigaFixtureService.query({idTorneo:self.idTorneo, idFecha:idFase3 }).$promise.then(function(data) {
            self.fixtureFase3 = data;
            
            var stilo3 = "";
            var contador3 = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixtureFase3[contador3]["gol1"]=parseInt(self.fixtureFase3[contador3]["gol1"]) ;
                self.fixtureFase3[contador3]["gol2"]=parseInt(self.fixtureFase3[contador3]["gol2"]) ;
                
                 if(contador3 %2 == 0){
                    stilo3="height: 256px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }else{
                    stilo3= "height: 0px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }
                self.fixtureFase3[contador3]["conectorStyle"]=stilo3 ;
                
                
                contador3++;
            });
        }); 

        TorneoLigaFixtureService.query({idTorneo:self.idTorneo, idFecha:idFase4 }).$promise.then(function(data) {
            self.fixtureFase4 = data;
            
            var stilo4 = "";
            var contador4 = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixtureFase4[contador4]["gol1"]=parseInt(self.fixtureFase4[contador4]["gol1"]) ;
                self.fixtureFase4[contador4]["gol2"]=parseInt(self.fixtureFase4[contador4]["gol2"]) ;
                
                 if(contador4 %2 == 0){
                    stilo4="height: 510px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }else{
                    stilo4= "height: 0px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }
                self.fixtureFase4[contador4]["conectorStyle"]=stilo4 ;
                
                contador4++;
            });
        }); 

    
        TorneoLigaFixtureService.query({idTorneo:self.idTorneo, idFecha:idFase5 }).$promise.then(function(data) {
            self.fixtureFase5 = data;
            
            
            var contador = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixtureFase5[contador]["gol1"]=parseInt(self.fixtureFase5[contador]["gol1"]) ;
                self.fixtureFase5[contador]["gol2"]=parseInt(self.fixtureFase5[contador]["gol2"]) ;
                contador++;
            });
        }); 

    };
    
    
    self.init();
});