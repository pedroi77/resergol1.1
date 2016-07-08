var app = angular.module("resergolApp");

app.service("AdministrarCanchasService", function($http, $resource){

    ADMIN_COMPLEJO_URI = "http://localhost:8080/resergol1.1/api/duenios/administrarCanchas/:idComplejo/:aux"; //:aux

    return $resource(ADMIN_COMPLEJO_URI, { idComplejo: '@_idComplejo' , aux: '@_aux'}, {
        query: {method: 'GET', //' 
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});