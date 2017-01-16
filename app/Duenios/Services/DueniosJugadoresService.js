var app = angular.module("resergolApp");

app.service("DueniosJugadoresService", function($http, $resource){

    
    var JUGADORES_URI ="http://localhost:8080/resergol1.1/api/jugadores/:idDuenio";  
    
    
    return $resource(JUGADORES_URI,  { idTorneo: '@idDuenio'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 