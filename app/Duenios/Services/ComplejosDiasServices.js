var app = angular.module("resergolApp");

app.service("ComplejosDiasServices", function($http, $resource){

    
    COMPLEJO_DIAS_URI = "http://localhost:8080/resergol1.1/api/duenios/complejosDias/:idComplejo/:aux";

    return $resource(COMPLEJO_DIAS_URI, { idComplejo: '@_idComplejo', aux:'@_aux'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});