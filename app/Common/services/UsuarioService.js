var app = angular.module("resergolApp");

app.service("UsuarioService", function($http, $resource){

	//var USUARIO_URI = "http://localhost/resergol1.1/api/usuario/:user";
    var USUARIO_URI = "http://localhost:8080/resergol1.1/api/usuario/:user";  //<PI>En mi casa es asi... 
    
    
    return $resource(USUARIO_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
	
}); 