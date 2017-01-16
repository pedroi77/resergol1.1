var app = angular.module("resergolApp");

app.service("ReservasService", function($http, $resource){

    var RESERVAS_URI = "http://localhost:8080/resergol1.1/api/clientes/reservas/:idCancha/:idComplejo/:fecha/:idComplejoo/:idCanchaa/:fechaHorarios/:bReservas/:idCliente/:todos/:pagosCompletos/:seniadas/:fijas";
    
    return $resource(RESERVAS_URI, {idCancha: '@_idCancha', idComplejo: '@_idComplejo', fecha: '@_fecha', idCanchaa: '@_idCanchaa', idComplejoo: '@_idComplejoo', fechaHorarios:'@_fechaHorarios', bReservas:'@_bReservas', idCliente:'@_idCliente', todos:'@_todos', pagosCompletos:'@_pagosCompletos', seniadas:'@_seniadas', fijas:'@_fijas'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 