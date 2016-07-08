var resergolApp = angular.module("resergolApp");

resergolApp.controller("AdministrarListaNegraController", function($scope, $state, ComplejoListaNegraServices, EnviarMailService, $uibModal,  $uibModalStack){
    
//-.-.-.-.-.-.-DECLARACIONES-.-.-.-.-.-.-//

    var self = this;
    this.idComplejo = sessionStorage.idComplejo;
    this.listaNegra = [];

//-.-.-.-.-.-.-METODOS-.-.-.-.-.-.-//
    
//trae todos los usuarios que fueron ingresados en la lista negra del complejo
this.getListaNegra = function(){
    
    ComplejoListaNegraServices.query({idComplejo: self.idComplejo}).$promise.then(function(data){ //, aux:0
            
            console.log("holaaa ...>" + self.idComplejo);
            self.listaNegra = data;
    });
};   
    
    
this.init = function(){
    self.getListaNegra();
    
    EnviarMailService.query({ }).$promise.then(function(data){ //, aux:0
            
            console.log("MANDOOOOOO");
            //self.listaNegra = data;
    });
};

//Elimina de la lista negra del complejo el cliente selecciona
this.sacarDeLista = function(cliente){
    
    var clienteID = cliente.IdCliente;
    
    ComplejoListaNegraServices.delete({idComplejo: self.idComplejo, idCliente: clienteID}).$promise.then(function(data){ //, aux:0
            
            console.log("holaaa ...>" + self.idComplejo + ' idCliente ' + clienteID);
            console.log(data);
            self.getListaNegra();
    });
};
   
//-.-.-.-.-.-.-LLAMADA-.-.-.-.-.-.-// 
self.getListaNegra();
    
});