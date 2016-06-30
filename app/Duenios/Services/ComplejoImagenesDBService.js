var app = angular.module("resergolApp");

app.service("ComplejoImagenesDBService", function($http, $resource){
  
    var COMPLEJOSIMG_URI = "http://localhost:8080/resergol1.1/api/duenios/complejos/imagen/:idComplejo/:url";
    
    return $resource(COMPLEJOSIMG_URI, {idComplejo: '@idComplejo', url:'@url'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
        ,
    });
});