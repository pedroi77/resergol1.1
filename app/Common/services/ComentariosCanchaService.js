var app = angular.module("resergolApp");

app.service("ComentariosCanchaService", function($http, $resource){
    var COMMENTS_URI = "http://localhost:8080/resergol1.1/api/comentariosCancha/:idCancha/:idComplejo/:idCliente";
    
    return $resource(COMMENTS_URI, {idCancha: '@_idCancha', idComplejo: '@_idComplejo', idCliente: '@_idCliente'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
}); 