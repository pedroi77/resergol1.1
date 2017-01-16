var app = angular.module("resergolApp");

app.service("ComplejoListaNegraServices", function($http, $resource){

    var LISTA_NEGRA_URI ="http://localhost:8080/resergol1.1/api/duenios/complejo/listaNegra/:idComplejo/:idCliente";  
    
    return $resource(LISTA_NEGRA_URI,  { idComplejo: '@_idComplejo', idCliente: '@_idCliente'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
});