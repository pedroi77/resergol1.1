var app = angular.module("resergolApp");

app.service("CanchaImagenesAltaServices", function($http, $resource){

    var CANCHAIMG_URI = "http://localhost:8080/resergol1.1/api/duenios/canchas/imagen";
    
    return $resource(CANCHAIMG_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});