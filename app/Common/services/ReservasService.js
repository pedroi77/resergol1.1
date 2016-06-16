var app = angular.module("resergolApp");

app.service("ReservasService", function($http, $resource){

    var RESERVAS_URI = "http://localhost:8080/resergol1.1/api/clientes/reservas/:idCancha/:idComplejo/:fecha";
    
    return $resource(RESERVAS_URI, {idCancha: '@_idCancha', idComplejo: '@_idComplejo', fecha: '@_fecha'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 