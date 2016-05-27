var app = angular.module("resergolApp");

app.service("DiasService", function($http, $resource){

    var DIAS_URI = "http://localhost:8080/resergol1.1/api/dias"; 
    
    
    return $resource(DIAS_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
	
});