var app = angular.module("resergolApp");

app.service("EnviarMailService", function($http, $resource){

    var ENVIAR_MAIL_URI = "http://localhost:8080/resergol1.1/api/enviarMail";
    
    
    return $resource(ENVIAR_MAIL_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
});