var app = angular.module("resergolApp");

app.service("ComplejoService", function($http, $resource){
    var COMP_URI = "http://localhost:8080/resergol1.1/api/complejo/:idComplejo";
    
    return $resource(COMP_URI, {idComplejo: '@_idComplejo'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    