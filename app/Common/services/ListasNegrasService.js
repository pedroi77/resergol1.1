var app = angular.module("resergolApp");

app.service("ListasNegrasService", function($http, $resource){

	//var USUARIO_URI = "http://localhost/resergol1.1/api/usuario/:user";
    var LISTANEGRA_URI = "http://localhost:8080/resergol1.1/api/listaNegra/:idCliente/:idComplejo";
    
    
    return $resource(LISTANEGRA_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 