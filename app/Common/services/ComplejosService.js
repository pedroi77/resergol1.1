var app = angular.module("resergolApp");

app.service("ComplejosService", function($http, $resource){


    var COMP_URI = "http://localhost:8080/resergol1.1/api/complejos/:pNombreComplejo/:pIdProv/:pIdLoc/:pCantJug/:pIdSuperficie/:pPrecioMax/:pTechada/:pConLuz/:pConEstac/:pConDuchas/:pConBuffet/:pConParrilla/:pConWifi/:pFecha/:pHora/:pDiaSemana";
    
    return $resource(COMP_URI, {pNombreComplejo: '@_pNombreComplejo', pIdProv: '@_pIdProv', pIdLoc: '@_ipIdLoc', pCantJug: '@_CantJug', pIdSuperficie: '@_pIdSuperficie', pPrecioMax:'@_pPrecioMax', pTechada: '@_pTechada', pConLuz:'@_pConLuz', pConEstac: '@_pConEstac', pConDuchas: '@_pConDuchas', pConBuffet: '@_pConBuffet', pConParrilla: '@_pConParrilla', pConWifi: '@_pConWifi', pFecha:'@_pFecha', pHora:'@_pHora', pDiaSemana:'@_pDiaSemana'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
});