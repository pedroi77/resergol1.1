var resergolApp = angular.module("resergolApp");

resergolApp.controller("DueniosReservasController", function($scope, DueniosReservasServices, AdministrarCanchasService, $state, $uibModal,  $uibModalStack){
    
//Seccion de Datos
var self = this;
  
//this.reservas = [];
this.canchas = [];
this.IdComplejo = sessionStorage.idComplejo;
this.Fecha = '2016-09-22';
    
this.reservas = {
    
    canchas: [{
        
        datos: []
    }]
}

this.cosas = [
    
    /*{ num: 1},
    { num: 1},
    { num: 1},
    { num: 1},
    { num: 1}*/
]

this.horas = [
    
    
]
    
this.traerReservas = function(){
    
    //console.log(self.IdComplejo);
    
    
    AdministrarCanchasService.query({idComplejo: self.IdComplejo, aux:0}).$promise.then(function(data){ //, aux: 0
        self.reservas.canchas = data; 
        self.canchas = data;
        
        //console.log(self.canchas);
         
        var index = 0;
        
        angular.forEach(self.reservas.canchas, function(aux) {
        
            //console.log("cancha ID: " + aux.IdCancha);
        
            DueniosReservasServices.query({idComplejo: self.IdComplejo, fecha: self.Fecha, idCancha: aux.IdCancha}).$promise.then(function(data){
                
                self.reservas.canchas[index].datos = data;
                self.cosas.push({'usuario': data.usuario, 'hora': data.hora})
                index++;
                
                console.log(data);
                
                console.log(self.cosas);
                
                if(index == 1){
                    
                    angular.forEach(self.reservas.canchas[0].datos, function(aux) {
            
                        self.horas.push({'Hora': aux.hora});
                        //console.log(aux.hora);

                    });
                    //console.log(data);
                    //console.log(self.horas); 
                }
                
            });
            
        });
         
    });
    //console.log(self.reservas);
    //console.log(self.reservas.canchas[0].datos)
};
    
self.traerReservas();

    
});