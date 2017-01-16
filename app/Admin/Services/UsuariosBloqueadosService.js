var app = angular.module("resergolApp");

app.service("UsuariosBloqueadosService", function($http, $resource){


    var BLOQUEADOS_URI = "http://localhost:8080/resergol1.1/api/administradores/bloqueados/:usuario";
    
    return $resource(BLOQUEADOS_URI, { usuario: '@_Usuario'}, {
         query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                },
        update: {method: 'PUT',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});