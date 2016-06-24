
var app = angular.module("resergolApp");

app.service("TarjetasClienteService", function($http, $resource){

 
var TARJETAS_CLIENTES_URI = "http://localhost:8080/resergol1.1/api/clientes/tarjetas/:idCliente/:idAux";  
      
return $resource(TARJETAS_CLIENTES_URI, { idCliente: '@_idCliente', idAux: '@_idAux' }, {
        query: {method: 'GET',
                transformResponse: function(data) {                                                                                                    
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
   	
    
});

