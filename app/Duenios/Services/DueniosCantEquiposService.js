var app = angular.module("resergolApp");

app.service("DueniosCantEquiposService", function($http, $resource){

    
    var EQUIPOS_URI ="http://localhost:8080/resergol1.1/api/cantEquipos/:TipoTorneo";  
    
    
    return $resource(EQUIPOS_URI,  { TipoTorneo: '@TipoTorneo'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 