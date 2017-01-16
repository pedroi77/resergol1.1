var app = angular.module("resergolApp");

app.service("TorneoLigaFechasService", function($http, $resource){

    var TORNEO_FECHAS = "http://localhost:8080/resergol1.1/api/common/torneo/liga/fechas/:idTorneo";
    
    return $resource(TORNEO_FECHAS, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
}); 