var app = angular.module("resergolApp");

app.service("TorneoCampeonService", function($http, $resource){

    var TORNEO_URI = "http://localhost:8080/resergol1.1/api/common/torneo/campeon/:idTipoTorneo/:idTorneo";
    
    return $resource(TORNEO_URI,  {idTipoTorneo: '@_idTipoTorneo', idTorneo: '@_idTorneo'} , {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
}); 