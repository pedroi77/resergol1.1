var app = angular.module("resergolApp");

app.service("DuenioDiasService", function($http, $resource){

    
    var DIAS_URI ="http://localhost:8080/resergol1.1/api/dias/:idDuenio/:idTorneo";  
    
    
    return $resource(DIAS_URI,  { idDuenio: '@idDuenio', idTorneo: '@idTorneo'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 