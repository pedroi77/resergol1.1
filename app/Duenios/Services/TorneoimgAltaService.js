var app = angular.module("resergolApp");

app.service("TorneoimgAltaService", function($http, $resource){

  
    TORNEOSIMG_URI = "http://localhost:8080/resergol1.1/api/duenios/torneos/imagen";
    
    return $resource(TORNEOSIMG_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
        
    });
});