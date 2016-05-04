var app = angular.module("resergolApp");

app.service("DueniosService", function($http, $resource){

    var DUENIOS_URI = "http://localhost/resergol1.1/api/duenios/:user/:pass";  //<PI>En mi casa es asi... 
    //var DUENIOS_URI = "http://localhost:8080/resergol1.1/api/duenios/:user/:pass";  //<PI>En mi casa es asi... 
    
    return $resource(DUENIOS_URI, { user: '@_user', pass: '@_pass' }, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
    
	
});