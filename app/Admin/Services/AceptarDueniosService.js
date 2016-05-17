var app = angular.module("resergolApp");

app.service("AceptarDueniosService", function($http, $resource){

    //var ADMINISTRAR_DUENIO_URI = "http://localhost:8080/resergol1.1/api/administrarDuenio/:IdDuenio/:acepta";
    //var ADMINISTRAR_DUENIO_URI = http://localhost:8080/resergol1.1/api/administrarDuenio/11/0
    var ADMINISTRAR_DUENIO_URI = "http://localhost:8080/resergol1.1/api/administrarDuenio";
    
    return $resource(ADMINISTRAR_DUENIO_URI, { IdDuenio: '@_IdDuenio', acepta: '@_acepta'}, {
        update: {method: 'PUT',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
});