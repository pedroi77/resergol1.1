var app = angular.module("resergolApp");

app.service("CanchasService", function($http, $resource){

    var CANCHAS_URI = "http://localhost:8080/resergol1.1/api/canchas/:idDuenio/:idCancha/:pIdProv/:pIdLoc/:pCantJug/:pIdSuperficie/:pPrecioMax/:pTechada/:pConLuz/:pConEstac/:pConDuchas/:pConBuffet/:pConParrilla/:pConWifi";
    
    
    return $resource(CANCHAS_URI, {idDuenio: '@_idDuenio', idCancha: '@_idCancha', idpIdProv: '@_pIdProv', pIdLoc: '@_pIdLoc', pCantJug: '@_pCantJug', pIdSuperficie: '@_pIdSuperficie', pPrecioMax: '@_pPrecioMax', pTechada: '@_pTechada', pConLuz: '@_pConLuz', pConEstac: '@_pConEstac', pConDuchas: '@_pConDuchas', pConBuffet: '@_pConBuffet', pConParrilla: '@_pConParrilla', pConWifi: '@_pConWifi' }, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 