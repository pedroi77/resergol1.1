var app = angular.module("resergolApp");

app.service("TorneosService", function($http, $resource){

    //var TORNEOS_URI ="http://localhost:8080/resergol1.1/api/duenios/torneos/tipos/:idTorneo";  
    var TORNEOS_URI ="http://localhost:8080/resergol1.1/api/tiposTorneos/:idTorneo";  
    
    
    return $resource(TORNEOS_URI,  { idTorneo: '@_idTorneo'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 