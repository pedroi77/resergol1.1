
var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoCopaController", function($scope, $stateParams, $state, TorneoService, TorneoImgDBService, TorneoLigaFixtureService,TorneoCopaFixtureService, TorneoCopaIyVFixtureService, TorneoCanchasService ){

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
    this.msjIdaVuelta= "";
    this.bIdayVuelta = true;
    this.canchas=[];
    this.bEdita = false;
    this.alturaCampeon;
    

    
    this.validaGol = function(indice){
           
        if( self.fixture[indice]['gol1']  == undefined){
            self.fixture[indice]['gol1'] = 0;
        }
        if(  self.fixture[indice]['gol2']  == undefined){
             self.fixture[indice]['gol2'] = 0;
        }
    }
    
    
    
    this.init = function(){
        
        self.tipoUsuario = sessionStorage.tipo;
        self.bEdita = (self.tipoUsuario == 'D');
        
     

       
        TorneoService.query({idTorneo:self.idTorneo }).$promise.then(function(data) {
            self.torneo = data[0];
            
            self.bIdayVuelta =  self.torneo['idaYvuelta']=='0' ? false:true;
            
            if(self.bIdayVuelta) {
                self.cargarLlavesIdayVuelta(parseInt(self.torneo["CantEquipos"]));
                self.msjIdaVuelta = "Ida  Vuelta"
            }else{
                self.cargarLlaves(parseInt(self.torneo["CantEquipos"]));
                self.msjIdaVuelta = "Ida"
            }
                
             
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

        /*cargar imagenes*/
        TorneoCanchasService.query({idTorneo:self.idTorneo }).$promise.then(function(data) {
            self.canchas = data;
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
                self.alturaCampeon = "margin-top: 508.0px;"
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
                self.alturaCampeon = "margin-top: 254.0px;"
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
                self.alturaCampeon = "margin-top: 227.0px;"
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
                self.alturaCampeon = "margin-top: 63.5px;"
                break;
        };
        
       console.log(self.alturaCampeon );
        
        TorneoLigaFixtureService.query({idTorneo:self.idTorneo, idFecha:idFase1 }).$promise.then(function(data) {
            self.fixtureFase1 = data;
            
            var stilo1 = "";
            var contador1 = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixtureFase1[contador1]["gol1"]=parseInt(self.fixtureFase1[contador1]["gol1"]) ;
                self.fixtureFase1[contador1]["gol2"]=parseInt(self.fixtureFase1[contador1]["gol2"]) ;
                self.fixtureFase1[contador1]["info"]= "Ida " +
                                                      self.fixtureFase1[contador1]["fecha"] + ", "+
                                                      self.fixtureFase1[contador1]["horaInicio"] + " Hs, cancha " +
                                                      self.fixtureFase1[contador1]["cancha"] + ".";
                
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
                self.fixtureFase2[contador2]["info"]= "Ida " +
                                                      self.fixtureFase2[contador2]["fecha"] + ", "+
                                                      self.fixtureFase2[contador2]["horaInicio"] + " Hs, cancha " +
                                                      self.fixtureFase2[contador2]["cancha"] + ".";

                
                 
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
                self.fixtureFase3[contador3]["info"]= "Ida " +
                                      self.fixtureFase3[contador3]["fecha"] + ", "+
                                      self.fixtureFase3[contador3]["horaInicio"] + " Hs, cancha " +
                                      self.fixtureFase3[contador3]["cancha"] + ".";
     
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
                self.fixtureFase4[contador4]["info"]= "Ida " +
                                      self.fixtureFase4[contador4]["fecha"] + ", "+
                                      self.fixtureFase4[contador4]["horaInicio"] + " Hs, cancha " +
                                      self.fixtureFase4[contador4]["cancha"] + ".";

                
                
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
                self.fixtureFase5[contador]["info"]= "Ida " +
                              self.fixtureFase5[contador]["fecha"] + ", "+
                              self.fixtureFase5[contador]["horaInicio"] + " Hs, cancha " +
                              self.fixtureFase5[contador]["cancha"] + ".";
               
                contador++;
            });
        }); 

    };
    
    this.updateFixtureFase1Ida = function(){   
        
        for(var indice = 0; indice < self.fixtureFase1.length ; indice++ ){ //esto falla
            
            if(self.fixtureFase1[indice]['gol1'] != self.fixtureFase1[indice]['gol2']){
                var fixture = new TorneoLigaFixtureService();

                fixture.data = {
                                "IdTorneo": self.fixtureFase1[indice]['IdTorneo'],
                                "IdFecha": self.fixtureFase1[indice]['IdFecha'],
                                "Idreserva": self.fixtureFase1[indice]['idreserva'],
                                "gol1": self.fixtureFase1[indice]['gol1'],
                                "gol2": self.fixtureFase1[indice]['gol2']
                               };   

                TorneoCopaFixtureService.update(fixture.data, function(reponse){

                  },function(errorResponse){
                        console.log("Error");
                 });
            }
        }

    };
    
    this.updateFixtureFase2Ida = function(){   
        
        for(var indice = 0; indice < self.fixtureFase2.length ; indice++ ){ //esto falla
            
            if(self.fixtureFase2[indice]['gol1'] != self.fixtureFase2[indice]['gol2']){
                var fixture = new TorneoLigaFixtureService();

                fixture.data = {
                                "IdTorneo": self.fixtureFase2[indice]['IdTorneo'],
                                "IdFecha": self.fixtureFase2[indice]['IdFecha'],
                                "Idreserva": self.fixtureFase2[indice]['idreserva'],
                                "gol1": self.fixtureFase2[indice]['gol1'],
                                "gol2": self.fixtureFase2[indice]['gol2']
                               };   

                TorneoCopaFixtureService.update(fixture.data, function(reponse){

                  },function(errorResponse){
                        console.log("Error");
                 });
            }
        }
        
    };
    
    this.updateFixtureFase3Ida = function(){   
        
        for(var indice = 0; indice < self.fixtureFase3.length ; indice++ ){ //esto falla
            
            if(self.fixtureFase3[indice]['gol1'] != self.fixtureFase3[indice]['gol2']){
                var fixture = new TorneoLigaFixtureService();

                fixture.data = {
                                "IdTorneo": self.fixtureFase3[indice]['IdTorneo'],
                                "IdFecha": self.fixtureFase3[indice]['IdFecha'],
                                "Idreserva": self.fixtureFase3[indice]['idreserva'],
                                "gol1": self.fixtureFase3[indice]['gol1'],
                                "gol2": self.fixtureFase3[indice]['gol2']
                               };   

                TorneoCopaFixtureService.update(fixture.data, function(reponse){

                  },function(errorResponse){
                        console.log("Error");
                 });
            }
        }
        
    };
    
    this.updateFixtureFase4Ida = function(){   
        
        for(var indice = 0; indice < self.fixtureFase4.length ; indice++ ){ //esto falla
            
            if(self.fixtureFase4[indice]['gol1'] != self.fixtureFase4[indice]['gol2']){
                var fixture = new TorneoLigaFixtureService();

                fixture.data = {
                                "IdTorneo": self.fixtureFase4[indice]['IdTorneo'],
                                "IdFecha": self.fixtureFase4[indice]['IdFecha'],
                                "Idreserva": self.fixtureFase4[indice]['idreserva'],
                                "gol1": self.fixtureFase4[indice]['gol1'],
                                "gol2": self.fixtureFase4[indice]['gol2']
                               };   

                TorneoCopaFixtureService.update(fixture.data, function(reponse){

                  },function(errorResponse){
                        console.log("Error");
                 });
            }
        }
        
    };
    
    this.updateFixtureFase5Ida = function(){   
        
        for(var indice = 0; indice < self.fixtureFase5.length ; indice++ ){ //esto falla
            
            if(self.fixtureFase5[indice]['gol1'] != self.fixtureFase5[indice]['gol2']){
                var fixture = new TorneoLigaFixtureService();

                fixture.data = {
                                "IdTorneo": self.fixtureFase5[indice]['IdTorneo'],
                                "IdFecha": self.fixtureFase5[indice]['IdFecha'],
                                "Idreserva": self.fixtureFase5[indice]['idreserva'],
                                "gol1": self.fixtureFase5[indice]['gol1'],
                                "gol2": self.fixtureFase5[indice]['gol2']
                               };   

                TorneoCopaFixtureService.update(fixture.data, function(reponse){

                  },function(errorResponse){
                        console.log("Error");
                 });
            }
        }
        
    };
    
    
    this.updateFixtureFase1 = function(){   
        
        if(self.bIdayVuelta){
            self.updateFixtureFase1IdayVuelta();
        }else{
            self.updateFixtureFase1Ida();
        }
       
        $state.reload("Duenios.verTorneoCopa", {idTorneo:self.torneo['IdTorneo']});
    };
    
    this.updateFixtureFase2 = function(){   
        
        if(self.bIdayVuelta){
            self.updateFixtureFase2IdayVuelta();
        }else{
            self.updateFixtureFase2Ida();
        }
       
        $state.reload("Duenios.verTorneoCopa", {idTorneo:self.torneo['IdTorneo']});
        
    };
    
    this.updateFixtureFase3 = function(){   
        
        if(self.bIdayVuelta){
            self.updateFixtureFase3IdayVuelta();
        }else{
            self.updateFixtureFase3Ida();
        }
       
        $state.reload("Duenios.verTorneoCopa", {idTorneo:self.torneo['IdTorneo']});
        
    };
    
    this.updateFixtureFase4 = function(){   
        
        if(self.bIdayVuelta){
            self.updateFixtureFase4IdayVuelta();
        }else{
            self.updateFixtureFase4Ida();
        }
       
        $state.reload("Duenios.verTorneoCopa", {idTorneo:self.torneo['IdTorneo']});
        
    };
    
    this.updateFixtureFase5 = function(){   
       
        if(self.bIdayVuelta){
            self.updateFixtureFase5IdayVuelta();
        }else{
            self.updateFixtureFase5Ida();
        }
       
        $state.reload("Duenios.verTorneoCopa", {idTorneo:self.torneo['IdTorneo']});
        
    };
    
    /*esto es para IDA y VUELTA*/
    this.cargarLlavesIdayVuelta= function(cantEquipos){
        
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
                self.alturaCampeon = "margin-top: 508.0px;"
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
                self.alturaCampeon = "margin-top: 254.0px;"
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
                self.alturaCampeon = "margin-top: 127.0px;"
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
                self.alturaCampeon = "margin-top: 63.5px;"
                break;
        };
        
       
        TorneoCopaIyVFixtureService.query({idTorneo:self.idTorneo, idFecha:idFase1 }).$promise.then(function(data) {
            self.fixtureFase1 = data;
            
            var stilo1 = "";
            var contador1 = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixtureFase1[contador1]["gol1"]=parseInt(self.fixtureFase1[contador1]["gol1"]) ;
                self.fixtureFase1[contador1]["gol2"]=parseInt(self.fixtureFase1[contador1]["gol2"]) ;
                self.fixtureFase1[contador1]["vGol1"]=parseInt(self.fixtureFase1[contador1]["vGol1"]) ;
                self.fixtureFase1[contador1]["vGol2"]=parseInt(self.fixtureFase1[contador1]["vGol2"]) ;
                self.fixtureFase1[contador1]["info"]= "Ida " +
                                                      self.fixtureFase1[contador1]["fecha"] + ", "+
                                                      self.fixtureFase1[contador1]["horaInicio"] + " Hs, cancha " +
                                                      self.fixtureFase1[contador1]["cancha"] + ".\n" + 
                                                      " Vuelta " +
                                                      self.fixtureFase1[contador1]["vFecha"] + ", "+
                                                      self.fixtureFase1[contador1]["vHoraInicio"] + " Hs, cancha " +
                                                      self.fixtureFase1[contador1]["vCancha"] + ".";
                
                if((contador1 % 2 ) == 0){
                    stilo1="height: 65px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }else{
                    stilo1= "height: 0px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }
                self.fixtureFase1[contador1]["conectorStyle"]=stilo1;
                
                contador1++;
            });
        }); 

        TorneoCopaIyVFixtureService.query({idTorneo:self.idTorneo, idFecha:idFase2 }).$promise.then(function(data) {
            self.fixtureFase2 = data;
            
            var stilo2 = "";
            var contador2 = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixtureFase2[contador2]["gol1"]=parseInt(self.fixtureFase2[contador2]["gol1"]) ;
                self.fixtureFase2[contador2]["gol2"]=parseInt(self.fixtureFase2[contador2]["gol2"]) ;
                self.fixtureFase2[contador2]["vGol1"]=parseInt(self.fixtureFase2[contador2]["vGol1"]) ;
                self.fixtureFase2[contador2]["vGol2"]=parseInt(self.fixtureFase2[contador2]["vGol2"]) ;
                self.fixtureFase2[contador2]["info"]= "Ida " +
                                                      self.fixtureFase2[contador2]["fecha"] + ", "+
                                                      self.fixtureFase2[contador2]["horaInicio"] + " Hs, cancha " +
                                                      self.fixtureFase2[contador2]["cancha"] + ".\n" + 
                                                      " Vuelta " +
                                                      self.fixtureFase2[contador2]["vFecha"] + ", "+
                                                      self.fixtureFase2[contador2]["vHoraInicio"] + " Hs, cancha " +
                                                      self.fixtureFase2[contador2]["vCancha"] + ".";
                

                
                 
                if(contador2 %2 == 0){
                    stilo2="height: 129px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }else{
                    stilo2= "height: 0px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }
                self.fixtureFase2[contador2]["conectorStyle"]=stilo2 ;
                
                
                contador2++;
            });
        }); 


        TorneoCopaIyVFixtureService.query({idTorneo:self.idTorneo, idFecha:idFase3 }).$promise.then(function(data) {
            self.fixtureFase3 = data;
            
            var stilo3 = "";
            var contador3 = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixtureFase3[contador3]["gol1"]=parseInt(self.fixtureFase3[contador3]["gol1"]) ;
                self.fixtureFase3[contador3]["gol2"]=parseInt(self.fixtureFase3[contador3]["gol2"]) ;
                self.fixtureFase3[contador3]["vGol1"]=parseInt(self.fixtureFase3[contador3]["vGol1"]) ;
                self.fixtureFase3[contador3]["vGol2"]=parseInt(self.fixtureFase3[contador3]["vGol2"]) ;
                self.fixtureFase3[contador3]["info"]= "Ida " +
                                      self.fixtureFase3[contador3]["fecha"] + ", "+
                                      self.fixtureFase3[contador3]["horaInicio"] + " Hs, cancha " +
                                      self.fixtureFase3[contador3]["cancha"] + ".\n" + 
                                      " Vuelta " +
                                      self.fixtureFase3[contador3]["vFecha"] + ", "+
                                      self.fixtureFase3[contador3]["vHoraInicio"] + " Hs, cancha " +
                                      self.fixtureFase3[contador3]["vCancha"] + ".";
     
                 if(contador3 %2 == 0){
                    stilo3="height: 256px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }else{
                    stilo3= "height: 0px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }
                self.fixtureFase3[contador3]["conectorStyle"]=stilo3 ;
                
                
                contador3++;
            });
        }); 

        TorneoCopaIyVFixtureService.query({idTorneo:self.idTorneo, idFecha:idFase4 }).$promise.then(function(data) {
            self.fixtureFase4 = data;
            
            var stilo4 = "";
            var contador4 = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixtureFase4[contador4]["gol1"]=parseInt(self.fixtureFase4[contador4]["gol1"]) ;
                self.fixtureFase4[contador4]["gol2"]=parseInt(self.fixtureFase4[contador4]["gol2"]) ;
                self.fixtureFase4[contador4]["vGol1"]=parseInt(self.fixtureFase4[contador4]["vGol1"]) ;
                self.fixtureFase4[contador4]["vGol2"]=parseInt(self.fixtureFase4[contador4]["vGol2"]) ;
                self.fixtureFase4[contador4]["info"]= "Ida " +
                                      self.fixtureFase4[contador4]["fecha"] + ", "+
                                      self.fixtureFase4[contador4]["horaInicio"] + " Hs, cancha " +
                                      self.fixtureFase4[contador4]["cancha"]  + ".\n" + 
                                      " Vuelta " +
                                      self.fixtureFase4[contador4]["vFecha"] + ", "+
                                      self.fixtureFase4[contador4]["vHoraInicio"] + " Hs, cancha " +
                                      self.fixtureFase4[contador4]["vCancha"] + ".";

                
                
                 if(contador4 %2 == 0){
                    stilo4="height: 510px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }else{
                    stilo4= "height: 0px; width: 20px; right: -22px; top: 26.0px; border-bottom-style: none;" ;
                }
                self.fixtureFase4[contador4]["conectorStyle"]=stilo4 ;
                
                contador4++;
            });
        }); 

    
        TorneoCopaIyVFixtureService.query({idTorneo:self.idTorneo, idFecha:idFase5 }).$promise.then(function(data) {
            self.fixtureFase5 = data;
            
            
            var contador = 0;
            //Esto lo hago para que los goles sean numeros
            angular.forEach(data, function(aux) {
                self.fixtureFase5[contador]["gol1"]=parseInt(self.fixtureFase5[contador]["gol1"]) ;
                self.fixtureFase5[contador]["gol2"]=parseInt(self.fixtureFase5[contador]["gol2"]) ;
                self.fixtureFase5[contador]["vGol1"]=parseInt(self.fixtureFase5[contador]["vGol1"]) ;
                self.fixtureFase5[contador]["vGol2"]=parseInt(self.fixtureFase5[contador]["vGol2"]) ;
                self.fixtureFase5[contador]["info"]= "Ida " +
                              self.fixtureFase5[contador]["fecha"] + ", "+
                              self.fixtureFase5[contador]["horaInicio"] + " Hs, cancha " +
                              self.fixtureFase5[contador]["cancha"]  + ".\n" + 
                              " Vuelta " +
                              self.fixtureFase5[contador]["vFecha"] + ", "+
                              self.fixtureFase5[contador]["vHoraInicio"] + " Hs, cancha " +
                              self.fixtureFase5[contador]["vCancha"] + ".";
               
                contador++;
            });
        }); 

    };
    
    this.updateFixtureFase1IdayVuelta = function(){   
        
        for(var indice = 0; indice < self.fixtureFase1.length ; indice++ ){ 
            
            if(self.fixtureFase1[indice]['gol1'] + self.fixtureFase1[indice]['vGol1'] != 
               self.fixtureFase1[indice]['gol2'] + self.fixtureFase1[indice]['vGol2']){
            
                var fixture = new TorneoLigaFixtureService();

                fixture.data = {
                                "IdTorneo": self.fixtureFase1[indice]['IdTorneo'],
                                "IdFecha": self.fixtureFase1[indice]['IdFecha'],
                                "Idreserva": self.fixtureFase1[indice]['idreserva'],
                                "gol1": self.fixtureFase1[indice]['gol1'],
                                "gol2": self.fixtureFase1[indice]['gol2'],
                                "vIdreserva": self.fixtureFase1[indice]['vIdReserva'],
                                "vGol1": self.fixtureFase1[indice]['vGol1'],
                                "vGol2": self.fixtureFase1[indice]['vGol2']
                               };   

                TorneoCopaIyVFixtureService.update(fixture.data, function(reponse){

                  },function(errorResponse){
                        console.log("Error");
                 });
            }
        }

    };
    
    this.updateFixtureFase2IdayVuelta = function(){   
        
        for(var indice = 0; indice < self.fixtureFase2.length ; indice++ ){ //esto falla
            if(self.fixtureFase2[indice]['gol1'] + self.fixtureFase2[indice]['vGol1'] != 
               self.fixtureFase2[indice]['gol2'] + self.fixtureFase2[indice]['vGol2']){
                 
                var fixture = new TorneoLigaFixtureService();

                fixture.data = {
                                "IdTorneo": self.fixtureFase2[indice]['IdTorneo'],
                                "IdFecha": self.fixtureFase2[indice]['IdFecha'],
                                "Idreserva": self.fixtureFase2[indice]['idreserva'],
                                "gol1": self.fixtureFase2[indice]['gol1'],
                                "gol2": self.fixtureFase2[indice]['gol2'],
                                "vIdreserva": self.fixtureFase2[indice]['vIdReserva'],
                                "vGol1": self.fixtureFase2[indice]['vGol1'],
                                "vGol2": self.fixtureFase2[indice]['vGol2']
                               };   

                TorneoCopaIyVFixtureService.update(fixture.data, function(reponse){

                  },function(errorResponse){
                        console.log("Error");
                 });
            }
        }
    };
    
    this.updateFixtureFase3IdayVuelta = function(){   
        
        for(var indice = 0; indice < self.fixtureFase3.length ; indice++ ){ //esto falla
            if(self.fixtureFase3[indice]['gol1'] + self.fixtureFase3[indice]['vGol1'] != 
               self.fixtureFase3[indice]['gol2'] + self.fixtureFase3[indice]['vGol2']){
                    
                var fixture = new TorneoLigaFixtureService();

                    fixture.data = {
                                    "IdTorneo": self.fixtureFase3[indice]['IdTorneo'],
                                    "IdFecha": self.fixtureFase3[indice]['IdFecha'],
                                    "Idreserva": self.fixtureFase3[indice]['idreserva'],
                                    "gol1": self.fixtureFase3[indice]['gol1'],
                                    "gol2": self.fixtureFase3[indice]['gol2'],
                                    "vIdreserva": self.fixtureFase3[indice]['vIdReserva'],
                                    "vGol1": self.fixtureFase3[indice]['vGol1'],
                                    "vGol2": self.fixtureFase3[indice]['vGol2']
                                   };   

                    TorneoCopaIyVFixtureService.update(fixture.data, function(reponse){

                      },function(errorResponse){
                            console.log("Error");
                     });
            }
        }
        
    };
    
    this.updateFixtureFase4IdayVuelta = function(){   
        
        for(var indice = 0; indice < self.fixtureFase4.length ; indice++ ){ //esto falla
            
            if(self.fixtureFase4[indice]['gol1'] + self.fixtureFase4[indice]['vGol1'] != 
               self.fixtureFase4[indice]['gol2'] + self.fixtureFase4[indice]['vGol2']){
                
                var fixture = new TorneoLigaFixtureService();

                fixture.data = {
                                "IdTorneo": self.fixtureFase4[indice]['IdTorneo'],
                                "IdFecha": self.fixtureFase4[indice]['IdFecha'],
                                "Idreserva": self.fixtureFase4[indice]['idreserva'],
                                "gol1": self.fixtureFase4[indice]['gol1'],
                                "gol2": self.fixtureFase4[indice]['gol2'],
                                "vIdreserva": self.fixtureFase4[indice]['vIdReserva'],
                                "vGol1": self.fixtureFase4[indice]['vGol1'],
                                "vGol2": self.fixtureFase4[indice]['vGol2']
                               };   

                TorneoCopaIyVFixtureService.update(fixture.data, function(reponse){

                  },function(errorResponse){
                        console.log("Error");
                 });
            }
        }
        
    };
    
    this.updateFixtureFase5IdayVuelta = function(){   
        
        for(var indice = 0; indice < self.fixtureFase5.length ; indice++ ){ //esto falla
            
            if(self.fixtureFase5[indice]['gol1'] + self.fixtureFase5[indice]['vGol1'] != 
               self.fixtureFase5[indice]['gol2'] + self.fixtureFase5[indice]['vGol2']){
                

                var fixture = new TorneoLigaFixtureService();

                fixture.data = {
                                "IdTorneo": self.fixtureFase5[indice]['IdTorneo'],
                                "IdFecha": self.fixtureFase5[indice]['IdFecha'],
                                "Idreserva": self.fixtureFase5[indice]['idreserva'],
                                "gol1": self.fixtureFase5[indice]['gol1'],
                                "gol2": self.fixtureFase5[indice]['gol2'],
                                "vIdreserva": self.fixtureFase5[indice]['vIdReserva'],
                                "vGol1": self.fixtureFase5[indice]['vGol1'],
                                "vGol2": self.fixtureFase5[indice]['vGol2']
                               };   

                TorneoCopaIyVFixtureService.update(fixture.data, function(reponse){

                  },function(errorResponse){
                        console.log("Error");
                 });
            }
        }
        
    };
    
    
    
    self.init();
});