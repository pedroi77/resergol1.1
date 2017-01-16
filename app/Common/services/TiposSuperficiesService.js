var app = angular.module("resergolApp");

app.service("TiposSuperficiesService", function($http, $resource){

    var SUPERFICIES_URI = "http://localhost:8080/resergol1.1/api/tiposSuperficies"; 
    
    
    return $resource(SUPERFICIES_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
	
}); 