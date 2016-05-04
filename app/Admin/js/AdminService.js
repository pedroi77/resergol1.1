var app = angular.module("resergolApp");

app.service("AdminService", function($http, $resource){

    //var ADMIN_URI = "http://localhost/resergol1.1/api/admin/:user/:pass";  //<PI>En mi casa es asi... 
    var ADMIN_URI = "http://localhost:8080/resergol1.1/api/admin/:user/:pass";  //<PI>En mi casa es asi... 
    
    return $resource(ADMIN_URI, { user: '@_user', pass: '@_pass' }, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
    
	
});