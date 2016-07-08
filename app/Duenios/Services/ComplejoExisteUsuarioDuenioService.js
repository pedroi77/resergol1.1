var app = angular.module("resergolApp");

app.service("ComplejoExisteUsuarioDuenioService", function($http, $resource){

    EXISTE_USUARIO_URI = "http://localhost:8080/resergol1.1/api/duenios/existeUsuario/:idPersona/:usuario"; //:aux

    return $resource(EXISTE_USUARIO_URI, { idPersona: '@_idPersona' , usuario: '@_usuario'}, {
        query: {method: 'GET', //' 
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});