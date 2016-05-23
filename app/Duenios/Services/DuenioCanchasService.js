var app = angular.module("resergolApp");

app.service("DuenioCanchasService", function($http, $resource){

    var CANCHAS_URI = "http://localhost:8080/resergol1.1/api/duenio/canchas/:idDuenio";
    
    
    return $resource(CANCHAS_URI, {idDuenio: '@_idDuenio' }, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 