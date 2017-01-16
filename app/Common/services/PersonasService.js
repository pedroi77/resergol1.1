var app = angular.module("resergolApp");

app.service("PersonasService", function($http, $resource){

 
var PERSON_URI = "http://localhost:8080/resergol1.1/api/datosPersona";  
      
return $resource(PERSON_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {                                                                                                    
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
   	
    
});