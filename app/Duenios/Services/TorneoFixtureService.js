var app = angular.module("resergolApp");

app.service("TorneoFixtureService", function($http, $resource){

    
    DUENIOS_URI = "http://localhost:8080/resergol1.1/api/duenios/torneos/fixture/:idTorneo";
    
    return $resource(DUENIOS_URI, { idTorneo: '@_idTorneo'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
    
	
});