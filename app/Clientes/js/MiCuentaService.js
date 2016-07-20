
var app = angular.module("resergolApp");

app.service("TarjetasClienteService", function($http, $resource){

 
var MI_CUENTA_URI = "http://localhost:8080/resergol1.1/api/clientes/micuenta/:idCliente";  
      
return $resource(MI_CUENTA_URI, { idCliente: '@_idCliente'}, {
        query: {method: 'GET',
                transformResponse: function(data) {                                                                                                    
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
   	
    
});