var app = angular.module("resergolApp");

app.service("ReservasFijasService", function($http, $resource){

	//var USUARIO_URI = "http://localhost/resergol1.1/api/usuario/:user";
    var RESERVASFIJAS_URI = "http://localhost:8080/resergol1.1/api/clientes/reservasFijas/:pIdCancha/:pIdComplejo/:pHoraDesde/:pIdDia/:pAnio/:pFechaPrimerReserva";
    
    
    return $resource(RESERVASFIJAS_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 