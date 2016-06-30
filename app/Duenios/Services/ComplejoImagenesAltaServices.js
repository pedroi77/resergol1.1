var app = angular.module("resergolApp");

app.service("ComplejoImagenesAltaServices", function($http, $resource){

    var COMPLEJOIMG_URI = "http://localhost:8080/resergol1.1/api/duenios/complejos/imagen";
    
    return $resource(COMPLEJOIMG_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});