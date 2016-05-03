
var app = angular.module("resergolApp");

app.service("ClientesService", function($http, $resource){ 


var CLIENTES_URI = "http://localhost/resergol1.1/api/clientes/:user&:pass";  
//var CLIENTES_URI = "http://localhost/resergol1.1/api/clientes";
//var CLIENTES_URI = "http://localhost:8080/resergol1.1/api/clientes/:user&:pass";  

     
return $resource(CLIENTES_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {                                                                                                                             //console.log(angular.fromJson(data).token);
                        return angular.fromJson(data).data;
                        //return angular.fromJson(data).token;
                    },
                isArray: true
                }

        
    });
    


    
});