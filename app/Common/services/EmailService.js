var app = angular.module("resergolApp");

app.service("EmailService", function($http, $resource){

    var EMAIL_URI = "http://localhost:8080/resergol1.1/api/email/:email";  //<PI>En mi casa es asi...
    
    
    return $resource(EMAIL_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 