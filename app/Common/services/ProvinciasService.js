var app = angular.module("resergolApp");

app.service("ProvinciasService", function($http, $resource){

	var PROVINCIAS_URI = "http://localhost/resergol1.1/api/provincias";
    //var TIPOSDOCS_URI = "http://localhost:8080/resergol1.1/api/provincias";  //<PI>En mi casa es asi... 
    
    
    return $resource(PROVINCIAS_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
	
});