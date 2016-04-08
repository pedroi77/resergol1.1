var app = angular.module("resergolApp");

app.service("LocalidadesService", function($http, $resource){

	//var LOCALIDADES_URI = "http://localhost/resergol1.1/api/localidades/:id";
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