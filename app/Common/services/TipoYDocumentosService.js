var app = angular.module("resergolApp");

app.service("TipoYDocumentosService", function($http, $resource){

    var TIPOYDOC_URI = "http://localhost:8080/resergol1.1/api/tipoydoc/:tipoDoc/:nroDoc/:tipoUsu";  //<PI>En mi casa es asi...
    
    
    return $resource(TIPOYDOC_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 