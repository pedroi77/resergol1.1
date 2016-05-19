var app = angular.module("resergolApp");

app.service("DuenioTorneoService", function($http, $resource){

    
    TORNEOS_URI = "http://localhost:8080/resergol1.1/api/duenios/torneos";
    
    return $resource(TORNEOS_URI, { }, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
    
	
});