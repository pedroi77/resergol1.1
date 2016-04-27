
var app = angular.module("resergolApp");

app.service("ClientesService", function($http, $resource){

//var CLIENTES_URI = "http://localhost:8080/resergol1.1/api/clientes";  //<PI>En mi casa es asi... 
var CLIENTES_URI = "http://localhost/resergol1.1/api/clientes/:user&:pass";  

    
return $resource(CLIENTES_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
    
/*
this.createCliente = function(usuario, contrasenia, nombre,apellido,tipoDoc,nroDoc,eMail){
     data = 
    {
        'usuario' : usuario,    
        'contrasenia': contrasenia,
        'nombre': nombre,
        'apellido': apellido,
        'tipoDoc': tipoDoc,
        'nroDoc': nroDoc,
        'eMail' :eMail
    };


    /*var promise = $http.post('https://resergol-pedro77.c9.io/api/modelos/clientes.php?action=create', data);
    return promise.then(function(response){
        return response;
    });*/

    /*var promise = $http.get('https://resergol-pedro77.c9.io/api/clientes.php?action=create');

    return promise.then(function(response){
        return response.data.data.TiposDoc;
    })
    
};
	*/
	
    
});