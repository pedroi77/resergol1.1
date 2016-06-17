var app = angular.module("resergolApp");

app.service("AdministrarComplejoService", function($http, $resource){

    
    ADMIN_COMPLEJO_URI = "http://localhost:8080/resergol1.1/api/duenios/administrarComplejo";

    return $resource(ADMIN_COMPLEJO_URI, { }, {

    });
});