var app = angular.module("resergolApp");

app.service("TorneoLigaTablaService", function($http, $resource){

    var TORNEO_URI = "http://localhost:8080/resergol1.1/api/common/torneo/liga/tabla/:idTorneo";
    
    return $resource(TORNEO_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
}); 