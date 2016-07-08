var app = angular.module("resergolApp");

app.service("EmailDuenioService", function($http, $resource){

    var EMAIL_DUENIO_URI = "http://localhost:8080/resergol1.1/api/duenios/emailDuenio/:email/:idPersona";  //<PI>En mi casa es asi...
    
    
    return $resource(EMAIL_DUENIO_URI, {email: '@_email', idDuenio: '@_idPersona'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
}); 