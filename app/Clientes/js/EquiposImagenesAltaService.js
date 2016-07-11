var app = angular.module("resergolApp");

app.service("EquiposImagenesAltaService", function($http, $resource){

    var EQIMG_URI = "http://localhost:8080/resergol1.1/api/clientes/equipos/imagen";
    
    return $resource(EQIMG_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});