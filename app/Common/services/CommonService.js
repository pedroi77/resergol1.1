var app = angular.module("resergolApp");

app.service("CommonService", function($http, $resource){

	//var TIPOSDOCS_URI = "http://localhost/resergol1.1/api/tiposDocs";
    var TIPOSDOCS_URI = "http://localhost:8080/resergol1.1/api/tiposDocs";  //<PI>En mi casa es asi... 
    
    
    return $resource(TIPOSDOCS_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
	

    
    
    
    
    
    /*
    var res =   $resource(TIPOSDOCS_URI, {}, {
                query: {method: 'GET',
                        transformResponse: function(data) {
                                return angular.fromJson(data).data;
                            },
                        isArray: true
                }
    });
    
    this.getTiposDoc = function(){    
        
        var salida = [];
        
        res.query().$promise.then(function(data) {
            salida =  data;
        });
        console.log(salida);
        return salida;
    };
    */
    
        
 
	/*this.getTiposDoc = function(){
		return $http.get(TIPOSDOCS_URI)
			.then(function(response){
				return response.data.data;
			});
	};*/
    
	
});