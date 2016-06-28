var app = angular.module("resergolApp");

app.service("EmailComplejoService", function($http, $resource){

    var EMAIL_COMPLEJO_URI = "http://localhost:8080/resergol1.1/api/duenios/emailComplejo/:email/:idComplejo";  //<PI>En mi casa es asi...
    
    
    return $resource(EMAIL_COMPLEJO_URI, {email: '@_email', idDuenio: '@_idDuenio'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 