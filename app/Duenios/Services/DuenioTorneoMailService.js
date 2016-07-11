var app = angular.module("resergolApp");

app.service("DuenioTorneoMailService", function($http, $resource){

  
    EQUIPOS_URI = "http://localhost:8080/resergol1.1/api/duenios/torneos/mails/:idTorneo";
    
    return $resource(EQUIPOS_URI, {idTorneo: '@_idTorneo'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
        
    });
});
