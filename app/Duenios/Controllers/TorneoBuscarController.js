var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoBuscarController", function($scope, $state, DuenioTorneoService, TorneoFixtureService){

    var self = this;
    this.torneo =[];
    this.activos = true;
    this.insc = true;
    this.finalizados=false;
    this.todos=false;
        
    
    this.torneo = {
        torneos: []
    };    
    
    this.setTodos= function(){
        if(self.todos){
            self.activos = false;
            self.insc = false;
            self.finalizados=false;
        }
    };
    
    this.modificar = function(indice){
        var vIdTorneo=self.torneo.torneos[indice]["idTorneo"];
        $state.go("Duenios.torneoModificar",{idTorneo:vIdTorneo});
    };
    
    
    this.verEquipos = function(indice, valor){
        var vIdTorneo=self.torneo.torneos[indice]["idTorneo"];
        var vNombre=self.torneo.torneos[indice]["nombre"];
        var vEquipos=self.torneo.torneos[indice]["CantEquipos"];
        var vInscriptos=self.torneo.torneos[indice]["Inscriptos"];
        
        $state.go("Duenios.torneoEquipos",{idTorneo:vIdTorneo, nombre: vNombre, cantEquipos:vEquipos , inscriptos: vInscriptos});
    };
    
    this.cargarFixture = function(indice, valor){
        var vIdTorneo= self.torneo.torneos[indice]["idTorneo"];
        var vTipoTorneo = self.torneo.torneos[indice]["tipo"]; 
        
        if(vTipoTorneo == 'Liga'){  /*Horrible harcode pero no queria traer el tipo para no modificar el SP*/
            $state.go("Duenios.verTorneoLiga",{idTorneo:vIdTorneo});
        }
        else{
            $state.go("Duenios.verTorneoCopa",{idTorneo:vIdTorneo});
        }
        
    };
    
    this.armarFixture = function(indice){
        
        var vIdTorneo= self.torneo.torneos[indice]["idTorneo"];
        var fixtureNuevo = new TorneoFixtureService();
        
        fixtureNuevo.data= { 'idTorneo' : vIdTorneo};
        
        TorneoFixtureService.save(fixtureNuevo.data, function(reponse){
             bootbox.alert(reponse.data[0]['Res'], function() {});
             $state.reload("Duenios.torneoBuscar");
          },function(errorResponse){
             bootbox.alert("Ocurrió un error y no se pudo generar el fixture. Contactese con el administrador de la página.", function() {});
         });
    }
    
    
    
    this.init = function(){
        var vActivos = 0;
        var vInsc=0;
        var vFin=0;
        var vTodos =0;
        
        vActivos=(self.activos)?1:0;
        vInsc=(self.insc)?2:0;
        vFin= (self.finalizados)?3:0;
        vTodos= (self.todos)?1:0;
 
        DuenioTorneoService.query({idDuenio:sessionStorage.id, todos:vTodos, activos: vActivos, inscriptos: vInsc, finalizados: vFin }).$promise.then(function(data) {
            self.torneo.torneos = data;
        }); 
    }
    
    self.init();
});