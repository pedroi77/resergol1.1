var app = angular.module("resergolApp");

app.service("LocalidadesService", function($http, $resource){

	//var PROVINCIAS_URI = "http://localhost/resergol1.1/api/provincias";
    var LOCALIDADES_URI = "http://localhost:8080/resergol1.1/api/localidades/:id";  //<PI>En mi casa es asi... 
    
    
    return $resource(LOCALIDADES_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
	
}); 