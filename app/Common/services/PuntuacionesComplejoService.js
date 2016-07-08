var app = angular.module("resergolApp");

app.service("PuntuacionesComplejoService", function($http, $resource){
    var PUNTUACIONES_URI = "http://localhost:8080/resergol1.1/api/puntuacionesComplejo/:idComplejo/:idCliente";
    
    return $resource(PUNTUACIONES_URI, {idComplejo: '@_idComplejo', idCliente: '@_idCliente'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
});