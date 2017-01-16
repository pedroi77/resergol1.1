var app = angular.module("resergolApp");

app.service("TorneoCopaFixtureService", function($http, $resource){

    var TORNEO_FIX = "http://localhost:8080/resergol1.1/api/common/torneo/copa/fixture";
    
    return $resource(TORNEO_FIX, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                },
        update: {method: 'PUT',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
}); 