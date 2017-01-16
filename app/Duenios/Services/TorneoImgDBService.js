var app = angular.module("resergolApp");

app.service("TorneoImgDBService", function($http, $resource){

  
    TORNEOSIMG_URI = "http://localhost:8080/resergol1.1/api/duenios/torneos/imagen/:idTorneo/:url";
    
    return $resource(TORNEOSIMG_URI, {idTorneo: '@idTorneo', url:'@url'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
        ,
    });
});