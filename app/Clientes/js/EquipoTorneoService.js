var app = angular.module("resergolApp");

app.service("EquipoTorneoService", function($http, $resource){


    var TORN_URI = "http://localhost:8080/resergol1.1/api/equipoTorneo/:idEquipo/:idTorneo";
    
    return $resource(TORN_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
});