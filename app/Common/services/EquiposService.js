
var app = angular.module("resergolApp");

app.service("EquiposService", function($http, $resource){
    var EQ_URI = "http://localhost:8080/resergol1.1/api/equiposCliente";
    
    return $resource(EQ_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
}); 