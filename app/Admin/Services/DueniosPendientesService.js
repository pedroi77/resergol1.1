var app = angular.module("resergolApp");

app.service("DueniosPendientesService", function($http, $resource){

    var DUENIOS_PENDIENTES_URI = "http://localhost:8080/resergol1.1/api/dueniosPendientes";
    
    
    return $resource(DUENIOS_PENDIENTES_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
});