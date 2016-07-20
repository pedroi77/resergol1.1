
var resergolApp = angular.module("resergolApp");


resergolApp.controller("TorneoLigaController", function($scope, $stateParams, store, $state, TorneoService, TorneoImgDBService,TorneoLigaTablaService, TorneoLigaFechasService,TorneoLigaFixtureService,TorneoCanchasService, ListasNegrasService,TorneoCampeonService, EquipoTorneoService){


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
    this.canchas=[];
    this.msjFecha;
    this.campeon;
    this.muestraCampeon=false;
    $scope.fechaIngresoListaNegra = 0; //Si es 0, no está en la lista negra. Si está, guardo la fecha que ingresó a la misma.
    
    
    this.estaLogueadoCliente = false;
    var token = store.get("token") || null;
         var sesion = sessionStorage.usuario  || null;
        
         if(!token || !sesion ){
             self.estaLogueadoCliente = false;
         }    
         else if(sessionStorage.tipo == 'C'){
             self.estaLogueadoCliente = true;
         }   
  
    this.inscripcionTorneoLiga = function(){ 
        if($scope.fechaIngresoListaNegra != 0)
        {
            var msj = 'No podés inscribirte ya que estás en la lista negra del complejo desde el ' + $scope.fechaIngresoListaNegra;
            bootbox.alert(msj, function() {});
        }
        else
            $state.go('Clientes.verTorneoLiga.inscripcionTorneoLiga');
    };
    
    
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
            
            self.msjFecha = "Fecha " + idFecha;
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
    
    this.updateFixture = function(indice)
    {   
        
        var fixture = new TorneoLigaFixtureService();
     
        fixture.data = {
                        "IdTorneo": self.fixture[indice]['IdTorneo'],
                        "IdFecha": self.fixture[indice]['IdFecha'],
                        "Idreserva": self.fixture[indice]['idreserva'],
                        "IdEquipo1":self.fixture[indice]['idEquipo1'],
                        "gol1": self.fixture[indice]['gol1'],
                        "IdEquipo2":self.fixture[indice]['idEquipo2'],
                        "gol2": self.fixture[indice]['gol2']
  	                   };   

        TorneoLigaFixtureService.update(fixture.data, function(reponse){
                $state.reload("Duenios.verTorneoLiga", {idTorneo:self.fixture[indice]['IdTorneo']})
          },function(errorResponse){
                console.log("Error");
         });
    };
    
    
    this.verificarListaNegra = function(){
			ListasNegrasService.query({idCliente:sessionStorage.id, idComplejo:self.canchas[0].IdComplejo}).$promise.then(function(data){
                 if(data != null && data != undefined && data[0] != undefined)
                 {
                     if(data[0].FechaIngreso != null && data[0].FechaIngreso != undefined)
                        $scope.fechaIngresoListaNegra = data[0].FechaIngreso;
                     else
                        $scope.fechaIngresoListaNegra = 0;     
                 }
                else
                    $scope.fechaIngresoListaNegra = 0;
                 
            });
	};
    
    
    //Para habilitar/deshabilitar el botón de inscripción a torneo.
    this.valida = false;
    
    this.init = function(){
        TorneoService.query({idTorneo:self.idTorneo }).$promise.then(function(data) {
            console.log(data[0]);
            self.torneo = data[0];
            //self.validaInscripcion();
            /*cargar imagenes*/
            TorneoCanchasService.query({idTorneo:self.idTorneo }).$promise.then(function(data) {
                self.canchas = data;
                self.verificarListaNegra();
            });
            
            if(self.estaLogueadoCliente == false || self.torneo.idEstado != 2)
                self.valida = false;
            else
                self.valida = true;
            
            TorneoCampeonService.query({idTipoTorneo:self.torneo.idTipoTorneo , idTorneo:self.idTorneo }).$promise.then(function(data) {            
                self.campeon = data[0];
                
                console.log(self.campeon);
                
                
                if(self.campeon.IdEquipo>0){
                    self.muestraCampeon = true;
                }else{
                    self.muestraCampeon = false;
                }
            }); 
            
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