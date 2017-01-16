var app = angular.module("resergolApp");

app.service("DuenioReservasFijasService", function($http, $resource){

    var DUENIO_RESERVAS_FIJAS_URI = "http://localhost:8080/resergol1.1/api/duenios/reservasFijas/:pIdCliente/:pIdComplejo/:pIdCancha/:pHoraInicio/:pHoraFin";
    
    return $resource(DUENIO_RESERVAS_FIJAS_URI, {pIdCliente: '@_pIdCliente' , pIdComplejo: '@_pIdComplejo', pIdCancha: '@_pIdCancha', pHoraInicio: '@_pHoraInicio', pHoraFin: '@_pHoraFin'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});