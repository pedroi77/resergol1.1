var app = angular.module("resergolApp");

app.service("DueniosComplejosService", function($http, $resource){

    
    COMPLEJOS_URI = "http://localhost:8080/resergol1.1/api/duenios/complejos";
    
    return $resource(TORNEOS_URI, { }, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
	
});