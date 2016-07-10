var app = angular.module("resergolApp");

app.service("TorneosClientesService", function($http, $resource){


    var TORN_URI = "http://localhost:8080/resergol1.1/api/torneosCli/:pNombre/:pTipo/:pCantEquipos/:pIdProv/:pIdLoc/:pCantJug/:pIdSuperficie/:pInscripcion/:pActivos/:pFinalizados/:pIdaYVuelta";
    
    return $resource(TORN_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
});