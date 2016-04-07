var app = angular.module("resergolApp");

app.service("DueniosService", function($http, $resource){

	//var TIPOSDOCS_URI = "http://localhost/resergol1.1/api/duenios";
    var DUENIOS_URI = "http://localhost:8080/resergol1.1/api/duenios";  //<PI>En mi casa es asi... 
    
    return $resource(DUENIOS_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
    
	
});