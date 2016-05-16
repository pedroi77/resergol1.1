var app = angular.module("resergolApp");

app.service("CanchasService", function($http, $resource){

    var CANCHAS_URI = "http://localhost:8080/resergol1.1/api/canchas/:idDuenio";
    
    
    return $resource(CANCHAS_URI, {idDuenio: '@_idduenio'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 