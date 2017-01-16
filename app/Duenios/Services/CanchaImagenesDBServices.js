var app = angular.module("resergolApp");

app.service("CanchaImagenesDBServices", function($http, $resource){
  
    var CANCHASIMG_URI = "http://localhost:8080/resergol1.1/api/duenios/canchas/imagen/:idComplejo/:idCancha/:url";
    
    return $resource(CANCHASIMG_URI, {idComplejo: '@idComplejo', idCancha: '@idCancha', url:'@url'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
        ,
    });
});