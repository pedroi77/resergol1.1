var app = angular.module("resergolApp");

app.service("DevolucionesServices", function($http, $resource){

    http://localhost:8080/resergol1.1/api/duenios/devoluciones/1/20160101/20161001/0
  
    DEVOLUCIONES_URI = "http://localhost:8080/resergol1.1/api/duenios/devoluciones/:idComplejo/:desde/:hasta/:tipo";
    
    return $resource(DEVOLUCIONES_URI, {idComplejo: '@_idComplejo', desde: '@_desde' ,hasta: '@_hasta' , tipo: '@_tipo'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
        
    });
});
