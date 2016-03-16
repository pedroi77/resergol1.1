var app = angular.module("resergolApp");

app.service("ClientesService", function($http){
    


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
       
        
        var promise = $http.post('https://resergol-pedro77.c9.io/api/modelos/clientes.php?action=create', data);
        return promise.then(function(response){
            return response;
        });
	    
	    /*var promise = $http.get('https://resergol-pedro77.c9.io/api/clientes.php?action=create');
		
		return promise.then(function(response){
			return response.data.data.TiposDoc;
		})
		*/
	};
	
	
    
});