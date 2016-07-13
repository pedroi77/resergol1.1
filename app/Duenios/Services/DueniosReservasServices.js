var app = angular.module("resergolApp");

app.service("DueniosReservasServices", function($http, $resource){

    var RESERVA_URI = "http://localhost:8080/resergol1.1/api/duenios/reservas/:idComplejo/:fecha/:idCancha";
    
    return $resource(RESERVA_URI, {idComplejo: '@_idComplejo', fecha: '@_fecha', idCancha: '@_idCancha'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});