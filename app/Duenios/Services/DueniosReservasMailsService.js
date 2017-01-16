var app = angular.module("resergolApp");

app.service("DueniosReservasMailsService", function($http, $resource){

    RESERVAS_MAILS_URI = "http://localhost:8080/resergol1.1/api/duenios/reservas/mails/:pIdComplejo/:pIdCancha"; //:aux

    return $resource(RESERVAS_MAILS_URI, { pIdComplejo: '@_pIdComplejo' , pIdCancha: '@_pIdCancha'}, {
        query: {method: 'GET', //' 
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});