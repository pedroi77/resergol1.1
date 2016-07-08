var app = angular.module("resergolApp");

app.service("ReservasCancelacionService", function($http, $resource){

    var RES_CANC_URI = "http://localhost:8080/resergol1.1/api/cancelacion/:idReserva";
    
    return $resource(RES_CANC_URI, {idReserva: '@_idReserva'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 