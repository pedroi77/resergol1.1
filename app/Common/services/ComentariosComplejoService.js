var app = angular.module("resergolApp");

app.service("ComentariosComplejoService", function($http, $resource){
    var COMMENTS_URI = "http://localhost:8080/resergol1.1/api/comentariosComplejo/:idComplejo/:idCliente";
    
    return $resource(COMMENTS_URI, {idComplejo: '@_idComplejo', idCliente: '@_idCliente'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
});