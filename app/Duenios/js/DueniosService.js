var app = angular.module("resergolApp");

app.service("DueniosService", function($http, $resource){

    
    DUENIOS_URI = "http://localhost:8080/resergol1.1/api/duenios/:user/:pass";
    
    return $resource(DUENIOS_URI, { user: '@_user', pass: '@_pass' }, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
    
	
});