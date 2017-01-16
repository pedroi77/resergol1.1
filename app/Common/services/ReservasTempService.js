var app = angular.module("resergolApp");

app.service("ReservasTempService", function($http, $resource){

    var RESERVASTEMP_URI="http://localhost:8080/resergol1.1/api/clientes/reservasTemp/:idCancha/:idComplejo";
    
    return $resource(RESERVASTEMP_URI, {idCancha: '@_idCancha', idComplejo: '@_idComplejo'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 