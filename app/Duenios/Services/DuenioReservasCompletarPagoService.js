var app = angular.module("resergolApp");

app.service("DuenioReservasCompletarPagoService", function($http, $resource){

    var RESERVA_COMPLETAR_PAGO_URI = "http://localhost:8080/resergol1.1/api/duenios/reservas/completarPago";
    
    return $resource(RESERVA_COMPLETAR_PAGO_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});