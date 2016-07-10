var app = angular.module("resergolApp");

app.service("DueniosReservasAumentoService", function($http, $resource){

    var RESERVA_AUMENTO_URI = "http://localhost:8080/resergol1.1/api/duenios/canchas/reservas"; ///:idComplejo/:idCancha/:porcentajeAumento
    
    return $resource(RESERVA_AUMENTO_URI, {}, { //idComplejo: '@_idComplejo', idCancha: '@_idCancha', porcentajeAumento:'@_porcentajeAumento'
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});