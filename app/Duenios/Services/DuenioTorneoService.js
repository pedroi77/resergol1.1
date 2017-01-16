var app = angular.module("resergolApp");

app.service("DuenioTorneoService", function($http, $resource){

    
    TORNEOS_URI = "http://localhost:8080/resergol1.1/api/duenios/torneos/:idDuenio/:todos/:activos/:inscriptos/:finalizados/:idTorneo";
    
    return $resource(TORNEOS_URI, {idDuenio: '@_idDuenio', todos: '@_todos', activos: '@_activos', inscriptos: '@_inscriptos', finalizados: '@_finalizados',idTorneo: '@_idTorneo'}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                },
             update: {method: 'PUT',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
        /*save:{  method: 'save',
                params: {},
                isArray: false}*/
    });
    
    //localStorage.getItem('token')
	//,headers:  { 'auth-token': 'pepe' }  
});