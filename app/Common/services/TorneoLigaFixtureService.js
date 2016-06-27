var app = angular.module("resergolApp");

app.service("TorneoLigaFixtureService", function($http, $resource){

    var TORNEO_FIX = "http://localhost:8080/resergol1.1/api/common/torneo/liga/fixture/:idTorneo/:idFecha";
    
    return $resource(TORNEO_FIX, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
}); 