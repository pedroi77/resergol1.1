var app = angular.module("resergolApp");

app.service("DueniosSuperficiesService", function($http, $resource){

    
    var SUPERFICIES_URI ="http://localhost:8080/resergol1.1/api/superficies/:idDuenio";  
    
    
    return $resource(SUPERFICIES_URI,  { idTorneo: '@idDuenio'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 