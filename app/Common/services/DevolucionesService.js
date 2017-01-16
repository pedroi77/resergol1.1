var app = angular.module("resergolApp");

app.service("DevolucionesService", function($http, $resource){

    var DEV_URI = "http://localhost:8080/resergol1.1/api/devoluciones";
    
    
    return $resource(DEV_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 