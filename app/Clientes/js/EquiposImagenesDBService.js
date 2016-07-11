var app = angular.module("resergolApp");

app.service("EquiposImagenesDBService", function($http, $resource){
  
    var EQIMG_DB = "http://localhost:8080/resergol1.1/api/clientes/equipos/imagen/:idEquipo/:url";
    
    return $resource(EQIMG_DB, {idEquipo: '@idEquipo', url:'@url'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
        ,
    });
});